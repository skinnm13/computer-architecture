#include <stdio.h>
#include <time.h>
#include <stdint.h>

#define N 50
#define ITERS 2000000   // increase if your timings are too small

// Prevent compiler from optimizing away results
volatile int sink = 0;

static inline uint64_t now_ns(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (uint64_t)ts.tv_sec * 1000000000ull + (uint64_t)ts.tv_nsec;
}

/* Baseline version */
int sum_array_base(const int a[N]) {
    int sum = 0;
    for (int i = 0; i < N; i++) {
        sum += a[i];
    }
    return sum;
}

/* Unroll by 2 */
int sum_array_u2(const int a[N]) {
    int sum = 0;
    int i = 0;
    for (; i + 1 < N; i += 2) {
        sum += a[i];
        sum += a[i + 1];
    }
    for (; i < N; i++) {   // cleanup (not needed for N=50, but good practice)
        sum += a[i];
    }
    return sum;
}

/* Unroll by 5 (nice because 50 divisible by 5) */
int sum_array_u5(const int a[N]) {
    int sum = 0;
    for (int i = 0; i < N; i += 5) {
        sum += a[i];
        sum += a[i + 1];
        sum += a[i + 2];
        sum += a[i + 3];
        sum += a[i + 4];
    }
    return sum;
}

/* Unroll by 10 (50 divisible by 10) */
int sum_array_u10(const int a[N]) {
    int sum = 0;
    for (int i = 0; i < N; i += 10) {
        sum += a[i];
        sum += a[i + 1];
        sum += a[i + 2];
        sum += a[i + 3];
        sum += a[i + 4];
        sum += a[i + 5];
        sum += a[i + 6];
        sum += a[i + 7];
        sum += a[i + 8];
        sum += a[i + 9];
    }
    return sum;
}

/* Time a function pointer */
typedef int (*sum_fn)(const int a[N]);

double time_function_ns_per_call(sum_fn f, const int a[N]) {
    // Warm up
    for (int i = 0; i < 1000; i++) sink ^= f(a);

    uint64_t t0 = now_ns();
    for (int i = 0; i < ITERS; i++) {
        sink ^= f(a);
    }
    uint64_t t1 = now_ns();

    uint64_t total_ns = (t1 - t0);
    return (double)total_ns / (double)ITERS;
}

int main(void) {
    int a[N];

    // Fill array with deterministic values (so your results are reproducible)
    for (int i = 0; i < N; i++) {
        a[i] = (i % 7) + 1; // 1..7 repeating
    }

    // Sanity check: all sums must match
    int s0 = sum_array_base(a);
    int s2 = sum_array_u2(a);
    int s5 = sum_array_u5(a);
    int s10 = sum_array_u10(a);

    if (s0 != s2 || s0 != s5 || s0 != s10) {
        printf("ERROR: sums do not match! base=%d u2=%d u5=%d u10=%d\n", s0, s2, s5, s10);
        return 1;
    }

    // Measure times
    double base_ns = time_function_ns_per_call(sum_array_base, a);
    double u2_ns   = time_function_ns_per_call(sum_array_u2, a);
    double u5_ns   = time_function_ns_per_call(sum_array_u5, a);
    double u10_ns  = time_function_ns_per_call(sum_array_u10, a);

    // Print results (CSV format for easy graphing)
    // Columns: version, ns_per_call, speedup_vs_base
    printf("version,ns_per_call,speedup_vs_base\n");
    printf("base,%.3f,%.3f\n", base_ns, 1.0);
    printf("unroll2,%.3f,%.3f\n", u2_ns, base_ns / u2_ns);
    printf("unroll5,%.3f,%.3f\n", u5_ns, base_ns / u5_ns);
    printf("unroll10,%.3f,%.3f\n", u10_ns, base_ns / u10_ns);

    return 0;
}
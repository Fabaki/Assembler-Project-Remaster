#include <stdio.h>
#include <stdbool.h>
#include <time.h>
#include "logging.h"

static bool debug = true;

void log_debug(char *msg) {
    if (debug) {
        struct tm *now;
        time_t timenow = time(NULL);
        now = localtime(&timenow);
        printf("[%d:%d:%d] Debug: %s\n", now->tm_hour, now->tm_min, now->tm_sec, msg);
    }
}

void log_error(char *msg) {
    struct tm *now;
    time_t timenow = time(NULL);
    now = localtime(&timenow);

    fprintf(stderr, "[%d:%d:%d] Error: %s\n", now->tm_hour, now->tm_min, now->tm_sec, msg);
}

void log_info(char *msg) {
    struct tm *now;
    time_t timenow = time(NULL);
    now = localtime(&timenow);

    printf("[%d:%d:%d] Info: %s\n", now->tm_hour, now->tm_min, now->tm_sec, msg);
}
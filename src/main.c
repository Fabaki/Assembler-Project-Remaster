#include <stdio.h>
#include <stdlib.h>
#include "logging.h"

int main(int argc, char **argv) {
    char **argp;
    FILE *file;
    char msg[BUFSIZ];

    log_info("started the assembler");

    for (argp = argv + 1; argc - 1; ++argp, --argc) {
        sprintf(msg, "assembling file %s...", *argp);
        log_info(msg);
        file = fopen(*argp, "r");
        if (NULL == file) {
            sprintf(msg, "Error in opening file %s", *argp);
            log_error(msg);
            goto out;
        }

        

        sprintf(msg, "finished assembling file %s...", *argp);
        log_info(msg);
out:
        fclose(file);
    }

    return 0;
}
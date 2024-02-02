#include <stdio.h>
#include <unistd.h>
#include <sys/sysinfo.h>
#include <time.h>
#include <stdlib.h>
#include <inttypes.h>
#include <limits.h>


int main(int argc, char** argv)
{
    if (argc < 2) {
        fprintf(stderr, ""
            "\n  Usage: meminfo <TIMEOUT> [BAR LEN]"
            "\n         TIMEOUT: Time in seconds for wait next output."
            "\n                  0 - output and exit."
            "\n         BAR LEN: Indicate bar size in symbols numbers. Default 16"
            "\n"
        );
        return 1;
    }

    int sec = atoi(argv[1]);
    int barSize = 16;

    if (argc == 3) {
        barSize = atoi(argv[2]);
    }

    if (sec < 0) {
        fprintf(stderr, "TIMEOUT need more 0\n");
        return 1;
    }

    const int MAX_BAR_SIZE = 200;
    char loadBar[MAX_BAR_SIZE + 1];

    if (barSize < 2 || barSize > MAX_BAR_SIZE) {
        fprintf(stderr, "BAR LEN need >=2 and <=%d\n", MAX_BAR_SIZE);
        return 1;
    }

    loadBar[barSize] = '\0';

    struct sysinfo memInfo;

    long long totalMemory, freeMemory, usedMemory;
    double memoryPercentage;


    for (;;) {

        sysinfo(&memInfo);

        totalMemory = memInfo.totalram * memInfo.mem_unit;
        freeMemory = memInfo.freeram * memInfo.mem_unit;

        usedMemory = totalMemory - freeMemory;
        memoryPercentage = (double)usedMemory / (double)totalMemory * 100.0;

        int i;
        for (i = 0; i < (int)(memoryPercentage * (barSize / 100.)); ++i) {
            loadBar[i] = '#';
        }
        for (; i < barSize; ++i) {
            loadBar[i] = '.';
        }

        if (sec == 0) {
            break;
        }

        printf("\r%2.2fG [%s] (%2.2f%%)", (double)usedMemory / (1 << 30), loadBar, memoryPercentage);
        fflush(stdout);
        sleep(sec);
    }

    printf("%2.2fG [%s] (%2.2f%%)\n", (double)usedMemory / (1 << 30), loadBar, memoryPercentage);
    return 0;
}


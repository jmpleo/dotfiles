#include <stdio.h>
#include <unistd.h>
#include <sys/sysinfo.h>

int main() {
    struct sysinfo memInfo;
    sysinfo(&memInfo);

    long long totalMemory = memInfo.totalram;
    totalMemory *= memInfo.mem_unit;

    long long freeMemory = memInfo.freeram;
    freeMemory *= memInfo.mem_unit;

    long long usedMemory = totalMemory - freeMemory;

    double memoryPercentage = (double)usedMemory / (double)totalMemory * 100.0;

    // printf("%2.2fG (%2.2f%%) / %lldG\n", usedMemory / 1024. / 1024. / 1024., memoryPercentage, totalMemory >> 30);
    printf("%2.2fG (%2.2f%%)\n", usedMemory / 1024. / 1024. / 1024., memoryPercentage);
    // printf("\033[1;37m%.2fG (\033[0m%.2f%%\033[1;37m) / %lldG\n\033[0m",
    //         usedMemory / 1024. / 1024. / 1024., memoryPercentage, totalMemory >> 30);

    return 0;
}


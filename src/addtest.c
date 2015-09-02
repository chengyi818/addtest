#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    int index;
    for(index=0; index<10; index++)
    {
        FILE *fp=fopen("/tmp/addtest","at");
        system("date >> /tmp/addtest");
        fprintf(fp, "%s\n", argv[2]);
        fclose(fp);
        printf("interval=%d\n",atoi(argv[1]));
        sleep(  atoi(argv[1]) );
    }
    return 0;
}

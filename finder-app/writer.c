#include <stdio.h>
#include <syslog.h>

int main(int argc, char * argv[] ) 
{
    // Open the LOG
    openlog(NULL, 0, LOG_USER);

    // Check the number of arguments
    if (argc < 2)
    {
        syslog(LOG_ERR, "Invalid number of arguments: %d", argc);
        return 1;
    }

    char* filename = argv[1];

    // Open file in write mode
    FILE *fptr = fopen(filename, "w");

    // LOG error if file could not be open
    if (fptr == NULL)
    {
        syslog(LOG_ERR, "File %s could not be opened.", filename);
        return 1;
    }

    // Write to the file
    char* str = argv[2];
    syslog(LOG_DEBUG, "Writing %s to %s", str, filename);
    if (fputs(str, fptr) < 0)
    {
        syslog(LOG_ERR, "Could not write to %s.", filename);
        return 1;
    } 

    // Close the file and return 
    fclose(fptr);

    return 0;
}
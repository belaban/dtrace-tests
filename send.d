

syscall::sendto:entry 
/ pid == $1/
{
    printf("%s: %d bytes\n", execname, arg2);
    print(*args);
}

struct callinfo {
	uint64_t ts;      /* timestamp of last syscall entry */
	uint64_t elapsed; /* total elapsed time in nanoseconds */
	uint64_t calls;   /* number of calls made */
	size_t maxbytes;  /* maximum byte count argument */
};

struct callinfo times[string];

syscall::read:entry,
syscall::write:entry {
    times[probefunc].ts=timestamp;
    times[probefunc].maxbytes=arg2 > times[probefunc].maxbytes? arg2 : times[probefunc].maxbytes;
}


syscall::read:return,
syscall::write:return {
    self->time=timestamp - times[probefunc].ts;
    times[probefunc].elapsed+=self->time;
    times[probefunc].calls++;


}

END {

    printf("\nread: %d calls, max_bytes=%d, total_time=%d\n",
           times["read"].calls,
           times["read"].maxbytes, times["read"].elapsed);
    printf("\nwrite: %d calls, max_bytes=%d, total_time=%d\n",
           times["write"].calls,
           times["write"].maxbytes, times["write"].elapsed);

}

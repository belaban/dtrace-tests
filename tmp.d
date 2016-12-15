#pragma D option flowindent

syscall::ioctl:entry
/execname == "xclock" && guard++ == 0/
{
	self->traceme = 1;
	printf("fd: %d", arg0);
}

fbt:::
/self->traceme/
{}

syscall::ioctl:return
/self->traceme/
{
	self->traceme = 0;
	exit(0);
}

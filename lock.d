

lockstat::lck_mtx_lock:
/ pid == $1 /
{
     self->ts=timestamp;
}


lockstat::lck_mtx_unlock:
/ pid == $1 /
{
     @time[execname]=quantize(timestamp - self->ts);
     self->ts=0;
}






#pragma D option quiet

hotspot*:::object-alloc {


    self->class=stringof(copyin(arg1,arg2));
    @counts[self->class]=count();
}

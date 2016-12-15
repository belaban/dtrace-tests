

#pragma D option quiet

BEGIN {
   start=timestamp;
}



syscall:::entry
{
   @counts[execname]=count();
}


tick-10sec {
   printf("clearing...\n");
   trunc(@counts, 10);
   last=timestamp;
}



END {
  this->seconds = (timestamp - start) / 1000000000;
  printf("ran for %d seconds\n", this->seconds);

  printf("per second rates:\n");
  normalize(@counts, this->seconds);
  printa(@counts);

  printf("raw data:\n");
  denormalize(@counts);
  printa(@counts);
}



syscall::read:entry {
    printf("%s exec=%s\n",
           execname, curpsinfo->pr_fname);


}


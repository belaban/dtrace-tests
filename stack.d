

/*
profile-99 
/execname == "java"/
{ 
   @[jstack(10,500)] = count(); 
} 



   trunc(@, 5); 
   printa(@);
   trunc(@); 
}
*/


tick-1s 
/ pid == $1 /
{
  jstack(50,500);
}


/*
syscall::write:entry
/ pid == $1 /
{
   jstack(10, 500);
}
*/

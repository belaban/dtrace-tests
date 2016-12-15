

/*
hotspot*:::method-entry {
   @calls[stringof(copyin(arg1,arg2)), stringof(copyin(arg3,arg4))]=count();
}
*/




hotspot$1:::method-entry {
   self->cl = (char*) copyin(arg1, arg2+2);
   self->cl[arg2] = '\0';

   self->method=(char*) copyin(arg3, arg4+1);
   self->method[arg4]='\0';


   self->ts=timestamp;
   @calls[(string)self->cl, (string)self->method]=count();
}


/*
hotspot$1:::method-return 
/ self->ts /
{
   self->cl = (char*) copyin(arg1, arg2+2);
   self->cl[arg2] = '.';
   self->cl[arg2+1] = '\0';

   self->method=(char*) copyin(arg3, arg4+1);
   self->method[arg4]='\0';
   self->name=strjoin(self->cl, self->method);

}

*/






END {
   printa("%60s.%-25s %@20d\n", @calls);
}

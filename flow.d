
#pragma D option quiet

hotspot*:::method-entry {
    self->indent++;

    self->cl = (char*) copyin(arg1, arg2+2);
    self->cl[arg2] = '\0';
    self->method=(char*) copyin(arg3, arg4+1);
    self->method[arg4]='\0';

    printf("%*s %s %s.%s\n", self->indent, "", "->", (string)self->cl, (string)self->method);


}

hotspot*:::method-return {
    self->cl = (char*) copyin(arg1, arg2+2);
    self->cl[arg2] = '\0';
    self->method=(char*) copyin(arg3, arg4+1);
    self->method[arg4]='\0';    
    printf("%*s %s %s.%s\n", self->indent, "", "<-", (string)self->cl, (string)self->method);

    self->indent--;
}


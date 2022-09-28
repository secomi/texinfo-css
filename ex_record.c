#include <stdio.h>
#include <math.h>               /* NAN, isnan, nan */

typedef struct record_s {
    char *name;
    double data[20];
} record_s;

static void
print_record (record_s *r)
{
  printf ("The name is: %s\n  ", r->name);
  for (size_t i=0; !isnan (r->data[i]); i++) printf ("%g  ", r->data[i]);
  printf ("\n");
}

int
main (int argc, char *argv[])
{

  record_s r1 = (record_s){.name="Paul", .data={1, 2, 3, NAN}};
  record_s r2 = (record_s){.name="John", .data={4.1, 5, 6, 7.2, NAN}};

  print_record (&r1);    /* ❶ comment 1 */
  print_record (&r2);

  return 0;
}

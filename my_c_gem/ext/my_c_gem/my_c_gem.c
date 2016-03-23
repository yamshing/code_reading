#include <ruby.h>

void
Init_my_c_gem(void) {
	 
	rb_define_class("MyCGem",rb_cObject);
	 
}

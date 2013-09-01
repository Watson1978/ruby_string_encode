#import <Foundation/Foundation.h>
#include "ruby/ruby.h"
#include "ruby/encoding.h"

static VALUE
conv_to_nfd(VALUE self, VALUE obj)
{
	StringValue(obj);
	NSString *str_nfc = [[[NSString alloc] initWithBytes:RSTRING_PTR(obj) length:RSTRING_LEN(obj) encoding:NSUTF8StringEncoding] autorelease];
	NSString *str_nfd = [str_nfc decomposedStringWithCanonicalMapping];
	if (str_nfd == nil) {
		return obj;
	}

	const char *ptr = [str_nfd UTF8String];
	const long len = strlen(ptr);
    VALUE rstr = rb_enc_str_new(ptr, len, rb_utf8_encoding());
	return rstr;
}

void
Init_conv(void)
{
	VALUE cConv = rb_define_class("Conv", rb_cObject);
    rb_define_singleton_method(cConv, "to_nfd", conv_to_nfd, 1);
}
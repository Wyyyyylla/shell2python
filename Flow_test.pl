#!/usr/bin/perl -w

# Matthew Moss
# mdm@cse.unsw.edu.au
# cs2041, 12s2

use strict;

use Flow;
use Test::More 'no_plan';

is (Flow::can_handle ("if some condition lol"), 1);
is (Flow::can_handle ("elif some condition lol"), 1);
is (Flow::can_handle ("pwd"), 0);
is (Flow::can_handle ("for a in one two three"), 1);
is (Flow::can_handle ("while true"), 1);

is (Flow::get_indent_delta ("then"), 4);
is (Flow::get_indent_delta ("do"), 4);
is (Flow::get_indent_delta ("done"), -4);
is (Flow::get_indent_delta ("fi"), -4);
is (Flow::get_indent_delta ("words"), 0);
is (Flow::get_indent_delta ("elif"), -4);

is (Flow::handle ("do"), "");
is (Flow::handle ("then"), "");
is (Flow::handle ("fi"), "");
is (Flow::handle ("done"), "");
is (Flow::handle ("do pwd"), "subprocess.call(['pwd'])");
is (Flow::handle ("for x in one two three"), "for x in 'one', 'two', 'three':");
is (Flow::handle ("for word in Houston 1202 words"), "for word in 'Houston', 1202, 'words':");
is (Flow::handle ('for file in *.c'), 'for file in sorted(glob.glob("*.c")):');
is (Flow::handle ('while $var'), 'while var:');
is (Flow::handle ('while true'), "while not subprocess.call(['true']):");
is (Flow::handle ('while false'), "while not subprocess.call(['false']):");
is (Flow::handle ('while proc'), "while not subprocess.call(['proc']):");

#!/bin/bash

# Matthew Moss
# mdm@cse.unsw.edu.au
# cs2041, 12s2


pwd; ls; a=3
b=7; c=3; echo a b c

pwd && ls && echo success

`test 1 -eq 0` && echo you should never see this
`test 1 -eq 0` || echo but you might see this

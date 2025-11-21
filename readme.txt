cp setup

=== cp_setup.sh

cp_setup.sh can be aliased (alias cp_setup="path_to/cp_setup.sh")

Usage: make_problem.sh problem-name [num-tests]
Example: make_problem.sh problem-name 3
If num-tests is omitted, defaults to 0

=== run_tests.sh

run_tests.sh can be aliased (alias run_tests="path_to/run_tests.sh")

Usage: run-tests.sh problem-name

=== Makefile

make <=> compile last edited .cpp file
make problem-name DBG=1 <=> compile problem-name with -DLOCAL=1
make clean

For competitive programming, one might want to set the Makefile global.
This post on stackoverflow gives a solution.
https://stackoverflow.com/questions/69115581/is-there-a-way-to-define-global-makefile-implicit-rules

basically, put this in your .bashrc (or .bash_profile):
export MAKEFILES="path_to_your_makefile"

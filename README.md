### The Old One Remove
---
__Start at__ : 2016.01.05

__What for__ : to manage no using files

---
__How to use__

1. fork or clone this repository to your home(~) direcotry
   ```
   $ cd ~
   $ git clone https://github.com/oh4851/TOORM.git
   ```

2. make something to your home directory
   ```
   $ cd ~/TOORM
   $ mkdir .remove
   $ touch .manage_list.dat
   ```

3. regist script to PATH or move script to /usr/bin..
   ```
   // if you have root(super) permission..
   $ cp ~/TOORM/toorm /usr/bin (or /usr/local/bin, etc...)

   // don't have..
   $ export PATH=$PATH:[user home DIR]/TOORM/
   ```

4. autorun toorm.sh when shell is started
   ```
   TODO
   ```

5. explain about options

   `usage: toorm [-OPTION] [ARGUMENT]`

   | OPTION | What for |
   | ------------- | ----------- |
   |  | no option program (run file manage) |
   | -a [filename/path]| add [file] to manage list |
   | -r [filename/path] | remove [file] from manage list |
   | -l [new] | update LIMITDIFF value with [new] |
   | -s | show limit diff and manage list |
   | -h | show help page TODO: |

6. explain about config key

   | KEY | Description |
   | ------------- | ----------- |
   | LIMITDIFF | Set limit difference day |

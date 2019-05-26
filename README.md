### The Old One Remove
---
__Start at__ : 2016.01.05

__What for__ : to manage no using files

---
__How to use__

1. clone this repository
   ```
   $ cd [ANYWHERE]
   $ git clone https://github.com/oh4851/TOORM.git
   ```

2. make something to your TOORM home directory
   ```
   $ cd [TOORMHOME]
   $ mkdir .remove
   $ touch .manage_list.dat
   ```

3. copy config file to user's home directory
   ```
   $ cd [TOORMHOME]
   $ cp .toorm.cfg ~/
   ```

4. regist script to PATH or move script to /usr/bin..
   ```
   $ sudo chmod 755 [TOORMHOME]/toorm
   // if you have root(super) permission..
   $ cp [TOORMHOME]/toorm /usr/bin (or /usr/local/bin, etc...)

   // don't have..
   $ export PATH=$PATH:[TOORMHOME]/TOORM/
   ```

5. autorun toorm.sh when shell is started
   ```
   TODO: activate this project
   ```

6. explain about options

   `usage: toorm [-OPTION] [ARGUMENT]`

   | OPTION | What for |
   | ------------- | ----------- |
   |  | no option program (run file manage) |
   | -a [filename/path]| add [file] to manage list |
   | -r [filename/path] | remove [file] from manage list |
   | -c [attrkey] [new value] | change attribute value |
   | -s | show limit diff and manage list |
   | -h | show help page TODO: |

7. explain about config key

   | KEY | Description |
   | ------------- | ----------- |
   | LIMITDIFF | Set limit difference day |
   | TOORMHOME | Set TOORM's Home Directory |

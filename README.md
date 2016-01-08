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
   $ mkdir remove
   $ mkdir manage
   $ touch manage_list.dat
   ```

3. autorun getdate.sh when shell is started
   ```
   TODO
   ```

4. auto add to list when create or modify a file
   ```
   au BufWritePost * :silent! !~/TOORM/tooadd.sh <afile>
   au BufWritePost * :redraw!
   ```

5. explain about config key

   | KEY | Description |
   | ------------- | ----------- |
   | LIMITDIFF | Set limit difference day |

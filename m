From: bruno@clisp.org (Bruno Haible)
Date: Thu, 12 Apr 2018 00:10:53 +0200
Subject: kernel hangs after running program that uses a custom SIGSEGV handler
Message-ID: <3428122.ik0p8hGU2m@omega>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi,

$ uname 
Linux stage4.fedoraproject.org 4.16.0-rc2-00328-gebea62367bc4 #4 SMP Mon Feb 26 16:05:16 GMT 2018 riscv64 riscv64 riscv64 GNU/Linux

This kernel either hangs or prints "BUG" messages when running a program that
installs a SIGSEGV handler. That handler uses mprotect to change the access
permissions of memory pages. It is known to work fine on all other Linux
architectures that I tested.

How to reproduce:
1) Create a VM for execution in QEMU. Details:
http://git.savannah.gnu.org/gitweb/?p=libffcall.git;a=blob;f=porting-tools/emulation/qemu-riscv64.txt
2) Download https://haible.de/bruno/gnu/hangs.tar.xz
and unpack it in the VM, in /.
3) $ cd home/bruno/clisp-2.49.93-20180410/build-porting64-gcc-typecodes-spvw_mixed_blocks-trivialmap
   $ ./hangs_linux

Results:
* Either (seen twice) the machine hangs. After 'Ctrl-a x' in qemu and rebooting,
  you may see files of size 0, due to unsynced open files.
* Or normal output, followed by kernel messages such as
    BUG: Bad page map in process
  or
    BUG: Bad rss-counter state

Full output:
===============================================================================
  i i i i i i i       ooooo    o        ooooooo   ooooo   ooooo
  I I I I I I I      8     8   8           8     8     o  8    8
  I  \ `+' /  I      8         8           8     8        8    8
   \  `-+-'  /       8         8           8      ooooo   8oooo
    `-__|__-'        8         8           8           8  8
        |            8     o   8           8     o     8  8
  ------+------       ooooo    8oooooo  ooo8ooo   ooooo   8

Welcome to GNU CLISP 2.49.93+ (2018-02-18) <http://clisp.org/>

Copyright (c) Bruno Haible, Michael Stoll 1992-1993
Copyright (c) Bruno Haible, Marcus Daniels 1994-1997
Copyright (c) Bruno Haible, Pierpaolo Bernardi, Sam Steingold 1998
Copyright (c) Bruno Haible, Sam Steingold 1999-2000
Copyright (c) Sam Steingold, Bruno Haible 2001-2018

Type :h and hit Enter for context help.

;; Loading file ../src/defseq.lisp ...
;; Loaded file ../src/defseq.lisp
;; Loading file ../src/backquote.lisp ...
;; Loaded file ../src/backquote.lisp
;; Loading file ../src/defmacro.lisp ...
;; Loaded file ../src/defmacro.lisp
;; Loading file ../src/macros1.lisp ...
;; Loaded file ../src/macros1.lisp
;; Loading file ../src/macros2.lisp ...
;; Loaded file ../src/macros2.lisp
;; Loading file ../src/defs1.lisp ...
;; Loaded file ../src/defs1.lisp
;; Loading file ../src/lambdalist.lisp ...
;; Loaded file ../src/lambdalist.lisp
;; Loading file ../src/places.lisp ...Unable to handle kernel paging request at virtual address 000000000000c790
Oops [#1]
CPU: 0 PID: 23124 Comm: lisp.run Not tainted 4.16.0-rc2-00328-gebea62367bc4 #4
sepc: ffffffe0005eaec6 ra : ffffffe0005eaf54 sp : ffffffe079a25bd0
 gp : ffffffe0007d31e8 tp : ffffffe078f2a300 t0 : ffffffe000034b1a
 t1 : 0000000000000001 t2 : ffffffe0005f9ea0 s0 : ffffffe079a25be0
 s1 : 0000000000000000 a0 : 000000000000c788 a1 : 00000000005414b9
 a2 : 0000000000000000 a3 : ffffffe079a25be8 a4 : 00000000005414b9
 a5 : ffffffe000883f48 a6 : 000000000000c780 a7 : ffffffe078ea0680
 s2 : 0000000000000001 s3 : ffffffffffffffff s4 : 000000000000c788
 s5 : 00000000005414b9 s6 : 0000000000000001 s7 : 0000000000000001
 s8 : ffffffe0007d4280 s9 : ffffffffffffffff s10: 0000000000000000
 s11: ffffffffffffffef t3 : 0000000000000040 t4 : 8000000000000000
 t5 : 0000000000000013 t6 : 0000000000000040
sstatus: 0000000000000120 sbadaddr: 000000000000c790 scause: 000000000000000d
---[ end trace 67d406d69d2748af ]---
swap_info_get: Bad swap file entry 2000000000540e29
BUG: Bad page map in process lisp.run  pte:2a0714c0 pmd:3e459c01
addr:000000004164e4eb vm_flags:00100070 anon_vma:000000005e8138e7 mapping:          (null) index:800e2
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 0 PID: 23124 Comm: lisp.run Tainted: G      D          4.16.0-rc2-00328-gebea62367bc4 #4
Call Trace:
[<ffffffe0000341ee>] walk_stackframe+0x0/0xa2
[<ffffffe0000342ec>] show_stack+0x26/0x34
[<ffffffe0005e4904>] dump_stack+0x5e/0x7c
[<ffffffe0000c83f4>] print_bad_pte+0x12a/0x192
[<ffffffe0000c9624>] unmap_page_range+0x2ca/0x564
[<ffffffe0000c98e8>] unmap_single_vma+0x2a/0x3e
[<ffffffe0000c9a26>] unmap_vmas+0x26/0x46
[<ffffffe0000cf04c>] exit_mmap+0x60/0xf2
[<ffffffe00003567a>] mmput.part.7+0x14/0x84
[<ffffffe000035706>] mmput+0x1c/0x28
[<ffffffe0000398fc>] do_exit+0x184/0x724
[<ffffffe000033e9e>] die+0xd4/0xe4
[<ffffffe000034dc6>] do_page_fault+0x2ac/0x2b8
[<ffffffe000033242>] ret_from_syscall+0xa/0xe
swap_info_get: Bad swap file entry 2000000000541129
BUG: Bad page map in process lisp.run  pte:2a0894c0 pmd:3e459c01
addr:000000007f6246af vm_flags:00100070 anon_vma:000000005e8138e7 mapping:          (null) index:800ec
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 0 PID: 23124 Comm: lisp.run Tainted: G    B D          4.16.0-rc2-00328-gebea62367bc4 #4
Call Trace:
[<ffffffe0000341ee>] walk_stackframe+0x0/0xa2
[<ffffffe0000342ec>] show_stack+0x26/0x34
[<ffffffe0005e4904>] dump_stack+0x5e/0x7c
[<ffffffe0000c83f4>] print_bad_pte+0x12a/0x192
[<ffffffe0000c9624>] unmap_page_range+0x2ca/0x564
[<ffffffe0000c98e8>] unmap_single_vma+0x2a/0x3e
[<ffffffe0000c9a26>] unmap_vmas+0x26/0x46
[<ffffffe0000cf04c>] exit_mmap+0x60/0xf2
[<ffffffe00003567a>] mmput.part.7+0x14/0x84
[<ffffffe000035706>] mmput+0x1c/0x28
[<ffffffe0000398fc>] do_exit+0x184/0x724
[<ffffffe000033e9e>] die+0xd4/0xe4
[<ffffffe000034dc6>] do_page_fault+0x2ac/0x2b8
[<ffffffe000033242>] ret_from_syscall+0xa/0xe
swap_info_get: Bad swap file entry 20000000005414b9
BUG: Bad page map in process lisp.run  pte:2a0a5cc0 pmd:3e459c01
addr:000000007605611e vm_flags:00100073 anon_vma:000000005e8138e7 mapping:          (null) index:80101
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 0 PID: 23124 Comm: lisp.run Tainted: G    B D          4.16.0-rc2-00328-gebea62367bc4 #4
Call Trace:
[<ffffffe0000341ee>] walk_stackframe+0x0/0xa2
[<ffffffe0000342ec>] show_stack+0x26/0x34
[<ffffffe0005e4904>] dump_stack+0x5e/0x7c
[<ffffffe0000c83f4>] print_bad_pte+0x12a/0x192
[<ffffffe0000c9624>] unmap_page_range+0x2ca/0x564
[<ffffffe0000c98e8>] unmap_single_vma+0x2a/0x3e
[<ffffffe0000c9a26>] unmap_vmas+0x26/0x46
[<ffffffe0000cf04c>] exit_mmap+0x60/0xf2
[<ffffffe00003567a>] mmput.part.7+0x14/0x84
[<ffffffe000035706>] mmput+0x1c/0x28
[<ffffffe0000398fc>] do_exit+0x184/0x724
[<ffffffe000033e9e>] die+0xd4/0xe4
[<ffffffe000034dc6>] do_page_fault+0x2ac/0x2b8
[<ffffffe000033242>] ret_from_syscall+0xa/0xe
swap_info_get: Bad swap file entry 20000000005415d1
BUG: Bad page map in process lisp.run  pte:2a0ae8c0 pmd:3e7b2001
addr:00000000e4c69b17 vm_flags:00100070 anon_vma:00000000a7ffaac9 mapping:          (null) index:1ffff81
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 0 PID: 23124 Comm: lisp.run Tainted: G    B D          4.16.0-rc2-00328-gebea62367bc4 #4
Call Trace:
[<ffffffe0000341ee>] walk_stackframe+0x0/0xa2
[<ffffffe0000342ec>] show_stack+0x26/0x34
[<ffffffe0005e4904>] dump_stack+0x5e/0x7c
[<ffffffe0000c83f4>] print_bad_pte+0x12a/0x192
[<ffffffe0000c9624>] unmap_page_range+0x2ca/0x564
[<ffffffe0000c98e8>] unmap_single_vma+0x2a/0x3e
[<ffffffe0000c9a26>] unmap_vmas+0x26/0x46
[<ffffffe0000cf04c>] exit_mmap+0x60/0xf2
[<ffffffe00003567a>] mmput.part.7+0x14/0x84
[<ffffffe000035706>] mmput+0x1c/0x28
[<ffffffe0000398fc>] do_exit+0x184/0x724
[<ffffffe000033e9e>] die+0xd4/0xe4
[<ffffffe000034dc6>] do_page_fault+0x2ac/0x2b8
[<ffffffe000033242>] ret_from_syscall+0xa/0xe
swap_info_get: Bad swap file entry 2000000000541049
BUG: Bad page map in process lisp.run  pte:2a0824c0 pmd:3e7b2001
addr:0000000011fbaac6 vm_flags:00100070 anon_vma:00000000a7ffaac9 mapping:          (null) index:1ffffe4
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 0 PID: 23124 Comm: lisp.run Tainted: G    B D          4.16.0-rc2-00328-gebea62367bc4 #4
Call Trace:
[<ffffffe0000341ee>] walk_stackframe+0x0/0xa2
[<ffffffe0000342ec>] show_stack+0x26/0x34
[<ffffffe0005e4904>] dump_stack+0x5e/0x7c
[<ffffffe0000c83f4>] print_bad_pte+0x12a/0x192
[<ffffffe0000c9624>] unmap_page_range+0x2ca/0x564
[<ffffffe0000c98e8>] unmap_single_vma+0x2a/0x3e
[<ffffffe0000c9a26>] unmap_vmas+0x26/0x46
[<ffffffe0000cf04c>] exit_mmap+0x60/0xf2
[<ffffffe00003567a>] mmput.part.7+0x14/0x84
[<ffffffe000035706>] mmput+0x1c/0x28
[<ffffffe0000398fc>] do_exit+0x184/0x724
[<ffffffe000033e9e>] die+0xd4/0xe4
[<ffffffe000034dc6>] do_page_fault+0x2ac/0x2b8
[<ffffffe000033242>] ret_from_syscall+0xa/0xe
swap_info_get: Bad swap file entry 2000000000541059
BUG: Bad page map in process lisp.run  pte:2a082cc0 pmd:3e7b2001
addr:000000007a53452e vm_flags:00100070 anon_vma:00000000a7ffaac9 mapping:          (null) index:1ffffe5
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 0 PID: 23124 Comm: lisp.run Tainted: G    B D          4.16.0-rc2-00328-gebea62367bc4 #4
Call Trace:
[<ffffffe0000341ee>] walk_stackframe+0x0/0xa2
[<ffffffe0000342ec>] show_stack+0x26/0x34
[<ffffffe0005e4904>] dump_stack+0x5e/0x7c
[<ffffffe0000c83f4>] print_bad_pte+0x12a/0x192
[<ffffffe0000c9624>] unmap_page_range+0x2ca/0x564
[<ffffffe0000c98e8>] unmap_single_vma+0x2a/0x3e
[<ffffffe0000c9a26>] unmap_vmas+0x26/0x46
[<ffffffe0000cf04c>] exit_mmap+0x60/0xf2
[<ffffffe00003567a>] mmput.part.7+0x14/0x84
[<ffffffe000035706>] mmput+0x1c/0x28
[<ffffffe0000398fc>] do_exit+0x184/0x724
[<ffffffe000033e9e>] die+0xd4/0xe4
[<ffffffe000034dc6>] do_page_fault+0x2ac/0x2b8
[<ffffffe000033242>] ret_from_syscall+0xa/0xe
swap_info_get: Bad swap file entry 20000000005410a9
BUG: Bad page map in process lisp.run  pte:2a0854c0 pmd:3e7b2001
addr:00000000e42f76a8 vm_flags:00100070 anon_vma:00000000a7ffaac9 mapping:          (null) index:1ffffec
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 0 PID: 23124 Comm: lisp.run Tainted: G    B D          4.16.0-rc2-00328-gebea62367bc4 #4
Call Trace:
[<ffffffe0000341ee>] walk_stackframe+0x0/0xa2
[<ffffffe0000342ec>] show_stack+0x26/0x34
[<ffffffe0005e4904>] dump_stack+0x5e/0x7c
[<ffffffe0000c83f4>] print_bad_pte+0x12a/0x192
[<ffffffe0000c9624>] unmap_page_range+0x2ca/0x564
[<ffffffe0000c98e8>] unmap_single_vma+0x2a/0x3e
[<ffffffe0000c9a26>] unmap_vmas+0x26/0x46
[<ffffffe0000cf04c>] exit_mmap+0x60/0xf2
[<ffffffe00003567a>] mmput.part.7+0x14/0x84
[<ffffffe000035706>] mmput+0x1c/0x28
[<ffffffe0000398fc>] do_exit+0x184/0x724
[<ffffffe000033e9e>] die+0xd4/0xe4
[<ffffffe000034dc6>] do_page_fault+0x2ac/0x2b8
[<ffffffe000033242>] ret_from_syscall+0xa/0xe
swap_info_get: Bad swap file entry 2000000000540e21
BUG: Bad page map in process lisp.run  pte:2a0710c0 pmd:3e7b2001
addr:00000000475e59c6 vm_flags:00100070 anon_vma:00000000a7ffaac9 mapping:          (null) index:1fffff8
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 0 PID: 23124 Comm: lisp.run Tainted: G    B D          4.16.0-rc2-00328-gebea62367bc4 #4
Call Trace:
[<ffffffe0000341ee>] walk_stackframe+0x0/0xa2
[<ffffffe0000342ec>] show_stack+0x26/0x34
[<ffffffe0005e4904>] dump_stack+0x5e/0x7c
[<ffffffe0000c83f4>] print_bad_pte+0x12a/0x192
[<ffffffe0000c9624>] unmap_page_range+0x2ca/0x564
[<ffffffe0000c98e8>] unmap_single_vma+0x2a/0x3e
[<ffffffe0000c9a26>] unmap_vmas+0x26/0x46
[<ffffffe0000cf04c>] exit_mmap+0x60/0xf2
[<ffffffe00003567a>] mmput.part.7+0x14/0x84
[<ffffffe000035706>] mmput+0x1c/0x28
[<ffffffe0000398fc>] do_exit+0x184/0x724
[<ffffffe000033e9e>] die+0xd4/0xe4
[<ffffffe000034dc6>] do_page_fault+0x2ac/0x2b8
[<ffffffe000033242>] ret_from_syscall+0xa/0xe
BUG: Bad rss-counter state mm:00000000c900d1f0 idx:1 val:8
BUG: Bad rss-counter state mm:00000000c900d1f0 idx:2 val:-8
Segmentation fault

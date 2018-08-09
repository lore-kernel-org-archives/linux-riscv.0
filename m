From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 09 Aug 2018 13:58:41 -0700 (PDT)
Subject: [PATCH v2] RISC-V: Don't use a global include guard for
 uapi/asm/syscalls.h
In-Reply-To: <20180809055830.GA17533@infradead.org>
Message-ID: <mhng-b4f7b491-136a-474a-8d8b-0ab6ee218f09@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 08 Aug 2018 22:58:30 PDT (-0700), Christoph Hellwig wrote:
> This actually seems to break the compilation for me in for-next:
>
> hch at carbon:~/work/linux$ make ARCH=riscv
>   CALL    scripts/checksyscalls.sh
> <stdin>:1335:2: warning: #warning syscall rseq not implemented [-Wcpp]
>   CHK     include/generated/compile.h
>   CC      arch/riscv/kernel/syscall_table.o
> ./arch/riscv/include/uapi/asm/syscalls.h:29:36: error: 'sys_riscv_flush_icache' undeclared here (not in a function); did you mean '__NR_riscv_flush_icache'?
>  __SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
>                                     ^
> arch/riscv/kernel/syscall_table.c:21:37: note: in definition of macro '__SYSCALL'
>  #define __SYSCALL(nr, call) [nr] = (call),
>                                      ^~~~
> make[1]: *** [scripts/Makefile.build:318: arch/riscv/kernel/syscall_table.o] Error 1
> make: *** [Makefile:1029: arch/riscv/kernel] Error 2
>
> Reverting it for now, but I guess this might hit others too..

Thanks.  I dropped this from for-next and just sent out a replacement.

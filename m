From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 8 Aug 2018 22:58:30 -0700
Subject: [PATCH v2] RISC-V: Don't use a global include guard for
 uapi/asm/syscalls.h
In-Reply-To: <20180806204258.22280-2-palmer@sifive.com>
References: <20180804085438.GA15840@infradead.org>
 <20180806204258.22280-1-palmer@sifive.com>
 <20180806204258.22280-2-palmer@sifive.com>
Message-ID: <20180809055830.GA17533@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This actually seems to break the compilation for me in for-next:

hch at carbon:~/work/linux$ make ARCH=riscv
  CALL    scripts/checksyscalls.sh
<stdin>:1335:2: warning: #warning syscall rseq not implemented [-Wcpp]
  CHK     include/generated/compile.h
  CC      arch/riscv/kernel/syscall_table.o
./arch/riscv/include/uapi/asm/syscalls.h:29:36: error: 'sys_riscv_flush_icache' undeclared here (not in a function); did you mean '__NR_riscv_flush_icache'?
 __SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
                                    ^
arch/riscv/kernel/syscall_table.c:21:37: note: in definition of macro '__SYSCALL'
 #define __SYSCALL(nr, call) [nr] = (call),
                                     ^~~~
make[1]: *** [scripts/Makefile.build:318: arch/riscv/kernel/syscall_table.o] Error 1
make: *** [Makefile:1029: arch/riscv/kernel] Error 2

Reverting it for now, but I guess this might hit others too..

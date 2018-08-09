From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu,  9 Aug 2018 15:19:50 -0700
Subject: RISC-V: Don't use a global include guard for uapi/asm/syscalls.
Message-ID: <20180809221952.24260-1-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

It turns out that we weren't actually hooking sys_riscv_flush_icache
into the syscall table, which results in any flush_icache() call that
escapes the vDSO to silently do nothing.

Changes since v2:

* sys_riscv_flush_icache actually flushes the icache when SMP=n.  Thanks
  to Andrew for pointing out the I screwed it up!

Changes since v1:

* sys_riscv_flush_icache is now defined even when SMP=n, which allows
  this patch set to build against SMP=n and SMP=y.

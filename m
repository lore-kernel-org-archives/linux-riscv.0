From: linux@roeck-us.net (Guenter Roeck)
Date: Thu, 9 Aug 2018 14:24:22 -0700
Subject: [PATCH v2 2/2] RISC-V: Don't use a global include guard for
 uapi/asm/syscalls.h
In-Reply-To: <20180809202524.1702-3-palmer@sifive.com>
References: <20180809202524.1702-1-palmer@sifive.com>
 <20180809202524.1702-3-palmer@sifive.com>
Message-ID: <20180809212422.GB13675@roeck-us.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Aug 09, 2018 at 01:25:24PM -0700, Palmer Dabbelt wrote:
> This file is expected to be included multiple times in the same file in
> order to allow the __SYSCALL macro to generate system call tables.  With
> a global include guard we end up missing __NR_riscv_flush_icache in the
> syscall table, which results in icache flushes that escape the vDSO call
> to not actually do anything.
> 
> The fix is to move to per-#define include guards, which allows the
> system call tables to actually be populated.  Thanks to Macrus Comstedt
> for finding and fixing the bug!
> 
> I also went ahead and fixed the SPDX header to use a //-style comment,
> which I've been told is the canonical way to do it.
> 
> Cc: Marcus Comstedt <marcus@mc.pp.se>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

[Compile-]Tested-by: Guenter Roeck <linux@roeck-us.net>

on top of linux-next after reverting the version of the patch there.

I also tried to run the resulting image (defconfig) with qemu (built
from https://github.com/riscv/riscv-qemu.git), but that still doesn't
work. I assume there are still some patches missing ?

Thanks,
Guenter

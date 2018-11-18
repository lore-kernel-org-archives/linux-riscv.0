From: mick@ics.forth.gr (Nick Kossifidis)
Date: Sun, 18 Nov 2018 03:49:49 +0200
Subject: [PATCH v2] riscv: add asm/unistd.h UAPI header
In-Reply-To: <20181108190239.29633-1-david.abdurachmanov@gmail.com>
References: <20181108190239.29633-1-david.abdurachmanov@gmail.com>
Message-ID: <853e56348a89887d31b6b1866eed6d38@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hello David,

???? 2018-11-08 21:02, David Abdurachmanov ??????:
> Marcin Juszkiewicz reported issues while generating syscall table for 
> riscv
> using 4.20-rc1. The patch refactors our unistd.h files to match some 
> other
> architectures.
> 
> - Add asm/unistd.h UAPI header, which has __ARCH_WANT_NEW_STAT only for 
> 64-bit
> - Remove asm/syscalls.h UAPI header and merge to asm/unistd.h
> - Adjust kernel asm/unistd.h
> 
> So now asm/unistd.h UAPI header should show all syscalls for riscv.
> 
> Before this, Makefile simply put `#include <asm-generic/unistd.h>` into
> generated asm/unistd.h UAPI header thus user didn't see:
> 
> - __NR_riscv_flush_icache
> - __NR_newfstatat
> - __NR_fstat
> 
> which are supported by riscv kernel.
> 
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Fixes: 67314ec7b025 ("RISC-V: Request newstat syscalls")
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> ---
>  arch/riscv/include/asm/unistd.h        |  5 ++--
>  arch/riscv/include/uapi/asm/syscalls.h | 29 ------------------
>  arch/riscv/include/uapi/asm/unistd.h   | 41 ++++++++++++++++++++++++++
>  3 files changed, 43 insertions(+), 32 deletions(-)
>  delete mode 100644 arch/riscv/include/uapi/asm/syscalls.h
>  create mode 100644 arch/riscv/include/uapi/asm/unistd.h
> 
> diff --git a/arch/riscv/include/asm/unistd.h 
> b/arch/riscv/include/asm/unistd.h
> index eff7aa9aa163..fef96f117b4d 100644
> --- a/arch/riscv/include/asm/unistd.h
> +++ b/arch/riscv/include/asm/unistd.h
> @@ -13,10 +13,9 @@
> 
>  /*
>   * There is explicitly no include guard here because this file is 
> expected to
> - * be included multiple times.  See uapi/asm/syscalls.h for more info.
> + * be included multiple times.
>   */
> 
> -#define __ARCH_WANT_NEW_STAT
>  #define __ARCH_WANT_SYS_CLONE
> +
>  #include <uapi/asm/unistd.h>
> -#include <uapi/asm/syscalls.h>
> diff --git a/arch/riscv/include/uapi/asm/syscalls.h
> b/arch/riscv/include/uapi/asm/syscalls.h
> deleted file mode 100644
> index 206dc4b0f6ea..000000000000
> --- a/arch/riscv/include/uapi/asm/syscalls.h
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright (C) 2017-2018 SiFive
> - */
> -
> -/*
> - * There is explicitly no include guard here because this file is 
> expected to
> - * be included multiple times in order to define the syscall macros 
> via
> - * __SYSCALL.
> - */
> -
> -/*
> - * Allows the instruction cache to be flushed from userspace.  Despite 
> RISC-V
> - * having a direct 'fence.i' instruction available to userspace (which 
> we
> - * can't trap!), that's not actually viable when running on Linux 
> because the
> - * kernel might schedule a process on another hart.  There is no way 
> for
> - * userspace to handle this without invoking the kernel (as it doesn't 
> know the
> - * thread->hart mappings), so we've defined a RISC-V specific system 
> call to
> - * flush the instruction cache.
> - *
> - * __NR_riscv_flush_icache is defined to flush the instruction cache 
> over an
> - * address range, with the flush applying to either all threads or 
> just the
> - * caller.  We don't currently do anything with the address range, 
> that's just
> - * in there for forwards compatibility.
> - */
> -#ifndef __NR_riscv_flush_icache
> -#define __NR_riscv_flush_icache (__NR_arch_specific_syscall + 15)
> -#endif
> -__SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
> diff --git a/arch/riscv/include/uapi/asm/unistd.h
> b/arch/riscv/include/uapi/asm/unistd.h
> new file mode 100644
> index 000000000000..1f3bd3ebbb0d
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/unistd.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2018 David Abdurachmanov 
> <david.abdurachmanov@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or 
> modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see 
> <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifdef __LP64__
> +#define __ARCH_WANT_NEW_STAT
> +#endif /* __LP64__ */
> +
> +#include <asm-generic/unistd.h>
> +
> +/*
> + * Allows the instruction cache to be flushed from userspace.  Despite 
> RISC-V
> + * having a direct 'fence.i' instruction available to userspace (which 
> we
> + * can't trap!), that's not actually viable when running on Linux 
> because the
> + * kernel might schedule a process on another hart.  There is no way 
> for
> + * userspace to handle this without invoking the kernel (as it doesn't 
> know the
> + * thread->hart mappings), so we've defined a RISC-V specific system 
> call to
> + * flush the instruction cache.
> + *
> + * __NR_riscv_flush_icache is defined to flush the instruction cache 
> over an
> + * address range, with the flush applying to either all threads or 
> just the
> + * caller.  We don't currently do anything with the address range, 
> that's just
> + * in there for forwards compatibility.
> + */
> +#ifndef __NR_riscv_flush_icache
> +#define __NR_riscv_flush_icache (__NR_arch_specific_syscall + 15)
> +#endif
> +__SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)

You are copying content from arch/riscv/include/uapi/asm/syscalls.h to
arch/riscv/include/uapi/asm/unistd.h without keeping the copyright of
the original contributor (in this case SiFive). Also since you use
SPDX-License-Identifier, you don't have to put the GPLv2 preamble there.

Other than that I can also verify that this patch fixes compilation for 
RV32.

Regards,
Nick

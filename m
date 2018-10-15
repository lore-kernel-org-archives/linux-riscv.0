From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 15 Oct 2018 01:34:39 -0700
Subject: [PATCH] RISC-V: Add futex support.
In-Reply-To: <20181012200350.5258-1-jimw@sifive.com>
References: <20181012200350.5258-1-jimw@sifive.com>
Message-ID: <20181015083439.GA11826@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> I'm not a kernel expert, so there could be details I got wrong here.  I wasn't
> sure about the memory model support, so I used aqrl which seemed safest, and
> didn't add fences which seemed unnecessary.  I'm not sure about the copyright
> statements, I left in Ralf Baechle's line because I started with his code.
> Checkpatch reports some style problems, but it is the same style as the MIPS
> futex.h, and the uses of ENOSYS appear correct even though it complains about
> them.  I don't know if any of that matters.

Thanks Jim,

a few comments below:

> +/*
> + * This file is subject to the terms and conditions of the GNU General Public
> + * License.  See the file "COPYING" in the main directory of this archive
> + * for more details.
> + *

This should be replaced with an SPDX header:

/* SPDX-License-Identifier: GPL-2.0 */

> +#ifdef __KERNEL__

No need for this ifdef.

> +#include <asm/errno.h>

This shoud be <linux/errno.h>

> +#include <asm/asm.h>
> +
> +#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)		\
> +{									\
> +	uintptr_t __tmp;						\
> +	if (__riscv_atomic) {						\

__riscv_atomic doesn't exist anywhere in the kernel tree.

> +		__enable_user_access();					\
> +		__asm__ __volatile__ (					\
> +		"1:	" insn "				\n"	\
> +		"2:						\n"	\
> +		"	.section .fixup,\"ax\"			\n"	\
> +		"	.balign 4				\n"	\
> +		"3:	li %0,%5				\n"	\
> +		"	jump 2b,%3				\n"	\
> +		"	.previous				\n"	\
> +		"	.section __ex_table,\"a\"		\n"	\
> +		"	.balign " RISCV_SZPTR "			\n"	\
> +		"	" RISCV_PTR " 1b, 3b			\n"	\
> +		"	.previous				\n"	\
> +		: "+r" (ret), "=&r" (oldval),				\
> +		  "+m" (*uaddr), "=&r" (__tmp)				\
> +		: "Jr" (oparg), "i" (-EFAULT)				\

Might it be worth to use named __asm__ argument like we do in
arch/riscv/include/asm/atomic.h?

arch/riscv/include/asm/Kbuild needs to drop the generic-y line
for futex.h now that there is a a real arch-specific one.

arch/riscv/Kconfig should grow an unconditional 'select HAVE_FUTEX_CMPXCHG'
to skip the feature probing.

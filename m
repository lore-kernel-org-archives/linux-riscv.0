From: hch@infradead.org (Christoph Hellwig)
Date: Sat, 4 Aug 2018 01:54:38 -0700
Subject: [PATCH] RISC-V: Don't use a global include guard for
 uapi/asm/syscalls.h
In-Reply-To: <20180803195344.22271-1-palmer@sifive.com>
References: <20180803195344.22271-1-palmer@sifive.com>
Message-ID: <20180804085438.GA15840@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> index 818655b0d535..882a6aa09a33 100644
> --- a/arch/riscv/include/uapi/asm/syscalls.h
> +++ b/arch/riscv/include/uapi/asm/syscalls.h
> @@ -1,10 +1,11 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +// SPDX-License-Identifier: GPL-2.0

/* */ is the required style for headers, // is only for other files.

> +/* There is explicitly no include guard here because this file is expected to
> + * be included multiple times in order to define the syscall macros via
> + * __SYSCALL. */

Normal Linux comment style would be:

/*
 * There is explicitly no include guard here because this file is expected to
 * be included multiple times in order to define the syscall macros via
 * __SYSCALL.
 */

Also syscalls.h isn't included directly anywhere, but through
<asm/unistd.h>, so we'll probably need a similar comment there as well.

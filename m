From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 14 Aug 2018 06:40:27 -0700
Subject: [PATCH v3 2/2] RISC-V: Don't use a global include guard for
 uapi/asm/syscalls.h
In-Reply-To: <20180809221952.24260-3-palmer@sifive.com>
References: <20180809221952.24260-1-palmer@sifive.com>
 <20180809221952.24260-3-palmer@sifive.com>
Message-ID: <20180814134027.GD28080@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> index 818655b0d535..690beb002d1d 100644
> --- a/arch/riscv/include/uapi/asm/syscalls.h
> +++ b/arch/riscv/include/uapi/asm/syscalls.h
> @@ -1,10 +1,13 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +// SPDX-License-Identifier: GPL-2.0

/* ... */  is the right style SPDX tag for headers, so please keep it
as-is.

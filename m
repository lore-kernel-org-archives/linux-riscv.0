From: hch@infradead.org (Christoph Hellwig)
Date: Sat, 23 Jun 2018 00:28:24 -0700
Subject: [PATCH 3/3] irqchip: RISC-V Local Interrupt Controller Driver
In-Reply-To: <20180622232006.12158-4-palmer@sifive.com>
References: <20180622232006.12158-1-palmer@sifive.com>
 <20180622232006.12158-4-palmer@sifive.com>
Message-ID: <20180623072824.GC25573@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> +config RISCV_INTC
> +	#bool "RISC-V Interrupt Controller"
> +	depends on RISCV
> +	default y
> +	help
> +	   This enables support for the local interrupt controller found in
> +	   standard RISC-V systems.  The local interrupt controller handles
> +	   timer interrupts, software interrupts, and hardware interrupts.
> +	   Without a local interrupt controller the system will be unable to
> +	   handle any interrupts, including those passed via the PLIC.

This can just be:

config RISCV_INTC
	def_bool y if RISCV
	depends on RISCV

as this isn't a user selectable option.

> index 000000000000..7ca3060e76b4
> --- /dev/null
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -0,0 +1,215 @@
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2017-2018 SiFive
> + */
> +/* SPDX-License-Identifier: GPL-2.0 */

SPDX tags need to be the first thing in the file, and use // -style
comments.

FYI, I've got a version with this and a few other cleanups here:

http://git.infradead.org/users/hch/riscv.git/commitdiff/d0789843f663ba8a6573ac5f73d8b6f999c8e6ed

From: tglx@linutronix.de (Thomas Gleixner)
Date: Thu, 25 Jan 2018 10:05:57 +0100 (CET)
Subject: [PATCH v2 1/4] arm: Make set_handle_irq and handle_arch_irq
 generic
In-Reply-To: <20180125030756.21787-2-palmer@sifive.com>
References: <20180125030756.21787-1-palmer@sifive.com>
 <20180125030756.21787-2-palmer@sifive.com>
Message-ID: <alpine.DEB.2.20.1801250959070.2020@nanos>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 24 Jan 2018, Palmer Dabbelt wrote:

> It looks like this same irqchip registration mechanism has been copied
> into a handful of ports, including aarch64 and openrisc.  I want to use
> this in the RISC-V port, so I thought it would be good to make this
> generic instead.
> 
> This patch simply moves set_handle_irq and handle_arch_irq from arch/arm
> to kernel/irq/handle.c.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  arch/arm/Kconfig             |  5 -----
>  arch/arm/include/asm/irq.h   |  5 -----
>  arch/arm/kernel/entry-armv.S |  6 ------
>  arch/arm/kernel/irq.c        | 10 ----------
>  include/linux/irq.h          | 18 ++++++++++++++++++
>  kernel/irq/Kconfig           |  5 +++++
>  kernel/irq/handle.c          | 10 ++++++++++

Please split the patches into two pieces:

1) Add the infrastructure to the generic code and have a new Kconfig symbol

   GENERIC_IRQ_MULTI_HANDLER

   or something which fits in the GENERIC_IRQ_ name space.

   That also makes sure that the build does not fail after patch 1 for the
   non converted arch. With your change this breaks arm64 build with only
   patch 1 applied because the Kconfig symbol is defined twice and the code
   is defined twice. See drivers/irqchip/Kconfig ARM_GIC_V3 ....
   
2) Convert both arm and arm64 over along with the select statements in the
   arch and irqchip Kconfigs

Thanks,

	tglx

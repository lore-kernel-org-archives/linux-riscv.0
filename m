From: lkp@intel.com (kbuild test robot)
Date: Thu, 16 Aug 2018 21:03:25 +0800
Subject: [PATCH v4 3/3] irqchip: add a SiFive PLIC driver
In-Reply-To: <20180809075602.989-4-hch@lst.de>
References: <20180809075602.989-4-hch@lst.de>
Message-ID: <201808162025.rHQQ8gBd%fengguang.wu@intel.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi Christoph,

I love your patch! Yet something to improve:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on v4.18]
[cannot apply to next-20180816]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Christoph-Hellwig/dt-bindings-interrupt-controller-RISC-V-local-interrupt-controller/20180810-014110
config: riscv-defconfig (attached as .config)
compiler: riscv64-linux-gcc (GCC) 8.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=8.1.0 make.cross ARCH=riscv 

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/ptrace.h:18,
                    from arch/riscv/include/asm/processor.h:19,
                    from arch/riscv/include/asm/irqflags.h:18,
                    from include/linux/irqflags.h:16,
                    from arch/riscv/include/asm/bitops.h:22,
                    from include/linux/bitops.h:38,
                    from include/linux/kernel.h:11,
                    from include/linux/interrupt.h:6,
                    from drivers/irqchip/irq-sifive-plic.c:7:
   drivers/irqchip/irq-sifive-plic.c: In function 'plic_handle_irq':
>> drivers/irqchip/irq-sifive-plic.c:156:17: error: 'SIE_SEIE' undeclared (first use in this function); did you mean 'SIE_STIE'?
     csr_clear(sie, SIE_SEIE);
                    ^~~~~~~~
   arch/riscv/include/asm/csr.h:124:38: note: in definition of macro 'csr_clear'
     unsigned long __v = (unsigned long)(val);  \
                                         ^~~
   drivers/irqchip/irq-sifive-plic.c:156:17: note: each undeclared identifier is reported only once for each function it appears in
     csr_clear(sie, SIE_SEIE);
                    ^~~~~~~~
   arch/riscv/include/asm/csr.h:124:38: note: in definition of macro 'csr_clear'
     unsigned long __v = (unsigned long)(val);  \
                                         ^~~

vim +156 drivers/irqchip/irq-sifive-plic.c

   > 7	#include <linux/interrupt.h>
     8	#include <linux/io.h>
     9	#include <linux/irq.h>
    10	#include <linux/irqchip.h>
    11	#include <linux/irqdomain.h>
    12	#include <linux/module.h>
    13	#include <linux/of.h>
    14	#include <linux/of_address.h>
    15	#include <linux/of_irq.h>
    16	#include <linux/platform_device.h>
    17	#include <linux/spinlock.h>
    18	
    19	/*
    20	 * This driver implements a version of the RISC-V PLIC with the actual layout
    21	 * specified in chapter 8 of the SiFive U5 Coreplex Series Manual:
    22	 *
    23	 *     https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf
    24	 *
    25	 * The largest number supported by devices marked as 'riscv,plic0', is 1024, of
    26	 * which device 0 is defined as non-existent by the RISC-V Privileged Spec.
    27	 */
    28	
    29	#define MAX_DEVICES			1024
    30	#define MAX_CONTEXTS			15872
    31	
    32	/*
    33	 * Each interrupt source has a priority register associated with it.
    34	 * We always hardwire it to one in Linux.
    35	 */
    36	#define PRIORITY_BASE			0
    37	#define     PRIORITY_PER_ID		4
    38	
    39	/*
    40	 * Each hart context has a vector of interrupt enable bits associated with it.
    41	 * There's one bit for each interrupt source.
    42	 */
    43	#define ENABLE_BASE			0x2000
    44	#define     ENABLE_PER_HART		0x80
    45	
    46	/*
    47	 * Each hart context has a set of control registers associated with it.  Right
    48	 * now there's only two: a source priority threshold over which the hart will
    49	 * take an interrupt, and a register to claim interrupts.
    50	 */
    51	#define CONTEXT_BASE			0x200000
    52	#define     CONTEXT_PER_HART		0x1000
    53	#define     CONTEXT_THRESHOLD		0x00
    54	#define     CONTEXT_CLAIM		0x04
    55	
    56	static void __iomem *plic_regs;
    57	
    58	struct plic_handler {
    59		bool			present;
    60		int			ctxid;
    61	};
    62	static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
    63	
    64	static inline void __iomem *plic_hart_offset(int ctxid)
    65	{
    66		return plic_regs + CONTEXT_BASE + ctxid * CONTEXT_PER_HART;
    67	}
    68	
    69	static inline u32 __iomem *plic_enable_base(int ctxid)
    70	{
    71		return plic_regs + ENABLE_BASE + ctxid * ENABLE_PER_HART;
    72	}
    73	
    74	/*
    75	 * Protect mask operations on the registers given that we can't assume that
    76	 * atomic memory operations work on them.
    77	 */
    78	static DEFINE_RAW_SPINLOCK(plic_toggle_lock);
    79	
    80	static inline void plic_toggle(int ctxid, int hwirq, int enable)
    81	{
    82		u32 __iomem *reg = plic_enable_base(ctxid) + (hwirq / 32);
    83		u32 hwirq_mask = 1 << (hwirq % 32);
    84	
    85		raw_spin_lock(&plic_toggle_lock);
    86		if (enable)
    87			writel(readl(reg) | hwirq_mask, reg);
    88		else
    89			writel(readl(reg) & ~hwirq_mask, reg);
    90		raw_spin_unlock(&plic_toggle_lock);
    91	}
    92	
    93	static inline void plic_irq_toggle(struct irq_data *d, int enable)
    94	{
    95		int cpu;
    96	
    97		writel(enable, plic_regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
    98		for_each_cpu(cpu, irq_data_get_affinity_mask(d)) {
    99			struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
   100	
   101			if (handler->present)
   102				plic_toggle(handler->ctxid, d->hwirq, enable);
   103		}
   104	}
   105	
   106	static void plic_irq_enable(struct irq_data *d)
   107	{
   108		plic_irq_toggle(d, 1);
   109	}
   110	
   111	static void plic_irq_disable(struct irq_data *d)
   112	{
   113		plic_irq_toggle(d, 0);
   114	}
   115	
   116	static struct irq_chip plic_chip = {
   117		.name		= "SiFive PLIC",
   118		/*
   119		 * There is no need to mask/unmask PLIC interrupts.  They are "masked"
   120		 * by reading claim and "unmasked" when writing it back.
   121		 */
   122		.irq_enable	= plic_irq_enable,
   123		.irq_disable	= plic_irq_disable,
   124	};
   125	
   126	static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
   127				      irq_hw_number_t hwirq)
   128	{
   129		irq_set_chip_and_handler(irq, &plic_chip, handle_simple_irq);
   130		irq_set_chip_data(irq, NULL);
   131		irq_set_noprobe(irq);
   132		return 0;
   133	}
   134	
   135	static const struct irq_domain_ops plic_irqdomain_ops = {
   136		.map		= plic_irqdomain_map,
   137		.xlate		= irq_domain_xlate_onecell,
   138	};
   139	
   140	static struct irq_domain *plic_irqdomain;
   141	
   142	/*
   143	 * Handling an interrupt is a two-step process: first you claim the interrupt
   144	 * by reading the claim register, then you complete the interrupt by writing
   145	 * that source ID back to the same claim register.  This automatically enables
   146	 * and disables the interrupt, so there's nothing else to do.
   147	 */
   148	static void plic_handle_irq(struct pt_regs *regs)
   149	{
   150		struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
   151		void __iomem *claim = plic_hart_offset(handler->ctxid) + CONTEXT_CLAIM;
   152		irq_hw_number_t hwirq;
   153	
   154		WARN_ON_ONCE(!handler->present);
   155	
 > 156		csr_clear(sie, SIE_SEIE);
   157		while ((hwirq = readl(claim))) {
   158			int irq = irq_find_mapping(plic_irqdomain, hwirq);
   159	
   160			if (unlikely(irq <= 0))
   161				pr_warn_ratelimited("can't find mapping for hwirq %lu\n",
   162						hwirq);
   163			else
   164				generic_handle_irq(irq);
   165			writel(hwirq, claim);
   166		}
   167		csr_set(sie, SIE_SEIE);
   168	}
   169	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 16337 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180816/eab23c88/attachment.gz>

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D72C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 00:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VY5pudOPX6VtJHieydo6o8dHGO4p0rRUup0TvacDj+Y=; b=3Blnoepfz4v5iF
	3CZbf4dlsRZd/Siwyqk15r5kt7MEJQz1sXR5aRfdAKZYwkgcYNgosyN2oGYyZVboDkv8X/e70iWS8
	yOemgRKycABh9CHKJlrsejEmP1hyw2BObCaiR4bnD0EbfAlfdncCbFGuPtClO7tM2FfSbKh320tP2
	zPJVOokKV6q1CWzAVCYZI/brbMIw5/HsGhSXyZA6yp/wfQCNmEV766Ixw3WDTERfEbeunAzVvrH8w
	6RC6mHBavlPrLBTsXJ73B0GRWBEGhPXIxtPnE9ynesKIi1Rf06fs08z2BTIj4Ct+JYt9CNqFCJ8nN
	dErbV4Bzp6wrEGpApw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcyPC-000VCN-0A;
	Fri, 17 Mar 2023 00:57:14 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcyP8-000V83-04
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 00:57:12 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 591FD24E1D3;
	Fri, 17 Mar 2023 08:56:38 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Mar
 2023 08:56:38 +0800
Received: from [192.168.125.89] (113.72.145.194) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Mar
 2023 08:56:37 +0800
Message-ID: <eccd860a-fea0-ac24-1796-8e9ae0758bea@starfivetech.com>
Date: Fri, 17 Mar 2023 08:56:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4] irqchip/irq-sifive-plic: Add syscore callbacks for
 hibernation
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Ley
 Foon Tan" <leyfoon.tan@starfivetech.com>, Sia Jee Heng
	<jeeheng.sia@starfivetech.com>
References: <20230308064643.24805-1-mason.huo@starfivetech.com>
From: Mason Huo <mason.huo@starfivetech.com>
In-Reply-To: <20230308064643.24805-1-mason.huo@starfivetech.com>
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_175710_360492_0F1F1C36 
X-CRM114-Status: GOOD (  21.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Marc,

Any feedback about the following v4 patch which is based on 6.3-rc1.

Thanks
Mason

On 2023/3/8 14:46, Mason Huo wrote:
> The priority and enable registers of plic will be reset
> during hibernation power cycle in poweroff mode,
> add the syscore callbacks to save/restore those registers.
> 
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Reviewed-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://lore.kernel.org/r/202302140709.CdkxgtPi-lkp@intel.com/
> ---
>  drivers/irqchip/irq-sifive-plic.c | 93 ++++++++++++++++++++++++++++++-
>  1 file changed, 91 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index ff47bd0dec45..2800e7bb149a 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -17,6 +17,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/spinlock.h>
> +#include <linux/syscore_ops.h>
>  #include <asm/smp.h>
>  
>  /*
> @@ -67,6 +68,8 @@ struct plic_priv {
>  	struct irq_domain *irqdomain;
>  	void __iomem *regs;
>  	unsigned long plic_quirks;
> +	unsigned int nr_irqs;
> +	unsigned long *prio_save;
>  };
>  
>  struct plic_handler {
> @@ -78,6 +81,7 @@ struct plic_handler {
>  	 */
>  	raw_spinlock_t		enable_lock;
>  	void __iomem		*enable_base;
> +	u32			*enable_save;
>  	struct plic_priv	*priv;
>  };
>  static int plic_parent_irq __ro_after_init;
> @@ -229,6 +233,71 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type)
>  	return IRQ_SET_MASK_OK;
>  }
>  
> +static int plic_irq_suspend(void)
> +{
> +	unsigned int i, cpu;
> +	u32 __iomem *reg;
> +	struct plic_priv *priv;
> +
> +	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
> +
> +	for (i = 0; i < priv->nr_irqs; i++)
> +		if (readl(priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID))
> +			__set_bit(i, priv->prio_save);
> +		else
> +			__clear_bit(i, priv->prio_save);
> +
> +	for_each_cpu(cpu, cpu_present_mask) {
> +		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
> +
> +		if (!handler->present)
> +			continue;
> +
> +		raw_spin_lock(&handler->enable_lock);
> +		for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
> +			reg = handler->enable_base + i * sizeof(u32);
> +			handler->enable_save[i] = readl(reg);
> +		}
> +		raw_spin_unlock(&handler->enable_lock);
> +	}
> +
> +	return 0;
> +}
> +
> +static void plic_irq_resume(void)
> +{
> +	unsigned int i, index, cpu;
> +	u32 __iomem *reg;
> +	struct plic_priv *priv;
> +
> +	priv = per_cpu_ptr(&plic_handlers, smp_processor_id())->priv;
> +
> +	for (i = 0; i < priv->nr_irqs; i++) {
> +		index = (i / BITS_PER_LONG);
> +		writel((priv->prio_save[index] & BIT(i % BITS_PER_LONG)) ? 1 : 0,
> +		       priv->regs + PRIORITY_BASE + i * PRIORITY_PER_ID);
> +	}
> +
> +	for_each_cpu(cpu, cpu_present_mask) {
> +		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
> +
> +		if (!handler->present)
> +			continue;
> +
> +		raw_spin_lock(&handler->enable_lock);
> +		for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
> +			reg = handler->enable_base + i * sizeof(u32);
> +			writel(handler->enable_save[i], reg);
> +		}
> +		raw_spin_unlock(&handler->enable_lock);
> +	}
> +}
> +
> +static struct syscore_ops plic_irq_syscore_ops = {
> +	.suspend	= plic_irq_suspend,
> +	.resume		= plic_irq_resume,
> +};
> +
>  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
>  			      irq_hw_number_t hwirq)
>  {
> @@ -345,6 +414,7 @@ static int __init __plic_init(struct device_node *node,
>  	u32 nr_irqs;
>  	struct plic_priv *priv;
>  	struct plic_handler *handler;
> +	unsigned int cpu;
>  
>  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
> @@ -363,15 +433,21 @@ static int __init __plic_init(struct device_node *node,
>  	if (WARN_ON(!nr_irqs))
>  		goto out_iounmap;
>  
> +	priv->nr_irqs = nr_irqs;
> +
> +	priv->prio_save = bitmap_alloc(nr_irqs, GFP_KERNEL);
> +	if (!priv->prio_save)
> +		goto out_free_priority_reg;
> +
>  	nr_contexts = of_irq_count(node);
>  	if (WARN_ON(!nr_contexts))
> -		goto out_iounmap;
> +		goto out_free_priority_reg;
>  
>  	error = -ENOMEM;
>  	priv->irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
>  			&plic_irqdomain_ops, priv);
>  	if (WARN_ON(!priv->irqdomain))
> -		goto out_iounmap;
> +		goto out_free_priority_reg;
>  
>  	for (i = 0; i < nr_contexts; i++) {
>  		struct of_phandle_args parent;
> @@ -441,6 +517,11 @@ static int __init __plic_init(struct device_node *node,
>  		handler->enable_base = priv->regs + CONTEXT_ENABLE_BASE +
>  			i * CONTEXT_ENABLE_SIZE;
>  		handler->priv = priv;
> +
> +		handler->enable_save =  kcalloc(DIV_ROUND_UP(nr_irqs, 32),
> +						sizeof(*handler->enable_save), GFP_KERNEL);
> +		if (!handler->enable_save)
> +			goto out_free_enable_reg;
>  done:
>  		for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
>  			plic_toggle(handler, hwirq, 0);
> @@ -461,11 +542,19 @@ static int __init __plic_init(struct device_node *node,
>  				  plic_starting_cpu, plic_dying_cpu);
>  		plic_cpuhp_setup_done = true;
>  	}
> +	register_syscore_ops(&plic_irq_syscore_ops);
>  
>  	pr_info("%pOFP: mapped %d interrupts with %d handlers for"
>  		" %d contexts.\n", node, nr_irqs, nr_handlers, nr_contexts);
>  	return 0;
>  
> +out_free_enable_reg:
> +	for_each_cpu(cpu, cpu_present_mask) {
> +		handler = per_cpu_ptr(&plic_handlers, cpu);
> +		kfree(handler->enable_save);
> +	}
> +out_free_priority_reg:
> +	kfree(priv->prio_save);
>  out_iounmap:
>  	iounmap(priv->regs);
>  out_free_priv:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

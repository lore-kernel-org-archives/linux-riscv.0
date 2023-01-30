Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843F2C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 03:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wam4x1lPPv1RATGCoq61cAgKOB2tLpMN2QD8gy+CRxE=; b=Mm0T1Aij0fiMgD
	RCJxWqOtq0+pPZD/HwRhCODDkxmFc2iV9OfZrd1jZWgwjUg1X13pxdB2UwzMwoHH4k5hZwM87Y7ly
	yMlZm5n3WPtF+9rSzg4qpidvxtBFjSxtO4jocm3ab60A/xModj2MpdyfC4HCKuyP1GbYkuRooAp17
	UVSqBkb8fQrCLK0NukaFv1Zsm1hpnhatAP0TGlIDhFHDcbFVWRYBHrBgPLWxqe0r255z1N7oOFhSM
	3b2BEWQMLPUAOmwHDcPz9Jr0YO02qR6tXacP5Qk6sftP2k8VWIP8aXTlIw2Qiql3ym7eao8awiPnZ
	YJwO11XEVLc5Lg0YXseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMKUb-002FNv-VN; Mon, 30 Jan 2023 03:06:02 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMKUW-002FHp-4O
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 03:06:00 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6FFF024E120;
	Mon, 30 Jan 2023 11:05:02 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 30 Jan
 2023 11:05:02 +0800
Received: from [192.168.125.89] (183.27.97.127) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 30 Jan
 2023 11:05:01 +0800
Message-ID: <62f93e87-0519-39d0-7a6d-3276fcde1d30@starfivetech.com>
Date: Mon, 30 Jan 2023 11:05:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1] irqchip/irq-sifive-plic: Add syscore callbacks for
 hibernation
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Ley
 Foon Tan" <leyfoon.tan@starfivetech.com>, Sia Jee Heng
	<jeeheng.sia@starfivetech.com>
References: <20230113094216.116036-1-mason.huo@starfivetech.com>
From: Mason Huo <mason.huo@starfivetech.com>
In-Reply-To: <20230113094216.116036-1-mason.huo@starfivetech.com>
X-Originating-IP: [183.27.97.127]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_190556_506536_14FEAF0E 
X-CRM114-Status: GOOD (  23.25  )
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



On 2023/1/13 17:42, Mason Huo wrote:
> The priority and enable registers of plic will be reset
> during hibernation power cycle in poweroff mode,
> add the syscore callbacks to save/restore those registers.
> 
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Reviewed-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 93 ++++++++++++++++++++++++++++++-
>  1 file changed, 91 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index ff47bd0dec45..80306de45d2b 100644
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
> +	u32 *priority_reg;
>  };
>  
>  struct plic_handler {
> @@ -79,10 +82,13 @@ struct plic_handler {
>  	raw_spinlock_t		enable_lock;
>  	void __iomem		*enable_base;
>  	struct plic_priv	*priv;
> +	/* To record interrupts that are enabled before suspend. */
> +	u32 enable_reg[MAX_DEVICES / 32];
>  };
>  static int plic_parent_irq __ro_after_init;
>  static bool plic_cpuhp_setup_done __ro_after_init;
>  static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
> +static struct plic_priv *priv_data;
>  
>  static int plic_irq_set_type(struct irq_data *d, unsigned int type);
>  
> @@ -229,6 +235,78 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type)
>  	return IRQ_SET_MASK_OK;
>  }
>  
> +static void plic_irq_resume(void)
> +{
> +	unsigned int i, cpu;
> +	u32 __iomem *reg;
> +
> +	for (i = 0; i < priv_data->nr_irqs; i++)
> +		writel(priv_data->priority_reg[i],
> +				priv_data->regs + PRIORITY_BASE + i * PRIORITY_PER_ID);
> +
> +	for_each_cpu(cpu, cpu_present_mask) {
> +		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
> +
> +		if (!handler->present)
> +			continue;
> +
> +		for (i = 0; i < DIV_ROUND_UP(priv_data->nr_irqs, 32); i++) {
> +			reg = handler->enable_base + i * sizeof(u32);
> +			raw_spin_lock(&handler->enable_lock);
> +			writel(handler->enable_reg[i], reg);
> +			raw_spin_unlock(&handler->enable_lock);
> +		}
> +	}
> +}
> +
> +static int plic_irq_suspend(void)
> +{
> +	unsigned int i, cpu;
> +	u32 __iomem *reg;
> +
> +	for (i = 0; i < priv_data->nr_irqs; i++)
> +		priv_data->priority_reg[i] =
> +			readl(priv_data->regs + PRIORITY_BASE + i * PRIORITY_PER_ID);
> +
> +	for_each_cpu(cpu, cpu_present_mask) {
> +		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
> +
> +		if (!handler->present)
> +			continue;
> +
> +		for (i = 0; i < DIV_ROUND_UP(priv_data->nr_irqs, 32); i++) {
> +			reg = handler->enable_base + i * sizeof(u32);
> +			raw_spin_lock(&handler->enable_lock);
> +			handler->enable_reg[i] = readl(reg);
> +			raw_spin_unlock(&handler->enable_lock);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static struct syscore_ops plic_irq_syscore_ops = {
> +	.suspend	= plic_irq_suspend,
> +	.resume		= plic_irq_resume,
> +};
> +
> +static void plic_irq_pm_init(void)
> +{
> +	unsigned int cpu;
> +
> +	for_each_cpu(cpu, cpu_present_mask) {
> +		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
> +
> +		if (!handler->present)
> +			continue;
> +
> +		memset(&handler->enable_reg[0], 0,
> +			sizeof(handler->enable_reg));
> +	}
> +
> +	register_syscore_ops(&plic_irq_syscore_ops);
> +}
> +
>  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
>  			      irq_hw_number_t hwirq)
>  {
> @@ -351,6 +429,7 @@ static int __init __plic_init(struct device_node *node,
>  		return -ENOMEM;
>  
>  	priv->plic_quirks = plic_quirks;
> +	priv_data = priv;
>  
>  	priv->regs = of_iomap(node, 0);
>  	if (WARN_ON(!priv->regs)) {
> @@ -363,15 +442,21 @@ static int __init __plic_init(struct device_node *node,
>  	if (WARN_ON(!nr_irqs))
>  		goto out_iounmap;
>  
> +	priv->nr_irqs = nr_irqs;
> +
> +	priv->priority_reg = kcalloc(nr_irqs, sizeof(u32), GFP_KERNEL);
> +	if (!priv->priority_reg)
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
> @@ -461,11 +546,15 @@ static int __init __plic_init(struct device_node *node,
>  				  plic_starting_cpu, plic_dying_cpu);
>  		plic_cpuhp_setup_done = true;
>  	}
> +	plic_irq_pm_init();
>  
>  	pr_info("%pOFP: mapped %d interrupts with %d handlers for"
>  		" %d contexts.\n", node, nr_irqs, nr_handlers, nr_contexts);
>  	return 0;
>  
> +out_free_priority_reg:
> +	kfree(priv->priority_reg);
> +
>  out_iounmap:
>  	iounmap(priv->regs);
>  out_free_priv:

Hi all,

Could you please help to review and provide comments on this patch?
Looking for your reply.

Thanks
Mason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6497DC87FCB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:References:Mime-Version:
	From:Message-Id:Date:Subject:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4MWlhG440f9o0g3WPr2fVQjnwNVHzZtFcPPgmFQpRY=; b=TIvPnthmipnyei
	M4Sr1uKGDAVb8BHxhN9KVLCbbGVFynY2IrJhP+q/R3HIAL0+qx6efRQGcNdfz9C62GG4vBM0DvXYE
	lmrnlmXqJoRTmdMMTMOHRo4synkKKNDvH1TSSU7TyyFY5TvUDb8EkvA0dhS9Qp+1egIKFf//qytaM
	tkcmQSQ9JJskjIbdGDD4lJiDdtQNijEWTyJXXXd+9yEPWeQRWRmviGvqgQnS2obEHSzDjU/YTH8Pj
	Ig9fH06ISIxWzXnG/Jdjua0svX91JGZCPJk1eFi/QtWLL+YDFsG3TWoWd+ZvMdFvqyH0+pUSItFv5
	X9E8P+H9LveEQ8NXlJJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaaO-0000000En2e-2gDU;
	Wed, 06 Aug 2025 09:37:28 +0000
Received: from sg-1-13.ptr.blmpb.com ([118.26.132.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujaSM-0000000Em28-2yzw
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 09:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1754472540;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=fBUEwNprg52rGFcGYTZBrY1u6S9H9M004MLIbBJj4zA=;
 b=KRb0NlJl5lSPWg1TeBZWZ8+vFwlA/WP/2EZ5Na+Ba2KtgLkUXmTud92JH3hl7wddj68QQJ
 ApH5LJD1o04pRRgkirr2oVoiXewnd5C4k+s90qtMSasALmXREjipNxA00z8VdaLl0b4PXu
 yC1cVU6s1Wb98fSOTynrRPvzb67b4tx4lNQz8vy3eOQ4b5qGiJTiVF7tfrOqSdFXJfb8xD
 7leXAgbrxVebqT/0B+lxK1+1iORIbp91rzMLArYPygluvuBDPWShixTZ0WCZ+ejp5Ytd3R
 obBsFKV4hsEbYW8/SSQuLI/KKGrjmYX+oog6Z4nFS9OOL5mjl8xCm4YPfm7iDw==
To: "Nick Hu" <nick.hu@sifive.com>, <anup@brainfault.org>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>
X-Lms-Return-Path: <lba+26893205a+cefd24+lists.infradead.org+liujingqi@lanxincomputing.com>
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] irqchip/riscv-imsic: Restore the IMSIC registers
Date: Wed, 6 Aug 2025 17:28:55 +0800
Message-Id: <c1d4cc3e-c688-4610-8b15-488cde2836d1@lanxincomputing.com>
Received: from [127.0.0.1] ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Wed, 06 Aug 2025 17:28:57 +0800
Content-Language: en-US
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Mime-Version: 1.0
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
References: <20250806082726.8835-1-nick.hu@sifive.com> <20250806082726.8835-2-nick.hu@sifive.com>
Cc: "Thomas Gleixner" <tglx@linutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
In-Reply-To: <20250806082726.8835-2-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_022911_394409_06DD897D 
X-CRM114-Status: GOOD (  17.39  )
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

On 8/6/2025 4:27 PM, Nick Hu wrote:
> When the system woken up from the low power state, the IMSIC might be in
> the reset state. Therefore adding the CPU PM callbacks to restore the
> IMSIC register when the cpu resume from the low power state.
>
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Cyan Yang <cyan.yang@sifive.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>   drivers/irqchip/irq-riscv-imsic-early.c | 40 ++++++++++++++++++++-----
>   1 file changed, 32 insertions(+), 8 deletions(-)
Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty
> diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
> index d9ae87808651..62bcbcae8bd4 100644
> --- a/drivers/irqchip/irq-riscv-imsic-early.c
> +++ b/drivers/irqchip/irq-riscv-imsic-early.c
> @@ -7,6 +7,7 @@
>   #define pr_fmt(fmt) "riscv-imsic: " fmt
>   #include <linux/acpi.h>
>   #include <linux/cpu.h>
> +#include <linux/cpu_pm.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/irq.h>
> @@ -109,14 +110,8 @@ static void imsic_handle_irq(struct irq_desc *desc)
>   	chained_irq_exit(chip, desc);
>   }
>   
> -static int imsic_starting_cpu(unsigned int cpu)
> +static void imsic_restore(void)
>   {
> -	/* Mark per-CPU IMSIC state as online */
> -	imsic_state_online();
> -
> -	/* Enable per-CPU parent interrupt */
> -	enable_percpu_irq(imsic_parent_irq, irq_get_trigger_type(imsic_parent_irq));
> -
>   	/* Setup IPIs */
>   	imsic_ipi_starting_cpu();
>   
> @@ -128,6 +123,19 @@ static int imsic_starting_cpu(unsigned int cpu)
>   
>   	/* Enable local interrupt delivery */
>   	imsic_local_delivery(true);
> +}
> +
> +static int imsic_starting_cpu(unsigned int cpu)
> +{
> +	/* Mark per-CPU IMSIC state as online */
> +	imsic_state_online();
> +
> +	/* Enable per-CPU parent interrupt */
> +	enable_percpu_irq(imsic_parent_irq,
> +			  irq_get_trigger_type(imsic_parent_irq));
> +
> +	/* Restore the imsic reg */
> +	imsic_restore();
>   
>   	return 0;
>   }
> @@ -143,6 +151,22 @@ static int imsic_dying_cpu(unsigned int cpu)
>   	return 0;
>   }
>   
> +static int imsic_pm_notifier(struct notifier_block *self, unsigned long cmd, void *v)
> +{
> +	switch (cmd) {
> +	case CPU_PM_EXIT:
> +		/* Restore the imsic reg */
> +		imsic_restore();
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block imsic_pm_notifier_block = {
> +	.notifier_call = imsic_pm_notifier,
> +};
> +
>   static int __init imsic_early_probe(struct fwnode_handle *fwnode)
>   {
>   	struct irq_domain *domain;
> @@ -180,7 +204,7 @@ static int __init imsic_early_probe(struct fwnode_handle *fwnode)
>   	cpuhp_setup_state(CPUHP_AP_IRQ_RISCV_IMSIC_STARTING, "irqchip/riscv/imsic:starting",
>   			  imsic_starting_cpu, imsic_dying_cpu);
>   
> -	return 0;
> +	return cpu_pm_register_notifier(&imsic_pm_notifier_block);
>   }
>   
>   static int __init imsic_early_dt_init(struct device_node *node, struct device_node *parent)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

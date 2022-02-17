Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E397EC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Feb 2022 15:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adb5Q0HGYQiybkR/hZFU1dg4MM7CS9CvuAZPB0dPqgM=; b=EVU44DAUIa59SWUEpM6rGCXd53
	QHCYIOHfNM9X/H3/9iHU5dOcc1mv+rwo0NSCQt5Ikbtl157yXpd4XyrIxuPFpPkmdywfYjvzLWwRl
	9rrEyC6FKLId1vTJ35DE4QF6TwJzgINPNQd5R3X/j5hRNItEB1IT0QKMjjigaIYbBUNypf9D0vbIG
	LYpDqYHekVJSYhdc9LCt7tyvOjUPM0p69N8/P0fLHALpa3dFciIlNWbRsD5LWSavHxMKMcAm3MQVL
	uvI+pX1MkTvOAtYZtRB6MqPK24vwSJ6PzRd2G8XEKLB2VqfrcVFffWxzTixeUg2WRDIfnrDZfJhvN
	aX2LaLYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKiSA-00BDLi-EU; Thu, 17 Feb 2022 15:12:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKiS5-00BDKy-Ep
 for linux-riscv@lists.infradead.org; Thu, 17 Feb 2022 15:12:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A603B8229C;
 Thu, 17 Feb 2022 15:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E34C340E8;
 Thu, 17 Feb 2022 15:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645110730;
 bh=KDQe45qlzMBNPOl7GlXQkYPjXodxLAhGokag+dlZ2zo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Htsc0XFIK2HdOEgDOn9Ppq1O7VCXWF1mVm/DLnbg80UCH11tmBi3Qhgw/VlDoh9nJ
 /WxEhkdqOmCMDR5lLGMt9adBXTVTD4y+4cbC9SFRQocfSbvLpTIZs99vZ89ldtSTwX
 3+qG/yFdRzhcEbBtprGCHBieGeE/BjWzsMWZCgkFTm6BgCm/+sHpyssV68Z5VDuw37
 R0xN1GJku5w6CaImS+9wwuzgMMmV9/1SrdUfoQDiBClDh8/85s6bZFii08uu6plEKr
 VVqAt8Qw/QwMDFEaQ5WkS1PKqMup2XGJN+2rSnL+LUhbmok8ck9ROcK/tVc58QZmEL
 KXfwYS7ZZuelg==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nKiS0-008bzU-J7; Thu, 17 Feb 2022 15:12:08 +0000
MIME-Version: 1.0
Date: Thu, 17 Feb 2022 15:12:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] irqchip/riscv-intc: Create domain using named
 fwnode
In-Reply-To: <20220128052505.859518-3-apatel@ventanamicro.com>
References: <20220128052505.859518-1-apatel@ventanamicro.com>
 <20220128052505.859518-3-apatel@ventanamicro.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <063b8a5636d6372f37029946b2c3e0f4@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: apatel@ventanamicro.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, tglx@linutronix.de, daniel.lezcano@linaro.org,
 atishp@atishpatra.org, Alistair.Francis@wdc.com, anup@brainfault.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_071213_814714_A9DCC0CF 
X-CRM114-Status: GOOD (  27.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-01-28 05:25, Anup Patel wrote:
> We should create INTC domain using a synthetic fwnode which will allow
> drivers (such as RISC-V SBI IPI driver, RISC-V timer driver, RISC-V
> PMU driver, etc) not having dedicated DT/ACPI node to directly create
> interrupt mapping for standard local interrupt numbers defined by the
> RISC-V privileged specification.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/irq.h      |  2 ++
>  arch/riscv/kernel/irq.c           | 13 +++++++++++++
>  drivers/clocksource/timer-clint.c | 13 +++++++------
>  drivers/clocksource/timer-riscv.c | 11 ++---------
>  drivers/irqchip/irq-riscv-intc.c  | 12 ++++++++++--
>  drivers/irqchip/irq-sifive-plic.c | 19 +++++++++++--------
>  6 files changed, 45 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/irq.h 
> b/arch/riscv/include/asm/irq.h
> index e4c435509983..f85ebaf07505 100644
> --- a/arch/riscv/include/asm/irq.h
> +++ b/arch/riscv/include/asm/irq.h
> @@ -12,6 +12,8 @@
> 
>  #include <asm-generic/irq.h>
> 
> +extern struct fwnode_handle *riscv_intc_fwnode(void);
> +
>  extern void __init init_IRQ(void);
> 
>  #endif /* _ASM_RISCV_IRQ_H */
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index 7207fa08d78f..f2fed78ab659 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -7,9 +7,22 @@
> 
>  #include <linux/interrupt.h>
>  #include <linux/irqchip.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
>  #include <linux/seq_file.h>
>  #include <asm/smp.h>
> 
> +static struct fwnode_handle *intc_fwnode;
> +
> +struct fwnode_handle *riscv_intc_fwnode(void)
> +{
> +	if (!intc_fwnode)
> +		intc_fwnode = irq_domain_alloc_named_fwnode("RISCV-INTC");
> +
> +	return intc_fwnode;
> +}
> +EXPORT_SYMBOL_GPL(riscv_intc_fwnode);

Why is this created outside of the root interrupt controller driver?
Furthermore, why do you need to create a new fwnode the first place?
As far as I can tell, the INTC does have a node, and what you don't
have is the firmware linkage between PMU (an others) and the INTC.

what you should have instead is something like:

static struct fwnode_handle *(*__get_root_intc_node)(void);
struct fwnode_handle *riscv_get_root_intc_hwnode(void)
{
         if (__get_root_intc_node)
                 return __get_root_intc_node();

         return NULL;
}

and the corresponding registration interface.

But either way, something breaks: the INTC has one node per CPU, and
expect one irqdomain per CPU. Having a single fwnode completely breaks
the INTC driver (and probably the irqdomain list, as we don't check for
duplicate entries).

> diff --git a/drivers/irqchip/irq-riscv-intc.c 
> b/drivers/irqchip/irq-riscv-intc.c
> index b65bd8878d4f..26ed62c11768 100644
> --- a/drivers/irqchip/irq-riscv-intc.c
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -112,8 +112,16 @@ static int __init riscv_intc_init(struct 
> device_node *node,
>  	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
>  		return 0;
> 
> -	intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
> -					    &riscv_intc_domain_ops, NULL);
> +	/*
> +	 * Create INTC domain using a synthetic fwnode which will allow
> +	 * drivers (such as RISC-V SBI IPI driver, RISC-V timer driver,
> +	 * RISC-V PMU driver, etc) not having dedicated DT/ACPI node to
> +	 * directly create interrupt mapping for standard local interrupt
> +	 * numbers defined by the RISC-V privileged specification.
> +	 */
> +	intc_domain = irq_domain_create_linear(riscv_intc_fwnode(),
> +					       BITS_PER_LONG,
> +					       &riscv_intc_domain_ops, NULL);

This is what I'm talking about. It is simply broken. So either you don't
need a per-CPU node (and the DT was bad the first place), or you 
absolutely need
one (and the whole 'well-known/default domain' doesn't work at all).

Either way, this patch is plain wrong.


         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

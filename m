Return-Path: <SRS0=sGlk=O2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9EBC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 18:32:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F4952146F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Dec 2018 18:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q541vzXJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F4952146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wrAS3lqF4o0nWnM7LGmTqg2PyAdhD7oKp4JnJTnsDc=; b=q541vzXJAKepVN
	s2pqNqdHl7MrSbrB2NvUREM0NINrCKQEABeCoVjzytHbd5Alj7E5LTmgalzkTVd0tP2F2Xrjr+29f
	MCuitltYrheTc6lOUzYs1YDL1nZi8iFqer+B8IQE6R5npoFVMd/byrAXTp39hDjhmCv80SVhm9JJT
	QPFzsFT7o7Y9HsTlpUAyvpJ3KkZ6uN/vuij2w24VLXT6hVpRCf7A35nS+Kqiv0M4WfjYju8XA7tvP
	Q1DjbxlEVJoEFG5T6yr8Ddm0dDvngP5XbG+jjatvKEfaTfRiEBjucTzHm+p40n2qFr0WuAoKAgnei
	ITCWNb/KevwoQWmcpNXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYxgk-00061E-DO; Mon, 17 Dec 2018 18:32:22 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gYxgj-00060O-1Z; Mon, 17 Dec 2018 18:32:21 +0000
Date: Mon, 17 Dec 2018 10:32:20 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v3 6/6] irqchip: sifive-plic: Implement
 irq_set_affinity() for SMP host
Message-ID: <20181217183220.GE7086@infradead.org>
References: <20181130080207.20505-1-anup@brainfault.org>
 <20181130080207.20505-7-anup@brainfault.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181130080207.20505-7-anup@brainfault.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 30, 2018 at 01:32:07PM +0530, Anup Patel wrote:
> This patch provides irq_set_affinity() implementation for PLIC driver.
> It also updates irq_enable() such that PLIC interrupts are only enabled
> for one of CPUs specified in IRQ affinity mask.

But normally our affinity masks are that - masks of CPUs that can take
it.  It seems a bit odd to then just pick the first one, as this means
with default all-CPU masks we'll have all interrupts handled by the
first CPU only.


> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -106,14 +106,42 @@ static void plic_irq_toggle(const struct cpumask *mask, int hwirq, int enable)
>  
>  static void plic_irq_enable(struct irq_data *d)
>  {
> -	plic_irq_toggle(irq_data_get_affinity_mask(d), d->hwirq, 1);
> +	unsigned int cpu = cpumask_any_and(irq_data_get_affinity_mask(d),
> +					   cpu_online_mask);
> +	WARN_ON(cpu >= nr_cpu_ids);

I think this should be WARN_ON_ONCE and actually return instead of then
proceeding using the invalid cpu index. 

> +#ifdef CONFIG_SMP
static int plic_set_affinity(struct irq_data *d, const struct cpumask *mask_val,
> +			    bool force)
> +{
> +	unsigned int cpu;
> +
> +	if (!force)
> +		cpu = cpumask_any_and(mask_val, cpu_online_mask);
> +	else
> +		cpu = cpumask_first(mask_val);

maybe swap the two branches around to avoid the inversion of the force
flag?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFB8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 07:21:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97EAE610A6
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 07:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97EAE610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMJ2tMxGzo3IBfPBq7N12r0wl7uDXiL8BZuP5QDuSEQ=; b=it03J9gPbpzOP9SLgBO/27WS7G
	oLoT760zs8TKG0Xk+7C9kW6iYl0wOOsnxlkVtdKo0u4ZWuCKRpTIWReZcuAjk+hQV85nmOVSoyox4
	WKRQfrFoS1yZfJE/fuhr+rRdr9exDOoMFMXw4b66Ef0Y2plP4ICdL9VIuyzZ32LxMBOz9JnTVf/qL
	XQ+1OpqwwkdDe9TsrHxoAV6RbZ8rUpafVhFaUTKGdKKWWcNchROueZ97tNVWmwIIcGp2A+SvUcDUE
	9eteEoc8TlQpDHNIgDqtSrdNfovGxbyKQrwoBdbXZZqbsUn0H2/24oGBGbN26W/C4gMvGsI8jCQKs
	sHdm8crQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcMxZ-00ESNi-8l; Mon, 18 Oct 2021 07:21:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcMxW-00ESMI-Eg
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 07:21:24 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17BC860FDC;
 Mon, 18 Oct 2021 07:21:22 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mcMxT-00HTN0-TN; Mon, 18 Oct 2021 08:21:20 +0100
MIME-Version: 1.0
Date: Mon, 18 Oct 2021 08:21:19 +0100
From: Marc Zyngier <maz@kernel.org>
To: Samuel Holland <samuel@sholland.org>, guoren@kernel.org
Cc: anup@brainfault.org, atish.patra@wdc.com, tglx@linutronix.de,
 palmer@dabbelt.com, heiko@sntech.de, robh@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Guo Ren
 <guoren@linux.alibaba.com>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
In-Reply-To: <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-2-guoren@kernel.org>
 <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <f850af365f2ac77af79ec59f92e6434a@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: samuel@sholland.org, guoren@kernel.org, anup@brainfault.org,
 atish.patra@wdc.com, tglx@linutronix.de, palmer@dabbelt.com, heiko@sntech.de,
 robh@kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 guoren@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_002122_574968_023E26CE 
X-CRM114-Status: GOOD (  35.55  )
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

On 2021-10-18 06:17, Samuel Holland wrote:
> On 10/15/21 10:21 PM, guoren@kernel.org wrote:
>> From: Guo Ren <guoren@linux.alibaba.com>
>> 
>> 1) The irq_mask/unmask() is used by handle_fasteoi_irq() is mostly

Drop this useless numbering.

>> for ONESHOT irqs and there is no limitation in the RISC-V PLIC driver
>> due to use of irq_mask/unmask() callbacks. In fact, a lot of irqchip
>> drivers using handle_fasteoi_irq() also implement irq_mask/unmask().

This paragraph doesn't provide any useful information in the context
of this patch. That's at best cover-letter material.

>> 2) The C9xx PLIC does not comply with the interrupt claim/completion
>> process defined by the RISC-V PLIC specification because C9xx PLIC
>> will mask an IRQ when it is claimed by PLIC driver (i.e. readl(claim)
>> and the IRQ will be unmasked upon completion by PLIC driver (i.e.
>> writel(claim). This behaviour breaks the handling of IRQS_ONESHOT by
>> the generic handle_fasteoi_irq() used in the PLIC driver.
>> 
>> 3) This patch adds an errata fix for IRQS_ONESHOT handling on

s/fix/workaround/

>> C9xx PLIC by using irq_enable/disable() callbacks instead of
>> irq_mask/unmask().

 From Documentation/process/submitting-patches.rst:

<quote>
Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour.
</quote>

>> 
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Cc: Anup Patel <anup@brainfault.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Atish Patra <atish.patra@wdc.com>
>> 
>> ---
>> 
>> Changes since V4:
>>  - Update comment by Anup
>> 
>> Changes since V3:
>>  - Rename "c9xx" to "c900"
>>  - Add sifive_plic_chip and thead_plic_chip for difference
>> 
>> Changes since V2:
>>  - Add a separate compatible string "thead,c9xx-plic"
>>  - set irq_mask/unmask of "plic_chip" to NULL and point
>>    irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
>>  - Add a detailed comment block in plic_init() about the
>>    differences in Claim/Completion process of RISC-V PLIC and C9xx
>>    PLIC.
>> ---
>>  drivers/irqchip/irq-sifive-plic.c | 34 
>> +++++++++++++++++++++++++++++--
>>  1 file changed, 32 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/irqchip/irq-sifive-plic.c 
>> b/drivers/irqchip/irq-sifive-plic.c
>> index cf74cfa82045..960b29d02070 100644
>> --- a/drivers/irqchip/irq-sifive-plic.c
>> +++ b/drivers/irqchip/irq-sifive-plic.c
>> @@ -166,7 +166,7 @@ static void plic_irq_eoi(struct irq_data *d)
>>  	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
>>  }
>> 
>> -static struct irq_chip plic_chip = {
>> +static struct irq_chip sifive_plic_chip = {
>>  	.name		= "SiFive PLIC",
>>  	.irq_mask	= plic_irq_mask,
>>  	.irq_unmask	= plic_irq_unmask,
>> @@ -176,12 +176,32 @@ static struct irq_chip plic_chip = {
>>  #endif
>>  };
>> 
>> +/*
>> + * The C9xx PLIC does not comply with the interrupt claim/completion
>> + * process defined by the RISC-V PLIC specification because C9xx PLIC
>> + * will mask an IRQ when it is claimed by PLIC driver (i.e. 
>> readl(claim)
>> + * and the IRQ will be unmasked upon completion by PLIC driver (i.e.
>> + * writel(claim). This behaviour breaks the handling of IRQS_ONESHOT 
>> by
>> + * the generic handle_fasteoi_irq() used in the PLIC driver.
>> + */
>> +static struct irq_chip thead_plic_chip = {
>> +	.name		= "T-Head PLIC",
>> +	.irq_disable	= plic_irq_mask,
>> +	.irq_enable	= plic_irq_unmask,
>> +	.irq_eoi	= plic_irq_eoi,
>> +#ifdef CONFIG_SMP
>> +	.irq_set_affinity = plic_set_affinity,
>> +#endif
> I tested this, and it doesn't work. Without IRQCHIP_EOI_THREADED,
> .irq_eoi is called at the end of the hard IRQ handler. This unmasks the
> IRQ before the irqthread has a chance to run, so it causes an interrupt
> storm for any threaded level IRQ (I saw this happen for sun8i_thermal).
> 
> With IRQCHIP_EOI_THREADED, .irq_eoi is delayed until after the 
> irqthread
> runs. This is good. Except that the call to unmask_threaded_irq() is
> inside a check for IRQD_IRQ_MASKED. And IRQD_IRQ_MASKED will never be
> set because .irq_mask is NULL. So the end result is that the IRQ is
> never EOI'd and is masked permanently.
> 
> If you set .flags = IRQCHIP_EOI_THREADED, and additionally set 
> .irq_mask
> and .irq_unmask to a dummy function that does nothing, the IRQ core 
> will
> properly set/unset IRQD_IRQ_MASKED, and the IRQs will flow as expected.
> But adding dummy functions seems not so ideal, so I am not sure if this
> is the best solution.

This series is totally broken indeed, because it assumes that
enable/disable are a substitute to mask/unmask. Nothing could be further
from the truth. mask/unmask must be implemented, and enable/disable
supplement them if the HW requires something different at startup time.

If you have an 'automask' behaviour and yet the HW doesn't record this
in a separate bit, then you need to track this by yourself in the
irq_eoi() callback instead. I guess that you would skip the write to
the CLAIM register in this case, though I have no idea whether this 
breaks
the HW interrupt state or not.

There is an example of this in the Apple AIC driver.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

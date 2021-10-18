Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EFEC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 05:17:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E164960F23
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 05:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E164960F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kY4KXnQ1pjc0UkcRxPyQTC8YmiQCi4XiRfOEWV3LEoM=; b=GiWRnhgnnquSa5pWRuP5MEk6t5
	j/pGGrS5IvZsUGqURZ5uGg8ui/5Ftf+sxngkYEetTfLCdsxfK2iUxsHqcMEOahe6NNiAUG5tIKPyI
	lKkP/CoX0dZrDkOQ4Z6h2ChZDVOF73Wv1N4F83S5k31wL/rz751CTSSTlbLWOb8/8YBl9Ee7HXbN+
	nM7F3dILYOeBnDGxMX7ZlHv3Iu86R/QHG9fi6MYqjvWr36PMabF9gYZ1Zg6pvwqA7joeeXbRqq5Uq
	ydN97dtqMiKkiu4/v7Uc+q3aOvD5b3W2B4dFD87DK+joqyLbUk0XPRMo4sqp3Of9HTvx6570/yBfZ
	Co9QJeRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcL1m-00EBQM-BI; Mon, 18 Oct 2021 05:17:38 +0000
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcL1j-00EBOS-6w
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 05:17:36 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 947952B0118D;
 Mon, 18 Oct 2021 01:17:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 18 Oct 2021 01:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 to:cc:references:from:subject:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=9
 YkoD4PdwekwWd/mgjOWSIeRZK66Yv4uJGo/UC0l1Uk=; b=dh0+fsF9EWRzEBaCx
 FgOJHtVnFljMiw6UJSPyGWG+nbgaONZg0W82EYep1orekmQesYkdNxyRFbIAFzto
 3YAjbdzRsZ8BEUC5pjmOgKDfeyCRfOftCCvPXwfFu+LwfbN1Hll+Ye3xdm3hmj3Y
 g9UPk5eMXm5LqRyo+e8lOtm/62Kf17pChR2dTqhpWVuL+/NpYGZjPGbOjROtnXuS
 ATBdcFQ8Lf3n84aAobddauGbnr4A7Kpk7yK/N+umJsZrPG2ePKUkOHwikBU881IB
 pYbqGfYOtNVQoBjb65RUkQ3uHKf1av3i6NWqaI2OAT51643MPjsm/WV8hBa2Nkao
 phsKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=9YkoD4PdwekwWd/mgjOWSIeRZK66Yv4uJGo/UC0l1
 Uk=; b=bXHNcv7PuP7jRnDsNs06uCguh3ZhbG6RweK0kpQnY56iJYcE9CdTGsHq6
 RETy8rNDrZSRXip/LvkCYPwblva1fflF0E+AQGVWkIcHedpmjHWDpOz5Asux/wJa
 viJc6x0zOH23eZCXLOeCzOClhimFHsm6B0olVVgoPmuzK2T2A9mFOPFGPIW3HX9O
 nOI1rld4Df+JAAwqFfSP2/n8f8MIsdNGArX70RoIZx4bCBfMe2wt1Dw9lgiCSoH0
 gCpme3jws39dD7ovmRSExOTfqpOzVH9E6bH32VzczIyMbxiMayspURTc4WX3xGkA
 IT0mNsTAh+k6XkFRn/EhU2I6dwCMw==
X-ME-Sender: <xms:ZwNtYakAVsyvTGgnGJILLdchTK9zpradj8jEz5urRQjw6qWNypq5Bw>
 <xme:ZwNtYR06-LZIw894WmQ_9hsnpd-qFDGOCFKOz3MAEL3TbL86bsKXdyoiFeRVt_Uzk
 qoBWajuppqR4ukAig>
X-ME-Received: <xmr:ZwNtYYokA5yWabzIVMTqzUqltIHmpgzzxw5lg6-fZeHRyJtU2YqHB2lBJsKyej84yZ1DrzrEyS1B515bwVW0ah263fSGAD1ftyb3LjqXCb1e-hTsO0POARoZxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduledgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhepvddttdejieduudfgffevteekffegffeguddtgfefkeduvedukeff
 hedtfeevuedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:ZwNtYen2ReAAhu2qPa8wpNs4T_KSZON7J8juyEZqr-Qa0DZlVGicZg>
 <xmx:ZwNtYY07r0KBvxMBh8Y5wK3DFcEV4qUkPscjfdQG-uALASk7Qs6udg>
 <xmx:ZwNtYVul_4BI3uKzm1y1NrLBK9FyhpLybenHDrwzwu8iSCKKtIo-Dg>
 <xmx:aANtYeyjWtzri8-V0R-g7fFAsgRlluJkGWYWwzJ4aW0-NHVmP-3cRJHvWKY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Oct 2021 01:17:27 -0400 (EDT)
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com, heiko@sntech.de,
 robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-2-guoren@kernel.org>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH V4 1/3] irqchip/sifive-plic: Add thead,c900-plic support
Message-ID: <8be1bdbd-365d-cd28-79d7-b924908f9e39@sholland.org>
Date: Mon, 18 Oct 2021 00:17:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20211016032200.2869998-2-guoren@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211017_221735_308638_744B74E5 
X-CRM114-Status: GOOD (  35.04  )
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

On 10/15/21 10:21 PM, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> 1) The irq_mask/unmask() is used by handle_fasteoi_irq() is mostly
> for ONESHOT irqs and there is no limitation in the RISC-V PLIC driver
> due to use of irq_mask/unmask() callbacks. In fact, a lot of irqchip
> drivers using handle_fasteoi_irq() also implement irq_mask/unmask().
> 
> 2) The C9xx PLIC does not comply with the interrupt claim/completion
> process defined by the RISC-V PLIC specification because C9xx PLIC
> will mask an IRQ when it is claimed by PLIC driver (i.e. readl(claim)
> and the IRQ will be unmasked upon completion by PLIC driver (i.e.
> writel(claim). This behaviour breaks the handling of IRQS_ONESHOT by
> the generic handle_fasteoi_irq() used in the PLIC driver.
> 
> 3) This patch adds an errata fix for IRQS_ONESHOT handling on
> C9xx PLIC by using irq_enable/disable() callbacks instead of
> irq_mask/unmask().
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> 
> ---
> 
> Changes since V4:
>  - Update comment by Anup
> 
> Changes since V3:
>  - Rename "c9xx" to "c900"
>  - Add sifive_plic_chip and thead_plic_chip for difference
> 
> Changes since V2:
>  - Add a separate compatible string "thead,c9xx-plic"
>  - set irq_mask/unmask of "plic_chip" to NULL and point
>    irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
>  - Add a detailed comment block in plic_init() about the
>    differences in Claim/Completion process of RISC-V PLIC and C9xx
>    PLIC.
> ---
>  drivers/irqchip/irq-sifive-plic.c | 34 +++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index cf74cfa82045..960b29d02070 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -166,7 +166,7 @@ static void plic_irq_eoi(struct irq_data *d)
>  	writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
>  }
>  
> -static struct irq_chip plic_chip = {
> +static struct irq_chip sifive_plic_chip = {
>  	.name		= "SiFive PLIC",
>  	.irq_mask	= plic_irq_mask,
>  	.irq_unmask	= plic_irq_unmask,
> @@ -176,12 +176,32 @@ static struct irq_chip plic_chip = {
>  #endif
>  };
>  
> +/*
> + * The C9xx PLIC does not comply with the interrupt claim/completion
> + * process defined by the RISC-V PLIC specification because C9xx PLIC
> + * will mask an IRQ when it is claimed by PLIC driver (i.e. readl(claim)
> + * and the IRQ will be unmasked upon completion by PLIC driver (i.e.
> + * writel(claim). This behaviour breaks the handling of IRQS_ONESHOT by
> + * the generic handle_fasteoi_irq() used in the PLIC driver.
> + */
> +static struct irq_chip thead_plic_chip = {
> +	.name		= "T-Head PLIC",
> +	.irq_disable	= plic_irq_mask,
> +	.irq_enable	= plic_irq_unmask,
> +	.irq_eoi	= plic_irq_eoi,
> +#ifdef CONFIG_SMP
> +	.irq_set_affinity = plic_set_affinity,
> +#endif
I tested this, and it doesn't work. Without IRQCHIP_EOI_THREADED,
.irq_eoi is called at the end of the hard IRQ handler. This unmasks the
IRQ before the irqthread has a chance to run, so it causes an interrupt
storm for any threaded level IRQ (I saw this happen for sun8i_thermal).

With IRQCHIP_EOI_THREADED, .irq_eoi is delayed until after the irqthread
runs. This is good. Except that the call to unmask_threaded_irq() is
inside a check for IRQD_IRQ_MASKED. And IRQD_IRQ_MASKED will never be
set because .irq_mask is NULL. So the end result is that the IRQ is
never EOI'd and is masked permanently.

If you set .flags = IRQCHIP_EOI_THREADED, and additionally set .irq_mask
and .irq_unmask to a dummy function that does nothing, the IRQ core will
properly set/unset IRQD_IRQ_MASKED, and the IRQs will flow as expected.
But adding dummy functions seems not so ideal, so I am not sure if this
is the best solution.

Regards,
Samuel

> +};
> +
> +static struct irq_chip *def_plic_chip = &sifive_plic_chip;
> +
>  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
>  			      irq_hw_number_t hwirq)
>  {
>  	struct plic_priv *priv = d->host_data;
>  
> -	irq_domain_set_info(d, irq, hwirq, &plic_chip, d->host_data,
> +	irq_domain_set_info(d, irq, hwirq, def_plic_chip, d->host_data,
>  			    handle_fasteoi_irq, NULL, NULL);
>  	irq_set_noprobe(irq);
>  	irq_set_affinity(irq, &priv->lmask);
> @@ -390,5 +410,15 @@ static int __init plic_init(struct device_node *node,
>  	return error;
>  }
>  
> +static int __init thead_c900_plic_init(struct device_node *node,
> +		struct device_node *parent)
> +{
> +	def_plic_chip = &thead_plic_chip;
> +
> +	return plic_init(node, parent);
> +}
> +
>  IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
>  IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
> +IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", thead_c900_plic_init);
> +IRQCHIP_DECLARE(allwinner_sun20i_d1_plic, "allwinner,sun20i-d1-plic", thead_c900_plic_init);
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E583C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 04:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9nTP2vaSovnTKtVkTMuRFSnP7d6yXH/TGYTDuQ4kbHM=; b=SCfa3n8X8/eOm41V4E8tFrzSjl
	40mQx/1XHnR+dQJQNrcmoEjj83XWji5P6Ev0/rQ/m0caRBUX1/HOwdfTh6j0gZlw5v9Qi3GKGlYDt
	btkX/OzYcTPVkDZliGIgC5gI4+HWpeBzpG2rpCwhOJmo4oKggTwryfk3VtIbtgF/Y5aXUEHBqMTc0
	7UWefSqTANVKRLdfkD0S8sAYcsdSorY5kTtqUWv4dfIWXteq+laq5wSIhlXq5QaqUZ09muoQmlOKR
	jnlBZRUCwCrB+wwiRzx6L8D/KQazuQ3GsaL2YCXrI1V2mbuBDQ5o8FX/sBEgh1whmOwE3g/u0psv1
	4V8+Ra9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5gmt-00FRxF-RU; Mon, 27 Jun 2022 04:55:51 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5gmr-00FRu4-0K
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 04:55:51 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 876DF5C019E;
	Mon, 27 Jun 2022 00:55:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 27 Jun 2022 00:55:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1656305740; x=
	1656392140; bh=6wppfwUXcLefj2IFq/MV1ZMFMdYNVcYa9ZBLVFLqZ6U=; b=O
	+nRZcs9Xqp+wU+BuiFdA1LD0G0icoTxhBUhY28I38pBZEzaeUckVIVHgXGVWOorp
	4G2mClP6f/e7+WoTlVPgrvGq3Xh/UzHQAkKCiGsnCh2dhYzmaCcLOqcu6ETwoMI0
	FuFqbq7bzZyshdxUoxqSPsK0GodpeYjr1qdwCPZvjEvxB168ovlIQW0iIac0dN9y
	8baO/kujMXADJQanGTxd2EisfPOvweRHBY6o7YT0HT6tS9IE33Ht7JyH4AMgNQKa
	XODUpzEdRZFv5HZAlXL2vKlDKcXqpI6gSjDlG40wdJUNUFj3FGXZSvkng/+Etl9h
	7sXkNMJDCP0k2xF2GPmKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656305740; x=
	1656392140; bh=6wppfwUXcLefj2IFq/MV1ZMFMdYNVcYa9ZBLVFLqZ6U=; b=h
	LjVUnNm8xSuwo3w54ezfmMCyGbDRmlsExtStsLC3ZuJA4vBh2OVmRejHaqun/EAs
	rB3zHC+nuk91LAV8xo8RlzSIqopGr1/yIN/R3Apdiv+/uEz1wpTuYmLLX5FgCQVP
	NxduffUvpV37ankQQsrUEIyxy60pWK7SnIOQEaR+3VgYniJsUkFS0l57y43o0n3j
	LBRKhB67zpSVKmJe6HygV4gKh6SrnqnpoQmlP3KSf6z4UMOoi/kWPQ863ikzXQ+S
	2h40L4O6BytxfsVQpU5v7aTLfgRMTCKFbH+Iq6yNnuUEfwOLPABifBYPWUperDFk
	p+ai52kwm6ohHWshv7kOg==
X-ME-Sender: <xms:Szi5YtygINEKEFfEu3u3XY3Yw-Lun51HyPxcsKxF5cT9VACkdkYrFQ>
    <xme:Szi5YtRBMLYvsNvLep_C9ZqVKGN_Slcg0zTYjMlJ59V2QYAPmgl7ctfj7zWZ9uGlJ
    JZZhq6HxkY2dALMew>
X-ME-Received: <xmr:Szi5YnXXgGx0Zwy0uFdnQWrWwIOdLqA6-whjFmaXnhJqeIKeCW2YRvO_Fe11_3KOo2plEtYjzBmuYDdt2FfAqTYY72Ga1W2CE-W7aYAUe75SCQt7ymkmTvKX3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeggedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeeitedvhfejhfdvjefggeeutdegteejfffgvedtjedukefgueek
    tddtvdegfedtgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
    rghnugdrohhrgh
X-ME-Proxy: <xmx:Szi5YvhGLk_W4nUwJUizvwxPhQcqn-NoaOEln-Cemz9fjXOLW-78GQ>
    <xmx:Szi5YvDLWgOMv0CYYbbWqCKSZQOcJE-8RN1-fmmD-2SQxfCBF3mPIQ>
    <xmx:Szi5YoIRCaMxlQUENFg1aYCqGWfnRPVtMrurFH3G_el9MLwIdJHawA>
    <xmx:TDi5YvyL_nVWkUpIqG_R2cfewMRbJFe8EC5aGt1oKorinz6LagOnRQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jun 2022 00:55:38 -0400 (EDT)
Subject: Re: [PATCH v2 2/2] irqchip/sifive-plic: Add support for Renesas
 RZ/Five SoC
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sagar Kadam <sagar.kadam@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
References: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220626004326.8548-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <9c0e2b5f-c8ce-aba9-8b2b-6d79f9624a7f@sholland.org>
Date: Sun, 26 Jun 2022 23:55:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220626004326.8548-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_215549_180721_3ACFF574 
X-CRM114-Status: GOOD (  45.75  )
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

Hi Marc, Prabhakar,

On 6/25/22 7:43 PM, Lad Prabhakar wrote:
> The Renesas RZ/Five SoC has a RISC-V AX45MP AndesCore with NCEPLIC100. The
> NCEPLIC100 supports both edge-triggered and level-triggered interrupts. In
> case of edge-triggered interrupts NCEPLIC100 ignores the next interrupt
> edge until the previous completion message has been received and
> NCEPLIC100 doesn't support pending interrupt counter, hence losing the
> interrupts if not acknowledged in time.

Looking at its HDL[1], I realized the T-HEAD C9xx PLIC has the same issue. Its
pending transitions simplify to:

always @(posedge clock)
begin
  if (hreg_int_claim_kid_x)
    int_pending <= 1'b0;
  else if (
    // The input level is currently high
    int_vld &&
    // Either this is a rising edge,
    // or a level interrupt is being completed this clock cycle
    (!int_vld_ff || (!pad_plic_int_cfg_x && hreg_int_complete_kid_x)) &&
    // Either the interrupt is not currently being handled,
    // or it is being completed this clock cycle
    (!int_active || hreg_int_complete_kid_x)
  )
    int_pending <= 1'b1;
end

So an interrupt will never go pending while it is active. (And the hardware's
"level" mode does not clear the pending state when the IRQ is deasserted, but
that is a more minor issue.)

I am about to send a series implementing this fix for the C9xx PLIC as found in
the Allwinner D1, crediting you on the driver change -- hopefully that is okay
with you. I tried to make it easy for you to rebase your series on top. And I
think all of the comments should be resolved, including a couple of things
brought up below.

Regards,
Samuel

[1]:
https://github.com/T-head-Semi/openc906/blob/main/C906_RTL_FACTORY/gen_rtl/plic/rtl/plic_int_kid.v

> So the workaround for edge-triggered interrupts to be handled correctly
> and without losing is that it needs to be acknowledged first and then
> handler must be run so that we don't miss on the next edge-triggered
> interrupt.
> 
> This patch adds a new compatible string for Renesas RZ/Five SoC and adds
> support to change interrupt flow based on the interrupt type. It also
> implements irq_ack and irq_set_type callbacks.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> * Implemented IRQ flow as suggested by Marc
> 
> RFC-->v1:
> * Fixed review comments pointed by Geert
> * Dropped handle_fasteoi_ack_irq support as for the PLIC we need to
> claim the interrupt by reading the register and then acknowledge it.
> * Add a new chained handler for RZ/Five SoC.
> ---
>  drivers/irqchip/Kconfig           |  1 +
>  drivers/irqchip/irq-sifive-plic.c | 73 ++++++++++++++++++++++++++++++-
>  2 files changed, 72 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 4ab1038b5482..0245dcabe3e9 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -530,6 +530,7 @@ config SIFIVE_PLIC
>  	bool "SiFive Platform-Level Interrupt Controller"
>  	depends on RISCV
>  	select IRQ_DOMAIN_HIERARCHY
> +	select IRQ_FASTEOI_HIERARCHY_HANDLERS
>  	help
>  	   This enables support for the PLIC chip found in SiFive (and
>  	   potentially other) RISC-V systems.  The PLIC controls devices
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index bb87e4c3b88e..9fb9f62afb6a 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -60,10 +60,13 @@
>  #define	PLIC_DISABLE_THRESHOLD		0x7
>  #define	PLIC_ENABLE_THRESHOLD		0
>  
> +#define RENESAS_R9A07G043_PLIC		1
> +
>  struct plic_priv {
>  	struct cpumask lmask;
>  	struct irq_domain *irqdomain;
>  	void __iomem *regs;
> +	u8 of_data;
>  };
>  
>  struct plic_handler {
> @@ -81,6 +84,8 @@ static int plic_parent_irq __ro_after_init;
>  static bool plic_cpuhp_setup_done __ro_after_init;
>  static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
>  
> +static int plic_irq_set_type(struct irq_data *d, unsigned int type);
> +
>  static void __plic_toggle(void __iomem *enable_base, int hwirq, int enable)
>  {
>  	u32 __iomem *reg = enable_base + (hwirq / 32) * sizeof(u32);
> @@ -176,16 +181,61 @@ static void plic_irq_eoi(struct irq_data *d)
>  	}
>  }
>  
> +static void renesas_rzfive_plic_edge_irq_eoi(struct irq_data *data)
> +{
> +	/* We have nothing to do here */
> +}
> +
>  static struct irq_chip plic_chip = {
>  	.name		= "SiFive PLIC",
>  	.irq_mask	= plic_irq_mask,
>  	.irq_unmask	= plic_irq_unmask,
>  	.irq_eoi	= plic_irq_eoi,
> +	.irq_set_type	= plic_irq_set_type,
> +#ifdef CONFIG_SMP
> +	.irq_set_affinity = plic_set_affinity,
> +#endif
> +};
> +
> +static struct irq_chip renesas_rzfive_edge_plic_chip = {
> +	.name		= "Renesas RZ/Five PLIC",
> +	.irq_mask	= plic_irq_mask,
> +	.irq_unmask	= plic_irq_unmask,
> +	.irq_ack	= plic_irq_eoi,
> +	.irq_eoi	= renesas_rzfive_plic_edge_irq_eoi,
> +	.irq_set_type	= plic_irq_set_type,
>  #ifdef CONFIG_SMP
>  	.irq_set_affinity = plic_set_affinity,
>  #endif
>  };
>  
> +static int plic_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> +
> +	if (handler->priv->of_data != RENESAS_R9A07G043_PLIC)
> +		return 0;
> +
> +	switch (type) {
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		irq_set_chip_handler_name_locked(d, &renesas_rzfive_edge_plic_chip,
> +						 handle_fasteoi_ack_irq,
> +						 "Edge");

This has a problem: for handle_fasteoi_ack_irq, in the !irq_may_run path, only
.irq_eoi gets called, so the interrupt never gets "completed" (EOI'd).

It looks to me like handle_edge_irq is the right flow to use here, since it
unconditionally calls .irq_ack (either on its own or as part of of mask_ack_irq).

> +		break;
> +
> +	case IRQ_TYPE_EDGE_RISING:
> +		irq_set_chip_handler_name_locked(d, &plic_chip,
> +						 handle_fasteoi_irq,
> +						 "Level");
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
>  			      irq_hw_number_t hwirq)
>  {
> @@ -198,6 +248,19 @@ static int plic_irqdomain_map(struct irq_domain *d, unsigned int irq,
>  	return 0;
>  }
>  
> +static int plic_irq_domain_translate(struct irq_domain *d,
> +				     struct irq_fwspec *fwspec,
> +				     unsigned long *hwirq,
> +				     unsigned int *type)
> +{
> +	struct plic_priv *priv = d->host_data;
> +
> +	if (priv->of_data == RENESAS_R9A07G043_PLIC)
> +		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> +
> +	return irq_domain_translate_onecell(d, fwspec, hwirq, type);
> +}
> +
>  static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>  				 unsigned int nr_irqs, void *arg)
>  {
> @@ -206,7 +269,7 @@ static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>  	unsigned int type;
>  	struct irq_fwspec *fwspec = arg;
>  
> -	ret = irq_domain_translate_onecell(domain, fwspec, &hwirq, &type);
> +	ret = plic_irq_domain_translate(domain, fwspec, &hwirq, &type);
>  	if (ret)
>  		return ret;
>  
> @@ -220,7 +283,7 @@ static int plic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>  }
>  
>  static const struct irq_domain_ops plic_irqdomain_ops = {
> -	.translate	= irq_domain_translate_onecell,
> +	.translate	= plic_irq_domain_translate,
>  	.alloc		= plic_irq_domain_alloc,
>  	.free		= irq_domain_free_irqs_top,
>  };
> @@ -293,6 +356,11 @@ static int __init plic_init(struct device_node *node,
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	if (of_device_is_compatible(node, "renesas,r9a07g043-plic")) {
> +		priv->of_data = RENESAS_R9A07G043_PLIC;

This really should be a feature flag, passed in to plic_init, so it can be
enabled for whichever variants need it.

> +		plic_chip.name = "Renesas RZ/Five PLIC";
> +	}
> +
>  	priv->regs = of_iomap(node, 0);
>  	if (WARN_ON(!priv->regs)) {
>  		error = -EIO;
> @@ -411,5 +479,6 @@ static int __init plic_init(struct device_node *node,
>  }
>  
>  IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
> +IRQCHIP_DECLARE(renesas_r9a07g043_plic, "renesas,r9a07g043-plic", plic_init);
>  IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
>  IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init); /* for firmware driver */
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

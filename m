Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4D6C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 13:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EyIJw50QetKht6ihRG2djuOylgGh43UBtiRDK4k+G0=; b=OiEHU+JtHUvdRZ
	hF5MSNEUwSc1il+Acsp0RfzdsAxG5gjoHqWgb8fZ58govDNSrmVQESFVFbgxdM9w9jsNIKe4oOUeN
	UP4KuucQCQuTzfNOLRBWnd3uEOcCfYNgFE3vjoqnrkRqKzIvWrtp5MyS0Sex4qBJ7LgThwgiiPpGY
	LcI/wlLrnPimSvd+qLtSEyDy02ZwbOXztNBtj7Q9ZwuO2fGIBc1k9mffO0J4y6lOqHyQR2FVxfIpg
	rZIlPoFfsnNu2qI4WQAq30EeBL/B6o7L5J7/sN5BgUyk7PQ+NseUGRkh6IswunJPnsgeYkIgr2SJk
	B//ikt+lF192ERsHgCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcQMp-0000000EwwX-0HHX;
	Tue, 20 Feb 2024 13:41:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcQMk-0000000Ewut-2iyY;
	Tue, 20 Feb 2024 13:41:01 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708436457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RERjxgu8dqdL6aUr837paWAP3NAbeqyENHSlhkJ7sJc=;
	b=3FzLow9j1OLGi62YTb/xPduwMDyy2OL4cGeobfLs0rjJoz9MtV1ffOAl2Nm6oEofTI+AZ/
	laPmvLOjhmWOPp66A4oP4SaRk20DRrCXRSdloKczm21/m4pVcQeZbMfIgbzYU6ecHzRx/N
	xaJ58GwCWyWgLTunV9W+vWs3lE0HveIHwrHhSQgS7MwC3mkdCFuAT58+Yl9BcPQlOsIwqG
	oU0DQY84nC6P/tfXxBPSMBXGCgftWN31rL2SbuBOUhuMhklAeMXYLqIvM2bdXuZEVKzMj9
	8hzb5rSCiEIvqNksYGqAHzVtld/NVTbkYyPUQgTh/urBlEEzCUmvMBQwdxm2ag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708436457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RERjxgu8dqdL6aUr837paWAP3NAbeqyENHSlhkJ7sJc=;
	b=nKDEH5izTI650ZGE5NgM3CY9zurMtqKTsRCVaPMSnjgdPpTIKmVr94JSPJI6Q2nxyv+yXt
	EOLe514i4KzxWhDA==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v13 10/13] irqchip: Add RISC-V advanced PLIC driver for
 direct-mode
In-Reply-To: <20240220060718.823229-11-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-11-apatel@ventanamicro.com>
Date: Tue, 20 Feb 2024 14:40:56 +0100
Message-ID: <87zfvvgsnr.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_054058_848176_E780BB5F 
X-CRM114-Status: GOOD (  13.12  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 20 2024 at 11:37, Anup Patel wrote:
> +/*
> + * To handle an APLIC direct interrupts, we just read the CLAIMI register
> + * which will return highest priority pending interrupt and clear the
> + * pending bit of the interrupt. This process is repeated until CLAIMI
> + * register return zero value.
> + */
> +static void aplic_direct_handle_irq(struct irq_desc *desc)
> +{
> +	struct aplic_idc *idc = this_cpu_ptr(&aplic_idcs);
> +	struct irq_domain *irqdomain = idc->direct->irqdomain;
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	irq_hw_number_t hw_irq;
> +	int irq;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	while ((hw_irq = readl(idc->regs + APLIC_IDC_CLAIMI))) {
> +		hw_irq = hw_irq >> APLIC_IDC_TOPI_ID_SHIFT;
> +		irq = irq_find_mapping(irqdomain, hw_irq);
> +
> +		if (unlikely(irq <= 0))
> +			dev_warn_ratelimited(idc->direct->priv.dev,
> +					     "hw_irq %lu mapping not found\n", hw_irq);

Lacks brackets. See Documentation....

> +		else
> +			generic_handle_irq(irq);
> +	}
> +
> +static int aplic_direct_starting_cpu(unsigned int cpu)
> +{
> +	if (aplic_direct_parent_irq)
> +		enable_percpu_irq(aplic_direct_parent_irq,
> +				  irq_get_trigger_type(aplic_direct_parent_irq));

Ditto.

> +	return 0;
> +}

> +void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode)
> +{
> +	u32 val;
> +#ifdef CONFIG_RISCV_M_MODE
> +	u32 valH;

No camel case please.

> +
> +	if (msi_mode) {
> +		val = lower_32_bits(priv->msicfg.base_ppn);
> +		valH = FIELD_PREP(APLIC_xMSICFGADDRH_BAPPN, upper_32_bits(priv->msicfg.base_ppn));
> +		valH |= FIELD_PREP(APLIC_xMSICFGADDRH_LHXW, priv->msicfg.lhxw);
> +		valH |= FIELD_PREP(APLIC_xMSICFGADDRH_HHXW, priv->msicfg.hhxw);
> +		valH |= FIELD_PREP(APLIC_xMSICFGADDRH_LHXS, priv->msicfg.lhxs);
> +		valH |= FIELD_PREP(APLIC_xMSICFGADDRH_HHXS, priv->msicfg.hhxs);
> +		writel(val, priv->regs + APLIC_xMSICFGADDR);
> +		writel(valH, priv->regs + APLIC_xMSICFGADDRH);
> +	}

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

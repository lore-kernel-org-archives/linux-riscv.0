Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4FDC48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 21:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3YX26xVrdMvcsOGEkNnuVX3He4mS4422lzc80ETmI54=; b=Nv5jkXN162DDJK
	bAhV6THKWyHRj/NL3+pCz1RsbqiFnHIicn1fp+NaydjnbVxYi25BDB8yOAFspZl76U9oAhLQtmAY7
	FIwOyc06sO7P+nO9PakYan+M91/mkprB6Lb/JP7BGlUg5Ah7CEeVEabNKssfBrJ1pIJvPW+3WMZ56
	/Keh6gKkAq4IjSFmmSbrgHDcD6/gBMwqNJUzdtrJGwdHYvHoNU8qtKQ/9zg0SBwiQC4driI3S0Xwt
	JFpWJeNC8qYoNDJeDv0zDCiCdg6GnGroJRffOnFAurElVuRxljwANhfpZVTX6MmsBXc8atW4uj9gd
	IuMaIKRO7wO5qVZvrj+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb5NU-00000003kjD-1M05;
	Fri, 16 Feb 2024 21:04:12 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb5NN-00000003khQ-3K6I;
	Fri, 16 Feb 2024 21:04:09 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708117444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aPil28lXVu/5EuMTMJHAF2NuE7S20nDRKRUxcPw2x9A=;
	b=09tYLByROgD3bDLYAoILh20drVnloPdm8qHaCVHSa8YslAkk+vHe5GCMRqEPgmXapRXwp7
	haMLpBFhy7xqoxZcqtyf08Ob2ZjGCB9hHnx50L0qLeyomv7uwZvRwLH5+eCY0q2Kl3SlS8
	wMobBVNcDkGtumiuGA36kP32BR/n7Od+jQT19U9Hk6sC/MdjnDn31ojtc+Xf3o707kLWlw
	hJHDBj443oH4lxAbBirQ48SRQP4as2LG7Q3yN3yRzLeFpVFJFq5MfBoxZW7EXofWFsaCyK
	Owe5hwIfmeW55ddNzU4jbNTyfHMS0Z8JV9K5LFqZln4wBoUDprmPjYu1DfgFbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708117444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aPil28lXVu/5EuMTMJHAF2NuE7S20nDRKRUxcPw2x9A=;
	b=sTHsysm3f+56VNyke1nWTeQXTpJX/RT7U3ejiMXUtOjW65iwO9Uv6f1hJoBVOWapBEc/Mk
	3esMRQST3WxV1PBg==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v12 23/25] irqchip/riscv-aplic: Add support for MSI-mode
In-Reply-To: <20240127161753.114685-24-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-24-apatel@ventanamicro.com>
Date: Fri, 16 Feb 2024 22:04:03 +0100
Message-ID: <8734tsce9o.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_130406_015308_7A1A45D4 
X-CRM114-Status: GOOD (  10.29  )
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

On Sat, Jan 27 2024 at 21:47, Anup Patel wrote:
> We extend the existing APLIC irqchip driver to support MSI-mode for
> RISC-V platforms having both wired interrupts and MSIs.

We? Just s/We//

> +
> +static void aplic_msi_irq_unmask(struct irq_data *d)
> +{
> +	aplic_irq_unmask(d);
> +	irq_chip_unmask_parent(d);
> +}
> +
> +static void aplic_msi_irq_mask(struct irq_data *d)
> +{
> +	aplic_irq_mask(d);
> +	irq_chip_mask_parent(d);
> +}

Again asymmetric vs. unmask()

> +static void aplic_msi_irq_eoi(struct irq_data *d)
> +{
> +	struct aplic_priv *priv = irq_data_get_irq_chip_data(d);
> +	u32 reg_off, reg_mask;
> +
> +	/*
> +	 * EOI handling only required only for level-triggered
> +	 * interrupts in APLIC MSI mode.
> +	 */
> +
> +	reg_off = APLIC_CLRIP_BASE + ((d->hwirq / APLIC_IRQBITS_PER_REG) * 4);
> +	reg_mask = BIT(d->hwirq % APLIC_IRQBITS_PER_REG);
> +	switch (irqd_get_trigger_type(d)) {
> +	case IRQ_TYPE_LEVEL_LOW:
> +		if (!(readl(priv->regs + reg_off) & reg_mask))
> +			writel(d->hwirq, priv->regs + APLIC_SETIPNUM_LE);

A comment what this condition is for would be nice.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

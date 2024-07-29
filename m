Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650BBC3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vkvMAxdvQeKBccxaWW4WpO3k8kPkfMl3Yk0adgoErQ4=; b=UrwoHzTchRffLU
	64AiW7nXtM0dhexQtwsespiwgcZxG4qITwIyydpuwzPKltefW96TEQHXTH4BAwuvXzIlthj5eBzmG
	JT7UeGLnr9SzduI6Zy/LEfXhMOFpVGTtrxUNy26PHh3oBq21hHBJlG09NYskxNhCMG/WGVs5WlDGC
	YGyakHWtgkoo5RleW7Ghs1aspDAg2PQa6EV8wdBOeY+6eMG7bYBdFgHH7IcREgqjdinsCVnIdN/xX
	A2tqmFYOd7Cgee/kOnoVWsOge6+h579V+3+BZz9GhmpvhagAeDlwwwi8RSzDu1VFohCn+XSEN9LZ3
	kW4VjA4fRbuDvp6O6j6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNpR-0000000AwAf-26Dc;
	Mon, 29 Jul 2024 10:42:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYNol-0000000Aw5T-1RuW
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 10:42:08 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722249686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mUtMMscAr42lfvfhAq0RSAVA54FsqUgqvVfRKCjfdf4=;
	b=AaVgNFMkjq2oSMoVgoXhHi8LyJtviLBVSbxF2c2Onnr0cVbEL2dWnEIR8wazERXBh78577
	nlD5mJOiO1x63PUXZM29zP3SGWCXwRDmxql5v1QZ1eYu0PdiqE0jfP0SChD/DZJ6Q43mFz
	QP0/bQd97GSh9cM+Kln5SUjeBogFdcefq6cF/IfVsQbiAeHa8KHfONlqRrLrhwocxmxwdc
	Uc+v8LqB3ykRTd/5XPcIyhX88IBXcNtLHyxSO7gVC4YiIkD2lNw8cA3fbR7ohCt5csbYyQ
	5Ou4xHjkm38M8rBleSg8FasjB6rff/3oqorf4V2Httv+6BKZxQE6RfoD/iNrnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722249686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mUtMMscAr42lfvfhAq0RSAVA54FsqUgqvVfRKCjfdf4=;
	b=yoU0dLV8/0NscyaF1HrCpNKZHshPsYNYXrjGhuYCXTBhgY+EB4PNTIsqh8CYm5h5eH1ckX
	5msg3Z8GpP54PyBQ==
To: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org
Cc: conor@kernel.org, conor.dooley@microchip.com, Marc Zyngier
 <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC v7 3/6] irqchip: add mpfs gpio interrupt mux
In-Reply-To: <20240723-flatworm-cornflake-8023212f6584@wendy>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-flatworm-cornflake-8023212f6584@wendy>
Date: Mon, 29 Jul 2024 12:41:25 +0200
Message-ID: <87le1k8oq2.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_034127_547439_9FB49023 
X-CRM114-Status: GOOD (  16.09  )
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

On Tue, Jul 23 2024 at 12:27, Conor Dooley wrote:
> +
> +struct mpfs_irq_mux_bank_config {
> +	u32 mask;
> +	u8 shift;
> +};

Please see:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html

vs. coding style.

> +/*
> + * Returns an unsigned long, where a set bit indicates the corresponding
> + * interrupt is in non-direct/muxed mode for that bank/GPIO controller.
> + */
> +static inline unsigned long mpfs_irq_mux_get_muxed_irqs(struct mpfs_irq_mux *priv,
> +							unsigned int bank)
> +{
> +	unsigned long mux_config = priv->mux_config, muxed_irqs = -1;
> +	struct mpfs_irq_mux_bank_config bank_config = mpfs_irq_mux_bank_configs[bank];
> +
> +	/*
> +	 * If a bit is set in the mux, GPIO the corresponding interrupt from
> +	 * controller 2 is direct and that controllers 0 or 1 is muxed.

This is not a coherent sentence.

> +	 * Invert the bits in the configuration register, so that set bits
> +	 * equate to non-direct mode, for GPIO controller 2.
> +	 */
> +	if (bank == 2u)
> +		mux_config = ~mux_config;
> +

> +static int mpfs_irq_mux_nondirect_alloc(struct irq_domain *d, unsigned int virq,
> +					struct irq_fwspec *fwspec, struct mpfs_irq_mux *priv)
> +{
> +	unsigned int bank = fwspec->param[0] / MPFS_MAX_IRQS_PER_GPIO;
> +
> +	if (bank > 2)
> +		return -EINVAL;
> +
> +	priv->nondirect_irqchips[bank].domain = d;
> +
> +	irq_domain_set_hwirq_and_chip(d, virq, fwspec->param[0],
> +				      &mpfs_irq_mux_nondirect_irq_chip, priv);
> +	irq_set_chained_handler_and_data(virq, handle_untracked_irq,

Why does this use handle_untracked_irq()? This sets up a chained handler
but handle_untracked_irq() is a regular interrupt handler.

> +					 &priv->nondirect_irqchips[bank]);

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

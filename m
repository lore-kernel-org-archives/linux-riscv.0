Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BA5C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 13:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mACk3JsX6OlrxxQr175KGfuT1iqNLh5fvS3vbWixtMY=; b=imEGM0dtmI5+ZS
	a25xknwVoH0sXLmsbLDH9eTldOBtOq0KiNXQoSonG5ma20TsZalqB5hfZpJa0t4242BeDy54K0bXn
	wmaPyhW0p22MaacVtXHKBVD64ZrGhuSUgY8OiHGyudNNSti/WlZ2pockLV8AmVCM+eFT/cZwYBIJ2
	BYPh/MRcO5Cdw1vZXisN7ZlPWrGz/70jtoOVbhxUkbPxIQ7Ew+0tJMrDd1+U5EzmxP+Ver8hv90rh
	AOO6+DzH1htNx25PHvliyCgGUk1IjZEz3mwZK5GyVm8PhwAgp+FSZYOEyyYokHNU0oGteoEgEVvtN
	lz/IVsAD7IwNlp+XBhOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcQEb-0000000Euxr-4Aa1;
	Tue, 20 Feb 2024 13:32:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcQEX-0000000Euwb-2VsB;
	Tue, 20 Feb 2024 13:32:32 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708435947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nOnU4WzHsviBX/18xdq2+f5ceg73dYPZPqI4JOjdiVs=;
	b=zMPFh9lTXbL9VEGqZpNKX44wj0tcvXxI2s3z/FtNoX4KGUdv/UNtEZcuOZsNzCB+dFR8LM
	Bu0vTpFKOh5BcqW1+Wwm6sfazAkJHgrLUWbvcDXw6FT2yaGpPtqU2xjvR9ocI9A+IJ+ADX
	ZDYO2bwmCoMokPWYfr4axHj4Z9PstMT89FkfJjdJQER8n6SFyM6sJiWrKv8BMaoH+N9Ffy
	vVbIlUj52BCXP2XCOdC2HlhPaoqar+/QvyFiIlvxrtEdTGWIF3BCHhG6GlaH6c15Kl9GZJ
	DcrRA1nNb53VCJFBXlICgHFEyXMX4Fgy4Y4xyRofjzJS0CzIHzNE6t6bucEvkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708435947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nOnU4WzHsviBX/18xdq2+f5ceg73dYPZPqI4JOjdiVs=;
	b=cBJ5dQD19d4JkjP6smlml7Jvc4g/wZEyf/D7Z6rn7b0SmVP9aQxKoYXfJbz0KFx4hkC1RR
	QjsDXKDdHYW1XgCg==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v13 07/13] irqchip/riscv-imsic: Add device MSI domain
 support for platform devices
In-Reply-To: <20240220060718.823229-8-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-8-apatel@ventanamicro.com>
Date: Tue, 20 Feb 2024 14:32:27 +0100
Message-ID: <875xyji7mc.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_053229_799478_7CCA4B7D 
X-CRM114-Status: GOOD (  13.70  )
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
> +#ifdef CONFIG_SMP
> +static void imsic_msi_update_msg(struct irq_data *d, struct imsic_vector *vec)
> +{
> +	struct msi_msg msg[2] = { [1] = { }, };

That's a weird initializer and why do you need an array here?

       struct msi_msg msg = { };

Should be sufficient, no?

> +
> +	imsic_irq_compose_vector_msg(vec, msg);
> +	irq_data_get_irq_chip(d)->irq_write_msi_msg(d, msg);
> +}

> +static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
> +				  unsigned int nr_irqs, void *args)
> +{
> +	struct imsic_vector *vec;
> +
> +	/* Legacy-MSI or multi-MSI not supported yet. */

Coming back to my earlier question:

>> What's legacy MSI in that context?
>
> The legacy-MSI is the MSI support in PCI v2.2 where
> number of MSIs allocated by device were either 1, 2, 4,
> 8, 16, or 32 and the data written is <data_word> + <irqnum>.

You talk about PCI/MSI, where more than one vector is named
multi-MSI. Contrary to the modern v3.0 variant which is PCI/MSI-X.

So this should be "Multi-MSI is not supported yet", no?

> +	if (nr_irqs > 1)
> +		return -ENOTSUPP;
> +
> +	vec = imsic_vector_alloc(virq, cpu_online_mask);
> +	if (!vec)
> +		return -ENOSPC;
> +
> +	irq_domain_set_info(domain, virq, virq,
> +			    &imsic_irq_base_chip, vec,
> +			    handle_simple_irq, NULL, NULL);

Please utilize the 100 characters.

> +	irq_set_noprobe(virq);
> +	irq_set_affinity(virq, cpu_online_mask);
> +
> +	return 0;
> +}

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

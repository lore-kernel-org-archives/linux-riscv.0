Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B6BC48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 20:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tDyVcx8HPsXvXNL8TugKb+lXpMxxAsgdvOYoBbRgdI=; b=ey5TkmZ+wI9QwF
	DilFNSI/hwpX+QoOGjIV62FHkJJ2uqMhfd7/524U7kjY9NXLKJf0EqvvIoXe76ua3sT2sfMPy6IIs
	xSL76WQlWjZZS98z3fgyJXh4QOBp9M6+zxqYTp7SSg+zBfp1Xo7Zsnp9CINAi6/X8deJhPcJL8f/V
	odVzwL+puTQG7GdmZcV0U8vPm5AskKQZQTRFkmxp5E7V1GGSbuEem25NnuL8H/Fi6Q6HCpMn1pxnP
	PJ0XcW69E1jWIGTYHZMhf1kJhJeoGu1ecgN+0Zml1igAvTgOu4O1p316/i9b66rKkDM9McPj82eVL
	ndVuOG6+DSyEmR5+GDAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb5A7-00000003irC-3EcO;
	Fri, 16 Feb 2024 20:50:23 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb59x-00000003ipA-2AxQ;
	Fri, 16 Feb 2024 20:50:21 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708116611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MiNcyV6cuA2bEaO9pcAB0n2lgB9jPzAIMw9Rcvipmc=;
	b=IHl9ORoCzIXPoV6LABWoXZZeMThG96CoIBAQQ027SKATZEF6fDtWiZ+bTW4kAY8lPa27DL
	Eo4oTrIMRPfMUn84ibsglx2TpDLUv3K0b85/SkLNV1z+KsIqNFC7n0oEiMVgIxu87uW7SM
	gvkoKgs9jvUqkGi9yLTP7IWTTMRVxzGIMhqUE2sUzhakn9LAeuR0LULqYWkqRFEWvIasLv
	EUrOGTu9obLyx99g44CXIknPz4XE1ItIo56xNMLgDlofUnnpx2GK7jbWIUKgbTBEzntOXN
	hNXXARggoTtPidzCj/D3DyFrgc7uETU2mjLp+kb+XMhpRhqnHgMsYlzQq7YGSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708116611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MiNcyV6cuA2bEaO9pcAB0n2lgB9jPzAIMw9Rcvipmc=;
	b=UQZ1bO66o3f1pXva2taPAXPSKlpKkqJV7Ezk94IO8xuYtdCOe4hdhfUQZY8wcsbasEmJJ8
	cRHlhm4HLiyx/WCw==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v12 22/25] irqchip: Add RISC-V advanced PLIC driver for
 direct-mode
In-Reply-To: <20240127161753.114685-23-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-23-apatel@ventanamicro.com>
Date: Fri, 16 Feb 2024 21:50:10 +0100
Message-ID: <875xyocewt.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_125013_860600_5014B7F9 
X-CRM114-Status: GOOD (  14.08  )
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
> +static int aplic_direct_irqdomain_translate(struct irq_domain *d,
> +					 struct irq_fwspec *fwspec,
> +					 unsigned long *hwirq,
> +					 unsigned int *type)

Please align the arguments to the first argument of the first line and
use the 100 characters, i.e.

static int aplic_direct_irqdomain_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
					    unsigned long *hwirq, unsigned int *type)
{

All over the place.

> +{
> +	struct aplic_priv *priv = d->host_data;
> +
> +	return aplic_irqdomain_translate(fwspec, priv->gsi_base,
> +					 hwirq, type);
> +}
> +
> +static int aplic_direct_irqdomain_alloc(struct irq_domain *domain,
> +				     unsigned int virq, unsigned int nr_irqs,
> +				     void *arg)
> +{
> +	int i, ret;
> +	unsigned int type;
> +	irq_hw_number_t hwirq;
> +	struct irq_fwspec *fwspec = arg;
> +	struct aplic_priv *priv = domain->host_data;
> +	struct aplic_direct *direct =
> +			container_of(priv, struct aplic_direct, priv);

Variable ordering. Please make this consistent according to documentation.

> +	ret = aplic_irqdomain_translate(fwspec, priv->gsi_base,
> +					&hwirq, &type);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		irq_domain_set_info(domain, virq + i, hwirq + i,
> +				    &aplic_direct_chip, priv,
> +				    handle_fasteoi_irq, NULL, NULL);
> +		irq_set_affinity(virq + i, &direct->lmask);
> +		/* See the reason described in aplic_msi_irqdomain_alloc() */

I still have to understand that "reason". :)

> +		irq_set_status_flags(virq + i, IRQ_DISABLE_UNLAZY);
> +	}

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

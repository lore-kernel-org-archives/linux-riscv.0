Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4D4C71150
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oI8CgihAEDrpkxxaO9GcvycAN3h+c11mcTke+ylhvyk=; b=i/6KBDWQHo/BRA
	QsFVZdnppxmeKFUYtWu83vxGUzP2m7t2bSU4TXaAuBQfgZMUO8doX+Lz1xgd3+Dyb8dMmKPTI0ZAr
	4m/QRYS7fevHpwlqn3eLYD5Dd4PaR1ArV64tdO34Io6+igS8vBmCAmUlygfwA0bp/Gz8db0rBQukZ
	RMIqrVtGsQ0FN8p1ZuVZuTzzca3S70RGX6ShqGZgkal7AUppIezBEEfHrnJMaaS5fOWFMgHNLBx9h
	exXVpOEgMuDjyeTr8vYACEtcEy/c80oUr0ht03qGsvhEXST9wyYDmZCcHNOR+zinbLvnVFHNe11ZZ
	AIagrJ+cjs7r+Dm4ocmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8wx-0000000HFAE-1o3b;
	Fri, 13 Jun 2025 18:16:23 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6S7-0000000GtoC-2hZr
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 15:36:24 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749828982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kl/6EkwsEpqgCUA5P8YrSajTCAuCE0EZwn0pBl3AfZU=;
	b=VjSmWRHVDVG+nz4CIbGQz42VQ8TH8Zf+HXs9/usjzOzyXiZU30Ud+NRBCxX2CdNPI2b02h
	rIcBChhAX6q7ZcrJqPSJoY8NR/tx5a7vTK+mPgr6/4L9/Yfs7b4HTZALqmDspKJtoxKdua
	TM1HP0AeJAgcRicnW3CpQqT6X0v9XrOKOAKyve4+37Z3XiRY/RZBjijwLRx064XbT8x+c4
	aeeQtWhk+bLxYuyn2u5asQd6PZiUV2YkiOPRG/IES26cMEP8YhSr+nTbJz5OV8SKjQJLSB
	rWcnDK0p7W5kxLdDRZyolj4RM+ja7z2noCJQCr3WwudMFwe8WTM2jT8Wfzc2cA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749828982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kl/6EkwsEpqgCUA5P8YrSajTCAuCE0EZwn0pBl3AfZU=;
	b=8A83mT6RVGbiO5VdlNc0EukD58Nw0/Gu1WWIv8vYi7JqEy6zT0DWmxkUk6/xrizwGDAinN
	+4XaDX7rQr0YGpBQ==
To: Anup Patel <apatel@ventanamicro.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: Re: [PATCH v5 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
In-Reply-To: <20250611062238.636753-22-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-22-apatel@ventanamicro.com>
Date: Fri, 13 Jun 2025 17:36:21 +0200
Message-ID: <87frg3irgq.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_083623_822352_B8BCCE75 
X-CRM114-Status: GOOD (  17.34  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 11 2025 at 11:52, Anup Patel wrote:
> @@ -211,6 +213,9 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct rpmi_sysmsi_priv *priv;
> +	struct irq_domain *msi_domain;
> +	struct fwnode_handle *fwnode;
> +	u32 id;
>  	int rc;
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -241,6 +246,22 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
>  	}
>  	priv->nr_irqs = rc;
>  
> +	fwnode = dev_fwnode(dev);
> +	if (is_acpi_node(fwnode)) {
> +		u32 nr_irqs;
> +
> +		rc = riscv_acpi_get_gsi_info(fwnode, &priv->gsi_base, &id,
> +					     &nr_irqs, NULL);
> +		if (rc) {
> +			dev_err(dev, "failed to find GSI mapping\n");
> +			return rc;
> +		}
> +
> +		/* Update with actual GSI range */
> +		if (nr_irqs != priv->nr_irqs)
> +			riscv_acpi_update_gsi_range(priv->gsi_base, priv->nr_irqs);
> +	}
> +
>  	/* Set the device MSI domain if not available */
>  	if (!dev_get_msi_domain(dev)) {
>  		/*
> @@ -250,8 +271,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
>  		 * then we need to set it explicitly before using any platform
>  		 * MSI functions.
>  		 */
> -		if (dev_of_node(dev))
> +		if (is_of_node(fwnode)) {
>  			of_msi_configure(dev, dev_of_node(dev));
> +		} else if (is_acpi_device_node(fwnode)) {
> +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> +							      DOMAIN_BUS_PLATFORM_MSI);

msi_domain is only used here and so it should be declared in this scope
and not at the top of the function.

> +			dev_set_msi_domain(dev, msi_domain);
> +		}

Other than that:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

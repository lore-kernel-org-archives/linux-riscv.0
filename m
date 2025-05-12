Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F6BC3ABCC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXg6ydABjNWErKeME60V6cIsfxxAp2uV8/GmfyrxNDs=; b=TLL0hDq24In4/s
	baLLBo5b7QWggOc2ZLtvxj3G6REa59Bp0+wXoh3FGqTqtU+yvKSdv4FjK9KhxtB/MgeflbzeP/Ot7
	xPDf4jNfXy/x5BlQC8REZXRGNdhjivyAtqdLk+40/xW3HBhBY7Tz94hLUiBg2Yt76Y+pYsI8G+bk5
	KPjPVN5B+tc2ajws7V2RYov6VOyOkIw+H+bQGfmCNRHeoNlZbUc4le1wHD8qyTKO7WAKZcjvyeAdO
	1u3Sy28rW8QCUyRHS9LGspkMyLVi+9oMP8e4vQtm5yac2yA1BMWMzlhG7zexOdIUcX93676d73CEp
	sRc2tSfEajlPfmrjbLVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYU6-0000000AUJn-2gWE;
	Mon, 12 May 2025 19:06:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYLi-0000000AT9K-1e6e
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 18:58:03 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747076281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=It3ZkHrF/ybpGgsvf1rdjtabzTDxdApsEcKThmxYw7Q=;
	b=b8gt1O+Ubizxvw2Y7EAMWPCcwCLx+KT8VQOEQpRB3EvAazfK305nMMrvh5ASb+h7es1++S
	ZNV//+OoK4drZ2UUr1NXKNHCrdF5funXgqU4kgwBUKGRmbGz6mzzuHOagtRJLcwlXQsyE0
	kywSlW9ysEuKZCpNx6EClRXlEEetSvz/hTfy+aQVvinXq94scSlvJSumRK8RqT2jtgw3b1
	ZKJ/QrbWqgaIy4ERPNumhI9rxcC15FYxFqmeq3mBs/JTBEyu0lblB36ssUW/x+c0Mk+I/5
	Rdsy2yLhc/z0EMtSW87iqU9vR/TD6/By7nkMGu7kQ8Z8+uktQW2BuWevKAuVig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747076281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=It3ZkHrF/ybpGgsvf1rdjtabzTDxdApsEcKThmxYw7Q=;
	b=GqeDIyvt8XSPdNBmK6crbulLG7Eo1g4InPC38SDVZr0ZAaDfsB8Rx30LfMcntJlFopChS2
	RMcD7XFZEA+9wECw==
To: Anup Patel <apatel@ventanamicro.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: Re: [PATCH v3 13/23] irqchip: Add driver for the RPMI system MSI
 service group
In-Reply-To: <20250511133939.801777-14-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-14-apatel@ventanamicro.com>
Date: Mon, 12 May 2025 20:58:00 +0200
Message-ID: <87zffhk66f.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_115802_570909_4AFA87B9 
X-CRM114-Status: GOOD (  16.18  )
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

On Sun, May 11 2025 at 19:09, Anup Patel wrote:
> +static int rpmi_sysmsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rpmi_sysmsi_priv *priv;
> +	int rc;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	priv->dev = dev;
> +	platform_set_drvdata(pdev, priv);
> +
> +	/* Setup mailbox client */
> +	priv->client.dev		= priv->dev;
> +	priv->client.rx_callback	= NULL;
> +	priv->client.tx_block		= false;
> +	priv->client.knows_txdone	= true;
> +	priv->client.tx_tout		= 0;
> +
> +	/* Request mailbox channel */
> +	priv->chan = mbox_request_channel(&priv->client, 0);
> +	if (IS_ERR(priv->chan))
> +		return PTR_ERR(priv->chan);
> +
> +	/* Get number of system MSIs */
> +	rc = rpmi_sysmsi_get_num_msi(priv);
> +	if (rc < 1) {
> +		mbox_free_channel(priv->chan);
> +		return dev_err_probe(dev, -ENODEV, "No system MSIs found\n");
> +	}
> +	priv->nr_irqs = rc;
> +
> +	/* Set the device MSI domain if not available */
> +	if (!dev_get_msi_domain(dev)) {
> +		/*
> +		 * The device MSI domain for OF devices is only set at the
> +		 * time of populating/creating OF device. If the device MSI
> +		 * domain is discovered later after the OF device is created
> +		 * then we need to set it explicitly before using any platform
> +		 * MSI functions.
> +		 */
> +		if (is_of_node(dev_fwnode(dev)))
> +			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
> +
> +		if (!dev_get_msi_domain(dev))
> +			return -EPROBE_DEFER;

This leaks the channel.

> +	}
> +
> +	if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
> +					  &rpmi_sysmsi_template,
> +					  priv->nr_irqs, priv, priv))
> +		return dev_err_probe(dev, -ENOMEM, "failed to create MSI irq domain\n");

Ditto.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

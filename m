Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6235C00140
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjbMDRiYpgNcxVT/NEnyC6/I27/ur3sV/2YuDYKVNLM=; b=EgNTkb7i4OIHOH
	4jEDCv8NTfaJEK7Z/ZoFtGFvBP4o6QUC6xJBvr9eZn+fJCaPsvP1Mwb22mv8cTSEDgxfsIxgD87QO
	QQzZk/JDeq8LCyw5G5OXflYW5ZbLga+Ahm00fWkiE3x9Z/uV/B6etzoE+6A5RnEcJ+1QR9Zm3Zlzj
	kcGBi/AeD7q5LvQwvD4D7Y+r9pX9ntJja/PO/fX5iW0lJ9NrH9EgSS26kPdmuC6iVzjF+YfWlmpDf
	pKp1TP61Y6wDcz724h+BZ4nN3uvF4VPqnmC5pLixPQdECS/OS1/iWtkUHmL/byVVFZg3conIP/J+r
	VZ79gGYqSLYcFY09stIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQs8X-00DyQV-36; Wed, 24 Aug 2022 15:17:45 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQs8U-00DyMu-NL
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 15:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/DMqll070o37agD4hsR3LykeohYCZM/DzML8AAPUSfc=; b=tBUcZ/ifE4bkciSs79+f9iLzeP
	WojU4oFOqOdyCzMkrzzLtGQpH7LHlksMfsaPhAYRqLX9H1+KlQjZToDI0I63CaOLZW6+QaZFCfF4z
	jICERoj4yl9fQ4FAql0gXN7ig63gl7b1IRvz2dW+7YKU6wItW8iAx8dMQ9ngZksgBu9A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oQs83-00ESQC-Hb; Wed, 24 Aug 2022 17:17:15 +0200
Date: Wed, 24 Aug 2022 17:17:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "xiaowu.ding" <xiaowu.ding@jaguarmicro.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linux@armlinux.org.uk,
	nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH net-next] driver: cadence macb driver support acpi mode
Message-ID: <YwZA+1z7BDCXZn/3@lunn.ch>
References: <20220824121351.578-1-xiaowu.ding@jaguarmicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220824121351.578-1-xiaowu.ding@jaguarmicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_081742_782689_1613E7B7 
X-CRM114-Status: GOOD (  10.97  )
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

> +/* On ACPI platforms, clocks are controlled by firmware and/or
> + * ACPI, not by drivers.Need to store the clock value.
> + */
> +struct macb_acpi_config {
> +	u32 hclk_rate;          /* amba clock rate*/
> +	u32 pclk_rate;          /* amba apb clock rate*/
> +	u32 txclk_rate;         /* tx clock rate*/
> +	u32 rxclk_rate;         /* rx clock rate*/
> +	u32 tsuclk_rate;        /* tx clock rate*/
> +	bool acpi_enable;       /* is acpi or not */
> +};

> +static int macb_acpi_support(struct macb *bp)
> +{
> +	struct device *dev = &bp->pdev->dev;
> +	struct macb_acpi_config *config = &bp->acpicfg;
> +	int ret;
> +	u32 property;
> +
> +	/*acpi must be report the pclk*/
> +	property = 0;
> +	ret = device_property_read_u32(dev, MACB_SYSPCLOCK, &property);
> +	if (ret) {
> +		dev_err(dev, "unable to obtain %s property\n", MACB_SYSPCLOCK);
> +		return ret;
> +	}
> +
> +	config->pclk_rate = property;

It seems like you could make this simpler by just calling

clk_hw_register_fixed_rate(dev, "pclk", NULL, 0, property);

You then don't need to modify any other code with respect to clocks.
The clock does exist, so model it in the common clock framework.

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

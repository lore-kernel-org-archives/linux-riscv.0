Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F1AEE4993
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Aug 2023 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkkJNZFnnWMwm3l+CWGnVmLCFbv/UmvkL3g5emDecco=; b=SNYYDNVRDUcJiU
	zUyrJgilBgWM+sLhlsLZoFmB1+awbA96fSCWwDVCIXYWWn0ZtEmSFEMbu5YXsS5upYFS3FtwQWlrx
	QTR7sdJbB+5rNiC4YzEfO9mnhd7aWo4bBuTDS7fWQ3b86IRSTJ5SYHmOZUsj3tULUFCFhfLJajfXD
	+meNy28C6Bp3695qnFQGo7mg+ViI1PVuliX06Z6QXZvD1kJx7uQWDnffEL/t5bK8fdNp5+MhMfGmU
	liVdmeHm+D55V+dD+SZrg5QW/kJYEx9jVHbuHEHzubT628ltwFKy3hZp/IPDb671Lm0ZTQZi58w+D
	4rZc0mkrXgLol2NXZlSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXjpy-00C3v8-2F;
	Sun, 20 Aug 2023 14:55:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXjpv-00C3uE-0M;
	Sun, 20 Aug 2023 14:55:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B89E603F6;
	Sun, 20 Aug 2023 14:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F3B6C433C7;
	Sun, 20 Aug 2023 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692543322;
	bh=w9t1lG3nIXBHvGJOFxIpJq4TLZ70IlfQiWLNlqF02W8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ekBfJ0+wo7GE9ww/Hzr7migpmeBOCxbYh+5wGe3xcRIAW9YGmF1FMI3eIEIjQZbGF
	 912YIV2GmjsIB6QZr2nOHtX/1xUua+z44CFEzc9MgDSGOidS2N1rJXuQk78LM0/Ita
	 DXkyYlTjmYB40vAjqGiGhYu/jQ2i26gdBjSLZKl3bGJIieRn4kEfTN64y19ti2Odaf
	 H1Olju7qQUT1TwLbrQJNJfc09x8/ZpNKSIsHY6HZ8QhmdubyM7Me/Ch0PnfUfLZBql
	 CYp9aJsFg1z9vB7LIaPRb5bfJr9qdLt+0yjnIont/VADLcj/84Ug0/s1/s3YAOcSIn
	 jT+35py98HQkw==
Date: Sun, 20 Aug 2023 16:55:17 +0200
From: Simon Horman <horms@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 3/3] net: stmmac: add glue layer for T-HEAD
 TH1520 SoC
Message-ID: <ZOIpVVp+JUnbhFV1@vergenet.net>
References: <20230820120213.2054-1-jszhang@kernel.org>
 <20230820120213.2054-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230820120213.2054-4-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_075527_255332_939B81FB 
X-CRM114-Status: GOOD (  13.91  )
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

On Sun, Aug 20, 2023 at 08:02:13PM +0800, Jisheng Zhang wrote:
> Add dwmac glue driver to support the dwmac on the T-HEAD TH1520 SoC.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c

...

> +static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> +{
> +	struct thead_dwmac *dwmac = priv;
> +	struct plat_stmmacenet_data *plat = dwmac->plat;
> +	unsigned long rate;
> +	u32 div;
> +
> +	switch (plat->interface) {
> +	/* For MII, rxc/txc is provided by phy */
> +	case PHY_INTERFACE_MODE_MII:
> +		return;
> +
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		rate = clk_get_rate(plat->stmmac_clk);
> +		if (!rate || rate % GMAC_GMII_RGMII_RATE != 0 ||
> +		    rate % GMAC_MII_RATE != 0) {
> +			dev_err(dwmac->dev, "invalid gmac rate %ld\n", rate);
> +			return;
> +		}
> +
> +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV, GMAC_PLLCLK_DIV_EN, 0);
> +
> +		switch (speed) {
> +		case SPEED_1000:
> +			div = rate / GMAC_GMII_RGMII_RATE;
> +			break;
> +		case SPEED_100:
> +			div = rate / GMAC_MII_RATE;
> +			break;
> +		case SPEED_10:
> +			div = rate * 10 / GMAC_MII_RATE;
> +			break;
> +		default:
> +			dev_err(dwmac->dev, "invalid speed %u\n", speed);
> +			break;

Hi Jisheng Zhang,

In this case, div is not initialised, but it is used a few
lines below. Perhaps the function should return here?

As flagged by clang-16 (W=1) and Smatch.

> +		}
> +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> +				   GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));
> +
> +		regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
> +				   GMAC_PLLCLK_DIV_EN, GMAC_PLLCLK_DIV_EN);
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->interface);
> +		return;
> +	}
> +}

...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

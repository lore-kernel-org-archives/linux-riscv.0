Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4D6CDE02B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 18:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=enfvtJAc/8IPt9Vs8/ppPsJzX/0jQ+Ffneq3zbsKNKI=; b=1j/FRHdumiBNtn
	atmBocgQhOVLhiDOlyjeRMIFer9FZGno+6D+h4jvcgCby3vRz5u8uvF/9hV0QpkvXbI+cp9ThjLBU
	Z5winuc7hgEllLQfzE3RdprrQ2Uly+DruUGAMYQe9cuBY8ejMvT4dv58Wir1Qkm8/ZgQVARVW+kSI
	uEgzL85o8YTRbQ4b7TkGoS1vDgZSOHeK8nN2wvNmaddTiDsFrdRj84dz2MuloNBpHFijK9REUG1Kb
	AKJaPkGnwsOd2S9Xge6c9L4SvWpWLiSxzNNguJfqf5Ldd4tUzvk2H7BwHZyTxnWyHofekn/60I85d
	XCA1IoqFqDfUQDgGZGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sttJ2-000000098Nd-1fIL;
	Thu, 26 Sep 2024 18:33:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sttHq-000000098Ga-1UhA;
	Thu, 26 Sep 2024 18:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Rlnyig4rL5kmmCvrq8BcNJP6HH7YItNnR5m32oxXtkA=; b=0GffICltFZ/zEwUglhP4DXBSuj
	0vVCN2Ik8/1NhLytYwwZ673FN+KI0GCM1LMzZVAxUDAqo9eyL1uZDvfcK3s+AJQ0VJC/C0prNY18j
	jf8976MR7yA2oRt7/AzCvyQqU7boNqAYYztiOyrLRgDIPsw06JkTvOo3GCNRU1cTpLQg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sttHU-008P5w-EH; Thu, 26 Sep 2024 20:32:00 +0200
Date: Thu, 26 Sep 2024 20:32:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/3] net: stmmac: Add glue layer for T-HEAD TH1520 SoC
Message-ID: <a64eb154-30b9-4321-b3ef-2bcb1e861800@lunn.ch>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-2-f34f28ad1dc9@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926-th1520-dwmac-v2-2-f34f28ad1dc9@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_113222_424346_3FB11B43 
X-CRM114-Status: GOOD (  15.04  )
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

> +static int thead_dwmac_init(struct platform_device *pdev, void *priv)
> +{
> +	struct thead_dwmac *dwmac = priv;
> +	int ret;
> +
> +	ret = thead_dwmac_set_phy_if(dwmac->plat);
> +	if (ret)
> +		return ret;
> +
> +	ret = thead_dwmac_set_txclk_dir(dwmac->plat);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(dwmac->apb_regmap, GMAC_RXCLK_DELAY_CTRL,
> +			   GMAC_RXCLK_DELAY_VAL(dwmac->rx_delay));
> +	if (ret)
> +		return dev_err_probe(dwmac->dev, ret,
> +				     "failed to set GMAC RX clock delay\n");
> +
> +	ret = regmap_write(dwmac->apb_regmap, GMAC_TXCLK_DELAY_CTRL,
> +			   GMAC_TXCLK_DELAY_VAL(dwmac->tx_delay));
> +	if (ret)
> +		return dev_err_probe(dwmac->dev, ret,
> +				     "failed to set GMAC TX clock delay\n");
> +
> +	thead_dwmac_fix_speed(dwmac, SPEED_1000, 0);

Is this needed? I would expect this to be called when the PHY has link
and you know the link speed. So why set it here?

> +
> +	return thead_dwmac_enable_clk(dwmac->plat);
> +}
> +
> +static int thead_dwmac_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct stmmac_resources stmmac_res;
> +	struct plat_stmmacenet_data *plat;
> +	struct thead_dwmac *dwmac;
> +	void __iomem *apb;
> +	u32 delay;
> +	int ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to get resources\n");
> +
> +	plat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
> +				     "dt configuration failed\n");
> +
> +	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> +	if (!dwmac)
> +		return -ENOMEM;
> +
> +	/* hardware default is 0 for the rx and tx internal clock delay */
> +	dwmac->rx_delay = 0;
> +	dwmac->tx_delay = 0;
> +
> +	/* rx and tx internal delay properties are optional */
> +	if (!of_property_read_u32(np, "thead,rx-internal-delay", &delay)) {
> +		if (delay > GMAC_RXCLK_DELAY_MASK)
> +			dev_warn(&pdev->dev,
> +				 "thead,rx-internal-delay (%u) exceeds max (%lu)\n",
> +				 delay, GMAC_RXCLK_DELAY_MASK);
> +		else
> +			dwmac->rx_delay = delay;
> +	}
> +

So you keep going, with an invalid value? It is better to use
dev_err() and return -EINVAL. The DT write will then correct their
error when the device fails to probe.

If you decide to keep this... I'm not sure these properties are
needed.

> +MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");

Please add a second author, if you have taken over this driver.

       Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

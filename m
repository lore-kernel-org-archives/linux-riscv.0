Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7ACC3DA49
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 15:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6kj6VnM3eZye4d1Jxnzb4sPxQ7uA2Jg4f4Efb/bMPE=; b=cK3+srmgzkpHhq
	qiFaQoCIO61yXMbcKX3Dkz1aGVaS1GYlzAIRKaMabcIX7oe0neXMgbjrmYdzktm8KjGMrg8zn0jIp
	6sETIxlSNRbKe/PdB3l7M+7of25wpadTKdA+rnO6H495rqfyjE2lr8FVllVQGkCXWwh88bCVlB98B
	8GTGHA3m8N6OR7Ak0SXtChwCjIkcQoiN6Xexxq/87q3CFPW3WCE4vJh5YM29ZOidFDFisCxRZHUVS
	5f/0jufJYtMYhjJ7RecA02tbyrJ+uiaPm4QS7KZZxq1FA1KTbqfHq3oxAmTwbkquZbFRq44pScgih
	Y+9Ik72MIH8N55jcfGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT1bD-00000004jdj-20Hp;
	Sun, 14 Jul 2024 15:57:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT1as-00000004jZ8-25jx;
	Sun, 14 Jul 2024 15:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ladN6LLUy8M/kRB3T3QoGod7Oj8SG+/0YO1GOtFc7UE=; b=n0rTq7PJ8a8mBaG/5Dw1EJOJmf
	o/A75NFJSd5VsmYp2EpWm8mnKoAb0s6y/98tuEGYbcs3yHeyeMXrIIKY7gRfmFimHyf/lHjBADnZb
	bPIfP8GXGiAzjbBD9fCbMnSpwXCg/zXeZWDviShqK1255Deu9LtM+vuX+YALDGRr1eMs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sT1aN-002VjU-3z; Sun, 14 Jul 2024 17:56:27 +0200
Date: Sun, 14 Jul 2024 17:56:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Drew Fustini <drew@pdp7.com>
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
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC net-next 3/4] net: stmmac: add glue layer for T-HEAD
 TH1520 SoC
Message-ID: <7146ac63-f5fa-4335-9607-2cd38baca3ab@lunn.ch>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
 <20240713-thead-dwmac-v1-3-81f04480cd31@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240713-thead-dwmac-v1-3-81f04480cd31@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_085658_566376_E140F2DE 
X-CRM114-Status: GOOD (  14.80  )
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

> +static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
> +{
> +	struct thead_dwmac *dwmac = plat->bsp_priv;
> +	u32 txclk_dir;
> +
> +	switch (plat->mac_interface) {
> +	case PHY_INTERFACE_MODE_MII:
> +		txclk_dir = TXCLK_DIR_INPUT;
> +		break;
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		txclk_dir = TXCLK_DIR_OUTPUT;
> +		break;
> +	default:
> +		dev_err(dwmac->dev, "unsupported phy interface %d\n",
> +			plat->mac_interface);
> +		return -EINVAL;
> +	};
> +
> +	regmap_write(dwmac->apb_regmap, GMAC_TXCLK_OEN, txclk_dir);
> +
> +	return 0;

regmap_write() can fail. So it would be better to have

	return regmap_write(dwmac->apb_regmap, GMAC_TXCLK_OEN, txclk_dir);

Please consider this for all functions which a similar.

> +static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> +{
> +	struct thead_dwmac *dwmac = priv;
> +	struct plat_stmmacenet_data *plat = dwmac->plat;
> +	unsigned long rate;
> +	u32 div;

Reverse christmas tree please. You will need to move the plat
assignment into the body of the code.

> +static int thead_dwmac_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat;
> +	struct stmmac_resources stmmac_res;
> +	struct thead_dwmac *dwmac;
> +	struct device_node *np = pdev->dev.of_node;
> +	u32 delay_ps;
> +	int ret;
> +	void __iomem *apb;

np and apb should be earlier to keep with reverse christmas
tree. Please check and fix all functions.

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
> +	if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay_ps))
> +		dwmac->rx_delay = delay_ps;

> +#define  GMAC_RXCLK_DELAY_MASK		GENMASK(4, 0)

So this is a 5 bit value. You should perform a range check. So, do you
need to do some sort of conversion from picoseconds to register value?

> +MODULE_AUTHOR("T-HEAD");

Authors are people.

> +MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
> +MODULE_DESCRIPTION("T-HEAD dwmac platform driver");
> +MODULE_LICENSE("GPL");


    Andrew

---
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

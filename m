Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E5EC678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1MlNuVaX31DEZ9BrfO9Sqgs1JfvK8LVMSsQw79tdrY=; b=OC4uGZKqo/T9ud
	+kSIg/7Aay1ow3lM4EKlf+0CwITLN+q7P2vPLa35sQ6VxzEQ7SUXMPgNasY7LHZzZie/1StvIc6Yc
	0zMfUExy0XQ4yFXkabxFn/zrhKExz+71vhI8C5EAMFSvp+ojqVzFk7raA6Q/gVuKfe2d6clNDSImE
	u/zA+M1Bxh0VTGxu+9RbgeX/6qovH6uDS+fzGQUMqOIcM3NphhC+BemHpfOpPRJngC2yS5lkkox5Q
	gJJ0l4Zuvm2SqE0QMZOynpLGwZhBHVYBEoFPpKPWJE1pdMI9valZc1Xe2NKIWMYM6wgXLgBgUGbHQ
	i+sV06hZIBUBUZTfkC6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5as-006Sy7-Fa; Fri, 03 Mar 2023 13:37:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5ap-006SwU-Q0
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nJdYjZ/flzda0YlArkOtYMjVRR8m/ms+LEswZPJ9qM8=; b=PDJLJDcVtLOYepZxg3fZHfx3Sg
	Rei2dNhiy5la7EjHE9pCxYDyyBCM7gVpz3AvZVYaC8d/aWWWib4Y76vakuuZDbsW9ZRwSiGUZBmek
	zKofeo7MdKiA34PL7XxdTAl0eeaHPLrOK2askiMZFGE5wm1uaSy5K0+3ZHimZGGqCKp4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pY5ai-006O7k-AR; Fri, 03 Mar 2023 14:36:56 +0100
Date: Fri, 3 Mar 2023 14:36:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: Re: [PATCH v5 08/12] net: stmmac: starfive_dmac: Add phy interface
 settings
Message-ID: <ZAH3+BU5doYpOY6t@lunn.ch>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-9-samin.guo@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303085928.4535-9-samin.guo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053703_882015_F68DC450 
X-CRM114-Status: GOOD (  10.37  )
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

> +static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
> +{
> +	struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
> +	struct of_phandle_args args;
> +	struct regmap *regmap;
> +	unsigned int reg, mask, mode;
> +	int err;
> +
> +	switch (plat_dat->interface) {
> +	case PHY_INTERFACE_MODE_RMII:
> +		mode = MACPHYC_PHY_INFT_RMII;
> +		break;
> +
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +		mode = MACPHYC_PHY_INFT_RGMII;
> +		break;
> +
> +	default:
> +		dev_err(dwmac->dev, "Unsupported interface %d\n",
> +			plat_dat->interface);
> +	}

Please add a return -EINVAL;

> +
> +	err = of_parse_phandle_with_fixed_args(dwmac->dev->of_node,
> +					       "starfive,syscon", 2, 0, &args);
> +	if (err) {
> +		dev_dbg(dwmac->dev, "syscon reg not found\n");
> +		return -EINVAL;
> +	}
> +
> +	reg = args.args[0];
> +	mask = args.args[1];
> +	regmap = syscon_node_to_regmap(args.np);
> +	of_node_put(args.np);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return regmap_update_bits(regmap, reg, mask, mode << __ffs(mask));

This is a poor device tree binding. We generally don't allow bindings
which say put value X in register Y.

Could you add a table: interface mode, reg, mask? You can then do a
simple lookup based on the interface mode? No device tree binding
needed at all?

       Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

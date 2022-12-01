Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68164C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 15:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZ7aDHjJPfVcPKmrbrPq7GFohEasi2CXlBX+3fwUzkA=; b=DT7ENMQwCi09/X
	hRCexPpkfiHZUSYGzBNIcBG5SKA2XE1fZb4nPqq1r79Q7SgtqzXJqRND5tmEXvOpIjXboXtf47NNF
	G2cW3xF0UTXC8Gj6/CdjxmDJvjQX59uvjJVuPv3OGrKJlbqrACNhwcNPnBXG7hb6s3EvcAC/dD1/4
	caH8cmlU8/daq6Kbaxn3yhQNkR77MYb7UqTC4e4oLqEF9iuwP6xElGbu8bPGO5ay2y/hAHXJvKCFu
	Cr7b+o37sOTL0xIyyZzIt30MOKYoaDYla2xJmsjjgSVDC2FJCovbzi0H1mB1GIn0Z2W5Yj2ot6pi8
	9n8XvPJQ/ohFF3vbPYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0lg8-008IUJ-RL; Thu, 01 Dec 2022 15:40:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0lg5-008INY-Ko
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 15:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yHPLxsl9MbDFA39XedT/fNFDaxz54nP8D2zOAb8sz/Y=; b=HOkEQshoMedf4HqS3Ukvmb7K+s
	gwW38/teWeetRQOOIhMYIOOiEtsrCxnUVbRM/Ut3foVLKH3itDFBBjT+VrD1hOYz5nA/3ZmKwT2Og
	2BDROwc4BllYWFOQIo2R0/sqq72S6h8/P9lUZ+xMiTjv0oXtR/pSjYvej4dvISZ6Bcjw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1p0lfh-0044fZ-7W; Thu, 01 Dec 2022 16:40:21 +0100
Date: Thu, 1 Dec 2022 16:40:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yanhong Wang <yanhong.wang@starfivetech.com>
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
	Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v1 4/7] net: phy: motorcomm: Add YT8531 phy support
Message-ID: <Y4jK5VBVuAnl55Xz@lunn.ch>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-5-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221201090242.2381-5-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_074045_718914_C348D3AD 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

> +static const struct ytphy_reg_field ytphy_rxtxd_grp[] = {
> +	{ "rx_delay_sel", GENMASK(13, 10), 0x0 },
> +	{ "tx_delay_sel_fe", GENMASK(7, 4), 0xf },
> +	{ "tx_delay_sel", GENMASK(3, 0), 0x1 }
> +};
> +
> +static const struct ytphy_reg_field ytphy_txinver_grp[] = {
> +	{ "tx_inverted_1000", BIT(14), 0x0 },
> +	{ "tx_inverted_100", BIT(14), 0x0 },
> +	{ "tx_inverted_10", BIT(14), 0x0 }
> +};
> +
> +static const struct ytphy_reg_field ytphy_rxden_grp[] = {
> +	{ "rxc_dly_en", BIT(8), 0x1 }
> +};
> +
> +static int ytphy_config_init(struct phy_device *phydev)
> +{
> +	struct device_node *of_node;
> +	u32 val;
> +	u32 mask;
> +	u32 cfg;
> +	int ret;
> +	int i = 0;
> +
> +	of_node = phydev->mdio.dev.of_node;
> +	if (of_node) {
> +		ret = of_property_read_u32(of_node, ytphy_rxden_grp[0].name, &cfg);

You need to document the device tree binding.

Frank Sae always gets the locking wrong in this driver. Have you
tested your patch with lockdep enabled?

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

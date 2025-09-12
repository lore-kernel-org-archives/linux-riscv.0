Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98B4CA101F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 21:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hUCx4PAceTjr1YLhsq95nWica3KUt9yim/pX3rmkF/U=; b=nb/v38DCe+Oorj
	XTfnFvkQL3uzoiINuKDwe4o4ub2Essve35l8EBpf7sttncY4evf61qkMGM7i5lwotLQjSEPzDCWG8
	OIYbSE3JyT40HDMJKt4KKwuT5uviIni7iIxP9bf4hXhOgPKDZTCaibR9JnM5tCg1kreLO1G5A3biN
	iW82jPtNkkwDauGuDKUKB4N5kxYmlQIZP4XAB8uKOzSdYUr0NRl/ps12gC+mkGpPSydtEb2GHXL/i
	J4rNUTB7B4a4BNe6aegZjrhvezIdTUestCUlJk7d6QyhpZxM4hk+zy0BDvSUHDJqy9HfoFzVKh2tA
	mqNrOg2dced4kBxSSAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxB3I-0000000BZy2-3nnL;
	Fri, 12 Sep 2025 21:11:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxB3H-0000000BZx4-0UJT
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 21:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QBCLCLlywXx8YW7RXuqLyrr43UeZ+UsFUs7lNnZijXg=; b=zKdZd0GQBLbpnow2hX0mg4RLTq
	IgzOfcH2SoMMqohYhoOP+iTYzRufSCKI0yoRY30bhcZFvebxzYUMIMRYf0lxbN68kbmIb3/lqh8kC
	dUIwc8WCtQdH+K4F0ooyAVxJZBLfuNczJhEKI5WpqwFGevsxAh5FnJFIzzCyEiADL5qY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uxB2h-008G1n-Rx; Fri, 12 Sep 2025 23:10:51 +0200
Date: Fri, 12 Sep 2025 23:10:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <uwu@dram.page>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Simon Horman <horms@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH net-next v11 2/5] net: spacemit: Add K1 Ethernet MAC
Message-ID: <1f2887e4-2644-48a4-8171-98bd310d190f@lunn.ch>
References: <20250912-net-k1-emac-v11-0-aa3e84f8043b@iscas.ac.cn>
 <20250912-net-k1-emac-v11-2-aa3e84f8043b@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250912-net-k1-emac-v11-2-aa3e84f8043b@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_141127_154332_DB720B8E 
X-CRM114-Status: UNSURE (   8.87  )
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

> +static u32 emac_rd(struct emac_priv *priv, u32 reg)
> +{
> +	return readl(priv->iobase + reg);
> +}

> +static int emac_mii_read(struct mii_bus *bus, int phy_addr, int regnum)
> +{
> +	struct emac_priv *priv = bus->priv;
> +	u32 cmd = 0, val;
> +	int ret;
> +
> +	cmd |= FIELD_PREP(MREGBIT_PHY_ADDRESS, phy_addr);
> +	cmd |= FIELD_PREP(MREGBIT_REGISTER_ADDRESS, regnum);
> +	cmd |= MREGBIT_START_MDIO_TRANS | MREGBIT_MDIO_READ_WRITE;
> +
> +	emac_wr(priv, MAC_MDIO_DATA, 0x0);
> +	emac_wr(priv, MAC_MDIO_CONTROL, cmd);
> +
> +	ret = readl_poll_timeout(priv->iobase + MAC_MDIO_CONTROL, val,
> +				 !(val & MREGBIT_START_MDIO_TRANS), 100, 10000);
> +
> +	if (ret)
> +		return ret;
> +
> +	val = emac_rd(priv, MAC_MDIO_DATA);
> +	return val;

emac_rd() returns a u32. Is it guaranteed by the hardware that the
upper word is 0? Maybe this needs to be masked?

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

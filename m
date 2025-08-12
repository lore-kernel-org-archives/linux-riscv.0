Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF54DCA0ED1
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 03:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSSSF6mmvl6NlsMDWGwgZ2L8URLlHHPuH5eevhM8pdU=; b=HLA1fQT15ZYBv0
	C4vAbVSfgY01bE4MzSPpLoVjm1YEAZaAvqoJicNifBu98C8lDxWTXmqgshC2l4gnZZtxMtPkAyTL5
	KGyuoJzSWbYd/EYZEPx9zijmhl6HisxGPuztG3fu4rp7V/qgev9xSCnt0J50iBn4NrPNgDe68pDsh
	GWyMnb8YVzgLKu6ztF6YkQc091JNQNyNxrU3djwvyhKGtYnkCJA7LzfEZdFbAsdwrsznYq8M5x9rJ
	D9zOCVfE7gXx6/hKqKA0u5vWGLXq62/t8n3+zUFUdNqQKD1mFxKe8k274Cyc+4qY7jsZoqVberMBX
	LP2ia0Lps2D7Q3HiWrjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfys-00000009jrg-1nJq;
	Tue, 12 Aug 2025 03:47:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfxZ-00000009jft-16U2
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 03:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NIC/wkT8xDaIY7MD6UsDmD8NMUh6b3J8xBtXrNsXYKo=; b=NbYqq15F+k0PaYhFy5Hc5uGO1C
	F7j6cSoP/whS4817YNAeQ66fdIUeTNQC5RhDl3Pn2Jkb/dJBC2qkppaK48DJ9uxXASz28fYUHgXWy
	gKaqh24ZdeiIwvrmcSyoigBz47PTJ39VEZOCcGj6Fe050vKSBFjjU3uGdFI1pW5XiSuY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ulfxA-004PNl-P9; Tue, 12 Aug 2025 05:45:36 +0200
Date: Tue, 12 Aug 2025 05:45:36 +0200
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/5] net: spacemit: Add K1 Ethernet MAC
Message-ID: <ac9cce0b-d29e-499b-8a86-28979cd12fb5@lunn.ch>
References: <20250812-net-k1-emac-v5-0-dd17c4905f49@iscas.ac.cn>
 <20250812-net-k1-emac-v5-2-dd17c4905f49@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250812-net-k1-emac-v5-2-dd17c4905f49@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_204601_370218_D99CF1A7 
X-CRM114-Status: UNSURE (   8.97  )
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

> +static void emac_get_pause_stats(struct net_device *dev,
> +				 struct ethtool_pause_stats *pause_stats)
> +{
> +	struct emac_priv *priv = netdev_priv(dev);
> +	struct emac_hw_tx_stats *tx_stats;
> +	struct emac_hw_rx_stats *rx_stats;
> +
> +	tx_stats = &priv->tx_stats;
> +	rx_stats = &priv->rx_stats;
> +
> +	scoped_guard(spinlock_irqsave, &priv->stats_lock) {
> +		emac_stats_update(priv);
> +
> +		pause_stats->tx_pause_frames = tx_stats->tx_pause_pkts;
> +		pause_stats->rx_pause_frames = rx_stats->rx_pause_pkts;
> +	}
> +}

You have pause statistics, but not actual configuration of pause.

> +static void emac_adjust_link(struct net_device *dev)
> +{
> +	struct emac_priv *priv = netdev_priv(dev);
> +	struct phy_device *phydev = dev->phydev;
> +	u32 ctrl;

Normally the adjust_link callback you configure the hardware with the
result of pause negotiation.

> +/* Called when net interface is brought up. */
> +static int emac_open(struct net_device *ndev)
> +{
> +	struct emac_priv *priv = netdev_priv(ndev);
> +	struct device *dev = &priv->pdev->dev;
> +
> +	int ret;

Extra blank line.


    Andrew

---
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

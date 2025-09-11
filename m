Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73660CA1016
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15TAW8BD5lk7VQpRZA3WfXyfzWZh8tGpeEICeiC6lkc=; b=UiSjGc0gxUzEyM
	XhL8EbBjHf81htq2mdrNqGo3VD6SPITPIkLZ2smUfw723niupXtq4AJxdcucKIHkzgjkiUG5JrnSv
	kPVFeAqafiriOeWthAL3ekwZeA3NxqObXQq0wWbASGINL0lFwCebGZKGrO68hlcTurppCirz9/ChT
	lubt/KykRfAME1bA/hpI+eBl6WegLUp2NkQuE0Wv689lxibiIRvSMcRvv9mmzoU58eKUdOBMtZ0J5
	386XWrEFSEu+BRwBVnzF6qsnB6HezmoeRpKfJem+W4G3H7X9zf/LBV8BjmkYNPLjtcFOLxgU3mA45
	K6KCw8wTwoKmdOe+Ne2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdqg-00000002C0B-4A8P;
	Thu, 11 Sep 2025 09:44:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdqe-00000002Byz-1z7P
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 09:44:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B37CB43AFC;
	Thu, 11 Sep 2025 09:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B4EC4CEF0;
	Thu, 11 Sep 2025 09:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757583851;
	bh=kV7vZm9Eyd7Ie8xphsJvcVh9Ceje97yHegYdpuD0swc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lYwaHgnRT+GFwqcavqxcw9A4C7X2fUz/eMmP2CAjUY9KxbeQ4TQg5XKYtWvKFkfyW
	 NvzZTzaT2zvGhYjMljGyoHNlO5lt6yuSaoE8hSreAlQY/ZdNbIMxpPL4U62k4I2IXH
	 a0NaZjV/Xa3AKAGw1spn5xg5qN6cz6YVhuojI+EWHls+w6rjRxpysYPv9GYSRxTFpJ
	 0xosjezjr2D/5fTo2RQaCOqOFYY+vaxbSKdL+zm7IH3+oksSJ5kBksETELZcCVyPPR
	 1dxuZOlSmTcmQWLWGXmHVez01boMB1HTG7E+YdgCxqTH/Z4IfoWS6fixP0yFukMD0X
	 yil8bQMqkS20g==
Date: Thu, 11 Sep 2025 10:44:04 +0100
From: Simon Horman <horms@kernel.org>
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH net-next v10 2/5] net: spacemit: Add K1 Ethernet MAC
Message-ID: <20250911094404.GE30363@horms.kernel.org>
References: <20250908-net-k1-emac-v10-0-90d807ccd469@iscas.ac.cn>
 <20250908-net-k1-emac-v10-2-90d807ccd469@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250908-net-k1-emac-v10-2-90d807ccd469@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_024412_554079_2FA14064 
X-CRM114-Status: GOOD (  33.53  )
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

On Mon, Sep 08, 2025 at 08:34:26PM +0800, Vivian Wang wrote:
> The Ethernet MACs found on SpacemiT K1 appears to be a custom design
> that only superficially resembles some other embedded MACs. SpacemiT
> refers to them as "EMAC", so let's just call the driver "k1_emac".
> 
> Supports RGMII and RMII interfaces. Includes support for MAC hardware
> statistics counters. PTP support is not implemented.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>
> Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  drivers/net/ethernet/Kconfig            |    1 +
>  drivers/net/ethernet/Makefile           |    1 +
>  drivers/net/ethernet/spacemit/Kconfig   |   29 +
>  drivers/net/ethernet/spacemit/Makefile  |    6 +
>  drivers/net/ethernet/spacemit/k1_emac.c | 2156 +++++++++++++++++++++++++++++++

This is a large patch, so I'm sure I've missed some things.
But, overall, I think this is coming together.
Thanks for your recent updates.

As the Kernel Patch Robot noticed a problem,
I've provided some minor feedback for your consideration.

...

> +static void emac_wr(struct emac_priv *priv, u32 reg, u32 val)
> +{
> +	writel(val, priv->iobase + reg);
> +}
> +
> +static int emac_rd(struct emac_priv *priv, u32 reg)

nit: maybe u32 would be a more suitable return type.

> +{
> +	return readl(priv->iobase + reg);
> +}

...

> +static int emac_alloc_tx_resources(struct emac_priv *priv)
> +{
> +	struct emac_desc_ring *tx_ring = &priv->tx_ring;
> +	struct platform_device *pdev = priv->pdev;
> +	u32 size;
> +
> +	size = sizeof(struct emac_tx_desc_buffer) * tx_ring->total_cnt;
> +
> +	tx_ring->tx_desc_buf = kzalloc(size, GFP_KERNEL);

nit: I think you can use kcalloc() here.

> +	if (!tx_ring->tx_desc_buf)
> +		return -ENOMEM;
> +
> +	tx_ring->total_size = tx_ring->total_cnt * sizeof(struct emac_desc);
> +	tx_ring->total_size = ALIGN(tx_ring->total_size, PAGE_SIZE);
> +
> +	tx_ring->desc_addr = dma_alloc_coherent(&pdev->dev, tx_ring->total_size,
> +						&tx_ring->desc_dma_addr,
> +						GFP_KERNEL);
> +	if (!tx_ring->desc_addr) {
> +		kfree(tx_ring->tx_desc_buf);
> +		return -ENOMEM;
> +	}
> +
> +	tx_ring->head = 0;
> +	tx_ring->tail = 0;
> +
> +	return 0;
> +}

...

> +static int emac_alloc_rx_resources(struct emac_priv *priv)
> +{
> +	struct emac_desc_ring *rx_ring = &priv->rx_ring;
> +	struct platform_device *pdev = priv->pdev;
> +	u32 buf_len;
> +
> +	buf_len = sizeof(struct emac_rx_desc_buffer) * rx_ring->total_cnt;
> +
> +	rx_ring->rx_desc_buf = kzalloc(buf_len, GFP_KERNEL);

Ditto.

> +	if (!rx_ring->rx_desc_buf)
> +		return -ENOMEM;
> +
> +	rx_ring->total_size = rx_ring->total_cnt * sizeof(struct emac_desc);
> +
> +	rx_ring->total_size = ALIGN(rx_ring->total_size, PAGE_SIZE);
> +
> +	rx_ring->desc_addr = dma_alloc_coherent(&pdev->dev, rx_ring->total_size,
> +						&rx_ring->desc_dma_addr,
> +						GFP_KERNEL);
> +	if (!rx_ring->desc_addr) {
> +		kfree(rx_ring->rx_desc_buf);
> +		return -ENOMEM;
> +	}
> +
> +	rx_ring->head = 0;
> +	rx_ring->tail = 0;
> +
> +	return 0;
> +}

...

> +static int emac_mii_read(struct mii_bus *bus, int phy_addr, int regnum)
> +{
> +	struct emac_priv *priv = bus->priv;
> +	u32 cmd = 0, val;
> +	int ret;
> +
> +	cmd |= phy_addr & 0x1F;
> +	cmd |= (regnum & 0x1F) << 5;

nit: I think this could benefit from using FIELD_PREP
     Likewise for similar patterns in this patch.

> +	cmd |= MREGBIT_START_MDIO_TRANS | MREGBIT_MDIO_READ_WRITE;
> +
> +	emac_wr(priv, MAC_MDIO_DATA, 0x0);
> +	emac_wr(priv, MAC_MDIO_CONTROL, cmd);
> +
> +	ret = readl_poll_timeout(priv->iobase + MAC_MDIO_CONTROL, val,
> +				 !((val >> 15) & 0x1), 100, 10000);
> +
> +	if (ret)
> +		return ret;
> +
> +	val = emac_rd(priv, MAC_MDIO_DATA);
> +	return val;
> +}

...

> +/*
> + * Even though this MAC supports gigabit operation, it only provides 32-bit
> + * statistics counters. The most overflow-prone counters are the "bytes" ones,
> + * which at gigabit overflow about twice a minute.
> + *
> + * Therefore, we maintain the high 32 bits of counters ourselves, incrementing
> + * every time statistics seem to go backwards. Also, update periodically to
> + * catch overflows when we are not otherwise checking the statistics often
> + * enough.
> + */
> +
> +#define EMAC_STATS_TIMER_PERIOD		20
> +
> +static int emac_read_stat_cnt(struct emac_priv *priv, u8 cnt, u32 *res,
> +			      u32 control_reg, u32 high_reg, u32 low_reg)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/* The "read" bit is the same for TX and RX */
> +
> +	val = MREGBIT_START_TX_COUNTER_READ | cnt;
> +	emac_wr(priv, control_reg, val);
> +	val = emac_rd(priv, control_reg);
> +
> +	ret = readl_poll_timeout_atomic(priv->iobase + control_reg, val,
> +					!(val & MREGBIT_START_TX_COUNTER_READ),
> +					100, 10000);
> +
> +	if (ret) {
> +		netdev_err(priv->ndev, "Read stat timeout\n");
> +		return ret;
> +	}
> +
> +	*res = emac_rd(priv, high_reg) << 16;
> +	*res |= (u16)emac_rd(priv, low_reg);

nit: I think lower_16_bits() and lower_16_bits() would be appropriate here.

> +
> +	return 0;
> +}

...

> +static void emac_update_counter(u64 *counter, u32 new_low)
> +{
> +	u32 old_low = (u32)*counter;
> +	u64 high = *counter >> 32;

Similarly, lower_32_bits() and upper_32_bits here.

> +
> +	if (old_low > new_low) {
> +		/* Overflowed, increment high 32 bits */
> +		high++;
> +	}
> +
> +	*counter = (high << 32) | new_low;
> +}
> +
> +static void emac_stats_update(struct emac_priv *priv)
> +{
> +	u64 *tx_stats_off = (u64 *)&priv->tx_stats_off;
> +	u64 *rx_stats_off = (u64 *)&priv->rx_stats_off;
> +	u64 *tx_stats = (u64 *)&priv->tx_stats;
> +	u64 *rx_stats = (u64 *)&priv->rx_stats;

nit: I think it would be interesting to use a union containing
     1. the existing tx/rx stats struct and 2. an array of u64.
     This may allow avoiding this cast. Which seems nice to me.
     But YMMV.

> +	u32 i, res;
> +
> +	assert_spin_locked(&priv->stats_lock);
> +
> +	if (!netif_running(priv->ndev) || !netif_device_present(priv->ndev)) {
> +		/* Not up, don't try to update */
> +		return;
> +	}
> +
> +	for (i = 0; i < sizeof(priv->tx_stats) / sizeof(*tx_stats); i++) {
> +		/*
> +		 * If reading stats times out, everything is broken and there's
> +		 * nothing we can do. Reading statistics also can't return an
> +		 * error, so just return without updating and without
> +		 * rescheduling.
> +		 */
> +		if (emac_tx_read_stat_cnt(priv, i, &res))
> +			return;
> +
> +		/*
> +		 * Re-initializing while bringing interface up resets counters
> +		 * to zero, so to provide continuity, we add the values saved
> +		 * last time we did emac_down() to the new hardware-provided
> +		 * value.
> +		 */
> +		emac_update_counter(&tx_stats[i], res + (u32)tx_stats_off[i]);

nit: maybe lower_32_bits(tx_stats_off[i]) ?

> +	}
> +
> +	/* Similar remarks as TX stats */
> +	for (i = 0; i < sizeof(priv->rx_stats) / sizeof(*rx_stats); i++) {
> +		if (emac_rx_read_stat_cnt(priv, i, &res))
> +			return;
> +		emac_update_counter(&rx_stats[i], res + (u32)rx_stats_off[i]);

Likewise, here for rx_stats_off[i].

> +	}
> +
> +	mod_timer(&priv->stats_timer, jiffies + EMAC_STATS_TIMER_PERIOD * HZ);
> +}

...

> +static u64 emac_get_stat_tx_dropped(struct emac_priv *priv)
> +{
> +	u64 result;
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		result += READ_ONCE(per_cpu(*priv->stat_tx_dropped, cpu));
> +	}

nit: no need for {} here ?

> +
> +	return result;
> +}

...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68173CA0FED
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 19:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrfU4R0x/AM2+V7KqMxxGvm6DKSwVfM3fGftVKEV2W0=; b=Ot6x6FVRPdxUdF
	HtlLEUdQpjtNex6iHy4WDoZKNZaaA7IzZnsOlwDrHNOr221W5XAQ/tHLV44eSccoN7Xh3rxZGo/6V
	xE6TzKVg3noaZ3kaYBu8uGGOwRgcJjCgCUFUA26yckYgNgLl/UpmIzemDwZ8qzwajnIOl0B7Ma7qn
	8JWWxzawmREbNDtO8FgOq5aVnWFLxlxcV7CDm2HnDr+BTH2kXCBBeNqQFjuHYcK+oo493Xb0MJ4mW
	kGM5MHgL9LjvBFVTQrw4/RpslRq/K3G4bS6L+mOApNoxWMCGk1tay9iTrNDVrbtrz4e7BEYg79TE+
	WZPqs5z+x2Nrj04BhpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc86-000000049iT-0xJu;
	Fri, 05 Sep 2025 19:29:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYSy-00000002nOc-11ec
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 15:35:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9A4F444C1;
	Fri,  5 Sep 2025 15:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC64C4CEF1;
	Fri,  5 Sep 2025 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757086507;
	bh=Dd9GrN9GAAxETey0gekWGcwpoSTvYJkigJI730T+I/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CIOs0MwUE2I3vXSEEPPTN+UByCEoKcgiRiHDw6TewSKVGn4/U8x5RRsuDen7Pv75K
	 K9i75Y8ZRfml3R3Q1JnpNWMYn34xSqNuDVLpxxgG5HxeJe23vnQtFVTNanWHk41xRo
	 dn94M2R3O7wAFnCVyCqxqFnWmwNKCJzlhT7uNvn71z5+bXgFxeBmpxwsnmVCJVGXJ0
	 M3vbD4qErghqHC6JQSa3SvMb/rVimU6/KS1ERkLxBMxnQBnuBxxCH6h500PlXA4ZX3
	 MIRmtSIRaFJ8WT6T5z5f1J/+8E/HTp/rn9O2xpmyUfu+VnWWNZE96DieKtFu5xkgXi
	 SRz6ymsmWx+Sw==
Date: Fri, 5 Sep 2025 16:35:00 +0100
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
Subject: Re: [PATCH net-next v9 2/5] net: spacemit: Add K1 Ethernet MAC
Message-ID: <20250905153500.GH553991@horms.kernel.org>
References: <20250905-net-k1-emac-v9-0-f1649b98a19c@iscas.ac.cn>
 <20250905-net-k1-emac-v9-2-f1649b98a19c@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250905-net-k1-emac-v9-2-f1649b98a19c@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_083508_329289_3F993E0E 
X-CRM114-Status: GOOD (  23.15  )
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

On Fri, Sep 05, 2025 at 07:09:31PM +0800, Vivian Wang wrote:
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

...

> diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c

...

> +static void emac_init_hw(struct emac_priv *priv)
> +{
> +	/* Destination address for 802.3x Ethernet flow control */
> +	u8 fc_dest_addr[ETH_ALEN] = { 0x01, 0x80, 0xc2, 0x00, 0x00, 0x01 };
> +
> +	u32 rxirq = 0, dma = 0;
> +
> +	regmap_set_bits(priv->regmap_apmu,
> +			priv->regmap_apmu_offset + APMU_EMAC_CTRL_REG,
> +			AXI_SINGLE_ID);
> +
> +	/* Disable transmit and receive units */
> +	emac_wr(priv, MAC_RECEIVE_CONTROL, 0x0);
> +	emac_wr(priv, MAC_TRANSMIT_CONTROL, 0x0);
> +
> +	/* Enable MAC address 1 filtering */
> +	emac_wr(priv, MAC_ADDRESS_CONTROL, MREGBIT_MAC_ADDRESS1_ENABLE);
> +
> +	/* Zero initialize the multicast hash table */
> +	emac_wr(priv, MAC_MULTICAST_HASH_TABLE1, 0x0);
> +	emac_wr(priv, MAC_MULTICAST_HASH_TABLE2, 0x0);
> +	emac_wr(priv, MAC_MULTICAST_HASH_TABLE3, 0x0);
> +	emac_wr(priv, MAC_MULTICAST_HASH_TABLE4, 0x0);
> +
> +	/* Configure thresholds */
> +	emac_wr(priv, MAC_TRANSMIT_FIFO_ALMOST_FULL, DEFAULT_TX_ALMOST_FULL);
> +	emac_wr(priv, MAC_TRANSMIT_PACKET_START_THRESHOLD,
> +		DEFAULT_TX_THRESHOLD);
> +	emac_wr(priv, MAC_RECEIVE_PACKET_START_THRESHOLD, DEFAULT_RX_THRESHOLD);
> +
> +	/* Configure flow control (enabled in emac_adjust_link() later) */
> +	emac_set_mac_addr_reg(priv, fc_dest_addr, MAC_FC_SOURCE_ADDRESS_HIGH);
> +	emac_wr(priv, MAC_FC_PAUSE_HIGH_THRESHOLD, DEFAULT_FC_FIFO_HIGH);
> +	emac_wr(priv, MAC_FC_HIGH_PAUSE_TIME, DEFAULT_FC_PAUSE_TIME);
> +	emac_wr(priv, MAC_FC_PAUSE_LOW_THRESHOLD, 0);
> +
> +	/* RX IRQ mitigation */
> +	rxirq = EMAC_RX_FRAMES & MREGBIT_RECEIVE_IRQ_FRAME_COUNTER_MASK;
> +	rxirq |= (EMAC_RX_COAL_TIMEOUT
> +		  << MREGBIT_RECEIVE_IRQ_TIMEOUT_COUNTER_SHIFT) &
> +		 MREGBIT_RECEIVE_IRQ_TIMEOUT_COUNTER_MASK;

Probably this driver can benefit from using FIELD_PREP and FIELD_GET
in a number of places. In this case I think it would mean that
MREGBIT_RECEIVE_IRQ_TIMEOUT_COUNTER_SHIFT can be removed entirely.

> +
> +	rxirq |= MREGBIT_RECEIVE_IRQ_MITIGATION_ENABLE;
> +	emac_wr(priv, DMA_RECEIVE_IRQ_MITIGATION_CTRL, rxirq);

...

> +/* Returns number of packets received */
> +static int emac_rx_clean_desc(struct emac_priv *priv, int budget)
> +{
> +	struct net_device *ndev = priv->ndev;
> +	struct emac_rx_desc_buffer *rx_buf;
> +	struct emac_desc_ring *rx_ring;
> +	struct sk_buff *skb = NULL;
> +	struct emac_desc *rx_desc;
> +	u32 got = 0, skb_len, i;
> +	int status;
> +
> +	rx_ring = &priv->rx_ring;
> +
> +	i = rx_ring->tail;
> +
> +	while (budget--) {
> +		rx_desc = &((struct emac_desc *)rx_ring->desc_addr)[i];
> +
> +		/* Stop checking if rx_desc still owned by DMA */
> +		if (READ_ONCE(rx_desc->desc0) & RX_DESC_0_OWN)
> +			break;
> +
> +		dma_rmb();
> +
> +		rx_buf = &rx_ring->rx_desc_buf[i];
> +
> +		if (!rx_buf->skb)
> +			break;
> +
> +		got++;
> +
> +		dma_unmap_single(&priv->pdev->dev, rx_buf->dma_addr,
> +				 rx_buf->dma_len, DMA_FROM_DEVICE);
> +
> +		status = emac_rx_frame_status(priv, rx_desc);
> +		if (unlikely(status == RX_FRAME_DISCARD)) {
> +			ndev->stats.rx_dropped++;

As per the comment in struct net-device,
ndev->stats should not be used in modern drivers.

Probably you want to implement NETDEV_PCPU_STAT_TSTATS.

Sorry for not mentioning this in an earlier review of
stats in this driver.

> +			dev_kfree_skb_irq(rx_buf->skb);
> +			rx_buf->skb = NULL;
> +		} else {
> +			skb = rx_buf->skb;
> +			skb_len = rx_frame_len(rx_desc) - ETH_FCS_LEN;
> +			skb_put(skb, skb_len);
> +			skb->dev = ndev;
> +			ndev->hard_header_len = ETH_HLEN;
> +
> +			skb->protocol = eth_type_trans(skb, ndev);
> +
> +			skb->ip_summed = CHECKSUM_NONE;
> +
> +			napi_gro_receive(&priv->napi, skb);
> +
> +			ndev->stats.rx_packets++;
> +			ndev->stats.rx_bytes += skb_len;
> +
> +			memset(rx_desc, 0, sizeof(struct emac_desc));
> +			rx_buf->skb = NULL;
> +		}
> +
> +		if (++i == rx_ring->total_cnt)
> +			i = 0;
> +	}
> +
> +	rx_ring->tail = i;
> +
> +	emac_alloc_rx_desc_buffers(priv);
> +
> +	return got;
> +}

...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

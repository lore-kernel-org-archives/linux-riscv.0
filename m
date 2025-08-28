Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A49CA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjmX1PX5idwTg60QduHQLt3seAlqhkHaB5TrxOq6q2U=; b=tdCcvLwH9VgIqr
	InQyzBJ8lGpg06seZb6u1tZcHROoWAc8K3SjKWPzRe3SW9uwkNSRRq6I8AqnYS+JmEF03bB+wgIJu
	Vez0qvYRW5xnUmHvKYumxLe+PsoJnnaAARyWtKzPitJDOiYmNPwhxDDq0/bKsj31d2StaNZEk0AxP
	v8O9GoCMqN0VMDPwhQCyQ1Bc+kzXYzvk4grmrV1Vu7oUU/z6gl0Bt8+pRY/y42dQ2l0xSwybfyNoj
	ruqCZjJAbdgMfeYmLveSE8ebkD7KaIYILGd63p18abXqA0bkQjjwbRQrbS3HyW5VLyGZ1zRm4qBJ9
	GYCOL9H1EJWZ16SriZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXwj-00000000mob-2Bm8;
	Thu, 28 Aug 2025 08:25:25 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXfT-00000000jAg-1ZI0
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 08:07:37 +0000
Received: from [192.168.0.107] (unknown [114.241.87.235])
	by APP-01 (Coremail) with SMTP id qwCowABXgqYiDrBo+IrEDw--.81S2;
	Thu, 28 Aug 2025 16:06:58 +0800 (CST)
Message-ID: <6c221dcf-4310-4e31-b3e8-a8a3b68c3734@iscas.ac.cn>
Date: Thu, 28 Aug 2025 16:06:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 2/5] net: spacemit: Add K1 Ethernet MAC
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Horman <horms@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250826-net-k1-emac-v7-0-5bc158d086ae@iscas.ac.cn>
 <20250826-net-k1-emac-v7-2-5bc158d086ae@iscas.ac.cn>
 <193454B6B44560D1+aK-x9J2EIB5aA9yr@LT-Guozexi>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <193454B6B44560D1+aK-x9J2EIB5aA9yr@LT-Guozexi>
X-CM-TRANSID: qwCowABXgqYiDrBo+IrEDw--.81S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar4xWw1rXF17Zw4UuF18uFg_yoWxGFy3pa
	y5KFWDCrZ7Zr17GwsxZF47AFnIqw1fJF18urWjyw4rX3ZIyryxKry0gFyUGw18Cryv9r45
	Zw4j9a4xWFn8t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUvaZXDUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_010735_786388_7AA9C306 
X-CRM114-Status: GOOD (  28.26  )
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

Hi Troy,

On 8/28/25 09:33, Troy Mitchell wrote:
> On Tue, Aug 26, 2025 at 02:23:47PM +0800, Vivian Wang wrote:
>> The Ethernet MACs found on SpacemiT K1 appears to be a custom design
>> that only superficially resembles some other embedded MACs. SpacemiT
>> refers to them as "EMAC", so let's just call the driver "k1_emac".
>>
>> Supports RGMII and RMII interfaces. Includes support for MAC hardware
>> statistics counters. PTP support is not implemented.
>>
>> Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>> ---
> Hi Vivian,
> I have tested your patch on MUSE-PI.
> So here:
>
> Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
> But I still have a minor style comment on the code.
Thanks for your Tested-by and review.
>>  drivers/net/ethernet/Kconfig            |    1 +
>>  drivers/net/ethernet/Makefile           |    1 +
>>  drivers/net/ethernet/spacemit/Kconfig   |   29 +
>>  drivers/net/ethernet/spacemit/Makefile  |    6 +
>>  drivers/net/ethernet/spacemit/k1_emac.c | 2193 +++++++++++++++++++++++++++++++
>>  drivers/net/ethernet/spacemit/k1_emac.h |  426 ++++++
>>  6 files changed, 2656 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..9e558d5893cfbbda0baa7ad21a7209dadda9487e
>> --- /dev/null
>> +++ b/drivers/net/ethernet/spacemit/k1_emac.c
>> @@ -0,0 +1,2193 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * SpacemiT K1 Ethernet driver
>> + *
>> + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
>> + * Copyright (C) 2025 Vivian Wang <wangruikang@iscas.ac.cn>
>> + */
>> +
> [...]
>> +
>> +static void emac_wr(struct emac_priv *priv, u32 reg, u32 val)
>> +{
>> +	writel(val, priv->iobase + reg);
>> +}
> basically short and obvious code like this:
>
> writel(val, priv->iobase + reg)
>
> you replace:
>
> emac_wr(priv, reg, val)
>
> It's not helpful..You could just use writel/readl directly
>> +
>> +static int emac_rd(struct emac_priv *priv, u32 reg)
>> +{
>> +	return readl(priv->iobase + reg);
>> +}
> ditto.

I have decided against inlining these wrappers.

Firstly, the wrappers being mostly trivial is not it being "not
helpful". In long blocks of register access code, especially, having
just emac_rd(priv,...) or emac_wr(priv,...) repeated is easier to
recognize and harder to mess up (e.g. precedence of "priv->iomem + ...").

Secondly, they serve as documentation that a normal register access for
this driver is a 32-bit read or write. This is despite the fact that the
registers all "look like" they each only have the low 16 bits.

>> +
>> +static int emac_phy_interface_config(struct emac_priv *priv)
>> +{
>> +	u32 val = 0, mask = PHY_INTF_RGMII;
>> +
>> +	switch (priv->phy_interface) {
>> +	case PHY_INTERFACE_MODE_RMII:
>> +		mask |= REF_CLK_SEL;
>> +		break;
>> +	case PHY_INTERFACE_MODE_RGMII:
>> +	case PHY_INTERFACE_MODE_RGMII_ID:
>> +	case PHY_INTERFACE_MODE_RGMII_RXID:
>> +	case PHY_INTERFACE_MODE_RGMII_TXID:
>> +		val |= PHY_INTF_RGMII;
>> +
>> +		mask |= RGMII_TX_CLK_SEL;
>> +		break;
>> +	default:
>> +		netdev_err(priv->ndev, "Unsupported PHY interface %d",
>> +			   priv->phy_interface);
>> +		return -EINVAL;
>> +	}
>> +
>> +	regmap_update_bits(priv->regmap_apmu,
>> +			   priv->regmap_apmu_offset + APMU_EMAC_CTRL_REG,
>> +			   mask, val);
>> +
>> +	return 0;
>> +}
>> +
> [...]
>> +static bool emac_tx_should_interrupt(struct emac_priv *priv, u32 pkt_num)
>> +{
>> +	bool should_interrupt;
>> +
>> +	/* Manage TX mitigation */
>> +	priv->tx_count_frames += pkt_num;
>> +	if (likely(priv->tx_coal_frames > priv->tx_count_frames)) {
>> +		emac_tx_coal_timer_resched(priv);
>> +		should_interrupt = false;
>> +	} else {
>> +		priv->tx_count_frames = 0;
>> +		should_interrupt = true;
>> +	}
>> +
>> +	return should_interrupt;
> If we really need this variable?
>
> How about this:
> if (likely(priv->tx_coal_frames > priv->tx_count_frames)) {
>   emac_tx_coal_timer_resched(priv);
>   return false;
> }
>
> priv->tx_count_frames = 0;
> return true;

I will simplify this in the next version.

>> +}
>> +
>> +static void emac_free_tx_buf(struct emac_priv *priv, int i)
>> +{
>> +	struct emac_tx_desc_buffer *tx_buf;
>> +	struct emac_desc_ring *tx_ring;
>> +	struct desc_buf *buf;
>> +	int j;
>> +
>> +	tx_ring = &priv->tx_ring;
>> +	tx_buf = &tx_ring->tx_desc_buf[i];
>> +
>> +	for (j = 0; j < 2; j++) {
>> +		buf = &tx_buf->buf[j];
>> +		if (buf->dma_addr) {
>> +			if (buf->map_as_page)
>> +				dma_unmap_page(&priv->pdev->dev, buf->dma_addr,
>> +					       buf->dma_len, DMA_TO_DEVICE);
>> +			else
>> +				dma_unmap_single(&priv->pdev->dev,
>> +						 buf->dma_addr, buf->dma_len,
>> +						 DMA_TO_DEVICE);
>> +
>> +			buf->dma_addr = 0;
>> +			buf->map_as_page = false;
>> +			buf->buff_addr = NULL;
>> +		}
> if (!buf->dma_addr)
>   continue;
>
> Best regards,
> Troy
You tricked me! There's one more review comment below :P
>> +	}
>> +
>> +	if (tx_buf->skb) {
>> +		dev_kfree_skb_any(tx_buf->skb);
>> +		tx_buf->skb = NULL;
>> +	}
>> +}
>> +
>> +static void emac_clean_tx_desc_ring(struct emac_priv *priv)
>> +{
>> +	struct emac_desc_ring *tx_ring = &priv->tx_ring;
>> +	u32 i;
>> +
>> +	/* Free all the TX ring skbs */
>> +	for (i = 0; i < tx_ring->total_cnt; i++)
>> +		emac_free_tx_buf(priv, i);
>> +
>> +	tx_ring->head = 0;
>> +	tx_ring->tail = 0;
>> +}
>> +
>> +static void emac_clean_rx_desc_ring(struct emac_priv *priv)
>> +{
>> +	struct emac_rx_desc_buffer *rx_buf;
>> +	struct emac_desc_ring *rx_ring;
>> +	u32 i;
>> +
>> +	rx_ring = &priv->rx_ring;
>> +
>> +	/* Free all the RX ring skbs */
>> +	for (i = 0; i < rx_ring->total_cnt; i++) {
>> +		rx_buf = &rx_ring->rx_desc_buf[i];
>> +		if (rx_buf->skb) {
>> +			dma_unmap_single(&priv->pdev->dev, rx_buf->dma_addr,
>> +					 rx_buf->dma_len, DMA_FROM_DEVICE);
>> +
>> +			dev_kfree_skb(rx_buf->skb);
>> +			rx_buf->skb = NULL;
>> +		}
> if (!rx_buf->skb)
>   continue;

I will change both of these to "if (...) continue;" in the next version.

Thanks,
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

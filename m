Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00482C83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 04:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3K8+eOTjWrr20gZimVxhLRI+b3pYb6UKoOMA7G9UY4=; b=NGhNsltQi4kFEn
	QOkseN/Nq2kFjF37GDw2B7iakno6FUaCYeavjm//FJDvlKM//BMdqzWMYMkzXbh0t//nMRoL2kxhh
	D7XQVbD8OoyywR18FC70oQg6uU/Xhm0CRvsZI3HD+FXZRgxGf5HDxck1jfdiJ5EHBvfaOMQcrgvFc
	1EuV4XB/YeVsKw4zQ8Cw32aC5lNmSjLWocAr0/lfL63UrMEkUybaLbJ8eGkVjKG0db/185YM6L0bG
	nzRJx2ItdYdS98/jMZnfs7WmteP7J47GyhpOW1aTeb8mzgX6xfN6fvi/qaAXoDUI68xGZqB0I15pZ
	LJJHeO243TwrJc5sTihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZj7I-0000000Afpe-0zh3;
	Thu, 10 Jul 2025 04:42:40 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZj7E-0000000AfpD-0fSn
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 04:42:38 +0000
Received: from [192.168.0.108] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowADXaVqmRG9oleKwAg--.7354S2;
	Thu, 10 Jul 2025 12:42:14 +0800 (CST)
Message-ID: <ec29a7b6-e941-4006-9bb7-84334e6e48ea@iscas.ac.cn>
Date: Thu, 10 Jul 2025 12:42:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/2] net: spacemit: Add K1 Ethernet MAC
To: Simon Horman <horms@kernel.org>, Vivian Wang <uwu@dram.page>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Junhui Liu <junhui.liu@pigmoral.tech>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250703-net-k1-emac-v4-0-686d09c4cfa8@iscas.ac.cn>
 <20250703-net-k1-emac-v4-2-686d09c4cfa8@iscas.ac.cn>
 <20250707100124.GC89747@horms.kernel.org>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250707100124.GC89747@horms.kernel.org>
X-CM-TRANSID: zQCowADXaVqmRG9oleKwAg--.7354S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AFy5uFW7JFWkuFyfAr4Dtwb_yoWxZr17pa
	y5Ja9Fyr4jyF1xJw4UGr48XF4ayFyxJ3W7KrWYy39IkFZ0kw1Ig34xKF13C34Durn5Ar90
	yayUZF9xGaykGFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUYsSdPUUUUU==
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_214236_567702_B0CCB9F0 
X-CRM114-Status: GOOD (  28.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Simon,

Thanks for your suggestions.

On 7/7/25 18:01, Simon Horman wrote:
> On Thu, Jul 03, 2025 at 05:42:03PM +0800, Vivian Wang wrote:
>> The Ethernet MACs found on SpacemiT K1 appears to be a custom design
>> that only superficially resembles some other embedded MACs. SpacemiT
>> refers to them as "EMAC", so let's just call the driver "k1_emac".
>>
>> This driver is based on "k1x-emac" in the same directory in the vendor's
>> tree [1]. Some debugging tunables have been fixed to vendor-recommended
>> defaults, and PTP support is not included yet.
>>
>> [1]: https://github.com/spacemit-com/linux-k1x
>>
>> Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ...
>
>> diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
> ...
>
>> +/**
>> + * struct emac_desc_ring - Software-side information for one descriptor ring
>> + * Same struture used for both RX and TX
> nit: structure

Thanks, will fix in next version.

>
>> + * @desc_addr: Virtual address to the descriptor ring memory
>> + * @desc_dma_addr: DMA address of the descriptor ring
>> + * @total_size: Size of ring in bytes
>> + * @total_cnt: Number of descriptors
>> + * @head: Next descriptor to associate a buffer with
>> + * @tail: Next descriptor to check status bit
>> + * @rx_desc_buf: Array of descriptors for RX
>> + * @tx_desc_buf: Array of descriptors for TX, with max of two buffers each
>> + */
> ...
>
>> +static void emac_set_mac_addr(struct emac_priv *priv, const unsigned char *addr)
>> +{
>> +	emac_wr(priv, MAC_ADDRESS1_HIGH, ((addr[1] << 8) | addr[0]));
> nit: no need for inner parentheses here,
>       the order of operations is on your side
>
> 	emac_wr(priv, MAC_ADDRESS1_HIGH, addr[1] << 8 | addr[0]);
>
>> +	emac_wr(priv, MAC_ADDRESS1_MED, ((addr[3] << 8) | addr[2]));
>> +	emac_wr(priv, MAC_ADDRESS1_LOW, ((addr[5] << 8) | addr[4]));
>> +}

I will remove unnecessary these parens in next version.

> ...
>
>> +static int emac_rx_frame_status(struct emac_priv *priv, struct emac_desc *desc)
>> +{
>> +	/* Drop if not last descriptor */
>> +	if (!(desc->desc0 & RX_DESC_0_LAST_DESCRIPTOR)) {
>> +		netdev_dbg(priv->ndev, "RX not last descriptor\n");
> Unless I am mistaken these logs can occur on the basis of user
> (Network packet) input. If so, I think rate limited debug
> messages are more appropriate here and below.

This particular one shouldn't be, but the rest are indeed triggered 
based on network packet input, and in any case these can happen 
per-packet. I will make these ratelimited in the next version.

>> +		return RX_FRAME_DISCARD;
>> +	}
>> +
>> +	if (desc->desc0 & RX_DESC_0_FRAME_RUNT) {
>> +		netdev_dbg(priv->ndev, "RX runt frame\n");
>> +		return RX_FRAME_DISCARD;
>> +	}
>> +
>> +	if (desc->desc0 & RX_DESC_0_FRAME_CRC_ERR) {
>> +		netdev_dbg(priv->ndev, "RX frame CRC error\n");
>> +		return RX_FRAME_DISCARD;
>> +	}
>> +
>> +	if (desc->desc0 & RX_DESC_0_FRAME_MAX_LEN_ERR) {
>> +		netdev_dbg(priv->ndev, "RX frame exceeds max length\n");
>> +		return RX_FRAME_DISCARD;
>> +	}
>> +
>> +	if (desc->desc0 & RX_DESC_0_FRAME_JABBER_ERR) {
>> +		netdev_dbg(priv->ndev, "RX frame jabber error\n");
>> +		return RX_FRAME_DISCARD;
>> +	}
>> +
>> +	if (desc->desc0 & RX_DESC_0_FRAME_LENGTH_ERR) {
>> +		netdev_dbg(priv->ndev, "RX frame length error\n");
>> +		return RX_FRAME_DISCARD;
>> +	}
>> +
>> +	if (rx_frame_len(desc) <= ETH_FCS_LEN ||
>> +	    rx_frame_len(desc) > priv->dma_buf_sz) {
>> +		netdev_dbg(priv->ndev, "RX frame length unacceptable\n");
>> +		return RX_FRAME_DISCARD;
>> +	}
>> +	return RX_FRAME_OK;
>> +}
> ...
>
>> +static int emac_resume(struct device *dev)
>> +{
>> +	struct emac_priv *priv = dev_get_drvdata(dev);
>> +	struct net_device *ndev = priv->ndev;
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(priv->bus_clk);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to enable bus clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (!netif_running(ndev))
>> +		return 0;
>> +
>> +	ret = emac_open(ndev);
>> +	if (ret)
> Smatch flags that priv->bus_clk resources are leaked here, and I agree.
>
>> +		return ret;
>> +
>> +	netif_device_attach(ndev);
>> +	return 0;
>> +}
> I would suggest addressing that like this.
> (Compile tested only!)
>
> diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
> index 6158e776bc67..ebd02ec2bb01 100644
> --- a/drivers/net/ethernet/spacemit/k1_emac.c
> +++ b/drivers/net/ethernet/spacemit/k1_emac.c
> @@ -1843,10 +1843,14 @@ static int emac_resume(struct device *dev)
>   
>   	ret = emac_open(ndev);
>   	if (ret)
> -		return ret;
> +		goto err_clk_disable_unprepare;
>   
>   	netif_device_attach(ndev);
>   	return 0;
> +
> +err_clk_disable_unprepare:
> +	clk_disable_unprepare(priv->bus_clk);
> +	return ret;
>   }
>   
>   static int emac_suspend(struct device *dev)

Thanks for the tip. I will fix the error handling path in emac_resume 
next version.

> ...
>
>> diff --git a/drivers/net/ethernet/spacemit/k1_emac.h b/drivers/net/ethernet/spacemit/k1_emac.h
> ...
>
>> +struct emac_hw_stats {
>> +	u32 tx_ok_pkts;
>> +	u32 tx_total_pkts;
>> +	u32 tx_ok_bytes;
>> +	u32 tx_err_pkts;
>> +	u32 tx_singleclsn_pkts;
>> +	u32 tx_multiclsn_pkts;
>> +	u32 tx_lateclsn_pkts;
>> +	u32 tx_excessclsn_pkts;
>> +	u32 tx_unicast_pkts;
>> +	u32 tx_multicast_pkts;
>> +	u32 tx_broadcast_pkts;
>> +	u32 tx_pause_pkts;
>> +	u32 rx_ok_pkts;
>> +	u32 rx_total_pkts;
>> +	u32 rx_crc_err_pkts;
>> +	u32 rx_align_err_pkts;
>> +	u32 rx_err_total_pkts;
>> +	u32 rx_ok_bytes;
>> +	u32 rx_total_bytes;
>> +	u32 rx_unicast_pkts;
>> +	u32 rx_multicast_pkts;
>> +	u32 rx_broadcast_pkts;
>> +	u32 rx_pause_pkts;
>> +	u32 rx_len_err_pkts;
>> +	u32 rx_len_undersize_pkts;
>> +	u32 rx_len_oversize_pkts;
>> +	u32 rx_len_fragment_pkts;
>> +	u32 rx_len_jabber_pkts;
>> +	u32 rx_64_pkts;
>> +	u32 rx_65_127_pkts;
>> +	u32 rx_128_255_pkts;
>> +	u32 rx_256_511_pkts;
>> +	u32 rx_512_1023_pkts;
>> +	u32 rx_1024_1518_pkts;
>> +	u32 rx_1519_plus_pkts;
>> +	u32 rx_drp_fifo_full_pkts;
>> +	u32 rx_truncate_fifo_full_pkts;
>> +};
> Many of the stats above appear to cover stats covered by struct
> rtnl_link_stats64, ethtool_pause_stats, struct ethtool_rmon_stats, and
> possibly others standardised in ethtool.h. Please only report standard
> counters using standard mechanisms. And only use get_ethtool_stats to
> report non-standard counters.
>
> Link: https://www.kernel.org/doc/html/v6.16-rc4/networking/statistics.html#notes-for-driver-authors

I will move statistics to standard counters wherever available. Thanks 
for the tip.

And thanks again for your suggestions.

Vivian "dramforever" Wang

> ...
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

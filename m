Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A5ECA0EDC
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izfC6FvVgd/J4i4mJ1g+8Ob1M/Hn+w6xTZnRfvC0mas=; b=1UX1UAEiFtn4WY
	XhqSAN+T2z+jJdFELVM/8YWiTOJ+hb9otd4uhoRjG88LFMhxWwSPLaufZRi5i8ki2Dn+EbGoSk5WE
	w4lVTGCWtozYfyoouJDOnIicWcm1IgV0YqdSwGPQmdAvoj1Ebm831Yj6GVTFVXg9l4nGVThfX0XZ0
	KXJ8sVKdVZawyA/CjyytJtqebKEIaohim0qPdoAYGs+j3HP0jiuBKIWZqOzUohfeKTXBurOzUMEyb
	pmrjDgXrKoCAXQq76SJRVvz+vUlsUpTK7U7mKjwhbaU+rcUTxXgFqFavHtMnBBQupkLWzQPZsqbvs
	sWi88tTgYlD8d591SMuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrjM-0000000BJT0-3d3w;
	Tue, 12 Aug 2025 16:20:08 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmhx-0000000AY4y-18Bd
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 10:58:23 +0000
Received: from [192.168.0.104] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowAAXrFwmHpto6U4ZCw--.2240S2;
	Tue, 12 Aug 2025 18:57:42 +0800 (CST)
Message-ID: <0c894603-08dc-4dcd-a866-0a1d121cdb89@iscas.ac.cn>
Date: Tue, 12 Aug 2025 18:57:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 2/5] net: spacemit: Add K1 Ethernet MAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <uwu@dram.page>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Horman <horms@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250812-net-k1-emac-v5-0-dd17c4905f49@iscas.ac.cn>
 <20250812-net-k1-emac-v5-2-dd17c4905f49@iscas.ac.cn>
 <ac9cce0b-d29e-499b-8a86-28979cd12fb5@lunn.ch>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <ac9cce0b-d29e-499b-8a86-28979cd12fb5@lunn.ch>
X-CM-TRANSID: zQCowAAXrFwmHpto6U4ZCw--.2240S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW8ZFWfWFy7tFyxWw4xXrb_yoW8Gry7pF
	yUJaykGrWjqF1kXFn8XrWUAFyIqwn3Kw17uF1YyayagF9FyryfC34rWFWUCwnrCrWDCr1a
	kw1jkFn7Gay2grDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxU3wIDUUUUU
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_035821_683669_6F1D9D88 
X-CRM114-Status: UNSURE (   8.98  )
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

On 8/12/25 11:45, Andrew Lunn wrote:

>> +static void emac_get_pause_stats(struct net_device *dev,
>> +				 struct ethtool_pause_stats *pause_stats)
>> +{
>> +	struct emac_priv *priv = netdev_priv(dev);
>> +	struct emac_hw_tx_stats *tx_stats;
>> +	struct emac_hw_rx_stats *rx_stats;
>> +
>> +	tx_stats = &priv->tx_stats;
>> +	rx_stats = &priv->rx_stats;
>> +
>> +	scoped_guard(spinlock_irqsave, &priv->stats_lock) {
>> +		emac_stats_update(priv);
>> +
>> +		pause_stats->tx_pause_frames = tx_stats->tx_pause_pkts;
>> +		pause_stats->rx_pause_frames = rx_stats->rx_pause_pkts;
>> +	}
>> +}
> You have pause statistics, but not actual configuration of pause.
>
>> +static void emac_adjust_link(struct net_device *dev)
>> +{
>> +	struct emac_priv *priv = netdev_priv(dev);
>> +	struct phy_device *phydev = dev->phydev;
>> +	u32 ctrl;
> Normally the adjust_link callback you configure the hardware with the
> result of pause negotiation.

Thanks for the tip, I will fix emac_adjust_link next version.

>> +/* Called when net interface is brought up. */
>> +static int emac_open(struct net_device *ndev)
>> +{
>> +	struct emac_priv *priv = netdev_priv(ndev);
>> +	struct device *dev = &priv->pdev->dev;
>> +
>> +	int ret;
> Extra blank line.

Oops. I will fix next version.

Thanks,
Vivian "dramforever" Wang

>
>     Andrew
>
> ---
> pw-bot: cr


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

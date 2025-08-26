Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1DECA0FF0
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 08:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t//vp8QMdkvKBURjyYcbhNKZmOQEy2T6TLZHjXMdmg4=; b=FLWktHbEFqutwU
	H/COZs3wqMC2kR4x5YRY6KrjkTTnoXQXBXAEti02+dcvE1yM1mBTVMOzwGNslzNlkDI9ZSZM9Vyfk
	Xl9q2Fn2lYAduwGZ2tZzvBV2xzIsZBENUkgugypQrgtyuavFKlY+w25B3E6t5WBc9vhcaaYSnJ34G
	DNvqQW159gpC0B9G1Jb/VM1i/VBxZwXaJrIlEa2+jhnKBsSLhpDRrpayPLa0vxqWaPOacf72Yg+8s
	fgKhmsdLSp84ug5/sdVcv5epBQZfxFlUJC/gHZGknZdq86OoSjkE8m4u0nrCxgSbNe4NS2N5eubT1
	wGw6obDaZ3H3UVjP0eOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpVv-0000000B9jk-3N35;
	Tue, 26 Aug 2025 08:58:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqpSL-0000000B8Tz-3S7p
	for linux-riscv@lists.infradead.org;
	Tue, 26 Aug 2025 08:55:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqpRq-0003j9-Qa; Tue, 26 Aug 2025 10:54:34 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqpRn-002Cb2-1w;
	Tue, 26 Aug 2025 10:54:31 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uqpRn-0005k0-1e;
	Tue, 26 Aug 2025 10:54:31 +0200
Message-ID: <eb127fd167cfbd885099a7c4c962eb1135a5a8a0.camel@pengutronix.de>
Subject: Re: [PATCH net-next v7 2/5] net: spacemit: Add K1 Ethernet MAC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Vivian Wang <wangruikang@iscas.ac.cn>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>,  Junhui Liu <junhui.liu@pigmoral.tech>, Simon
 Horman <horms@kernel.org>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 26 Aug 2025 10:54:31 +0200
In-Reply-To: <20250826-net-k1-emac-v7-2-5bc158d086ae@iscas.ac.cn>
References: <20250826-net-k1-emac-v7-0-5bc158d086ae@iscas.ac.cn>
	 <20250826-net-k1-emac-v7-2-5bc158d086ae@iscas.ac.cn>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_015505_870656_C6F645D1 
X-CRM114-Status: GOOD (  19.89  )
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

On Di, 2025-08-26 at 14:23 +0800, Vivian Wang wrote:
> The Ethernet MACs found on SpacemiT K1 appears to be a custom design
> that only superficially resembles some other embedded MACs. SpacemiT
> refers to them as "EMAC", so let's just call the driver "k1_emac".
> 
> Supports RGMII and RMII interfaces. Includes support for MAC hardware
> statistics counters. PTP support is not implemented.
> 
> Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> ---
>  drivers/net/ethernet/Kconfig            |    1 +
>  drivers/net/ethernet/Makefile           |    1 +
>  drivers/net/ethernet/spacemit/Kconfig   |   29 +
>  drivers/net/ethernet/spacemit/Makefile  |    6 +
>  drivers/net/ethernet/spacemit/k1_emac.c | 2193 +++++++++++++++++++++++++++++++
>  drivers/net/ethernet/spacemit/k1_emac.h |  426 ++++++
>  6 files changed, 2656 insertions(+)
> 
[...]
> diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..9e558d5893cfbbda0baa7ad21a7209dadda9487e
> --- /dev/null
> +++ b/drivers/net/ethernet/spacemit/k1_emac.c
> @@ -0,0 +1,2193 @@
[...]
> +static int emac_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct reset_control *reset;
> +	struct net_device *ndev;
> +	struct emac_priv *priv;
> +	int ret;
> +
> +	ndev = devm_alloc_etherdev(dev, sizeof(struct emac_priv));
> +	if (!ndev)
> +		return -ENOMEM;
> +
> +	ndev->hw_features = NETIF_F_SG;
> +	ndev->features |= ndev->hw_features;
> +
> +	ndev->max_mtu = EMAC_RX_BUF_4K - (ETH_HLEN + ETH_FCS_LEN);
> +
> +	priv = netdev_priv(ndev);
> +	priv->ndev = ndev;
> +	priv->pdev = pdev;
> +	platform_set_drvdata(pdev, priv);
> +
> +	ret = emac_config_dt(pdev, priv);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Configuration failed\n");
> +		goto err;

I'd just
		return dev_err_probe(...);
here.

> +	}
> +
> +	ndev->watchdog_timeo = 5 * HZ;
> +	ndev->base_addr = (unsigned long)priv->iobase;
> +	ndev->irq = priv->irq;
> +
> +	ndev->ethtool_ops = &emac_ethtool_ops;
> +	ndev->netdev_ops = &emac_netdev_ops;
> +
> +	devm_pm_runtime_enable(&pdev->dev);
> +
> +	priv->bus_clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(priv->bus_clk)) {
> +		ret = dev_err_probe(dev, PTR_ERR(priv->bus_clk),
> +				    "Failed to get clock\n");
> +		goto err;

Same here.

> +	}
> +
> +	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
> +								     NULL);
> +	if (IS_ERR(reset)) {
> +		ret = dev_err_probe(dev, PTR_ERR(reset),
> +				    "Failed to get reset\n");
> +		goto err;

And here.

> +	}
> +
> +	emac_sw_init(priv);
> +
> +	if (of_phy_is_fixed_link(dev->of_node)) {
> +		ret = of_phy_register_fixed_link(dev->of_node);
> +		if (ret) {
> +			dev_err_probe(dev, ret,
> +				      "Failed to register fixed-link");
> +			goto err_timer_delete;

If you can move this section before emac_sw_init(), this could also
just return.

> +		}

Then here a function calling of_phy_deregister_fixed_link() could be
registered with devm_add_action_or_reset(), to avoid duplicated cleanup
in the error path and in emac_remove().


regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

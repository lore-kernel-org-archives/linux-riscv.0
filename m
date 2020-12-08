Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFF8C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 18:49:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8337523B51
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 18:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8337523B51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FHu/hStuDaJlOc9lOGHJmkgT7GyOEiolcr7CLRgoVDc=; b=I2qBbXBtD/ANTP+6v5rNDPaxD
	dZHQqMzBbA6e9SpZSagAtpry+AmR3/oL/IJvjkX2T5S7obaonlkUEn6rLpclEZQvUDsUnR9GUyCyf
	+M/hUsJG+qN5U5jnTvWCzHQHT2gCkz9OjIXimPB5gwfSDiOX1CdGYk4Ok+mX0ciWHPDTlrU1fVv/y
	gLj07MAEdwN40To9MaGJZ+pbSBILZciLvx9yhk3dRNhEp0w7ZTXf3ER73zDkcqpJBpSmW++yvDv4V
	AcjUfKU62RxhZBLzZ24qlXGKZyhcGLChE5geuAG7L5BQzOtbB9WsoGhNZYGVjxx9ZRusK76cIc5BB
	c1hd+aorA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmi3A-00040M-7j; Tue, 08 Dec 2020 18:49:24 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmi36-0003ze-KQ
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 18:49:22 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kmi2i-00Atz4-Vu; Tue, 08 Dec 2020 19:48:56 +0100
Date: Tue, 8 Dec 2020 19:48:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 3/8] net: macb: add function to disable all macb clocks
Message-ID: <20201208184856.GM2475764@lunn.ch>
References: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
 <1607343333-26552-4-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607343333-26552-4-git-send-email-claudiu.beznea@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_134920_690520_1D1ED259 
X-CRM114-Status: GOOD (  11.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux@armlinux.org.uk,
 nicolas.ferre@microchip.com, yash.shah@sifive.com, robh+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, kuba@kernel.org,
 linux-riscv@lists.infradead.org, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Claudiu

>  static int macb_clk_init(struct platform_device *pdev, struct clk **pclk,
>  			 struct clk **hclk, struct clk **tx_clk,
>  			 struct clk **rx_clk, struct clk **tsu_clk)
> @@ -3743,40 +3753,37 @@ static int macb_clk_init(struct platform_device *pdev, struct clk **pclk,
>  	err = clk_prepare_enable(*hclk);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to enable hclk (%d)\n", err);
> -		goto err_disable_pclk;
> +		hclk = NULL;
> +		tx_clk = NULL;
> +		rx_clk = NULL;
> +		goto err_disable_clks;
>  	}
>  
>  	err = clk_prepare_enable(*tx_clk);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to enable tx_clk (%d)\n", err);
> -		goto err_disable_hclk;
> +		tx_clk = NULL;
> +		rx_clk = NULL;
> +		goto err_disable_clks;
>  	}
>  
>  	err = clk_prepare_enable(*rx_clk);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to enable rx_clk (%d)\n", err);
> -		goto err_disable_txclk;
> +		rx_clk = NULL;
> +		goto err_disable_clks;
>  	}
>  
>  	err = clk_prepare_enable(*tsu_clk);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to enable tsu_clk (%d)\n", err);
> -		goto err_disable_rxclk;
> +		goto err_disable_clks;
>  	}
>  
>  	return 0;
>  
> -err_disable_rxclk:
> -	clk_disable_unprepare(*rx_clk);
> -
> -err_disable_txclk:
> -	clk_disable_unprepare(*tx_clk);
> -
> -err_disable_hclk:
> -	clk_disable_unprepare(*hclk);
> -
> -err_disable_pclk:
> -	clk_disable_unprepare(*pclk);
> +err_disable_clks:
> +	macb_clks_disable(*pclk, *hclk, *tx_clk, *rx_clk, NULL);

Personal taste, but i would of not changed this.

>  
>  	return err;
>  }
> @@ -4755,11 +4762,7 @@ static int macb_probe(struct platform_device *pdev)
>  	free_netdev(dev);
>  
>  err_disable_clocks:
> -	clk_disable_unprepare(tx_clk);
> -	clk_disable_unprepare(hclk);
> -	clk_disable_unprepare(pclk);
> -	clk_disable_unprepare(rx_clk);
> -	clk_disable_unprepare(tsu_clk);
> +	macb_clks_disable(bp->pclk, bp->hclk, bp->tx_clk, bp->rx_clk, bp->tsu_clk);
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_set_suspended(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> @@ -4784,11 +4787,8 @@ static int macb_remove(struct platform_device *pdev)
>  		pm_runtime_disable(&pdev->dev);
>  		pm_runtime_dont_use_autosuspend(&pdev->dev);
>  		if (!pm_runtime_suspended(&pdev->dev)) {
> -			clk_disable_unprepare(bp->tx_clk);
> -			clk_disable_unprepare(bp->hclk);
> -			clk_disable_unprepare(bp->pclk);
> -			clk_disable_unprepare(bp->rx_clk);
> -			clk_disable_unprepare(bp->tsu_clk);
> +			macb_clks_disable(bp->pclk, bp->hclk, bp->tx_clk,
> +					  bp->rx_clk, bp->tsu_clk);
>  			pm_runtime_set_suspended(&pdev->dev);
>  		}
>  		phylink_destroy(bp->phylink);
> @@ -4966,14 +4966,16 @@ static int __maybe_unused macb_runtime_suspend(struct device *dev)
>  {
>  	struct net_device *netdev = dev_get_drvdata(dev);
>  	struct macb *bp = netdev_priv(netdev);
> +	struct clk *pclk = NULL, *hclk = NULL, *tx_clk = NULL, *rx_clk = NULL;
>  
>  	if (!(device_may_wakeup(dev))) {
> -		clk_disable_unprepare(bp->tx_clk);
> -		clk_disable_unprepare(bp->hclk);
> -		clk_disable_unprepare(bp->pclk);
> -		clk_disable_unprepare(bp->rx_clk);
> +		pclk = bp->pclk;
> +		hclk = bp->hclk;
> +		tx_clk = bp->tx_clk;
> +		rx_clk = bp->rx_clk;
>  	}
> -	clk_disable_unprepare(bp->tsu_clk);
> +
> +	macb_clks_disable(pclk, hclk, tx_clk, rx_clk, bp->tsu_clk);

Maybe

  	if (!(device_may_wakeup(dev)))
		macb_clks_disable(bp->pclk, bp->hclk, pb->tx_clk, bp->rx_clk, bp->tsu_clk);
	else
		macb_clks_disable(NULL, NULL, NULL, NULL, bp->tsu_clk);

is more readable?

   Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

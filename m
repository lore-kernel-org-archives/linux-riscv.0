Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D50CF34C7
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 15:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EotfTV2S0yLcUZ8OMxaHI0LqvaGENhKdOxRRlBpeW9c=; b=zUuVuEAin5CDQh
	znyHd73bC344J/NG1WUzgLIBPQwsZ4gtiWVaQTtjW70s3T72oAd2Qq4UWt7xoUgzAOyf8NbTZ3i+Z
	Lzm4O3M7RbxtZ1Cs5ufgwl5lm0BHhNaeUA/nqrJkKArx8/lPopZx5OS+lJChmEi/rrn/36PlwQAfD
	R1oROVenXJiE6wTqVhdB+pAtVkJpH9zUv5ZXLrjGyPKjirfOkfzBca/Np2AbZnMfnDQNfGVz2BE1j
	ti+ZTPsvGMlTKp8WGjL8Pz0yhKxn2SRkVjS/Guyl9azTgRmsA+cc4VkJqxfglXWQ34rKZR9fz9g5n
	e567F/4iDW4pDa30PcSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjjX-00000003SDi-0soZ;
	Wed, 19 Nov 2025 15:04:35 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjjT-00000003SAn-2tpU
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 15:04:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E0584E417A5;
	Wed, 19 Nov 2025 15:04:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12AD160699;
	Wed, 19 Nov 2025 15:04:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AF2610371A6A;
	Wed, 19 Nov 2025 16:04:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763564668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=iOlkPCGpg/MS+MVjysj2yGEdNDC307nbqdpz8sSAuv0=;
	b=pydQ9Cm/qN+VYxsz9ea5stWmObgr9qhSdrASCCjEPUvYmak8eHP47YpqmmAg/tkKCk/Jl3
	XjUzyN0fKdeUd4GLVr9+vjbRQYRB1JS0RPpxGjzl1gzELMJNBdieiCGAF4Xccko61ckjiL
	bhqntexyJ9bG6Mm8ZuZmEmSioCgnGbLtDUDV1jAw8fqR4FFR7sgyZfvMKPaQFd05aK2+7K
	VrVAw/L1VhoIC8Qbj1PND/v39ak718JA6YKAtbiQAqGzNsaERPvGuKMkc3+QiRziw/GXFP
	sXOdLDFBk6nZjRZoyPGjNuubGQ2MUqWjnMvMHhDE0bZM4TYIETvG8n/8HYV7FA==
Message-ID: <b04b1abe-c75b-4f59-b9a9-183df0c56d08@bootlin.com>
Date: Wed, 19 Nov 2025 16:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: stmmac: move probe/remove calling of
 init/exit
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
 "David S. Miller" <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>,
 Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, s32@nxp.com,
 Samuel Holland <samuel@sholland.org>
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk>
 <E1vLf2Z-0000000FMNH-0xPV@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vLf2Z-0000000FMNH-0xPV@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_070432_008555_CBCEE2E9 
X-CRM114-Status: GOOD (  21.89  )
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



On 19/11/2025 11:03, Russell King (Oracle) wrote:
> Move the probe/remove time calling of the init()/exit() methods in
> the platform data to the main driver probe/remove functions. This
> allows them to be used by non-platform_device based drivers.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 47 ++++++++++++++-----
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 23 +--------
>  2 files changed, 36 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 644dccb29f75..aac8188248ff 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7593,19 +7593,9 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(stmmac_plat_dat_alloc);
>  
> -/**
> - * stmmac_dvr_probe
> - * @device: device pointer
> - * @plat_dat: platform data pointer
> - * @res: stmmac resource pointer
> - * Description: this is the main probe function used to
> - * call the alloc_etherdev, allocate the priv structure.
> - * Return:
> - * returns 0 on success, otherwise errno.
> - */
> -int stmmac_dvr_probe(struct device *device,
> -		     struct plat_stmmacenet_data *plat_dat,
> -		     struct stmmac_resources *res)
> +static int __stmmac_dvr_probe(struct device *device,
> +			      struct plat_stmmacenet_data *plat_dat,
> +			      struct stmmac_resources *res)
>  {
>  	struct net_device *ndev = NULL;
>  	struct stmmac_priv *priv;
> @@ -7912,6 +7902,34 @@ int stmmac_dvr_probe(struct device *device,
>  
>  	return ret;
>  }
> +
> +/**
> + * stmmac_dvr_probe
> + * @dev: device pointer
> + * @plat_dat: platform data pointer
> + * @res: stmmac resource pointer
> + * Description: this is the main probe function used to
> + * call the alloc_etherdev, allocate the priv structure.
> + * Return:
> + * returns 0 on success, otherwise errno.
> + */
> +int stmmac_dvr_probe(struct device *dev, struct plat_stmmacenet_data *plat_dat,
> +		     struct stmmac_resources *res)
> +{
> +	int ret;
> +
> +	if (plat_dat->init) {
> +		ret = plat_dat->init(dev, plat_dat->bsp_priv);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = __stmmac_dvr_probe(dev, plat_dat, res);
> +	if (ret && plat_dat->exit)
> +		plat_dat->exit(dev, plat_dat->bsp_priv);
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL_GPL(stmmac_dvr_probe);
>  
>  /**
> @@ -7950,6 +7968,9 @@ void stmmac_dvr_remove(struct device *dev)
>  
>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
> +
> +	if (priv->plat->exit)
> +		priv->plat->exit(dev, priv->plat->bsp_priv);
>  }
>  EXPORT_SYMBOL_GPL(stmmac_dvr_remove);
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index feccb8a3e7e8..9015b7f80d1b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -804,25 +804,12 @@ int stmmac_pltfr_probe(struct platform_device *pdev,
>  		       struct plat_stmmacenet_data *plat,
>  		       struct stmmac_resources *res)
>  {
> -	struct device *dev = &pdev->dev;
> -	int ret;
> -
>  	if (!plat->suspend && plat->exit)
>  		plat->suspend = stmmac_plat_suspend;
>  	if (!plat->resume && plat->init)
>  		plat->resume = stmmac_plat_resume;
>  
> -	ret = stmmac_pltfr_init(dev, plat);
> -	if (ret)
> -		return ret;
> -
> -	ret = stmmac_dvr_probe(dev, plat, res);
> -	if (ret) {
> -		stmmac_pltfr_exit(dev, plat);
> -		return ret;
> -	}
> -
> -	return ret;
> +	return stmmac_dvr_probe(&pdev->dev, plat, res);
>  }
>  EXPORT_SYMBOL_GPL(stmmac_pltfr_probe);
>  
> @@ -864,13 +851,7 @@ EXPORT_SYMBOL_GPL(devm_stmmac_pltfr_probe);
>   */
>  void stmmac_pltfr_remove(struct platform_device *pdev)
>  {
> -	struct net_device *ndev = platform_get_drvdata(pdev);
> -	struct stmmac_priv *priv = netdev_priv(ndev);
> -	struct plat_stmmacenet_data *plat = priv->plat;
> -	struct device *dev = &pdev->dev;
> -
> -	stmmac_dvr_remove(dev);
> -	stmmac_pltfr_exit(dev, plat);
> +	stmmac_dvr_remove(&pdev->dev);
>  }
>  EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

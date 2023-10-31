Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1560C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ruDPjcHnCu+S2FKLE5Vor0vIbxVO+ouDQYwuoT4HDHg=; b=VcJ+wh48hyAM9xCnz12gdBjvuz
	MUowiSEpiaZZcDB685xzBf/ft9SxNOlM4zM8pqldQrVN77eyOJNOE8I+mi7wfBwST6ykfPpGlAVj7
	tycrj8axDRJGAQ83BB3z90i0gXrs9wrjh8NZvNZGVg77J2sVsHUApQOvpF9QJcYW0d2DzGFwrf+iv
	hC1q37DC1zv4WKV5Qvsfcmt6xgg8d/JC+a2EclvOHQyoAGq4PtkILxFqKw07zlF0oV8u2CyWUV5Uv
	N3QXaGyFtvHIhg7LRnBA5vBLqosmzWnhozL95jhGctgU5ZTy8d6OrKjVBElMMfSAKUQzssQtSr+++
	icVBheXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpoe-005RZs-2Z;
	Tue, 31 Oct 2023 14:34:00 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpob-005RYl-2J
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:33:59 +0000
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C863040947
	for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 14:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698762834;
	bh=COgus/3ZSuwT+db+ge/hLLqZedK9bhS7aDmQpcwmeRs=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=pKRxZ27g12d3CP7xd6GzxzNtCroWm+aae+LdfT2U0ihVagT1f4aJiY1oEp7fMssce
	 m4uWhxgtXGFWp0Yupeln1XmvGtpem/CGS37nNvNc46JXc/WgkynCZEtincrTbMCFF7
	 uqnMHWDrtrbF3Yzoxe7bpqv5pbfIeVkp56exvn0gOvqNRBsYuWz1iKsyCiviLou0NE
	 /VifAcQ5WrAFR/zFYNtZ/vImPQAHx7ZqGB0zw/dIBkI92ujQWCCoeFijDpwOPHCTPN
	 Qzm1LMGWNbDVc10Q7qchFVNHRKpaoKhwXKab5VwfeJcycqOGCW54OWU9Yo199Vd1l4
	 KvT016xtXy7gQ==
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-66d20c7dad2so73576106d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 07:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698762831; x=1699367631;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=COgus/3ZSuwT+db+ge/hLLqZedK9bhS7aDmQpcwmeRs=;
        b=xBieoHKpbjED+8s7Ry3B882+Vj9wCaA9Eq1Mnf0C4XXQoH884qBlbo+zNABLIuU/xc
         kMzMRaDSe2uToaXvRFFLHZCAqyD4rBkiaqBG1+hMF4GT3/J+NunbVKCOBubKhEK++b91
         XFgR+GefL5WRB6QZCxy0ggHuwKEAHyrFWd6x6qixrodtVNsqeHRX3NSJaB1viWtirL3E
         6s9AqvyjOAIay9JKZ5suIXJrnpt1gyWzASLrVbsTdzOLeuajnNMbeCz4F/GD458ASGX1
         tJglx89Oep5Ujz5Hx/5UQemIpDUwmLj9teYlfDSiODhqc6jgtzlidkqAMBtyCDGFGR3X
         3OYw==
X-Gm-Message-State: AOJu0Ywl9JBBqApuYQoha6R+qWMRK4uNkOvBgsmUf2sIcJ4UfbcWXn3Q
	oE3EzAKz+a6w4nHI7HjuLCTCCNEBDGNba5SSpgGeW9kYrLPiswwpa8OkDQWmjtZGhr3927iTEai
	/4V/ZOTG/4KSQugPDasGro6/fIG+k9apIoPEqog7x5GRsyYI7usBCdPsDX4+MUw==
X-Received: by 2002:a05:6214:29c7:b0:671:9c02:cba9 with SMTP id gh7-20020a05621429c700b006719c02cba9mr8520646qvb.51.1698762831418;
        Tue, 31 Oct 2023 07:33:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF74SsUAurkkruUb75fgXBV0BIjaQzXoMkI8lq6APUuq85/spyU3nh/61hrUO+aeB6Sqk13/8jIe+UO0RD6jOs=
X-Received: by 2002:a05:6214:29c7:b0:671:9c02:cba9 with SMTP id
 gh7-20020a05621429c700b006719c02cba9mr8520611qvb.51.1698762831069; Tue, 31
 Oct 2023 07:33:51 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 Oct 2023 07:33:50 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231029042712.520010-6-cristian.ciocaltea@collabora.com>
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com> <20231029042712.520010-6-cristian.ciocaltea@collabora.com>
Mime-Version: 1.0
Date: Tue, 31 Oct 2023 07:33:50 -0700
Message-ID: <CAJM55Z8K5QztgU9NYiJ1kv+-BSsgP=LCABN7BYDtQ30_G1Nc7w@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] net: stmmac: dwmac-starfive: Add support for
 JH7100 SoC
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_073357_900213_704FC369 
X-CRM114-Status: GOOD (  28.14  )
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

Cristian Ciocaltea wrote:
> Add a missing quirk to enable support for the StarFive JH7100 SoC.
>
> Additionally, for greater flexibility in operation, allow using the
> rgmii-rxid and rgmii-txid phy modes.
>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Hi Cristian,

Thanks for working on this! This driver has code to update the phy clock for
different line speeds. I don't think that will work without the
CLK_SET_RATE_PARENT flag added to the clock in [1] which in turn depends on
[2].

[1]: https://github.com/esmil/linux/commit/b200c3054b58a49ba25af67aff82d9045e3c3666
[2]: https://github.com/esmil/linux/commit/dce189542c16bf0eb8533d96c0305cb59d149dae

Two more comments below..

> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  6 ++--
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 32 ++++++++++++++++---
>  2 files changed, 31 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index a2b9e289aa36..c3c2c8360047 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -165,9 +165,9 @@ config DWMAC_STARFIVE
>  	help
>  	  Support for ethernet controllers on StarFive RISC-V SoCs
>
> -	  This selects the StarFive platform specific glue layer support for
> -	  the stmmac device driver. This driver is used for StarFive JH7110
> -	  ethernet controller.
> +	  This selects the StarFive platform specific glue layer support
> +	  for the stmmac device driver. This driver is used for the
> +	  StarFive JH7100 and JH7110 ethernet controllers.
>
>  config DWMAC_STI
>  	tristate "STi GMAC support"
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 5d630affb4d1..88c431edcea0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -15,13 +15,20 @@
>
>  #include "stmmac_platform.h"
>
> -#define STARFIVE_DWMAC_PHY_INFT_RGMII	0x1
> -#define STARFIVE_DWMAC_PHY_INFT_RMII	0x4
> -#define STARFIVE_DWMAC_PHY_INFT_FIELD	0x7U
> +#define STARFIVE_DWMAC_PHY_INFT_RGMII		0x1
> +#define STARFIVE_DWMAC_PHY_INFT_RMII		0x4
> +#define STARFIVE_DWMAC_PHY_INFT_FIELD		0x7U
> +
> +#define JH7100_SYSMAIN_REGISTER49_DLYCHAIN	0xc8
> +
> +struct starfive_dwmac_data {
> +	unsigned int gtxclk_dlychain;
> +};
>
>  struct starfive_dwmac {
>  	struct device *dev;
>  	struct clk *clk_tx;
> +	const struct starfive_dwmac_data *data;
>  };
>
>  static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> @@ -67,6 +74,8 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
>
>  	case PHY_INTERFACE_MODE_RGMII:
>  	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
>  		mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
>  		break;
>
> @@ -89,6 +98,14 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
>  	if (err)
>  		return dev_err_probe(dwmac->dev, err, "error setting phy mode\n");
>
> +	if (dwmac->data) {

I think you want something like this so future quirks don't need to touch this
code:

	if (dwmac->data && dwmac->data->gtxclk_dlychain)

> +		err = regmap_write(regmap, JH7100_SYSMAIN_REGISTER49_DLYCHAIN,
> +				   dwmac->data->gtxclk_dlychain);
> +		if (err)
> +			return dev_err_probe(dwmac->dev, err,
> +					     "error selecting gtxclk delay chain\n");
> +	}
> +
>  	return 0;
>  }
>
> @@ -114,6 +131,8 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
>  	if (!dwmac)
>  		return -ENOMEM;
>
> +	dwmac->data = device_get_match_data(&pdev->dev);
> +
>  	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
>  	if (IS_ERR(dwmac->clk_tx))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
> @@ -144,8 +163,13 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
>  	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  }
>
> +static const struct starfive_dwmac_data jh7100_data = {
> +	.gtxclk_dlychain = 4

Please add a , at the end of this line. I know it's unlikely that we need to
add more properties, but it's still good practice to do. This way such patches
won't need to touch this line.

> +};
> +
>  static const struct of_device_id starfive_dwmac_match[] = {
> -	{ .compatible = "starfive,jh7110-dwmac"	},
> +	{ .compatible = "starfive,jh7100-dwmac", .data = &jh7100_data },
> +	{ .compatible = "starfive,jh7110-dwmac" },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, starfive_dwmac_match);
> --
> 2.42.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

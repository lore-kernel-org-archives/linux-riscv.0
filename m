Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C98C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 14:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NF95SUdz9uQ4OXnbs+HC4ixQgsFU/Ff3v3Fb1cTD/hQ=; b=E7fmqLV+/eHC9A
	8tBMtzaWFwS7p+OKp/WpEWp7ALQwsW/Lqiw1xyU1zZVAEK0JQbMVA25rCAPFFuHjQoMLWPrBu7d0w
	6yskuxhz8gL1u7A/VU52lin+vNamJcGcidE34yzPB2uf7B7pqF67cBulC43wQs6hWtmESycCOMriA
	kfWU8Et0+E9ocPTcscmagrdMxfXy/B/5SMNj9rw+uINpkHAgB+QFC8XH3D4bqjZ2QGWDkgOiqSZst
	Jc2c744fKbB87zTfb+cM+TtWJQ+ItZTUC/j26xRfsWqANYSx8rMOWNX3vu5JyTBfZfuriu8hWovNI
	gNR+Bi+R2JROW0qooSxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2vEO-004fdh-Nt; Wed, 07 Dec 2022 14:17:04 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2vEK-004fWU-4f
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 14:17:03 +0000
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8564E44345
	for <linux-riscv@lists.infradead.org>; Wed,  7 Dec 2022 14:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1670422615;
	bh=0TQumGkPBfGZkbUnE2eIaWNrjWJVr3n7Xa2FW9xBHzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=WYpt88iMaJBsbjbmZ3RHxmRQincDSyvWYSjh42RGUUmfKfsdLcCLME4+KnaoewxE4
	 7V5esq7J72g3syejjSOpwaaGTZSS6xLa7/pXQ2ILzBwNlphCirmjoKewiQ39tsT6NZ
	 cp+y+HqROhzkufeoYHO2a7pBYayTF0+OXp1gOnuUKSFwoz8TrAanBiWMoudFkjbPct
	 GfE/SdfjamzO+SzhExEv00YHzTVmZs7V8o1gvg/VLBJcnvrZj2A6FHaBCTcikh703C
	 hpUQm/H6kUR2PCDbr45adYgb8OOOSD9ijcj3hEFhFqP5LzattXbs1qmSrjB4GMV5dh
	 +p/Qe3Z53J+jA==
Received: by mail-yb1-f198.google.com with SMTP id r7-20020a25c107000000b006ff55ac0ee7so11750606ybf.15
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 06:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0TQumGkPBfGZkbUnE2eIaWNrjWJVr3n7Xa2FW9xBHzQ=;
        b=bOlB6eBGC0s9w1LXhkaZz/WV/6jIN6P4XdDQRYy/1h0KUzYNbjRE8Wm0DHkRb0BJHN
         Z92lOW7K7akBFzL+gIXvnFxsxdQTOoog/YqxTnGO5pzjJaEFIy6ER+RfKShRD+Rh+URi
         fXaGvwyjInBlZQ+iYgte5cgGJ465W/M5HqWXsJthMXAD4KmfFbT1Ek5JmCXU8xcyr5W6
         7hERR6pNCvR2o4Ve04x5CeLNxKFRinNaDEMZ9Aoqv9E8vc/NOWIEnLN28yxrJ/kfBytD
         81VLb46td4lZm2uhQItAyTYj2bueON5loENzgtQEHVzbm9qjOgT7+l331afFMl0wW2Rb
         jl2Q==
X-Gm-Message-State: ANoB5plGfzOzoFRI8+hYBFkE5hQFicm9inUrMxW7O9emb0u2lZh2dPFO
	MjXMrdUf3qA9Jp7XTN9yPvYO4Lmb29k22RkpDkHub+EcE37DTD1fjT7t00ZhzgJF6kkBWy3rvOS
	t722KHuRnF0Y9JNASwpQ3LQV9apXBksyQJkktkJwsozbY5FsL7/J4+X4ojWjmXw==
X-Received: by 2002:a81:1e04:0:b0:391:fccf:db48 with SMTP id e4-20020a811e04000000b00391fccfdb48mr19742460ywe.257.1670422614383;
        Wed, 07 Dec 2022 06:16:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5jJpSrSo/VPL2KWSG5PgoBvSpVrm0KRx1TI9YUKLQbZERI9ER36jaV4ypZMpKyQmKmqs8L1xzE8rxQNhfbb7A=
X-Received: by 2002:a81:1e04:0:b0:391:fccf:db48 with SMTP id
 e4-20020a811e04000000b00391fccfdb48mr19742434ywe.257.1670422614064; Wed, 07
 Dec 2022 06:16:54 -0800 (PST)
MIME-Version: 1.0
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com> <20221201090242.2381-6-yanhong.wang@starfivetech.com>
In-Reply-To: <20221201090242.2381-6-yanhong.wang@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 7 Dec 2022 15:16:37 +0100
Message-ID: <CAJM55Z9bdpxLsKOM8UhE=b5Z2uPzL227N1-x6d8AuvkZHRajqA@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] net: stmmac: Add StarFive dwmac supoort
To: Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_061700_368293_C1562350 
X-CRM114-Status: GOOD (  33.30  )
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

Hi Yanhong,

Thanks for submitting this. Again please don't change the author of
the commits you cherry-picked from my tree. This is why we have the
Co-developed-by: tag so you can mark that you added or in this case
removed code.
I'd hoped you would still include the support for the JH7100 though.

Also you seem to have changed the name of some of the functions.
Please at least keep the prefix consistent if you do that. Now it's a
mix of dwmac_starfive_, starfive_eth_ and starfive_eth_plat.

On Thu, 1 Dec 2022 at 10:07, Yanhong Wang <yanhong.wang@starfivetech.com> wrote:
>
> This adds StarFive dwmac driver support on the StarFive JH7110 SoCs.
>
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../stmicro/stmmac/dwmac-starfive-plat.c      | 147 ++++++++++++++++++
>  4 files changed, 160 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7eaaec8d3b96..36cb00cf860b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19610,6 +19610,7 @@ STARFIVE DWMAC GLUE LAYER
>  M:     Yanhong Wang <yanhong.wang@starfivetech.com>
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml
> +F:     drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c
>
>  STARFIVE PINCTRL DRIVER
>  M:     Emil Renner Berthing <kernel@esmil.dk>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 31ff35174034..1e29cd3770b9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -235,6 +235,17 @@ config DWMAC_INTEL_PLAT
>           the stmmac device driver. This driver is used for the Intel Keem Bay
>           SoC.
>
> +config DWMAC_STARFIVE_PLAT

Why did you add the _PLAT suffix? None of the other SoC wrappers have this..

> +       tristate "StarFive dwmac support"
> +       depends on OF && COMMON_CLK
> +       depends on STMMAC_ETH
> +       default SOC_STARFIVE
> +       help
> +         Support for ethernet controllers on StarFive RISC-V SoCs
> +
> +         This selects the StarFive platform specific glue layer support for
> +         the stmmac device driver. This driver is used for StarFive RISC-V SoCs.
> +
>  config DWMAC_VISCONTI
>         tristate "Toshiba Visconti DWMAC support"
>         default ARCH_VISCONTI
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index d4e12e9ace4f..a63ab0ab5071 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -31,6 +31,7 @@ obj-$(CONFIG_DWMAC_DWC_QOS_ETH)       += dwmac-dwc-qos-eth.o
>  obj-$(CONFIG_DWMAC_INTEL_PLAT) += dwmac-intel-plat.o
>  obj-$(CONFIG_DWMAC_GENERIC)    += dwmac-generic.o
>  obj-$(CONFIG_DWMAC_IMX8)       += dwmac-imx.o
> +obj-$(CONFIG_DWMAC_STARFIVE_PLAT)      += dwmac-starfive-plat.o
>  obj-$(CONFIG_DWMAC_VISCONTI)   += dwmac-visconti.o
>  stmmac-platform-objs:= stmmac_platform.o
>  dwmac-altr-socfpga-objs := altr_tse_pcs.o dwmac-socfpga.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c
> new file mode 100644
> index 000000000000..8fbf584d4e19
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c
> @@ -0,0 +1,147 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * StarFive DWMAC platform driver
> + *
> + * Copyright(C) 2022 StarFive Technology Co., Ltd.

Hmm.. where did my copyright go?

> + *
> + */
> +
> +#include <linux/of_device.h>
> +#include "stmmac_platform.h"
> +
> +struct starfive_dwmac {
> +       struct device *dev;
> +       struct clk *clk_tx;
> +       struct clk *clk_gtx;
> +       struct clk *clk_gtxc;
> +};
> +
> +static void starfive_eth_fix_mac_speed(void *priv, unsigned int speed)
> +{
> +       struct starfive_dwmac *dwmac = priv;
> +       unsigned long rate;
> +       int err;
> +
> +       switch (speed) {
> +       case SPEED_1000:
> +               rate = 125000000;
> +               break;
> +       case SPEED_100:
> +               rate = 25000000;
> +               break;
> +       case SPEED_10:
> +               rate = 2500000;
> +               break;
> +       default:
> +               dev_err(dwmac->dev, "invalid speed %u\n", speed);
> +               return;
> +       }
> +
> +       err = clk_set_rate(dwmac->clk_gtx, rate);
> +       if (err)
> +               dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
> +}
> +
> +static void dwmac_starfive_clk_disable(void *clk)
> +{
> +       clk_disable_unprepare(clk);
> +}
> +
> +static int starfive_eth_plat_probe(struct platform_device *pdev)
> +{
> +       struct plat_stmmacenet_data *plat_dat;
> +       struct stmmac_resources stmmac_res;
> +       struct starfive_dwmac *dwmac;
> +       int err;
> +
> +       err = stmmac_get_platform_resources(pdev, &stmmac_res);
> +       if (err)
> +               return err;
> +
> +       plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +       if (IS_ERR(plat_dat)) {
> +               dev_err(&pdev->dev, "dt configuration failed\n");
> +               return PTR_ERR(plat_dat);
> +       }
> +
> +       dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> +       if (!dwmac)
> +               return -ENOMEM;
> +
> +       dwmac->clk_tx = devm_clk_get(&pdev->dev, "tx");
> +       if (IS_ERR(dwmac->clk_tx))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
> +                                               "error getting tx clock\n");
> +
> +       err = devm_add_action(&pdev->dev, dwmac_starfive_clk_disable,
> +                             dwmac->clk_tx);
> +       if (err)
> +               return err;
> +
> +       err = clk_prepare_enable(dwmac->clk_tx);
> +       if (err)
> +               return dev_err_probe(&pdev->dev, err, "error enabling tx clock\n");
> +
> +       dwmac->clk_gtx = devm_clk_get(&pdev->dev, "gtx");
> +       if (IS_ERR(dwmac->clk_gtx))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_gtx),
> +                                               "error getting gtx clock\n");
> +
> +       err = devm_add_action(&pdev->dev, dwmac_starfive_clk_disable,
> +                             dwmac->clk_gtx);
> +       if (err)
> +               return err;
> +
> +       err = clk_prepare_enable(dwmac->clk_gtx);
> +       if (err)
> +               return dev_err_probe(&pdev->dev, err, "error enabling gtx clock\n");

I think the 3 calls above can be simplified to devm_clk_get_enabled().

> +       dwmac->clk_gtxc = devm_clk_get(&pdev->dev, "gtxc");
> +       if (IS_ERR(dwmac->clk_gtxc))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_gtxc),
> +                                               "error getting gtxc clock\n");
> +
> +       err = devm_add_action(&pdev->dev, dwmac_starfive_clk_disable,
> +                             dwmac->clk_gtxc);
> +       if (err)
> +               return err;
> +
> +       err = clk_prepare_enable(dwmac->clk_gtxc);
> +       if (err)
> +               return dev_err_probe(&pdev->dev, err, "error enabling gtxc clock\n");

Same here.

> +
> +       dwmac->dev = &pdev->dev;
> +       plat_dat->fix_mac_speed = starfive_eth_fix_mac_speed;
> +       plat_dat->init = NULL;
> +       plat_dat->bsp_priv = dwmac;
> +       plat_dat->dma_cfg->dche = true;
> +
> +       err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> +       if (err) {
> +               stmmac_remove_config_dt(pdev, plat_dat);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id starfive_eth_plat_match[] = {
> +       {.compatible = "starfive,dwmac"},
> +       { }
> +};
> +
> +static struct platform_driver starfive_eth_plat_driver = {
> +       .probe  = starfive_eth_plat_probe,
> +       .remove = stmmac_pltfr_remove,
> +       .driver = {
> +               .name = "starfive-eth-plat",
> +               .pm = &stmmac_pltfr_pm_ops,
> +               .of_match_table = starfive_eth_plat_match,
> +       },
> +};
> +
> +module_platform_driver(starfive_eth_plat_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("StarFive DWMAC platform driver");

Here you also seem to have removed me.

> +MODULE_AUTHOR("Yanhong Wang <yanhong.wang@starfivetech.com>");
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

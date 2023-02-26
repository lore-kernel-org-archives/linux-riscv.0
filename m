Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6846BC64ED6
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Feb 2023 15:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfwmMgkP+uo4gPIlcLs2/aVuc8G5LMut6oyiRqxOp78=; b=ghPhWUNIpU1ked
	YmoJ5ctklcOyDsleXB1rrSvDVQMRnuPtchaeeOl7jH2oZEfoQIk+nNTH5xPYmR51EPoCy49Hy8sfL
	dEbCOFnTIwNwz2tDLKb02vn5YePiC6DJOzChbKS/ilC5kjrWNNkZriAwJBmZTTHnXtboqeeIapHLg
	k7Ws+PGXy4VE3cFQFfQQSt/Zq4UwhLwwsksJHJwKg81Np9iCKQgZwPLgUqHjsXfB6PXbdL2odWQRK
	fbqxcFkHmNiTPcf+VhMo/WCC8VRxyH2wHQ8k/yoURS6thBbBq4nocIEbetv4qLRi2eGji/e06mMPv
	m9Oga3G+CpL8tszZBZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWIkr-007VgB-9I; Sun, 26 Feb 2023 15:16:01 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWIkl-007Vff-0A
	for linux-riscv@lists.infradead.org; Sun, 26 Feb 2023 15:15:57 +0000
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 93C413F5A0
	for <linux-riscv@lists.infradead.org>; Sun, 26 Feb 2023 15:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1677424552;
	bh=wIBy6U41Dj5n4ITVB/Mns+jjmQ4eaV8djJQzjN4oRmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=YY1lYwftwx/w5BIGEbceF++jawqPgcS/hKW8hstBlR7F1kAt2uBs2/8Y13xmLAWyj
	 XoRlPBktBtg+/EHvTQMCz0lh44fKKk/c8aFHE162+JY2eay3nX0zfdi0vELW5ovj5u
	 zsQ2h+l1jkpo4jKaO++OSGJ0+fwFk+NoCtDKxMa5q6p/AjP2PECFSdfqPUBDvt532w
	 1FlEl7gjX2u3JSX+1Q4C57sPQKuyEpNim9d9Pi1TIls/wNo9xxslGsPbvhyYdjhV3H
	 PI4yfF5p4V1fRflj6BKQp7ZHoZCecgcq0hnJlD3vnQvaZf/47J2MIbDHrJFRlH/gyV
	 0L9Nqjq2bC3zw==
Received: by mail-qv1-f70.google.com with SMTP id u18-20020a0cec92000000b0056ea549d728so2111540qvo.10
        for <linux-riscv@lists.infradead.org>; Sun, 26 Feb 2023 07:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIBy6U41Dj5n4ITVB/Mns+jjmQ4eaV8djJQzjN4oRmU=;
        b=Wf1UY9HUdhV9B1xl1IUNrE2ivcuMGD8P4ZqIH7eU2YYO53A5bO8jNdMxFg/aaqzUTL
         AjHNYo4kFueu0BZMG1LAvidh+1l5qS+qsgHBdTdqrG/RGGSm5SBw+8yvrR3BxlzSEqkF
         hC+XrD36i6dSpDJp5rJi0TO9eH6sNUcV39HhxO8BN9BOrl5pllI2/X2JzflBV5KDK0Nt
         r2SfStB+sZ8SdHgPUEnGwFBXqmPRx7oE3mBWPdplRcGmQREm8DSgXQNBwYD5Sv9bfx0L
         Uj8gKQFTidSoA9BxyNX+zOxQmbiDF0rBGA3UlqSf4QvBD2QRK1Ya/nQG2+hGIv8ANRO+
         KSxQ==
X-Gm-Message-State: AO0yUKVcJz6ZNT5Gq2gtMNkA9/wfrtqRfU5++j5l+fhV1u6aIn9LQRX0
	c9Bx/DpKK4VvxAb4Oh8u4ZA14TVNYFUz8M2ujUfw7Pcp5igJDvaBSt+sT0+RGXqnUTcBUQnpAiJ
	7SLV/cQF2sZpubnvr6Tv37razaXt9DU0opkAYHqY19jEHmVUms8hR/ScI+6FT7Q==
X-Received: by 2002:a05:620a:a07:b0:73b:a941:7206 with SMTP id i7-20020a05620a0a0700b0073ba9417206mr4398877qka.7.1677424551263;
        Sun, 26 Feb 2023 07:15:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8kQriIg1Y8SjWJC50nqEv7gKjengpifGiOd7lR5AGwmNGEmtjmOyntTOaSQCXjHHlWUCWd3sZxCSc6ihPh31c=
X-Received: by 2002:a05:620a:a07:b0:73b:a941:7206 with SMTP id
 i7-20020a05620a0a0700b0073ba9417206mr4398863qka.7.1677424550956; Sun, 26 Feb
 2023 07:15:50 -0800 (PST)
MIME-Version: 1.0
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-6-yanhong.wang@starfivetech.com> <CAJM55Z-zvb5CJq4PU4c=YKvY0xPY216MAALFsmWTcVFjSd=wEA@mail.gmail.com>
 <dfddde90-ddce-d0e5-d31c-bbbbecaf7323@starfivetech.com>
In-Reply-To: <dfddde90-ddce-d0e5-d31c-bbbbecaf7323@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Sun, 26 Feb 2023 16:15:34 +0100
Message-ID: <CAJM55Z-Pkd5+GBi4NYEuRSHezvJ_vUYiWLdQCpY2D2RqLa-btw@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] net: stmmac: Add glue layer for StarFive JH7110 SoCs
To: yanhong wang <yanhong.wang@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, samin.guo@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_071555_493309_70972748 
X-CRM114-Status: GOOD (  39.67  )
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

On Tue, 21 Feb 2023 at 03:27, yanhong wang
<yanhong.wang@starfivetech.com> wrote:
>
> add  samin.guo@starfivetech.com  to loop.
>
> On 2023/2/16 18:53, Emil Renner Berthing wrote:
> > On Wed, 18 Jan 2023 at 07:20, Yanhong Wang
> > <yanhong.wang@starfivetech.com> wrote:
> >>
> >> This adds StarFive dwmac driver support on the StarFive JH7110 SoCs.
> >>
> >> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> >> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >> ---
> >>  MAINTAINERS                                   |   1 +
> >>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
> >>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >>  .../stmicro/stmmac/dwmac-starfive-plat.c      | 118 ++++++++++++++++++
> >>  4 files changed, 132 insertions(+)
> >>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 56be59bb09f7..5b50b52d3dbb 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -19609,6 +19609,7 @@ F:      include/dt-bindings/clock/starfive*
> >>  STARFIVE DWMAC GLUE LAYER
> >>  M:     Yanhong Wang <yanhong.wang@starfivetech.com>
> >>  S:     Maintained
> >> +F:     Documentation/devicetree/bindings/net/dwmac-starfive-plat.c
> >>  F:     Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> >>
> >>  STARFIVE PINCTRL DRIVER
> >> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> >> index 31ff35174034..f9a4ad4abd54 100644
> >> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> >> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> >> @@ -235,6 +235,18 @@ config DWMAC_INTEL_PLAT
> >>           the stmmac device driver. This driver is used for the Intel Keem Bay
> >>           SoC.
> >>
> >> +config DWMAC_STARFIVE_PLAT
> >> +       tristate "StarFive dwmac support"
> >> +       depends on OF && COMMON_CLK
> >> +       depends on STMMAC_ETH
> >> +       default SOC_STARFIVE
> >> +       help
> >> +         Support for ethernet controllers on StarFive RISC-V SoCs
> >> +
> >> +         This selects the StarFive platform specific glue layer support for
> >> +         the stmmac device driver. This driver is used for StarFive JH7110
> >> +         ethernet controller.
> >> +
> >>  config DWMAC_VISCONTI
> >>         tristate "Toshiba Visconti DWMAC support"
> >>         default ARCH_VISCONTI
> >> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> >> index d4e12e9ace4f..a63ab0ab5071 100644
> >> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> >> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> >> @@ -31,6 +31,7 @@ obj-$(CONFIG_DWMAC_DWC_QOS_ETH)       += dwmac-dwc-qos-eth.o
> >>  obj-$(CONFIG_DWMAC_INTEL_PLAT) += dwmac-intel-plat.o
> >>  obj-$(CONFIG_DWMAC_GENERIC)    += dwmac-generic.o
> >>  obj-$(CONFIG_DWMAC_IMX8)       += dwmac-imx.o
> >> +obj-$(CONFIG_DWMAC_STARFIVE_PLAT)      += dwmac-starfive-plat.o
> >
> > Hi Yanhong,
> >
> > For the next version could you please drop the _PLAT from the config
> > symbol and -plat from filename. I know the intel wrapper does the
> > same, but it's the only one, so lets do like the majority of other
> > wrappers and not add more different ways of doing things.
> >
>
> Thanks. I will fix.
>
> >>  obj-$(CONFIG_DWMAC_VISCONTI)   += dwmac-visconti.o
> >>  stmmac-platform-objs:= stmmac_platform.o
> >>  dwmac-altr-socfpga-objs := altr_tse_pcs.o dwmac-socfpga.o
> >> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c
> >> new file mode 100644
> >> index 000000000000..e441d920933a
> >> --- /dev/null
> >> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c
> >> @@ -0,0 +1,118 @@
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +/*
> >> + * StarFive DWMAC platform driver
> >> + *
> >> + * Copyright(C) 2022 StarFive Technology Co., Ltd.
> >> + *
> >> + */
> >> +
> >> +#include <linux/of_device.h>
> >> +
> >> +#include "stmmac_platform.h"
> >> +
> >> +struct starfive_dwmac {
> >> +       struct device *dev;
> >> +       struct clk *clk_tx;
> >> +       struct clk *clk_gtx;
> >> +       struct clk *clk_gtxc;
> >> +};
> >
> > I like this name. For the next version could you also
> > s/starfive_eth_plat_/starfive_dwmac_/ on the function/struct names
> > below for consistency.
> >
>
> I will fix.
>
> >> +
> >> +static void starfive_eth_plat_fix_mac_speed(void *priv, unsigned int speed)
> >> +{
> >> +       struct starfive_dwmac *dwmac = priv;
> >> +       unsigned long rate;
> >> +       int err;
> >> +
> >> +       rate = clk_get_rate(dwmac->clk_gtx);
> >> +
> >> +       switch (speed) {
> >> +       case SPEED_1000:
> >> +               rate = 125000000;
> >> +               break;
> >> +       case SPEED_100:
> >> +               rate = 25000000;
> >> +               break;
> >> +       case SPEED_10:
> >> +               rate = 2500000;
> >> +               break;
> >> +       default:
> >> +               dev_err(dwmac->dev, "invalid speed %u\n", speed);
> >> +               break;
> >> +       }
> >> +
> >> +       err = clk_set_rate(dwmac->clk_gtx, rate);
> >> +       if (err)
> >> +               dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
> >> +}
> >> +
> >> +static int starfive_eth_plat_probe(struct platform_device *pdev)
> >> +{
> >> +       struct plat_stmmacenet_data *plat_dat;
> >> +       struct stmmac_resources stmmac_res;
> >> +       struct starfive_dwmac *dwmac;
> >> +       int err;
> >> +
> >> +       err = stmmac_get_platform_resources(pdev, &stmmac_res);
> >> +       if (err)
> >> +               return err;
> >> +
> >> +       plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> >> +       if (IS_ERR(plat_dat)) {
> >> +               dev_err(&pdev->dev, "dt configuration failed\n");
> >> +               return PTR_ERR(plat_dat);
> >> +       }
> >> +
> >> +       dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> >> +       if (!dwmac)
> >> +               return -ENOMEM;
> >> +
> >> +       dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
> >> +       if (IS_ERR(dwmac->clk_tx))
> >> +               return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
> >> +                                               "error getting tx clock\n");
> >> +
> >> +       dwmac->clk_gtx = devm_clk_get_enabled(&pdev->dev, "gtx");
> >> +       if (IS_ERR(dwmac->clk_gtx))
> >> +               return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_gtx),
> >> +                                               "error getting gtx clock\n");
> >> +
> >> +       dwmac->clk_gtxc = devm_clk_get_enabled(&pdev->dev, "gtxc");
> >> +       if (IS_ERR(dwmac->clk_gtxc))
> >> +               return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_gtxc),
> >> +                                               "error getting gtxc clock\n");
> >> +
> >> +       dwmac->dev = &pdev->dev;
> >> +       plat_dat->fix_mac_speed = starfive_eth_plat_fix_mac_speed;
> >> +       plat_dat->init = NULL;
> >> +       plat_dat->bsp_priv = dwmac;
> >> +       plat_dat->dma_cfg->dche = true;
> >> +
> >> +       err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> >> +       if (err) {
> >> +               stmmac_remove_config_dt(pdev, plat_dat);
> >> +               return err;
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static const struct of_device_id starfive_eth_plat_match[] = {
> >> +       { .compatible = "starfive,jh7110-dwmac" },
> >> +       { }
> >> +};

I noticed you're missing a
MODULE_DEVICE_TABLE(of, starfive_dwmac_match);
here, so udev will load the module automatically.

While you're at it I also like the idiom of using { /* sentinel */ }
for the last entry here.

> >> +static struct platform_driver starfive_eth_plat_driver = {
> >> +       .probe  = starfive_eth_plat_probe,
> >> +       .remove = stmmac_pltfr_remove,
> >> +       .driver = {
> >> +               .name = "starfive-eth-plat",
> >> +               .pm = &stmmac_pltfr_pm_ops,
> >> +               .of_match_table = starfive_eth_plat_match,
> >> +       },
> >> +};
> >> +
> >> +module_platform_driver(starfive_eth_plat_driver);
> >> +
> >> +MODULE_LICENSE("GPL");
> >> +MODULE_DESCRIPTION("StarFive DWMAC platform driver");
> >> +MODULE_AUTHOR("Yanhong Wang <yanhong.wang@starfivetech.com>");
> >> --
> >> 2.17.1
> >>
> >>
> >> _______________________________________________
> >> linux-riscv mailing list
> >> linux-riscv@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

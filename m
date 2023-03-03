Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A02C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WO+sktERX46iVmGijhYVd+VY48qHCzbA5494TfhWZtg=; b=gzUPrBQwXZxm6V
	z0/H2SJJl7r1sbd3vzhNCa6JsBFFa0xGEo7v9F9gHI/0xjq4ageUL0NuN9CPyYcMvIJdIIWjK/mSF
	glvp9+RMeDU4tP2vBg8wzaIKNXc3Kisy5E3pJEqZOZ5MKL3gyGI0pGjAsX2SxQ2Lk1By8WEJK/Hfm
	8FWVrF6wgUSZukLWmMenBphj2cuUl3KcpzfQl9kZHWxLbWWh/kEQrpmStFFhsP+5vRArs791RWTH/
	Z/ay5MVnqIPMCCOolZHNPcz8lder9azYansPGjPQsQVs1RMw8WS56SjkBTyV4gRaYgGYmsqhs0tMR
	Fa6A0jEvTkxM9HOyLI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY87O-006nNP-WF; Fri, 03 Mar 2023 16:18:51 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY87L-006nLn-9m
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 16:18:49 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8C346442D3
	for <linux-riscv@lists.infradead.org>; Fri,  3 Mar 2023 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1677860319;
	bh=es+hc5n+zswZQczR3HU2bkHqd0ak5Sb5q5T47HqNNMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hojpYLW76BR+5cfGgtygGx7lpCQzLS6qyqRO9RI+l4JnedhkerCkjlGi/RuCsurzQ
	 oOyWqko2eh97pLMGmn4WsyPJ9g3kog69pkEBA08xpSvi1nczHhDXPrCICgSoEEeShW
	 pGzjSfm46UQYvsr8+zZu8lMBIM51pd5taFNR66SYuvUffbqGD3STp6WwcnCAWgvhgB
	 2EdFSY7/4aPYJbFwMRZj0YTFn2DYgomTxCwQ8vfiiAOladrtoGyOrpEJDF7B2sA9nB
	 Fjre/YmdBp7ZmKDQ4LyD/Us9ZSsTdXn0VOa6ot6NINRTeg/bduwNLoFKIhfSZ7gnd1
	 miBK7V0i/EFNA==
Received: by mail-qt1-f198.google.com with SMTP id o10-20020a05622a138a00b003bfdabf3b89so1741744qtk.13
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 08:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=es+hc5n+zswZQczR3HU2bkHqd0ak5Sb5q5T47HqNNMA=;
        b=F/LIyPAUMOKC7TqOCPhVfx0Yw7mTSwZEfvRd3UlC6NuScPOpAABDxcucC6YwXbc6vD
         qVzYpwXy+0XadnSG5zeH2AuKkUvFoywnPgDvxvG2e1bd92uzxYRN/z/TQHC9DnXHoxj1
         xw3pFZh2NjVDVaH2hcRPSNDPVE4VgkBBGmcPlRihZXStOjU9h84q5nAEX1OJ+0O4decv
         cy7pKtQIrD5VW+jPyvNUvp272VgwChEJ5UsipKi9FFx/dK/8tf1N3/RHXyy2JjVNgPcJ
         z+pi4nu323wjIysn3/3gmbSY6q1EHxYUlQqGViqym1HKbXNqyG9JBw96AtUwn0VXS37R
         OGrg==
X-Gm-Message-State: AO0yUKUxMfn6zLJAlk3wjSYSV62y9XYY8oBi+srvTJjHqlg5ocU5E61s
	poU6i0TossiLM2dO1DLOB62xA/pV4oW4avpuRiROV+I93igSGiPvYQgORhzm+VAbVvHRObY7FUE
	WyO3n6d4soixYAM61Y1fTnXrhCaJSSbbhpm29Q285aCAJleItH96uHVViKOwSnQ==
X-Received: by 2002:a05:620a:ce4:b0:742:72c6:a140 with SMTP id c4-20020a05620a0ce400b0074272c6a140mr581871qkj.7.1677860316948;
        Fri, 03 Mar 2023 08:18:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/WnUl/2mIGv5HbkcMpWHdTYsy4cXNm7MUkXOf6ZEkkp6tp8hc/4NZfaxm1CxmBQZqOWJ6Fo6tgsl4GWNE1UFQ=
X-Received: by 2002:a05:620a:ce4:b0:742:72c6:a140 with SMTP id
 c4-20020a05620a0ce400b0074272c6a140mr581852qkj.7.1677860316551; Fri, 03 Mar
 2023 08:18:36 -0800 (PST)
MIME-Version: 1.0
References: <20230303085928.4535-1-samin.guo@starfivetech.com> <20230303085928.4535-7-samin.guo@starfivetech.com>
In-Reply-To: <20230303085928.4535-7-samin.guo@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 3 Mar 2023 17:18:20 +0100
Message-ID: <CAJM55Z_Ze3mD4UVtUFTRYN_n6WnobcFB5evgYZi9zBRNR2dU4w@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] net: stmmac: Add glue layer for StarFive JH7110 SoC
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, 
	Yanhong Wang <yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_081847_541504_E092C76C 
X-CRM114-Status: GOOD (  39.62  )
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

On Fri, 3 Mar 2023 at 10:01, Samin Guo <samin.guo@starfivetech.com> wrote:
> This adds StarFive dwmac driver support on the StarFive JH7110 SoC.
>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> ---
>  MAINTAINERS                                   |   1 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 125 ++++++++++++++++++
>  4 files changed, 139 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4e236b7c7fd2..91a4f190c827 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19916,6 +19916,7 @@ STARFIVE DWMAC GLUE LAYER
>  M:     Emil Renner Berthing <kernel@esmil.dk>
>  M:     Samin Guo <samin.guo@starfivetech.com>
>  S:     Maintained
> +F:     Documentation/devicetree/bindings/net/dwmac-starfive.c
>  F:     Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>
>  STARFIVE JH71X0 CLOCK DRIVERS
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index f77511fe4e87..47fbccef9d04 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -165,6 +165,18 @@ config DWMAC_SOCFPGA
>           for the stmmac device driver. This driver is used for
>           arria5 and cyclone5 FPGA SoCs.
>
> +config DWMAC_STARFIVE
> +       tristate "StarFive dwmac support"
> +       depends on OF  && (ARCH_STARFIVE || COMPILE_TEST)

There is an extra space between "OF" and "&&" here.


> +       depends on STMMAC_ETH

It's not visible in this patch context, but this whole config option
is surrounded by "if STMMAC_ETH" and "if STMMAC_PLATFORM", so "depends
on STMMAC_ETH" should not be needed.

> +       default ARCH_STARFIVE

This driver is not required to boot the JH7110, so we should just
default to building it as a module. Eg.
default m if ARCH_STARFIVE

> +       help
> +         Support for ethernet controllers on StarFive RISC-V SoCs
> +
> +         This selects the StarFive platform specific glue layer support for
> +         the stmmac device driver. This driver is used for StarFive JH7110
> +         ethernet controller.
> +
>  config DWMAC_STI
>         tristate "STi GMAC support"
>         default ARCH_STI
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index 057e4bab5c08..8738fdbb4b2d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_DWMAC_OXNAS)     += dwmac-oxnas.o
>  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)        += dwmac-qcom-ethqos.o
>  obj-$(CONFIG_DWMAC_ROCKCHIP)   += dwmac-rk.o
>  obj-$(CONFIG_DWMAC_SOCFPGA)    += dwmac-altr-socfpga.o
> +obj-$(CONFIG_DWMAC_STARFIVE)   += dwmac-starfive.o
>  obj-$(CONFIG_DWMAC_STI)                += dwmac-sti.o
>  obj-$(CONFIG_DWMAC_STM32)      += dwmac-stm32.o
>  obj-$(CONFIG_DWMAC_SUNXI)      += dwmac-sunxi.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> new file mode 100644
> index 000000000000..566378306f67
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * StarFive DWMAC platform driver
> + *
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>

Sorry, after looking at my old git branches where this started as a
driver for the JH7100 this should really be
* Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
* Copyright (C) 2022 StarFive Technology Co., Ltd.

> + */
> +
> +#include <linux/of_device.h>
> +
> +#include "stmmac_platform.h"
> +
> +struct starfive_dwmac {
> +       struct device *dev;
> +       struct clk *clk_tx;
> +       struct clk *clk_gtx;

This pointer is only set, but never read. Please remove it.

> +       bool tx_use_rgmii_rxin_clk;
> +};
> +
> +static void starfive_eth_fix_mac_speed(void *priv, unsigned int speed)

This should be starfive_dwmac_fix_mac_speed for consistency.

> +{
> +       struct starfive_dwmac *dwmac = priv;
> +       unsigned long rate;
> +       int err;
> +
> +       /* Generally, the rgmii_tx clock is provided by the internal clock,
> +        * which needs to match the corresponding clock frequency according
> +        * to different speeds. If the rgmii_tx clock is provided by the
> +        * external rgmii_rxin, there is no need to configure the clock
> +        * internally, because rgmii_rxin will be adaptively adjusted.
> +        */
> +       if (dwmac->tx_use_rgmii_rxin_clk)
> +               return;

If this function is only needed in certain situations, why not just
set the plat_dat->fix_mac_speed callback when it is needed?

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
> +               break;
> +       }
> +
> +       err = clk_set_rate(dwmac->clk_tx, rate);
> +       if (err)
> +               dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
> +}
> +
> +static int starfive_dwmac_probe(struct platform_device *pdev)
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
> +       dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
> +       if (IS_ERR(dwmac->clk_tx))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
> +                                   "error getting tx clock\n");
> +
> +       dwmac->clk_gtx = devm_clk_get_enabled(&pdev->dev, "gtx");
> +       if (IS_ERR(dwmac->clk_gtx))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_gtx),
> +                                   "error getting gtx clock\n");
> +
> +       if (device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk"))
> +               dwmac->tx_use_rgmii_rxin_clk = true;
> +
> +       dwmac->dev = &pdev->dev;
> +       plat_dat->fix_mac_speed = starfive_eth_fix_mac_speed;

Eg.:
if (!device_property_read_bool(&pdev->dev, "starfive,tx_use_rgmii_clk"))
  plat_dat->fix_mac_speed = starfive_dwmac_fix_mac_speed;

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
> +static const struct of_device_id starfive_dwmac_match[] = {
> +       { .compatible = "starfive,jh7110-dwmac" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, starfive_dwmac_match);
> +
> +static struct platform_driver starfive_dwmac_driver = {
> +       .probe  = starfive_dwmac_probe,
> +       .remove = stmmac_pltfr_remove,
> +       .driver = {
> +               .name = "starfive-dwmac",
> +               .pm = &stmmac_pltfr_pm_ops,
> +               .of_match_table = starfive_dwmac_match,
> +       },
> +};
> +module_platform_driver(starfive_dwmac_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("StarFive DWMAC platform driver");
> +MODULE_AUTHOR("Emil Renner Berthing <kernel@esmil.dk>");
> +MODULE_AUTHOR("Samin Guo <samin.guo@starfivetech.com>");
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

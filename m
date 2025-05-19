Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECC6C2D0CD
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 11:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUN6dGd8w2Vl/UWSHrMjeSEbUaD2nGR+WPtphm/nZrk=; b=Z9jcOetrVUXoPw
	ds86MjYJKmenKnJZQq27PAiYeS4OjQ4FvE0ATtMmhg6xw1owOk2juGeK41u/o7GuR8QuuDLHMtjdp
	qNWo0KEnV5etHA1Z5zfoaD2ju5zcUqG7oWlKWauOt/IapbFFeNhaQQhMjnHNd2f0sVLEtH6FHLnAG
	IqICGH558U1IplDDYPtPMslIcUQYBtz/hA7iOhVvAgDtNb/x1SayODyGY6BIOAkWJc85RH/4XNEQz
	Ga2yDFR0nohv8eFzlF6mvzoVFo9ik1VDWXjhuG/7VQs01e5NaZ8sDwBR5pMVE//QP1kvgzcNJwIRe
	q55cTSY0Et7/2utfACRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGylh-000000090hG-2SUK;
	Mon, 19 May 2025 11:34:53 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGylf-000000090gs-1cTr
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 11:34:52 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e731a56e111so4078005276.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 May 2025 04:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747654490; x=1748259290; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T9ifYnJEHZkjugzgP1AAhyx3RM0Rc1N5KhZmwX4DzcA=;
        b=mWmuCf/ztgfXK21+tLaXuAWAI/3coXWZaakOQaeWXcamDfY+LHO+bGO56fOIIroFkO
         xQrdkDN/tWNXGKVjb1UzRpU6lh45ygsNsaRyyXnrrZtd7CSb84dXITIQR/de174ttKG8
         SFmedw0lXzyWFz+fY37QkwzB9CGf2fA/FLamns95aXcpVX4t6dNrlofMR2ytJ5S7i4TX
         8QtqHOQGaSPok2J9KvLeh9gvMODiXtGjIiGvt1+uUCods/SQTs9LWu8SyD1cShKNyoen
         IT5/s2oOcQwfe5Coj/0C2uuNeGx7Raq4gFOF41GDLvkIbk3VY6Pp2AfvjFbSLEf9Q7TD
         tmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654490; x=1748259290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9ifYnJEHZkjugzgP1AAhyx3RM0Rc1N5KhZmwX4DzcA=;
        b=LR4o63NiL3VItUhwKJ7q8H3GxwpZfx7v5SxLXSnizLnGNAKYl0ofZ+Xa1B93FBoIvJ
         j/y/xGLMUslee2BiFvrk6BdmuVu1GSFEzeAUSawiHoGKF2iLWYG7Bv3Xk9Zv9sBv3rb8
         hWJhd6x+M/QRnIkTIHEeScv8m0fiFf9/1WpH3jcn6lG7R1BCNTMSP5H4/Do7KYYJIWPo
         U7DZkcDBaxy7JNmLZMOTNGBagO4apQuDX1QJp+4ynET/9C2QWRxvaQjFsBzJkQHPkNGP
         +FEDApjVkMNfaajjyCjZZogcc9GuhNcoXsGlA2zyB+0r/JLgLroNgEXdGYcrnX2ybaa+
         +oHg==
X-Forwarded-Encrypted: i=1; AJvYcCWHgIK+zGz2wV5yFQoGRiYahfexyHwo4z8h312a7c1j/wui0JISWZmSAwNKqnFw05XiuhkOJs/ij2PqPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSC/kMMuIhHsaC7tFbJo1YznRlEuOCsQntEfzAeiqLNIA4DK/u
	OzY3o+ksyE4gxy1i5PBNupB+quwIAAV1PKM/EpquKSvYQGQRisw+k6r+RXQswdktcpispPGyrcg
	AusUopKjt4LivJKfvmnPYXUVG6YFjFC+SYXy0v53Gg11k6fgV6cp1eyBUpQ==
X-Gm-Gg: ASbGncvTCKg+AFNNLkH6VAVQlZyKAOp02QlNCEjPAJcQ+qW0039XVavUpUNevaimVou
	Ph47hSnaY42wTzFYcHQ+1SDpe9YRYwiSxISRu3U9gkbLYWDLA1OhwaCJf45Okb+s1t3M6ksfRaI
	YtjiqfqXf2/RJFbIi/yRsZvN9FJR3pQVFglw==
X-Google-Smtp-Source: AGHT+IEzdVLtO9YBa5+IVyduAY6NRSx7ulnCzcRUIF50EVMFrKD1g2sNV/MU3FaCc/lVmOV0bCCHQy4wQPIgDk2szp8=
X-Received: by 2002:a05:6902:2181:b0:e75:c2d7:53d6 with SMTP id
 3f1490d57ef6-e7b6a0821b5mr17229222276.13.1747654490027; Mon, 19 May 2025
 04:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250501-20-k1-sdhci-v2-0-3e7005fae29b@gentoo.org> <20250501-20-k1-sdhci-v2-2-3e7005fae29b@gentoo.org>
In-Reply-To: <20250501-20-k1-sdhci-v2-2-3e7005fae29b@gentoo.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 13:34:14 +0200
X-Gm-Features: AX0GCFsNpQorB3Le9i73KErfl_8y60Wp1PR0WslTHu1cwMkDy6FRe6Gb1knvm-o
Message-ID: <CAPDyKFoDWS6DWdKOaxTDEYeKv3hjVDoR7XGi19nESVssc-RG8g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alex Elder <elder@riscstar.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_043451_438764_E0BD1307 
X-CRM114-Status: GOOD (  23.44  )
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

On Thu, 1 May 2025 at 10:51, Yixun Lan <dlan@gentoo.org> wrote:
>
> The SDHCI controller found in SpacemiT K1 SoC features SD,
> SDIO, eMMC support, such as:
>
> - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> - Compatible for 8bit eMMC5.1, up to HS400
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/mmc/host/Kconfig       |  14 ++
>  drivers/mmc/host/Makefile      |   1 +
>  drivers/mmc/host/sdhci-of-k1.c | 306 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 321 insertions(+)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 6824131b69b188cae58c8f48076715ca647ca28c..0ce78f22c33cfff916a2d4d680c79e9d19637e0e 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -250,6 +250,20 @@ config MMC_SDHCI_OF_DWCMSHC
>           If you have a controller with this interface, say Y or M here.
>           If unsure, say N.
>
> +config MMC_SDHCI_OF_K1
> +       tristate "SDHCI OF support for the SpacemiT K1 SoC"
> +       depends on ARCH_SPACEMIT || COMPILE_TEST
> +       depends on MMC_SDHCI_PLTFM
> +       depends on OF
> +       depends on COMMON_CLK
> +       help
> +         This selects the Secure Digital Host Controller Interface (SDHCI)
> +         found in the SpacemiT K1 SoC.
> +
> +         If you have a controller with this interface, say Y or M here.
> +
> +         If unsure, say N.
> +
>  config MMC_SDHCI_OF_SPARX5
>         tristate "SDHCI OF support for the MCHP Sparx5 SoC"
>         depends on MMC_SDHCI_PLTFM
> diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> index 5147467ec825ffaef3a7bd812fad80545e52b180..75bafc7b162b9e1d4c6c050f5d28b9d7cb582447 100644
> --- a/drivers/mmc/host/Makefile
> +++ b/drivers/mmc/host/Makefile
> @@ -88,6 +88,7 @@ obj-$(CONFIG_MMC_SDHCI_OF_AT91)               += sdhci-of-at91.o
>  obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)       += sdhci-of-esdhc.o
>  obj-$(CONFIG_MMC_SDHCI_OF_HLWD)                += sdhci-of-hlwd.o
>  obj-$(CONFIG_MMC_SDHCI_OF_DWCMSHC)     += sdhci-of-dwcmshc.o
> +obj-$(CONFIG_MMC_SDHCI_OF_K1)          += sdhci-of-k1.o
>  obj-$(CONFIG_MMC_SDHCI_OF_SPARX5)      += sdhci-of-sparx5.o
>  obj-$(CONFIG_MMC_SDHCI_OF_MA35D1)      += sdhci-of-ma35d1.o
>  obj-$(CONFIG_MMC_SDHCI_BCM_KONA)       += sdhci-bcm-kona.o
> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..8988053eeb33a476fa484d145579db6214b2d0b7
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-of-k1.c
> @@ -0,0 +1,306 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (c) 2025 Yixun Lan <dlan@gentoo.org>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/iopoll.h>
> +#include <linux/init.h>
> +#include <linux/mmc/card.h>
> +#include <linux/mmc/host.h>
> +#include <linux/mmc/mmc.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +
> +#include "sdhci.h"
> +#include "sdhci-pltfm.h"
> +
> +#define SDHC_MMC_CTRL_REG              0x114
> +#define  MISC_INT_EN                   BIT(1)
> +#define  MISC_INT                      BIT(2)

These define-names look a bit too generic to me. Please add some
additional prefixes so it becomes more clear what they are.

This applies to all the others below too.

> +#define  ENHANCE_STROBE_EN             BIT(8)
> +#define  MMC_HS400                     BIT(9)
> +#define  MMC_HS200                     BIT(10)
> +#define  MMC_CARD_MODE                 BIT(12)
> +
> +#define SDHC_TX_CFG_REG                        0x11C
> +#define  TX_INT_CLK_SEL                        BIT(30)
> +#define  TX_MUX_SEL                    BIT(31)
> +
> +#define SDHC_PHY_CTRL_REG              0x160
> +#define  PHY_FUNC_EN                   BIT(0)
> +#define  PHY_PLL_LOCK                  BIT(1)
> +#define  HOST_LEGACY_MODE              BIT(31)
> +
> +#define SDHC_PHY_FUNC_REG              0x164
> +#define  PHY_TEST_EN                   BIT(7)
> +#define  HS200_USE_RFIFO               BIT(15)
> +
> +#define SDHC_PHY_DLLCFG                        0x168
> +#define  DLL_PREDLY_NUM                        GENMASK(3, 2)
> +#define  DLL_FULLDLY_RANGE             GENMASK(5, 4)
> +#define  DLL_VREG_CTRL                 GENMASK(7, 6)
> +#define  DLL_ENABLE                    BIT(31)
> +
> +#define SDHC_PHY_DLLCFG1               0x16C
> +#define  DLL_REG1_CTRL                 GENMASK(7, 0)
> +#define  DLL_REG2_CTRL                 GENMASK(15, 8)
> +#define  DLL_REG3_CTRL                 GENMASK(23, 16)
> +#define  DLL_REG4_CTRL                 GENMASK(31, 24)
> +
> +#define SDHC_PHY_DLLSTS                        0x170
> +#define  DLL_LOCK_STATE                        BIT(0)
> +
> +#define SDHC_PHY_PADCFG_REG            0x178
> +#define  PHY_DRIVE_SEL                 GENMASK(2, 0)
> +#define  RX_BIAS_CTRL                  BIT(5)

[...]

> +
> +static int spacemit_sdhci_pre_select_hs400(struct mmc_host *mmc)
> +{
> +       struct sdhci_host *host = mmc_priv(mmc);
> +
> +       spacemit_sdhci_setbits(host, MMC_HS400, SDHC_MMC_CTRL_REG);
> +       host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;

At least this deserves a comment. Isn't MMC_CAP_WAIT_WHILE_BUSY
working for all cases?

> +
> +       return 0;
> +}
> +
> +static void spacemit_sdhci_post_select_hs400(struct mmc_host *mmc)
> +{
> +       struct sdhci_host *host = mmc_priv(mmc);
> +
> +       spacemit_sdhci_phy_dll_init(host);
> +       host->mmc->caps &= ~MMC_CAP_WAIT_WHILE_BUSY;

Dito.

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

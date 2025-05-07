Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A37C3ABBF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 12:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2SHyJ4khUqfdMBZ3G63sEK4EcnF7XDcHWz/LrlwTnwU=; b=3EQyZ7uWPcmLy9
	ub3HStbuiC4yDvkLTpyH7ev3onr19JSQWMztXWsUfwd1y06NkV6kwhyTEWOc0UNSkgK9NPVxai4p9
	YWCzm3SCAFckXht2+HVU8WNLO0uvI8P7Kodo0sABBfEASj6aK9T9XKNr+PGKM4ZmWQ71oPiagToxv
	FIVUiZTmhQaHDDC1nP115uzQmNYeg2LZpqkPXCI/ITQ+CzqDzY9DPFgkpmKMJ3PDrI9WAdlxb9oj5
	XeGOcGu5TLQaqCKaI9gO7OduicNnXyz/L3tdSAZTsBx5jm/lEzPazHDXjdT/ux7QxcH4Mntr8VcnB
	ZikzxMBS91zQMexm0nGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdb2-0000000FKYm-2maL;
	Wed, 07 May 2025 12:09:56 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCday-0000000FKWs-2D9o
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 12:09:55 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-47688ae873fso80800941cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 May 2025 05:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746619791; x=1747224591; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wzvCqlM6V4NoRraLw8v4M7ajYBzOkSRv0bJeZomdZWU=;
        b=d1GTYbdPxq+oWO+iW05NCWwK138wPUJUtKWyBXnhPd0memqUH/xC8jWHZp4gQJLhL9
         x6YMS7d7VwiH44LQ3xhCDqGhkrjhDoysouqCI3FP1pdnpH9auj8En9VEw78Z5uyHe6Uu
         30sA1VA+b0jPC3FS7dPP0hpVb6/UKAfk8EF2Jh2JA+NHoSuIwB13o4cuDUm+ZizAxID9
         9SjE7vVIE6lJVZ0eU5ydk5Xrtrik2KfIYY416V/hHgqW893aUKu3H3OR3yxnNwh/3Hmh
         GB68M7uatjEFyBXDaIT8Hp0ZtEehhtO24AxCLy2UMIxtIa1r+9DDyju5CDUWFLd1z2io
         nkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746619791; x=1747224591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzvCqlM6V4NoRraLw8v4M7ajYBzOkSRv0bJeZomdZWU=;
        b=Iu2R7RkOYoCG/ICBGACRs80jHVRBjuEVWZJbCj8AiyH9jMcZNvlLjBxLzk4BSSYEN1
         MRabVUO99qUwunWNq/nS7W0b2O4m/jLK271+tmTZK2WkKnBQmZUS+E8Ukq95NV7yts7J
         rQX1emjzS7DFVJOnwNq6E1Ad+hEzgOWUTYlHOPt4FPPTPD00T1BF0iZnHQFPYraIhNjX
         Zm0a5BixuI8C2lj0ifBrznSjNoq7wmxlwezdDmu80qe5OjDhv9PVWD14IIHsu5/VS33f
         9xOdNXtqKEHsk0G2CARC/HOF24ktdnzXp+OFx77cgLgtkaZlWdOWSZm9ZI1anzjArrX3
         r8lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf+ve9dd0BKH3ETZb+Cqtfwjow14EbiSeeStmSTQkc7D7Sf+SShw+6OgvGdXy8igqQ1QrKtbuNkTMUjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPCd4yL3ABgq+kwa/lvHAIkS5JDyo82kpkaGCu9yCBgDOirpN1
	KlBUA21HjYLj92X8oTN4DDO4ysoQ5ITI1a3yEznyql9AudyagS8I
X-Gm-Gg: ASbGncsMrBvgiTw4HDICAp6tazA425c3W0GTbzMQItiaQmPqgbky6e/Udv8hI9qQYTV
	mZJQDUYkdbtCZUi4MCXlbKW8k8osQ8/B9+SLwXa/dj7V3GaBmruxahwIUQCerUPVXsWJkBFR+h1
	vKFTz2cJazcge9vl8c7GopY+LozrOzkgq8VNikRQTq3dAE9A214W2vLA7ImXQcD3PW7HNqWtAr3
	N+8wfx1StWVXNvgxXMECQ8gjO/WAr7d8mGY3V1ID9Un/vDNQ0JqAfmIyDWbNMZ5PTR2j2iQ5Mka
	V7de/+o5rUG+sh1y
X-Google-Smtp-Source: AGHT+IH7wKlghg8C9MW5UbE15J0DCcdrY3Ipd1gx5YTdMrj+JDWaSANUBcKoxE/1t95TYjo8l1Xxyw==
X-Received: by 2002:a05:622a:cd:b0:476:9847:7c73 with SMTP id d75a77b69052e-492265e977fmr37240231cf.26.1746619790754;
        Wed, 07 May 2025 05:09:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-49222da009dsm13199261cf.58.2025.05.07.05.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:09:50 -0700 (PDT)
Date: Wed, 7 May 2025 20:09:25 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Alex Elder <elder@riscstar.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mmc: sdhci-of-k1: add support for SpacemiT K1 SoC
Message-ID: <acvqiaaptw4s54zekvbkdpfzam4x7juiajcxyohzpfcuf5xpxs@addpa5x73efo>
References: <20250501-20-k1-sdhci-v2-0-3e7005fae29b@gentoo.org>
 <20250501-20-k1-sdhci-v2-2-3e7005fae29b@gentoo.org>
 <gfrdvfencetztdmkxmeo5q5vdnp3yxmggnuewfprjyxsldzhv2@eur5wtlltqtm>
 <20250506225720-GYA499202@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250506225720-GYA499202@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_050952_566085_9BF86C77 
X-CRM114-Status: GOOD (  29.43  )
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

On Tue, May 06, 2025 at 10:57:20PM +0000, Yixun Lan wrote:
> Hi Inochi,
> 
> On 06:37 Wed 07 May     , Inochi Amaoto wrote:
> > On Thu, May 01, 2025 at 04:50:22PM +0800, Yixun Lan wrote:
> > > The SDHCI controller found in SpacemiT K1 SoC features SD,
> > > SDIO, eMMC support, such as:
> > > 
> > > - Compatible for 4-bit SDIO 3.0 UHS-I protocol, up to SDR104
> > > - Compatible for 4-bit SD 3.0 UHS-I protocol, up to SDR104
> > > - Compatible for 8bit eMMC5.1, up to HS400
> > > 
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  drivers/mmc/host/Kconfig       |  14 ++
> > >  drivers/mmc/host/Makefile      |   1 +
> > >  drivers/mmc/host/sdhci-of-k1.c | 306 +++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 321 insertions(+)
> > > 
> > > diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> > > index 6824131b69b188cae58c8f48076715ca647ca28c..0ce78f22c33cfff916a2d4d680c79e9d19637e0e 100644
> > > --- a/drivers/mmc/host/Kconfig
> > > +++ b/drivers/mmc/host/Kconfig
> > > @@ -250,6 +250,20 @@ config MMC_SDHCI_OF_DWCMSHC
> > >  	  If you have a controller with this interface, say Y or M here.
> > >  	  If unsure, say N.
> > >  
> > > +config MMC_SDHCI_OF_K1
> > > +	tristate "SDHCI OF support for the SpacemiT K1 SoC"
> > > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > > +	depends on MMC_SDHCI_PLTFM
> > > +	depends on OF
> > > +	depends on COMMON_CLK
> > > +	help
> > > +	  This selects the Secure Digital Host Controller Interface (SDHCI)
> > > +	  found in the SpacemiT K1 SoC.
> > > +
> > > +	  If you have a controller with this interface, say Y or M here.
> > > +
> > > +	  If unsure, say N.
> > > +
> > >  config MMC_SDHCI_OF_SPARX5
> > >  	tristate "SDHCI OF support for the MCHP Sparx5 SoC"
> > >  	depends on MMC_SDHCI_PLTFM
> > > diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> > > index 5147467ec825ffaef3a7bd812fad80545e52b180..75bafc7b162b9e1d4c6c050f5d28b9d7cb582447 100644
> > > --- a/drivers/mmc/host/Makefile
> > > +++ b/drivers/mmc/host/Makefile
> > > @@ -88,6 +88,7 @@ obj-$(CONFIG_MMC_SDHCI_OF_AT91)		+= sdhci-of-at91.o
> > >  obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)	+= sdhci-of-esdhc.o
> > >  obj-$(CONFIG_MMC_SDHCI_OF_HLWD)		+= sdhci-of-hlwd.o
> > >  obj-$(CONFIG_MMC_SDHCI_OF_DWCMSHC)	+= sdhci-of-dwcmshc.o
> > > +obj-$(CONFIG_MMC_SDHCI_OF_K1)		+= sdhci-of-k1.o
> > >  obj-$(CONFIG_MMC_SDHCI_OF_SPARX5)	+= sdhci-of-sparx5.o
> > >  obj-$(CONFIG_MMC_SDHCI_OF_MA35D1)	+= sdhci-of-ma35d1.o
> > >  obj-$(CONFIG_MMC_SDHCI_BCM_KONA)	+= sdhci-bcm-kona.o
> > > diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..8988053eeb33a476fa484d145579db6214b2d0b7
> > > --- /dev/null
> > > +++ b/drivers/mmc/host/sdhci-of-k1.c
> > > @@ -0,0 +1,306 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
> > > + * Copyright (c) 2025 Yixun Lan <dlan@gentoo.org>
> > > + */
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/iopoll.h>
> > > +#include <linux/init.h>
> > > +#include <linux/mmc/card.h>
> > > +#include <linux/mmc/host.h>
> > > +#include <linux/mmc/mmc.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#include "sdhci.h"
> > > +#include "sdhci-pltfm.h"
> > > +
> > > +#define SDHC_MMC_CTRL_REG		0x114
> > > +#define  MISC_INT_EN			BIT(1)
> > > +#define  MISC_INT			BIT(2)
> > > +#define  ENHANCE_STROBE_EN		BIT(8)
> > > +#define  MMC_HS400			BIT(9)
> > > +#define  MMC_HS200			BIT(10)
> > > +#define  MMC_CARD_MODE			BIT(12)
> > > +
> > > +#define SDHC_TX_CFG_REG			0x11C
> > > +#define  TX_INT_CLK_SEL			BIT(30)
> > > +#define  TX_MUX_SEL			BIT(31)
> > > +
> > > +#define SDHC_PHY_CTRL_REG		0x160
> > > +#define  PHY_FUNC_EN			BIT(0)
> > > +#define  PHY_PLL_LOCK			BIT(1)
> > > +#define  HOST_LEGACY_MODE		BIT(31)
> > > +
> > > +#define SDHC_PHY_FUNC_REG		0x164
> > > +#define  PHY_TEST_EN			BIT(7)
> > > +#define  HS200_USE_RFIFO		BIT(15)
> > > +
> > > +#define SDHC_PHY_DLLCFG			0x168
> > > +#define  DLL_PREDLY_NUM			GENMASK(3, 2)
> > > +#define  DLL_FULLDLY_RANGE		GENMASK(5, 4)
> > > +#define  DLL_VREG_CTRL			GENMASK(7, 6)
> > > +#define  DLL_ENABLE			BIT(31)
> > > +
> > > +#define SDHC_PHY_DLLCFG1		0x16C
> > > +#define  DLL_REG1_CTRL			GENMASK(7, 0)
> > > +#define  DLL_REG2_CTRL			GENMASK(15, 8)
> > > +#define  DLL_REG3_CTRL			GENMASK(23, 16)
> > > +#define  DLL_REG4_CTRL			GENMASK(31, 24)
> > > +
> > > +#define SDHC_PHY_DLLSTS			0x170
> > > +#define  DLL_LOCK_STATE			BIT(0)
> > > +
> > > +#define SDHC_PHY_PADCFG_REG		0x178
> > > +#define  PHY_DRIVE_SEL			GENMASK(2, 0)
> > > +#define  RX_BIAS_CTRL			BIT(5)
> > > +
> > > +struct spacemit_sdhci_host {
> > > +	struct clk *clk_core;
> > > +	struct clk *clk_io;
> > > +};
> > > +
> > > +static inline void spacemit_sdhci_setbits(struct sdhci_host *host, u32 val, int reg)
> > > +{
> > > +	sdhci_writel(host, sdhci_readl(host, reg) | val, reg);
> > > +}
> > > +
> > > +static inline void spacemit_sdhci_clrbits(struct sdhci_host *host, u32 val, int reg)
> > > +{
> > > +	sdhci_writel(host, sdhci_readl(host, reg) & ~val, reg);
> > > +}
> > > +
> > 
> > > +static inline void spacemit_sdhci_clrsetbits(struct sdhci_host *host, u32 clr, u32 set, int reg)
> > 
> > updatebits?
> > 
> IMO, it's more ambiguous to use updatebits(), so I will just keep it
> 
> besides, these above helper functions should really be carefully used,
> setbits() only set bits of 'val' while preserve other bits,
> clrsetbits() will first clear bits, then set, while still preserve others
> 
> I will try to put a comment for them while updating next version

This is like something "regmap_update_bits". I think "update_bits" may
be better? I agree that it is good to put a comment here, whatever the
function name is. So this is fine for me, do it in the way you prefer.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

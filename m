Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A74BCA5FC1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 08:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rmg4mdkHpUbK/6KBVq9Vea+wOBG/4h6dh3oXmX9KNV8=; b=OPePgmlTdxgnvZ
	bQTwrPY8q1MejfrAmZyxk0xvUt0foiBWFc9vJTsIjDAuUMK7USfxk2+/RJrDJ5sMJMVY+kGNO4nNB
	LF50jstquU83gznC/eDOuQ0PgLLnVUwU7qeoGQSyZrB8RSSBM3mFKyKMsFQ+Xcwy35QF0qAoiwd9k
	DAmg5CNV2r92n3iEat6V4LMOSvMRlCbxfqsV8x8Y8tz2uDwDRGRHk6o3jaNAccGfGv9kQxXAcW4Nx
	ip9mZXStqBdJJmKqR7fdraBmIp7oeW1a3k1+hf6QwwV07aCCzNnyNqcY7zojbJ2nw1qP7DZDWM05I
	l4nVMpU35Dj+R8W07n4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBq7E-00000005VLa-3hvl;
	Wed, 30 Sep 2026 08:56:40 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBq7C-00000005VKL-1PcE
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 08:56:40 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so27296415e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 01:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790758596; x=1791363396; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KB63AmDfCzUIzXvzx7Y0obbjfVyZCi8GFe+cdX17Bpc=;
        b=MqMhq0G6sBs/u3loiR2sABAa6lpw+RdGCbghRmThJn1KDxrrAU5mIPr5HyyAQ1dlQ7
         20QOj+kZh3CX8Zlu1yLao6VQ2DqZTDlpDKd425SWVtwumDgNP3IMXAe+QT10dqbo05HJ
         3Casmrxbdo+s76+D8vq53m9bp+Fz2yhUXxDoevPtwTPLLcww56as+MuayiUD5B7zVzBx
         G5Z3q9/EzfpJf7irAfmrKPrwz7zKBpjtxLzNR9UUAtG4QGzk9k0KAIQEqrsl+t8xIuq1
         Jk3ffb/phGfEB1NmQKuI1h5j1d7Cexhuer9vlDpuQsl7TXz0jMVd608/b3p7daHrNbI6
         kHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758596; x=1791363396;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KB63AmDfCzUIzXvzx7Y0obbjfVyZCi8GFe+cdX17Bpc=;
        b=z/BypIBg8q6do8C272msVXHeJI5rvjG3C/ZdwhIdajJvScN99bJdpG9Fp0kqrg6epE
         jFpgn6/MlwUzGholrYqu03EKxHLzQEsS9d+kk/wTruHvJAJZ9jWTE52TTRtQIRJy6CzF
         88YESU2POTbNRJ1FC6DGiefpUZb7BIK1Y1xwrC1Q8CYyXlMJLOf0oYEZ8Pv1v70OAcfN
         0yytT3IY+XEFAZsuAb6TUWnefZpLnRa1v1CwohbzNuxRB8cux5uVYVShaLuhmANe4xB9
         deBtpICp0EcGVC4x9wsiQ1CGkyHVjC3AUNL+S3O6jY1nDU41lpvGGNO5JTqf4HOq53Tk
         zNvA==
X-Forwarded-Encrypted: i=1; AKwUvBww9wJIdTgPQ68B7jjklWJXbCS/stoucsS+C4tW2qBLlRr/qw0xV8HNFPjPepXePr1PioEPxtCqHuqUJA==@lists.infradead.org
X-Gm-Message-State: AFuF++lOkyZJ25dKe6wgt2MGkUSzXvVkazuR6wGN5P2y3AUn0ECvaaa4
	gDRT23TP3gpsPsK/y/33bMThzc/TYnTgEp8gsz+xF0D7m817bNUwxqAs2CnxOpBGocc=
X-Gm-Gg: AYBFou3/0RAk+BkHpGrTx99p2PmpF09JvaZjyihCJDe8G1yYc5kMKn7KVRgqZkA9nDP
	15vCxA+KMBlAExuaubgrl86jjMRyoSt697v+fadQeY7bAFFHImdGOI9tNpwlMtt11t9FlOduMwF
	SQ2XEKpOJL1KOiq9048y1oCcIIOACx7rfa/d5RxnDR8puUsizfYz/wcwkp+VzGa2/r4OI3kbJ6A
	qMLhisOSofMwBXBp1KToD1iYnzLCQAG1Oadf4z2bLe5kh0P6qSwfSVy05nw0cfFhKRV1iqrkMoY
	QThc0+D8qIF+rlOpCUGmBZCkH72z9VUmk98GW3AxDMrDRcX6YlzrMT+0mLKYe9wfvPNYcTmlQR2
	JTqi4R9kE29iKl0XD07s2TCoT3Nt/DJt5f1qm3nzxrVWJvmXFFWhKZr2xtQS08Fyyiq/xJbWe/J
	VNqgpRhH8CT1gUTgKLWWoMpz3ZzkjqvoqnEPvvb+hmyw1MvwsCdz5FBHVR/01oLSOyPSIUh1N2h
	TfY8yr+ZXCLQvgDpA==
X-Received: by 2002:a05:600c:3145:b0:49f:ce73:7a9 with SMTP id 5b1f17b1804b1-4a01b0072cfmr11716995e9.34.1790758596318;
        Wed, 30 Sep 2026 01:56:36 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a017b7337bsm22084495e9.3.2026.09.30.01.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:56:35 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v5 2/8] clk: starfive: Add system-0 domain PLL clock
 driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Alexey Charkov <alchark@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20260828095608.19955-3-changhuang.liang@starfivetech.com>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
 <20260828095608.19955-3-changhuang.liang@starfivetech.com>
Date: Wed, 30 Sep 2026 10:56:34 +0200
Message-Id: <179075859479.1471718.5492634704694937513.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=20132; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=oAk9CTHOeEEgac07xVr7ONG4c89i0VcXBB26FcNwNAk=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl7zh0uD9ILEv+2qWJ/WauC68Gcv59nLSmxzClJmZvRs
 PbSwS6ejlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkRSrDP9WKvjuCi4/Nk6th
 jWARie2SPCsiwjDHpy/19fxbF0qPsDP8d7m9/sJZpiu1vAoTjFi/3vCOaZoWs6d6x3aPefGxX58
 xMQAA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_015638_539666_6397C668 
X-CRM114-Status: GOOD (  31.75  )
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

On 2026-08-28 02:56 -0700, Changhuang Liang wrote:
> Add system-0 domain PLL clock driver for StarFive JHB100 SoC.
> 
> This driver is instantiated either as an MFD cell of the sys0 system
> controller (added in a later patch) or by matching the per0/per1 syscon
> nodes directly.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |  10 +
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jhb100-pll.c    | 524 ++++++++++++++++++
>  3 files changed, 535 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c
> 
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 852464949334..2603d054173f 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -117,6 +117,16 @@ config CLK_STARFIVE_JHB100_PER3
>  	  Say yes here to support the peripheral-3 clock controller
>  	  on the StarFive JHB100 SoC.
>  
> +config CLK_STARFIVE_JHB100_PLL
> +	bool "StarFive JHB100 PLL clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select STARFIVE_JHB100_SOCINFO
> +	select MFD_SYSCON
> +	default ARCH_STARFIVE
> +	help
> +	  Say yes here to support the PLL clock controller on the
> +	  StarFive JHB100 SoC.
> +
>  config CLK_STARFIVE_JHB100_SYS0
>  	bool "StarFive JHB100 system-0 clock support"
>  	depends on ARCH_STARFIVE || COMPILE_TEST
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index f00690f0cdad..547a8c170728 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+= clk-starfive-jhb100-per0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER1)		+= clk-starfive-jhb100-per1.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER2)		+= clk-starfive-jhb100-per2.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_PER3)		+= clk-starfive-jhb100-per3.o
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_PLL)		+= clk-starfive-jhb100-pll.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> new file mode 100644
> index 000000000000..e23365164497
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> @@ -0,0 +1,524 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 PLL Clock Generator Driver
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/math64.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/units.h>
> +
> +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> +
> +/* this driver expects a 25MHz input frequency from the oscillator */
> +#define JHB100_PLL_OSC_RATE		(25 * HZ_PER_MHZ)
> +
> +/* System-0 domain PLL */
> +#define JHB100_PLL2_OFFSET		0x00
> +#define JHB100_PLL3_OFFSET		0x0c
> +#define JHB100_PLL4_OFFSET		0x18
> +#define JHB100_PLL5_OFFSET		0x24
> +
> +#define JHB100_PLL_CFG0_OFFSET		0x0
> +#define JHB100_PLL_CFG1_OFFSET		0x4
> +#define JHB100_PLL_CFG2_OFFSET		0x8
> +
> +#define JHB100_PLLX_CFG0(offset)	((offset) + JHB100_PLL_CFG0_OFFSET)
> +/* fbdiv value should be 16 to 4095 */
> +#define   JHB100_PLL_FBDIV			GENMASK(13, 2)
> +#define   JHB100_PLL_FOUTPOSTDIV_EN		BIT(14)
> +#define   JHB100_PLL_FOUTVCOP_EN		BIT(16)
> +
> +#define JHB100_PLLX_CFG1(offset)	((offset) + JHB100_PLL_CFG1_OFFSET)
> +/* frac value should be decimals multiplied by 2^24 */
> +#define   JHB100_PLL_FRAC			GENMASK(23, 0)
> +#define   JHB100_PLL_LOCK			BIT(24)
> +
> +#define JHB100_PLLX_CFG2(offset)	((offset) + JHB100_PLL_CFG2_OFFSET)
> +#define   JHB100_PLL_PD				BIT(13)
> +#define   JHB100_PLL_POSTDIV			GENMASK(15, 14)
> +#define   JHB100_PLL_REFDIV			GENMASK(23, 18)
> +
> +#define JHB100_PLL_TIMEOUT_US		1000
> +#define JHB100_PLL_INTERVAL_US		100
> +
> +struct jhb100_pll_preset {
> +	unsigned long freq;
> +	u32 frac;			/* frac value should be decimals multiplied by 2^24 */
> +	unsigned fbdiv		: 12;	/* fbdiv value should be 16 to 4095 */
> +	unsigned refdiv		: 6;
> +	unsigned postdiv	: 2;
> +	unsigned foutpostdiv_en	: 1;
> +	unsigned foutvcop_en	: 1;
> +};
> +
> +struct jhb100_pll_info {
> +	const char *name;
> +	const struct jhb100_pll_preset *presets;
> +	unsigned int npresets;
> +	unsigned long flags;
> +	u8 offset;
> +	bool continuous;
> +};
> +
> +#define _JHB100_PLL(_idx, _name, _presets, _npresets, _offset, _flags, _cont)	\
> +	[_idx] = {							\
> +		.name = _name,						\
> +		.offset = _offset,					\
> +		.presets = _presets,					\
> +		.npresets = _npresets,					\
> +		.flags = _flags,					\
> +		.continuous = _cont,					\
> +	}
> +
> +#define JHB100_PLL(idx, name, presets, npresets, offset, cont)			\
> +	_JHB100_PLL(idx, name, presets, npresets, offset, 0, cont)
> +
> +struct jhb100_pll_match_data {
> +	const struct jhb100_pll_info *pll_info;
> +	int num_pll;
> +};
> +
> +struct jhb100_pll_data {
> +	struct clk_hw hw;
> +	unsigned int idx;
> +};
> +
> +struct jhb100_pll_priv {
> +	struct regmap *regmap;
> +	const struct jhb100_pll_match_data *match_data;
> +	struct jhb100_pll_data pll[];
> +};
> +
> +struct jhb100_pll_regvals {
> +	u32 fbdiv;
> +	u32 frac;
> +	u32 postdiv;
> +	u32 refdiv;
> +	bool foutpostdiv_en;
> +	bool foutvcop_en;
> +};
> +
> +static struct jhb100_pll_data *jhb100_pll_data_from(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct jhb100_pll_data, hw);
> +}
> +
> +static struct jhb100_pll_priv *jhb100_pll_priv_from(struct jhb100_pll_data *pll)
> +{
> +	return container_of(pll, struct jhb100_pll_priv, pll[pll->idx]);
> +}
> +
> +static int jhb100_pll_prepare(struct clk_hw *hw)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +
> +	return regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> +				  JHB100_PLL_PD, 0);
> +}
> +
> +static void jhb100_pll_unprepare(struct clk_hw *hw)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +
> +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> +			   JHB100_PLL_PD, JHB100_PLL_PD);
> +}
> +
> +static int jhb100_pll_is_prepared(struct clk_hw *hw)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, JHB100_PLLX_CFG2(info->offset), &val);
> +	if (ret)
> +		return ret;
> +
> +	return !(val & JHB100_PLL_PD);
> +}

Why are you using prepere_ ? Are you register access on a slow bus like i2c ?

> +
> +static int jhb100_pll_regvals_get(struct regmap *regmap,
> +				  const struct jhb100_pll_info *info,
> +				  struct jhb100_pll_regvals *val)
> +{
> +	u32 value;
> +	int ret;
> +
> +	ret = regmap_read(regmap, JHB100_PLLX_CFG0(info->offset), &value);
> +	if (ret)
> +		return ret;
> +
> +	val->fbdiv = FIELD_GET(JHB100_PLL_FBDIV, value);
> +	val->foutpostdiv_en = !!FIELD_GET(JHB100_PLL_FOUTPOSTDIV_EN, value);
> +	val->foutvcop_en = !!FIELD_GET(JHB100_PLL_FOUTVCOP_EN, value);
> +
> +	ret = regmap_read(regmap, JHB100_PLLX_CFG1(info->offset), &value);
> +	if (ret)
> +		return ret;
> +
> +	val->frac = FIELD_GET(JHB100_PLL_FRAC, value);
> +
> +	ret = regmap_read(regmap, JHB100_PLLX_CFG2(info->offset), &value);
> +	if (ret)
> +		return ret;
> +
> +	val->postdiv = FIELD_GET(JHB100_PLL_POSTDIV, value);
> +	val->refdiv = FIELD_GET(JHB100_PLL_REFDIV, value);
> +
> +	return 0;
> +}

Looks like a bit of churn to me ? Can you just read the field when you need them

> +
> +static unsigned long jhb100_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	struct jhb100_pll_regvals val;
> +	u32 power = 0;
> +	u64 rate;
> +	int ret;
> +
> +	ret = jhb100_pll_regvals_get(priv->regmap, &priv->match_data->pll_info[pll->idx], &val);
> +	if (ret)
> +		return 0;
> +
> +	/*
> +	 *
> +	 * if (foutvcop_en)
> +	 *      rate = parent * (fbdiv + frac / 2^24) / refdiv
> +	 *
> +	 * if (foutpostdiv_en)
> +	 *      rate = parent * (fbdiv + frac / 2^24) / refdiv / 2^(postdiv + 1)
> +	 *
> +	 * parent * (fbdiv + frac / 2^24) = parent * fbdiv + parent * frac / 2^24

This show the overcomplexity you've put in this driver by mixing toghether the PLL with the 2 skip-able post dividre
You could simply decribe the topology.
* 1 PLL
* 2 Post-divider and 2 muxes to skip them.

CCF already provide the helper for those.

> +	 */
> +
> +	if (!!val.foutvcop_en == !!val.foutpostdiv_en || !val.refdiv)
> +		return 0;
> +
> +	rate = mul_u32_u32(parent_rate, val.frac) >> 24;
> +
> +	if (val.foutpostdiv_en)
> +		power = val.postdiv + 1;
> +
> +	rate += mul_u32_u32(parent_rate, val.fbdiv);
> +	rate = div_u64(rate, (u64)val.refdiv << power);
> +
> +	return rate;
> +}
> +
> +static int jhb100_pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +	const struct jhb100_pll_preset *selected = &info->presets[0];
> +	unsigned int idx;
> +
> +	/* if the parent rate doesn't match our expectations the presets won't work */
> +	if (req->best_parent_rate != JHB100_PLL_OSC_RATE) {
> +		req->rate = jhb100_pll_recalc_rate(hw, req->best_parent_rate);
> +		return 0;

Yet you still return a rate. Are you preset, which presumably describe some constraints
for fractional multiplier properly described ?

Add just below you do not care for the preset ...

> +	}
> +
> +	/* continuous means support any rate */
> +	if (info->continuous)
> +		return 0;

??

I somehow doubt that you support everything down to the 1 Hz. You still must determine
what you will provide.

> +
> +	/* find highest rate lower or equal to the requested rate */
> +	for (idx = 1; idx < info->npresets; idx++) {
> +		const struct jhb100_pll_preset *val = &info->presets[idx];
> +
> +		if (req->rate < val->freq)
> +			break;
> +
> +		selected = val;
> +	}
> +
> +	req->rate = selected->freq;

Instead of storing plain rate in your preset table, you could just store the multiplier you
support and let reclac_rate do the job

> +
> +	return 0;
> +}
> +
> +static int jhb100_pll_set_preset(struct clk_hw *hw, const struct jhb100_pll_preset *val)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +	unsigned int value, cfg;
> +	int ret;
> +
> +	cfg = FIELD_PREP(JHB100_PLL_FBDIV, (u32)val->fbdiv) |
> +	      FIELD_PREP(JHB100_PLL_FOUTPOSTDIV_EN, (u32)val->foutpostdiv_en) |
> +	      FIELD_PREP(JHB100_PLL_FOUTVCOP_EN, (u32)val->foutvcop_en);
> +
> +	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset),
> +				 JHB100_PLL_FBDIV | JHB100_PLL_FOUTPOSTDIV_EN |
> +				 JHB100_PLL_FOUTVCOP_EN, cfg);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG1(info->offset), JHB100_PLL_FRAC,
> +				 FIELD_PREP(JHB100_PLL_FRAC, val->frac));
> +	if (ret)
> +		return ret;
> +
> +	cfg = FIELD_PREP(JHB100_PLL_REFDIV, (u32)val->refdiv) |
> +	      FIELD_PREP(JHB100_PLL_POSTDIV, (u32)val->postdiv);
> +
> +	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> +				 JHB100_PLL_REFDIV | JHB100_PLL_POSTDIV, cfg);
> +	if (ret)
> +		return ret;
> +
> +	/* waiting for PLL to lock */
> +	return regmap_read_poll_timeout(priv->regmap, JHB100_PLLX_CFG1(info->offset),
> +					value, value & JHB100_PLL_LOCK,
> +					JHB100_PLL_INTERVAL_US,
> +					JHB100_PLL_TIMEOUT_US);
> +}
> +
> +static int jhb100_pll_rate_to_preset(struct clk_hw *hw, unsigned long rate,
> +				     unsigned long parent_rate)
> +{
> +	struct jhb100_pll_preset val = {
> +		.refdiv = 1,
> +		.postdiv = 3,
> +		.foutpostdiv_en = 1,
> +		.foutvcop_en = 0,
> +	};
> +	unsigned int power = 0;
> +	u64 fbdiv_24, t;
> +	u32 fbdiv;
> +
> +	if (val.foutpostdiv_en)
> +		power = val.postdiv + 1;
> +
> +	t = (u64)val.refdiv << power;
> +	t *= rate;
> +
> +	fbdiv = div64_ul(t, parent_rate);
> +	if (fbdiv < 16 || fbdiv > 4095)
> +		return -EINVAL;
> +	val.fbdiv = fbdiv;
> +
> +	fbdiv_24 = div64_ul(t << 24, parent_rate);
> +	val.frac = fbdiv_24 - ((u64)fbdiv << 24);
> +
> +	return jhb100_pll_set_preset(hw, &val);
> +}
> +
> +static int jhb100_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			       unsigned long parent_rate)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +	const struct jhb100_pll_preset *val;
> +	unsigned int idx;
> +
> +	/* if the parent rate doesn't match our expectations the presets won't work */
> +	if (parent_rate != JHB100_PLL_OSC_RATE)
> +		return -EINVAL;
> +
> +	if (info->continuous)
> +		return jhb100_pll_rate_to_preset(hw, rate, parent_rate);
> +
> +	for (idx = 0, val = &info->presets[0]; idx < info->npresets; idx++, val++) {
> +		if (val->freq == rate)
> +			return jhb100_pll_set_preset(hw, val);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static int jhb100_pll_registers_show(struct seq_file *s, void *unused)
> +{
> +	struct jhb100_pll_data *pll = s->private;
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	struct jhb100_pll_regvals val;
> +	int ret;
> +
> +	ret = jhb100_pll_regvals_get(priv->regmap, &priv->match_data->pll_info[pll->idx], &val);
> +	if (ret)
> +		return ret;
> +
> +	seq_printf(s, "fbdiv=%u\n"
> +		      "frac=%u\n"
> +		      "refdiv=%u\n"
> +		      "postdiv=%u\n"
> +		      "foutpostdiv_en=%u\n"
> +		      "foutvcop_en=%u\n",
> +		      val.fbdiv, val.frac, val.refdiv, val.postdiv,
> +		      val.foutpostdiv_en, val.foutvcop_en);
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(jhb100_pll_registers);
> +
> +static void jhb100_pll_debug_init(struct clk_hw *hw, struct dentry *dentry)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +
> +	debugfs_create_file("registers", 0400, dentry, pll,
> +			    &jhb100_pll_registers_fops);
> +}

regmap already provided a way to see the register through debugfs.
This debugfs whole debugfs section can go away

> +#else
> +#define jhb100_pll_debug_init NULL
> +#endif
> +
> +static const struct clk_ops jhb100_pll_ops = {
> +	.prepare = jhb100_pll_prepare,
> +	.unprepare = jhb100_pll_unprepare,
> +	.is_prepared = jhb100_pll_is_prepared,
> +	.recalc_rate = jhb100_pll_recalc_rate,
> +	.determine_rate = jhb100_pll_determine_rate,
> +	.set_rate = jhb100_pll_set_rate,
> +	.debug_init = jhb100_pll_debug_init,
> +};
> +
> +static struct clk_hw *jhb100_pll_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct jhb100_pll_priv *priv = data;
> +	unsigned int idx = clkspec->args[0];
> +
> +	if (idx < priv->match_data->num_pll)
> +		return &priv->pll[idx].hw;
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int jhb100_pll_probe(struct platform_device *pdev)
> +{
> +	const struct jhb100_pll_match_data *match_data;
> +	const struct platform_device_id *id;
> +	struct device *dev = &pdev->dev;
> +	struct jhb100_pll_priv *priv;
> +	struct device_node *np;
> +	unsigned int idx;
> +	int ret;
> +
> +	id = platform_get_device_id(pdev);
> +	if (!id)
> +		return dev_err_probe(dev, -EINVAL, "no match data\n");
> +
> +	/*
> +	 * Instantiated as an MFD cell of the sys0 system controller,
> +	 * which owns the DT node describing the PLL registers.
> +	 */
> +	match_data = (const struct jhb100_pll_match_data *)id->driver_data;
> +	np = dev_of_node(dev->parent);
> +
> +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, pll, match_data->num_pll),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->match_data = match_data;
> +	priv->regmap = syscon_node_to_regmap(np);
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "failed to get syscon regmap\n");
> +
> +	for (idx = 0; idx < match_data->num_pll; idx++) {
> +		struct clk_parent_data parents = {
> +			.index = 0,
> +		};
> +		struct clk_init_data init = {
> +			.name = match_data->pll_info[idx].name,
> +			.ops = &jhb100_pll_ops,
> +			.parent_data = &parents,
> +			.num_parents = 1,
> +			.flags = match_data->pll_info[idx].flags,
> +		};
> +		struct jhb100_pll_data *pll = &priv->pll[idx];
> +
> +		pll->hw.init = &init;
> +		pll->idx = idx;
> +
> +		ret = devm_clk_hw_register(dev, &pll->hw);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return devm_of_clk_add_hw_provider(dev, jhb100_pll_get, priv);
> +}
> +
> +static const struct jhb100_pll_preset jhb100_pll2_presets[] = {
> +	{
> +		.freq = 903168000,
> +		.fbdiv = 72,
> +		.frac = 4252017,
> +		.refdiv = 1,
> +		.postdiv = 0,
> +		.foutpostdiv_en = 1,
> +		.foutvcop_en = 0,
> +	},
> +};
> +
> +static const struct jhb100_pll_preset jhb100_pll3_presets[] = {
> +	{
> +		.freq = 800000000,
> +		.fbdiv = 64,
> +		.frac = 0,
> +		.refdiv = 1,
> +		.postdiv = 0,
> +		.foutpostdiv_en = 1,
> +		.foutvcop_en = 0,
> +	},
> +};
> +
> +static const struct jhb100_pll_info jhb100_sys0_pll_info[] = {
> +	JHB100_PLL(JHB100_SYS0PLL_PLL2_OUT, "pll2_out", jhb100_pll2_presets,
> +		   ARRAY_SIZE(jhb100_pll2_presets), JHB100_PLL2_OFFSET, false),
> +	_JHB100_PLL(JHB100_SYS0PLL_PLL3_OUT, "pll3_out", jhb100_pll3_presets,
> +		    ARRAY_SIZE(jhb100_pll3_presets), JHB100_PLL3_OFFSET,
> +		    CLK_IS_CRITICAL, false),
> +	_JHB100_PLL(JHB100_SYS0PLL_PLL4_OUT, "pll4_out", NULL, 0,
> +		    JHB100_PLL4_OFFSET, CLK_IGNORE_UNUSED, true),

Please comment when adding CLK_IGNORE_UNUSED so people have an idea why
it is needed and how it can be removed

> +	_JHB100_PLL(JHB100_SYS0PLL_PLL5_OUT, "pll5_out", NULL, 0,
> +		    JHB100_PLL5_OFFSET, CLK_IGNORE_UNUSED, true),
> +};
> +
> +static const struct jhb100_pll_match_data jhb100_sys0_pll = {
> +	.pll_info = jhb100_sys0_pll_info,
> +	.num_pll = ARRAY_SIZE(jhb100_sys0_pll_info),
> +};
> +
> +static const struct platform_device_id jhb100_pll_ids[] = {
> +	{
> +		.name = "jhb100-sys0-pll",
> +		.driver_data = (unsigned long)&jhb100_sys0_pll,
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(platform, jhb100_pll_ids);
> +
> +static struct platform_driver jhb100_pll_driver = {
> +	.probe = jhb100_pll_probe,
> +	.id_table = jhb100_pll_ids,
> +	.driver = {
> +		.name = "clk-starfive-jhb100-pll",
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +builtin_platform_driver(jhb100_pll_driver);
> -- 
> 2.25.1
> 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

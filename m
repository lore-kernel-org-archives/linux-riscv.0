Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A4BE85371
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 16:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8H7JaKvfUcV/ezsRwT1XBqa56dvgRGrYfLhrhD/zdM=; b=D1MAzCX+DuEyBy
	1Ll/Ja07eL6ljWEdd7i6hgK0OIQilHPDDg04GU/qcXDAy806K4AgaroWTYRH88wIpHgbIAd8GG1CT
	XNhwfoyNtpY2Iy7DQW+fjR/SIWCDQ+IbB3UtZWQ+O/aFz3BLL18vQvDN0tha5y1quGGW0GslUKmID
	MgjnyknSN8FAtJH903smhYAtVzzoV/IwLokB59AZWAXWxhWScNdppagG9FvxjRetZG7rtdbD2lY1j
	Tv2/CU2sOCDiHvJpEnZngfaaPWiyAWQ5c9sVMu2fT34A66bNx6xLZq2PSuVIQwWc5I+gw6QzHDF37
	plOmOeUqb7tgj6WDFS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h7u-00000002IiI-0JPs;
	Fri, 03 Apr 2026 16:12:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h7r-00000002Ihe-1ce5
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 16:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775232722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q0qlnOLgeFQ+KfNa4LmIlVbCN3WIC4UUf1TUzO3mwMo=;
	b=ADrlv5OSRxFHgYdXKmO5KQREhlTfoQlMDyXCGAPDpKtmWOusCGhCdXy7PAHjUVDJPo6DwU
	anw6o9wG4RCj0/E2WZ0ICoOhNCOE/+Gf22rPJ3CAR/tl/glS0ZGJeiHhbTRz//c5q5m5eu
	GpWrmWc/ALuzK//0Qgu+cjhF0UmizUQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-6d9mOZMoNdSn5lBxP6g8nw-1; Fri, 03 Apr 2026 12:10:35 -0400
X-MC-Unique: 6d9mOZMoNdSn5lBxP6g8nw-1
X-Mimecast-MFC-AGG-ID: 6d9mOZMoNdSn5lBxP6g8nw_1775232635
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509219f94b0so62491161cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 09:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775232634; x=1775837434;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q0qlnOLgeFQ+KfNa4LmIlVbCN3WIC4UUf1TUzO3mwMo=;
        b=K/aFyTgK4GcZgbZ8bS0ebDPUzk3TKH0VbimyIIDwIF5jJ3sMakHX7RreufO8YgV+N2
         ly+oe0KsFrHKoZauwthJgP9EwQ2f1vqqpHJYdv/9Ycbm2dtKNzornaEwTliZzznKC9q/
         +qORT9mswfKpGc+mEwtaRE0QWbbEd8sPV2+GPJD8XWsEmAEA7+p+oZSnOo19uf2N2CnV
         UbQ+Tj490iFSHy4RDe3OwOHqhL5fDe+7wxQ8h/AI9ffwWtIdBIxRWdCdqSAmL/4b3qS5
         LWtNN9wo161gL9ShuJq6q8wCxAd2qBqYl2m+6xOc1gHZiYs3hksC8dfN+bfghR4XcZxr
         00og==
X-Forwarded-Encrypted: i=1; AJvYcCWowWS4cFlvHpGcp3dM+Oao+ZfAE+GdHM+thNDe/J89cBCyblSgtwzudZGXImltkP6J82bUasjLKXDf1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxG7enIh/0C4lfoz5z48gVV0KpEe9qTT2od1kOmeQy6Y+v45hI
	hcn3KplNNPNdMdoq4HBa9h8KuAPAcNrSh33IQukWPzZDtpTwqmraXO37U5bFl0stLJxGFQ1DnqA
	2h9DErbxumx6TAp8Webj46tY6ZiJC+M7fKaAosmD9IoPBhaf9tkvr4V4C1SUEKxVzYEnZ5g==
X-Gm-Gg: ATEYQzyMyXeZ8aq5M/H729uHf5mZRQYcHLlZIrGfiQ5R+voGFjit5DMAicNx14u0lQW
	qY5guwKCgVagpshHpb/ZYi7QRpwlKC1ykOixD2OrtTsj/qOgKVbMeKktwyzGytF0sx5EkuSmGU3
	ssWSjudGHaWV8fKHcnbh7G+cGIsdgysYgK1Ym+A+KmXd12e3w4B5Befh+saxi9jpdc7DqRGON5l
	+PHuWS2SvA99Mayzo5I/xH/TfnJ5syGtvfqP89P88hwkK2q0eAAXT+qQSxEESWmonB2Ci1Dp+OB
	grUU2bEcd5UFNEBKaKYaKMIyq7k8+uCK7m5EBrW82gRN66MU0HSh+nHAArbHQx5EhnXjvPKuZGh
	GPZyq6A7mPquRv2I71eO6kQdCPNreeMFIKp/qsh2EntFosRPXUVGzRNP0
X-Received: by 2002:a05:622a:5e8f:b0:50b:567a:e915 with SMTP id d75a77b69052e-50d62b7069emr45957571cf.64.1775232634406;
        Fri, 03 Apr 2026 09:10:34 -0700 (PDT)
X-Received: by 2002:a05:622a:5e8f:b0:50b:567a:e915 with SMTP id d75a77b69052e-50d62b7069emr45956801cf.64.1775232633635;
        Fri, 03 Apr 2026 09:10:33 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b93dd10sm47779791cf.7.2026.04.03.09.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:10:32 -0700 (PDT)
Date: Fri, 3 Apr 2026 12:10:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 03/13] clk: starfive: Add system-0 domain PLL clock
 driver
Message-ID: <ac_mdhEl9VtpTuw8@redhat.com>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-4-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260403054945.467700-4-changhuang.liang@starfivetech.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ALdjHQCmbaEHHBHAlxOBv8RWwCyMgbF5ikq5kyYjWIg_1775232635
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_091203_593261_B72D0690 
X-CRM114-Status: GOOD (  29.78  )
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

Hi Changhuang,

On Thu, Apr 02, 2026 at 10:49:35PM -0700, Changhuang Liang wrote:
> Add system-0 domain PLL clock driver for StarFive JHB100 SoC.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/Kconfig                  |   8 +
>  drivers/clk/starfive/Makefile                 |   1 +
>  .../clk/starfive/clk-starfive-jhb100-pll.c    | 498 ++++++++++++++++++
>  3 files changed, 507 insertions(+)
>  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c
> 
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index c612f1ede7d7..cc712da68bd0 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -105,6 +105,14 @@ config CLK_STARFIVE_JHB100_PER3
>  	  Say yes here to support the peripheral-3 clock controller
>  	  on the StarFive JHB100 SoC.
>  
> +config CLK_STARFIVE_JHB100_PLL
> +	bool "StarFive JHB100 PLL clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
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
> index 000000000000..1751a734ee83
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
> @@ -0,0 +1,498 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 PLL Clock Generator Driver
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> +
> +/* this driver expects a 25MHz input frequency from the oscillator */
> +#define JHB100_PLL_OSC_RATE		25000000UL

You could include linux/units.h and then use: 25 * HZ_PER_MHZ

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
> +#define   JHB100_PLL_FBDIV_SHIFT		2
> +#define   JHB100_PLL_FOUTPOSTDIV_EN		BIT(14)
> +#define   JHB100_PLL_FOUTPOSTDIV_EN_SHIFT	14
> +#define   JHB100_PLL_FOUTVCOP_EN		BIT(16)
> +#define   JHB100_PLL_FOUTVCOP_EN_SHIFT		16
> +
> +#define JHB100_PLLX_CFG1(offset)	((offset) + JHB100_PLL_CFG1_OFFSET)
> +/* frac value should be decimals multiplied by 2^24 */
> +#define   JHB100_PLL_FRAC			GENMASK(23, 0)
> +#define   JHB100_PLL_FRAC_SHIFT			0
> +#define   JHB100_PLL_LOCK			BIT(24)
> +#define   JHB100_PLL_LOCK_SHIFT			24
> +
> +#define JHB100_PLLX_CFG2(offset)	((offset) + JHB100_PLL_CFG2_OFFSET)
> +#define   JHB100_PLL_PD				BIT(13)
> +#define   JHB100_PLL_PD_SHIFT			13
> +#define   JHB100_PLL_POSTDIV			GENMASK(15, 14)
> +#define   JHB100_PLL_POSTDIV_SHIFT		14
> +#define   JHB100_PLL_REFDIV			GENMASK(23, 18)
> +#define   JHB100_PLL_REFDIV_SHIFT		18
> +
> +#define JHB100_PLL_TIMEOUT_US		1000
> +#define JHB100_PLL_INTERVAL_US		100
> +
> +struct jhb100_pll_preset {
> +	unsigned long freq;
> +	u32 frac;			/* frac value should be decimals multiplied by 2^24 */
> +	unsigned fbdiv		: 12;	/* fbdiv value should be 8 to 4095 */
> +	unsigned refdiv		: 6;
> +	unsigned postdiv	: 2;
> +	unsigned foutpostdiv_en	: 1;
> +	unsigned foutvcop_en	: 1;
> +};
> +
> +struct jhb100_pll_info {
> +	char *name;
> +	const struct jhb100_pll_preset *presets;
> +	unsigned int npresets;
> +	unsigned long flag;
> +	u8 offset;
> +	bool continuous;
> +};
> +
> +#define _JHB100_PLL(_idx, _name, _presets, _npresets, _offset, _flag, _cont)	\
> +	[_idx] = {							\
> +		.name = _name,						\
> +		.offset = _offset,					\
> +		.presets = _presets,					\
> +		.npresets = _npresets,					\
> +		.flag = _flag,						\
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
> +	struct device *dev;
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
> +static int jhb100_pll_enable(struct clk_hw *hw)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +
> +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> +			   JHB100_PLL_PD, 0);

Should the return value be checked here? Or just:

    return regumap_update_bits(...);

> +
> +	return 0;
> +}
> +
> +static void jhb100_pll_disable(struct clk_hw *hw)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +
> +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
> +			   JHB100_PLL_PD, BIT(JHB100_PLL_PD_SHIFT));
> +}
> +
> +static int jhb100_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +	u32 val;
> +
> +	regmap_read(priv->regmap, JHB100_PLLX_CFG2(info->offset), &val);

Should the return value be checked?

> +
> +	return !(val & JHB100_PLL_PD);

If regmap_read() returns an error, then is val uninitialized?

> +}
> +
> +static void jhb100_pll_regvals_get(struct regmap *regmap,
> +				   const struct jhb100_pll_info *info,
> +				   struct jhb100_pll_regvals *ret)
> +{
> +	u32 val;
> +
> +	regmap_read(regmap, JHB100_PLLX_CFG0(info->offset), &val);
> +	ret->fbdiv = (val & JHB100_PLL_FBDIV) >> JHB100_PLL_FBDIV_SHIFT;
> +	ret->foutpostdiv_en = !!((val & JHB100_PLL_FOUTPOSTDIV_EN) >>
> +				 JHB100_PLL_FOUTPOSTDIV_EN_SHIFT);
> +	ret->foutvcop_en = !!((val & JHB100_PLL_FOUTVCOP_EN) >>
> +			      JHB100_PLL_FOUTVCOP_EN_SHIFT);
> +
> +	regmap_read(regmap, JHB100_PLLX_CFG1(info->offset), &val);
> +	ret->frac = (val & JHB100_PLL_FRAC) >> JHB100_PLL_FRAC_SHIFT;
> +
> +	regmap_read(regmap, JHB100_PLLX_CFG2(info->offset), &val);
> +	ret->postdiv = (val & JHB100_PLL_POSTDIV) >> JHB100_PLL_POSTDIV_SHIFT;
> +	ret->refdiv = (val & JHB100_PLL_REFDIV) >> JHB100_PLL_REFDIV_SHIFT;

Should these regmap return values be checked, and the error code returned?

> +}
> +
> +static unsigned long jhb100_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	struct jhb100_pll_regvals val;
> +	unsigned long rate;
> +	u32 power = 0;
> +
> +	jhb100_pll_regvals_get(priv->regmap, &priv->match_data->pll_info[pll->idx], &val);
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
> +	 */
> +
> +	if (!!val.foutvcop_en == !!val.foutpostdiv_en)
> +		return 0;
> +
> +	rate = (parent_rate * val.frac) >> 24;
> +
> +	if (val.foutpostdiv_en)
> +		power = val.postdiv + 1;
> +
> +	rate += parent_rate * val.fbdiv;
> +	rate /= val.refdiv << power;

Could val.refdiv ever be zero?

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
> +	}
> +
> +	/* continuous means support any rate */
> +	if (info->continuous)
> +		return 0;
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
> +
> +	return 0;
> +}
> +
> +static int jhb100_pll_set_preset(struct clk_hw *hw, struct jhb100_pll_preset *val)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
> +	unsigned int value;
> +
> +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset), JHB100_PLL_FBDIV,
> +			   (u32)val->fbdiv << JHB100_PLL_FBDIV_SHIFT);
> +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset), JHB100_PLL_FOUTPOSTDIV_EN,
> +			   (u32)val->foutpostdiv_en << JHB100_PLL_FOUTPOSTDIV_EN_SHIFT);
> +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset), JHB100_PLL_FOUTVCOP_EN,
> +			   (u32)val->foutvcop_en << JHB100_PLL_FOUTVCOP_EN_SHIFT);

These are writing to the same register. Should the values be combined
into one, and written once to the register?

> +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG1(info->offset), JHB100_PLL_FRAC,
> +			   val->frac << JHB100_PLL_FRAC_SHIFT);
> +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset), JHB100_PLL_REFDIV,
> +			   (u32)val->refdiv << JHB100_PLL_REFDIV_SHIFT);
> +	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset), JHB100_PLL_POSTDIV,
> +			   (u32)val->postdiv << JHB100_PLL_POSTDIV_SHIFT);

The last two calls to JHB100_PLLX_CFG2 also write to the same register.
Should the two writes be combined into one?

Should the return values from regmap_update_bits() be checked?

> +
> +	/* waiting for PLL to lock */
> +	return regmap_read_poll_timeout_atomic(priv->regmap, JHB100_PLLX_CFG1(info->offset),
> +					       value, value & JHB100_PLL_LOCK,
> +					       JHB100_PLL_INTERVAL_US,
> +					       JHB100_PLL_TIMEOUT_US);
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
> +	unsigned long fbdiv_24, t;
> +
> +	if (val.foutpostdiv_en)
> +		power = val.postdiv + 1;
> +
> +	t = val.refdiv << power;
> +	t *= rate;
> +
> +	val.fbdiv = t / parent_rate;

Should a check for parent_rate == 0 be added?

> +
> +	fbdiv_24 = (t << 24) / parent_rate;
> +	val.frac = fbdiv_24 - (val.fbdiv << 24);
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
> +			return jhb100_pll_set_preset(hw, (struct jhb100_pll_preset *)val);

The cast looks to be here because of the const in
jhb100_pll_set_preset(). Can const be added to the declaration of
jhb100_pll_set_preset()?

> +	}
> +	return -EINVAL;
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static int jhb100_pll_registers_read(struct seq_file *s, void *unused)
> +{
> +	struct jhb100_pll_data *pll = s->private;
> +	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
> +	struct jhb100_pll_regvals val;
> +
> +	jhb100_pll_regvals_get(priv->regmap, &priv->match_data->pll_info[pll->idx], &val);
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
> +static int jhb100_pll_registers_open(struct inode *inode, struct file *f)
> +{
> +	return single_open(f, jhb100_pll_registers_read, inode->i_private);
> +}
> +
> +static const struct file_operations jhb100_pll_registers_ops = {
> +	.owner = THIS_MODULE,
> +	.open = jhb100_pll_registers_open,
> +	.release = single_release,
> +	.read = seq_read,
> +	.llseek = seq_lseek
> +};
> +
> +static void jhb100_pll_debug_init(struct clk_hw *hw, struct dentry *dentry)
> +{
> +	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
> +
> +	debugfs_create_file("registers", 0400, dentry, pll,
> +			    &jhb100_pll_registers_ops);
> +}
> +#else
> +#define jhb100_pll_debug_init NULL
> +#endif
> +
> +static const struct clk_ops jhb100_pll_ops = {
> +	.enable = jhb100_pll_enable,
> +	.disable = jhb100_pll_disable,
> +	.is_enabled = jhb100_pll_is_enabled,
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
> +static int __init jhb100_pll_probe(struct platform_device *pdev)
> +{
> +	const struct jhb100_pll_match_data *match_data;
> +	struct jhb100_pll_priv *priv;
> +	unsigned int idx;
> +	int ret;
> +
> +	match_data = of_device_get_match_data(&pdev->dev);
> +	if (!match_data)
> +		return -EINVAL;
> +
> +	priv = devm_kzalloc(&pdev->dev,
> +			    struct_size(priv, pll, match_data->num_pll),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->match_data = match_data;
> +	priv->dev = &pdev->dev;
> +	priv->regmap = syscon_node_to_regmap(priv->dev->of_node->parent);
> +	if (IS_ERR(priv->regmap))
> +		return PTR_ERR(priv->regmap);
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
> +			.flags = match_data->pll_info[idx].flag,
> +		};
> +		struct jhb100_pll_data *pll = &priv->pll[idx];
> +
> +		pll->hw.init = &init;
> +		pll->idx = idx;
> +
> +		ret = devm_clk_hw_register(&pdev->dev, &pll->hw);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return devm_of_clk_add_hw_provider(&pdev->dev, jhb100_pll_get, priv);
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
> +	_JHB100_PLL(JHB100_SYS0PLL_PLL5_OUT, "pll5_out", NULL, 0,
> +		    JHB100_PLL5_OFFSET, CLK_IGNORE_UNUSED, true),
> +};
> +
> +static const struct jhb100_pll_match_data jhb100_sys0_pll = {
> +	.pll_info = jhb100_sys0_pll_info,
> +	.num_pll = ARRAY_SIZE(jhb100_sys0_pll_info),
> +};
> +
> +static const struct of_device_id jhb100_pll_match[] = {
> +	{
> +		.compatible = "starfive,jhb100-sys0-pll",
> +		.data = (void *)&jhb100_sys0_pll,

The (void *) cast shouldn't be needed.

> +	}, {

Put { on it's own newline.

Brian


> +		/* sentinel */
> +	}
> +};
> +MODULE_DEVICE_TABLE(of, jhb100_pll_match);
> +
> +static struct platform_driver jhb100_pll_driver = {
> +	.driver = {
> +		.name = "clk-starfive-jhb100-pll",
> +		.of_match_table = jhb100_pll_match,
> +	},
> +};
> +builtin_platform_driver_probe(jhb100_pll_driver, jhb100_pll_probe);
> -- 
> 2.25.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

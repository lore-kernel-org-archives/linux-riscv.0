Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780FFC369CB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 12:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y8F7zf+Gsn+ccTTC/CgO825HymwK5isEEFC/8fomu44=; b=R9rdc0xxlDmdTx
	iEQXSjO02PrS/QLLyYmLvLRoLE5DxDJ4DTXFBxr7fftwEPGapTrhiu/b+j5RlcpjiYmC2O7o22gFX
	Dc9C9kryy2j+nBT/mlX8kk4PtfgLIIB8jYcH8iqdepzAhUZ9KZ5RK9ITuNQJCqGcUHXBpmU0oV8ZN
	m4cB+W50pXqjn16UpN/iNZ3mO0mzv2dftgnhgNoag1ZMjDRMZ/q/6RyyEXl5dyarqaANW/G09uabj
	GY83TsVhYm1wyYExZMK8NSV+QcHVp4ZKtzWmXQ2UboC5szEe4hpKERL4btFjt/W37hc6huvi8pZmh
	3bmf3mF0KndV6QEW0srQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ksC-0000000G51U-0EOW;
	Fri, 18 Apr 2025 12:31:12 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ks9-0000000G4zt-0Ece
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 12:31:10 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-301d6cbbd5bso1810605a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 18 Apr 2025 05:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744979468; x=1745584268; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S8sELgzDvRnEbh4TB0gOv3v+S6ddG8y3XAL1AUuYjBY=;
        b=YkZonm1afgCKy3ZPVLRJQBfBs8hC4SE076YLv/g2zXfPXvTKxoo8w8kX6I80BMaOac
         hfXtbJqMT7G8d1H33KcfD1Pw9I31yKw4BlM/1XhJJSTSYqetg8WMYACjWKf6NQyDwkxQ
         8uxB0IclA3POFn7VOHC8Ymfnkl1GhEH8KXYIQ8IK04/P3QEjKnjLUAJHL6cS1MDOugmV
         egsQwuMBn7k1ZeJWRSEcxHXiGaIIwvO00m9n4XySXktb1M4k1vGgSEBOD3Q4Dl17SP9D
         Aa34IL7uKzcIpnWocGzWWbVq9ZAW41whgPyG6b4C26x3jPzhtjekbg7kzA/1+7uq1gbm
         Vgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744979468; x=1745584268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8sELgzDvRnEbh4TB0gOv3v+S6ddG8y3XAL1AUuYjBY=;
        b=i9in1k6NE2OHBceR4c81cx8r6eWplo5jwo97g6ipjqyznBJ0l7oJQB1x2HT2DjbTUI
         e9oT7QVnScQUSXA6aUULutip7bCVCWnGZdHbimJJxljQ5C/3pKuO+WKV3O9K7CxfwXLh
         X9HCU6yGZI2Dmfbl+m6JKoouMN/i9LzTTXUJSLQgopSNwx+RrLnBlP7cOvWCSvNLEPKV
         C1Wvu6WXQzWuzHiiMZ3ZOtefjhxg/XFKa4gfMkgcehjIVvnOAK3Mm3WVgvCNa+if9VSX
         sax+BQ90qAlTZLgQCXuK4Us3C18ukWSVWBHc2cgX0etTM+FlY9LXBlRx2hf9O2Qs6MO8
         fCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7u4n2jE+a7EXLfo+PxKeV9KhWwu35oLyqP2WjrQ/UqIAgAGlyMf3P1L1gJsUpZF72G9msIEFID5ZTZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzFJaGBsHBOX6PzOmBuqwqxbQBualXLhBMrdAys10DIb60Z8vb
	g3bIGFkZs3DCHV49Y1ao2wKPLm0d5ScE87UZuUg0AUnk+ZaKJ0GI
X-Gm-Gg: ASbGncsYAsVrphW93bhKLUBOCdbyS+3dMVNocnFvS88NXSZpmo9N91u2Il2HfWMCBCn
	zm8CramIn65fZdMiHWKW8cpcn4SnIjlqH8dDEQlOx8vYoB+rBj3wQy6a2ZpmdSoT+ODDbSg8Rrn
	z03BF/gyS7mXMVqSfujv2CeAoXPWoKfWXeSkqJjkiMmoVyVzR4TBvmowkVoO88RI3yIUoyqcVrK
	Ii1dmg4+lZj2PzelVYIHJw0tCHpZb4bDua6Ze1yHdMaqR5E+UQLaMX7TpyJ2AJY68ETMnc8shJF
	OvvU9kENyNNwmI4dr9LVuwusLw0mNJG/
X-Google-Smtp-Source: AGHT+IG1w5iZCD2U/szjO2Tg3S/r+QVCuIXD/qOdZCamRWATy8852yS4hGSE43hopFEKaiGnsc1egg==
X-Received: by 2002:a17:90b:2744:b0:2ff:53a4:74f0 with SMTP id 98e67ed59e1d1-3087bbc925dmr3791993a91.29.1744979467301;
        Fri, 18 Apr 2025 05:31:07 -0700 (PDT)
Received: from localhost ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e05ebdbsm1104397a91.48.2025.04.18.05.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:31:06 -0700 (PDT)
Date: Fri, 18 Apr 2025 20:31:04 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v6 2/3] clk: canaan: Add clock driver for Canaan K230
Message-ID: <aAJGCDmqNoSWrwXw@troy-wujie14-pro>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
 <20250415-b4-k230-clk-v6-2-7fd89f427250@zohomail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250415-b4-k230-clk-v6-2-7fd89f427250@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_053109_121438_0D06F440 
X-CRM114-Status: GOOD (  31.72  )
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

On Tue, Apr 15, 2025 at 10:25:12PM +0800, Xukai Wang wrote:
> This patch provides basic support for the K230 clock, which does not
> cover all clocks.
> 
> The clock tree of the K230 SoC consists of OSC24M, PLLs and sysclk.
> 
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  drivers/clk/Kconfig    |    6 +
>  drivers/clk/Makefile   |    1 +
>  drivers/clk/clk-k230.c | 1710 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1717 insertions(+)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 299bc678ed1b9fcd9110bb8c5937a1bd1ea60e23..1817b8883af9a3d00ac7af2cb88496274b591001 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -464,6 +464,12 @@ config COMMON_CLK_K210
>  	help
>  	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
>  
> +config COMMON_CLK_K230
> +	bool "Clock driver for the Canaan Kendryte K230 SoC"
> +	depends on ARCH_CANAAN || COMPILE_TEST
> +        help
> +          Support for the Canaan Kendryte K230 RISC-V SoC clocks.
> +
>  config COMMON_CLK_SP7021
>  	tristate "Clock driver for Sunplus SP7021 SoC"
>  	depends on SOC_SP7021 || COMPILE_TEST
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index fb8878a5d7d93da6bec487460cdf63f1f764a431..5df50b1e14c701ed38397bfb257db26e8dd278b8 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
>  obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
>  obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
>  obj-$(CONFIG_COMMON_CLK_K210)		+= clk-k210.o
> +obj-$(CONFIG_COMMON_CLK_K230)		+= clk-k230.o
>  obj-$(CONFIG_LMK04832)			+= clk-lmk04832.o
>  obj-$(CONFIG_COMMON_CLK_LAN966X)	+= clk-lan966x.o
>  obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)	+= clk-lochnagar.o
> diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..84a4a2a293e5f278d21510d73888aee4ff9351df
> --- /dev/null
> +++ b/drivers/clk/clk-k230.c
> @@ -0,0 +1,1710 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Kendryte Canaan K230 Clock Drivers
> + *
> + * Author: Xukai Wang <kingxukai@zohomail.com>
> + * Author: Troy Mitchell <troymitchell988@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <dt-bindings/clock/canaan,k230-clk.h>
> +
> +/* PLL control register bits. */
> +#define K230_PLL_BYPASS_ENABLE				BIT(19)
> +#define K230_PLL_GATE_ENABLE				BIT(2)
> +#define K230_PLL_GATE_WRITE_ENABLE			BIT(18)
> +#define K230_PLL_OD_SHIFT				24
> +#define K230_PLL_OD_MASK				0xF
> +#define K230_PLL_R_SHIFT				16
> +#define K230_PLL_R_MASK					0x3F
> +#define K230_PLL_F_SHIFT				0
> +#define K230_PLL_F_MASK					0x1FFFF
> +#define K230_PLL0_OFFSET_BASE				0x00
> +#define K230_PLL1_OFFSET_BASE				0x10
> +#define K230_PLL2_OFFSET_BASE				0x20
> +#define K230_PLL3_OFFSET_BASE				0x30
> +#define K230_PLL_DIV_REG_OFFSET				0x00
> +#define K230_PLL_BYPASS_REG_OFFSET			0x04
> +#define K230_PLL_GATE_REG_OFFSET			0x08
> +#define K230_PLL_LOCK_REG_OFFSET			0x0C

why we call it `K230_PLL_LOCK_REG_OFFSET`?
I noticed that the datasheet refers to it as PLL0_STAT,
with the description PLL0 status.
Would it be better to keep the original name for consistency?

Only bit 0 is the lock bit, and I'll talk more about that later.

> +
> +/* PLL lock register bits.  */
> +#define K230_PLL_STATUS_MASK				BIT(0)
this bit is pll0_lock
```
PLL 0 current lock status.
0x0: PLL not in lock state;
0x1: PLL in lock state.
```
how about we call it `K230_PLL_LOCK_STATUS_MASK`

> +
> +/* K230 CLK registers offset */
> +#define K230_CLK_AUDIO_CLKDIV_OFFSET			0x34
> +#define K230_CLK_PDM_CLKDIV_OFFSET			0x40
> +#define K230_CLK_CODEC_ADC_MCLKDIV_OFFSET		0x38
> +#define K230_CLK_CODEC_DAC_MCLKDIV_OFFSET		0x3c
> +
> +/* K230 CLK OPS. */
unuseful comment

> +#define K230_CLK_OPS_GATE				\
> +	.enable		= k230_clk_enable,		\
> +	.disable	= k230_clk_disable,		\
> +	.is_enabled	= k230_clk_is_enabled
> +
> +#define K230_CLK_OPS_RATE				\
> +	.set_rate	= k230_clk_set_rate,		\
> +	.round_rate	= k230_clk_round_rate,		\
> +	.recalc_rate	= k230_clk_get_rate
> +
> +#define K230_CLK_OPS_MUX				\
> +	.set_parent	= k230_clk_set_parent,		\
> +	.get_parent	= k230_clk_get_parent,		\
> +	.determine_rate	= clk_hw_determine_rate_no_reparent
> +
> +#define K230_CLK_OPS_ID_NONE				0
> +#define K230_CLK_OPS_ID_GATE_ONLY			1
> +#define K230_CLK_OPS_ID_RATE_ONLY			2
> +#define K230_CLK_OPS_ID_RATE_GATE			3
> +#define K230_CLK_OPS_ID_MUX_ONLY			4
> +#define K230_CLK_OPS_ID_MUX_GATE			5
> +#define K230_CLK_OPS_ID_MUX_RATE			6
> +#define K230_CLK_OPS_ID_ALL				7
> +#define K230_CLK_OPS_ID_NUM				8
> +
> +/* K230 CLK MACROS */
unuseful comment

> +#define K230_CLK_MAX_PARENT_NUM				6
...

> +
> +struct k230_clk_rate_cfg {
> +	/* rate reg */
> +	u32 rate_reg_off;
> +	void __iomem *rate_reg;
> +	/* rate info*/
> +	u32 rate_write_enable_bit;
> +	enum k230_clk_div_type method;
> +	/* rate mul */
> +	u32 rate_mul_min;
> +	u32 rate_mul_max;
> +	u32 rate_mul_shift;
> +	u32 rate_mul_mask;
> +	/* rate div */
> +	u32 rate_div_min;
> +	u32 rate_div_max;
> +	u32 rate_div_shift;
> +	u32 rate_div_mask;
> +};
unuseful comments in this structure

> +
> +struct k230_clk_rate_cfg_c {
> +	/* rate_c reg */
> +	u32 rate_reg_off_c;
> +	void __iomem *rate_reg_c;
> +
> +	/* rate_c info */
> +	u32 rate_write_enable_bit_c;
> +
> +	/* rate mul-changable */
> +	u32 rate_mul_min_c;
> +	u32 rate_mul_max_c;
> +	u32 rate_mul_shift_c;
> +	u32 rate_mul_mask_c;
> +};
unuseful comments in this structure

> +
> +struct k230_clk_gate_cfg {
> +	/* gate reg */
> +	u32 gate_reg_off;
> +	void __iomem *gate_reg;
unuseful comment

> +
> +	/* gate info*/
> +	u32 gate_bit_enable;
> +	bool gate_bit_reverse;
> +};

> +
> +struct k230_clk_mux_cfg {
> +	/* mux reg */
> +	u32 mux_reg_off;
unuseful comment

> +	void __iomem *mux_reg;
> +
> +	/* mux info */
> +	u32 mux_reg_shift;
> +	u32 mux_reg_mask;
> +};
> +
> +enum k230_clk_parent_type {
> +	K230_OSC24M,
> +	K230_PLL,
> +	K230_PLL_DIV,
> +	K230_CLK_COMPOSITE,
> +};
> +
> +struct k230_clk_cfg;
> +
> +struct k230_clk_parent {
> +	enum k230_clk_parent_type type;
> +	union {
> +		struct k230_pll_cfg	*pll_cfg;
> +		struct k230_pll_div_cfg	*pll_div_cfg;
> +		struct k230_clk_cfg	*clk_cfg;
> +	};
> +};
> +
> +struct k230_clk_cfg {
> +	/* attr */
> +	const char *name;
unuseful comment

> +
> +	/* 0-read & write; 1-read only */
> +	bool read_only;
unuseful comment

> +	int num_parent;
> +	struct k230_clk_parent parent[K230_CLK_MAX_PARENT_NUM];
> +	struct k230_clk *clk;
> +	int flags;
> +
> +	/* cfgs */
unuseful comment

> +	struct k230_clk_rate_cfg	*rate_cfg;
> +	struct k230_clk_rate_cfg_c	*rate_cfg_c;
> +	struct k230_clk_gate_cfg	*gate_cfg;
> +	struct k230_clk_mux_cfg		*mux_cfg;
> +};
>
...

> +static struct k230_clk_cfg k230_shrm_pdma_axi = {
> +		.name = "shrm_pdma_axi",
> +		.read_only = false,
> +		.flags = 0,
> +		.num_parent = 1,
> +		.parent[0] = {
> +			.type = K230_CLK_COMPOSITE,
> +			.clk_cfg = &k230_shrm_axi_src,
> +		},
> +		.rate_cfg = NULL,
> +		.rate_cfg_c = NULL,
> +		.gate_cfg = &k230_shrm_pdma_axi_gate,
> +		.mux_cfg = NULL,
> +};
Consider defining a macro to generate those structures?

...

> +static int k230_pll_prepare(struct clk_hw *hw)
> +{
> +	struct k230_pll *pll = to_k230_pll(hw);
> +	u32 reg;
> +
> +	/* wait for PLL lock until it reaches lock status */
> +	return readl_poll_timeout(pll->lock, reg,
> +				  (reg & K230_PLL_STATUS_MASK) == K230_PLL_STATUS_MASK,
(reg & K230_PLL_STATUS_MASK),

> +				  400, 0);
> +}
> +
> +static bool k230_pll_hw_is_enabled(struct k230_pll *pll)
> +{
> +	return (readl(pll->gate) & K230_PLL_GATE_ENABLE) == K230_PLL_GATE_ENABLE;
return !!(readl(pll->gate) & K230_PLL_GATE_ENABLE);

> +}
> +
> +static void k230_pll_enable_hw(void __iomem *regs, struct k230_pll *pll)
> +{
> +	u32 reg;
> +
> +	if (k230_pll_hw_is_enabled(pll))
> +		return;
> +
> +	/* Set PLL factors */
> +	reg = readl(pll->gate);
> +	reg |= (K230_PLL_GATE_ENABLE | K230_PLL_GATE_WRITE_ENABLE);
reg |= K230_PLL_GATE_ENABLE | K230_PLL_GATE_WRITE_ENABLE;

> +	writel(reg, pll->gate);
> +}
> +
> +static int k230_pll_enable(struct clk_hw *hw)
> +{
> +	struct k230_pll *pll = to_k230_pll(hw);
> +	struct k230_sysclk *ksc = pll->ksc;
> +
> +	guard(spinlock)(&ksc->pll_lock);
> +	k230_pll_enable_hw(ksc->regs, pll);
> +
> +	return 0;
> +}
> +
> +static void k230_pll_disable(struct clk_hw *hw)
> +{
> +	struct k230_pll *pll = to_k230_pll(hw);
> +	struct k230_sysclk *ksc = pll->ksc;
> +	u32 reg;
> +
> +	guard(spinlock)(&ksc->pll_lock);
blank line here

> +	reg = readl(pll->gate);
> +	reg &= ~(K230_PLL_GATE_ENABLE);
> +	reg |= (K230_PLL_GATE_WRITE_ENABLE);
> +	writel(reg, pll->gate);
> +}
> +
> +static int k230_pll_is_enabled(struct clk_hw *hw)
inline here

> +{
> +	return k230_pll_hw_is_enabled(to_k230_pll(hw));
> +}
> +
> +static int k230_pll_init(struct clk_hw *hw)
> +{
> +	if (k230_pll_is_enabled(hw))
> +		return clk_prepare_enable(hw->clk);
> +
> +	return 0;
> +}
> +

...

> +static int k230_clk_enable(struct clk_hw *hw)
> +{
> +	struct k230_clk *clk = to_k230_clk(hw);
> +	struct k230_sysclk *ksc = clk->ksc;
> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
> +	struct k230_clk_gate_cfg *gate_cfg = cfg->gate_cfg;
> +	u32 reg;
> +
> +	guard(spinlock)(&ksc->clk_lock);
blank line here

> +	reg = readl(gate_cfg->gate_reg);
> +	if (gate_cfg->gate_bit_reverse)
> +		reg &= ~BIT(gate_cfg->gate_bit_enable);
> +	else
> +		reg |= BIT(gate_cfg->gate_bit_enable);
> +	writel(reg, gate_cfg->gate_reg);
> +
> +	return 0;
> +}
> +
> +static void k230_clk_disable(struct clk_hw *hw)
> +{
> +	struct k230_clk *clk = to_k230_clk(hw);
> +	struct k230_sysclk *ksc = clk->ksc;
> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
> +	struct k230_clk_gate_cfg *gate_cfg = cfg->gate_cfg;
> +	u32 reg;
> +
> +	guard(spinlock)(&ksc->clk_lock);
blank line here

> +	reg = readl(gate_cfg->gate_reg);
> +
drop blank line

> +	if (gate_cfg->gate_bit_reverse)
> +		reg |= BIT(gate_cfg->gate_bit_enable);
> +	else
> +		reg &= ~BIT(gate_cfg->gate_bit_enable);
> +
drop blank line

> +	writel(reg, gate_cfg->gate_reg);
> +}
> +
> +static int k230_clk_is_enabled(struct clk_hw *hw)
> +{
> +	struct k230_clk *clk = to_k230_clk(hw);
> +	struct k230_sysclk *ksc = clk->ksc;
> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
> +	struct k230_clk_gate_cfg *gate_cfg = cfg->gate_cfg;
> +	u32 reg;
> +
> +	guard(spinlock)(&ksc->clk_lock);
blank line here

> +	reg = readl(gate_cfg->gate_reg);
> +
drop blank line

> +	/* Check gate bit condition based on configuration and then set ret */
> +	if (gate_cfg->gate_bit_reverse)
> +		return (BIT(gate_cfg->gate_bit_enable) & reg) ? 1 : 0;
> +	else
drop else

> +		return (BIT(gate_cfg->gate_bit_enable) & ~reg) ? 1 : 0;
> +}
> +
> +static int k230_clk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct k230_clk *clk = to_k230_clk(hw);
> +	struct k230_sysclk *ksc = clk->ksc;
> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
> +	struct k230_clk_mux_cfg *mux_cfg = cfg->mux_cfg;
> +	u8 reg;
> +
> +	guard(spinlock)(&ksc->clk_lock);
blank line here

> +	reg = (mux_cfg->mux_reg_mask & index) << mux_cfg->mux_reg_shift;
> +	writeb(reg, mux_cfg->mux_reg);
> +
> +	return 0;
> +}
> +
> +static u8 k230_clk_get_parent(struct clk_hw *hw)
> +{
> +	struct k230_clk *clk = to_k230_clk(hw);
> +	struct k230_sysclk *ksc = clk->ksc;
> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
> +	struct k230_clk_mux_cfg *mux_cfg = cfg->mux_cfg;
> +	u8 reg;
> +
> +	guard(spinlock)(&ksc->clk_lock);
> +	reg = readb(mux_cfg->mux_reg);
> +
> +	return reg;
return readb(mux_cfg->mux_reg);

> +}
> +
> +static unsigned long k230_clk_get_rate(struct clk_hw *hw,
> +				       unsigned long parent_rate)
> +{
> +	struct k230_clk *clk = to_k230_clk(hw);
> +	struct k230_sysclk *ksc = clk->ksc;
> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
> +	struct k230_clk_rate_cfg_c *rate_cfg_c = cfg->rate_cfg_c;
> +	u32 mul, div;
> +
> +	if (!rate_cfg) /* no divider, return parents' clk */
wrong comment style

> +		return parent_rate;
> +
> +	guard(spinlock)(&ksc->clk_lock);
blank line here

> +	switch (rate_cfg->method) {
> +	/*
> +	 * K230_MUL: div_mask+1/div_max...
> +	 * K230_DIV: mul_max/div_mask+1
> +	 * K230_MUL_DIV: mul_mask/div_mask...
> +	 */
> +	case K230_MUL:
> +		div = rate_cfg->rate_div_max;
> +		mul = (readl(rate_cfg->rate_reg) >> rate_cfg->rate_div_shift)
> +			& rate_cfg->rate_div_mask;
> +		mul++;
> +		break;
> +	case K230_DIV:
> +		mul = rate_cfg->rate_mul_max;
> +		div = (readl(rate_cfg->rate_reg) >> rate_cfg->rate_div_shift)
> +			& rate_cfg->rate_div_mask;
> +		div++;
> +		break;
> +	case K230_MUL_DIV:
> +		if (!rate_cfg_c) {
> +			mul = (readl(rate_cfg->rate_reg) >> rate_cfg->rate_mul_shift)
> +				& rate_cfg->rate_mul_mask;
> +			div = (readl(rate_cfg->rate_reg) >> rate_cfg->rate_div_shift)
> +				& rate_cfg->rate_div_mask;
> +		} else {
> +			mul = (readl(rate_cfg_c->rate_reg_c) >> rate_cfg_c->rate_mul_shift_c)
> +				& rate_cfg_c->rate_mul_mask_c;
> +			div = (readl(rate_cfg->rate_reg) >> rate_cfg->rate_div_shift)
> +				& rate_cfg->rate_div_mask;
> +		}
> +		break;
Should we report an error in other cases?

> +	}
> +
> +	return mul_u64_u32_div(parent_rate, mul, div);
> +}
> +
> +static int k230_clk_find_approximate(struct k230_clk *clk,
> +				     u32 mul_min,
> +				     u32 mul_max,
> +				     u32 div_min,
> +				     u32 div_max,
> +				     enum k230_clk_div_type method,
> +				     unsigned long rate,
> +				     unsigned long parent_rate,
> +				     u32 *div,
> +				     u32 *mul)
> +{
> +	long abs_min;
> +	long abs_current;
> +	long perfect_divide;
> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
> +
> +	const u32 codec_clk[9] = {
> +		2048000,
> +		3072000,
> +		4096000,
> +		6144000,
> +		8192000,
> +		11289600,
> +		12288000,
> +		24576000,
> +		49152000
> +	};
> +
> +	const u32 codec_div[9][2] = {
> +		{3125, 16},
> +		{3125, 24},
> +		{3125, 32},
> +		{3125, 48},
> +		{3125, 64},
> +		{15625, 441},
> +		{3125, 96},
> +		{3125, 192},
> +		{3125, 384}
> +	};
> +
> +	const u32 pdm_clk[20] = {
> +		128000,
> +		192000,
> +		256000,
> +		384000,
> +		512000,
> +		768000,
> +		1024000,
> +		1411200,
> +		1536000,
> +		2048000,
> +		2822400,
> +		3072000,
> +		4096000,
> +		5644800,
> +		6144000,
> +		8192000,
> +		11289600,
> +		12288000,
> +		24576000,
> +		49152000
> +	};
> +
> +	const u32 pdm_div[20][2] = {
> +		{3125, 1},
> +		{6250, 3},
> +		{3125, 2},
> +		{3125, 3},
> +		{3125, 4},
> +		{3125, 6},
> +		{3125, 8},
> +		{125000, 441},
> +		{3125, 12},
> +		{3125, 16},
> +		{62500, 441},
> +		{3125, 24},
> +		{3125, 32},
> +		{31250, 441},
> +		{3125, 48},
> +		{3125, 64},
> +		{15625, 441},
> +		{3125, 96},
> +		{3125, 192},
> +		{3125, 384}
> +	};
> +
> +	switch (method) {
> +	/* only mul can be changeable 1/12,2/12,3/12...*/
> +	case K230_MUL:
> +		perfect_divide = (long)((parent_rate * 1000) / rate);
> +		abs_min = abs(perfect_divide -
> +			     (long)(((long)div_max * 1000) / (long)mul_min));
> +		*mul = mul_min;
> +
> +		for (u32 i = mul_min + 1; i <= mul_max; i++) {
> +			abs_current = abs(perfect_divide -
> +					(long)((long)((long)div_max * 1000) / (long)i));
> +			if (abs_min > abs_current) {
> +				abs_min = abs_current;
> +				*mul = i;
> +			}
> +		}
> +
> +		*div = div_max;
> +		break;
> +	/* only div can be changeable, 1/1,1/2,1/3...*/
> +	case K230_DIV:
> +		perfect_divide = (long)((parent_rate * 1000) / rate);
> +		abs_min = abs(perfect_divide -
> +			     (long)(((long)div_min * 1000) / (long)mul_max));
> +		*div = div_min;
> +
> +		for (u32 i = div_min + 1; i <= div_max; i++) {
> +			abs_current = abs(perfect_divide -
> +					 (long)((long)((long)i * 1000) / (long)mul_max));
> +			if (abs_min > abs_current) {
> +				abs_min = abs_current;
> +				*div = i;
> +			}
> +		}
> +
> +		*mul = mul_max;
> +		break;
> +	/* mul and div can be changeable. */
> +	case K230_MUL_DIV:
> +		if (rate_cfg->rate_reg_off == K230_CLK_CODEC_ADC_MCLKDIV_OFFSET ||
> +		    rate_cfg->rate_reg_off == K230_CLK_CODEC_DAC_MCLKDIV_OFFSET) {
> +			for (u32 j = 0; j < 9; j++) {
> +				if (0 == (rate - codec_clk[j])) {
if (rate - codec_clk[j] == 0)

> +					*div = codec_div[j][0];
> +					*mul = codec_div[j][1];
> +				}
> +			}
> +		} else if (rate_cfg->rate_reg_off == K230_CLK_AUDIO_CLKDIV_OFFSET ||
> +			   rate_cfg->rate_reg_off == K230_CLK_PDM_CLKDIV_OFFSET) {
> +			for (u32 j = 0; j < 20; j++) {
> +				if (0 == (rate - pdm_clk[j])) {
if (rate - pdm_clk[j] == 0)

> +					*div = pdm_div[j][0];
> +					*mul = pdm_div[j][1];
> +				}
> +			}
> +		} else {
> +			return -EINVAL;
> +		}
> +		break;
Should we report an error when other case?

> +	}
> +
> +	return 0;
> +}
> +
> +static long k230_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *parent_rate)
> +{
> +	struct k230_clk *clk = to_k230_clk(hw);
> +	struct k230_sysclk *ksc = clk->ksc;
> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
> +	u32 div = 0, mul = 0;
> +
> +	if (k230_clk_find_approximate(clk,
> +				      rate_cfg->rate_mul_min, rate_cfg->rate_mul_max,
> +				      rate_cfg->rate_div_min, rate_cfg->rate_div_max,
> +				      rate_cfg->method, rate, *parent_rate, &div, &mul)) {
> +		return 0;
> +	}
removing the curly braces

> +
> +	return mul_u64_u32_div(*parent_rate, mul, div);
> +}
> +
> +static int k230_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +			     unsigned long parent_rate)
> +{
> +	struct k230_clk *clk = to_k230_clk(hw);
> +	struct k230_sysclk *ksc = clk->ksc;
> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
> +	struct k230_clk_rate_cfg_c *rate_cfg_c = cfg->rate_cfg_c;
> +	u32 div = 0, mul = 0, reg = 0, reg_c;
> +
> +	if (rate > parent_rate || rate == 0 || parent_rate == 0) {
> +		dev_err(&ksc->pdev->dev, "rate or parent_rate error\n");
> +		return -EINVAL;
> +	}
> +
> +	if (cfg->read_only) {
> +		dev_err(&ksc->pdev->dev, "This clk rate is read only\n");
> +		return -EPERM;
> +	}
> +
> +	if (k230_clk_find_approximate(clk,
> +				      rate_cfg->rate_mul_min, rate_cfg->rate_mul_max,
> +				      rate_cfg->rate_div_min, rate_cfg->rate_div_max,
> +				      rate_cfg->method, rate, parent_rate, &div, &mul)) {
> +		return -EINVAL;
> +	}
> +
> +	guard(spinlock)(&ksc->clk_lock);
blank line here

put `reg = readl(rate_cfg->rate_reg);` here
> +	if (!rate_cfg_c) {
> +		reg = readl(rate_cfg->rate_reg);
> +		reg &= ~((rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift));
> +
> +		if (rate_cfg->method == K230_DIV) {
> +			reg &= ~((rate_cfg->rate_mul_mask) << (rate_cfg->rate_mul_shift));
> +			reg |= ((div - 1) & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
> +		} else if (rate_cfg->method == K230_MUL) {
> +			reg |= ((mul - 1) & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
> +		} else {
> +			reg |= (mul & rate_cfg->rate_mul_mask) << (rate_cfg->rate_mul_shift);
> +			reg |= (div & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
> +		}
> +		reg |= BIT(rate_cfg->rate_write_enable_bit);
> +	} else {
> +		reg = readl(rate_cfg->rate_reg);
> +		reg_c = readl(rate_cfg_c->rate_reg_c);
> +		reg &= ~((rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift));
> +		reg_c &= ~((rate_cfg_c->rate_mul_mask_c) << (rate_cfg_c->rate_mul_shift_c));
> +		reg_c |= BIT(rate_cfg_c->rate_write_enable_bit_c);
> +
> +		reg_c |= (mul & rate_cfg_c->rate_mul_mask_c) << (rate_cfg_c->rate_mul_shift_c);
> +		reg |= (div & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
This is a bit confusing. Please read and operate one at a time.
It's better to read reg_c as the second one,
so it can be merged with the write operation to maintain the R/M/W principle.

> +
> +		writel(reg_c, rate_cfg_c->rate_reg_c);
> +	}
> +	writel(reg, rate_cfg->rate_reg);
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops k230_clk_ops_arr[K230_CLK_OPS_ID_NUM] = {
> +	[K230_CLK_OPS_ID_NONE] = {
> +		/* Sentinel */
> +	},
> +	[K230_CLK_OPS_ID_GATE_ONLY] = {
> +		K230_CLK_OPS_GATE,
> +	},
> +	[K230_CLK_OPS_ID_RATE_ONLY] = {
> +		K230_CLK_OPS_RATE,
> +	},
> +	[K230_CLK_OPS_ID_RATE_GATE] = {
> +		K230_CLK_OPS_RATE,
> +		K230_CLK_OPS_GATE,
> +	},
> +	[K230_CLK_OPS_ID_MUX_ONLY] = {
> +		K230_CLK_OPS_MUX,
> +	},
> +	[K230_CLK_OPS_ID_MUX_GATE] = {
> +		K230_CLK_OPS_MUX,
> +		K230_CLK_OPS_GATE,
> +	},
> +	[K230_CLK_OPS_ID_MUX_RATE] = {
> +		K230_CLK_OPS_MUX,
> +		K230_CLK_OPS_RATE,
> +	},
> +	[K230_CLK_OPS_ID_ALL] = {
> +		K230_CLK_OPS_MUX,
> +		K230_CLK_OPS_RATE,
> +		K230_CLK_OPS_GATE,
> +	},
> +};
> +
> +static int k230_register_clk(struct platform_device *pdev,
> +			     struct k230_sysclk *ksc,
> +			     int id,
> +			     const struct clk_parent_data *parent_data,
> +			     u8 num_parents,
> +			     unsigned long flags)
> +{
> +	struct k230_clk *clk = &ksc->clks[id];
> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[id];
> +	struct k230_clk_gate_cfg *gate_cfg = cfg->gate_cfg;
> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
> +	struct k230_clk_mux_cfg *mux_cfg = cfg->mux_cfg;
> +	struct k230_clk_rate_cfg_c *rate_cfg_c = cfg->rate_cfg_c;
> +	struct clk_init_data init = {};
> +	int clk_id = 0;
> +	int ret;
> +
> +	if (rate_cfg) {
> +		rate_cfg->rate_reg = ksc->regs + rate_cfg->rate_reg_off;
> +		clk_id += K230_CLK_OPS_ID_RATE_ONLY;
> +	}
> +
> +	if (mux_cfg) {
> +		mux_cfg->mux_reg = ksc->regs + mux_cfg->mux_reg_off;
> +		clk_id += K230_CLK_OPS_ID_MUX_ONLY;
> +
> +		/* mux clock doesn't match the case that num_parents less than 2 */
> +		if (num_parents < 2)
> +			return -EINVAL;
> +	}
> +
> +	if (gate_cfg) {
> +		gate_cfg->gate_reg = ksc->regs + gate_cfg->gate_reg_off;
> +		clk_id += K230_CLK_OPS_ID_GATE_ONLY;
> +	}
> +
> +	if (rate_cfg_c)
> +		rate_cfg_c->rate_reg_c = ksc->regs + rate_cfg_c->rate_reg_off_c;
> +
> +	init.name = k230_clk_cfgs[id]->name;
> +	init.flags = flags;
> +	init.parent_data = parent_data;
> +	init.num_parents = num_parents;
> +	init.ops = &k230_clk_ops_arr[clk_id];
> +
> +	clk->id = id;
> +	clk->ksc = ksc;
> +	clk->hw.init = &init;
> +
> +	ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
> +	if (ret)
> +		return ret;
> +
> +	k230_clk_cfgs[id]->clk = clk;
> +
> +	return 0;
> +}
> +
> +static int k230_register_mux_clk(struct platform_device *pdev,
consider adding inline here?
> +				 struct k230_sysclk *ksc,
> +				 struct clk_parent_data *parent_data,
> +				 int num_parent,
> +				 int id)
> +{
> +	return k230_register_clk(pdev, ksc, id, parent_data, num_parent, 0);
> +}
> +
> +static int k230_register_osc24m_child(struct platform_device *pdev,
> +				      struct k230_sysclk *ksc,
> +				      int id)
> +{
> +	const struct clk_parent_data parent_data = {
> +		.index = 0,
> +	};
blank line here

> +	return k230_register_clk(pdev, ksc, id, &parent_data, 1, 0);
> +}
> +
> +static int k230_register_pll_child(struct platform_device *pdev,
> +				   struct k230_sysclk *ksc,
> +				   int id,
> +				   struct clk_hw *parent_hw,
> +				   unsigned long flags)
> +{
> +	const struct clk_parent_data parent_data = {
> +		.hw = parent_hw,
> +	};
blank line here

> +	return k230_register_clk(pdev, ksc, id, &parent_data, 1, flags);
> +}
> +
> +static int k230_register_pll_div_child(struct platform_device *pdev,
> +				       struct k230_sysclk *ksc,
> +				       int id,
> +				       struct clk_hw *parent_hw,
> +				       unsigned long flags)
> +{
> +	const struct clk_parent_data parent_data = {
> +		.hw = parent_hw,
> +	};
blank line here

> +	return k230_register_clk(pdev, ksc, id, &parent_data, 1, flags);
> +}
> +
> +static int k230_register_clk_child(struct platform_device *pdev,
> +				   struct k230_sysclk *ksc,
> +				   int id,
> +				   struct clk_hw *parent_hw)
> +{
> +	const struct clk_parent_data parent_data = {
> +		.hw = parent_hw,
> +	};
blank line here

          - Troy

> +	return k230_register_clk(pdev, ksc, id, &parent_data, 1, 0);
> +}
> +
> +static int k230_clk_get_parent_data(struct k230_clk_parent *pclk,
> +				    struct clk_parent_data *parent_data)
> +{
> +	switch (pclk->type) {
> +	case K230_OSC24M:
> +		parent_data->index = 0;
> +		break;
> +	case K230_PLL:
> +		parent_data->hw = &pclk->pll_cfg->pll->hw;
> +		break;
> +	case K230_PLL_DIV:
> +		parent_data->hw = pclk->pll_div_cfg->pll_div->hw;
> +		break;
> +	case K230_CLK_COMPOSITE:
> +		parent_data->hw = &pclk->clk_cfg->clk->hw;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int k230_clk_mux_get_parent_data(struct k230_clk_cfg *cfg,
> +					struct clk_parent_data *parent_data)
> +{
> +	int ret;
> +	struct k230_clk_parent *pclk = cfg->parent;
> +
> +	for (int i = 0; i < cfg->num_parent; i++) {
> +		ret = k230_clk_get_parent_data(&pclk[i], &parent_data[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int k230_register_clks(struct platform_device *pdev, struct k230_sysclk *ksc)
> +{
> +	struct k230_clk_cfg *cfg;
> +	struct k230_clk_parent *pclk;
> +	struct clk_parent_data parent_data[K230_CLK_MAX_PARENT_NUM];
> +	int ret, i;
> +
> +	/*
> +	 *  Single parent clock:
> +	 *  pll0_div2 sons: cpu0_src
> +	 *  pll0_div4 sons: cpu0_pclk
> +	 *  cpu0_src sons: cpu0_aclk, cpu0_plic, cpu0_noc_ddrcp4, pmu_pclk
> +	 *
> +	 *  Mux clock:
> +	 *  hs_ospi_src parents: pll0_div2, pll2_div4
> +	 */
> +	for (i = 0; i < K230_CLK_NUM; i++) {
> +		cfg = k230_clk_cfgs[i];
> +		if (!cfg)
> +			continue;
> +
> +		if (cfg->mux_cfg) {
> +			ret = k230_clk_mux_get_parent_data(cfg, parent_data);
> +			if (ret)
> +				return ret;
> +
> +			ret = k230_register_mux_clk(pdev, ksc, parent_data,
> +						    cfg->num_parent, i);
> +		} else {
> +			pclk = cfg->parent;
> +			switch (pclk->type) {
> +			case K230_OSC24M:
> +				ret = k230_register_osc24m_child(pdev, ksc, i);
> +				break;
> +			case K230_PLL:
> +				ret = k230_register_pll_child(pdev, ksc, i,
> +							      &pclk->pll_cfg->pll->hw,
> +							      cfg->flags);
> +				break;
> +			case K230_PLL_DIV:
> +				ret = k230_register_pll_div_child(pdev, ksc, i,
> +								  pclk->pll_div_cfg->pll_div->hw,
> +								  cfg->flags);
> +				break;
> +			case K230_CLK_COMPOSITE:
> +				ret = k230_register_clk_child(pdev, ksc, i,
> +							      &pclk->clk_cfg->clk->hw);
> +				break;
> +			}
> +		}
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct clk_hw *k230_clk_hw_onecell_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct k230_sysclk *ksc;
> +	unsigned int idx;
> +
> +	if (clkspec->args_count != 1)
> +		return ERR_PTR(-EINVAL);
> +
> +	idx = clkspec->args[0];
> +	if (idx >= K230_CLK_NUM)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!data)
> +		return ERR_PTR(-EINVAL);
> +
> +	ksc = data;
> +
> +	return &ksc->clks[idx].hw;
> +}
> +
> +static int k230_clk_init_plls(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct k230_sysclk *ksc = platform_get_drvdata(pdev);
> +
> +	spin_lock_init(&ksc->pll_lock);
> +
> +	ksc->pll_regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ksc->pll_regs))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ksc->pll_regs), "map registers failed\n");
> +
> +	ret = k230_register_plls(pdev, ksc);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "register plls failed\n");
> +
> +	ret = k230_register_pll_divs(pdev, ksc);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "register pll_divs failed\n");
> +
> +	for (int i = 0; i < K230_PLL_DIV_NUM; i++) {
> +		ret = devm_clk_hw_register_clkdev(&pdev->dev, ksc->dclks[i].hw,
> +						  k230_pll_div_cfgs[i].name, NULL);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret, "clock_lookup create failed\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int k230_clk_init_clks(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct k230_sysclk *ksc = platform_get_drvdata(pdev);
> +
> +	spin_lock_init(&ksc->clk_lock);
> +
> +	ksc->regs = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(ksc->regs))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ksc->regs), "failed to map registers\n");
> +
> +	ret = k230_register_clks(pdev, ksc);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "register clock provider failed\n");
> +
> +	ret = devm_of_clk_add_hw_provider(&pdev->dev, k230_clk_hw_onecell_get, ksc);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "add clock provider failed\n");
> +
> +	return 0;
> +}
> +
> +static int k230_clk_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct k230_sysclk *ksc;
> +
> +	ksc = devm_kzalloc(&pdev->dev, sizeof(*ksc), GFP_KERNEL);
> +	if (!ksc)
> +		return -ENOMEM;
> +
> +	ksc->plls = devm_kcalloc(&pdev->dev, K230_PLL_NUM,
> +				 sizeof(*ksc->plls), GFP_KERNEL);
> +	if (!ksc->plls)
> +		return -ENOMEM;
> +
> +	ksc->dclks = devm_kcalloc(&pdev->dev, K230_PLL_DIV_NUM,
> +				  sizeof(*ksc->dclks), GFP_KERNEL);
> +	if (!ksc->dclks)
> +		return -ENOMEM;
> +
> +	ksc->clks = devm_kcalloc(&pdev->dev, K230_CLK_NUM,
> +				 sizeof(*ksc->clks), GFP_KERNEL);
> +	if (!ksc->clks)
> +		return -ENOMEM;
> +
> +	ksc->pdev = pdev;
> +	platform_set_drvdata(pdev, ksc);
> +
> +	ret = k230_clk_init_plls(pdev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "init plls failed\n");
> +
> +	ret = k230_clk_init_clks(pdev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "init clks failed\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id k230_clk_ids[] = {
> +	{ .compatible = "canaan,k230-clk" },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, k230_clk_ids);
> +
> +static struct platform_driver k230_clk_driver = {
> +	.driver = {
> +		.name  = "k230_clock_controller",
> +		.of_match_table = k230_clk_ids,
> +	},
> +	.probe = k230_clk_probe,
> +};
> +builtin_platform_driver(k230_clk_driver);
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

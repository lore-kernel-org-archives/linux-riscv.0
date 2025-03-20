Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E087FC36001
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 07:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGU2oojuc46KC9VoUQkX1rBi3hybUGi2b/RsYNFIOsA=; b=Ju82bLLNaXhWot
	6xj/2sHzM3te+Q2csrNVdrD6iuHRdwEzoX3U3ReTHtGhx3IB5aw+SIN50SKWIqsMmGPORs2nWmXCb
	79AsdFu2UNG47hx3E8zosef1dvUiZBrJsKbLuMKJXR8J0Dl7rqNmZrAyQoKhVk+npzv03lMTpEJGO
	TvOFui5ut/IWpiqcaVAt3gHB8oohJEWu3/uQLyHvAV6fbdlNxPv8FA1DvUzkrrCjk9lyWPeGbjHJb
	o56uOPu4u7+DWl2te7XFoRO3GXeqgdEVC9WD7eugQz/buj0SbJWdmqihQ8JXtZdbSZSyrSyH9fB0q
	8BXHHFJ/MvTAYS7cZpOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvA2K-0000000BN87-0fni;
	Thu, 20 Mar 2025 07:09:52 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvA2H-0000000BN7h-3MdW
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 07:09:51 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-22398e09e39so6761575ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 00:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742454588; x=1743059388; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4nAhjK9y3Zh+il9eKutxRFA5s28HksmXJM2UbJ9s7NY=;
        b=go4u3LWG5ipr58PjeWM4vlVfMGCnYsjmONwKbiRQihGmXll6yjnY256X917hi5zyDu
         lTmT8Ghrt7h45c671G/iGxKCXzZexQKrmVICuf8JSDcQT8pr/teR/JZnHJUZGgknoAOB
         1/NMYQyj9gVuUDcRGvTEzBe2YvoatEHvnK13twl9GxdXiNbprTiI/HOO62eZZx/q9ttj
         PqgYjejCp1d7GZFSSOZfkS6GCdpTg53IWMGQ5fx4z0Gq7+oar4UDTKv1dwcfLswZtBzS
         Pd94LfBg55vyDV7D/YKMz5OIMeMt5Tdg5Hru9hmaPClNa1aF3xTr5nXegiUwKgrvOjC/
         jBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742454588; x=1743059388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4nAhjK9y3Zh+il9eKutxRFA5s28HksmXJM2UbJ9s7NY=;
        b=ss0aPramA0h9v3hd6+uEApxsoylEe6de5OrjkfuxLWB88r0qHqPugO4bJUz6uoeYH7
         6mUXMf7IRTYYgq7wc/i7D3AqqGh8ya34omV/TNagGEMZgn3dYlA4IV48p8W4YGenGtFA
         qtjCAo6Zbn+qqMTpQPwX7mdIpxaOiUt63z4tOxRTJOSFd8S5BWlN5XVaqW8uFxhskba/
         +POktLaxptKkJJiqgeRdsTMciUh5ThmNqJ+ZKAuVu35YggsHHcl0QqdLf8rPlYeGO+/m
         c5STAtozsOMd8pzEaygcRogQrvyXFcQWGSO89DHgdI/y6eXJyyWcvB6MqqMEqll1RKDH
         MffA==
X-Forwarded-Encrypted: i=1; AJvYcCWW6IFSQaIOrgnag0EgamzZlS2vAKmdT5LTg+Pnq4/68Fgu2qzVwzbFJtk27kQMZdCuqwz3aa0LpS0bXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPZdch1ju8tT7FWQJXaf6Mq4k4AI+LBf84WJJJKE/kehj8+PZU
	mKkDIbMKgIOfq9MMCYtxETc6Ta7k5W2Q6uaWbbWcAHuY6E4eJm+3q5bDAvnadCSxLg==
X-Gm-Gg: ASbGncuLI1lkWPa+qz5rSiI7i550qAuOJicvvnxQXCS7eROSv6UxqjAS3lcVAEzJdi1
	TxBTmzQOV2vYFwUx3lG7sKrXTx0WFZOK619ovqGaqtZD/DBhYwsyjsxyen7+0hWCI5aL4ipsGW1
	EhxKLwtWIWsNJ/kdqtQ47jqcTJj5HTNHfKCWpFpjBxLQQjkiSjgYz/Cl8C6OiSOWC6y9srnh1Ql
	jbDHSGYjubDhmH/c/cNx/q4Rl0lkDnwPcC121PB+pKSf+HpDCfpSoO4fQi1lMqkcOfUUbKGq1pc
	d/CGleCOxRq9WnKSQ/uC2p7RanYqtA==
X-Google-Smtp-Source: AGHT+IGE5LYsYMAutyot9CUzHw9f/eayOhashOgX28tKi4FuPJBcL2K77OwhQcox15wTLrQtWywGNQ==
X-Received: by 2002:a17:902:e841:b0:220:e63c:5aff with SMTP id d9443c01a7336-2265ee904c0mr30968485ad.47.1742454588075;
        Thu, 20 Mar 2025 00:09:48 -0700 (PDT)
Received: from [172.29.0.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c688856fsm128073435ad.14.2025.03.20.00.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 00:09:47 -0700 (PDT)
Message-ID: <fb9dba11-5a23-48a2-8b11-a544580eeaca@gmail.com>
Date: Thu, 20 Mar 2025 15:09:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH RESEND v5 2/3] clk: canaan: Add clock driver for Canaan
 K230
To: Xukai Wang <kingxukai@zohomail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
References: <20250320-b4-k230-clk-v5-0-0e9d089c5488@zohomail.com>
 <20250320-b4-k230-clk-v5-2-0e9d089c5488@zohomail.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <20250320-b4-k230-clk-v5-2-0e9d089c5488@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_000949_849790_E806EC74 
X-CRM114-Status: GOOD (  25.33  )
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

On 2025/3/20 11:25, Xukai Wang wrote:
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
>  drivers/clk/clk-k230.c | 1711 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1718 insertions(+)
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
> index 0000000000000000000000000000000000000000..96e2a83830c1b69f0ed70ef2b6267e9f05fc505b
> --- /dev/null
> +++ b/drivers/clk/clk-k230.c
> @@ -0,0 +1,1711 @@
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
> +
> +/* PLL lock register bits.  */
> +#define K230_PLL_STATUS_MASK				BIT(0)
> +
> +/* K230 CLK registers offset */
> +#define K230_CLK_AUDIO_CLKDIV_OFFSET			0x34
> +#define K230_CLK_PDM_CLKDIV_OFFSET			0x40
> +#define K230_CLK_CODEC_ADC_MCLKDIV_OFFSET		0x38
> +#define K230_CLK_CODEC_DAC_MCLKDIV_OFFSET		0x3c
> +
> +/* K230 CLK OPS. */
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
> +/* K230 CLK MACROS */why all caps?

> +#define K230_CLK_MAX_PARENT_NUM				6
> +
> +#define K230_GATE_FORMAT(_reg, _bit, _reverse)					\
> +	.gate_reg_off = (_reg),							\
> +	.gate_bit_enable = (_bit),						\
> +	.gate_bit_reverse = (_reverse)
> +
> +#define K230_RATE_FORMAT(_mul_min, _mul_max, _mul_shift, _mul_mask,		\
> +			_div_min, _div_max, _div_shift, _div_mask,		\
> +			_reg, _bit, _method)					\
> +	.rate_mul_min = (_mul_min),						\
> +	.rate_mul_max = (_mul_max),						\
> +	.rate_mul_shift = (_mul_shift),						\
> +	.rate_mul_mask = (_mul_mask),						\
> +	.rate_div_min = (_div_min),						\
> +	.rate_div_max = (_div_max),						\
> +	.rate_div_shift = (_div_shift),						\
> +	.rate_div_mask = (_div_mask),						\
> +	.rate_reg_off = (_reg),							\
> +	.rate_write_enable_bit = (_bit),					\
> +	.method = (_method)
> +
> +#define K230_RATE_C_FORMAT(_mul_min, _mul_max, _mul_shift, _mul_mask,		\
> +			   _reg, _bit)						\
> +	.rate_mul_min_c = (_mul_min),						\
> +	.rate_mul_max_c = (_mul_max),						\
> +	.rate_mul_shift_c = (_mul_shift),					\
> +	.rate_mul_mask_c = (_mul_mask),						\
> +	.rate_reg_off_c = (_reg),						\
> +	.rate_write_enable_bit_c = (_bit)
> +
> +#define K230_MUX_FORMAT(_reg, _shift, _mask)					\
> +	.mux_reg_off = (_reg),							\
> +	.mux_reg_shift = (_shift),						\
> +	.mux_reg_mask = (_mask)
> +
> +struct k230_sysclk;
> +
> +/* K230 PLLs. */
Consider dropping this comment?
It's already clear enough

> +enum k230_pll_id {
> +	K230_PLL0,
> +	K230_PLL1,
> +	K230_PLL2,
> +	K230_PLL3,
> +	K230_PLL_NUM
> +};
> +
> +struct k230_pll {
> +	enum k230_pll_id id;
> +	struct k230_sysclk *ksc;
> +	void __iomem *div, *bypass, *gate, *lock;
> +	struct clk_hw hw;
> +};
> +
> +#define to_k230_pll(_hw)	container_of(_hw, struct k230_pll, hw)
> +
> +struct k230_pll_cfg {
> +	u32 reg;
> +	const char *name;
> +	struct k230_pll *pll;
> +};
> +
> +/* K230 PLL_DIVS. */
same

> +struct k230_pll_div {
> +	struct k230_sysclk *ksc;
> +	struct clk_hw *hw;
> +};
> +
> +struct k230_pll_div_cfg {
> +	const char *parent_name, *name;
> +	int div;
> +	struct k230_pll_div *pll_div;
> +};
> +
> +enum k230_pll_div_id {
> +	K230_PLL0_DIV2,
> +	K230_PLL0_DIV3,
> +	K230_PLL0_DIV4,
> +	K230_PLL0_DIV16,
> +	K230_PLL1_DIV2,
> +	K230_PLL1_DIV3,
> +	K230_PLL1_DIV4,
> +	K230_PLL2_DIV2,
> +	K230_PLL2_DIV3,
> +	K230_PLL2_DIV4,
> +	K230_PLL3_DIV2,
> +	K230_PLL3_DIV3,
> +	K230_PLL3_DIV4,
> +	K230_PLL_DIV_NUM
> +};
> +
> +enum k230_clk_div_type {
> +	K230_MUL,
> +	K230_DIV,
> +	K230_MUL_DIV,
> +};
> +
> +/* K230 CLKS. */
same

> +struct k230_clk {
> +	int id;
> +	struct k230_sysclk *ksc;
> +	struct clk_hw hw;
> +};
> +
> +#define to_k230_clk(_hw)	container_of(_hw, struct k230_clk, hw)
> +
> +/* K230 SYSCLK. */
Check other places and remove unnecessary comments.

> +struct k230_sysclk {
> +	struct platform_device *pdev;
> +	void __iomem	       *pll_regs, *regs;
> +	spinlock_t	       pll_lock, clk_lock;
> +	struct k230_pll	       *plls;
> +	struct k230_clk	       *clks;
> +	struct k230_pll_div    *dclks;
> +};
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
> +
> +struct k230_clk_rate_cfg_c {
> +	/* rate_c reg */
> +	u32 rate_reg_off_c;
> +	void __iomem *rate_reg_c;
> +	/* rate_c info */
> +	u32 rate_write_enable_bit_c;
> +	/* rate mul-changable */
> +	u32 rate_mul_min_c;
> +	u32 rate_mul_max_c;
> +	u32 rate_mul_shift_c;
> +	u32 rate_mul_mask_c;
> +};
> +
> +struct k230_clk_gate_cfg {
> +	/* gate reg */
> +	u32 gate_reg_off;
> +	void __iomem *gate_reg;
> +	/* gate info*/
> +	u32 gate_bit_enable;
> +	bool gate_bit_reverse;
> +};
> +
> +struct k230_clk_mux_cfg {
> +	/* mux reg */
> +	u32 mux_reg_off;
> +	void __iomem *mux_reg;
> +	/* mux info */
> +	u32 mux_reg_shift;
> +	u32 mux_reg_mask;
> +};
How about leaving a blank line between different categories in each structure.

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
> +	/* 0-read & write; 1-read only */
The meaning of the variable name is already clear enough.

> +	bool read_only;
> +	int num_parent;
> +	struct k230_clk_parent parent[K230_CLK_MAX_PARENT_NUM];
> +	struct k230_clk *clk;
> +	int flags;
> +
> +	/* cfgs */
unnecessary comment
> +	struct k230_clk_rate_cfg	*rate_cfg;
> +	struct k230_clk_rate_cfg_c	*rate_cfg_c;
> +	struct k230_clk_gate_cfg	*gate_cfg;
> +	struct k230_clk_mux_cfg		*mux_cfg;
> +};

...

> +
> +static void k230_init_pll(void __iomem *regs, enum k230_pll_id pll_id,
> +			  struct k230_pll *pll)
> +{
> +	void __iomem *base;
> +
> +	pll->id = pll_id;
> +	base = regs + k230_pll_cfgs[pll_id].reg;
> +	pll->div = base + K230_PLL_DIV_REG_OFFSET;
> +	pll->bypass = base + K230_PLL_BYPASS_REG_OFFSET;
> +	pll->gate = base + K230_PLL_GATE_REG_OFFSET;
> +	pll->lock = base + K230_PLL_LOCK_REG_OFFSET;
> +}
> +
> +static int k230_pll_prepare(struct clk_hw *hw)
> +{
> +	struct k230_pll *pll = to_k230_pll(hw);
> +	u32 reg;
> +
> +	/* wait for PLL lock until it reaches lock status */
> +	return readl_poll_timeout(pll->lock, reg,
> +				  (reg & K230_PLL_STATUS_MASK) == K230_PLL_STATUS_MASK,
> +				  400, 0);
> +}
> +
> +static bool k230_pll_hw_is_enabled(struct k230_pll *pll)
> +{
> +	return (readl(pll->gate) & K230_PLL_GATE_ENABLE) == K230_PLL_GATE_ENABLE;
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
> +	reg = readl(pll->gate);
> +
drop blank line
> +	reg &= ~(K230_PLL_GATE_ENABLE);
> +	reg |= (K230_PLL_GATE_WRITE_ENABLE);
> +
drop blank line
> +	writel(reg, pll->gate);
> +}
> +
> +static int k230_pll_is_enabled(struct clk_hw *hw)
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
> +static unsigned long k230_pll_get_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct k230_pll *pll = to_k230_pll(hw);
> +	struct k230_sysclk *ksc = pll->ksc;
> +	u32 reg;
> +	u32 r, f, od;
> +
> +	reg = readl(pll->bypass);
> +	if (reg & K230_PLL_BYPASS_ENABLE)
> +		return parent_rate;
> +
> +	reg = readl(pll->lock);
> +	if (!(reg & (K230_PLL_STATUS_MASK))) { /* unlocked */
unnecessary comment and wrong position.

> +		dev_err(&ksc->pdev->dev, "%s is unlock.\n", clk_hw_get_name(hw));
> +		return 0;
> +	}
> +
> +	reg = readl(pll->div);
> +	r = ((reg >> K230_PLL_R_SHIFT) & K230_PLL_R_MASK) + 1;
> +	f = ((reg >> K230_PLL_F_SHIFT) & K230_PLL_F_MASK) + 1;
> +	od = ((reg >> K230_PLL_OD_SHIFT) & K230_PLL_OD_MASK) + 1;
> +
> +	return mul_u64_u32_div(parent_rate, f, r * od);
> +}
> +

...

> +
> +static int k230_clk_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct k230_sysclk *ksc;
> +
> +	ksc = devm_kzalloc(&pdev->dev, sizeof(struct k230_sysclk), GFP_KERNEL);
you can use `sizeof(*ksc)` instead. same below.

> +	if (!ksc)
> +		return -ENOMEM;
> +
> +	ksc->plls = devm_kcalloc(&pdev->dev, K230_PLL_NUM,
> +				 sizeof(struct k230_pll), GFP_KERNEL);
> +	if (!ksc->plls)
> +		return -ENOMEM;
> +
> +	ksc->dclks = devm_kcalloc(&pdev->dev, K230_PLL_DIV_NUM,
> +				  sizeof(struct k230_pll_div), GFP_KERNEL);
> +	if (!ksc->dclks)
> +		return -ENOMEM;
> +
> +	ksc->clks = devm_kcalloc(&pdev->dev, K230_CLK_NUM,
> +				 sizeof(struct k230_clk), GFP_KERNEL);
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

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

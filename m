Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078ACC369BD
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Apr 2025 11:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDpTa9tP+BVOGKyyxrmduLj78vtNeC/nTAuFMPkXBBI=; b=oNuspH2w3IWW1i
	YYqFmD3xxt/UeacBws/Bb0vawTBqgV5M7YpV6/SN30VvIHB2nxN/GRFbIdYfqLFzmCi0MirNh2Cym
	vUSUuJJsZLBfAss2rOXNLQN9PvV9NoiAbez++O5MfWIyiwjeE7XhdzyZbPxoj9QGujuXpc1s1uffh
	0lbvKUBos+FO7quRp4fJnADbepbuBP2J4r7OZieE2BKOd658V7qM2yjnqV5YPp5p0B72j4AtxN0H7
	T3YNzW5H1WvcUQJdt3MeKdWZM7aXH7+uLQHCPOC3IEnefBPq7nt9GVJdbNnwQQWh2/DnTNnnqEabH
	qUQxOUCoBHzejd+p+3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u65wL-00000001DKq-3j14;
	Sat, 19 Apr 2025 11:00:53 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u65wJ-00000001DJu-2C49
	for linux-riscv@lists.infradead.org;
	Sat, 19 Apr 2025 11:00:52 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-22c33677183so30463215ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 19 Apr 2025 04:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745060451; x=1745665251; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YdQSjxjXCdnjS/+xdk2zGz4+ti8O68nto55Jr8miWo0=;
        b=JaLkV7gXE06dWmR43vO7RR3ZDYcimZFdy/QR69+SIa5+/PN9IQuIdyl64DW3liua4f
         f8AVM9mB9LVQnBwwphigq2v2Q0zRNt2mOZhNrAj2v6qQa2CWp6Fru/Fix/hiEHlJ/CGd
         kWFIFoxnH5j/sPJlR300pUhHKg+BEyrixUWrKPHzYqVkHbuzRVmSu7bzIPgJRn9zKuAv
         SI0OwzuQRmWKF3Nx9NHxoakI9REv7CpNMf4KUOJ+nOAmtSMah5umiA9S0wDn0OR7Z3re
         QK0wvk748R5oqQIR3VymrY4n9ovtHP2vZDCYzZdEnkAkn0X0U4XmTEgTC7+8aZ687d2H
         UCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745060451; x=1745665251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdQSjxjXCdnjS/+xdk2zGz4+ti8O68nto55Jr8miWo0=;
        b=AwoxAaTY22vNX/MaBkjRHbt7EbyRoem1tHjeXL96VEI6SpFT/b47OhFk6MkwuQw+wT
         aUkOYZu9MpVWN3ljcMjR5K2MyZ1eMN8Dma6jSKNh0H/gvWv6UeWtGeJ23eW/i775OFoA
         WSrHPX1rflC2fBUmvOhdbtxiA4NDFISzQkftEvcRI8PeysfmZm3+CYR7U0Tp1J1ICur5
         5jtWVlXC2BKsAHnAGZCvWu+5HwtxQYPP1ewWxpYx9DbaqNcZoQa2x2UAPYLn5PwIZ9eU
         jxgB+4dSEwvf2352zsSDBIqt5ppmg+6ivEdYTaPJqON2ouOHpgkqp5yttFz1cnmCAYO+
         klzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9oTJfl3d2gKMwPW/3wwCg8ERIw01AZBo8sZ9PvedUiALekZhv00zZqJvXGK1TYwkcL9KHPc7IPzIiOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI6mwYbYfMg73xQRDc3z1nyg9OoJS5BTBIs3D2AMZJZoqlbCKZ
	3oy1WfPp1yzMDgjaJZnIqsWhao6PcMjALbdoYEBDyavBJcK+Xapz
X-Gm-Gg: ASbGncusgjVRFE5IfcVeWgpqDG73lz0SLw3juPnoePeda3XAw1JQFmlfvlJwact3xxx
	UzRIASl3FJAXuVSleEzvrEoC6kzdQue5IrThcB8N97+5bwXvp82UtiviM8sVd9lFSw1z1cppfv3
	omKJyId8CBeEmqBRE630UniQIchB/90mVIQngd5CYTh9lm+kgdLZqNbGyNfv6WpOQZmzl1utV26
	/RtSZYWWv2ck7rxWbS2QtT21ot/VEpxEmG6gRP3k3ikaKJmu6fLmOt/MIE3XzCxkLZESMXHDgxy
	xNPoNZ6I4H5zlxgNaUzgvSfvxA==
X-Google-Smtp-Source: AGHT+IHhZTeD2UV5BH9yNUaC4i8d1k7YwEmhKzoZgraGVGZfYbtQ8HZIEfQDGuDux8tzyXHNB3hU8A==
X-Received: by 2002:a17:902:da91:b0:21f:85d0:828 with SMTP id d9443c01a7336-22c5360df09mr86721635ad.41.1745060450385;
        Sat, 19 Apr 2025 04:00:50 -0700 (PDT)
Received: from [172.29.0.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb687asm31288765ad.140.2025.04.19.04.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 04:00:49 -0700 (PDT)
Message-ID: <4b274abd-f8dc-4bb9-91eb-e4048f03bca5@gmail.com>
Date: Sat, 19 Apr 2025 19:00:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v6 2/3] clk: canaan: Add clock driver for Canaan K230
To: Xukai Wang <kingxukai@zohomail.com>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
 <20250415-b4-k230-clk-v6-2-7fd89f427250@zohomail.com>
 <aAJGCDmqNoSWrwXw@troy-wujie14-pro>
 <6dd81688-6f08-431a-af90-a1df2bc4d80f@zohomail.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <6dd81688-6f08-431a-af90-a1df2bc4d80f@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_040051_580673_43A7648B 
X-CRM114-Status: GOOD (  38.09  )
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

On 2025/4/19 18:42, Xukai Wang wrote:
> 
> On 2025/4/18 20:31, Troy Mitchell wrote:
>> On Tue, Apr 15, 2025 at 10:25:12PM +0800, Xukai Wang wrote:
>>> This patch provides basic support for the K230 clock, which does not
>>> cover all clocks.
>>>
>>> The clock tree of the K230 SoC consists of OSC24M, PLLs and sysclk.
>>>
>>> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>>> ---
>>>  drivers/clk/Kconfig    |    6 +
>>>  drivers/clk/Makefile   |    1 +
>>>  drivers/clk/clk-k230.c | 1710 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 1717 insertions(+)
>>>
>>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>>> index 299bc678ed1b9fcd9110bb8c5937a1bd1ea60e23..1817b8883af9a3d00ac7af2cb88496274b591001 100644
>>> --- a/drivers/clk/Kconfig
>>> +++ b/drivers/clk/Kconfig
>>> @@ -464,6 +464,12 @@ config COMMON_CLK_K210
>>>  	help
>>>  	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
>>>  
>>> +config COMMON_CLK_K230
>>> +	bool "Clock driver for the Canaan Kendryte K230 SoC"
>>> +	depends on ARCH_CANAAN || COMPILE_TEST
>>> +        help
>>> +          Support for the Canaan Kendryte K230 RISC-V SoC clocks.
>>> +
>>>  config COMMON_CLK_SP7021
>>>  	tristate "Clock driver for Sunplus SP7021 SoC"
>>>  	depends on SOC_SP7021 || COMPILE_TEST
>>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>>> index fb8878a5d7d93da6bec487460cdf63f1f764a431..5df50b1e14c701ed38397bfb257db26e8dd278b8 100644
>>> --- a/drivers/clk/Makefile
>>> +++ b/drivers/clk/Makefile
>>> @@ -51,6 +51,7 @@ obj-$(CONFIG_MACH_ASPEED_G6)		+= clk-ast2600.o
>>>  obj-$(CONFIG_ARCH_HIGHBANK)		+= clk-highbank.o
>>>  obj-$(CONFIG_CLK_HSDK)			+= clk-hsdk-pll.o
>>>  obj-$(CONFIG_COMMON_CLK_K210)		+= clk-k210.o
>>> +obj-$(CONFIG_COMMON_CLK_K230)		+= clk-k230.o
>>>  obj-$(CONFIG_LMK04832)			+= clk-lmk04832.o
>>>  obj-$(CONFIG_COMMON_CLK_LAN966X)	+= clk-lan966x.o
>>>  obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)	+= clk-lochnagar.o
>>> diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..84a4a2a293e5f278d21510d73888aee4ff9351df
>>> --- /dev/null
>>> +++ b/drivers/clk/clk-k230.c
>>> @@ -0,0 +1,1710 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Kendryte Canaan K230 Clock Drivers
>>> + *
>>> + * Author: Xukai Wang <kingxukai@zohomail.com>
>>> + * Author: Troy Mitchell <troymitchell988@gmail.com>
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/clkdev.h>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/iopoll.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/spinlock.h>
>>> +#include <dt-bindings/clock/canaan,k230-clk.h>
>>> +
>>> +/* PLL control register bits. */
>>> +#define K230_PLL_BYPASS_ENABLE				BIT(19)
>>> +#define K230_PLL_GATE_ENABLE				BIT(2)
>>> +#define K230_PLL_GATE_WRITE_ENABLE			BIT(18)
>>> +#define K230_PLL_OD_SHIFT				24
>>> +#define K230_PLL_OD_MASK				0xF
>>> +#define K230_PLL_R_SHIFT				16
>>> +#define K230_PLL_R_MASK					0x3F
>>> +#define K230_PLL_F_SHIFT				0
>>> +#define K230_PLL_F_MASK					0x1FFFF
>>> +#define K230_PLL0_OFFSET_BASE				0x00
>>> +#define K230_PLL1_OFFSET_BASE				0x10
>>> +#define K230_PLL2_OFFSET_BASE				0x20
>>> +#define K230_PLL3_OFFSET_BASE				0x30
>>> +#define K230_PLL_DIV_REG_OFFSET				0x00
>>> +#define K230_PLL_BYPASS_REG_OFFSET			0x04
>>> +#define K230_PLL_GATE_REG_OFFSET			0x08
>>> +#define K230_PLL_LOCK_REG_OFFSET			0x0C
>> why we call it `K230_PLL_LOCK_REG_OFFSET`?
>> I noticed that the datasheet refers to it as PLL0_STAT,
>> with the description PLL0 status.
>> Would it be better to keep the original name for consistency?
>>
>> Only bit 0 is the lock bit, and I'll talk more about that later.
> 
> The reason I named the macro K230_PLL_LOCK_REG_OFFSET rather than
> PLL0_STAT from the datasheet is because in this particular clock driver,
> I only need to use the lock bit (bit 0) and not the other bits of the
> register.
> 
> In Linux, there isn't a common header for K230 that defines macros for
> these specific bits yet, and since this register is only used within the
> context of this driver, I decided to name it K230_PLL0_LOCK_REG to be
> more specific to the functionality being used here.
> 
> This way, the name reflects the exact purpose in this driver, and it
> avoids confusion with the other bits that are not relevant for this
> particular case.
fine, but I still disagree..
this register is not only used "LOCK"..
this defination of bit is clear enough: K230_PLL_LOCK_STATUS_MASK
so I don't think we need to change `STATUS` to `LOCK`

I will wait and see whether there is any new voice for it.

> 
>>> +
>>> +/* PLL lock register bits.  */
>>> +#define K230_PLL_STATUS_MASK				BIT(0)
>> this bit is pll0_lock
>> ```
>> PLL 0 current lock status.
>> 0x0: PLL not in lock state;
>> 0x1: PLL in lock state.
>> ```
>> how about we call it `K230_PLL_LOCK_STATUS_MASK`
> Seems more appropriate.

...

>>> +static int k230_pll_prepare(struct clk_hw *hw)
>>> +{
>>> +	struct k230_pll *pll = to_k230_pll(hw);
>>> +	u32 reg;
>>> +
>>> +	/* wait for PLL lock until it reaches lock status */
>>> +	return readl_poll_timeout(pll->lock, reg,
>>> +				  (reg & K230_PLL_STATUS_MASK) == K230_PLL_STATUS_MASK,
>> (reg & K230_PLL_STATUS_MASK),
> OK.
reg & K230_PLL_STATUS_MAS
>>> +				  400, 0);
>>> +}
>>> +

...

>>> +static int k230_pll_is_enabled(struct clk_hw *hw)
>> inline here
> It's one of the implementation of callback function in clk_ops, which
> doesn't need the inline tag.
sry I ignore that..

			- Troy
>>> +{
>>> +	return k230_pll_hw_is_enabled(to_k230_pll(hw));
>>> +}
>>> +
>>> +static int k230_pll_init(struct clk_hw *hw)
>>> +{
>>> +	if (k230_pll_is_enabled(hw))
>>> +		return clk_prepare_enable(hw->clk);
>>> +
>>> +	return 0;
>>> +}
>>> +
>> ...
>>> +	if (gate_cfg->gate_bit_reverse)
>>> +		reg |= BIT(gate_cfg->gate_bit_enable);
>>> +	else
>>> +		reg &= ~BIT(gate_cfg->gate_bit_enable);
>>> +
>> drop blank line
> OK.
>>> +	writel(reg, gate_cfg->gate_reg);
>>> +}
>>> +
>>> +	/* Check gate bit condition based on configuration and then set ret */
>>> +	if (gate_cfg->gate_bit_reverse)
>>> +		return (BIT(gate_cfg->gate_bit_enable) & reg) ? 1 : 0;
>>> +	else
>> drop else
> OK.
>>> +	reg = (mux_cfg->mux_reg_mask & index) << mux_cfg->mux_reg_shift;
>>> +	writeb(reg, mux_cfg->mux_reg);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static u8 k230_clk_get_parent(struct clk_hw *hw)
>>> +{
>>> +	struct k230_clk *clk = to_k230_clk(hw);
>>> +	struct k230_sysclk *ksc = clk->ksc;
>>> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
>>> +	struct k230_clk_mux_cfg *mux_cfg = cfg->mux_cfg;
>>> +	u8 reg;
>>> +
>>> +	guard(spinlock)(&ksc->clk_lock);
>>> +	reg = readb(mux_cfg->mux_reg);
>>> +
>>> +	return reg;
>> return readb(mux_cfg->mux_reg);
> OK, it can be merged into one line.
>>> +}
>>> +
>>> +static unsigned long k230_clk_get_rate(struct clk_hw *hw,
>>> +				       unsigned long parent_rate)
>>> +{
>>> +	struct k230_clk *clk = to_k230_clk(hw);
>>> +	struct k230_sysclk *ksc = clk->ksc;
>>> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
>>> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
>>> +	struct k230_clk_rate_cfg_c *rate_cfg_c = cfg->rate_cfg_c;
>>> +	u32 mul, div;
>>> +
>>> +	if (!rate_cfg) /* no divider, return parents' clk */
>> wrong comment style
> Apologies for my fault to ignore this comment here.
>>> +		return parent_rate;
>>> +
>>> +	guard(spinlock)(&ksc->clk_lock);
>> blank line here
> OK.
>>> +	switch (rate_cfg->method) {
>>>
>>> +	/* mul and div can be changeable. */
>>> +	case K230_MUL_DIV:
>>> +		if (rate_cfg->rate_reg_off == K230_CLK_CODEC_ADC_MCLKDIV_OFFSET ||
>>> +		    rate_cfg->rate_reg_off == K230_CLK_CODEC_DAC_MCLKDIV_OFFSET) {
>>> +			for (u32 j = 0; j < 9; j++) {
>>> +				if (0 == (rate - codec_clk[j])) {
>> if (rate - codec_clk[j] == 0)
>>
>>> +					*div = codec_div[j][0];
>>> +					*mul = codec_div[j][1];
>>> +				}
>>> +			}
>>> +		} else if (rate_cfg->rate_reg_off == K230_CLK_AUDIO_CLKDIV_OFFSET ||
>>> +			   rate_cfg->rate_reg_off == K230_CLK_PDM_CLKDIV_OFFSET) {
>>> +			for (u32 j = 0; j < 20; j++) {
>>> +				if (0 == (rate - pdm_clk[j])) {
>> if (rate - pdm_clk[j] == 0)
> OK, I'll change the order.
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static long k230_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *parent_rate)
>>> +{
>>> +	struct k230_clk *clk = to_k230_clk(hw);
>>> +	struct k230_sysclk *ksc = clk->ksc;
>>> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
>>> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
>>> +	u32 div = 0, mul = 0;
>>> +
>>> +	if (k230_clk_find_approximate(clk,
>>> +				      rate_cfg->rate_mul_min, rate_cfg->rate_mul_max,
>>> +				      rate_cfg->rate_div_min, rate_cfg->rate_div_max,
>>> +				      rate_cfg->method, rate, *parent_rate, &div, &mul)) {
>>> +		return 0;
>>> +	}
>> removing the curly braces
> OK.
>>> +
>>> +	return mul_u64_u32_div(*parent_rate, mul, div);
>>> +}
>>> +
>>> +static int k230_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>>> +			     unsigned long parent_rate)
>>> +{
>>> +	struct k230_clk *clk = to_k230_clk(hw);
>>> +	struct k230_sysclk *ksc = clk->ksc;
>>> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[clk->id];
>>> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
>>> +	struct k230_clk_rate_cfg_c *rate_cfg_c = cfg->rate_cfg_c;
>>> +	u32 div = 0, mul = 0, reg = 0, reg_c;
>>> +
>>> +	if (rate > parent_rate || rate == 0 || parent_rate == 0) {
>>> +		dev_err(&ksc->pdev->dev, "rate or parent_rate error\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (cfg->read_only) {
>>> +		dev_err(&ksc->pdev->dev, "This clk rate is read only\n");
>>> +		return -EPERM;
>>> +	}
>>> +
>>> +	if (k230_clk_find_approximate(clk,
>>> +				      rate_cfg->rate_mul_min, rate_cfg->rate_mul_max,
>>> +				      rate_cfg->rate_div_min, rate_cfg->rate_div_max,
>>> +				      rate_cfg->method, rate, parent_rate, &div, &mul)) {
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	guard(spinlock)(&ksc->clk_lock);
>> blank line here
>>
>> put `reg = readl(rate_cfg->rate_reg);` here
> Yes, it should be merged into one line.
>>> +	if (!rate_cfg_c) {
>>> +		reg = readl(rate_cfg->rate_reg);
>>> +		reg &= ~((rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift));
>>> +
>>> +		if (rate_cfg->method == K230_DIV) {
>>> +			reg &= ~((rate_cfg->rate_mul_mask) << (rate_cfg->rate_mul_shift));
>>> +			reg |= ((div - 1) & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
>>> +		} else if (rate_cfg->method == K230_MUL) {
>>> +			reg |= ((mul - 1) & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
>>> +		} else {
>>> +			reg |= (mul & rate_cfg->rate_mul_mask) << (rate_cfg->rate_mul_shift);
>>> +			reg |= (div & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
>>> +		}
>>> +		reg |= BIT(rate_cfg->rate_write_enable_bit);
>>> +	} else {
>>> +		reg = readl(rate_cfg->rate_reg);
>>> +		reg_c = readl(rate_cfg_c->rate_reg_c);
>>> +		reg &= ~((rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift));
>>> +		reg_c &= ~((rate_cfg_c->rate_mul_mask_c) << (rate_cfg_c->rate_mul_shift_c));
>>> +		reg_c |= BIT(rate_cfg_c->rate_write_enable_bit_c);
>>> +
>>> +		reg_c |= (mul & rate_cfg_c->rate_mul_mask_c) << (rate_cfg_c->rate_mul_shift_c);
>>> +		reg |= (div & rate_cfg->rate_div_mask) << (rate_cfg->rate_div_shift);
>> This is a bit confusing. Please read and operate one at a time.
>> It's better to read reg_c as the second one,
>> so it can be merged with the write operation to maintain the R/M/W principle.
> OK, I'll modify it.
>>> +
>>> +		writel(reg_c, rate_cfg_c->rate_reg_c);
>>> +	}
>>> +	writel(reg, rate_cfg->rate_reg);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct clk_ops k230_clk_ops_arr[K230_CLK_OPS_ID_NUM] = {
>>> +	[K230_CLK_OPS_ID_NONE] = {
>>> +		/* Sentinel */
>>> +	},
>>> +	[K230_CLK_OPS_ID_GATE_ONLY] = {
>>> +		K230_CLK_OPS_GATE,
>>> +	},
>>> +	[K230_CLK_OPS_ID_RATE_ONLY] = {
>>> +		K230_CLK_OPS_RATE,
>>> +	},
>>> +	[K230_CLK_OPS_ID_RATE_GATE] = {
>>> +		K230_CLK_OPS_RATE,
>>> +		K230_CLK_OPS_GATE,
>>> +	},
>>> +	[K230_CLK_OPS_ID_MUX_ONLY] = {
>>> +		K230_CLK_OPS_MUX,
>>> +	},
>>> +	[K230_CLK_OPS_ID_MUX_GATE] = {
>>> +		K230_CLK_OPS_MUX,
>>> +		K230_CLK_OPS_GATE,
>>> +	},
>>> +	[K230_CLK_OPS_ID_MUX_RATE] = {
>>> +		K230_CLK_OPS_MUX,
>>> +		K230_CLK_OPS_RATE,
>>> +	},
>>> +	[K230_CLK_OPS_ID_ALL] = {
>>> +		K230_CLK_OPS_MUX,
>>> +		K230_CLK_OPS_RATE,
>>> +		K230_CLK_OPS_GATE,
>>> +	},
>>> +};
>>> +
>>> +static int k230_register_clk(struct platform_device *pdev,
>>> +			     struct k230_sysclk *ksc,
>>> +			     int id,
>>> +			     const struct clk_parent_data *parent_data,
>>> +			     u8 num_parents,
>>> +			     unsigned long flags)
>>> +{
>>> +	struct k230_clk *clk = &ksc->clks[id];
>>> +	struct k230_clk_cfg *cfg = k230_clk_cfgs[id];
>>> +	struct k230_clk_gate_cfg *gate_cfg = cfg->gate_cfg;
>>> +	struct k230_clk_rate_cfg *rate_cfg = cfg->rate_cfg;
>>> +	struct k230_clk_mux_cfg *mux_cfg = cfg->mux_cfg;
>>> +	struct k230_clk_rate_cfg_c *rate_cfg_c = cfg->rate_cfg_c;
>>> +	struct clk_init_data init = {};
>>> +	int clk_id = 0;
>>> +	int ret;
>>> +
>>> +	if (rate_cfg) {
>>> +		rate_cfg->rate_reg = ksc->regs + rate_cfg->rate_reg_off;
>>> +		clk_id += K230_CLK_OPS_ID_RATE_ONLY;
>>> +	}
>>> +
>>> +	if (mux_cfg) {
>>> +		mux_cfg->mux_reg = ksc->regs + mux_cfg->mux_reg_off;
>>> +		clk_id += K230_CLK_OPS_ID_MUX_ONLY;
>>> +
>>> +		/* mux clock doesn't match the case that num_parents less than 2 */
>>> +		if (num_parents < 2)
>>> +			return -EINVAL;
>>> +	}
>>> +
>>> +	if (gate_cfg) {
>>> +		gate_cfg->gate_reg = ksc->regs + gate_cfg->gate_reg_off;
>>> +		clk_id += K230_CLK_OPS_ID_GATE_ONLY;
>>> +	}
>>> +
>>> +	if (rate_cfg_c)
>>> +		rate_cfg_c->rate_reg_c = ksc->regs + rate_cfg_c->rate_reg_off_c;
>>> +
>>> +	init.name = k230_clk_cfgs[id]->name;
>>> +	init.flags = flags;
>>> +	init.parent_data = parent_data;
>>> +	init.num_parents = num_parents;
>>> +	init.ops = &k230_clk_ops_arr[clk_id];
>>> +
>>> +	clk->id = id;
>>> +	clk->ksc = ksc;
>>> +	clk->hw.init = &init;
>>> +
>>> +	ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	k230_clk_cfgs[id]->clk = clk;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int k230_register_mux_clk(struct platform_device *pdev,
>> consider adding inline here?
> Yeah, it's appropriate to add a inline here.
>>> +	return k230_register_clk(pdev, ksc, id, &parent_data, 1, flags);
>>> +}
>>> +
>>> +static int k230_register_clk_child(struct platform_device *pdev,
>>> +				   struct k230_sysclk *ksc,
>>> +				   int id,
>>> +				   struct clk_hw *parent_hw)
>>> +{
>>> +	const struct clk_parent_data parent_data = {
>>> +		.hw = parent_hw,
>>> +	};
>> blank line here
>>
>>           - Troy
>>
>>> +	return k230_register_clk(pdev, ksc, id, &parent_data, 1, 0);
>>> +}
> OK.

-- 
Troy Mitchell


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

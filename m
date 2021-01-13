Return-Path: <SRS0=HZsE=GQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9960C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 08:25:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C4AA2333F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 08:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C4AA2333F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v2+C4J6EBRx+UY8/pD2qI4SoTqF4TL31CXambppGrlY=; b=YuBxkrOPjUobmZl+q6h9QN5Hb
	K/4tU8HdpgP1+PIC9AH/ntG3Odccr+Eg2QK/OWhTY33JaI/aae1PSUrjxRmbun/OTg0HlygCn4Hfy
	4NX0xUq9QDyoI9zfwzT8M2i/aUzGtyo9XRdLoReQr02EvTswJyogu3djsgukvGkMyqRP+pyBBkPbp
	hK6vIvw4hJWoJkbp/deAZarwxkOKPOTI9+Y1nKHLBg4lKnm4F0FsvxNkVHADLymgvomNKDxoNHLNr
	3S0m8T186UAevEmQKmO7ShNkNugSzTe+FJrL4z0dUW4DSiMNBu4VEBdbAUHrhDlYqU0JJvB/6mXQJ
	ZYhDLivKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzbTB-0000wB-Vz; Wed, 13 Jan 2021 08:25:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzbT9-0000vN-IA
 for linux-riscv@lists.infradead.org; Wed, 13 Jan 2021 08:25:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B22E23333;
 Wed, 13 Jan 2021 08:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610526330;
 bh=fvWhujzZk+jY3bf+LHmdOREjJF3z0sKraBMpQ3Gwho0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=nBk8osS3JhTv9QV0Y3QH3QsGs0km3Kljp2hnTs4VJdgBOnq4HCy08g2eB4KW0y4ts
 cF01XHXRj32W60P3BVyG/0CAFtZAjBm5r/+CY2k3vYdEPZAGaCjweQ2wNT0cQb5bK4
 ItkdOQ15SQ70OIWjOOsSUnZNVptbXT868fhA1aGbyrYwLzSeD18PQh5mY4OE9uaeoL
 6jrzTDnEF9BPejphcPKy7N+toSnyqnHo2R3LPgLFS8u3GFfAdYyiAkJZCnoaL5i8Vp
 JpNCyzunRXMLDiZB1BCbPyjpXLOoPotStX0JZVYi9NRstWcEHiE50PiWEszKhbpVxS
 JMtmyFDfOkDMA==
MIME-Version: 1.0
In-Reply-To: <20210112010238.200241-1-damien.lemoal@wdc.com>
References: <20210112010238.200241-1-damien.lemoal@wdc.com>
Subject: Re: [PATCH v11 01/10] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Wed, 13 Jan 2021 00:25:28 -0800
Message-ID: <161052632885.3661239.353622418812249041@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_032531_823574_119FD1B6 
X-CRM114-Status: GOOD (  26.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Damien Le Moal (2021-01-11 17:02:38)
> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.
> This new driver with the compatible string "canaan,k210-clk" implements
> support for the full clock structure of the K210 SoC. Since it is
> required for the correct operation of the SoC, this driver is
> selected by default for compilation when the SOC_CANAAN option is
> selected.
> 
> With this change, the k210-sysctl driver is turned into a simple
> platform driver which enables its power bus clock and triggers
> populating its child nodes. This driver is also automatically selected
> for compilation with the selection of SOC_CANAAN.

That's stated twice.

> The sysctl driver
> retains the SOC early initialization code, but the implementation now
> relies on the new function k210_clk_early_init() provided by the new
> clk-k210 driver.
> 
> The clock structure implemented and many of the coding ideas for the
> driver come from the work by Sean Anderson on the K210 support for the
> U-Boot project.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  MAINTAINERS                      |    1 +
>  drivers/clk/Kconfig              |    8 +
>  drivers/clk/Makefile             |    1 +
>  drivers/clk/clk-k210.c           | 1005 ++++++++++++++++++++++++++++++
>  drivers/soc/canaan/Kconfig       |   18 +-
>  drivers/soc/canaan/Makefile      |    2 +-
>  drivers/soc/canaan/k210-sysctl.c |  205 ++----
>  include/soc/canaan/k210-sysctl.h |    2 +
>  8 files changed, 1064 insertions(+), 178 deletions(-)
>  create mode 100644 drivers/clk/clk-k210.c

I'm not sure how/if this can be merged through clk tree given that it
deletes code from drivers/soc/

What's the merge strategy?

> 
> diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
> new file mode 100644
> index 000000000000..1d528395527c
> --- /dev/null
> +++ b/drivers/clk/clk-k210.c
> @@ -0,0 +1,1005 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + */
> +#define pr_fmt(fmt)     "k210-clk: " fmt
> +
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <asm/soc.h>
> +#include <soc/canaan/k210-sysctl.h>
> +
> +#include <dt-bindings/clock/k210-clk.h>
> +
> +/*
> + * Clocks parameters.
> + */
> +struct k210_clk_cfg {
> +       const char *name;
> +       u8 gate_reg;
> +       u8 gate_bit;
> +       u8 div_reg;
> +       u8 div_shift;
> +       u8 div_width;
> +       u8 div_type;
> +       u8 mux_reg;
> +       u8 mux_bit;
> +};
> +
> +enum k210_clk_div_type {
> +       K210_DIV_NONE,
> +       K210_DIV_ONE_BASED,
> +       K210_DIV_DOUBLE_ONE_BASED,
> +       K210_DIV_POWER_OF_TWO,
> +};
> +
> +#define K210_GATE(_reg, _bit)  \
> +       .gate_reg = (_reg),     \
> +       .gate_bit = (_bit)
> +#define K210_DIV(_reg, _shift, _width, _type)  \
> +       .div_reg = (_reg),                      \
> +       .div_shift = (_shift),                  \
> +       .div_width = (_width),                  \
> +       .div_type = (_type)
> +#define K210_MUX(_reg, _bit)   \
> +       .mux_reg = (_reg),      \
> +       .mux_bit = (_bit)
> +
> +static struct k210_clk_cfg k210_clks[K210_NUM_CLKS] = {
> +
> +       /* Gated clocks, no mux, no divider */
> +       [K210_CLK_CPU] = {
> +               .name = "cpu",
> +               K210_GATE(K210_SYSCTL_EN_CENT, 0)
> +       },
> +       [K210_CLK_DMA] = {
> +               .name = "dma",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 1)
> +       },
> +       [K210_CLK_FFT] = {
> +               .name = "fft",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 4)
> +       },
> +       [K210_CLK_GPIO] = {
> +               .name = "gpio",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 5)
> +       },
> +       [K210_CLK_UART1] = {
> +               .name = "uart1",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 16)
> +       },
> +       [K210_CLK_UART2] = {
> +               .name = "uart2",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 17)
> +       },
> +       [K210_CLK_UART3] = {
> +               .name = "uart3",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 18)
> +       },
> +       [K210_CLK_FPIOA] = {
> +               .name = "fpioa",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 20)
> +       },
> +       [K210_CLK_SHA] = {
> +               .name = "sha",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 26)
> +       },
> +       [K210_CLK_AES] = {
> +               .name = "aes",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 19)
> +       },
> +       [K210_CLK_OTP] = {
> +               .name = "otp",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 27)
> +       },
> +       [K210_CLK_RTC] = {
> +               .name = "rtc",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 29)
> +       },
> +
> +       /* Gated divider clocks */
> +       [K210_CLK_SRAM0] = {
> +               .name = "sram0",
> +               K210_GATE(K210_SYSCTL_EN_CENT, 1),
> +               K210_DIV(K210_SYSCTL_THR0, 0, 4, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_SRAM1] = {
> +               .name = "sram1",
> +               K210_GATE(K210_SYSCTL_EN_CENT, 2),
> +               K210_DIV(K210_SYSCTL_THR0, 4, 4, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_ROM] = {
> +               .name = "rom",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 0),
> +               K210_DIV(K210_SYSCTL_THR0, 16, 4, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_DVP] = {
> +               .name = "dvp",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 3),
> +               K210_DIV(K210_SYSCTL_THR0, 12, 4, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_APB0] = {
> +               .name = "apb0",
> +               K210_GATE(K210_SYSCTL_EN_CENT, 3),
> +               K210_DIV(K210_SYSCTL_SEL0, 3, 3, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_APB1] = {
> +               .name = "apb1",
> +               K210_GATE(K210_SYSCTL_EN_CENT, 4),
> +               K210_DIV(K210_SYSCTL_SEL0, 6, 3, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_APB2] = {
> +               .name = "apb2",
> +               K210_GATE(K210_SYSCTL_EN_CENT, 5),
> +               K210_DIV(K210_SYSCTL_SEL0, 9, 3, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_AI] = {
> +               .name = "ai",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 2),
> +               K210_DIV(K210_SYSCTL_THR0, 8, 4, K210_DIV_ONE_BASED)
> +       },
> +       [K210_CLK_SPI0] = {
> +               .name = "spi0",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 6),
> +               K210_DIV(K210_SYSCTL_THR1, 0, 8, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_SPI1] = {
> +               .name = "spi1",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 7),
> +               K210_DIV(K210_SYSCTL_THR1, 8, 8, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_SPI2] = {
> +               .name = "spi2",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 8),
> +               K210_DIV(K210_SYSCTL_THR1, 16, 8, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2C0] = {
> +               .name = "i2c0",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 13),
> +               K210_DIV(K210_SYSCTL_THR5, 8, 8, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2C1] = {
> +               .name = "i2c1",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 14),
> +               K210_DIV(K210_SYSCTL_THR5, 16, 8, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2C2] = {
> +               .name = "i2c2",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 15),
> +               K210_DIV(K210_SYSCTL_THR5, 24, 8, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_WDT0] = {
> +               .name = "wdt0",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 24),
> +               K210_DIV(K210_SYSCTL_THR6, 0, 8, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_WDT1] = {
> +               .name = "wdt1",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 25),
> +               K210_DIV(K210_SYSCTL_THR6, 8, 8, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2S0] = {
> +               .name = "i2s0",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 10),
> +               K210_DIV(K210_SYSCTL_THR3, 0, 16, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2S1] = {
> +               .name = "i2s1",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 11),
> +               K210_DIV(K210_SYSCTL_THR3, 16, 16, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2S2] = {
> +               .name = "i2s2",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 12),
> +               K210_DIV(K210_SYSCTL_THR4, 0, 16, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +
> +       /* Divider clocks, no gate, no mux */
> +       [K210_CLK_I2S0_M] = {
> +               .name = "i2s0_m",
> +               K210_DIV(K210_SYSCTL_THR4, 16, 8, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2S1_M] = {
> +               .name = "i2s1_m",
> +               K210_DIV(K210_SYSCTL_THR4, 24, 8, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2S2_M] = {
> +               .name = "i2s2_m",
> +               K210_DIV(K210_SYSCTL_THR4, 0, 8, K210_DIV_DOUBLE_ONE_BASED)
> +       },
> +
> +       /* Muxed gated divider clocks */
> +       [K210_CLK_SPI3] = {
> +               .name = "spi3",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 9),
> +               K210_DIV(K210_SYSCTL_THR1, 24, 8, K210_DIV_DOUBLE_ONE_BASED),
> +               K210_MUX(K210_SYSCTL_SEL0, 12)
> +       },
> +       [K210_CLK_TIMER0] = {
> +               .name = "timer0",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 21),
> +               K210_DIV(K210_SYSCTL_THR2,  0, 8, K210_DIV_DOUBLE_ONE_BASED),
> +               K210_MUX(K210_SYSCTL_SEL0, 13)
> +       },
> +       [K210_CLK_TIMER1] = {
> +               .name = "timer1",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 22),
> +               K210_DIV(K210_SYSCTL_THR2, 8, 8, K210_DIV_DOUBLE_ONE_BASED),
> +               K210_MUX(K210_SYSCTL_SEL0, 14)
> +       },
> +       [K210_CLK_TIMER2] = {
> +               .name = "timer2",
> +               K210_GATE(K210_SYSCTL_EN_PERI, 23),
> +               K210_DIV(K210_SYSCTL_THR2, 16, 8, K210_DIV_DOUBLE_ONE_BASED),
> +               K210_MUX(K210_SYSCTL_SEL0, 15)
> +       },
> +};
> +
> +/*
> + * PLL control register bits.
> + */
> +#define K210_PLL_CLKR          GENMASK(3, 0)
> +#define K210_PLL_CLKF          GENMASK(9, 4)
> +#define K210_PLL_CLKOD         GENMASK(13, 10)
> +#define K210_PLL_BWADJ         GENMASK(19, 14)
> +#define K210_PLL_RESET         (1 << 20)
> +#define K210_PLL_PWRD          (1 << 21)
> +#define K210_PLL_INTFB         (1 << 22)
> +#define K210_PLL_BYPASS                (1 << 23)
> +#define K210_PLL_TEST          (1 << 24)
> +#define K210_PLL_EN            (1 << 25)
> +#define K210_PLL_SEL           GENMASK(27, 26) /* PLL2 only */
> +
> +/*
> + * PLL lock register bits.
> + */
> +#define K210_PLL_LOCK          0
> +#define K210_PLL_CLEAR_SLIP    2
> +#define K210_PLL_TEST_OUT      3
> +
> +/*
> + * Clock selector register bits.
> + */
> +#define K210_ACLK_SEL          BIT(0)
> +#define K210_ACLK_DIV          GENMASK(2, 1)
> +
> +/*
> + * PLLs.
> + */
> +enum k210_pll_id {
> +       K210_PLL0, K210_PLL1, K210_PLL2, K210_PLL_NUM
> +};
> +
> +struct k210_pll {
> +       enum k210_pll_id id;
> +       void __iomem *reg;
> +       void __iomem *lock;
> +       u8 lock_shift;
> +       u8 lock_width;
> +       struct clk_hw hw;
> +};
> +#define to_k210_pll(hw)        container_of(hw, struct k210_pll, hw)
> +
> +/*
> + * PLLs configuration: by default PLL0 runs at 780 MHz and PLL1 at 299 MHz.
> + * The first 2 SRAM banks depend on ACLK/CPU clock which is by default PLL0
> + * rate divided by 2. Set PLL1 to 390 MHz so that the third SRAM bank has the
> + * same clock as the first 2.
> + */
> +struct k210_pll_cfg {
> +       u32 reg;
> +       u8 lock_shift;
> +       u8 lock_width;
> +       u32 r;
> +       u32 f;
> +       u32 od;
> +       u32 bwadj;
> +};
> +
> +static struct k210_pll_cfg k210_plls_cfg[] = {
> +       { K210_SYSCTL_PLL0,  0, 2, 0, 59, 1, 59 }, /* 780 MHz */
> +       { K210_SYSCTL_PLL1,  8, 1, 0, 59, 3, 59 }, /* 390 MHz */
> +       { K210_SYSCTL_PLL2, 16, 1, 0, 22, 1, 22 }, /* 299 MHz */
> +};
> +
> +/*
> + * Indexes in the parents array of clocks used as parents to other clocks.
> + */
> +enum k210_parent_idx {
> +       K210_PARENT_IN0 = 0,
> +       K210_PARENT_PLL0,
> +       K210_PARENT_PLL1,
> +       K210_PARENT_PLL2,
> +       K210_PARENT_ACLK,
> +       K210_PARENT_APB0,
> +       K210_PARENT_APB1,
> +       K210_PARENT_NUM_CLKS,
> +};
> +
> +/**
> + * struct k210_clk - Driver data
> + * @regs: system controller registers start address
> + * @clk_lock: clock setting spinlock
> + * @plls: SoC PLLs descriptors
> + * @aclk: ACLK clock
> + * @clks: All other clocks
> + * @parents: array of pointers to clocks used as parents for muxed clocks.
> + * @clk_data: clock specifier translation for all clocks
> + */
> +struct k210_clk {
> +       void __iomem                    *regs;
> +       spinlock_t                      clk_lock;
> +       struct k210_pll                 plls[K210_PLL_NUM];
> +       struct clk_hw                   aclk;
> +       struct clk_hw                   clks[K210_NUM_CLKS];
> +       const struct clk_hw             *parents[K210_PARENT_NUM_CLKS];
> +       struct clk_hw_onecell_data      *clk_data;
> +};
> +
> +static struct k210_clk *kcl;

Please remove this and get to it from the clk hw structure.

> +
> +/*
> + * Set ACLK parent selector: 0 for IN0, 1 for PLL0.
> + */
> +static void k210_aclk_set_selector(u8 sel)
> +{
> +       u32 reg = readl(kcl->regs + K210_SYSCTL_SEL0);
> +
> +       if (sel)
> +               reg |= K210_ACLK_SEL;
> +       else
> +               reg &= K210_ACLK_SEL;
> +       writel(reg, kcl->regs + K210_SYSCTL_SEL0);
> +}
> +
> +static void k210_init_pll(struct k210_pll *pll, enum k210_pll_id id,
> +                         void __iomem *base)
> +{
> +       pll->id = id;
> +       pll->lock = base + K210_SYSCTL_PLL_LOCK;
> +       pll->reg = base + k210_plls_cfg[id].reg;
> +       pll->lock_shift = k210_plls_cfg[id].lock_shift;
> +       pll->lock_width = k210_plls_cfg[id].lock_width;
> +}
> +
> +static void k210_pll_wait_for_lock(struct k210_pll *pll)
> +{
> +       u32 reg, mask = GENMASK(pll->lock_shift + pll->lock_width - 1,
> +                               pll->lock_shift);
> +
> +       while (true) {

Any timeout here? Otherwise this is an infinite loop if the hardware
misbehaves.

> +               reg = readl(pll->lock);
> +               if ((reg & mask) == mask)
> +                       break;
> +
> +               reg |= BIT(pll->lock_shift + K210_PLL_CLEAR_SLIP);
> +               writel(reg, pll->lock);
> +       }
> +}
> +
> +static bool k210_pll_hw_is_enabled(struct k210_pll *pll)
> +{
> +       u32 reg = readl(pll->reg);
> +       u32 mask = K210_PLL_PWRD | K210_PLL_EN;
> +
> +       if (reg & K210_PLL_RESET)
> +               return false;
> +
> +       return (reg & mask) == mask;
> +}
> +
> +static void k210_pll_enable_hw(struct k210_pll *pll)
> +{
> +       struct k210_pll_cfg *pll_cfg = &k210_plls_cfg[pll->id];
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +
> +       if (k210_pll_hw_is_enabled(pll))
> +               goto unlock;
> +
> +       /*
> +        * For PLL0, we need to re-parent ACLK to IN0 to keep the CPU cores and
> +        * SRAM running.
> +        */
> +       if (pll->id == K210_PLL0)
> +               k210_aclk_set_selector(0);
> +
> +       /* Set PLL factors */
> +       reg = readl(pll->reg);
> +       reg &= ~GENMASK(19, 0);
> +       reg |= FIELD_PREP(K210_PLL_CLKR, pll_cfg->r);
> +       reg |= FIELD_PREP(K210_PLL_CLKF, pll_cfg->f);
> +       reg |= FIELD_PREP(K210_PLL_CLKOD, pll_cfg->od);
> +       reg |= FIELD_PREP(K210_PLL_BWADJ, pll_cfg->bwadj);
> +       reg |= K210_PLL_PWRD;
> +       writel(reg, pll->reg);
> +
> +       /*
> +        * Reset the PLL: ensure reset is low before asserting it.
> +        * The magic NOPs come from the Kendryte reference SDK.
> +        */
> +       reg &= ~K210_PLL_RESET;
> +       writel(reg, pll->reg);
> +       reg |= K210_PLL_RESET;
> +       writel(reg, pll->reg);
> +       nop();
> +       nop();
> +       reg &= ~K210_PLL_RESET;
> +       writel(reg, pll->reg);
> +
> +       k210_pll_wait_for_lock(pll);
> +
> +       reg &= ~K210_PLL_BYPASS;
> +       reg |= K210_PLL_EN;
> +       writel(reg, pll->reg);
> +
> +       if (pll->id == K210_PLL0)
> +               k210_aclk_set_selector(1);
> +
> +unlock:
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +}
> +
> +static void k210_pll_disable_hw(struct k210_pll *pll)
> +{
> +       unsigned long flags;
> +       u32 reg;
> +
> +       /*
> +        * Bypassing before powering off is important so child clocks do not
> +        * stop working. This is especially important for pll0, the indirect
> +        * parent of the cpu clock.
> +        */
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg = readl(pll->reg);
> +       reg |= K210_PLL_BYPASS;
> +       writel(reg, pll->reg);
> +
> +       reg &= ~K210_PLL_PWRD;
> +       reg &= ~K210_PLL_EN;
> +       writel(reg, pll->reg);
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +}
> +
> +static int k210_pll_enable(struct clk_hw *hw)
> +{
> +       k210_pll_enable_hw(to_k210_pll(hw));
> +
> +       return 0;
> +}
> +
> +static void k210_pll_disable(struct clk_hw *hw)
> +{
> +       k210_pll_disable_hw(to_k210_pll(hw));

Why the extra wrapper? Inline k210_pll_disable_hw() here? Same for
enable.

> +}
> +
> +static int k210_pll_is_enabled(struct clk_hw *hw)
> +{
> +       return k210_pll_hw_is_enabled(to_k210_pll(hw));

Same comment.

> +}
> +
> +static unsigned long k210_pll_get_rate(struct clk_hw *hw,
> +                                      unsigned long parent_rate)
> +{
> +       struct k210_pll *pll = to_k210_pll(hw);
> +       u32 reg = readl(pll->reg);
> +       u32 r, f, od;
> +
> +       if (reg & K210_PLL_BYPASS)
> +               return parent_rate;
> +
> +       if (!(reg & K210_PLL_PWRD))
> +               return 0;
> +
> +       r = FIELD_GET(K210_PLL_CLKR, reg) + 1;
> +       f = FIELD_GET(K210_PLL_CLKF, reg) + 1;
> +       od = FIELD_GET(K210_PLL_CLKOD, reg) + 1;
> +
> +       return (u64)parent_rate * f / (r * od);
> +}
> +
> +static const struct clk_ops k210_pll_ops = {
> +       .enable         = k210_pll_enable,
> +       .disable        = k210_pll_disable,
> +       .is_enabled     = k210_pll_is_enabled,
> +       .recalc_rate    = k210_pll_get_rate,
> +};
> +
> +static int k210_pll2_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct k210_pll *pll = to_k210_pll(hw);
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +
> +       reg = readl(pll->reg);
> +       reg &= ~K210_PLL_SEL;
> +       reg |= FIELD_PREP(K210_PLL_SEL, index);
> +       writel(reg, pll->reg);
> +
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static u8 k210_pll2_get_parent(struct clk_hw *hw)
> +{
> +       struct k210_pll *pll = to_k210_pll(hw);
> +       u32 reg = readl(pll->reg);
> +
> +       return FIELD_GET(K210_PLL_SEL, reg);
> +}
> +
> +static const struct clk_ops k210_pll2_ops = {
> +       .enable         = k210_pll_enable,
> +       .disable        = k210_pll_disable,
> +       .is_enabled     = k210_pll_is_enabled,
> +       .recalc_rate    = k210_pll_get_rate,
> +       .set_parent     = k210_pll2_set_parent,
> +       .get_parent     = k210_pll2_get_parent,
> +};
> +
> +static int k210_register_pll(struct k210_pll *pll, const char *name,
> +                            int num_parents, const struct clk_ops *ops)
> +{
> +       struct clk_init_data init = {};
> +
> +       init.name = name;
> +       init.parent_hws = kcl->parents;
> +       init.num_parents = num_parents;
> +       init.ops = ops;
> +       pll->hw.init = &init;
> +
> +       return clk_hw_register(NULL, &pll->hw);
> +}
> +
> +static int k210_register_plls(struct device_node *np)
> +{
> +       int i, ret;
> +
> +       for (i = 0; i < K210_PLL_NUM; i++)
> +               k210_init_pll(&kcl->plls[i], i, kcl->regs);
> +
> +       /* PLL0 and PLL1 only have IN0 as parent */
> +       ret = k210_register_pll(&kcl->plls[K210_PLL0], "pll0", 1,
> +                               &k210_pll_ops);
> +       if (ret) {
> +               pr_err("%pOFP: register PLL0 failed\n", np);
> +               return ret;
> +       }
> +       kcl->parents[K210_PARENT_PLL0] = &kcl->plls[K210_PLL0].hw;
> +
> +       ret = k210_register_pll(&kcl->plls[K210_PLL1], "pll1", 1,
> +                               &k210_pll_ops);
> +       if (ret) {
> +               pr_err("%pOFP: register PLL1 failed\n", np);
> +               return ret;
> +       }
> +       kcl->parents[K210_PARENT_PLL1] = &kcl->plls[K210_PLL1].hw;
> +
> +       /* PLL2 has IN0, PLL0 and PLL1 as parents */
> +       ret = k210_register_pll(&kcl->plls[K210_PLL2], "pll2", 3,
> +                               &k210_pll2_ops);
> +       if (ret) {
> +               pr_err("%pOFP: register PLL2 failed\n", np);
> +               return ret;
> +       }
> +       kcl->parents[K210_PARENT_PLL2] = &kcl->plls[K210_PLL2].hw;
> +
> +       return 0;
> +}
> +
> +static int k210_aclk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       k210_aclk_set_selector(index);
> +
> +       return 0;
> +}
> +
> +static u8 k210_aclk_get_parent(struct clk_hw *hw)
> +{
> +       u32 sel;
> +
> +       sel = readl(kcl->regs + K210_SYSCTL_SEL0) & K210_ACLK_SEL;
> +
> +       return sel ? 1 : 0;
> +}
> +
> +static unsigned long k210_aclk_get_rate(struct clk_hw *hw,
> +                                       unsigned long parent_rate)
> +{
> +       u32 reg = readl(kcl->regs + K210_SYSCTL_SEL0);
> +       unsigned int shift;
> +
> +       if (!(reg & 0x1))
> +               return parent_rate;
> +
> +       shift = FIELD_GET(K210_ACLK_DIV, reg);
> +
> +       return parent_rate / (2UL << shift);
> +}
> +
> +static const struct clk_ops k210_aclk_ops = {
> +       .set_parent     = k210_aclk_set_parent,
> +       .get_parent     = k210_aclk_get_parent,
> +       .recalc_rate    = k210_aclk_get_rate,
> +};
> +
> +static int k210_register_aclk(struct device_node *np)
> +{
> +       struct clk_init_data init = {};
> +       int ret;
> +
> +       /* ACLK has IN0 and PLL0 as parents */
> +       init.name = "aclk";
> +       init.parent_hws = kcl->parents;
> +       init.num_parents = 2;
> +       init.ops = &k210_aclk_ops;
> +       kcl->aclk.init = &init;
> +
> +       ret = clk_hw_register(NULL, &kcl->aclk);
> +       if (ret) {
> +               pr_err("%pOFP: register aclk failed\n", np);
> +               return ret;
> +       }
> +
> +       kcl->parents[K210_PARENT_ACLK] = &kcl->aclk;
> +
> +       return 0;
> +}
> +
> +#define to_k210_clk_id(hw)     ((unsigned int)((hw) - &kcl->clks[0]))
> +#define to_k210_clk_cfg(hw)    (&k210_clks[to_k210_clk_id(hw)])
> +
> +static u32 k210_clk_get_div_val(struct k210_clk_cfg *kclk)
> +{
> +       u32 reg = readl(kcl->regs + kclk->div_reg);
> +
> +       return (reg >> kclk->div_shift) & GENMASK(kclk->div_width - 1, 0);
> +}
> +
> +static unsigned long k210_clk_divider(struct k210_clk_cfg *kclk,
> +                                     u32 div_val)
> +{
> +       switch (kclk->div_type) {
> +       case K210_DIV_ONE_BASED:
> +               return div_val + 1;
> +       case K210_DIV_DOUBLE_ONE_BASED:
> +               return (div_val + 1) * 2;
> +       case K210_DIV_POWER_OF_TWO:
> +               return 2UL << div_val;
> +       case K210_DIV_NONE:
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static int k210_clk_enable(struct clk_hw *hw)
> +{
> +       struct k210_clk_cfg *kclk = to_k210_clk_cfg(hw);
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (!kclk->gate_reg)
> +               return 0;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg = readl(kcl->regs + kclk->gate_reg);
> +       reg |= BIT(kclk->gate_bit);
> +       writel(reg, kcl->regs + kclk->gate_reg);
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static void k210_clk_disable(struct clk_hw *hw)
> +{
> +       struct k210_clk_cfg *kclk = to_k210_clk_cfg(hw);
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (!kclk->gate_reg)
> +               return;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg = readl(kcl->regs + kclk->gate_reg);
> +       reg &= ~BIT(kclk->gate_bit);
> +       writel(reg, kcl->regs + kclk->gate_reg);
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +}
> +
> +static int k210_clk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct k210_clk_cfg *kclk = to_k210_clk_cfg(hw);
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (!kclk->mux_reg) {
> +               if (WARN_ON(index != 0))

Why would this ever happen? Seems like we don't want to allow different
parents? But then why allow set_parent to be called?

> +                       return -EINVAL;
> +               return 0;
> +       }
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg = readl(kcl->regs + kclk->mux_reg);
> +       if (index)
> +               reg |= BIT(kclk->mux_bit);
> +       else
> +               reg &= ~BIT(kclk->mux_bit);
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static u8 k210_clk_get_parent(struct clk_hw *hw)
> +{
> +       struct k210_clk_cfg *kclk = to_k210_clk_cfg(hw);
> +       unsigned long flags;
> +       u32 reg, idx;
> +
> +       if (!kclk->mux_reg)
> +               return 0;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg = readl(kcl->regs + kclk->mux_reg);
> +       idx = (reg & BIT(kclk->mux_bit)) ? 1 : 0;
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +
> +       return idx;
> +}
> +
> +static unsigned long k210_clk_get_rate(struct clk_hw *hw,
> +                                      unsigned long parent_rate)
> +{
> +       struct k210_clk_cfg *kclk = to_k210_clk_cfg(hw);
> +       unsigned long divider;
> +
> +       if (!kclk->div_reg)
> +               return parent_rate;
> +
> +       divider = k210_clk_divider(kclk, k210_clk_get_div_val(kclk));
> +       if (WARN_ON(!divider))
> +               return 0;
> +
> +       return parent_rate / divider;
> +}
> +
> +static const struct clk_ops k210_clk_ops = {
> +       .enable         = k210_clk_enable,
> +       .disable        = k210_clk_disable,
> +       .set_parent     = k210_clk_set_parent,
> +       .get_parent     = k210_clk_get_parent,
> +       .recalc_rate    = k210_clk_get_rate,
> +};
> +
> +static struct clk_hw *k210_register_clk(int id, enum k210_parent_idx parent_idx,
> +                                       int num_parents, unsigned long flags)
> +{
> +       struct clk_init_data init = {};
> +       int ret;
> +
> +       init.name = k210_clks[id].name;
> +       init.parent_hws = &kcl->parents[parent_idx];
> +       init.num_parents = num_parents;
> +       init.flags = flags;
> +       init.ops = &k210_clk_ops;
> +       kcl->clks[id].init = &init;
> +
> +       ret = clk_hw_register(NULL, &kcl->clks[id]);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return &kcl->clks[id];
> +}
> +
> +static inline struct clk_hw *k210_register_mux_clk(int id)
> +{
> +       /*
> +        * All muxed clocks have IN0 and PLL0 as parents: these are the
> +        * first two entries of the parents array.
> +        */
> +       return k210_register_clk(id, K210_PARENT_IN0, 2, 0);
> +}
> +
> +static inline struct clk_hw *k210_register_critical_clk(int id,
> +                                       enum k210_parent_idx parent_idx)
> +{
> +       return k210_register_clk(id, parent_idx, 1, CLK_IS_CRITICAL);

Why critical? Please add a comment. Or that is lower down? Maybe move
that comment up to this inline function instead.

> +}
> +
> +static inline struct clk_hw *k210_register_child(int id,
> +                                       enum k210_parent_idx parent_idx)
> +{
> +       return k210_register_clk(id, parent_idx, 1, 0);
> +}
> +
> +static inline struct clk_hw *k210_register_in0_child(int id)
> +{
> +       return k210_register_child(id, K210_PARENT_IN0);
> +}
> +
> +static inline struct clk_hw *k210_register_pll0_child(int id)
> +{
> +       return k210_register_child(id, K210_PARENT_PLL0);
> +}
> +
> +static inline struct clk_hw *k210_register_pll2_child(int id)
> +{
> +       return k210_register_child(id, K210_PARENT_PLL2);
> +}
> +
> +static inline struct clk_hw *k210_register_aclk_child(int id)
> +{
> +       return k210_register_child(id, K210_PARENT_ACLK);
> +}
> +
> +static inline struct clk_hw *k210_register_apb0_child(int id)
> +{
> +       return k210_register_child(id, K210_PARENT_APB0);
> +}
> +
> +static inline struct clk_hw *k210_register_apb1_child(int id)
> +{
> +       return k210_register_child(id, K210_PARENT_APB1);
> +}
> +
> +static void __init k210_clk_init(struct device_node *np)
> +{
> +       struct device_node *sysctl_np;
> +       struct clk_hw **hws;
> +       struct clk *in0;
> +       int i, ret;
> +
> +       kcl = kzalloc(sizeof(*kcl), GFP_KERNEL);
> +       if (!kcl)
> +               return;
> +
> +       kcl->clk_data = kzalloc(struct_size(kcl->clk_data, hws, K210_NUM_CLKS),
> +                               GFP_KERNEL);
> +       if (!kcl->clk_data)
> +               return;
> +
> +       sysctl_np = of_get_parent(np);
> +       kcl->regs = of_iomap(sysctl_np, 0);
> +       of_node_put(sysctl_np);
> +       if (!kcl->regs) {
> +               pr_err("%pOFP: failed to map registers\n", np);
> +               return;
> +       }
> +
> +       spin_lock_init(&kcl->clk_lock);
> +       kcl->clk_data->num = K210_NUM_CLKS;
> +       hws = kcl->clk_data->hws;
> +       for (i = 0; i < K210_NUM_CLKS; i++)
> +               hws[i] = ERR_PTR(-EPROBE_DEFER);
> +
> +       /* Get the system base fixed-rate 26MHz oscillator clock */
> +       in0 = of_clk_get(np, 0);
> +       if (IS_ERR(in0)) {
> +               pr_err("%pOFP: failed to get base fixed-rate oscillator\n", np);
> +               return;
> +       }
> +       kcl->parents[K210_PARENT_IN0] = __clk_get_hw(in0);

This shouldn't be necessary. Specify the DT node index in the
parent_data structure instead.

> +
> +       ret = k210_register_plls(np);
> +       if (ret)
> +               return;
> +
> +       ret = k210_register_aclk(np);
> +       if (ret)
> +               return;
> +
> +       /*
> +        * Critical clocks: there are no consumers of the SRAM clocks,
> +        * including the AI clock for the third SRAM bank. The CPU clock
> +        * is only referenced by the uarths serial device and so would be
> +        * disabled if the serial console is disabled. Mark all these clocks
> +        * as critical so that they are never disabled by the core clock
> +        * management.
> +        */
> +       hws[K210_CLK_CPU] =
> +               k210_register_critical_clk(K210_CLK_CPU, K210_PARENT_ACLK);
> +       hws[K210_CLK_SRAM0] =
> +               k210_register_critical_clk(K210_CLK_SRAM0, K210_PARENT_ACLK);
> +       hws[K210_CLK_SRAM1] =
> +               k210_register_critical_clk(K210_CLK_SRAM1, K210_PARENT_ACLK);
> +       hws[K210_CLK_AI] =
> +                k210_register_critical_clk(K210_CLK_AI, K210_PARENT_PLL1);
> +
> +       /* Clocks with aclk as source */
> +       hws[K210_CLK_DMA] = k210_register_aclk_child(K210_CLK_DMA);
> +       hws[K210_CLK_FFT] = k210_register_aclk_child(K210_CLK_FFT);
> +       hws[K210_CLK_ROM] = k210_register_aclk_child(K210_CLK_ROM);
> +       hws[K210_CLK_DVP] = k210_register_aclk_child(K210_CLK_DVP);
> +       hws[K210_CLK_APB0] = k210_register_aclk_child(K210_CLK_APB0);
> +       hws[K210_CLK_APB1] = k210_register_aclk_child(K210_CLK_APB1);
> +       hws[K210_CLK_APB2] = k210_register_aclk_child(K210_CLK_APB2);
> +
> +       /* Clocks with PLL0 as source */
> +       hws[K210_CLK_SPI0] = k210_register_pll0_child(K210_CLK_SPI0);
> +       hws[K210_CLK_SPI1] = k210_register_pll0_child(K210_CLK_SPI1);
> +       hws[K210_CLK_SPI2] = k210_register_pll0_child(K210_CLK_SPI2);
> +       hws[K210_CLK_I2C0] = k210_register_pll0_child(K210_CLK_I2C0);
> +       hws[K210_CLK_I2C1] = k210_register_pll0_child(K210_CLK_I2C1);
> +       hws[K210_CLK_I2C2] = k210_register_pll0_child(K210_CLK_I2C2);
> +
> +       /* Clocks with PLL2 as source */
> +       hws[K210_CLK_I2S0] = k210_register_pll2_child(K210_CLK_I2S0);
> +       hws[K210_CLK_I2S1] = k210_register_pll2_child(K210_CLK_I2S1);
> +       hws[K210_CLK_I2S2] = k210_register_pll2_child(K210_CLK_I2S2);
> +       hws[K210_CLK_I2S0_M] = k210_register_pll2_child(K210_CLK_I2S0_M);
> +       hws[K210_CLK_I2S1_M] = k210_register_pll2_child(K210_CLK_I2S1_M);
> +       hws[K210_CLK_I2S2_M] = k210_register_pll2_child(K210_CLK_I2S2_M);
> +
> +       /* Clocks with IN0 as source */
> +       hws[K210_CLK_WDT0] = k210_register_in0_child(K210_CLK_WDT0);
> +       hws[K210_CLK_WDT1] = k210_register_in0_child(K210_CLK_WDT1);
> +       hws[K210_CLK_RTC] = k210_register_in0_child(K210_CLK_RTC);
> +
> +       /* Clocks with APB0 as source */
> +       kcl->parents[K210_PARENT_APB0] = hws[K210_CLK_APB0];
> +       hws[K210_CLK_GPIO] = k210_register_apb0_child(K210_CLK_GPIO);
> +       hws[K210_CLK_UART1] = k210_register_apb0_child(K210_CLK_UART1);
> +       hws[K210_CLK_UART2] = k210_register_apb0_child(K210_CLK_UART2);
> +       hws[K210_CLK_UART3] = k210_register_apb0_child(K210_CLK_UART3);
> +       hws[K210_CLK_FPIOA] = k210_register_apb0_child(K210_CLK_FPIOA);
> +       hws[K210_CLK_SHA] = k210_register_apb0_child(K210_CLK_SHA);
> +
> +       /* Clocks with APB1 as source */
> +       kcl->parents[K210_PARENT_APB1] = hws[K210_CLK_APB1];
> +       hws[K210_CLK_AES] = k210_register_apb1_child(K210_CLK_AES);
> +       hws[K210_CLK_OTP] = k210_register_apb1_child(K210_CLK_OTP);
> +
> +       /* Mux clocks with in0 or pll0 as source */
> +       hws[K210_CLK_SPI3] = k210_register_mux_clk(K210_CLK_SPI3);
> +       hws[K210_CLK_TIMER0] = k210_register_mux_clk(K210_CLK_TIMER0);
> +       hws[K210_CLK_TIMER1] = k210_register_mux_clk(K210_CLK_TIMER1);
> +       hws[K210_CLK_TIMER2] = k210_register_mux_clk(K210_CLK_TIMER2);
> +
> +       for (i = 0; i < K210_NUM_CLKS; i++) {
> +               if (IS_ERR(hws[i])) {
> +                       pr_err("%pOFP: register clock %s failed %ld\n",
> +                              np, k210_clks[i].name, PTR_ERR(hws[i]));
> +                       return;
> +               }
> +       }
> +
> +       ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, kcl->clk_data);
> +       if (ret) {
> +               pr_err("%pOFP: add clock provider failed %d\n", np, ret);
> +               return;
> +       }
> +
> +       pr_info("%pOFP: CPU running at %lu MHz\n",
> +               np, clk_hw_get_rate(hws[K210_CLK_CPU]) / 1000000);
> +}
> +
> +CLK_OF_DECLARE(k210_clk, "canaan,k210-clk", k210_clk_init);
> +
> +/*
> + * Enable PLL1 to be able to use the AI SRAM.
> + */
> +void __init k210_clk_early_init(void __iomem *regs)

Is it impossible to put this into the bootloader? Does riscv have some
boot constraints or requirements that say memory should be working
before the kernel starts? Otherwise this is depressing that we have to
enable clks to get memory to work early like this.

> +{
> +       struct k210_pll pll1;
> +
> +       /* Make sure ACLK selector is set to PLL0 */
> +       k210_aclk_set_selector(1);
> +
> +       /* Startup PLL1 to enable the aisram bank for general memory use */
> +       k210_init_pll(&pll1, K210_PLL1, regs);
> +       k210_pll_enable_hw(&pll1);
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

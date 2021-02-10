Return-Path: <SRS0=bbt8=HM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5242C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 01:25:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F6F64E50
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 01:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F6F64E50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FB9OWQ4IX4kJW+0EFMk7/JUfmVCV92fP7ynb8Q+UQjw=; b=2zo8Ci3CoNo7hp+e3b2moctrY
	M3PBqd/nlVVSyIbmA8ze4oLz7IvJDIWkCOpJC6oCpbiFrgXTiVO3JQ0aiGTO9Xyv/IRIoHxelHdY7
	VHf6Xa2/9fAUdl6gahUvmyVdbQeOkVfCATheXwR2z84/+rIrV3pyv4jLs/MK3Ac67vDUtMTM0p6jz
	QouIqoFDgCjDnrrrMAMoMgJIs89lmXJD6tBrOAaP68glLBDalexrXaUBOSxLcYTFrtjmSRYDT40IH
	0QJE2HZsK4pnKBNtyhxkQCoL6ac8zCzlxDoaQx842SPOfeFowhlFLDVLot5q0SYDpdqUB/fzlpIxI
	D16bIc5tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9eFN-0005Q4-3P; Wed, 10 Feb 2021 01:24:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9eFI-0005PS-Ne
 for linux-riscv@lists.infradead.org; Wed, 10 Feb 2021 01:24:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5390F64E05;
 Wed, 10 Feb 2021 01:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612920283;
 bh=C0QX1I3tmtoctJDdYTHro0ZtGetUhL/GckLKyWWqWGg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=O1cYHKMaKl3zdk/GZRnCtKCC9lg/+PSGRPOlfsvY3WSO1uJLABeQI2Row3ZVv2Q+h
 Ymn7F0r8Bw/yf7PSJtyRuJxXqzUQJiFyO2NNT4bQqV5v9QUQWwxhbdAEjtaUMzndl0
 eAZxOrhmsBwh0D0zQdzVkkTcxx2Nx3+G63+H5RkLLJN6a0u/fbuFB3KK4gi5XSQTfP
 LobqJtXgiPjS49SwDVURoTTTB0adusVLrghmlYfr9F/mdcVa/rbjXhfnAygR+VR4FF
 CRmuz6R1uGb+n11tDwOVngfl6jwqM6HE5c2w6h5S4mJwLwkEcBzLTB2FdZY5ETR+7C
 lZXiZnL4FxzNA==
MIME-Version: 1.0
In-Reply-To: <20210209123014.165928-2-damien.lemoal@wdc.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
 <20210209123014.165928-2-damien.lemoal@wdc.com>
Subject: Re: [PATCH v18 01/16] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
From: Stephen Boyd <sboyd@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Date: Tue, 09 Feb 2021 17:24:41 -0800
Message-ID: <161292028178.418021.10953574123293354986@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_202444_926751_21CA01CE 
X-CRM114-Status: GOOD (  27.36  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 Michael Turquette <mturquette@baylibre.com>, Anup Patel <anup.patel@wdc.com>,
 linux-clk@vger.kernel.org, Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Damien Le Moal (2021-02-09 04:29:59)
> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.
> This new driver with the compatible string "canaan,k210-clk" implements
> support for the full clock structure of the K210 SoC. Since it is
> required for the correct operation of the SoC, this driver is
> selected by default for compilation when the SOC_CANAAN option is
> selected.
> 
> With this change, the k210-sysctl driver is turned into a simple
> platform driver which enables its power bus clock and triggers
> populating its child nodes. The sysctl driver retains the SOC early
> initialization code, but the implementation now relies on the new
> function k210_clk_early_init() provided by the new clk-k210 driver.
> 
> The clock structure implemented and many of the coding ideas for the
> driver come from the work by Sean Anderson on the K210 support for the
> U-Boot project.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---

My inbox has this one patch multiple times and no changelog here. I also
don't see the cover letter, so I guess I wasn't Cced? Can you please add
a changelog so I know if anything has changed?

>  MAINTAINERS                      |    1 +
>  drivers/clk/Kconfig              |    8 +
>  drivers/clk/Makefile             |    1 +
>  drivers/clk/clk-k210.c           | 1012 ++++++++++++++++++++++++++++++
>  drivers/soc/canaan/Kconfig       |   18 +-
>  drivers/soc/canaan/Makefile      |    2 +-
>  drivers/soc/canaan/k210-sysctl.c |  205 ++----
>  include/soc/canaan/k210-sysctl.h |    2 +
>  8 files changed, 1071 insertions(+), 178 deletions(-)
>  create mode 100644 drivers/clk/clk-k210.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3031c2012865..2128630a9dd2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3878,6 +3878,7 @@ CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER
>  M:     Damien Le Moal <damien.lemoal@wdc.com>
>  L:     linux-riscv@lists.infradead.org
>  S:     Maintained
> +F:     Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml

This file isn't even introduced in this patch, so please split it off to
another patch.

>  F:     drivers/soc/canaan/
>  F:     include/soc/canaan/
>  
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 85856cff506c..cb971f6632e2 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -368,6 +368,14 @@ config COMMON_CLK_FIXED_MMIO
>         help
>           Support for Memory Mapped IO Fixed clocks
>  
> +config COMMON_CLK_K210
> +       bool "Clock driver for the Canaan Kendryte K210 SoC"
> +       depends on COMMON_CLK && OF

Is it inside the if COMMON_CLK section? Having depends on COMMON_CLK
again isn't useful.

> +       depends on RISCV && SOC_CANAAN
> +       default SOC_CANAAN
> +       help
> +         Support for the Canaan Kendryte K210 RISC-V SoC clocks.
> +
>  source "drivers/clk/actions/Kconfig"
>  source "drivers/clk/analogbits/Kconfig"
>  source "drivers/clk/baikal-t1/Kconfig"
> diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
> new file mode 100644
> index 000000000000..429db4904ad6
> --- /dev/null
> +++ b/drivers/clk/clk-k210.c
> @@ -0,0 +1,1012 @@
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
> +#include <linux/of_clk.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/clk-provider.h>
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <asm/soc.h>

What is this include for? The nop?

> +#include <soc/canaan/k210-sysctl.h>
> +
> +#include <dt-bindings/clock/k210-clk.h>
> +
> +/*
> + * Clocks parameters.

Please remove this useless comment.

> + */
> +struct k210_sysclk;
> +
> +struct k210_clk {
> +       int id;
> +       struct k210_sysclk *ksc;
> +       struct clk_hw hw;
> +};
> +
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

Nitpick: Newline here.

> +#define K210_DIV(_reg, _shift, _width, _type)  \
> +       .div_reg = (_reg),                      \
> +       .div_shift = (_shift),                  \
> +       .div_width = (_width),                  \
> +       .div_type = (_type)

Nitpick: Newline here.

> +#define K210_MUX(_reg, _bit)   \
> +       .mux_reg = (_reg),      \
> +       .mux_bit = (_bit)
> +
> +static struct k210_clk_cfg k210_clk_cfgs[K210_NUM_CLKS] = {
> +

Not sure why there's a newline here.

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
> +       struct k210_sysclk *ksc;
> +       void __iomem *base;
> +       void __iomem *reg;
> +       void __iomem *lock;
> +       u8 lock_shift;
> +       u8 lock_width;
> +       struct clk_hw hw;
> +};
> +#define to_k210_pll(_hw)       container_of(_hw, struct k210_pll, hw)
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
> +/**
> + * struct k210_sysclk - sysclk driver data
> + * @node: device node
> + * @regs: system controller registers start address
> + * @clk_lock: clock setting spinlock
> + * @plls: SoC PLLs descriptors
> + * @aclk: ACLK clock
> + * @clks: All other clocks
> + */
> +struct k210_sysclk {
> +       struct device_node              *node;
> +       void __iomem                    *regs;
> +       spinlock_t                      clk_lock;
> +       struct k210_pll                 plls[K210_PLL_NUM];
> +       struct clk_hw                   aclk;
> +       struct k210_clk                 clks[K210_NUM_CLKS];
> +};
> +
> +#define to_k210_sysclk(_hw)    container_of(_hw, struct k210_sysclk, aclk)
> +
> +/*
> + * Set ACLK parent selector: 0 for IN0, 1 for PLL0.
> + */
> +static void k210_aclk_set_selector(void __iomem *regs, u8 sel)
> +{
> +       u32 reg = readl(regs + K210_SYSCTL_SEL0);
> +
> +       if (sel)
> +               reg |= K210_ACLK_SEL;
> +       else
> +               reg &= K210_ACLK_SEL;
> +       writel(reg, regs + K210_SYSCTL_SEL0);
> +}
> +
> +static void k210_init_pll(void __iomem *regs, enum k210_pll_id pllid,
> +                         struct k210_pll *pll)
> +{
> +       pll->id = pllid;
> +       pll->reg = regs + k210_plls_cfg[pllid].reg;
> +       pll->lock = regs + K210_SYSCTL_PLL_LOCK;
> +       pll->lock_shift = k210_plls_cfg[pllid].lock_shift;
> +       pll->lock_width = k210_plls_cfg[pllid].lock_width;
> +}
> +
> +static void k210_pll_wait_for_lock(struct k210_pll *pll)
> +{
> +       u32 reg, mask = GENMASK(pll->lock_shift + pll->lock_width - 1,
> +                               pll->lock_shift);
> +
> +       while (true) {
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
> +static void k210_pll_enable_hw(void __iomem *regs, struct k210_pll *pll)
> +{
> +       struct k210_pll_cfg *pll_cfg = &k210_plls_cfg[pll->id];
> +       u32 reg;
> +
> +       if (k210_pll_hw_is_enabled(pll))
> +               return;
> +
> +       /*
> +        * For PLL0, we need to re-parent ACLK to IN0 to keep the CPU cores and
> +        * SRAM running.
> +        */
> +       if (pll->id == K210_PLL0)
> +               k210_aclk_set_selector(regs, 0);
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
> +               k210_aclk_set_selector(regs, 1);
> +}
> +
> +static int k210_pll_enable(struct clk_hw *hw)
> +{
> +       struct k210_pll *pll = to_k210_pll(hw);
> +       struct k210_sysclk *ksc = pll->ksc;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +
> +       k210_pll_enable_hw(ksc->regs, pll);
> +
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static void k210_pll_disable(struct clk_hw *hw)
> +{
> +       struct k210_pll *pll = to_k210_pll(hw);
> +       struct k210_sysclk *ksc = pll->ksc;
> +       unsigned long flags;
> +       u32 reg;
> +
> +       /*
> +        * Bypassing before powering off is important so child clocks do not
> +        * stop working. This is especially important for pll0, the indirect
> +        * parent of the cpu clock.
> +        */
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +       reg = readl(pll->reg);
> +       reg |= K210_PLL_BYPASS;
> +       writel(reg, pll->reg);
> +
> +       reg &= ~K210_PLL_PWRD;
> +       reg &= ~K210_PLL_EN;
> +       writel(reg, pll->reg);
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +}
> +
> +static int k210_pll_is_enabled(struct clk_hw *hw)
> +{
> +       return k210_pll_hw_is_enabled(to_k210_pll(hw));
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
> +       struct k210_sysclk *ksc = pll->ksc;
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +
> +       reg = readl(pll->reg);
> +       reg &= ~K210_PLL_SEL;
> +       reg |= FIELD_PREP(K210_PLL_SEL, index);
> +       writel(reg, pll->reg);
> +
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
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
> +static int k210_register_pll(struct k210_sysclk *ksc, const char *in0,
> +                            enum k210_pll_id pllid, const char *name,
> +                            int num_parents, const struct clk_ops *ops)
> +{
> +       struct k210_pll *pll = &ksc->plls[pllid];
> +       struct clk_init_data init = {};
> +       const struct clk_parent_data parent_data[] = {
> +               { .name = in0 },
> +               { .hw = &ksc->plls[K210_PLL0].hw },
> +               { .hw = &ksc->plls[K210_PLL1].hw },
> +       };
> +
> +       init.name = name;
> +       init.parent_data = parent_data;
> +       init.num_parents = num_parents;
> +       init.ops = ops;
> +
> +       pll->hw.init = &init;
> +       pll->ksc = ksc;
> +
> +       return clk_hw_register(NULL, &pll->hw);
> +}
> +
> +static int k210_register_plls(struct k210_sysclk *ksc, const char *in0)
> +{
> +       int i, ret;
> +
> +       for (i = 0; i < K210_PLL_NUM; i++)
> +               k210_init_pll(ksc->regs, i, &ksc->plls[i]);
> +
> +       /* PLL0 and PLL1 only have IN0 as parent */
> +       ret = k210_register_pll(ksc, in0, K210_PLL0, "pll0", 1, &k210_pll_ops);
> +       if (ret) {
> +               pr_err("%pOFP: register PLL0 failed\n", ksc->node);
> +               return ret;
> +       }
> +       ret = k210_register_pll(ksc, in0, K210_PLL1, "pll1", 1, &k210_pll_ops);
> +       if (ret) {
> +               pr_err("%pOFP: register PLL1 failed\n", ksc->node);
> +               return ret;
> +       }
> +
> +       /* PLL2 has IN0, PLL0 and PLL1 as parents */
> +       ret = k210_register_pll(ksc, in0, K210_PLL2, "pll2", 3, &k210_pll2_ops);
> +       if (ret) {
> +               pr_err("%pOFP: register PLL2 failed\n", ksc->node);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int k210_aclk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct k210_sysclk *ksc = to_k210_sysclk(hw);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +
> +       k210_aclk_set_selector(ksc->regs, index);
> +
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static u8 k210_aclk_get_parent(struct clk_hw *hw)
> +{
> +       struct k210_sysclk *ksc = to_k210_sysclk(hw);
> +       u32 sel;
> +
> +       sel = readl(ksc->regs + K210_SYSCTL_SEL0) & K210_ACLK_SEL;
> +
> +       return sel ? 1 : 0;
> +}
> +
> +static unsigned long k210_aclk_get_rate(struct clk_hw *hw,
> +                                       unsigned long parent_rate)
> +{
> +       struct k210_sysclk *ksc = to_k210_sysclk(hw);
> +       u32 reg = readl(ksc->regs + K210_SYSCTL_SEL0);
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
> +/*
> + * ACLK has IN0 and PLL0 as parents.
> + */
> +static int k210_register_aclk(struct k210_sysclk *ksc, const char *in0)
> +{
> +       struct clk_init_data init = {};
> +       const struct clk_parent_data parent_data[] = {
> +               { .name = in0 },
> +               { .hw = &ksc->plls[K210_PLL0].hw },
> +       };
> +       int ret;
> +
> +       init.name = "aclk";
> +       init.parent_data = parent_data;
> +       init.num_parents = 2;
> +       init.ops = &k210_aclk_ops;
> +       ksc->aclk.init = &init;
> +
> +       ret = clk_hw_register(NULL, &ksc->aclk);
> +       if (ret) {
> +               pr_err("%pOFP: register aclk failed\n", ksc->node);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +#define to_k210_clk(_hw)       container_of(_hw, struct k210_clk, hw)
> +
> +static int k210_clk_enable(struct clk_hw *hw)
> +{
> +       struct k210_clk *kclk = to_k210_clk(hw);
> +       struct k210_sysclk *ksc = kclk->ksc;
> +       struct k210_clk_cfg *cfg = &k210_clk_cfgs[kclk->id];
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (!cfg->gate_reg)
> +               return 0;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +       reg = readl(ksc->regs + cfg->gate_reg);
> +       reg |= BIT(cfg->gate_bit);
> +       writel(reg, ksc->regs + cfg->gate_reg);
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static void k210_clk_disable(struct clk_hw *hw)
> +{
> +       struct k210_clk *kclk = to_k210_clk(hw);
> +       struct k210_sysclk *ksc = kclk->ksc;
> +       struct k210_clk_cfg *cfg = &k210_clk_cfgs[kclk->id];
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (!cfg->gate_reg)
> +               return;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +       reg = readl(ksc->regs + cfg->gate_reg);
> +       reg &= ~BIT(cfg->gate_bit);
> +       writel(reg, ksc->regs + cfg->gate_reg);
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +}
> +
> +static int k210_clk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct k210_clk *kclk = to_k210_clk(hw);
> +       struct k210_sysclk *ksc = kclk->ksc;
> +       struct k210_clk_cfg *cfg = &k210_clk_cfgs[kclk->id];
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +       reg = readl(ksc->regs + cfg->mux_reg);
> +       if (index)
> +               reg |= BIT(cfg->mux_bit);
> +       else
> +               reg &= ~BIT(cfg->mux_bit);
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static u8 k210_clk_get_parent(struct clk_hw *hw)
> +{
> +       struct k210_clk *kclk = to_k210_clk(hw);
> +       struct k210_sysclk *ksc = kclk->ksc;
> +       struct k210_clk_cfg *cfg = &k210_clk_cfgs[kclk->id];
> +       unsigned long flags;
> +       u32 reg, idx;
> +
> +       spin_lock_irqsave(&ksc->clk_lock, flags);
> +       reg = readl(ksc->regs + cfg->mux_reg);
> +       idx = (reg & BIT(cfg->mux_bit)) ? 1 : 0;
> +       spin_unlock_irqrestore(&ksc->clk_lock, flags);
> +
> +       return idx;
> +}
> +
> +static unsigned long k210_clk_get_rate(struct clk_hw *hw,
> +                                      unsigned long parent_rate)
> +{
> +       struct k210_clk *kclk = to_k210_clk(hw);
> +       struct k210_sysclk *ksc = kclk->ksc;
> +       struct k210_clk_cfg *cfg = &k210_clk_cfgs[kclk->id];
> +       u32 reg, div_val;
> +
> +       if (!cfg->div_reg)
> +               return parent_rate;
> +
> +       reg = readl(ksc->regs + cfg->div_reg);
> +       div_val = (reg >> cfg->div_shift) & GENMASK(cfg->div_width - 1, 0);
> +
> +       switch (cfg->div_type) {
> +       case K210_DIV_ONE_BASED:
> +               return parent_rate / (div_val + 1);
> +       case K210_DIV_DOUBLE_ONE_BASED:
> +               return parent_rate / ((div_val + 1) * 2);
> +       case K210_DIV_POWER_OF_TWO:
> +               return parent_rate / (2UL << div_val);
> +       case K210_DIV_NONE:
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static const struct clk_ops k210_clk_mux_ops = {
> +       .enable         = k210_clk_enable,
> +       .disable        = k210_clk_disable,
> +       .set_parent     = k210_clk_set_parent,
> +       .get_parent     = k210_clk_get_parent,
> +       .recalc_rate    = k210_clk_get_rate,
> +};
> +
> +static const struct clk_ops k210_clk_ops = {
> +       .enable         = k210_clk_enable,
> +       .disable        = k210_clk_disable,
> +       .recalc_rate    = k210_clk_get_rate,
> +};

From here...

> +
> +static void k210_register_clk(struct k210_sysclk *ksc, int id,
> +                             const struct clk_parent_data *parent_data,
> +                             int num_parents, unsigned long flags)
> +{
> +       struct k210_clk *kclk = &ksc->clks[id];
> +       struct clk_init_data init = {};
> +       int ret;
> +
> +       init.name = k210_clk_cfgs[id].name;
> +       init.flags = flags;
> +       init.parent_data = parent_data;
> +       init.num_parents = num_parents;
> +       if (num_parents > 1)
> +               init.ops = &k210_clk_mux_ops;
> +       else
> +               init.ops = &k210_clk_ops;
> +
> +       kclk->id = id;
> +       kclk->ksc = ksc;
> +       kclk->hw.init = &init;
> +
> +       ret = clk_hw_register(NULL, &kclk->hw);
> +       if (ret) {
> +               pr_err("%pOFP: register clock %s failed\n",
> +                      ksc->node, k210_clk_cfgs[id].name);
> +               kclk->id = -1;
> +       }
> +}
> +
> +/*
> + * All muxed clocks have IN0 and PLL0 as parents.
> + */
> +static inline void k210_register_mux_clk(struct k210_sysclk *ksc,
> +                                        const char *in0, int id)
> +{
> +       const struct clk_parent_data parent_data[2] = {
> +               { .name = in0 },
> +               { .hw = &ksc->plls[K210_PLL0].hw },
> +       };
> +
> +       k210_register_clk(ksc, id, parent_data, 2, 0);
> +}
> +
> +static inline void k210_register_in0_child(struct k210_sysclk *ksc,
> +                                          const char *in0, int id)
> +{
> +       const struct clk_parent_data parent_data = {
> +               .name = in0,
> +       };
> +
> +       k210_register_clk(ksc, id, &parent_data, 1, 0);
> +}
> +
> +static inline void k210_register_pll_child(struct k210_sysclk *ksc, int id,
> +                                          enum k210_pll_id pllid,
> +                                          unsigned long flags)
> +{
> +       const struct clk_parent_data parent_data = {
> +               .hw = &ksc->plls[pllid].hw,
> +       };
> +
> +       k210_register_clk(ksc, id, &parent_data, 1, flags);
> +}
> +
> +static inline void k210_register_aclk_child(struct k210_sysclk *ksc, int id,
> +                                           unsigned long flags)
> +{
> +       const struct clk_parent_data parent_data = {
> +               .hw = &ksc->aclk,
> +       };
> +
> +       k210_register_clk(ksc, id, &parent_data, 1, flags);
> +}
> +
> +static inline void k210_register_clk_child(struct k210_sysclk *ksc, int id,
> +                                          int parent_id)
> +{
> +       const struct clk_parent_data parent_data = {
> +               .hw = &ksc->clks[parent_id].hw,
> +       };
> +
> +       k210_register_clk(ksc, id, &parent_data, 1, 0);
> +}

.. to here, shouldn't these all gain __init?

> +
> +static struct clk_hw *k210_clk_hw_onecell_get(struct of_phandle_args *clkspec,
> +                                             void *data)
> +{
> +       struct k210_sysclk *ksc = data;
> +       unsigned int idx = clkspec->args[0];
> +
> +       if (idx >= K210_NUM_CLKS)
> +               return ERR_PTR(-EINVAL);
> +
> +       return &ksc->clks[idx].hw;
> +}
> +
> +static void __init k210_clk_init(struct device_node *np)
> +{
> +       struct device_node *sysctl_np;
> +       struct k210_sysclk *ksc;
> +       const char *in0;
> +       int i, ret;
> +
> +       ksc = kzalloc(sizeof(*ksc), GFP_KERNEL);
> +       if (!ksc)
> +               return;
> +
> +       ksc->node = np;
> +       spin_lock_init(&ksc->clk_lock);
> +       sysctl_np = of_get_parent(np);
> +       ksc->regs = of_iomap(sysctl_np, 0);
> +       of_node_put(sysctl_np);
> +       if (!ksc->regs) {
> +               pr_err("%pOFP: failed to map registers\n", np);
> +               return;
> +       }
> +
> +       in0 = of_clk_get_parent_name(np, 0);

I'm still lost why we need to get the clk parent name here vs. using the
index approach and using clk_parent_data. There were some comments about
#clock-cells which didn't make sense to me. The fixed rate clk in DT
should have #clock-cells as it is a clk.

> +       if (!in0) {
> +               pr_err("%pOFP: undefined fixed-rate oscillator clock\n", np);
> +               return;
> +       }
> +
> +       ret = k210_register_plls(ksc, in0);

I suspect the 'np' should be passed to these functions instead, and then
use of_clk_hw_register().

> +       if (ret)
> +               return;
> +
> +       ret = k210_register_aclk(ksc, in0);
> +       if (ret)
> +               return;
> +

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

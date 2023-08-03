Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C504CC04A6A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNA6CDANT5oB5de4jEAJLUSX0QR6niUc8zNiXPBaWZA=; b=EciszLvWGr/p2Q
	vhlAHvFoLHrkzGCNFX/iH20HqR2WCM4akx4GuGpaDTkiFhTVuGoeRdGpEFN+l1U/HDJTDsKC8pNCt
	lt3iTGaa3xDwquUOeeb+QYrgYyumj2O+brjDCWd0dh7iSO2km1QKsQF7eyBE2ElGDsjuEpKFQYDLB
	Ni3nCoru6z/NkHXZm/icrm0EuplOVelcHDuI2/yP4EpytnMAyDyzjdq3+hBGkVczeg5w2T1fkV6qR
	ed8WXjOqgRS8I6JQWQUv56iee0EBXPq8tzuKyNjXFtkdn7JWZlyPXob/jChpNvFSesUtfQKZ+sDS8
	J1yjrFPRjMJywhgaJjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRWYA-007rO7-0B;
	Thu, 03 Aug 2023 11:31:26 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRWY4-007rGM-2X
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 11:31:24 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 88DFE42420
	for <linux-riscv@lists.infradead.org>; Thu,  3 Aug 2023 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1691062275;
	bh=XzMkEEoq07lp7ew9w6kLZOvS3AG7yq5XH0B7lyVIxoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=GcxEzrRgN22n8p2atQGLkuJX2+vhFbjDuyHuhziHijWnVNozV1J9fxU3XX0tAhho3
	 Bw1IohDU9ShsDy0yuDXFLuHclpQ6LYoFo7njQ1bhR+UzgaSu1NolWvbku2xLQ98Pgm
	 AHkhji/GkxzRYiMIx+f2GyPx1VBAqr3btgoskxl5JDn83s9Xf8PSdS7p5VMry4v1/K
	 pV4lDeuR/47ObWMjITN/8eDhGMycEgrylfvv12xbodxEKiPuTQICghQe56nQZsB8vO
	 6NdYddzTSPwE0uZWAXRCdNgdAO7WZEhxWzcBvFK8JUpuRJn/B+CutCSXEvaUuJmxIq
	 spzY1WtTGDS3g==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-406afc93066so14573631cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 04:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691062274; x=1691667074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzMkEEoq07lp7ew9w6kLZOvS3AG7yq5XH0B7lyVIxoQ=;
        b=OVQ5nW6j1W/leT/Hl0rsvqxy8HbtNpQVUEcpaqiGDkU+z1uHFs9KZje5IHZSy0aNT7
         4KemRbZdZOx0ALxy3hP81Ij64VVEc6E7eqKet+WY8pz3TOf9TfdWjKLBKNfU6r61CJ6o
         deYgN91yf8+ZLxv7ZYN88jgpk3ZPur6+nPs9njotWx3QoP180bA51BChgmOqMhE1sUMW
         5SapQM2pHmpZNVf6yTyIn4YAXs3b7gGC6nPAr7WFOSrNzIviX1RpD5gqL7vpsMKPOg2D
         95fMVMxBmp8uPjG/yAlMQzhRG4Ge0FkpGsCc2uwyIvUltUrsVfR2P+kD8lNp8jwlDcan
         ctew==
X-Gm-Message-State: ABy/qLZQuL8z/6RAGjIoC8jz/adXiUEp9r7lcRu7Sk5/LtQ3QpUnHCRb
	enTv+9hidP+jLL4xZNI9T2jerRKpIiv0gyZX3c46MXfLLeuNz7d4CORaTo5JL8b/JD1q2QKMKGy
	4nLvWjHfpdDZegqlBZZ3Rn5v8KHePCVnJ/ETBI5vrxdqc/l+O5SltNAuKEBR7/A==
X-Received: by 2002:ac8:5f4a:0:b0:403:e745:2622 with SMTP id y10-20020ac85f4a000000b00403e7452622mr18758277qta.19.1691062273897;
        Thu, 03 Aug 2023 04:31:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHKp8ZAFNAKilX4BKHyiIkkes3W125Npp4kMvHVIomG7nKw9uraURnco6MoPU9SDTiRmL03rWWjOZza0EONfhA=
X-Received: by 2002:ac8:5f4a:0:b0:403:e745:2622 with SMTP id
 y10-20020ac85f4a000000b00403e7452622mr18758248qta.19.1691062273566; Thu, 03
 Aug 2023 04:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230627055313.252519-1-xingyu.wu@starfivetech.com> <20230627055313.252519-3-xingyu.wu@starfivetech.com>
In-Reply-To: <20230627055313.252519-3-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 3 Aug 2023 13:30:56 +0200
Message-ID: <CAJM55Z9_-wKWAby-bAH72AbY9mfSbEnNfaN6_NLvBOys3V3QMA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clocksource: Add JH7110 timer driver
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_043121_362296_40AD34FF 
X-CRM114-Status: GOOD (  37.40  )
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

On Tue, 27 Jun 2023 at 07:55, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add timer driver for the StarFive JH7110 SoC.
>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  MAINTAINERS                        |   7 +
>  drivers/clocksource/Kconfig        |  11 +
>  drivers/clocksource/Makefile       |   1 +
>  drivers/clocksource/timer-jh7110.c | 485 +++++++++++++++++++++++++++++
>  4 files changed, 504 insertions(+)
>  create mode 100644 drivers/clocksource/timer-jh7110.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6992b7cc7095..4e8e39ae685c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20125,6 +20125,13 @@ S:     Supported
>  F:     Documentation/devicetree/bindings/mmc/starfive*
>  F:     drivers/mmc/host/dw_mmc-starfive.c
>
> +STARFIVE JH7110 TIMER DRIVER
> +M:     Samin Guo <samin.guo@starfivetech.com>
> +M:     Xingyu Wu <xingyu.wu@starfivetech.com>
> +S:     Supported
> +F:     Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
> +F:     drivers/clocksource/timer-jh7110.c
> +
>  STARFIVE JH71X0 CLOCK DRIVERS
>  M:     Emil Renner Berthing <kernel@esmil.dk>
>  M:     Hal Feng <hal.feng@starfivetech.com>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 526382dc7482..a1393ec074c0 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -639,6 +639,17 @@ config RISCV_TIMER
>           is accessed via both the SBI and the rdcycle instruction.  This is
>           required for all RISC-V systems.
>
> +config STARFIVE_JH7110_TIMER
> +       bool "Timer for the STARFIVE JH7110 SoC"
> +       depends on ARCH_STARFIVE || COMPILE_TEST
> +       select TIMER_OF
> +       select CLKSRC_MMIO
> +       default ARCH_STARFIVE
> +       help
> +         This enables the timer for StarFive JH7110 SoCs. On RISC-V platform,
> +         the system has started RISCV_TIMER. But you can also use this timer
> +         which can provides four channels to do a lot more on JH7110 SoC.
> +
>  config CLINT_TIMER
>         bool "CLINT Timer for the RISC-V platform" if COMPILE_TEST
>         depends on GENERIC_SCHED_CLOCK && RISCV
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index f12d3987a960..791fb3379f50 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -81,6 +81,7 @@ obj-$(CONFIG_INGENIC_TIMER)           += ingenic-timer.o
>  obj-$(CONFIG_CLKSRC_ST_LPC)            += clksrc_st_lpc.o
>  obj-$(CONFIG_X86_NUMACHIP)             += numachip.o
>  obj-$(CONFIG_RISCV_TIMER)              += timer-riscv.o
> +obj-$(CONFIG_STARFIVE_JH7110_TIMER)    += timer-jh7110.o
>  obj-$(CONFIG_CLINT_TIMER)              += timer-clint.o
>  obj-$(CONFIG_CSKY_MP_TIMER)            += timer-mp-csky.o
>  obj-$(CONFIG_GX6605S_TIMER)            += timer-gx6605s.o
> diff --git a/drivers/clocksource/timer-jh7110.c b/drivers/clocksource/timer-jh7110.c
> new file mode 100644
> index 000000000000..b88334a916fb
> --- /dev/null
> +++ b/drivers/clocksource/timer-jh7110.c
> @@ -0,0 +1,485 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Starfive JH7110 Timer driver
> + *
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + *
> + * Author:
> + * Xingyu Wu <xingyu.wu@starfivetech.com>
> + * Samin Guo <samin.guo@starfivetech.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/clocksource.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/irq.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/sched_clock.h>
> +
> +/* Bias: Ch0-0x0, Ch1-0x40, Ch2-0x80, and so on. */
> +#define JH7110_TIMER_CH_LEN            0x40
> +#define JH7110_TIMER_CH_BASE(x)                ((x) * JH7110_TIMER_CH_LEN)
> +
> +#define JH7110_CLOCK_SOURCE_RATING     200
> +#define JH7110_VALID_BITS              32
> +#define JH7110_DELAY_US                        0
> +#define JH7110_TIMEOUT_US              10000
> +#define JH7110_CLOCKEVENT_RATING       300
> +#define JH7110_TIMER_MAX_TICKS         0xffffffff
> +#define JH7110_TIMER_MIN_TICKS         0xf
> +#define JH7110_TIMER_NAME_NUM          20
> +
> +#define JH7110_TIMER_INT_STATUS                0x00 /* RO[0:4]: Interrupt Status for channel0~4 */
> +#define JH7110_TIMER_CTL               0x04 /* RW[0]: 0-continuous run, 1-single run */
> +#define JH7110_TIMER_LOAD              0x08 /* RW: load value to counter */
> +#define JH7110_TIMER_ENABLE            0x10 /* RW[0]: timer enable register */
> +#define JH7110_TIMER_RELOAD            0x14 /* RW: write 1 or 0 both reload counter */
> +#define JH7110_TIMER_VALUE             0x18 /* RO: timer value register */
> +#define JH7110_TIMER_INT_CLR           0x20 /* RW: timer interrupt clear register */
> +#define JH7110_TIMER_INT_MASK          0x24 /* RW[0]: timer interrupt mask register */
> +#define JH7110_TIMER_INT_CLR_AVA_MASK  BIT(1)
> +
> +enum JH7110_TIMER_CH {
> +       JH7110_TIMER_CH_0 = 0,
> +       JH7110_TIMER_CH_1,
> +       JH7110_TIMER_CH_2,
> +       JH7110_TIMER_CH_3,
> +       JH7110_TIMER_CH_MAX
> +};

Usually enum names are not uppercase in kenel code. Also these names
for 0, 1, 2, 3 doesn't really add any value.

> +enum JH7110_TIMER_INTMASK {
> +       JH7110_TIMER_INTMASK_DIS = 0,
> +       JH7110_TIMER_INTMASK_ENA = 1
> +};
> +
> +enum JH7110_TIMER_MOD {
> +       JH7110_TIMER_MOD_CONTIN = 0,
> +       JH7110_TIMER_MOD_SINGLE = 1
> +};
> +
> +enum JH7110_TIMER_CTL_EN {
> +       JH7110_TIMER_DIS = 0,
> +       JH7110_TIMER_ENA = 1
> +};
> +
> +struct jh7110_timer_info {
> +       /* Resgister */
> +       unsigned int ctrl;
> +       unsigned int load;
> +       unsigned int enable;
> +       unsigned int reload;
> +       unsigned int value;
> +       unsigned int intclr;
> +       unsigned int intmask;
> +       unsigned int channel_base[JH7110_TIMER_CH_MAX];
> +};
> +
> +struct jh7110_clkevt {
> +       struct clock_event_device evt;
> +       struct clocksource cs;
> +       struct clk *clk;
> +       char name[JH7110_TIMER_NAME_NUM];
> +       int irq;
> +       u32 periodic;
> +       u32 rate;
> +       u32 reload_val;
> +       void __iomem *base;
> +       void __iomem *ctrl;
> +       void __iomem *load;
> +       void __iomem *enable;
> +       void __iomem *reload;
> +       void __iomem *value;
> +       void __iomem *intclr;
> +       void __iomem *intmask;
> +};
> +
> +struct jh7110_timer_priv {
> +       struct device *dev;
> +       void __iomem *base;
> +       struct jh7110_clkevt clkevt[JH7110_TIMER_CH_MAX];
> +};
> +
> +static const struct jh7110_timer_info jh7110_timer_data = {
> +       .ctrl           = JH7110_TIMER_CTL,
> +       .load           = JH7110_TIMER_LOAD,
> +       .enable         = JH7110_TIMER_ENABLE,
> +       .reload         = JH7110_TIMER_RELOAD,
> +       .value          = JH7110_TIMER_VALUE,
> +       .intclr         = JH7110_TIMER_INT_CLR,
> +       .intmask        = JH7110_TIMER_INT_MASK,
> +       .channel_base   = {JH7110_TIMER_CH_BASE(JH7110_TIMER_CH_0),
> +                          JH7110_TIMER_CH_BASE(JH7110_TIMER_CH_1),
> +                          JH7110_TIMER_CH_BASE(JH7110_TIMER_CH_2),
> +                          JH7110_TIMER_CH_BASE(JH7110_TIMER_CH_3)},
> +};

This driver is specific to the JH7110, so why do you need this level
of abstraction? Can't you just use the register offsets directly?

> +static inline struct jh7110_clkevt *to_jh7110_clkevt(struct clock_event_device *evt)
> +{
> +       return container_of(evt, struct jh7110_clkevt, evt);
> +}
> +
> +/* 0:continuous-run mode, 1:single-run mode */
> +static inline void jh7110_timer_set_mod(struct jh7110_clkevt *clkevt, int mod)
> +{
> +       writel(mod, clkevt->ctrl);
> +}

You have an enum these two choices. Why not use that instead of the
non-specific int type?

> +/* Interrupt Mask Register, 0:Unmask, 1:Mask */
> +static inline void jh7110_timer_int_enable(struct jh7110_clkevt *clkevt)
> +{
> +       writel(JH7110_TIMER_INTMASK_DIS, clkevt->intmask);
> +}
> +
> +static inline void jh7110_timer_int_disable(struct jh7110_clkevt *clkevt)
> +{
> +       writel(JH7110_TIMER_INTMASK_ENA, clkevt->intmask);
> +}
> +
> +/*
> + * BIT(0): Read value represent channel intr status.
> + * Write 1 to this bit to clear interrupt. Write 0 has no effects.
> + * BIT(1): "1" means that it is clearing interrupt. BIT(0) can not be written.
> + */
> +static inline int jh7110_timer_int_clear(struct jh7110_clkevt *clkevt)
> +{
> +       u32 value;
> +       int ret;
> +
> +       /* waiting interrupt can be to clearing */
> +       ret = readl_poll_timeout_atomic(clkevt->intclr, value,
> +                                       !(value & JH7110_TIMER_INT_CLR_AVA_MASK),
> +                                       JH7110_DELAY_US, JH7110_TIMEOUT_US);
> +       if (!ret)
> +               writel(0x1, clkevt->intclr);
> +
> +       return ret;
> +}
> +
> +/*
> + * The initial value to be loaded into the
> + * counter and is also used as the reload value.
> + * val = clock rate --> 1s
> + */
> +static inline void jh7110_timer_set_load(struct jh7110_clkevt *clkevt, u32 val)
> +{
> +       writel(val, clkevt->load);
> +}
> +
> +static inline u32 jh7110_timer_get_val(struct jh7110_clkevt *clkevt)
> +{
> +       return readl(clkevt->value);
> +}

Do these wrappers really add any value? To me this is just as clear:

writel(clkevt->base + JH7110_TIMER_LOAD, val);

Same goes for the wrappers below.

> +/*
> + * Write RELOAD register to reload preset value to counter.
> + * Write 0 and write 1 are both ok.
> + */
> +static inline void jh7110_timer_set_reload(struct jh7110_clkevt *clkevt)
> +{
> +       writel(0, clkevt->reload);
> +}
> +
> +static inline void jh7110_timer_enable(struct jh7110_clkevt *clkevt)
> +{
> +       writel(JH7110_TIMER_ENA, clkevt->enable);
> +}
> +
> +static inline void jh7110_timer_disable(struct jh7110_clkevt *clkevt)
> +{
> +       writel(JH7110_TIMER_DIS, clkevt->enable);
> +}
> +
> +static int jh7110_timer_int_init_enable(struct jh7110_clkevt *clkevt)
> +{
> +       int ret;
> +
> +       jh7110_timer_int_disable(clkevt);
> +       ret = jh7110_timer_int_clear(clkevt);
> +       if (ret)
> +               return ret;
> +
> +       jh7110_timer_int_enable(clkevt);
> +       jh7110_timer_enable(clkevt);
> +
> +       return 0;
> +}
> +
> +static int jh7110_timer_shutdown(struct clock_event_device *evt)
> +{
> +       struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);
> +
> +       jh7110_timer_disable(clkevt);
> +       return jh7110_timer_int_clear(clkevt);
> +}
> +
> +static void jh7110_timer_suspend(struct clock_event_device *evt)
> +{
> +       struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);
> +
> +       clkevt->reload_val = jh7110_timer_get_val(clkevt);
> +       jh7110_timer_shutdown(evt);
> +}
> +
> +static void jh7110_timer_resume(struct clock_event_device *evt)
> +{
> +       struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);
> +
> +       jh7110_timer_set_load(clkevt, clkevt->reload_val);
> +       jh7110_timer_set_reload(clkevt);
> +       jh7110_timer_int_enable(clkevt);
> +       jh7110_timer_enable(clkevt);
> +}
> +
> +static int jh7110_timer_tick_resume(struct clock_event_device *evt)
> +{
> +       jh7110_timer_resume(evt);
> +
> +       return 0;
> +}
> +
> +static u64 jh7110_timer_clocksource_read(struct clocksource *cs)
> +{
> +       struct jh7110_clkevt *clkevt = container_of(cs, struct jh7110_clkevt, cs);
> +
> +       return (u64)jh7110_timer_get_val(clkevt);
> +}
> +
> +static int jh7110_clocksource_init(struct jh7110_clkevt *clkevt)
> +{
> +       int ret;
> +
> +       jh7110_timer_set_mod(clkevt, JH7110_TIMER_MOD_CONTIN);
> +       jh7110_timer_set_load(clkevt, JH7110_TIMER_MAX_TICKS);
> +
> +       ret = jh7110_timer_int_init_enable(clkevt);
> +       if (ret)
> +               return ret;
> +
> +       clkevt->cs.name = clkevt->name;
> +       clkevt->cs.rating = JH7110_CLOCK_SOURCE_RATING;
> +       clkevt->cs.read = jh7110_timer_clocksource_read;
> +       clkevt->cs.mask = CLOCKSOURCE_MASK(JH7110_VALID_BITS);
> +       clkevt->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +
> +       return clocksource_register_hz(&clkevt->cs, clkevt->rate);
> +}
> +
> +/* IRQ handler for the timer */
> +static irqreturn_t jh7110_timer_interrupt(int irq, void *priv)
> +{
> +       struct clock_event_device *evt = (struct clock_event_device *)priv;
> +       struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);
> +
> +       if (jh7110_timer_int_clear(clkevt))
> +               return IRQ_NONE;
> +
> +       if (evt->event_handler)
> +               evt->event_handler(evt);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int jh7110_timer_set_periodic(struct clock_event_device *evt)
> +{
> +       struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);
> +
> +       clkevt->periodic = DIV_ROUND_CLOSEST(clkevt->rate, HZ);
> +       jh7110_timer_disable(clkevt);
> +       jh7110_timer_set_mod(clkevt, JH7110_TIMER_MOD_CONTIN);
> +       jh7110_timer_set_load(clkevt, clkevt->periodic);
> +
> +       return jh7110_timer_int_init_enable(clkevt);
> +}
> +
> +static int jh7110_timer_set_oneshot(struct clock_event_device *evt)
> +{
> +       struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);
> +
> +       jh7110_timer_disable(clkevt);
> +       jh7110_timer_set_mod(clkevt, JH7110_TIMER_MOD_SINGLE);
> +       jh7110_timer_set_load(clkevt, JH7110_TIMER_MAX_TICKS);
> +
> +       return jh7110_timer_int_init_enable(clkevt);
> +}
> +
> +static int jh7110_timer_set_next_event(unsigned long next,
> +                                      struct clock_event_device *evt)
> +{
> +       struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);
> +
> +       jh7110_timer_disable(clkevt);
> +       jh7110_timer_set_mod(clkevt, JH7110_TIMER_MOD_SINGLE);
> +       jh7110_timer_set_load(clkevt, next);
> +       jh7110_timer_enable(clkevt);
> +
> +       return 0;
> +}
> +
> +static void jh7110_set_clockevent(struct clock_event_device *evt)
> +{
> +       evt->features = CLOCK_EVT_FEAT_PERIODIC |
> +                       CLOCK_EVT_FEAT_ONESHOT |
> +                       CLOCK_EVT_FEAT_DYNIRQ;
> +       evt->set_state_shutdown = jh7110_timer_shutdown;
> +       evt->set_state_periodic = jh7110_timer_set_periodic;
> +       evt->set_state_oneshot = jh7110_timer_set_oneshot;
> +       evt->set_state_oneshot_stopped = jh7110_timer_shutdown;
> +       evt->tick_resume = jh7110_timer_tick_resume;
> +       evt->set_next_event = jh7110_timer_set_next_event;
> +       evt->suspend = jh7110_timer_suspend;
> +       evt->resume = jh7110_timer_resume;
> +       evt->rating = JH7110_CLOCKEVENT_RATING;
> +}
> +
> +static void jh7110_clockevents_register(struct jh7110_clkevt *clkevt)
> +{
> +       clkevt->rate = clk_get_rate(clkevt->clk);
> +
> +       jh7110_set_clockevent(&clkevt->evt);
> +       clkevt->evt.name = clkevt->name;
> +       clkevt->evt.irq = clkevt->irq;
> +       clkevt->evt.cpumask = cpu_possible_mask;
> +
> +       clockevents_config_and_register(&clkevt->evt, clkevt->rate,
> +                                       JH7110_TIMER_MIN_TICKS, JH7110_TIMER_MAX_TICKS);
> +}
> +
> +static void jh7110_clkevt_base_init(const struct jh7110_timer_info *data,
> +                                   struct jh7110_clkevt *clkevt,
> +                                   void __iomem *base, int ch)
> +{
> +       void __iomem *channel_base;
> +
> +       channel_base = base + data->channel_base[ch];
> +       clkevt->base = channel_base;
> +       clkevt->ctrl = channel_base + data->ctrl;
> +       clkevt->load = channel_base + data->load;
> +       clkevt->enable = channel_base + data->enable;
> +       clkevt->reload = channel_base + data->reload;
> +       clkevt->value = channel_base + data->value;
> +       clkevt->intclr = channel_base + data->intclr;
> +       clkevt->intmask = channel_base + data->intmask;
> +}
> +
> +static int jh7110_timer_probe(struct platform_device *pdev)
> +{
> +       const struct jh7110_timer_info *data = of_device_get_match_data(&pdev->dev);
> +       char name[JH7110_TIMER_NAME_NUM];
> +       struct jh7110_timer_priv *priv;
> +       struct jh7110_clkevt *clkevt;
> +       struct clk *pclk;
> +       struct reset_control *rst;
> +       int ch;
> +       int ret;
> +
> +       if (!data)
> +               return -ENOENT;
> +
> +       priv = devm_kzalloc(&pdev->dev, struct_size(priv, clkevt, JH7110_TIMER_CH_MAX),
> +                           GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->base))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(priv->base),
> +                                    "failed to map registers\n");
> +
> +       rst = devm_reset_control_get_exclusive(&pdev->dev, "apb");
> +       if (IS_ERR(rst))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(rst), "failed to get apb reset\n");
> +
> +       pclk = devm_clk_get_enabled(&pdev->dev, "apb");
> +       if (IS_ERR(pclk))
> +               return dev_err_probe(&pdev->dev, PTR_ERR(pclk),
> +                                    "failed to get & enable apb clock\n");
> +
> +       ret = reset_control_deassert(rst);
> +       if (ret)
> +               goto err;

You get and enable the clocks with devm_clk_get_enabled(), so they
will be automatically disabled and put when the driver is unloaded, so
why do you need the explicit call to clk_disable_unprepare() below?

> +
> +       priv->dev = &pdev->dev;
> +       platform_set_drvdata(pdev, priv);
> +
> +       for (ch = 0; ch < JH7110_TIMER_CH_MAX; ch++) {
> +               clkevt = &priv->clkevt[ch];
> +               snprintf(name, sizeof(name), "ch%d", ch);
> +
> +               jh7110_clkevt_base_init(data, clkevt, priv->base, ch);
> +               /* Ensure timers are disabled */
> +               jh7110_timer_disable(clkevt);
> +
> +               rst = devm_reset_control_get_exclusive(&pdev->dev, name);
> +               if (IS_ERR(rst)) {
> +                       ret = PTR_ERR(rst);
> +                       goto err;
> +               }
> +
> +               clkevt->clk = devm_clk_get_enabled(&pdev->dev, name);
> +               if (IS_ERR(clkevt->clk)) {
> +                       ret = PTR_ERR(clkevt->clk);
> +                       goto err;
> +               }
> +
> +               ret = reset_control_deassert(rst);
> +               if (ret)
> +                       goto ch_err;
> +
> +               clkevt->irq = platform_get_irq(pdev, ch);
> +               if (clkevt->irq < 0) {
> +                       ret = clkevt->irq;
> +                       goto ch_err;
> +               }
> +
> +               snprintf(clkevt->name, sizeof(clkevt->name), "%s.ch%d", pdev->name, ch);
> +               jh7110_clockevents_register(clkevt);
> +
> +               ret = devm_request_irq(&pdev->dev, clkevt->irq, jh7110_timer_interrupt,
> +                                      IRQF_TIMER | IRQF_IRQPOLL,
> +                                      clkevt->name, &clkevt->evt);
> +               if (ret)
> +                       goto ch_err;
> +
> +               ret = jh7110_clocksource_init(clkevt);
> +               if (ret)
> +                       goto ch_err;
> +       }
> +
> +       return 0;
> +
> +ch_err:
> +       for (; ch < 0; ch--)
> +               clk_disable_unprepare(priv->clkevt[ch].clk);
> +err:
> +       clk_disable_unprepare(pclk);
> +
> +       return ret;
> +}
> +
> +static const struct of_device_id jh7110_timer_match[] = {
> +       { .compatible = "starfive,jh7110-timer", .data = &jh7110_timer_data },

This driver only works on the JH7110, so why do you need this match data?

> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, jh7110_timer_match);
> +
> +static struct platform_driver jh7110_timer_driver = {
> +       .probe = jh7110_timer_probe,
> +       .driver = {
> +               .name = "jh7110-timer",
> +               .of_match_table = jh7110_timer_match,
> +       },
> +};
> +module_platform_driver(jh7110_timer_driver);
> +
> +MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
> +MODULE_DESCRIPTION("StarFive JH7110 timer driver");
> +MODULE_LICENSE("GPL");
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

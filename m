Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50B8C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 13:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=s+j+b0qt52TDZeUESt6cu41r09HIJ+KzJJu8/S1hvb8=; b=MAksYJPwJvBq3BI1+T4LdIVgrG
	+LlcJ/ScevoLkZNoHM41yygB4ueJi368r3A1dUY7MaZoYj4GY66eamyWzawBFuOMO2q9vtcLQ2C5x
	UrzqRvHpUEHk1XWlOMeRk0pLiL7JRbjdspHD08OOg9xgwr6lIWH6aqVYxbIdLy/AchdGHCoUQpezx
	++T4DoQLcL5fMEaVD9Is9totPNh2fEc+6vGswlHFFq251CII2m8AqFl6jhIX0oLmxxlCFVqynUDU4
	vHgxdZqPophTwG0GwEe/ioBDUVTnNdnqkdftf/uNXBrD9b38EJcOg42MQ9ac3nLIIrA+z3S74wrul
	/oj6XyYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHE7-009u9B-2C;
	Tue, 24 Oct 2023 13:13:43 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHE3-009u8U-2j
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 13:13:42 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1A90F3F698
	for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 13:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698153217;
	bh=KdOZEZ9WBHiLF9twA1i/IK2s5krTIzY3Eq2Ph2F0wzY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=E9HrqxvKn0zmqY1gKbss9BUEC+ETHWMdif7p4gAyC1IxL2WZqZ8DrsolUZzdPHAkF
	 oKrUHF/CzCwdLySCjeVGzqR/Lb5YbE6YvSWdgpu3ydGc3sd0Hf6+ZRLWY8GNEAtXB6
	 cwSS6expVggQuCbOP+90G5fu9NKpb5LW/2/qUpVTkVMMLiN6xZK3gh4QhtUhKnXt9o
	 mnfNIimE5+aNvKMgjmpxbOO6exiCB4Qyd+uWw7QiulIdaJob8ynWbjxAJkKdts1qFQ
	 fIdURGwGmQnhc2RD1oWqFl3lLnXGpd2qI9JmTgRDnViBb96PzYMEFThO6ayKRYccZ4
	 h/1Iku0tIkAbA==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41cb900adc7so83558431cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 06:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698153216; x=1698758016;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KdOZEZ9WBHiLF9twA1i/IK2s5krTIzY3Eq2Ph2F0wzY=;
        b=xLgoT65j6bpTPLuQsmRCOoiqhbr9ADUdEeY548JeCgCrtwLYKVMutI8+0kshRcyi8t
         rIkK9HA8pfI5t/w5im37QAt7rQNh+YzK9mHy565jJ1/wpp0v+ZCBPiG/1fT/eLh9kcCN
         jKK2rhuKV8DtGh6kpT21SOc8mHfR8SiUM8nGt2eNlNwoBrh6qdkWn/PC1khL0MBXst9a
         mb7uh4FHXZe7dZVT5gxMxJsDz8sYTLx4kMKDMv3YpdvwDOqFNMgNvVuvZahbelCiGzwq
         Lf6vB3IaM8BQQKAk/3GqhB2wf/H3h+9fBwWFvN+3TTaW0aGznhuPUl8b/NEgx7NDvF3d
         HVkA==
X-Gm-Message-State: AOJu0YybeZNXzuBsNC1jEHatIdp0R6NVeAw1daNJaVsKSabbbz2haZ5h
	OKymgvloeX4S/59UEo/Rxnhw7oL85kZ28PdAa6CKwxIYBDeusD+BvgT1lDPqUAXg8Y6CQprtW/z
	21vKzkHW66uCW4vqutZWQEduFFTajSrBEJX0AcFGMBV+MkJhvRIsjjN9ljCd0UQ==
X-Received: by 2002:ac8:5a54:0:b0:403:abf5:6865 with SMTP id o20-20020ac85a54000000b00403abf56865mr16510067qta.18.1698153215886;
        Tue, 24 Oct 2023 06:13:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy50UUO/FSIo1FSdhWZ4nTJxwfzmNKF26HamaGfFrQxf6k64mTB6at26hIUBgX8aHXJbF6Rlm327CAw12CFSI=
X-Received: by 2002:ac8:5a54:0:b0:403:abf5:6865 with SMTP id
 o20-20020ac85a54000000b00403abf56865mr16510039qta.18.1698153215533; Tue, 24
 Oct 2023 06:13:35 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Oct 2023 06:13:35 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231019053501.46899-3-xingyu.wu@starfivetech.com>
References: <20231019053501.46899-1-xingyu.wu@starfivetech.com> <20231019053501.46899-3-xingyu.wu@starfivetech.com>
Mime-Version: 1.0
Date: Tue, 24 Oct 2023 06:13:35 -0700
Message-ID: <CAJM55Z8SNkVSf6uY_8+3zk8QXRbaqo8Drks2Qc-UC0tuVsmQCA@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] clocksource: Add JH7110 timer driver
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Walker Chen <walker.chen@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_061340_265213_9233FF73 
X-CRM114-Status: GOOD (  34.19  )
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

Xingyu Wu wrote:
> Add timer driver for the StarFive JH7110 SoC.
>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  MAINTAINERS                        |   7 +
>  drivers/clocksource/Kconfig        |  11 +
>  drivers/clocksource/Makefile       |   1 +
>  drivers/clocksource/timer-jh7110.c | 380 +++++++++++++++++++++++++++++
>  4 files changed, 399 insertions(+)
>  create mode 100644 drivers/clocksource/timer-jh7110.c
>
 diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a7bd8bd80e9..91c09b399131 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20473,6 +20473,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
>  F:	sound/soc/starfive/jh7110_tdm.c
>
> +STARFIVE JH7110 TIMER DRIVER
> +M:	Samin Guo <samin.guo@starfivetech.com>
> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>
> +S:	Supported
> +F:	Documentation/devicetree/bindings/timer/starfive,jh7110-timer.yaml
> +F:	drivers/clocksource/timer-jh7110.c
> +
>  STARFIVE JH71X0 CLOCK DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
>  M:	Hal Feng <hal.feng@starfivetech.com>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 0ba0dc4ecf06..821abcc1e517 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -641,6 +641,17 @@ config RISCV_TIMER
>  	  is accessed via both the SBI and the rdcycle instruction.  This is
>  	  required for all RISC-V systems.
>
> +config STARFIVE_JH7110_TIMER
> +	bool "Timer for the STARFIVE JH7110 SoC"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select TIMER_OF
> +	select CLKSRC_MMIO
> +	default ARCH_STARFIVE
> +	help
> +	  This enables the timer for StarFive JH7110 SoC. On RISC-V platform,
> +	  the system has started RISCV_TIMER, but you can also use this timer
> +	  which can provide four channels to do a lot more things on JH7110 SoC.
> +
>  config CLINT_TIMER
>  	bool "CLINT Timer for the RISC-V platform" if COMPILE_TEST
>  	depends on GENERIC_SCHED_CLOCK && RISCV
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index 368c3461dab8..b66ac05ec086 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -80,6 +80,7 @@ obj-$(CONFIG_INGENIC_TIMER)		+= ingenic-timer.o
>  obj-$(CONFIG_CLKSRC_ST_LPC)		+= clksrc_st_lpc.o
>  obj-$(CONFIG_X86_NUMACHIP)		+= numachip.o
>  obj-$(CONFIG_RISCV_TIMER)		+= timer-riscv.o
> +obj-$(CONFIG_STARFIVE_JH7110_TIMER)	+= timer-jh7110.o
>  obj-$(CONFIG_CLINT_TIMER)		+= timer-clint.o
>  obj-$(CONFIG_CSKY_MP_TIMER)		+= timer-mp-csky.o
>  obj-$(CONFIG_GX6605S_TIMER)		+= timer-gx6605s.o
> diff --git a/drivers/clocksource/timer-jh7110.c b/drivers/clocksource/timer-jh7110.c
> new file mode 100644
> index 000000000000..71de29a3ec91
> --- /dev/null
> +++ b/drivers/clocksource/timer-jh7110.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Starfive JH7110 Timer driver
> + *
> + * Copyright (C) 2022-2023 StarFive Technology Co., Ltd.
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
> +#define JH7110_TIMER_CH_LEN		0x40
> +#define JH7110_TIMER_CH_BASE(x)		((x) * JH7110_TIMER_CH_LEN)
> +#define JH7110_TIMER_CH_MAX		4
> +
> +#define JH7110_CLOCK_SOURCE_RATING	200
> +#define JH7110_VALID_BITS		32
> +#define JH7110_DELAY_US			0
> +#define JH7110_TIMEOUT_US		10000
> +#define JH7110_CLOCKEVENT_RATING	300
> +#define JH7110_TIMER_MAX_TICKS		0xffffffff
> +#define JH7110_TIMER_MIN_TICKS		0xf
> +#define JH7110_TIMER_RELOAD_VALUE	0
> +
> +#define JH7110_TIMER_INT_STATUS		0x00 /* RO[0:4]: Interrupt Status for channel0~4 */
> +#define JH7110_TIMER_CTL		0x04 /* RW[0]: 0-continuous run, 1-single run */
> +#define JH7110_TIMER_LOAD		0x08 /* RW: load value to counter */
> +#define JH7110_TIMER_ENABLE		0x10 /* RW[0]: timer enable register */
> +#define JH7110_TIMER_RELOAD		0x14 /* RW: write 1 or 0 both reload counter */
> +#define JH7110_TIMER_VALUE		0x18 /* RO: timer value register */
> +#define JH7110_TIMER_INT_CLR		0x20 /* RW: timer interrupt clear register */
> +#define JH7110_TIMER_INT_MASK		0x24 /* RW[0]: timer interrupt mask register */
> +
> +#define JH7110_TIMER_INT_CLR_ENA	BIT(0)
> +#define JH7110_TIMER_INT_CLR_AVA_MASK	BIT(1)
> +
> +struct jh7110_clkevt {
> +	struct clock_event_device evt;
> +	struct clocksource cs;
> +	bool cs_is_valid;
> +	struct clk *clk;
> +	struct reset_control *rst;
> +	u32 rate;
> +	u32 reload_val;
> +	void __iomem *base;
> +	char name[sizeof("jh7110-timer.chX")];
> +};

Maybe sort this by alignment so you save a few bytes. Eg. something like

struct jh7110_clkevt {
	struct clock_event_device evt;
	struct clocksource cs;
	struct clk *clk;
	struct reset_control *rst;
	void __iomem *base;
	u32 rate;
	u32 reload_val;
	bool cs_is_valid;
	char name[sizeof("jh7110-timer.chX")];
};

> +struct jh7110_timer_priv {
> +	struct clk *pclk;
> +	struct reset_control *prst;
> +	struct jh7110_clkevt clkevt[JH7110_TIMER_CH_MAX];
> +};
> +
> +/* 0:continuous-run mode, 1:single-run mode */
> +enum jh7110_timer_mode {
> +	JH7110_TIMER_MODE_CONTIN,
> +	JH7110_TIMER_MODE_SINGLE,
> +};
> +
> +/* Interrupt Mask, 0:Unmask, 1:Mask */
> +enum jh7110_timer_int_mask {
> +	JH7110_TIMER_INT_ENA,
> +	JH7110_TIMER_INT_DIS,
> +};
> +
> +enum jh7110_timer_enable {
> +	JH7110_TIMER_DIS,
> +	JH7110_TIMER_ENA,
> +};
> +
> +static inline struct jh7110_clkevt *to_jh7110_clkevt(struct clock_event_device *evt)
> +{
> +	return container_of(evt, struct jh7110_clkevt, evt);
> +}
> +
> +/*
> + * BIT(0): Read value represent channel int status.
> + * Write 1 to this bit to clear interrupt. Write 0 has no effects.
> + * BIT(1): "1" means that it is clearing interrupt. BIT(0) can not be written.
> + */
> +static inline int jh7110_timer_int_clear(struct jh7110_clkevt *clkevt)
> +{
> +	u32 value;
> +	int ret;
> +
> +	/* Waiting interrupt can be cleared */
> +	ret = readl_poll_timeout_atomic(clkevt->base + JH7110_TIMER_INT_CLR, value,
> +					!(value & JH7110_TIMER_INT_CLR_AVA_MASK),
> +					JH7110_DELAY_US, JH7110_TIMEOUT_US);
> +	if (!ret)
> +		writel(JH7110_TIMER_INT_CLR_ENA, clkevt->base + JH7110_TIMER_INT_CLR);

Below you're calling this function in the interrupt handler and the shutdown
callback, so is it really safe to always enable the interrupt on timeouts?

I think you just want the version below and then let the caller handle
re-enabling the interrupts on errors if needed. (While you're at it you can
remove the inline and let the compiler decide, which is does anyway.)

static int jh7110_timer_int_clear(struct jh7110_clkevt *clkevt)
{
	u32 value;

	/* Waiting interrupt can be cleared */
	return readl_poll_timeout_atomic(clkevt->base + JH7110_TIMER_INT_CLR, value,
					 !(value & JH7110_TIMER_INT_CLR_AVA_MASK),
					 JH7110_DELAY_US, JH7110_TIMEOUT_US);
}

> +
> +	return ret;
> +}
> +
> +static int jh7110_timer_start(struct jh7110_clkevt *clkevt)
> +{
> +	int ret;
> +
> +	/* Disable and clear interrupt first */
> +	writel(JH7110_TIMER_INT_DIS, clkevt->base + JH7110_TIMER_INT_MASK);
> +	ret = jh7110_timer_int_clear(clkevt);
> +	if (ret)
> +		return ret;
> +
> +	writel(JH7110_TIMER_INT_ENA, clkevt->base + JH7110_TIMER_INT_MASK);
> +	writel(JH7110_TIMER_ENA, clkevt->base + JH7110_TIMER_ENABLE);
> +
> +	return 0;
> +}
> +
> +static int jh7110_timer_shutdown(struct clock_event_device *evt)
> +{
> +	struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);
> +
> +	writel(JH7110_TIMER_DIS, clkevt->base + JH7110_TIMER_ENABLE);
> +	return jh7110_timer_int_clear(clkevt);
> +}
> +
> +static void jh7110_timer_suspend(struct clock_event_device *evt)
> +{
> +	struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);
> +
> +	clkevt->reload_val = readl(clkevt->base + JH7110_TIMER_LOAD);
> +	jh7110_timer_shutdown(evt);
> +}
> +
> +static void jh7110_timer_resume(struct clock_event_device *evt)
> +{
> +	struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);
> +
> +	writel(clkevt->reload_val, clkevt->base + JH7110_TIMER_LOAD);
> +	writel(JH7110_TIMER_RELOAD_VALUE, clkevt->base + JH7110_TIMER_RELOAD);
> +	jh7110_timer_start(clkevt);
> +}
> +
> +static int jh7110_timer_tick_resume(struct clock_event_device *evt)
> +{
> +	jh7110_timer_resume(evt);
> +
> +	return 0;
> +}

Here you probably want it the other way around, so you handle possible errors
from jh7110_timer_start() properly. Eg.

static int jh7110_timer_tick_resume(struct clock_event_device *evt)
{
	struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);

	writel(clkevt->reload_val, clkevt->base + JH7110_TIMER_LOAD);
	writel(JH7110_TIMER_RELOAD_VALUE, clkevt->base + JH7110_TIMER_RELOAD);
	return jh7110_timer_start(clkevt);
}

static void jh7110_timer_resume(struct clock_event_device *evt)
{
	jh7110_timer_tick_resume(evt);
}

> +/* IRQ handler for the timer */
> +static irqreturn_t jh7110_timer_interrupt(int irq, void *priv)
> +{
> +	struct clock_event_device *evt = (struct clock_event_device *)priv;

This cast is unnecessary and also calling the variable priv makes you think
it's a struct jh7110_timer_priv, but the interrupt is registered with a
struct clock_event_device pointer.

> +	struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);

But here you're immediately casting it to a struct jh7110_clkevt pointer. So
why not just register the interrupt with the struct jh7110_clkevt pointer, do

	struct jh7110_clkevt *clkevt = data;

> +
> +	if (jh7110_timer_int_clear(clkevt))
> +		return IRQ_NONE;
> +
> +	if (evt->event_handler)
> +		evt->event_handler(evt);

..and just use clkevt->evt.event_handler and &clkevt->evt here?

> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int jh7110_timer_set_periodic(struct clock_event_device *evt)
> +{
> +	struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);
> +	u32 periodic = DIV_ROUND_CLOSEST(clkevt->rate, HZ);
> +
> +	writel(JH7110_TIMER_MODE_CONTIN, clkevt->base + JH7110_TIMER_CTL);
> +	writel(periodic, clkevt->base + JH7110_TIMER_LOAD);
> +
> +	return jh7110_timer_start(clkevt);
> +}
> +
> +static int jh7110_timer_set_oneshot(struct clock_event_device *evt)
> +{
> +	struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);
> +
> +	writel(JH7110_TIMER_MODE_SINGLE, clkevt->base + JH7110_TIMER_CTL);
> +	writel(JH7110_TIMER_MAX_TICKS, clkevt->base + JH7110_TIMER_LOAD);
> +
> +	return jh7110_timer_start(clkevt);
> +}
> +
> +static int jh7110_timer_set_next_event(unsigned long next,
> +				       struct clock_event_device *evt)
> +{
> +	struct jh7110_clkevt *clkevt = to_jh7110_clkevt(evt);
> +
> +	writel(JH7110_TIMER_MODE_SINGLE, clkevt->base + JH7110_TIMER_CTL);
> +	writel(next, clkevt->base + JH7110_TIMER_LOAD);
> +
> +	return jh7110_timer_start(clkevt);
> +}
> +
> +static void jh7110_set_clockevent(struct clock_event_device *evt)
> +{
> +	evt->features = CLOCK_EVT_FEAT_PERIODIC |
> +			CLOCK_EVT_FEAT_ONESHOT |
> +			CLOCK_EVT_FEAT_DYNIRQ;
> +	evt->set_state_shutdown = jh7110_timer_shutdown;
> +	evt->set_state_periodic = jh7110_timer_set_periodic;
> +	evt->set_state_oneshot = jh7110_timer_set_oneshot;
> +	evt->set_state_oneshot_stopped = jh7110_timer_shutdown;
> +	evt->tick_resume = jh7110_timer_tick_resume;
> +	evt->set_next_event = jh7110_timer_set_next_event;
> +	evt->suspend = jh7110_timer_suspend;
> +	evt->resume = jh7110_timer_resume;
> +	evt->rating = JH7110_CLOCKEVENT_RATING;
> +}
> +
> +static u64 jh7110_timer_clocksource_read(struct clocksource *cs)
> +{
> +	struct jh7110_clkevt *clkevt = container_of(cs, struct jh7110_clkevt, cs);
> +
> +	return (u64)readl(clkevt->base + JH7110_TIMER_VALUE);
> +}
> +
> +static int jh7110_clocksource_init(struct jh7110_clkevt *clkevt)
> +{
> +	int ret;
> +
> +	clkevt->cs.name = clkevt->name;
> +	clkevt->cs.rating = JH7110_CLOCK_SOURCE_RATING;
> +	clkevt->cs.read = jh7110_timer_clocksource_read;
> +	clkevt->cs.mask = CLOCKSOURCE_MASK(JH7110_VALID_BITS);
> +	clkevt->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +
> +	ret = clocksource_register_hz(&clkevt->cs, clkevt->rate);
> +	if (ret)
> +		return ret;
> +
> +	clkevt->cs_is_valid = true; /* clocksource register done */
> +	writel(JH7110_TIMER_MODE_CONTIN, clkevt->base + JH7110_TIMER_CTL);
> +	writel(JH7110_TIMER_MAX_TICKS, clkevt->base + JH7110_TIMER_LOAD);
> +
> +	return jh7110_timer_start(clkevt);
> +}
> +
> +static void jh7110_clockevents_register(struct jh7110_clkevt *clkevt)
> +{
> +	clkevt->rate = clk_get_rate(clkevt->clk);
> +
> +	jh7110_set_clockevent(&clkevt->evt);
> +	clkevt->evt.name = clkevt->name;
> +	clkevt->evt.cpumask = cpu_possible_mask;
> +
> +	clockevents_config_and_register(&clkevt->evt, clkevt->rate,
> +					JH7110_TIMER_MIN_TICKS, JH7110_TIMER_MAX_TICKS);
> +}
> +
> +static void jh7110_timer_release(void *data)
> +{
> +	struct jh7110_timer_priv *priv = data;
> +	int i;
> +
> +	for (i = 0; i < JH7110_TIMER_CH_MAX; i++) {
> +		/* Disable each channel of timer */
> +		if (priv->clkevt[i].base)
> +			writel(JH7110_TIMER_DIS, priv->clkevt[i].base + JH7110_TIMER_ENABLE);
> +
> +		/* Avoid no initialization in the loop of the probe */
> +		if (!IS_ERR_OR_NULL(priv->clkevt[i].rst))
> +			reset_control_assert(priv->clkevt[i].rst);
> +
> +		if (priv->clkevt[i].cs_is_valid)
> +			clocksource_unregister(&priv->clkevt[i].cs);
> +	}
> +
> +	reset_control_assert(priv->prst);
> +}
> +
> +static int jh7110_timer_probe(struct platform_device *pdev)
> +{
> +	struct jh7110_timer_priv *priv;
> +	struct jh7110_clkevt *clkevt;
> +	char name[sizeof("chX")];
> +	int ch;
> +	int ret;
> +	void __iomem *base;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(base),
> +				     "failed to map registers\n");
> +
> +	priv->prst = devm_reset_control_get_exclusive(&pdev->dev, "apb");
> +	if (IS_ERR(priv->prst))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->prst),
> +				     "failed to get apb reset\n");
> +
> +	priv->pclk = devm_clk_get_enabled(&pdev->dev, "apb");
> +	if (IS_ERR(priv->pclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->pclk),
> +				     "failed to get & enable apb clock\n");

priv->pclk is set here, but never read anywhere. Just remove it from the struct
and use a local variable here.

> +
> +	ret = reset_control_deassert(priv->prst);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to deassert apb reset\n");
> +
> +	ret = devm_add_action_or_reset(&pdev->dev, jh7110_timer_release, priv);
> +	if (ret)
> +		return ret;
> +
> +	for (ch = 0; ch < JH7110_TIMER_CH_MAX; ch++) {
> +		clkevt = &priv->clkevt[ch];
> +		snprintf(name, sizeof(name), "ch%d", ch);
> +
> +		clkevt->base = base + JH7110_TIMER_CH_BASE(ch);
> +		/* Ensure timer is disabled */
> +		writel(JH7110_TIMER_DIS, clkevt->base + JH7110_TIMER_ENABLE);
> +
> +		clkevt->rst = devm_reset_control_get_exclusive(&pdev->dev, name);
> +		if (IS_ERR(clkevt->rst))
> +			return PTR_ERR(clkevt->rst);
> +
> +		clkevt->clk = devm_clk_get_enabled(&pdev->dev, name);
> +		if (IS_ERR(clkevt->clk))
> +			return PTR_ERR(clkevt->clk);
> +
> +		ret = reset_control_deassert(clkevt->rst);
> +		if (ret)
> +			return ret;
> +
> +		clkevt->evt.irq = platform_get_irq(pdev, ch);
> +		if (clkevt->evt.irq < 0)
> +			return clkevt->evt.irq;
> +
> +		snprintf(clkevt->name, sizeof(clkevt->name), "jh7110-timer.ch%d", ch);
> +		jh7110_clockevents_register(clkevt);
> +
> +		ret = devm_request_irq(&pdev->dev, clkevt->evt.irq, jh7110_timer_interrupt,
> +				       IRQF_TIMER | IRQF_IRQPOLL,
> +				       clkevt->name, &clkevt->evt);
> +		if (ret)
> +			return ret;
> +
> +		ret = jh7110_clocksource_init(clkevt);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id jh7110_timer_match[] = {
> +	{ .compatible = "starfive,jh7110-timer", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, jh7110_timer_match);
> +
> +static struct platform_driver jh7110_timer_driver = {
> +	.probe = jh7110_timer_probe,
> +	.driver = {
> +		.name = "jh7110-timer",
> +		.of_match_table = jh7110_timer_match,
> +	},
> +};
> +module_platform_driver(jh7110_timer_driver);
> +
> +MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
> +MODULE_DESCRIPTION("StarFive JH7110 timer driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

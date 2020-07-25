Return-Path: <SRS0=Z8g5=BE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F1DC433E5
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:03:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25E192065F
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="znzvqfNJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="aS0GfOYa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25E192065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RIGLNqX+pB9vbqNBZrvtJxGxapagYymDJ2eUP3UvmoQ=; b=znzvqfNJUxFjoCWNjwigW9iTr
	TBe0sx2B+NdZsWUt4xq6Lhc0WzXHeno9GhQqQj8Ysrl4AfGgUd+NgVMTLSvx7cw2dQWGz4k659Jp0
	JGjyu3DZ7hIDIvgX91jCBUoCSMb44cG9ljaZcOQxKs90l267293s6aXKbsSYlD6se8jVcGJJm6NUX
	Z5U9U5ueOkx5zkep6NoJwYtwVPlE30yAsh5j/hfC1f1Fr83LMph+asft1yewRsD5SdxgrTaQ40FD8
	RzY62OwS2/99ebm5MDVFEfuYZA4CA5L20c+kS/ZymOmPITtVYmY5JLJqCoXCrhnHJBUlYLboiaI6r
	PjWq22FSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzCKv-0004oo-0r; Sat, 25 Jul 2020 05:03:05 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzCKr-0004np-1b
 for linux-riscv@lists.infradead.org; Sat, 25 Jul 2020 05:03:02 +0000
Received: by mail-wm1-x344.google.com with SMTP id f18so1136279wmc.0
 for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2020 22:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ubxOZzWFuf18HHnMJijvU/huOnySJVStKgp2cQD0b58=;
 b=aS0GfOYaaflnxQezUdJwoU45UfocVmiOjZekGSrCMTXrmXii0nYsvFS5uItmXDETOn
 uN7jSlsaJJLArJCWk1xGzF+dtaC27EBgf8SOf+f1ULMPghV/xMJutMKmVzVZr35RPORd
 vPm8TrfhdfgqXBxWYZQI78hxiIjGddJZ3E5l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ubxOZzWFuf18HHnMJijvU/huOnySJVStKgp2cQD0b58=;
 b=gusQBvrIjSzxMQzB0LFKcTSIFvxGMwHUch0E6EU4ZCTmcp34nhER74nWBRcTpjyLDt
 21+OAjcvnL4qCdmQ9MBtrxh83qwQMHg0XCwpyOlHuJYEhRfYCiWd5uTOT5J8bJfeEIb+
 M3nLUpZ4JK0w01/sJ0SzZJwh/VCjxLgf+D9snUaw0JEfy+OrdGr+dEUhWzetHbdMacZ2
 Hm7d7uHvB8q5/pzGfYv5dzkVrKm886YQabgC6+kHDydmGhzgGghpNjc5WqLYDX5Wr78p
 cDLmuUtgKVu0cSKAJzWTcelZdl6BAd07kApWiOF1GSdFEg1qWvv3h+niSACoCg0ACqmz
 3Iaw==
X-Gm-Message-State: AOAM531lQDjBk67BwvzgN+6UxsbqDbdJLjwb1BkfBegKvUswnx8OGm9i
 kParMrnkg2b1S2KrtUFaPDK27d643bfuZWvu4A4V
X-Google-Smtp-Source: ABdhPJy53ATllE+V/nbEr6jLEe8N2PSO3gaXTTw3E+vetjFwSB9xC4ntTX04sYYFLpd/waJoxqm6UlDQrlfftKVbZto=
X-Received: by 2002:a1c:3c87:: with SMTP id j129mr3902176wma.176.1595653375085; 
 Fri, 24 Jul 2020 22:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200724071822.126758-1-anup.patel@wdc.com>
 <20200724071822.126758-3-anup.patel@wdc.com>
In-Reply-To: <20200724071822.126758-3-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 24 Jul 2020 22:02:43 -0700
Message-ID: <CAOnJCU+u4MMbzzdg1mv+GLiD13qxfRcc5RRokEGWvNj7PLm5wg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] clocksource/drivers: Add CLINT timer driver
To: Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_010301_162238_2F121A4B 
X-CRM114-Status: GOOD (  32.42  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berhing <kernel@esmil.dk>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2020 at 12:19 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add a separate CLINT timer driver for Linux RISC-V M-mode (i.e.
> RISC-V NoMMU kernel).
>
> The CLINT MMIO device provides three things:
> 1. 64bit free running counter register
> 2. 64bit per-CPU time compare registers
> 3. 32bit per-CPU inter-processor interrupt registers
>
> Unlike other timer devices, CLINT provides IPI registers along with
> timer registers. To use CLINT IPI registers, the CLINT timer driver
> provides IPI related callbacks to arch/riscv.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Tested-by: Emil Renner Berhing <kernel@esmil.dk>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/clocksource/Kconfig       |   9 ++
>  drivers/clocksource/Makefile      |   1 +
>  drivers/clocksource/timer-clint.c | 226 ++++++++++++++++++++++++++++++
>  include/linux/cpuhotplug.h        |   1 +
>  4 files changed, 237 insertions(+)
>  create mode 100644 drivers/clocksource/timer-clint.c
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 91418381fcd4..41f1c147c178 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -658,6 +658,15 @@ config RISCV_TIMER
>           is accessed via both the SBI and the rdcycle instruction.  This is
>           required for all RISC-V systems.
>
> +config CLINT_TIMER
> +       bool "CLINT Timer for the RISC-V platform" if COMPILE_TEST
> +       depends on GENERIC_SCHED_CLOCK && RISCV
> +       select TIMER_PROBE
> +       select TIMER_OF
> +       help
> +         This option enables the CLINT timer for RISC-V systems.  The CLINT
> +         driver is usually used for NoMMU RISC-V systems.
> +
>  config CSKY_MP_TIMER
>         bool "SMP Timer for the C-SKY platform" if COMPILE_TEST
>         depends on CSKY
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index bdda1a2e4097..18e700e703a0 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -87,6 +87,7 @@ obj-$(CONFIG_CLKSRC_ST_LPC)           += clksrc_st_lpc.o
>  obj-$(CONFIG_X86_NUMACHIP)             += numachip.o
>  obj-$(CONFIG_ATCPIT100_TIMER)          += timer-atcpit100.o
>  obj-$(CONFIG_RISCV_TIMER)              += timer-riscv.o
> +obj-$(CONFIG_CLINT_TIMER)              += timer-clint.o
>  obj-$(CONFIG_CSKY_MP_TIMER)            += timer-mp-csky.o
>  obj-$(CONFIG_GX6605S_TIMER)            += timer-gx6605s.o
>  obj-$(CONFIG_HYPERV_TIMER)             += hyperv_timer.o
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> new file mode 100644
> index 000000000000..8eeafa82c03d
> --- /dev/null
> +++ b/drivers/clocksource/timer-clint.c
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Western Digital Corporation or its affiliates.
> + *
> + * Most of the M-mode (i.e. NoMMU) RISC-V systems usually have a
> + * CLINT MMIO timer device.
> + */
> +
> +#define pr_fmt(fmt) "clint: " fmt
> +#include <linux/bitops.h>
> +#include <linux/clocksource.h>
> +#include <linux/clockchips.h>
> +#include <linux/cpu.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/sched_clock.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_irq.h>
> +#include <linux/smp.h>
> +
> +#define CLINT_IPI_OFF          0
> +#define CLINT_TIMER_CMP_OFF    0x4000
> +#define CLINT_TIMER_VAL_OFF    0xbff8
> +
> +/* CLINT manages IPI and Timer for RISC-V M-mode  */
> +static u32 __iomem *clint_ipi_base;
> +static u64 __iomem *clint_timer_cmp;
> +static u64 __iomem *clint_timer_val;
> +static unsigned long clint_timer_freq;
> +static unsigned int clint_timer_irq;
> +
> +static void clint_send_ipi(const struct cpumask *target)
> +{
> +       unsigned int cpu;
> +
> +       for_each_cpu(cpu, target)
> +               writel(1, clint_ipi_base + cpuid_to_hartid_map(cpu));
> +}
> +
> +static void clint_clear_ipi(void)
> +{
> +       writel(0, clint_ipi_base + cpuid_to_hartid_map(smp_processor_id()));
> +}
> +
> +static struct riscv_ipi_ops clint_ipi_ops = {
> +       .ipi_inject = clint_send_ipi,
> +       .ipi_clear = clint_clear_ipi,
> +};
> +
> +#ifdef CONFIG_64BIT
> +#define clint_get_cycles()     readq_relaxed(clint_timer_val)
> +#else
> +#define clint_get_cycles()     readl_relaxed(clint_timer_val)
> +#define clint_get_cycles_hi()  readl_relaxed(((u32 *)clint_timer_val) + 1)
> +#endif
> +
> +#ifdef CONFIG_64BIT
> +static u64 notrace clint_get_cycles64(void)
> +{
> +       return clint_get_cycles();
> +}
> +#else /* CONFIG_64BIT */
> +static u64 notrace clint_get_cycles64(void)
> +{
> +       u32 hi, lo;
> +
> +       do {
> +               hi = clint_get_cycles_hi();
> +               lo = clint_get_cycles();
> +       } while (hi != clint_get_cycles_hi());
> +
> +       return ((u64)hi << 32) | lo;
> +}
> +#endif /* CONFIG_64BIT */
> +
> +static u64 clint_rdtime(struct clocksource *cs)
> +{
> +       return clint_get_cycles64();
> +}
> +
> +static struct clocksource clint_clocksource = {
> +       .name           = "clint_clocksource",
> +       .rating         = 300,
> +       .mask           = CLOCKSOURCE_MASK(64),
> +       .flags          = CLOCK_SOURCE_IS_CONTINUOUS,
> +       .read           = clint_rdtime,
> +};
> +
> +static int clint_clock_next_event(unsigned long delta,
> +                                  struct clock_event_device *ce)
> +{
> +       void __iomem *r = clint_timer_cmp +
> +                         cpuid_to_hartid_map(smp_processor_id());
> +
> +       csr_set(CSR_IE, IE_TIE);
> +       writeq_relaxed(clint_get_cycles64() + delta, r);
> +       return 0;
> +}
> +
> +static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
> +       .name           = "clint_clockevent",
> +       .features       = CLOCK_EVT_FEAT_ONESHOT,
> +       .rating         = 100,
> +       .set_next_event = clint_clock_next_event,
> +};
> +
> +static int clint_timer_starting_cpu(unsigned int cpu)
> +{
> +       struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
> +
> +       ce->cpumask = cpumask_of(cpu);
> +       clockevents_config_and_register(ce, clint_timer_freq, 100, 0x7fffffff);
> +
> +       enable_percpu_irq(clint_timer_irq,
> +                         irq_get_trigger_type(clint_timer_irq));
> +       return 0;
> +}
> +
> +static int clint_timer_dying_cpu(unsigned int cpu)
> +{
> +       disable_percpu_irq(clint_timer_irq);
> +       return 0;
> +}
> +
> +static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
> +{
> +       struct clock_event_device *evdev = this_cpu_ptr(&clint_clock_event);
> +
> +       csr_clear(CSR_IE, IE_TIE);
> +       evdev->event_handler(evdev);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int __init clint_timer_init_dt(struct device_node *np)
> +{
> +       int rc;
> +       u32 i, nr_irqs;
> +       void __iomem *base;
> +       struct of_phandle_args oirq;
> +
> +       /*
> +        * Ensure that CLINT device interrupts are either RV_IRQ_TIMER or
> +        * RV_IRQ_SOFT. If it's anything else then we ignore the device.
> +        */
> +       nr_irqs = of_irq_count(np);
> +       for (i = 0; i < nr_irqs; i++) {
> +               if (of_irq_parse_one(np, i, &oirq)) {
> +                       pr_err("%pOFP: failed to parse irq %d.\n", np, i);
> +                       continue;
> +               }
> +
> +               if ((oirq.args_count != 1) ||
> +                   (oirq.args[0] != RV_IRQ_TIMER &&
> +                    oirq.args[0] != RV_IRQ_SOFT)) {
> +                       pr_err("%pOFP: invalid irq %d (hwirq %d)\n",
> +                              np, i, oirq.args[0]);
> +                       return -ENODEV;
> +               }
> +
> +               /* Find parent irq domain and map timer irq */
> +               if (!clint_timer_irq &&
> +                   oirq.args[0] == RV_IRQ_TIMER &&
> +                   irq_find_host(oirq.np))
> +                       clint_timer_irq = irq_of_parse_and_map(np, i);
> +       }
> +
> +       /* If CLINT timer irq not found then fail */
> +       if (!clint_timer_irq) {
> +               pr_err("%pOFP: timer irq not found\n", np);
> +               return -ENODEV;
> +       }
> +
> +       base = of_iomap(np, 0);
> +       if (!base) {
> +               pr_err("%pOFP: could not map registers\n", np);
> +               return -ENODEV;
> +       }
> +
> +       clint_ipi_base = base + CLINT_IPI_OFF;
> +       clint_timer_cmp = base + CLINT_TIMER_CMP_OFF;
> +       clint_timer_val = base + CLINT_TIMER_VAL_OFF;
> +       clint_timer_freq = riscv_timebase;
> +
> +       pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
> +
> +       rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
> +       if (rc) {
> +               pr_err("%pOFP: clocksource register failed [%d]\n", np, rc);
> +               goto fail_iounmap;
> +       }
> +
> +       sched_clock_register(clint_get_cycles64, 64, clint_timer_freq);
> +
> +       rc = request_percpu_irq(clint_timer_irq, clint_timer_interrupt,
> +                                "clint-timer", &clint_clock_event);
> +       if (rc) {
> +               pr_err("registering percpu irq failed [%d]\n", rc);
> +               goto fail_iounmap;
> +       }
> +
> +       rc = cpuhp_setup_state(CPUHP_AP_CLINT_TIMER_STARTING,
> +                               "clockevents/clint/timer:starting",
> +                               clint_timer_starting_cpu,
> +                               clint_timer_dying_cpu);
> +       if (rc) {
> +               pr_err("%pOFP: cpuhp setup state failed [%d]\n", np, rc);
> +               goto fail_free_irq;
> +       }
> +
> +       riscv_set_ipi_ops(&clint_ipi_ops);
> +       clint_clear_ipi();
> +
> +       return 0;
> +
> +fail_free_irq:
> +       free_irq(clint_timer_irq, &clint_clock_event);
> +fail_iounmap:
> +       iounmap(base);
> +       return rc;
> +}
> +
> +TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
> +TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 191772d4a4d7..1451f4625833 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -132,6 +132,7 @@ enum cpuhp_state {
>         CPUHP_AP_MIPS_GIC_TIMER_STARTING,
>         CPUHP_AP_ARC_TIMER_STARTING,
>         CPUHP_AP_RISCV_TIMER_STARTING,
> +       CPUHP_AP_CLINT_TIMER_STARTING,
>         CPUHP_AP_CSKY_TIMER_STARTING,
>         CPUHP_AP_HYPERV_TIMER_STARTING,
>         CPUHP_AP_KVM_STARTING,
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


LGTM.

Reviewed-by: Atish Patra <atish.patra@wdc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

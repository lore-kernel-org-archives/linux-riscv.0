Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EA2C433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 01:48:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ECB220792
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 01:48:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nMg8fuIY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="Ih6JwGiv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ECB220792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=s7iOuTRyc97hwXIHi38QZZwSht1rvro/1DCnUt0ResA=; b=nMg8fuIYo+nl3PrdVJrNAugwm
	Z5r8Vl2bj39JLaCIAFMIVanVLno1YHdfadSsmvdyCVtwj/UIbsrUo+Ym4A5TJXqY3MyjUvLA3Dg0V
	3czGlbnkYwDyUdHbq3zEwl9ZM+iBa7xIJXGmYZWNxM/9QYK+f4Xk2sQic2hpqSDd3cqzruGpJUDbw
	6xhx8+R3Ecv5iEiA/FczQzoIHVaM9MN2qm4WcmojQmHr1Xv81TBCCC8DyilcQn2Y51sGpaZfb4I86
	Urp8wotVA2cSB6FfJO+3lQXJ3hfVB2AUi6iTCQa1+qUmyf7sJId81/sVn1lzrKV/kZQ4RbIRhRFVv
	lpRdEJrmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k38XA-0008QP-SW; Wed, 05 Aug 2020 01:48:00 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k38X7-0008ON-4D
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 01:47:58 +0000
Received: by mail-pf1-x443.google.com with SMTP id l2so15436895pff.0
 for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2020 18:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ZcqOoE0k//T6iKJl8Iy6MdqrkbGXLPe7ERkD/eHi0yU=;
 b=Ih6JwGivgC5jtdLTYu1d8Jxo+0sWPc0KHpD37HDIcVut821WvOsNwaovapFCvLsVo3
 wM1TRR/h6/WQQSGiKodIZvTIFmnTiYPl8UPsi+BoP7hI577zNX3NTeiKXo4SwwTGKo4x
 zo9UNt6KCZ7mFjzeVDUwzLJJTbLwplZUEgMHgEWlbtSQg4CseLiBRBLAnDyWCrJ9WaaU
 H8hqqmn/w3hbp1LhBN78NEOHYOYixowoJhuQAZ8e8ZYmOE5MqkFkDW9QrzrKhoJtaYVL
 /5gnMAbS/swGJVnVLb1m/DO55HGG3LFcz1U0lDgZuX3RX+BX2Izqinsm8FHLFAok110n
 +6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZcqOoE0k//T6iKJl8Iy6MdqrkbGXLPe7ERkD/eHi0yU=;
 b=kYzaOgOCHMO0N4UHGuZ+b52/eV6SkM4vXaGWL1aooRzxHupY9Ag97C6S8cNHqbKbke
 D+eXPsiqMWJIZiCZ/+gpA7MP8A6ojFTwJ5nn9fdWQQgklMfyaj6WlqIUtGyeJTXlp9T9
 MZGGCfA4ddZhq20P2OaWz/bqtfZtElTRDpzNaIPU0l9EIcAydcksZXr/ispfBCqjkTOz
 N2Ys2tHGEL91qTdUZkz5V+tWYDJAR2FK1FsOPbhXyeUyn8pBx3jBF8Kg9fVi4rFWY0kk
 /1vwESL+y6ek7k6D9Q9WCtoixPNmsGf17OERl0bZTWDfzJN+RW7fc69HUgP/840foE9W
 XQpg==
X-Gm-Message-State: AOAM533DD0jQVoe7rFNtIm+icpiVtNxiS15CuWsB8aPbh/4n8e1LL52Z
 pNf16UyRvD5UzOVz8BfYuSUKog==
X-Google-Smtp-Source: ABdhPJwxr9dxLTvZLURrhuFcbav23he9QZxX4AZNz75TVaqQtZh4vsr7wtYYE2GZR53mjqJEudmGqw==
X-Received: by 2002:a63:4423:: with SMTP id r35mr988884pga.122.1596592073410; 
 Tue, 04 Aug 2020 18:47:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w7sm542367pfi.164.2020.08.04.18.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 18:47:52 -0700 (PDT)
Date: Tue, 04 Aug 2020 18:47:52 -0700 (PDT)
X-Google-Original-Date: Tue, 04 Aug 2020 18:33:45 PDT (-0700)
Subject: Re: [PATCH v6 2/4] clocksource/drivers: Add CLINT timer driver
In-Reply-To: <20200724071822.126758-3-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-264e345d-64c2-4765-906b-34a4d292fe58@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_214757_226974_CA5B36F8 
X-CRM114-Status: GOOD (  35.68  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>,
 aou@eecs.berkeley.edu, kernel@esmil.dk, anup@brainfault.org,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 robh+dt@kernel.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 24 Jul 2020 00:18:20 PDT (-0700), Anup Patel wrote:
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
>  	  is accessed via both the SBI and the rdcycle instruction.  This is
>  	  required for all RISC-V systems.
>
> +config CLINT_TIMER
> +	bool "CLINT Timer for the RISC-V platform" if COMPILE_TEST
> +	depends on GENERIC_SCHED_CLOCK && RISCV
> +	select TIMER_PROBE
> +	select TIMER_OF
> +	help
> +	  This option enables the CLINT timer for RISC-V systems.  The CLINT
> +	  driver is usually used for NoMMU RISC-V systems.
> +
>  config CSKY_MP_TIMER
>  	bool "SMP Timer for the C-SKY platform" if COMPILE_TEST
>  	depends on CSKY
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index bdda1a2e4097..18e700e703a0 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -87,6 +87,7 @@ obj-$(CONFIG_CLKSRC_ST_LPC)		+= clksrc_st_lpc.o
>  obj-$(CONFIG_X86_NUMACHIP)		+= numachip.o
>  obj-$(CONFIG_ATCPIT100_TIMER)		+= timer-atcpit100.o
>  obj-$(CONFIG_RISCV_TIMER)		+= timer-riscv.o
> +obj-$(CONFIG_CLINT_TIMER)		+= timer-clint.o
>  obj-$(CONFIG_CSKY_MP_TIMER)		+= timer-mp-csky.o
>  obj-$(CONFIG_GX6605S_TIMER)		+= timer-gx6605s.o
>  obj-$(CONFIG_HYPERV_TIMER)		+= hyperv_timer.o
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
> +#define CLINT_IPI_OFF		0
> +#define CLINT_TIMER_CMP_OFF	0x4000
> +#define CLINT_TIMER_VAL_OFF	0xbff8
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
> +	unsigned int cpu;
> +
> +	for_each_cpu(cpu, target)
> +		writel(1, clint_ipi_base + cpuid_to_hartid_map(cpu));
> +}
> +
> +static void clint_clear_ipi(void)
> +{
> +	writel(0, clint_ipi_base + cpuid_to_hartid_map(smp_processor_id()));
> +}
> +
> +static struct riscv_ipi_ops clint_ipi_ops = {
> +	.ipi_inject = clint_send_ipi,
> +	.ipi_clear = clint_clear_ipi,
> +};
> +
> +#ifdef CONFIG_64BIT
> +#define clint_get_cycles()	readq_relaxed(clint_timer_val)
> +#else
> +#define clint_get_cycles()	readl_relaxed(clint_timer_val)
> +#define clint_get_cycles_hi()	readl_relaxed(((u32 *)clint_timer_val) + 1)
> +#endif
> +
> +#ifdef CONFIG_64BIT
> +static u64 notrace clint_get_cycles64(void)
> +{
> +	return clint_get_cycles();
> +}
> +#else /* CONFIG_64BIT */
> +static u64 notrace clint_get_cycles64(void)
> +{
> +	u32 hi, lo;
> +
> +	do {
> +		hi = clint_get_cycles_hi();
> +		lo = clint_get_cycles();
> +	} while (hi != clint_get_cycles_hi());
> +
> +	return ((u64)hi << 32) | lo;
> +}
> +#endif /* CONFIG_64BIT */
> +
> +static u64 clint_rdtime(struct clocksource *cs)
> +{
> +	return clint_get_cycles64();
> +}
> +
> +static struct clocksource clint_clocksource = {
> +	.name		= "clint_clocksource",
> +	.rating		= 300,
> +	.mask		= CLOCKSOURCE_MASK(64),
> +	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
> +	.read		= clint_rdtime,
> +};
> +
> +static int clint_clock_next_event(unsigned long delta,
> +				   struct clock_event_device *ce)
> +{
> +	void __iomem *r = clint_timer_cmp +
> +			  cpuid_to_hartid_map(smp_processor_id());
> +
> +	csr_set(CSR_IE, IE_TIE);
> +	writeq_relaxed(clint_get_cycles64() + delta, r);
> +	return 0;
> +}
> +
> +static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
> +	.name		= "clint_clockevent",
> +	.features	= CLOCK_EVT_FEAT_ONESHOT,
> +	.rating		= 100,
> +	.set_next_event	= clint_clock_next_event,
> +};
> +
> +static int clint_timer_starting_cpu(unsigned int cpu)
> +{
> +	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
> +
> +	ce->cpumask = cpumask_of(cpu);
> +	clockevents_config_and_register(ce, clint_timer_freq, 100, 0x7fffffff);
> +
> +	enable_percpu_irq(clint_timer_irq,
> +			  irq_get_trigger_type(clint_timer_irq));
> +	return 0;
> +}
> +
> +static int clint_timer_dying_cpu(unsigned int cpu)
> +{
> +	disable_percpu_irq(clint_timer_irq);
> +	return 0;
> +}
> +
> +static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
> +{
> +	struct clock_event_device *evdev = this_cpu_ptr(&clint_clock_event);
> +
> +	csr_clear(CSR_IE, IE_TIE);
> +	evdev->event_handler(evdev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int __init clint_timer_init_dt(struct device_node *np)
> +{
> +	int rc;
> +	u32 i, nr_irqs;
> +	void __iomem *base;
> +	struct of_phandle_args oirq;
> +
> +	/*
> +	 * Ensure that CLINT device interrupts are either RV_IRQ_TIMER or
> +	 * RV_IRQ_SOFT. If it's anything else then we ignore the device.
> +	 */
> +	nr_irqs = of_irq_count(np);
> +	for (i = 0; i < nr_irqs; i++) {
> +		if (of_irq_parse_one(np, i, &oirq)) {
> +			pr_err("%pOFP: failed to parse irq %d.\n", np, i);
> +			continue;
> +		}
> +
> +		if ((oirq.args_count != 1) ||
> +		    (oirq.args[0] != RV_IRQ_TIMER &&
> +		     oirq.args[0] != RV_IRQ_SOFT)) {
> +			pr_err("%pOFP: invalid irq %d (hwirq %d)\n",
> +			       np, i, oirq.args[0]);
> +			return -ENODEV;
> +		}
> +
> +		/* Find parent irq domain and map timer irq */
> +		if (!clint_timer_irq &&
> +		    oirq.args[0] == RV_IRQ_TIMER &&
> +		    irq_find_host(oirq.np))
> +			clint_timer_irq = irq_of_parse_and_map(np, i);
> +	}
> +
> +	/* If CLINT timer irq not found then fail */
> +	if (!clint_timer_irq) {
> +		pr_err("%pOFP: timer irq not found\n", np);
> +		return -ENODEV;
> +	}
> +
> +	base = of_iomap(np, 0);
> +	if (!base) {
> +		pr_err("%pOFP: could not map registers\n", np);
> +		return -ENODEV;
> +	}
> +
> +	clint_ipi_base = base + CLINT_IPI_OFF;
> +	clint_timer_cmp = base + CLINT_TIMER_CMP_OFF;
> +	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
> +	clint_timer_freq = riscv_timebase;
> +
> +	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
> +
> +	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
> +	if (rc) {
> +		pr_err("%pOFP: clocksource register failed [%d]\n", np, rc);
> +		goto fail_iounmap;
> +	}
> +
> +	sched_clock_register(clint_get_cycles64, 64, clint_timer_freq);
> +
> +	rc = request_percpu_irq(clint_timer_irq, clint_timer_interrupt,
> +				 "clint-timer", &clint_clock_event);
> +	if (rc) {
> +		pr_err("registering percpu irq failed [%d]\n", rc);
> +		goto fail_iounmap;
> +	}
> +
> +	rc = cpuhp_setup_state(CPUHP_AP_CLINT_TIMER_STARTING,
> +				"clockevents/clint/timer:starting",
> +				clint_timer_starting_cpu,
> +				clint_timer_dying_cpu);
> +	if (rc) {
> +		pr_err("%pOFP: cpuhp setup state failed [%d]\n", np, rc);
> +		goto fail_free_irq;
> +	}
> +
> +	riscv_set_ipi_ops(&clint_ipi_ops);
> +	clint_clear_ipi();
> +
> +	return 0;
> +
> +fail_free_irq:
> +	free_irq(clint_timer_irq, &clint_clock_event);
> +fail_iounmap:
> +	iounmap(base);
> +	return rc;
> +}
> +
> +TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
> +TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 191772d4a4d7..1451f4625833 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -132,6 +132,7 @@ enum cpuhp_state {
>  	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
>  	CPUHP_AP_ARC_TIMER_STARTING,
>  	CPUHP_AP_RISCV_TIMER_STARTING,
> +	CPUHP_AP_CLINT_TIMER_STARTING,
>  	CPUHP_AP_CSKY_TIMER_STARTING,
>  	CPUHP_AP_HYPERV_TIMER_STARTING,
>  	CPUHP_AP_KVM_STARTING,

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=Swg1=CX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4FEC43461
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 08:40:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0356921BE5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 08:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s/CbBGMF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="YWpaC93P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0356921BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NHTq3Wc9bgj8FQ3hFhWI7NskCoAo+F4SsPbaLMu0Wk0=; b=s/CbBGMFlfEPCjrZBPes/KVl0
	5Q1A2/2GzUr7jnXfPz7/dsVm024R5YLpIoX7j5CupcLZGzfbUnKYiQZBUdx911pnFdP41dN6591cw
	K3F20p67IK67ZcIFmyjfJWNvksdOt93iKyf/ws9lHudKGZmZFVA0eWPYlFNNlV5O9cccKywMDCMKV
	BYZehZFe2Txk3yKVv4/xdw6m+DLqnBzLG2pnTbNP4tAypZZ1YpF+376xRVtbKm4PHDJAaSSa4XotD
	0VHAU2zo8/GYAzbWifYYreM/pWBd40Xemv/vb/sPydEyATqqFrPq92NWEB8lDPy/Uh9X+M2qJWoB0
	YyVnbvfrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHk26-0005nM-41; Mon, 14 Sep 2020 08:40:18 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHk23-0005jr-IS
 for linux-riscv@lists.infradead.org; Mon, 14 Sep 2020 08:40:16 +0000
Received: by mail-wr1-x442.google.com with SMTP id c18so17704287wrm.9
 for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2020 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JIHvV2acufNTdV2ZD5UVUE8IHhdO6zOGauywATo6f5M=;
 b=YWpaC93PYgw87CMssVEGXLRFjRk4KgGY/F1FvrcEiBp4LR38i+yXTh1JADV48qqjAZ
 lu08OG3aCJptxCi00sK+VAmSKO59eWfiFONCeYEc1ssxf6q6TY96Y5OfRs6dDnP1koO8
 L08c9pT50Zy4fXmQunPZE0eaZxMesoN4CIw3Do/LrEp4BTR71QGpSTpezDFlpLwC3NVX
 Yugw/Q0BhJegiIEUDch6sD1ER5cg/j2pX2eMoSyj8rb8v2M/0N4el4IQmJegFalV6CEz
 0LFp9MiCLGoqRjdHyYoGT1vmMT4E1bHee0nTLv84HNKJTL2FZ7iWAE/OkRoNuFiVzGZh
 M5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JIHvV2acufNTdV2ZD5UVUE8IHhdO6zOGauywATo6f5M=;
 b=GsBDqdTxzlaibfcGp2bnyFLywcA+rCSc/cEKPDll93PK/l1ROEAkj8R+jR3sLkUxfo
 YWw7rdZit43xpgS2wYpd8dO5n6CkJzedGrJ5WhzPjGMMQzH89QYialCqQ3J+GR3oDtG3
 X+okE+xFFl4eIqLr0TiEJn1JnhMpusDyFwJDftkCf12yhQQGB3RjsuzDVVuucKZIiPSK
 KxtbUSBUqFSbrNMKRu+idp8QGa3nOA43JQo/EBQBe9886I+lmh+WX9cxjFi5nD+klL56
 RMPg95+KWvp2ZXHO5aCTUYdwG7ANmloydhqGJWv6m90YbpGinud8RFMGhAq/mCFOZBGy
 4yGA==
X-Gm-Message-State: AOAM530r/4rVz5k4RWtD5/yqBi6rFKScWRFTDWoLqB9oCSueze66MKn/
 xh9dnRVYV53zvsYBzZEskBVgIsw4fo51/9jKDS043Q==
X-Google-Smtp-Source: ABdhPJzZZtlrbBcwMKRCG6Rgim7y5nru9TDNf+5xUibO9sM7r++qDdLRG82ILvPk48o6iDJme+lAd1hw7y6kFZ9Gws4=
X-Received: by 2002:adf:eecb:: with SMTP id a11mr14874541wrp.356.1600072813698; 
 Mon, 14 Sep 2020 01:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <1600048323-2964-1-git-send-email-liush@allwinnertech.com>
In-Reply-To: <1600048323-2964-1-git-send-email-liush@allwinnertech.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 14 Sep 2020 14:10:02 +0530
Message-ID: <CAAhSdy1p3A-zQ+Q8WpvNHBEmUJs223gbd11HFiTz+uD-pJFW5g@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: add riscv cpuidle driver
To: liush <liush@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_044015_753385_331A8E81 
X-CRM114-Status: GOOD (  30.18  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, rjw@rjwysocki.net,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Emil Renner Berhing <kernel@esmil.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 14, 2020 at 7:22 AM liush <liush@allwinnertech.com> wrote:
>
> This patch adds a cpuidle driver for systems based RISCV architecture.
> This patch supports state WFI. Other states will be supported in the
> future.

First of all thanks for taking up the CPUIDLE efforts for RISC-V.

The commit description can be bit simplified as follows:
"This patch adds a simple cpuidle driver for RISC-V systems using
the WFI state. Other states will be supported in the future."

>
> Signed-off-by: liush <liush@allwinnertech.com>
> ---
>  arch/riscv/Kconfig               |  7 +++++
>  arch/riscv/include/asm/cpuidle.h |  7 +++++
>  arch/riscv/kernel/Makefile       |  1 +
>  arch/riscv/kernel/cpuidle.c      |  8 ++++++
>  drivers/cpuidle/Kconfig          |  5 ++++
>  drivers/cpuidle/Kconfig.riscv    | 11 ++++++++
>  drivers/cpuidle/Makefile         |  4 +++
>  drivers/cpuidle/cpuidle-riscv.c  | 55 ++++++++++++++++++++++++++++++++++++++++
>  8 files changed, 98 insertions(+)
>  create mode 100644 arch/riscv/include/asm/cpuidle.h
>  create mode 100644 arch/riscv/kernel/cpuidle.c
>  create mode 100644 drivers/cpuidle/Kconfig.riscv
>  create mode 100644 drivers/cpuidle/cpuidle-riscv.c
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index df18372..c7ddb9d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -86,6 +86,7 @@ config RISCV
>         select SPARSE_IRQ
>         select SYSCTL_EXCEPTION_TRACE
>         select THREAD_INFO_IN_TASK
> +       select CPU_IDLE

Place "select CPU_IDLE" in alphabetical order under
"config RISCV".

>
>  config ARCH_MMAP_RND_BITS_MIN
>         default 18 if 64BIT
> @@ -407,6 +408,12 @@ config BUILTIN_DTB
>         depends on RISCV_M_MODE
>         depends on OF
>
> +menu "CPU Power Management"
> +
> +source "drivers/cpuidle/Kconfig"
> +
> +endmenu
> +
>  menu "Power management options"
>
>  source "kernel/power/Kconfig"
> diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
> new file mode 100644
> index 00000000..2599d2f
> --- /dev/null
> +++ b/arch/riscv/include/asm/cpuidle.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __RISCV_CPUIDLE_H
> +#define __RISCV_CPUIDLE_H
> +
> +extern void cpu_do_idle(void);
> +
> +#endif
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index dc93710..396ba9c 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -29,6 +29,7 @@ obj-y += riscv_ksyms.o
>  obj-y  += stacktrace.o
>  obj-y  += cacheinfo.o
>  obj-y  += patch.o
> +obj-y  += cpuidle.o
>  obj-$(CONFIG_MMU) += vdso.o vdso/
>
>  obj-$(CONFIG_RISCV_M_MODE)     += traps_misaligned.o
> diff --git a/arch/riscv/kernel/cpuidle.c b/arch/riscv/kernel/cpuidle.c
> new file mode 100644
> index 00000000..a3289e7
> --- /dev/null
> +++ b/arch/riscv/kernel/cpuidle.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <asm/cpuidle.h>
> +
> +void cpu_do_idle(void)
> +{
> +       __asm__ __volatile__ ("wfi");
> +

You should directly use the wait_for_interrupt() macro defined
in asm/processor.h.

I think we don't need a separate kernel/cpuidle.c source file as
of now. Maybe in-future we can add if required.

I suggest making cpu_do_idle() as "static inline" in asm/cpuidle.h

This way you will only need asm/cpuidle.h for the current changes.

> +}
> diff --git a/drivers/cpuidle/Kconfig b/drivers/cpuidle/Kconfig
> index c0aeedd..f6be0fd 100644
> --- a/drivers/cpuidle/Kconfig
> +++ b/drivers/cpuidle/Kconfig
> @@ -62,6 +62,11 @@ depends on PPC
>  source "drivers/cpuidle/Kconfig.powerpc"
>  endmenu
>
> +menu "RISCV CPU Idle Drivers"
> +depends on RISCV
> +source "drivers/cpuidle/Kconfig.riscv"
> +endmenu
> +
>  config HALTPOLL_CPUIDLE
>         tristate "Halt poll cpuidle driver"
>         depends on X86 && KVM_GUEST
> diff --git a/drivers/cpuidle/Kconfig.riscv b/drivers/cpuidle/Kconfig.riscv
> new file mode 100644
> index 00000000..e86d36b
> --- /dev/null
> +++ b/drivers/cpuidle/Kconfig.riscv
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# RISCV CPU Idle drivers
> +#
> +config RISCV_CPUIDLE
> +        bool "Generic RISCV CPU idle Driver"
> +        select DT_IDLE_STATES
> +       select CPU_IDLE_MULTIPLE_DRIVERS
> +        help
> +          Select this option to enable generic cpuidle driver for RISCV.
> +         Now only support C0 State.
> diff --git a/drivers/cpuidle/Makefile b/drivers/cpuidle/Makefile
> index 26bbc5e..4c83c4e 100644
> --- a/drivers/cpuidle/Makefile
> +++ b/drivers/cpuidle/Makefile
> @@ -34,3 +34,7 @@ obj-$(CONFIG_MIPS_CPS_CPUIDLE)                += cpuidle-cps.o
>  # POWERPC drivers
>  obj-$(CONFIG_PSERIES_CPUIDLE)          += cpuidle-pseries.o
>  obj-$(CONFIG_POWERNV_CPUIDLE)          += cpuidle-powernv.o
> +
> +###############################################################################
> +# RISCV drivers
> +obj-$(CONFIG_RISCV_CPUIDLE)            += cpuidle-riscv.o
> diff --git a/drivers/cpuidle/cpuidle-riscv.c b/drivers/cpuidle/cpuidle-riscv.c
> new file mode 100644
> index 00000000..5dddcfa
> --- /dev/null
> +++ b/drivers/cpuidle/cpuidle-riscv.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISC-V CPU idle driver.
> + *
> + * Copyright (C) 2020-2022 Allwinner Ltd
> + *
> + * Based on code - driver/cpuidle/cpuidle-at91.c
> + *
> + */
> +#include <linux/cpuidle.h>
> +#include <linux/cpumask.h>
> +#include <linux/cpu_pm.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <asm/cpuidle.h>
> +
> +#define MAX_IDLE_STATES        1
> +
> +/* TODO: Implement deeper idle states */
> +static int riscv_low_level_suspend_enter(int state)
> +{

Shouldn't we call cpu_do_idle() here ???

> +       return 0;
> +}
> +
> +/* Actual code that puts the SoC in different idle states */
> +static int riscv_enter_idle(struct cpuidle_device *dev,
> +                       struct cpuidle_driver *drv,
> +                              int index)
> +{
> +       return CPU_PM_CPU_IDLE_ENTER_PARAM(riscv_low_level_suspend_enter,
> +                                          index, 0);
> +}
> +
> +static struct cpuidle_driver riscv_idle_driver = {
> +       .name                   = "riscv_idle",
> +       .owner                  = THIS_MODULE,
> +       .states[0]              = {
> +               .enter                  = riscv_enter_idle,
> +               .exit_latency           = 1,
> +               .target_residency       = 1,
> +               .name                   = "WFI",
> +               .desc                   = "RISCV WFI",
> +       },
> +       .state_count = MAX_IDLE_STATES,
> +};
> +
> +static int __init riscv_cpuidle_init(void)
> +{
> +       return cpuidle_register(&riscv_idle_driver, NULL);
> +}
> +
> +device_initcall(riscv_cpuidle_init);
> --
> 2.7.4
>

As a separate topic, I suggest you propose the
SBI_EXT_HSM_HART_SUSPEND call for SBI spec.

The generic RISC-V cpuidle driver can detect
SBI_EXT_HSM_HART_SUSPEND availability in
riscv_cpuidle_init(). The riscv_low_level_suspend_enter()
will do SBI_EXT_HSM_HART_SUSPEND call whenever
available otherwise it can simply call cpu_do_idle().

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB52C56201
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 16:28:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB61620B80
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 16:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IT/5TKwt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB61620B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6HMN+tR4uRGTeiTM0t3ahICR0CNqVuMpMNLieGOP41s=; b=IT/5TKwtnSjeoyyiVgLSaJPwD
	qfePVGCS4gEcfvkkxlUeRSknWu5TdFiYX6FHNvK8ZoNdcJXu9k4HR6rKsc4pXrwVmc0YllpWb32ZH
	/TD2YNC/82KeP6ySOaUS2alGHXM3RjAgjun/18+TUxYCqzULMS3ZSSRd1Th3sB0saoAYB8Hr3pkff
	T3V0NfSvy6arBFT8kwtJSmPKiOQ+JXP+aOc6fSSEK0ffc5I5HnL1nW+TN3OsL/94DNokHMWN0ox5y
	EJ3p4oDN8uKmOKrKQ26uiQDVEvW8xWV9r+fLlZdRSxLruXAyMbNXCnavuocbB0KkOw0dcBzdbqqA2
	1ctLpRuMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdFSR-0005QA-N5; Thu, 12 Nov 2020 16:28:23 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdFSP-0005PV-Pr
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 16:28:22 +0000
Received: by mail-oi1-f196.google.com with SMTP id u127so7015886oib.6
 for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2020 08:28:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xVkmZGVvtikkFdNcFf5aJnZ+zKHdkv+RuYhcq803DV0=;
 b=eshge7InhB/8sx95aGf+b2yqA5mUoRbRKeMEgjBynYUdaqB1q1RG4uvGEh/bSg71L0
 Je7RiOD1m6IqKWSk9UKQAUQn4H8+CD4MLfmMP2pZnw5qo4kd/j/hB8iIrNmR/sffptBh
 /UA1B5Wr67mPPA5GOrRH1f0ts/GtEr/ndY4KHF1byGmvplHH2RVJKj0wzzJbGrtN7Y9/
 SuXiNW2t5GpyoouukrEaGVMvWGySMrc3YBIgz6mdyiAc6m9nEQcZploUC7LL7xq2QVZM
 nPhvdVG9GYbGCAZQWaBRwt4QziXypf4S5dOXUyIKFyIyr8KoBAb08kcpwK1XXbSIOV18
 CJSw==
X-Gm-Message-State: AOAM533mcCfPlMbBCMVXeEWZ55dKCTXxupPlSWdjGJ2wXmjA0NYVBr7y
 S/izgOj5vCfSDgYH8qA56ZXmGoVPD08/CXwF9+A=
X-Google-Smtp-Source: ABdhPJwquNMw4w3BCjuJtYWxyxNKDiRQhbvewS6EVr2u1s2+mtSUV0JsefldotA13QPL9jO+lJtEefvMnjbDwjGMwLw=
X-Received: by 2002:aca:c4c9:: with SMTP id u192mr306660oif.69.1605198500721; 
 Thu, 12 Nov 2020 08:28:20 -0800 (PST)
MIME-Version: 1.0
References: <1601005600-32653-1-git-send-email-liush@allwinnertech.com>
In-Reply-To: <1601005600-32653-1-git-send-email-liush@allwinnertech.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 12 Nov 2020 17:28:09 +0100
Message-ID: <CAJZ5v0h-7Hc9MxeaqVSjOREYHfc+m2Bjxcuk9Q04d9b1r4zqVg@mail.gmail.com>
Subject: Re: [v3] cpuidle: add riscv cpuidle driver
To: liush <liush@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_112821_911633_2AB95B27 
X-CRM114-Status: GOOD (  36.66  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, amanieu@gmail.com,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux PM <linux-pm@vger.kernel.org>, anup.patel@wdc.com,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 guoren@linux.alibaba.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 linux-riscv@lists.infradead.org, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 25, 2020 at 5:46 AM liush <liush@allwinnertech.com> wrote:
>
> This patch adds a simple cpuidle driver for RISC-V systems using
> the WFI state. Other states will be supported in the future.
>
> Reported-by: kernel test robot <lkp@intel.com>

This isn't needed in a patch adding a new driver.

> Signed-off-by: liush <liush@allwinnertech.com>
> ---
> Changes in v3:
> - fix the issue reported by kernel test robot
>   "drivers/cpuidle/cpuidle-riscv.c:22:12: warning: no previous prototype
>    for 'riscv_low_level_suspend_enter' [-Wmissing-prototypes]"
> Changes in v2:
> - call "mb()" before run "WFI" in cpu_do_idle
> - modify commit description
> - place "select CPU_IDLE" in alphabetical order
> - replace "__asm__ __volatile__ ("wfi")" with "wait_for_interrupt()"
> - delete "cpuidle.c",move "cpu_do_idle()" to cpuidle.h
> - modify "arch_cpu_idle", "cpu_do_idle" can be called by
>   "arch_cpu_idle"
> - fix space/tab issues
> - modify riscv_low_level_suspend_enter to __weak mode
>
>  arch/riscv/Kconfig               |  7 +++++
>  arch/riscv/include/asm/cpuidle.h | 16 ++++++++++++
>  arch/riscv/kernel/process.c      |  3 ++-
>  drivers/cpuidle/Kconfig          |  5 ++++
>  drivers/cpuidle/Kconfig.riscv    | 11 ++++++++
>  drivers/cpuidle/Makefile         |  4 +++
>  drivers/cpuidle/cpuidle-riscv.c  | 55 ++++++++++++++++++++++++++++++++++++++++
>  7 files changed, 100 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/cpuidle.h
>  create mode 100644 drivers/cpuidle/Kconfig.riscv
>  create mode 100644 drivers/cpuidle/cpuidle-riscv.c
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index df18372..799bf86 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -33,6 +33,7 @@ config RISCV
>         select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>         select CLONE_BACKWARDS
>         select COMMON_CLK
> +       select CPU_IDLE
>         select EDAC_SUPPORT
>         select GENERIC_ARCH_TOPOLOGY if SMP
>         select GENERIC_ATOMIC64 if !64BIT
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
> index 00000000..599b810
> --- /dev/null
> +++ b/arch/riscv/include/asm/cpuidle.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __RISCV_CPUIDLE_H
> +#define __RISCV_CPUIDLE_H
> +
> +static inline void cpu_do_idle(void)
> +{
> +       /*
> +        * Add mb() here to ensure that all
> +        * IO/MEM access are completed prior
> +        * to enter WFI.
> +        */
> +       mb();

Either the comment isn't precise enough, or this may not work as expected.

The memory barrier prevents memory accesses occurring earlier in the
code flow from being reordered (by the processor or by the compiler)
after the function call below, but is this really needed?  That is,
can they be reordered anyway?  If so, then why?

> +       wait_for_interrupt();
> +}
> +
> +#endif
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 2b97c49..5431aaa 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -21,6 +21,7 @@
>  #include <asm/string.h>
>  #include <asm/switch_to.h>
>  #include <asm/thread_info.h>
> +#include <asm/cpuidle.h>
>
>  register unsigned long gp_in_global __asm__("gp");
>
> @@ -35,7 +36,7 @@ extern asmlinkage void ret_from_kernel_thread(void);
>
>  void arch_cpu_idle(void)
>  {
> -       wait_for_interrupt();
> +       cpu_do_idle();
>         local_irq_enable();
>  }
>
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
> index 00000000..7bec059
> --- /dev/null
> +++ b/drivers/cpuidle/Kconfig.riscv
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# RISCV CPU Idle drivers
> +#
> +config RISCV_CPUIDLE
> +       bool "Generic RISCV CPU idle Driver"
> +       select DT_IDLE_STATES
> +       select CPU_IDLE_MULTIPLE_DRIVERS
> +       help
> +         Select this option to enable generic cpuidle driver for RISCV.
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

I'm not sure why this is needed at all.

Because there is only one idle state, idx in __CPU_PM_CPU_IDLE_ENTER()
will always be 0, so it'll always call cpu_do_idle(), so can't it be
invoked directly from here?

And since the arch_cpu_idle() is also WFI, why is the full-blown
cpuidle driver needed at this point?

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

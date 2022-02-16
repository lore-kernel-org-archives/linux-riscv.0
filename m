Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D38C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 00:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyEqKfYGbaCao8HuYTOiwJ+qejbJl3WidubuOWCCUH0=; b=anLzgmLpSChS+i
	dKvxHCcnsgpblQUCt2WZLngoRqsMyWlV6fiPvD21sdI+dD/1/Yw21+wXATWWvfn/WRXBHdVrSAs1F
	SEi/hCHc1jX4LzCBYncRZxupDq+tAGeqmjyHeGAn5UOWKuib4DRdeyn7P7x2lyDnOfLdRpngZoWAE
	ZLiYmH2QsPifcXP6d3IJOflIB2QXzJo0730WRnL86BwVknrBcvvIOGmHWgTlFKFh3gB3Hme21mWpB
	D/DeQ7rzGgt4vUdO0TjwQF+Cix8MkmLsrsyLgB9NqiPF9/Wj3FhA7vyRyuRu+8OQUu407NX3Q8UlR
	WPpa6UbIqArW8j5egyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK8X3-0055zW-9k; Wed, 16 Feb 2022 00:50:57 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK8Wr-0055wt-H8
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 00:50:47 +0000
Received: by mail-yb1-xb31.google.com with SMTP id o19so1193119ybc.12
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 16:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18yu/FZC6YEfqqlag7jyriW5vrB8+cTbyqFvDzZCLG8=;
 b=m5LQ24g7yrUGMPrnK27dqe7h8K7PMML+kc3AYdjuLbCttuSnZSjrFawQgnI8h8+h1l
 QHs3tnwESiGMBTpQjgxnWPdVydoP9FV7bIXyTkN6uNw1Pzl53BKxnOwqjHf0jDfFwkyK
 kLObIYhW7r6uO/+vuUqzoiBQF6D0T2vJp00PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18yu/FZC6YEfqqlag7jyriW5vrB8+cTbyqFvDzZCLG8=;
 b=5EBU1R06e4C3QoRbXK5tXPbPyYw3pRloaRtC9Jh/x3GNVk3QM+JsmKMvA3Ewb1Mitr
 qca4zpm2qUDKcPrZOPieanjNig2eu4NB6qCOc0tWADpOGw9i1m87tXteOy89i1plzk09
 uQA3bjUo7UxHFjnWPluwutdhT880OeqT1J3y3l8yYpQmGjfvzpUREVhHCkSAxMv0Lzuh
 dQ7t7K0QuBeSypa5gllnzYUkdgA5hbsVbgGGrIZeL45OpA3w0kXVfD76I57GLvd1t48l
 lmHDjn1oUob5yhQIY2NzLD09sbiXgO4nDm0bp2oafHnyfUcyV/UqHTN6hPTNi30gPr1a
 Tv/A==
X-Gm-Message-State: AOAM533OuLMCQB/Nji3qSiqzHT2cBbNiGCh+chJVgSnkGXbQPASDMHGg
 pIXuP5r2sSeBS7ZbD0IJNLP/ZJgbMV34HAnbcNIp
X-Google-Smtp-Source: ABdhPJx67wiA2c7TRCt7KLNgmAukw1N2cuPI35FME1jEWpQi813t8VWMQWQ8NWmSSyx+WjEjM8rWelbT5PIMS9p4jHE=
X-Received: by 2002:a25:9388:0:b0:61d:6ff8:6472 with SMTP id
 a8-20020a259388000000b0061d6ff86472mr194270ybm.121.1644972644540; Tue, 15 Feb
 2022 16:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20220210054947.170134-1-apatel@ventanamicro.com>
 <20220210054947.170134-2-apatel@ventanamicro.com>
In-Reply-To: <20220210054947.170134-2-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 15 Feb 2022 16:50:33 -0800
Message-ID: <CAOnJCUKyzY_DNWqm32so0MOBcii1QCfF4KTq35Y06erALNx8Ug@mail.gmail.com>
Subject: Re: [PATCH v11 1/8] RISC-V: Enable CPU_IDLE drivers
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, Sandeep Tripathy <milun.tripathy@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 Anup Patel <anup@brainfault.org>, devicetree <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 kvm-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_165045_671525_FACE20B5 
X-CRM114-Status: GOOD (  21.91  )
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

On Wed, Feb 9, 2022 at 9:50 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> We force select CPU_PM and provide asm/cpuidle.h so that we can
> use CPU IDLE drivers for Linux RISC-V kernel.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@vetanamicro.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/Kconfig                |  7 +++++++
>  arch/riscv/configs/defconfig      |  1 +
>  arch/riscv/configs/rv32_defconfig |  1 +
>  arch/riscv/include/asm/cpuidle.h  | 24 ++++++++++++++++++++++++
>  arch/riscv/kernel/process.c       |  3 ++-
>  5 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/cpuidle.h
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 5adcbd9b5e88..76976d12b463 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -46,6 +46,7 @@ config RISCV
>         select CLONE_BACKWARDS
>         select CLINT_TIMER if !MMU
>         select COMMON_CLK
> +       select CPU_PM if CPU_IDLE
>         select EDAC_SUPPORT
>         select GENERIC_ARCH_TOPOLOGY if SMP
>         select GENERIC_ATOMIC64 if !64BIT
> @@ -547,4 +548,10 @@ source "kernel/power/Kconfig"
>
>  endmenu
>
> +menu "CPU Power Management"
> +
> +source "drivers/cpuidle/Kconfig"
> +
> +endmenu
> +
>  source "arch/riscv/kvm/Kconfig"
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index f120fcc43d0a..a5e0482a4969 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -20,6 +20,7 @@ CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_CPU_IDLE=y
>  CONFIG_VIRTUALIZATION=y
>  CONFIG_KVM=m
>  CONFIG_JUMP_LABEL=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 8b56a7f1eb06..d1b87db54d68 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -20,6 +20,7 @@ CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_CPU_IDLE=y
>  CONFIG_VIRTUALIZATION=y
>  CONFIG_KVM=m
>  CONFIG_JUMP_LABEL=y
> diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
> new file mode 100644
> index 000000000000..71fdc607d4bc
> --- /dev/null
> +++ b/arch/riscv/include/asm/cpuidle.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2021 Allwinner Ltd
> + * Copyright (C) 2021 Western Digital Corporation or its affiliates.
> + */
> +
> +#ifndef _ASM_RISCV_CPUIDLE_H
> +#define _ASM_RISCV_CPUIDLE_H
> +
> +#include <asm/barrier.h>
> +#include <asm/processor.h>
> +
> +static inline void cpu_do_idle(void)
> +{
> +       /*
> +        * Add mb() here to ensure that all
> +        * IO/MEM accesses are completed prior
> +        * to entering WFI.
> +        */
> +       mb();
> +       wait_for_interrupt();
> +}
> +
> +#endif
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 03ac3aa611f5..504b496787aa 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -23,6 +23,7 @@
>  #include <asm/string.h>
>  #include <asm/switch_to.h>
>  #include <asm/thread_info.h>
> +#include <asm/cpuidle.h>
>
>  register unsigned long gp_in_global __asm__("gp");
>
> @@ -37,7 +38,7 @@ extern asmlinkage void ret_from_kernel_thread(void);
>
>  void arch_cpu_idle(void)
>  {
> -       wait_for_interrupt();
> +       cpu_do_idle();
>         raw_local_irq_enable();
>  }
>
> --
> 2.25.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

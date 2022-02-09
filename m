Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E92C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 05:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTCqz8+266Bby/ccOlEF3l3x0oattTIA0fxXJaLDekU=; b=bslG3MK0fKzF2A
	mrZJO8Z4csvZV7kBZLk4wlF9LKm1W66YTbagUaaqG39UExsXMjEd0ngRZisnc1PM9K2o9UubyBqp6
	k3xlX+KGDs7pWnJAAzXpjTZeQByw3qD4PZQbo5fTjkGiSYqnNZZAu0Eex6vWVez+zeCUsS9Dgm8R0
	CoheNcIu5QOOGjzcJFGXxjK5LHRJue64RT/pq8wZZQRkD1NzwDJIR9WgaGTNx60t4pvsherR3FP9E
	Sbfes6xbaNgn5pYVbnwTaODhdLvJ7rhKD/EiunICTIuoCkk+CRdqAelSEFi7KvA7E7ThOlfd9NofQ
	NN302aBlNqNMBkizpfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHfKF-00GF5I-BB; Wed, 09 Feb 2022 05:15:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHfK2-00GF4B-HQ
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 05:15:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so772080wmb.0
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 21:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R83kg3J8lh5wnpwznu/c6c1j21tsi5+UW4ZNVbTpfkQ=;
 b=cQLt8iTabwlg2Ev6+vNAfrfaVsetuJTsCIXfsbWxN2KJQ58d0KT0yZirQMTcbt0NXE
 LOfXB+yowzcYh6fsRbs+oRvGDrIyudB2kSF8OJDHN3A6K3ERrtV52t9beearu5kOexbl
 R/AilxUl1TEcYp7coPdkyR+2dFjXdBhU/4jKHmOAsBkBREdBpjS7BJ5H1/TM7y8VY1k+
 geFLbW0Sot0MDg/GGIDq4Uc5Phh2KwSsIUry0D33+azOc/I+Dh+yY82X10zhxY91RO0J
 QSagJNSO2WAfgnvRxfYUQ3nOofM6gq8dOXjEYfRV99IN5qHnqkdG+8+9UZC7Qp+gs90d
 G67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R83kg3J8lh5wnpwznu/c6c1j21tsi5+UW4ZNVbTpfkQ=;
 b=49vfresMlFqBYw16khqu2Uuypa5JBrDUHcHiRyer9ppilDt3sj2YkljN9o+EDO3fN2
 mEMAfZbX5Ja4VNaQC9saIokbQGKQZZvnzcT1tfa99ZB++6FHoCtyGIDXh2jllz7yQ4Me
 /xS9sUUSKcvMfOSpiPWly2eplmFqRu6xm1PnWxz7tRo9qKWJA9hPKHx1kZv+ZeWtCiuH
 1nTqMDm3cluKc7MfuLZCIAI1pMrV+4JA9oLdnbvakX3BhLsiycvwc3N971An99twf9CM
 en18hG8EWJ90ag0PziVT00MN8u5bekGnnyHDy4vKT8Swz3a3iHgDciztIUWwT3fuYYoo
 cLkw==
X-Gm-Message-State: AOAM532tM6COiEaFI5vfdhbSuVAOntwB3+bvEtwknpcKzTpS7mESjozK
 8rc52Ew0XdjM7TNB/p88D2FGu0QtMjmMjZ89wrW5ew==
X-Google-Smtp-Source: ABdhPJxxJAmtus+XKgjkisjrqjjLqRFgSAIDZ/p0j1uNWEJQORypvJKDSShWADJ4LEAWxrxvnzgCy6iYR0zK2J9eq8E=
X-Received: by 2002:a05:600c:4185:: with SMTP id
 p5mr467679wmh.61.1644383716505; 
 Tue, 08 Feb 2022 21:15:16 -0800 (PST)
MIME-Version: 1.0
References: <20220126114452.692512-1-apatel@ventanamicro.com>
 <20220126114452.692512-2-apatel@ventanamicro.com>
 <CAJF2gTSwzx-yC=WvFixT96=q+M0KPzaZH5PpgGKVWg42M4GBNw@mail.gmail.com>
In-Reply-To: <CAJF2gTSwzx-yC=WvFixT96=q+M0KPzaZH5PpgGKVWg42M4GBNw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 9 Feb 2022 10:45:05 +0530
Message-ID: <CAAhSdy0DcB2+vJSEBd5apQhzjFBz9haNTVqqTeX92+hYVyhB2A@mail.gmail.com>
Subject: Re: [PATCH v10 1/8] RISC-V: Enable CPU_IDLE drivers
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_211518_655022_7CD61FE9 
X-CRM114-Status: GOOD (  30.55  )
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

On Tue, Feb 8, 2022 at 11:46 AM Guo Ren <guoren@kernel.org> wrote:
>
> Reviewed-by: Guo Ren <guoren@kernel.org>
>
> small questions:
>
> On Wed, Jan 26, 2022 at 7:46 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > From: Anup Patel <anup.patel@wdc.com>
> >
> > We force select CPU_PM and provide asm/cpuidle.h so that we can
> > use CPU IDLE drivers for Linux RISC-V kernel.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Anup Patel <apatel@vetanamicro.com>
> > ---
> >  arch/riscv/Kconfig                |  7 +++++++
> >  arch/riscv/configs/defconfig      |  1 +
> >  arch/riscv/configs/rv32_defconfig |  1 +
> >  arch/riscv/include/asm/cpuidle.h  | 24 ++++++++++++++++++++++++
> >  arch/riscv/kernel/process.c       |  3 ++-
> >  5 files changed, 35 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/riscv/include/asm/cpuidle.h
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 5adcbd9b5e88..76976d12b463 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -46,6 +46,7 @@ config RISCV
> >         select CLONE_BACKWARDS
> >         select CLINT_TIMER if !MMU
> >         select COMMON_CLK
> > +       select CPU_PM if CPU_IDLE
> >         select EDAC_SUPPORT
> >         select GENERIC_ARCH_TOPOLOGY if SMP
> >         select GENERIC_ATOMIC64 if !64BIT
> > @@ -547,4 +548,10 @@ source "kernel/power/Kconfig"
> >
> >  endmenu
> >
> > +menu "CPU Power Management"
> > +
> > +source "drivers/cpuidle/Kconfig"
> > +
> > +endmenu
> > +
> >  source "arch/riscv/kvm/Kconfig"
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index f120fcc43d0a..a5e0482a4969 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -20,6 +20,7 @@ CONFIG_SOC_SIFIVE=y
> >  CONFIG_SOC_VIRT=y
> >  CONFIG_SMP=y
> >  CONFIG_HOTPLUG_CPU=y
> > +CONFIG_CPU_IDLE=y
> >  CONFIG_VIRTUALIZATION=y
> >  CONFIG_KVM=m
> >  CONFIG_JUMP_LABEL=y
> > diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> > index 8b56a7f1eb06..d1b87db54d68 100644
> > --- a/arch/riscv/configs/rv32_defconfig
> > +++ b/arch/riscv/configs/rv32_defconfig
> > @@ -20,6 +20,7 @@ CONFIG_SOC_VIRT=y
> >  CONFIG_ARCH_RV32I=y
> >  CONFIG_SMP=y
> >  CONFIG_HOTPLUG_CPU=y
> > +CONFIG_CPU_IDLE=y
> >  CONFIG_VIRTUALIZATION=y
> >  CONFIG_KVM=m
> >  CONFIG_JUMP_LABEL=y
> > diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
> > new file mode 100644
> > index 000000000000..71fdc607d4bc
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/cpuidle.h
> > @@ -0,0 +1,24 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2021 Allwinner Ltd
> > + * Copyright (C) 2021 Western Digital Corporation or its affiliates.
> > + */
> > +
> > +#ifndef _ASM_RISCV_CPUIDLE_H
> > +#define _ASM_RISCV_CPUIDLE_H
> > +
> > +#include <asm/barrier.h>
> > +#include <asm/processor.h>
> > +
> > +static inline void cpu_do_idle(void)
> > +{
> > +       /*
> > +        * Add mb() here to ensure that all
> > +        * IO/MEM accesses are completed prior
> > +        * to entering WFI.
> > +        */
> > +       mb();
> I think it's a separate fixup.

This one is tricky to move as separate fixup because there
is no cpu_do_idle() until this patch adds it.

If we deliberately have a separate patch for "mb()" then it
will be only fixing cpu_do_idle() function added by previous
patch in the same series.

Regards,
Anup

>
> > +       wait_for_interrupt();
> > +}
> > +
> > +#endif
> > diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> > index 03ac3aa611f5..504b496787aa 100644
> > --- a/arch/riscv/kernel/process.c
> > +++ b/arch/riscv/kernel/process.c
> > @@ -23,6 +23,7 @@
> >  #include <asm/string.h>
> >  #include <asm/switch_to.h>
> >  #include <asm/thread_info.h>
> > +#include <asm/cpuidle.h>
> >
> >  register unsigned long gp_in_global __asm__("gp");
> >
> > @@ -37,7 +38,7 @@ extern asmlinkage void ret_from_kernel_thread(void);
> >
> >  void arch_cpu_idle(void)
> >  {
> maybe below is enough.
> + mb();
>    wait_for_interrupt();
>
> > -       wait_for_interrupt();
> > +       cpu_do_idle();
>
>
> >         raw_local_irq_enable();
> >  }
> >
> > --
> > 2.25.1
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

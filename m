Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD08C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 05:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3fRsiCaad5Ex8m8nmurUVzp/za8NXMteSGtYW179Cw=; b=CdyAEIsf1ZbTbY
	V/0nDpA6Z2RRDK6eHz+CWjmBdwvo/yR6O1F85K0IsV58pB+LHM1FR96mtHiF8wCp76inNnBPiB9qU
	gPXWdWyvpcWuIG19U+CqJECtMPNyeDXJPFcvFkYIV+UXk6qpJiWIkhbQD1nejAqXlFrcza7O58oed
	yTq20GEh4Mf2naiGoV28V+VYSScwwplbpo1slZlmg+P3f2Qtg1LvqY/eqt6k8cTCTCAm5SO5YkZhd
	YkqbRgNMYRv1FU24IESrmdBu8bJixobhQhmJ6J1DFFUcfZZEylfBSorwkrpaAxXPvy44eeyLtgnic
	7LD11SFrJVOlMMciUFIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHfPR-00GFWf-Gz; Wed, 09 Feb 2022 05:20:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHfPF-00GFUZ-6p
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 05:20:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so777925wmb.0
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 21:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wAsSnnD9JIeAeZJ9p3BQTgq96g2Q9LHlXoe8+WeEVfI=;
 b=1tKXU6TXAd28+p0tvCpH0D5QBomKCxkddDWl5LVsYFX8hIdbe6CzV6wuulBu+sQEps
 AeaTcuXTxF9e8cIPmKTyUX9QS/MLzuiJ3poPshrD3N/JwthsFwtR7IqmJ/qp78VdQzKC
 EXqidiNi/RX6zBYFOA0F0nOb+555/L5wYmFW+TC4IxgMpILOkbFejGn9NmToUD47VYv6
 VODXl9hVeDhlGEWLaNdgOkZgRtBATLz3GRtmkcoO1HawYxr03sK0DnYLDDdfYEJ4uErA
 Jtbl/MdVrVMc95sx7r0egcRaQ5U2Mm2BKbFsBg2cO/Jq5juetaFMNFhUAyh1A0Te5JOo
 C15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wAsSnnD9JIeAeZJ9p3BQTgq96g2Q9LHlXoe8+WeEVfI=;
 b=X8BkFFRDy5A5DdUBKunUABb1dZM3RNZYvkN9G94I8Bd8221V/rch0GWfmIVv99Y5AU
 fp/ynUhknXH+pH7GR81Al8RSLCAHikCEA5zYzeE04ZuMS2o3S/edIhvwsKv3i2vsDlcF
 39FTrEoZfgaFpMTKuch6gtgbHFRxsgXAl1fh1Yi1p2UqGP0OlX8RQOJm0HLlujHr/JKO
 kDL8MCTCtNLbf9ckyS8poATuQ86rzL2ORpfjdptM97jaLj5+Dave2OHUV/zSl+IXY4vX
 kp7+guxoSL182vXPZYplDKKjsEkfinCi7696MaFdO+gNudU8PARK2fTj72JM9512eAU5
 om+Q==
X-Gm-Message-State: AOAM530grMjWhl2r4DlTuq2f20qfoaMVABKXDW9E79vBvIqEdhdhs9/O
 2Mm/vGxm6bKnkoNfUzNiEukqGIT45kuDlLpEHuSizQ==
X-Google-Smtp-Source: ABdhPJzHE/r6P/Etiunn5Sn/mWZbmE+jczRf1EpGH91d7ufK0qYetKSekneRBxf/FBI5rfOD4EPdrW88BHZPAe+N0xw=
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr496193wmk.59.1644384039591;
 Tue, 08 Feb 2022 21:20:39 -0800 (PST)
MIME-Version: 1.0
References: <20220126114452.692512-1-apatel@ventanamicro.com>
 <20220126114452.692512-2-apatel@ventanamicro.com>
 <CAJF2gTSwzx-yC=WvFixT96=q+M0KPzaZH5PpgGKVWg42M4GBNw@mail.gmail.com>
In-Reply-To: <CAJF2gTSwzx-yC=WvFixT96=q+M0KPzaZH5PpgGKVWg42M4GBNw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 9 Feb 2022 10:50:28 +0530
Message-ID: <CAAhSdy2onHRmnj6g6Swp86DL-nHJyv0r_KsUupatjHx11J11LA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220208_212041_266779_51B127A8 
X-CRM114-Status: GOOD (  29.80  )
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

We can't add "mb()" here because cpu_do_idle() is called
directly from linux/cpuidle.h and arch_cpu_idle() is only
called when CPU idle is disabled.

Regards,
Anup

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

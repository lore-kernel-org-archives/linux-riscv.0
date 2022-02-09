Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1B7C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 06:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BIItYQDvYIEAqoz5dnOC5UycDP9i/GVtSq7hzsAMMy0=; b=P917AVLlNQMHli
	7uKY6K4DvJ9jx0skj/fuJ/L6+VqBWkEFtSrpIlLGEBFHOFko6FtPQnwLZ1sSTVdipZjw7ypZMerqK
	5QXbwbRwyjxbbSPVMG08QkQbGqiUMBnTbzb2SDPwDYRz0kyEn5zKIPkUyq0VNg+UHPC9zwhNovj32
	5ETo9veDwTxIYNIM8n7DDq4grT85bb6Sxbcj6iPBIu9pWvygk93iYvhU2Hna9Z0DkeNDZtHHqN6Kx
	aNcQ++ApurH3mkc+6GunQl5poM41+FVxMQ1AZIXpnMD+K2yJ5l9BBsomOXh8Udba61lMgveqiCj7R
	3fFPngHiX4IdpoSiK49Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHg1l-00GIcf-FY; Wed, 09 Feb 2022 06:00:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHg1Z-00GIbW-ED; Wed, 09 Feb 2022 06:00:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C0F561687;
 Wed,  9 Feb 2022 06:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84545C340F8;
 Wed,  9 Feb 2022 06:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644386414;
 bh=H1Il4OnrZcVzTgnRCSfIq6w+2cA8lG5GY5uvlt5naWQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Qtkir0ujjb3mIuWq7ct9FTz1yRDsLAWnTNN3gaiC/I8cPPPCuezabteArA7REpv7F
 KycdMcfVAsPHB25wa3B8wIzZmErdwXbJWeojnfz2e/FN3kRCgPoWhpzuR53iXc1Zdl
 4LaiXrFP9RKO+1pHDtfwPVyR5EgwswdNl263d3zGaRsiRQQYm3uTpx8AWvJMgVYfWD
 jLdD6o94RMOEVu1kS8GE+FY8/7qmB8Xs6JTNx+i2x+XKN4rg4rsorPNtam+Jm4KAIN
 W9D1+yLFUCVwBkY4hbGXlTxiLS+NObLhQ6VbjFG4BBY5WhzpR6DPgcgztPfBK76Qvg
 /WWmFgfjXLRLA==
Received: by mail-vs1-f53.google.com with SMTP id a19so1463287vsi.2;
 Tue, 08 Feb 2022 22:00:14 -0800 (PST)
X-Gm-Message-State: AOAM533Z1UOMAqluVN16/hwlfqIP6Qd82Z1BGBpTsk8SiqixmDO4SZAo
 DsARtrtDSI/wu8tKpAYH9ueHjgk7rUbyO80/zAQ=
X-Google-Smtp-Source: ABdhPJx7IxmUfwBXIDyqbMr6LV1Uy4FTIuhRCLFMgyRqUGbgmGiKMiWYLu9DY913QWMQFaNwyWxJN7W1AENziNBBsuI=
X-Received: by 2002:a67:e0d9:: with SMTP id m25mr200489vsl.51.1644386413208;
 Tue, 08 Feb 2022 22:00:13 -0800 (PST)
MIME-Version: 1.0
References: <20220126114452.692512-1-apatel@ventanamicro.com>
 <20220126114452.692512-2-apatel@ventanamicro.com>
 <CAJF2gTSwzx-yC=WvFixT96=q+M0KPzaZH5PpgGKVWg42M4GBNw@mail.gmail.com>
 <CAAhSdy0DcB2+vJSEBd5apQhzjFBz9haNTVqqTeX92+hYVyhB2A@mail.gmail.com>
In-Reply-To: <CAAhSdy0DcB2+vJSEBd5apQhzjFBz9haNTVqqTeX92+hYVyhB2A@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 9 Feb 2022 14:00:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRy_VNBAW94KoeAcBWH52ac+PE0H8Km17kKuyUy1NsfDQ@mail.gmail.com>
Message-ID: <CAJF2gTRy_VNBAW94KoeAcBWH52ac+PE0H8Km17kKuyUy1NsfDQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/8] RISC-V: Enable CPU_IDLE drivers
To: Anup Patel <anup@brainfault.org>
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
X-CRM114-CacheID: sfid-20220208_220017_580331_9AC57C44 
X-CRM114-Status: GOOD (  36.29  )
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

On Wed, Feb 9, 2022 at 1:15 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Feb 8, 2022 at 11:46 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > Reviewed-by: Guo Ren <guoren@kernel.org>
> >
> > small questions:
> >
> > On Wed, Jan 26, 2022 at 7:46 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > >
> > > From: Anup Patel <anup.patel@wdc.com>
> > >
> > > We force select CPU_PM and provide asm/cpuidle.h so that we can
> > > use CPU IDLE drivers for Linux RISC-V kernel.
> > >
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > Signed-off-by: Anup Patel <apatel@vetanamicro.com>
> > > ---
> > >  arch/riscv/Kconfig                |  7 +++++++
> > >  arch/riscv/configs/defconfig      |  1 +
> > >  arch/riscv/configs/rv32_defconfig |  1 +
> > >  arch/riscv/include/asm/cpuidle.h  | 24 ++++++++++++++++++++++++
> > >  arch/riscv/kernel/process.c       |  3 ++-
> > >  5 files changed, 35 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/riscv/include/asm/cpuidle.h
> > >
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 5adcbd9b5e88..76976d12b463 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -46,6 +46,7 @@ config RISCV
> > >         select CLONE_BACKWARDS
> > >         select CLINT_TIMER if !MMU
> > >         select COMMON_CLK
> > > +       select CPU_PM if CPU_IDLE
> > >         select EDAC_SUPPORT
> > >         select GENERIC_ARCH_TOPOLOGY if SMP
> > >         select GENERIC_ATOMIC64 if !64BIT
> > > @@ -547,4 +548,10 @@ source "kernel/power/Kconfig"
> > >
> > >  endmenu
> > >
> > > +menu "CPU Power Management"
> > > +
> > > +source "drivers/cpuidle/Kconfig"
> > > +
> > > +endmenu
> > > +
> > >  source "arch/riscv/kvm/Kconfig"
> > > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > > index f120fcc43d0a..a5e0482a4969 100644
> > > --- a/arch/riscv/configs/defconfig
> > > +++ b/arch/riscv/configs/defconfig
> > > @@ -20,6 +20,7 @@ CONFIG_SOC_SIFIVE=y
> > >  CONFIG_SOC_VIRT=y
> > >  CONFIG_SMP=y
> > >  CONFIG_HOTPLUG_CPU=y
> > > +CONFIG_CPU_IDLE=y
> > >  CONFIG_VIRTUALIZATION=y
> > >  CONFIG_KVM=m
> > >  CONFIG_JUMP_LABEL=y
> > > diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> > > index 8b56a7f1eb06..d1b87db54d68 100644
> > > --- a/arch/riscv/configs/rv32_defconfig
> > > +++ b/arch/riscv/configs/rv32_defconfig
> > > @@ -20,6 +20,7 @@ CONFIG_SOC_VIRT=y
> > >  CONFIG_ARCH_RV32I=y
> > >  CONFIG_SMP=y
> > >  CONFIG_HOTPLUG_CPU=y
> > > +CONFIG_CPU_IDLE=y
> > >  CONFIG_VIRTUALIZATION=y
> > >  CONFIG_KVM=m
> > >  CONFIG_JUMP_LABEL=y
> > > diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
> > > new file mode 100644
> > > index 000000000000..71fdc607d4bc
> > > --- /dev/null
> > > +++ b/arch/riscv/include/asm/cpuidle.h
> > > @@ -0,0 +1,24 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright (C) 2021 Allwinner Ltd
> > > + * Copyright (C) 2021 Western Digital Corporation or its affiliates.
> > > + */
> > > +
> > > +#ifndef _ASM_RISCV_CPUIDLE_H
> > > +#define _ASM_RISCV_CPUIDLE_H
> > > +
> > > +#include <asm/barrier.h>
> > > +#include <asm/processor.h>
> > > +
> > > +static inline void cpu_do_idle(void)
> > > +{
> > > +       /*
> > > +        * Add mb() here to ensure that all
> > > +        * IO/MEM accesses are completed prior
> > > +        * to entering WFI.
> > > +        */
> > > +       mb();
> > I think it's a separate fixup.
>
> This one is tricky to move as separate fixup because there
> is no cpu_do_idle() until this patch adds it.
>
> If we deliberately have a separate patch for "mb()" then it
> will be only fixing cpu_do_idle() function added by previous
> patch in the same series.
You are right, I misunderstood the usage of asm/cpuidle.h.

>
> Regards,
> Anup
>
> >
> > > +       wait_for_interrupt();
> > > +}
> > > +
> > > +#endif
> > > diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> > > index 03ac3aa611f5..504b496787aa 100644
> > > --- a/arch/riscv/kernel/process.c
> > > +++ b/arch/riscv/kernel/process.c
> > > @@ -23,6 +23,7 @@
> > >  #include <asm/string.h>
> > >  #include <asm/switch_to.h>
> > >  #include <asm/thread_info.h>
> > > +#include <asm/cpuidle.h>
> > >
> > >  register unsigned long gp_in_global __asm__("gp");
> > >
> > > @@ -37,7 +38,7 @@ extern asmlinkage void ret_from_kernel_thread(void);
> > >
> > >  void arch_cpu_idle(void)
> > >  {
> > maybe below is enough.
> > + mb();
> >    wait_for_interrupt();
> >
> > > -       wait_for_interrupt();
> > > +       cpu_do_idle();
> >
> >
> > >         raw_local_irq_enable();
> > >  }
> > >
> > > --
> > > 2.25.1
> > >
> > >
> > > --
> > > kvm-riscv mailing list
> > > kvm-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/kvm-riscv
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

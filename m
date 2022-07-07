Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BE8C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 09:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOjjaeYqR3w2CGfxuAk80FUXy+3Ics5FFaSqk6PKauA=; b=y2j6lhwm8iCI7/
	KvlG0I4NM+R05nPLKmEgq/p9dYxrmscnpUmkBf5AAjUXWPmYWvCVuc6ygFwzJMfi8gUSiHNnT7v7z
	e3W/ObWluUK6S4uXWjBlZVgqIHD6uWOsNtnCF4Fgz+kqVqGATbZ+EcirRPOjFtge7FEtyun21BlaK
	l1b4KhfJUlDGDKqhOCqdNowKYN/m9T2H50FF8whA5kBSj5oq/CwzJQk2So1n+/PMGeWo8EAg+V+4j
	+q59e2E/MqqL7Z+P0KBPcII1q/cTjjAQ2dayzZv7Fwll74wys66Zqum1uKGtNAYQ2baCtAKuZLKXc
	KeyZmOD0MirT1CYWmDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9O8L-00FSij-Jz; Thu, 07 Jul 2022 09:49:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9O8I-00FSiA-R6
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 09:49:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DF301063;
	Thu,  7 Jul 2022 02:49:12 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3D023F792;
	Thu,  7 Jul 2022 02:49:07 -0700 (PDT)
Date: Thu, 7 Jul 2022 10:47:56 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Conor Dooley <mail@conchuod.ie>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jonas Hahnfeld <hahnjo@hahnjo.de>, Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Changbin Du <changbin.du@intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: Re: [PATCH] riscv: arch-topology: fix default topology reporting
Message-ID: <20220707094756.rftfann3rcixdfp4@bogus>
References: <20220706184558.2557301-1-mail@conchuod.ie>
 <CAOnJCUL-RCkXi=1GSEipYmf1qMxkOASr_H65kGU+5c=AqJBZKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCUL-RCkXi=1GSEipYmf1qMxkOASr_H65kGU+5c=AqJBZKA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_024915_017098_276DD7A5 
X-CRM114-Status: GOOD (  33.52  )
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

On Wed, Jul 06, 2022 at 02:38:01PM -0700, Atish Patra wrote:
> On Wed, Jul 6, 2022 at 11:46 AM Conor Dooley <mail@conchuod.ie> wrote:
> >
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > RISC-V has no sane defaults to fall back on where there is no cpu-map
> > in the devicetree.
> > Without sane defaults, the package, core and thread IDs are all set to
> > -1. This causes user-visible inaccuracies for tools like hwloc/lstopo
> > which rely on the sysfs cpu topology files to detect a system's
> > topology.
> >
> > Add sane defaults in ~the exact same way as ARM64.
> >
> > CC: stable@vger.kernel.org
> > Fixes: 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
> > Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
> > Link: https://github.com/open-mpi/hwloc/issues/536
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >
> > Sudeep suggested that this be backported rather than the changes to
> > the devicetrees adding cpu-map since that property is optional.
> > That patchset is still valid in it's own right.
> >
> >  arch/riscv/include/asm/topology.h | 13 +++++++++++++
> >  arch/riscv/kernel/Makefile        |  1 +
> >  arch/riscv/kernel/smpboot.c       |  4 ++++
> >  arch/riscv/kernel/topology.c      | 32 +++++++++++++++++++++++++++++++
> >  4 files changed, 50 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/topology.h
> >  create mode 100644 arch/riscv/kernel/topology.c
> >
> > diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
> > new file mode 100644
> > index 000000000000..36bc6ecda898
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/topology.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
> > + */
> > +
> > +#ifndef _ASM_RISCV_TOPOLOGY_H
> > +#define _ASM_RISCV_TOPOLOGY_H
> > +
> > +#include <asm-generic/topology.h>
> > +
> > +void store_cpu_topology(unsigned int cpuid);
> > +
> > +#endif /* _ASM_RISCV_TOPOLOGY_H */
> > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > index c71d6591d539..9518882ba6f9 100644
> > --- a/arch/riscv/kernel/Makefile
> > +++ b/arch/riscv/kernel/Makefile
> > @@ -50,6 +50,7 @@ obj-y += riscv_ksyms.o
> >  obj-y  += stacktrace.o
> >  obj-y  += cacheinfo.o
> >  obj-y  += patch.o
> > +obj-y  += topology.o
> >  obj-y  += probes/
> >  obj-$(CONFIG_MMU) += vdso.o vdso/
> >
> > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > index f1e4948a4b52..d551c7f452d4 100644
> > --- a/arch/riscv/kernel/smpboot.c
> > +++ b/arch/riscv/kernel/smpboot.c
> > @@ -32,6 +32,7 @@
> >  #include <asm/sections.h>
> >  #include <asm/sbi.h>
> >  #include <asm/smp.h>
> > +#include <asm/topology.h>
> >
> >  #include "head.h"
> >
> > @@ -40,6 +41,8 @@ static DECLARE_COMPLETION(cpu_running);
> >  void __init smp_prepare_boot_cpu(void)
> >  {
> >         init_cpu_topology();
> > +
> > +       store_cpu_topology(smp_processor_id());
> >  }
> >
> >  void __init smp_prepare_cpus(unsigned int max_cpus)
> > @@ -161,6 +164,7 @@ asmlinkage __visible void smp_callin(void)
> >         mmgrab(mm);
> >         current->active_mm = mm;
> >
> > +       store_cpu_topology(curr_cpuid);
> >         notify_cpu_starting(curr_cpuid);
> >         numa_add_cpu(curr_cpuid);
> >         update_siblings_masks(curr_cpuid);
> > diff --git a/arch/riscv/kernel/topology.c b/arch/riscv/kernel/topology.c
> > new file mode 100644
> > index 000000000000..db72862bd5b5
> > --- /dev/null
> > +++ b/arch/riscv/kernel/topology.c
> > @@ -0,0 +1,32 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
> > + *
> > + * Based on the arm64 version, which was in turn based on arm32, which was
> > + * ultimately based on sh's.
> > + * The arm64 version was listed as:
> > + * Copyright (C) 2011,2013,2014 Linaro Limited.
> > + */
> > +
> > +#include <linux/arch_topology.h>
> > +#include <linux/topology.h>
> > +#include <asm/topology.h>
> > +
> > +void store_cpu_topology(unsigned int cpuid)
> > +{
> > +       struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
> > +
> > +       if (cpuid_topo->package_id != -1)
> > +               goto topology_populated;
> > +
> > +       cpuid_topo->thread_id = -1;
> > +       cpuid_topo->core_id = cpuid;
> > +       cpuid_topo->package_id = cpu_to_node(cpuid);
> > +
> > +       pr_debug("CPU%u: package %d core %d thread %d\n",
> > +                cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
> > +                cpuid_topo->thread_id);
> > +
> > +topology_populated:
> > +       update_siblings_masks(cpuid);
> > +}
> >
> 
> This function is pretty much the same as the arm64 one except the
> UP/mpidr check.
> Can we move this to the common code as well ?
>

While I completely agree with the idea, not sure if that makes backports
(if required) any difficult. If so, I would rather keep this way for a
release and then move both to the common place in arch_topology.

> > base-commit: b6f1f2fa2bddd69ff46a190b8120bd440fd50563
> > --
> > 2.37.0
> >
> 
> 
> -- 
> Regards,
> Atish

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

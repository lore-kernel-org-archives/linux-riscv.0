Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E16C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 11:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtDAyUV/w8fq/wgObZSjmU/etXm8Lx409tyKKmLpiuQ=; b=P/0jegnoIJWmll
	wK1JIRGNt8pZDhSfLIqTtkTQBpKCRXUXade80m36fEN49GWm97AuigiBuKLFn3Sr4TLkIr4mglghn
	GSmAFBQEml0HDTZz6fMqH2h5C2CVHIb443nCx6k8lOf5FVVsXa8zrBi5lfqhlj3FXbhdh7Z+GSqRb
	i5z4qOhCTNtRvN1Q4aH8XCDtkTAXawFpSi0dHuruTsnhc7sIlODrqtbBLg92x2bQtjJM0q+zIwWr/
	8ezSr5q/moEQYuVjw911BpXwXwO8tP+ieJtvFTPBLLfrG47K0zpZmDAIi9G2iKs+L8Lky4QmdzX2H
	TGcrsvIOrhmKpJUBnRMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o931C-009Knc-8Q; Wed, 06 Jul 2022 11:16:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91tp-0087nj-NM
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 10:04:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1EB81042;
	Wed,  6 Jul 2022 03:04:47 -0700 (PDT)
Received: from bogus (unknown [10.57.39.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8046E3F66F;
	Wed,  6 Jul 2022 03:04:44 -0700 (PDT)
Date: Wed, 6 Jul 2022 11:03:33 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Conor.Dooley@microchip.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	Daire.McNamara@microchip.com, niklas.cassel@wdc.com,
	damien.lemoal@opensource.wdc.com, geert@linux-m68k.org,
	zong.li@sifive.com, kernel@esmil.dk, hahnjo@hahnjo.de,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Brice.Goglin@inria.fr
Subject: Re: [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Message-ID: <20220706100333.7n35rfnbdrnz6mh5@bogus>
References: <20220705190435.1790466-1-mail@conchuod.ie>
 <20220705201931.nfwi5rlku7ykmydr@bogus>
 <8f07796a-d9a2-3301-aafb-7fbec4d5b1a2@microchip.com>
 <fb7be22c-cf19-0e06-f231-bb5b9167e179@microchip.com>
 <20220706092126.k6zaknwcwzyg22ak@bogus>
 <9f26cd2a-b389-3f4b-b7d2-06fa5c2d7016@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f26cd2a-b389-3f4b-b7d2-06fa5c2d7016@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_030449_943086_BF5F5904 
X-CRM114-Status: GOOD (  39.75  )
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

On Wed, Jul 06, 2022 at 09:43:02AM +0000, Conor.Dooley@microchip.com wrote:
> 
> 
> On 06/07/2022 10:21, Sudeep Holla wrote:
> > On Tue, Jul 05, 2022 at 11:03:54PM +0000, Conor.Dooley@microchip.com wrote:
> >>
> >>
> >> On 05/07/2022 21:33, Conor.Dooley@microchip.com wrote:
> >>>
> >>>
> >>> On 05/07/2022 21:19, Sudeep Holla wrote:
> >>>> On Tue, Jul 05, 2022 at 08:04:31PM +0100, Conor Dooley wrote:
> >>>>> From: Conor Dooley <conor.dooley@microchip.com>
> >>>>>
> >>>>> It was reported to me that the Hive Unmatched incorrectly reports
> >>>>> its topology to hwloc, but the StarFive VisionFive did in [0] &
> >>>>> a subsequent off-list email from Brice (the hwloc maintainer).
> >>>>> This turned out not to be entirely true, the /downstream/ version
> >>>>> of the VisionFive does work correctly but not upstream, as the
> >>>>> downstream devicetree has a cpu-map node that was added recently.
> >>>>>
> >>>>> This series adds a cpu-map node to all upstream devicetrees, which
> >>>>> I have tested on mpfs & fu540. The first patch is lifted directly
> >>>>> from the downstream StarFive devicetree.
> >>>>>
> >>>>
> >>>> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> >>>>
> >>>> I would recommend to have sane defaults in core risc-v code in case of
> >>>> absence of /cpu-map node as it is optional. The reason I mentioned is that
> >>>> Conor mentioned how the default values in absence of the node looked quite
> >>>> wrong. I don't know if it is possible on RISC-V but on ARM64 we do have
> >>>> default values if arch_topology fails to set based on DT/ACPI.
> >>>>
> >>>
> >>> Yeah the defaults are all -1. I'll add some sane defaults for a v2.
> >>> Thanks,
> >>> Conor.
> >>
> >> I shamelessly stole from arm64... Seems to work, but have done minimal
> >> testing (only PolarFire SoC).
> >>
> >> Author: Conor Dooley <conor.dooley@microchip.com>
> >> Date:   Wed Jul 6 00:00:34 2022 +0100
> >>
> >>      riscv: arch-topology: add sane defaults
> >>      
> >>      RISC-V has no sane defaults to fall back on where there is no cpu-map
> >>      in the devicetree. Add sane defaults in ~the exact same way as ARM64.
> >>      
> >>      Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
> >> new file mode 100644
> >> index 000000000000..71c80710f00e
> >> --- /dev/null
> >> +++ b/arch/riscv/include/asm/topology.h
> >> @@ -0,0 +1,13 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only */
> >> +/*
> >> + * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
> >> + */
> >> +
> >> +#ifndef _ASM_RISCV_TOPOLOGY_H
> >> +#define _ASM_RISCV_TOPOLOGY_H
> >> +
> >> +#include <asm-generic/topology.h>
> >> +
> >> +void store_cpu_topology(unsigned int cpuid);
> >> +
> >> +#endif /* _ASM_RISCV_TOPOLOGY_H */
> >> \ No newline at end of file
> >> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> >> index c71d6591d539..9518882ba6f9 100644
> >> --- a/arch/riscv/kernel/Makefile
> >> +++ b/arch/riscv/kernel/Makefile
> >> @@ -50,6 +50,7 @@ obj-y += riscv_ksyms.o
> >>   obj-y  += stacktrace.o
> >>   obj-y  += cacheinfo.o
> >>   obj-y  += patch.o
> >> +obj-y  += topology.o
> >>   obj-y  += probes/
> >>   obj-$(CONFIG_MMU) += vdso.o vdso/
> >>   
> >> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> >> index f1e4948a4b52..d551c7f452d4 100644
> >> --- a/arch/riscv/kernel/smpboot.c
> >> +++ b/arch/riscv/kernel/smpboot.c
> >> @@ -32,6 +32,7 @@
> >>   #include <asm/sections.h>
> >>   #include <asm/sbi.h>
> >>   #include <asm/smp.h>
> >> +#include <asm/topology.h>
> >>   
> >>   #include "head.h"
> >>   
> >> @@ -40,6 +41,8 @@ static DECLARE_COMPLETION(cpu_running);
> >>   void __init smp_prepare_boot_cpu(void)
> >>   {
> >>          init_cpu_topology();
> >> +
> >> +       store_cpu_topology(smp_processor_id());
> >>   }
> >>   
> >>   void __init smp_prepare_cpus(unsigned int max_cpus)
> >> @@ -161,6 +164,7 @@ asmlinkage __visible void smp_callin(void)
> >>          mmgrab(mm);
> >>          current->active_mm = mm;
> >>   
> >> +       store_cpu_topology(curr_cpuid);
> >>          notify_cpu_starting(curr_cpuid);
> >>          numa_add_cpu(curr_cpuid);
> >>          update_siblings_masks(curr_cpuid);
> >> diff --git a/arch/riscv/kernel/topology.c b/arch/riscv/kernel/topology.c
> >> new file mode 100644
> >> index 000000000000..799b3423e0bc
> >> --- /dev/null
> >> +++ b/arch/riscv/kernel/topology.c
> >> @@ -0,0 +1,30 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Based on the arm64 version, which was in turn based on arm32, which was
> >> + * ultimately based on sh's.
> >> + * The arm64 version was listed as:
> >> + * Copyright (C) 2011,2013,2014 Linaro Limited.
> >> + *
> >> + */
> >> +#include <linux/arch_topology.h>
> >> +#include <linux/topology.h>
> >> +#include <asm/topology.h>
> >> +
> >> +void store_cpu_topology(unsigned int cpuid)
> >> +{
> >> +       struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
> >> +
> >> +       if (cpuid_topo->package_id != -1)
> >> +               goto topology_populated;
> >> +
> >> +       cpuid_topo->thread_id = -1;
> >> +       cpuid_topo->core_id = cpuid;
> >> +       cpuid_topo->package_id = cpu_to_node(cpuid);
> >> +
> >> +       pr_info("CPU%u: cluster %d core %d thread %d\n",
> >> +                cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
> >> +                cpuid_topo->thread_id);
> >> +
> >> +topology_populated:
> >> +       update_siblings_masks(cpuid);
> >> +}
> >>
> > 
> > Looks good. Again package id is not cluster. This is what my series is
> > addressing. So update the log as Package instead of Cluster above. The
> > cluster id will be -1 unless you can get that for DT.
> 
> 
> Cool, I'll respin a v2 without this included then & get the series
> backported since this is user visible & will fix all existing supported
> platforms.
>

The DT /cpu-map is optional, so I don't think it needs to be backported.

> 
> I'll send the topology code changes separately to avoid it going
> forwards.

This on the other hand can be backported to fix userspace.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63A3C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 21:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46GkCjGW5ldthLCmbKZgzwFQlYKXEZ86bc8VZxSHD4I=; b=e2DQP/ceT02Gn9
	j8iTd0iT/V+hfPF5SYSrd7d0xHnSvLsMar/c/1xbrjqnkOGYGFAUFE8mGxdpYGAuutH7hI5OV8DKM
	aXr0+PbbkQiKg/i5q0s4Arm69TcZ200GkSWRFxO7WrpsaL2tcuEVc0lgQXPPJs6HG5rU9NPiAvdaz
	Bkz/xZAmch/Q6VnLYNapf0EgBha8rEDqIsOPY7/fkPPGZoNM6KRD0wVV1isXEiAGWT733YjYdI/gV
	sgiK7LaekaDc9ONmqNk0rgXQynAx2fJmCKhveTLQkqPdDIYbR+tVS1MKEzb1F6347JiCo+1cPI0nR
	l4mHBaGonRf8bP1+pknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Ciz-00CTw4-39; Wed, 06 Jul 2022 21:38:21 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Civ-00CTv2-Kf
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 21:38:19 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-31c8a1e9e33so100718997b3.5
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 14:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YMOUx8tRXrNtuUeXMdx6sLrOQrLpo6dcTRjSCKuQc0Y=;
        b=UYKAelmyu8hR8xtMcdAR5kd1mv8eoTvSrr43mXrkLTDNp7Up1QaEHT06vXLI2hfzGi
         UgyOvRNXV+lnTdsGajUy0ju4uTNazHUOkRkqbgyEg9cM3N8iAYjp4BSKrQMLIxcIPNF8
         jCzJvOSiH9aVkes4u0/X29QTr5+jvw3j86MAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YMOUx8tRXrNtuUeXMdx6sLrOQrLpo6dcTRjSCKuQc0Y=;
        b=RCKZhYzG+nlqOIWwaktC7/TXM/b0XoNBP7z9i0GfwyQ0kjNhtEgVWKH1etoURzxl80
         aCJwtoH9rptsod62ZO4VqLzLVG2dxt7/0o32doitrPB55KBTjK4Uh3yu5kShBEy/ofdT
         9M2FlP4NwxGWlgwcTVS6UBEx+/a+R5uMwB02/AIKnflQeB1rndhd9GVx7yzlj1NCQ7Zh
         8G/tEcm+t7WiYj/aaUPx+XVcmsKRVu246RYHGRZNTnpe+4mn15bEg4ZO1KMJO1cVP0QG
         PT4qqP5FkwVgestteplKdraHeZ5RbjrDWE25gao4RtzUUT9iT+WHnWENc+qYTWOT3h3s
         dUgQ==
X-Gm-Message-State: AJIora/fDnJgZHyS0JIJi2GIKTDljTCzbsTDlXUjferQ/wXmOPmlSwjA
	OqGfrfO5gFqBYiTPbyw8cbC3BHz5i1q4Ppe0TxRH
X-Google-Smtp-Source: AGRyM1sNTMRWdcWaAn/JcWOrEElU7WU313tb8SJ6Kx2VtTNjPmBkJmDIQgRho/GXT0d2qFVlZcIMuFkHuyG4GfG7DBs=
X-Received: by 2002:a81:5d55:0:b0:31c:dce7:96c9 with SMTP id
 r82-20020a815d55000000b0031cdce796c9mr9652700ywb.519.1657143492665; Wed, 06
 Jul 2022 14:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184558.2557301-1-mail@conchuod.ie>
In-Reply-To: <20220706184558.2557301-1-mail@conchuod.ie>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 6 Jul 2022 14:38:01 -0700
Message-ID: <CAOnJCUL-RCkXi=1GSEipYmf1qMxkOASr_H65kGU+5c=AqJBZKA@mail.gmail.com>
Subject: Re: [PATCH] riscv: arch-topology: fix default topology reporting
To: Conor Dooley <mail@conchuod.ie>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sudeep Holla <sudeep.holla@arm.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Niklas Cassel <niklas.cassel@wdc.com>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Zong Li <zong.li@sifive.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jonas Hahnfeld <hahnjo@hahnjo.de>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Changbin Du <changbin.du@intel.com>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Brice Goglin <Brice.Goglin@inria.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_143817_725233_976CD557 
X-CRM114-Status: GOOD (  27.97  )
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

On Wed, Jul 6, 2022 at 11:46 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> RISC-V has no sane defaults to fall back on where there is no cpu-map
> in the devicetree.
> Without sane defaults, the package, core and thread IDs are all set to
> -1. This causes user-visible inaccuracies for tools like hwloc/lstopo
> which rely on the sysfs cpu topology files to detect a system's
> topology.
>
> Add sane defaults in ~the exact same way as ARM64.
>
> CC: stable@vger.kernel.org
> Fixes: 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
> Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
> Link: https://github.com/open-mpi/hwloc/issues/536
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>
> Sudeep suggested that this be backported rather than the changes to
> the devicetrees adding cpu-map since that property is optional.
> That patchset is still valid in it's own right.
>
>  arch/riscv/include/asm/topology.h | 13 +++++++++++++
>  arch/riscv/kernel/Makefile        |  1 +
>  arch/riscv/kernel/smpboot.c       |  4 ++++
>  arch/riscv/kernel/topology.c      | 32 +++++++++++++++++++++++++++++++
>  4 files changed, 50 insertions(+)
>  create mode 100644 arch/riscv/include/asm/topology.h
>  create mode 100644 arch/riscv/kernel/topology.c
>
> diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
> new file mode 100644
> index 000000000000..36bc6ecda898
> --- /dev/null
> +++ b/arch/riscv/include/asm/topology.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
> + */
> +
> +#ifndef _ASM_RISCV_TOPOLOGY_H
> +#define _ASM_RISCV_TOPOLOGY_H
> +
> +#include <asm-generic/topology.h>
> +
> +void store_cpu_topology(unsigned int cpuid);
> +
> +#endif /* _ASM_RISCV_TOPOLOGY_H */
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index c71d6591d539..9518882ba6f9 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -50,6 +50,7 @@ obj-y += riscv_ksyms.o
>  obj-y  += stacktrace.o
>  obj-y  += cacheinfo.o
>  obj-y  += patch.o
> +obj-y  += topology.o
>  obj-y  += probes/
>  obj-$(CONFIG_MMU) += vdso.o vdso/
>
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index f1e4948a4b52..d551c7f452d4 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -32,6 +32,7 @@
>  #include <asm/sections.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
> +#include <asm/topology.h>
>
>  #include "head.h"
>
> @@ -40,6 +41,8 @@ static DECLARE_COMPLETION(cpu_running);
>  void __init smp_prepare_boot_cpu(void)
>  {
>         init_cpu_topology();
> +
> +       store_cpu_topology(smp_processor_id());
>  }
>
>  void __init smp_prepare_cpus(unsigned int max_cpus)
> @@ -161,6 +164,7 @@ asmlinkage __visible void smp_callin(void)
>         mmgrab(mm);
>         current->active_mm = mm;
>
> +       store_cpu_topology(curr_cpuid);
>         notify_cpu_starting(curr_cpuid);
>         numa_add_cpu(curr_cpuid);
>         update_siblings_masks(curr_cpuid);
> diff --git a/arch/riscv/kernel/topology.c b/arch/riscv/kernel/topology.c
> new file mode 100644
> index 000000000000..db72862bd5b5
> --- /dev/null
> +++ b/arch/riscv/kernel/topology.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
> + *
> + * Based on the arm64 version, which was in turn based on arm32, which was
> + * ultimately based on sh's.
> + * The arm64 version was listed as:
> + * Copyright (C) 2011,2013,2014 Linaro Limited.
> + */
> +
> +#include <linux/arch_topology.h>
> +#include <linux/topology.h>
> +#include <asm/topology.h>
> +
> +void store_cpu_topology(unsigned int cpuid)
> +{
> +       struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
> +
> +       if (cpuid_topo->package_id != -1)
> +               goto topology_populated;
> +
> +       cpuid_topo->thread_id = -1;
> +       cpuid_topo->core_id = cpuid;
> +       cpuid_topo->package_id = cpu_to_node(cpuid);
> +
> +       pr_debug("CPU%u: package %d core %d thread %d\n",
> +                cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
> +                cpuid_topo->thread_id);
> +
> +topology_populated:
> +       update_siblings_masks(cpuid);
> +}
>

This function is pretty much the same as the arm64 one except the
UP/mpidr check.
Can we move this to the common code as well ?

> base-commit: b6f1f2fa2bddd69ff46a190b8120bd440fd50563
> --
> 2.37.0
>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

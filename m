Return-Path: <SRS0=al3K=CH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F59C433E2
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2020 00:32:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C636220838
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2020 00:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hBtg3DRk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="sTC4ij59"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C636220838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uk9kmHSh8S+SBe/j+IpRPcay/lRkkcyukxsoFqXsGOg=; b=hBtg3DRkeS2FD78rpbxH5S6Z7
	DOpiT5ki+xKOE7bMNI2uUIABnpSMbnmhPn5rrNAjFTXlSjb4MP3HbvBnANrTFr1v8bAcNiAcz/hLg
	VPqepkpRhuJQqsagrNdfVlYQZN7MTd2Em7t92BrMd1EWuPgkQd+BxYCRRSNA0McZ78O7+hR6Pf0nb
	8R2TD1BTpC+ct7ZxKjGFAuVPyTS229RJNF9uDYgCQCYgDjhqR6Z1dzM0zgiwuui2sCGHQ/P8Xe3fg
	SXBktUmngfHMMBWDup89dOaV7xF0XKL+g6dWeVLIl1cdTmACPwer3e7G6QKpRZJFpSlP9QCbJI127
	RegGgfbkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBon0-0001un-1p; Sat, 29 Aug 2020 00:32:14 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBomx-0001sW-GZ
 for linux-riscv@lists.infradead.org; Sat, 29 Aug 2020 00:32:12 +0000
Received: by mail-wr1-x444.google.com with SMTP id h15so643597wrt.12
 for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2020 17:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EnuZn/M2lzAJWyAIXtLX4M4QtFwlZSSzh146mAOXAjk=;
 b=sTC4ij59BsYkVreq5DVgZaFYoXHncgMbX2v+R8885l+xH2JQGoWh6OXFM4c/H6D5DX
 AKBM7ooUQ/cBWmSM3I3rHv93e+QMndKakD3tL678T/kDW+C3hpP1JnxL5JVd2bRvKo6Q
 8XVH7eKWG9nUItp2tiIw+mTk8LYyb8z7mod4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EnuZn/M2lzAJWyAIXtLX4M4QtFwlZSSzh146mAOXAjk=;
 b=CRfyWzABK8zB7kEx3vvqE0/hPaDKJdae2RkTmtkJjRWxy8Fga/4SM3YlRYodZ7pmcN
 0JvrxVA+Pk7ttAA338kOPJWpwNPCJD8uAHKlkOLQp/aMEpqJr2F9MNhHYefyfCzssFUd
 zt4IOvzcWF7KERTvua2TjqF8yO7bd9uY0h54+lb3sD269Fx0Ugkpp+9nNmTjDT4IOkD8
 4pz9xtgfo8ELMwQbHrsWFf4ilob8t1Ft7qJIWFd3QfyifIytU/7WMY5n2eUw50CPwKz6
 r4VrhzrJxsJ05MdagD19f6bGnSjo5gD4o6qTdoJsHxeGrz1a3FdxBe74IeugxRt0sELh
 YQew==
X-Gm-Message-State: AOAM530qdeY0sb6WvlLqKPSuZW1otDE4GDsMGBNFdUngkrgk8DHYAnWu
 F3llE2nIXl7ndZLUG/vJeku0aeDL5Nb8k/WLo1Dj
X-Google-Smtp-Source: ABdhPJx40JH8GqHxHD/A5mY8HvJho+at1dJwD96NVwF6YY9Iao+1NQ8Z2Zv6cBNn3NDdO9FyHOExM6NtWNrii+npYZ8=
X-Received: by 2002:adf:f7c3:: with SMTP id a3mr1233550wrq.162.1598661128695; 
 Fri, 28 Aug 2020 17:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200814214725.28818-1-atish.patra@wdc.com>
 <20200814214725.28818-2-atish.patra@wdc.com>
 <20200828102233.00006ef4@Huawei.com>
In-Reply-To: <20200828102233.00006ef4@Huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 28 Aug 2020 17:31:57 -0700
Message-ID: <CAOnJCUJn7=ufw1rjyZesLSki+KZDX5c5KbwGNo8-EeXTQkMxoQ@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH 1/6] numa: Move numa implementation to common code
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_203211_702892_2D328111 
X-CRM114-Status: GOOD (  30.96  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ganapatrao Kulkarni <gkulkarni@cavium.com>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 2:24 AM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Fri, 14 Aug 2020 14:47:20 -0700
> Atish Patra <atish.patra@wdc.com> wrote:
>
> > ARM64 numa implementation is generic enough that RISC-V can reuse that
> > implementation with very minor cosmetic changes. This will help both
> > ARM64 and RISC-V in terms of maintanace and feature improvement
> >
> > Move the numa implementation code to common directory so that both ISAs
> > can reuse this. This doesn't introduce any function changes for ARM64.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Hi Atish,
>
> One trivial question inline.  Otherwise subject to Anshuman's point about
> location, this looks fine to me.
>
> I'll run some sanity checks later.
>
> Jonathan
> > ---
> >  arch/arm64/Kconfig                            |  1 +
> >  arch/arm64/include/asm/numa.h                 | 45 +---------------
> >  arch/arm64/mm/Makefile                        |  1 -
> >  drivers/base/Kconfig                          |  6 +++
> >  drivers/base/Makefile                         |  1 +
> >  .../mm/numa.c => drivers/base/arch_numa.c     |  0
> >  include/asm-generic/numa.h                    | 51 +++++++++++++++++++
> >  7 files changed, 60 insertions(+), 45 deletions(-)
> >  rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (100%)
> >  create mode 100644 include/asm-generic/numa.h
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 6d232837cbee..955a0cf75b16 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -960,6 +960,7 @@ config HOTPLUG_CPU
> >  # Common NUMA Features
> >  config NUMA
> >       bool "NUMA Memory Allocation and Scheduler Support"
> > +     select GENERIC_ARCH_NUMA
> >       select ACPI_NUMA if ACPI
> >       select OF_NUMA
> >       help
> > diff --git a/arch/arm64/include/asm/numa.h b/arch/arm64/include/asm/numa.h
> > index 626ad01e83bf..8c8cf4297cc3 100644
> > --- a/arch/arm64/include/asm/numa.h
> > +++ b/arch/arm64/include/asm/numa.h
> > @@ -3,49 +3,6 @@
> >  #define __ASM_NUMA_H
> >
> >  #include <asm/topology.h>
> > -
> > -#ifdef CONFIG_NUMA
> > -
> > -#define NR_NODE_MEMBLKS              (MAX_NUMNODES * 2)
> > -
> > -int __node_distance(int from, int to);
> > -#define node_distance(a, b) __node_distance(a, b)
> > -
> > -extern nodemask_t numa_nodes_parsed __initdata;
> > -
> > -extern bool numa_off;
> > -
> > -/* Mappings between node number and cpus on that node. */
> > -extern cpumask_var_t node_to_cpumask_map[MAX_NUMNODES];
> > -void numa_clear_node(unsigned int cpu);
> > -
> > -#ifdef CONFIG_DEBUG_PER_CPU_MAPS
> > -const struct cpumask *cpumask_of_node(int node);
> > -#else
> > -/* Returns a pointer to the cpumask of CPUs on Node 'node'. */
> > -static inline const struct cpumask *cpumask_of_node(int node)
> > -{
> > -     return node_to_cpumask_map[node];
> > -}
> > -#endif
> > -
> > -void __init arm64_numa_init(void);
> > -int __init numa_add_memblk(int nodeid, u64 start, u64 end);
> > -void __init numa_set_distance(int from, int to, int distance);
> > -void __init numa_free_distance(void);
> > -void __init early_map_cpu_to_node(unsigned int cpu, int nid);
> > -void numa_store_cpu_info(unsigned int cpu);
> > -void numa_add_cpu(unsigned int cpu);
> > -void numa_remove_cpu(unsigned int cpu);
> > -
> > -#else        /* CONFIG_NUMA */
> > -
> > -static inline void numa_store_cpu_info(unsigned int cpu) { }
> > -static inline void numa_add_cpu(unsigned int cpu) { }
> > -static inline void numa_remove_cpu(unsigned int cpu) { }
> > -static inline void arm64_numa_init(void) { }
> > -static inline void early_map_cpu_to_node(unsigned int cpu, int nid) { }
> > -
> > -#endif       /* CONFIG_NUMA */
> > +#include <asm-generic/numa.h>
> >
> >  #endif       /* __ASM_NUMA_H */
> > diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
> > index d91030f0ffee..928c308b044b 100644
> > --- a/arch/arm64/mm/Makefile
> > +++ b/arch/arm64/mm/Makefile
> > @@ -6,7 +6,6 @@ obj-y                         := dma-mapping.o extable.o fault.o init.o \
> >  obj-$(CONFIG_HUGETLB_PAGE)   += hugetlbpage.o
> >  obj-$(CONFIG_PTDUMP_CORE)    += dump.o
> >  obj-$(CONFIG_PTDUMP_DEBUGFS) += ptdump_debugfs.o
> > -obj-$(CONFIG_NUMA)           += numa.o
> >  obj-$(CONFIG_DEBUG_VIRTUAL)  += physaddr.o
> >  KASAN_SANITIZE_physaddr.o    += n
> >
> > diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> > index 8d7001712062..73c2151de194 100644
> > --- a/drivers/base/Kconfig
> > +++ b/drivers/base/Kconfig
> > @@ -210,4 +210,10 @@ config GENERIC_ARCH_TOPOLOGY
> >         appropriate scaling, sysfs interface for reading capacity values at
> >         runtime.
> >
> > +config GENERIC_ARCH_NUMA
> > +     bool
> > +     help
> > +       Enable support for generic numa implementation. Currently, RISC-V
> > +       and ARM64 uses it.
> > +
> >  endmenu
> > diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> > index 157452080f3d..c3d02c644222 100644
> > --- a/drivers/base/Makefile
> > +++ b/drivers/base/Makefile
> > @@ -23,6 +23,7 @@ obj-$(CONFIG_PINCTRL) += pinctrl.o
> >  obj-$(CONFIG_DEV_COREDUMP) += devcoredump.o
> >  obj-$(CONFIG_GENERIC_MSI_IRQ_DOMAIN) += platform-msi.o
> >  obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
> > +obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
> >
> >  obj-y                        += test/
> >
> > diff --git a/arch/arm64/mm/numa.c b/drivers/base/arch_numa.c
> > similarity index 100%
> > rename from arch/arm64/mm/numa.c
> > rename to drivers/base/arch_numa.c
> > diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
> > new file mode 100644
> > index 000000000000..0635c0724b7c
> > --- /dev/null
> > +++ b/include/asm-generic/numa.h
> > @@ -0,0 +1,51 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_GENERIC_NUMA_H
> > +#define __ASM_GENERIC_NUMA_H
> > +
> > +#ifdef CONFIG_NUMA
> > +
> > +#define NR_NODE_MEMBLKS              (MAX_NUMNODES * 2)
> > +
> > +int __node_distance(int from, int to);
> > +#define node_distance(a, b) __node_distance(a, b)
> > +
> > +extern nodemask_t numa_nodes_parsed __initdata;
> > +
> > +extern bool numa_off;
> > +
> > +/* Mappings between node number and cpus on that node. */
> > +extern cpumask_var_t node_to_cpumask_map[MAX_NUMNODES];
> > +void numa_clear_node(unsigned int cpu);
> > +
> > +#ifdef CONFIG_DEBUG_PER_CPU_MAPS
> > +const struct cpumask *cpumask_of_node(int node);
> > +#else
> > +/* Returns a pointer to the cpumask of CPUs on Node 'node'. */
> > +static inline const struct cpumask *cpumask_of_node(int node)
> > +{
> > +     return node_to_cpumask_map[node];
> > +}
> > +#endif
> > +
> > +void __init arm64_numa_init(void);
> > +int __init numa_add_memblk(int nodeid, u64 start, u64 end);
> > +void __init numa_set_distance(int from, int to, int distance);
> > +void __init numa_free_distance(void);
> > +void __init early_map_cpu_to_node(unsigned int cpu, int nid);
> > +void numa_store_cpu_info(unsigned int cpu);
> > +void numa_add_cpu(unsigned int cpu);
> > +void numa_remove_cpu(unsigned int cpu);
> > +
> > +#else        /* CONFIG_NUMA */
> > +
> > +static inline void numa_store_cpu_info(unsigned int cpu) { }
> > +static inline void numa_add_cpu(unsigned int cpu) { }
> > +static inline void numa_remove_cpu(unsigned int cpu) { }
> > +static inline void arm64_numa_init(void) { }
> > +static inline void early_map_cpu_to_node(unsigned int cpu, int nid) { }
> > +
> > +#endif       /* CONFIG_NUMA */
> > +
> > +#include <asm/topology.h>
>
> Why the include here?
>

Sorry. This was a spillover from the previous patch. Thanks for catching it.
I will fix it in v2.
> > +
> > +#endif       /* __ASM_GENERIC_NUMA_H */
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

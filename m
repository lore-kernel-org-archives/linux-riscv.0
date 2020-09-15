Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0937DC433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 08:29:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C0D72078D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 08:29:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FP+VFDtw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C0D72078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G+voJrr4dYuggC7T4iYtnmFXsJ87U2HXUK2yOEjpFSo=; b=FP+VFDtwZZUC7U55GAnW/Zex4
	RFr67Szs6DIETznc5bQmZEYXlONAuLVXehVD1pSCQ8HFvVWFkOy2xUrKUNzcCwXg4ogQtLxQT4B5Z
	1PWFEoCI79UA4eaQO5YcqHWjBxsgNsMvGrKyufRJTctLmY2313z2ZSR/OAMKD6rZu784JaovAsLio
	y130HYScPPXkqLL4kCUqs/ei5lJ56AZKPY0aEbAAro/D62LJ6iumNFNtsZp8uLPveOmSxXJ1IIZKm
	sSvG7R8MbFB0KBYneqXLjRFXa/RzIFCJzJLNyr2GrZxRpEyCBBlkcw2jqK9rGga+aXBrUe5iIIT6E
	SldoAKnzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI6Kt-00088G-Ix; Tue, 15 Sep 2020 08:29:11 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI6Km-000869-60
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 08:29:05 +0000
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 84069BFBFBC69C6223F5;
 Tue, 15 Sep 2020 09:28:58 +0100 (IST)
Received: from localhost (10.52.121.217) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 15 Sep
 2020 09:28:57 +0100
Date: Tue, 15 Sep 2020 09:27:20 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: [RFC/RFT PATCH v2 2/5] arm64, numa: Change the numa init
 function name to be generic
Message-ID: <20200915092720.0000173b@Huawei.com>
In-Reply-To: <CAOnJCUJDk0LnLNwzq5DBogEsO9Ai1Rh10hqbrJjiqJXu0B+Hmw@mail.gmail.com>
References: <20200912013441.9730-1-atish.patra@wdc.com>
 <20200912013441.9730-3-atish.patra@wdc.com>
 <20200914153048.000038ed@Huawei.com>
 <CAOnJCUJDk0LnLNwzq5DBogEsO9Ai1Rh10hqbrJjiqJXu0B+Hmw@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.121.217]
X-ClientProxiedBy: lhreml736-chm.china.huawei.com (10.201.108.87) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_042904_480823_56917430 
X-CRM114-Status: GOOD (  33.92  )
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
Cc: David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 Jia He <justin.he@arm.com>, Anup Patel <anup@brainfault.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Steven Price <steven.price@arm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 14 Sep 2020 12:32:41 -0700
Atish Patra <atishp@atishpatra.org> wrote:

> On Mon, Sep 14, 2020 at 7:32 AM Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > On Fri, 11 Sep 2020 18:34:38 -0700
> > Atish Patra <atish.patra@wdc.com> wrote:
> >  
> > > As we are using generic numa implementation code, modify the init function
> > > name to indicate that generic implementation.
> > >
> > > Signed-off-by: Atish Patra <atish.patra@wdc.com>  
> >
> > A few comments inline but more about which layer we do the build protections
> > at than anything important.
> >
> > Thanks,
> >
> > Jonathan
> >  
> > > ---
> > >  arch/arm64/kernel/acpi_numa.c | 13 -------------
> > >  arch/arm64/mm/init.c          |  4 ++--
> > >  drivers/base/arch_numa.c      | 29 ++++++++++++++++++++++++++---
> > >  include/asm-generic/numa.h    |  4 ++--
> > >  4 files changed, 30 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> > > index 7ff800045434..96502ff92af5 100644
> > > --- a/arch/arm64/kernel/acpi_numa.c
> > > +++ b/arch/arm64/kernel/acpi_numa.c
> > > @@ -117,16 +117,3 @@ void __init acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa)
> > >
> > >       node_set(node, numa_nodes_parsed);
> > >  }
> > > -
> > > -int __init arm64_acpi_numa_init(void)
> > > -{
> > > -     int ret;
> > > -
> > > -     ret = acpi_numa_init();
> > > -     if (ret) {
> > > -             pr_info("Failed to initialise from firmware\n");
> > > -             return ret;
> > > -     }
> > > -
> > > -     return srat_disabled() ? -EINVAL : 0;
> > > -}
> > > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > > index 481d22c32a2e..93b660229e1d 100644
> > > --- a/arch/arm64/mm/init.c
> > > +++ b/arch/arm64/mm/init.c
> > > @@ -418,10 +418,10 @@ void __init bootmem_init(void)
> > >       max_pfn = max_low_pfn = max;
> > >       min_low_pfn = min;
> > >
> > > -     arm64_numa_init();
> > > +     arch_numa_init();
> > >
> > >       /*
> > > -      * must be done after arm64_numa_init() which calls numa_init() to
> > > +      * must be done after arch_numa_init() which calls numa_init() to
> > >        * initialize node_online_map that gets used in hugetlb_cma_reserve()
> > >        * while allocating required CMA size across online nodes.
> > >        */
> > > diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> > > index 73f8b49d485c..a4039dcabd3e 100644
> > > --- a/drivers/base/arch_numa.c
> > > +++ b/drivers/base/arch_numa.c
> > > @@ -13,7 +13,9 @@
> > >  #include <linux/module.h>
> > >  #include <linux/of.h>
> > >
> > > +#ifdef CONFIG_ACPI_NUMA
> > >  #include <asm/acpi.h>
> > > +#endif  
> >
> > Could include linux/acpi.h which I think gets you everything you need in here
> > and has protections against building for non ACPI cases.
> >  
> 
> Sure. will do that.
> 
> > >  #include <asm/sections.h>
> > >
> > >  struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
> > > @@ -444,16 +446,37 @@ static int __init dummy_numa_init(void)
> > >       return 0;
> > >  }
> > >
> > > +#ifdef CONFIG_ACPI_NUMA
> > > +int __init arch_acpi_numa_init(void)
> > > +{
> > > +     int ret;
> > > +
> > > +     ret = acpi_numa_init();  
> >
> > I wonder if this is the correct level at which to stub this out
> > as opposed to providing a stub for acpi_numa_init()
> > and srat_disabled()
> >  
> 
> I guess you mean adding a stub in acpi.h and acpi_numa.h ?
> As it would touch x86 related code as well, I think it is better to do
> it as a followup
> series when we try to unify x86 numa code as well (at least some part of it) ?

It would only affect x86 not using ACPI.  
If that happened, you wouldn't expect it to current call these stubs anyway.

Sure, can leave it for later.

Jonathan

> 
> > At this stage I'm not sure I care too strongly though.
> >  
> > > +     if (ret) {
> > > +             pr_info("Failed to initialise from firmware\n");
> > > +             return ret;
> > > +     }
> > > +
> > > +     return srat_disabled() ? -EINVAL : 0;
> > > +}
> > > +#else
> > > +int __init arch_acpi_numa_init(void)
> > > +{
> > > +     return -EOPNOTSUPP;
> > > +}
> > > +
> > > +#endif
> > > +
> > >  /**
> > > - * arm64_numa_init() - Initialize NUMA
> > > + * arch_numa_init() - Initialize NUMA
> > >   *
> > >   * Try each configured NUMA initialization method until one succeeds. The
> > >   * last fallback is dummy single node config encomapssing whole memory.
> > >   */
> > > -void __init arm64_numa_init(void)
> > > +void __init arch_numa_init(void)
> > >  {
> > >       if (!numa_off) {
> > > -             if (!acpi_disabled && !numa_init(arm64_acpi_numa_init))
> > > +             if (!acpi_disabled && !numa_init(arch_acpi_numa_init))
> > >                       return;
> > >               if (acpi_disabled && !numa_init(of_numa_init))
> > >                       return;
> > > diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
> > > index 2718d5a6ff03..e7962db4ba44 100644
> > > --- a/include/asm-generic/numa.h
> > > +++ b/include/asm-generic/numa.h
> > > @@ -27,7 +27,7 @@ static inline const struct cpumask *cpumask_of_node(int node)
> > >  }
> > >  #endif
> > >
> > > -void __init arm64_numa_init(void);
> > > +void __init arch_numa_init(void);
> > >  int __init numa_add_memblk(int nodeid, u64 start, u64 end);
> > >  void __init numa_set_distance(int from, int to, int distance);
> > >  void __init numa_free_distance(void);
> > > @@ -41,7 +41,7 @@ void numa_remove_cpu(unsigned int cpu);
> > >  static inline void numa_store_cpu_info(unsigned int cpu) { }
> > >  static inline void numa_add_cpu(unsigned int cpu) { }
> > >  static inline void numa_remove_cpu(unsigned int cpu) { }
> > > -static inline void arm64_numa_init(void) { }
> > > +static inline void arch_numa_init(void) { }
> > >  static inline void early_map_cpu_to_node(unsigned int cpu, int nid) { }
> > >
> > >  #endif       /* CONFIG_NUMA */  
> >
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv  
> 
> 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

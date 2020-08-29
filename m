Return-Path: <SRS0=al3K=CH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396A2C433E6
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2020 00:39:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04A6C2098B
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2020 00:39:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LDmkugH0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="W3VcIZ+W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04A6C2098B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gqEczI4Gi80dX1gsAN6XT7GlHa9qucIyXtb9MRHoWjw=; b=LDmkugH0rmFHx/zr8y6hgkjjF
	hkMqMODfOPEiAQwE4ErsAwNShXxGBactht5Va+H+KBben7Z2Uc1I20G5jiDNKDWUmCSjCVu6lKXaX
	kaAnwyPb2ka9FphgtMukrA7jiHuh/pBLU9Keim7KWlYuQm3mcMYzh/y+6KVo6YS7Mlnmw8vlnlmR6
	lroepr4wxe0XOOgNlZVDacn754J1XMskjvuMHbhKAEzBEQv0XEwPQ8kwhFDuOg6boBzaLjMRMTRjB
	809V8YBnsRoiY2PH5n7fCzcoiKHD2GtCUlR8U79cvrL+rooV1SvgnOps88/14rcWMWLuxfS04gGWV
	9FFMi1yuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBouA-0005Qg-Vf; Sat, 29 Aug 2020 00:39:39 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBou7-0005No-16
 for linux-riscv@lists.infradead.org; Sat, 29 Aug 2020 00:39:36 +0000
Received: by mail-wm1-x344.google.com with SMTP id b79so665738wmb.4
 for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2020 17:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HhE6WCMtoODE6GixkR8pydA91xEbZ/J3fzi8jE92LeQ=;
 b=W3VcIZ+WwFndRykg27fx4UwALNDRxc9RatRjzx7ZvrQZe2WZyBz5d9Qk8gbY6k5nP0
 VNVusIAIKoqjHjrvMf0/H2HPGej8mwfncRIL13Axvz2nZKO5BKP3UmCTbH4313mWm4fS
 5YweDpx+M2Y0s/WGcou3WIQ38u9L3DGvBCOmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HhE6WCMtoODE6GixkR8pydA91xEbZ/J3fzi8jE92LeQ=;
 b=hEiH827ey+hS+FZ6j1DY0FUNQmKw4I+5dujUunqEaP2RzA9ZEN5+RyxHJEXwD5BtBP
 vRrgMmMBiWwJRFGbwwo/joMIRwi7I4hwAhzv3kpuo7AGZzTudCLrn/mBf9kfsIoMLQya
 phajXb+7guSR9TCh+5vbVoEiCgytjsiqAPgfljftaGkR30aHFaffUhGENMe/QsoHjV24
 gMKGvTqdHe6b1vANEm0n+B/TXWTyDufIXS+6vR8LZuBj4Wruxs/UtxOUlKs6FRTP0KeB
 b/+FncunqQAr/80sC3Hwd5hwOKtaJkziHHuGBqLK+WCZ5nT5lE5nrMgJZSeT6zAmcg5Z
 6mDQ==
X-Gm-Message-State: AOAM5339Yl3bLAzkXLZ7fRFHOMifMvHVoZwu6DivFrFV2MyXUp148ePs
 Cd8wBsgd+C2BIPbYzIx+TlKbRTuNnmzjGXfXBDnm
X-Google-Smtp-Source: ABdhPJyyzPcyXT/pJ4cOLMn/jA4Ed9ckjP4XG70x8Qo1QsCalVaSEPEv/FXZPVLDUHToAstg/Rk4nwyZ89UlQCxSuIM=
X-Received: by 2002:a05:600c:230f:: with SMTP id
 15mr1019525wmo.186.1598661573584; 
 Fri, 28 Aug 2020 17:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200814214725.28818-1-atish.patra@wdc.com>
 <20200814214725.28818-3-atish.patra@wdc.com>
 <20200828103552.000033e3@Huawei.com>
In-Reply-To: <20200828103552.000033e3@Huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 28 Aug 2020 17:39:22 -0700
Message-ID: <CAOnJCU+j2DOHdXNz2xZZGX-NcpUDGmaTasYQpMxc7W-31Ha1dQ@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH 2/6] arm64, numa: Change the numa init function
 name to be generic
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_203935_156589_26F671F2 
X-CRM114-Status: GOOD (  31.96  )
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

On Fri, Aug 28, 2020 at 2:37 AM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Fri, 14 Aug 2020 14:47:21 -0700
> Atish Patra <atish.patra@wdc.com> wrote:
>
> > As we are using generic numa implementation code, modify the init function
> > name to indicate that generic implementation.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/arm64/mm/init.c       | 4 ++--
> >  drivers/base/arch_numa.c   | 8 ++++++--
> >  include/asm-generic/numa.h | 4 ++--
> >  3 files changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > index 481d22c32a2e..93b660229e1d 100644
> > --- a/arch/arm64/mm/init.c
> > +++ b/arch/arm64/mm/init.c
> > @@ -418,10 +418,10 @@ void __init bootmem_init(void)
> >       max_pfn = max_low_pfn = max;
> >       min_low_pfn = min;
> >
> > -     arm64_numa_init();
> > +     arch_numa_init();
> >
> >       /*
> > -      * must be done after arm64_numa_init() which calls numa_init() to
> > +      * must be done after arch_numa_init() which calls numa_init() to
> >        * initialize node_online_map that gets used in hugetlb_cma_reserve()
> >        * while allocating required CMA size across online nodes.
> >        */
> > diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> > index 73f8b49d485c..83341c807240 100644
> > --- a/drivers/base/arch_numa.c
> > +++ b/drivers/base/arch_numa.c
> > @@ -13,7 +13,9 @@
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >
> > +#ifdef CONFIG_ARM64
> >  #include <asm/acpi.h>
> > +#endif
>
> This highlights an issue.  We really don't want to define 'generic' arch
> code then match on individual architectures if at all possible.
>

I agree.

> I'm also not sure we need to.
>
> The arm64_acpi_numa_init() code is just a light wrapper around the
> standard acpi_init() call so should work fine on riscv (once ACPI
> support is ready).
>
> Can we pull that function into here

Sure. We can move the arm64_acpi_numa_init to here and rename it to
arch_acpi_numa_init.
We can keep arch_acpi_numa_init and the acpi.h included under CONFIG_ACPI_NUMA.
If RISC-V becomes ACPI ready one day, they always need to enable
CONFIG_ACPI_NUMA and reuse the generic functions.

> or perhaps a generic arch_numa_acpi.c?
>
There has not been much discussion about ACPI for RISC-V. So moving
the arm64 acpi code now to generic code would be premature
in my opinion. Currently, we don't even know how ACPI will look like
for RISC-V.

> There is probably a bit of a dance needed around acpi_disabled
> though as that can be defined in entirely different places
> depending on whether acpi is enabled or not.
> Possibly just adding an
>
> extern int acpi_disabled to include/linux/acpi.h when acpi is enabled
> will be sufficient (if ugly)?
>

We don't need to do that now unless we are moving arm64 ACPI code
implementation to generic code.
If ACPI is not enabled, it is already defined as a macro in
include/linux/acpi.h.

>
> >  #include <asm/sections.h>
> >
> >  struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
> > @@ -445,16 +447,18 @@ static int __init dummy_numa_init(void)
> >  }
> >
> >  /**
> > - * arm64_numa_init() - Initialize NUMA
> > + * arch_numa_init() - Initialize NUMA
> >   *
> >   * Try each configured NUMA initialization method until one succeeds. The
> >   * last fallback is dummy single node config encomapssing whole memory.
> >   */
> > -void __init arm64_numa_init(void)
> > +void __init arch_numa_init(void)
> >  {
> >       if (!numa_off) {
> > +#ifdef CONFIG_ARM64
> >               if (!acpi_disabled && !numa_init(arm64_acpi_numa_init))
> >                       return;
> > +#endif
> >               if (acpi_disabled && !numa_init(of_numa_init))
> >                       return;
> >       }
> > diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
> > index 0635c0724b7c..309eca8c0b5d 100644
> > --- a/include/asm-generic/numa.h
> > +++ b/include/asm-generic/numa.h
> > @@ -27,7 +27,7 @@ static inline const struct cpumask *cpumask_of_node(int node)
> >  }
> >  #endif
> >
> > -void __init arm64_numa_init(void);
> > +void __init arch_numa_init(void);
> >  int __init numa_add_memblk(int nodeid, u64 start, u64 end);
> >  void __init numa_set_distance(int from, int to, int distance);
> >  void __init numa_free_distance(void);
> > @@ -41,7 +41,7 @@ void numa_remove_cpu(unsigned int cpu);
> >  static inline void numa_store_cpu_info(unsigned int cpu) { }
> >  static inline void numa_add_cpu(unsigned int cpu) { }
> >  static inline void numa_remove_cpu(unsigned int cpu) { }
> > -static inline void arm64_numa_init(void) { }
> > +static inline void arch_numa_init(void) { }
> >  static inline void early_map_cpu_to_node(unsigned int cpu, int nid) { }
> >
> >  #endif       /* CONFIG_NUMA */
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

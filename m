Return-Path: <SRS0=aYu6=C6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2977AC4727D
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2020 23:50:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBA9223A6C
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2020 23:50:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uyM9+SYU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="E/KUgl8k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBA9223A6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gNpisjDSTMU+p37NayR01r/y+tilKYFUHdIGTL7VsOk=; b=uyM9+SYU7ynSuNVFhXWlGBZrC
	kXQXXlhj2gFNAksyRscAxGXeU08subf0LZtd0r5X2td+tv/g4QWAis5XZ9EZUeqgDTkmKIDLvgqBE
	5rLFY3Ql6e7yRzZBRlCS2wHYWxT9OYdpsRNPvQSvsPWmvv/Js7R9kk+5rh5RsoKSJM/w+mR+3mXLL
	birbqJV04+NT2Jt46la++aQGpkt5/wPJmlSvrRn+nfXJ9U/c5d6Mw9drkzp/D4D4KYx33jp4+mUxb
	oDEoMx+wj/rlLKqSrX/w1TLm5Xc9iwZrL4lJpY4/JMoZgxzfo4gHZ2Wpbe6jPHloca1CcmRiUK1PT
	/BHalsMvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKVZr-0007j9-D1; Mon, 21 Sep 2020 23:50:35 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKVZn-0007i7-Q9
 for linux-riscv@lists.infradead.org; Mon, 21 Sep 2020 23:50:33 +0000
Received: by mail-wr1-x443.google.com with SMTP id t10so15011373wrv.1
 for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2020 16:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Y1U9iOOezYjCOoSPo/fvJd1TAyzAwihRmGNwzWZWTg=;
 b=E/KUgl8kVQeaBO5tKkqTMAySFYVmhQ+29OfnU/pcF5XqLDAj3IUqUB7nONZnshcY1c
 HH8iRtQ4ruQX/MPlEpnL9na3p24tSCCkCrFOz167nx/PaxVdCPNFPZCcSTrJmt10Eo1i
 lpRs+tqxJOq8eM8AwWGcWIiN3zFvZsnD2NGaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Y1U9iOOezYjCOoSPo/fvJd1TAyzAwihRmGNwzWZWTg=;
 b=r2urE3W7vy7WC/6altEynWiaTnryvcotUP/wntSSypagLHx4bkLUSRI/vCKvRskKXP
 Ctm0pJNuvKF9bVKYWZ/t5Ze3k2GOp/uSLtYtJT88tjwpElT2fM8gcvEaYWNcNcbfkKTr
 b/RCtYBAqcyZfscoNhIEsmWzjFNRuOT5Q8hmeJ0EzMZEgZAxhU7NkbkH67sFQOVCWmb5
 Tx171o4X80BNczF7G2SXF+pX7KafABiR+ZrIqpcvEK8JQpAd7ZBZYt6BaOx1uPvVb8Ls
 KWqmN+sEYSiKnN8VWFMsCJA6fyCwDsNgaGeEhy4eA3W/h0G70pqJo5rsT8+qcjK8YtJU
 bOfA==
X-Gm-Message-State: AOAM531CUvE8qZuoGFXgA52Zqob2wXpR5cUv00VZu23kLfgX5VEoNzlh
 x5gwx2V7vWSamBbP3rw4/TyW8hht+Yl+7mls02K4
X-Google-Smtp-Source: ABdhPJw2IeRlvWLmwCeYs9YRK4GBQmKJ92ij4ToI7a1BmtiQYXkXLov+SRIDwmstOVNyvvPfcdOX9/+PYbjmLndPxnI=
X-Received: by 2002:adf:81c6:: with SMTP id 64mr2135564wra.176.1600732229175; 
 Mon, 21 Sep 2020 16:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200918201140.3172284-1-atish.patra@wdc.com>
 <20200918201140.3172284-3-atish.patra@wdc.com>
 <20200921100131.00005238@Huawei.com>
In-Reply-To: <20200921100131.00005238@Huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 21 Sep 2020 16:50:18 -0700
Message-ID: <CAOnJCUKwn6dh8yuEf__Sr9uKyjTwSJyb8UFJo31-_ZDA_kmOwQ@mail.gmail.com>
Subject: Re: [RFT PATCH v3 2/5] arm64, numa: Change the numa init functions
 name to be generic
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_195031_913596_5BCDFB05 
X-CRM114-Status: GOOD (  31.31  )
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
 Anup Patel <anup@brainfault.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 21, 2020 at 2:03 AM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Fri, 18 Sep 2020 13:11:37 -0700
> Atish Patra <atish.patra@wdc.com> wrote:
>
> > As we are using generic numa implementation code, modify the acpi & numa
> > init functions name to indicate that generic implementation.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>
> Other than the double include of linux/acpi.h below this looks good to me.
>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>
> > ---
> >  arch/arm64/kernel/acpi_numa.c | 13 -------------
> >  arch/arm64/mm/init.c          |  4 ++--
> >  drivers/base/arch_numa.c      | 31 +++++++++++++++++++++++++++----
> >  include/asm-generic/numa.h    |  4 ++--
> >  4 files changed, 31 insertions(+), 21 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> > index 7ff800045434..96502ff92af5 100644
> > --- a/arch/arm64/kernel/acpi_numa.c
> > +++ b/arch/arm64/kernel/acpi_numa.c
> > @@ -117,16 +117,3 @@ void __init acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa)
> >
> >       node_set(node, numa_nodes_parsed);
> >  }
> > -
> > -int __init arm64_acpi_numa_init(void)
> > -{
> > -     int ret;
> > -
> > -     ret = acpi_numa_init();
> > -     if (ret) {
> > -             pr_info("Failed to initialise from firmware\n");
> > -             return ret;
> > -     }
> > -
> > -     return srat_disabled() ? -EINVAL : 0;
> > -}
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
> > index 73f8b49d485c..1649c90a3bc5 100644
> > --- a/drivers/base/arch_numa.c
> > +++ b/drivers/base/arch_numa.c
> > @@ -13,7 +13,9 @@
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >
> > -#include <asm/acpi.h>
> > +#ifdef CONFIG_ACPI_NUMA
> > +#include <linux/acpi.h>
> > +#endif
>
> Why do we need this ifdef stuff here?
> In particular acpi_disabled is defined in that header
> in the !CONFIG_ACPI case so seems like we should include it always.
>
> Also given we've just moved arch/arm64/numa.c to become this file,
> it has an include of that header a few lines off the top of this diff anyway.
>
> So I think you can just drop the additional include here.
>

Ahh Yes. Sorry for the oversight. Fixed it.

>
> >  #include <asm/sections.h>
> >
> >  struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
> > @@ -444,16 +446,37 @@ static int __init dummy_numa_init(void)
> >       return 0;
> >  }
> >
> > +#ifdef CONFIG_ACPI_NUMA
> > +static int __init arch_acpi_numa_init(void)
> > +{
> > +     int ret;
> > +
> > +     ret = acpi_numa_init();
> > +     if (ret) {
> > +             pr_info("Failed to initialise from firmware\n");
> > +             return ret;
> > +     }
> > +
> > +     return srat_disabled() ? -EINVAL : 0;
> > +}
> > +#else
> > +static int __init arch_acpi_numa_init(void)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +#endif
> > +
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
> > -             if (!acpi_disabled && !numa_init(arm64_acpi_numa_init))
> > +             if (!acpi_disabled && !numa_init(arch_acpi_numa_init))
> >                       return;
> >               if (acpi_disabled && !numa_init(of_numa_init))
> >                       return;
> > diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
> > index 2718d5a6ff03..e7962db4ba44 100644
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

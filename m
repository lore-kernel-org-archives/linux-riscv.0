Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B356DC433E2
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 09:37:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 809562075B
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 09:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tYh57oyP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 809562075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=91Ih6ZJ8p3wJDb24pD/8dAbLUAHKocvDU9IGm0vITcY=; b=tYh57oyP1pJLKC9haevCjw0xB
	rVX9B6Hp+wYrgZ8dF948Kl8ni04Mh4QzNS43LOzXZie4baQPKdA0EWZQed404Ky5izSTf0u8s0TbQ
	FK16/aJMgYRSH0voIpp7OHE9zfBP+VXsBKPGrIQjB3fnEgnIa6FVrzfL1Sd7ZY0wqrme7orpQehfT
	JNzORZF38TAU3SJ/I0YlFAENqxlBgl/Q11Sb6C6VsB+Des6Jz9PZpfTc7wDW75jmFSZMZNp0AnHlt
	qtkycSKsNHbXp3HHhcS2BCWXyaBvDX7mrCFqexFN/TA1vwjf3DwJ00XRCnOj8IGJw/1/nCWmL0ueo
	/FGX0x5HQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBapD-0006FP-J9; Fri, 28 Aug 2020 09:37:35 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBap8-0006Dy-28; Fri, 28 Aug 2020 09:37:30 +0000
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 5F54AB1A2183795D36F8;
 Fri, 28 Aug 2020 10:37:28 +0100 (IST)
Received: from localhost (10.52.127.106) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 28 Aug
 2020 10:37:27 +0100
Date: Fri, 28 Aug 2020 10:35:52 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC/RFT PATCH 2/6] arm64, numa: Change the numa init function
 name to be generic
Message-ID: <20200828103552.000033e3@Huawei.com>
In-Reply-To: <20200814214725.28818-3-atish.patra@wdc.com>
References: <20200814214725.28818-1-atish.patra@wdc.com>
 <20200814214725.28818-3-atish.patra@wdc.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.127.106]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_053730_214696_EFBE4CC4 
X-CRM114-Status: GOOD (  22.46  )
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
 Catalin Marinas <catalin.marinas@arm.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>,
 Ganapatrao Kulkarni <gkulkarni@cavium.com>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 14 Aug 2020 14:47:21 -0700
Atish Patra <atish.patra@wdc.com> wrote:

> As we are using generic numa implementation code, modify the init function
> name to indicate that generic implementation.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/arm64/mm/init.c       | 4 ++--
>  drivers/base/arch_numa.c   | 8 ++++++--
>  include/asm-generic/numa.h | 4 ++--
>  3 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 481d22c32a2e..93b660229e1d 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -418,10 +418,10 @@ void __init bootmem_init(void)
>  	max_pfn = max_low_pfn = max;
>  	min_low_pfn = min;
>  
> -	arm64_numa_init();
> +	arch_numa_init();
>  
>  	/*
> -	 * must be done after arm64_numa_init() which calls numa_init() to
> +	 * must be done after arch_numa_init() which calls numa_init() to
>  	 * initialize node_online_map that gets used in hugetlb_cma_reserve()
>  	 * while allocating required CMA size across online nodes.
>  	 */
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index 73f8b49d485c..83341c807240 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -13,7 +13,9 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  
> +#ifdef CONFIG_ARM64
>  #include <asm/acpi.h>
> +#endif

This highlights an issue.  We really don't want to define 'generic' arch
code then match on individual architectures if at all possible.

I'm also not sure we need to. 

The arm64_acpi_numa_init() code is just a light wrapper around the
standard acpi_init() call so should work fine on riscv (once ACPI
support is ready).

Can we pull that function into here or perhaps a generic
arch_numa_acpi.c?

There is probably a bit of a dance needed around acpi_disabled
though as that can be defined in entirely different places
depending on whether acpi is enabled or not.
Possibly just adding an

extern int acpi_disabled to include/linux/acpi.h when acpi is enabled
will be sufficient (if ugly)?


>  #include <asm/sections.h>
>  
>  struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
> @@ -445,16 +447,18 @@ static int __init dummy_numa_init(void)
>  }
>  
>  /**
> - * arm64_numa_init() - Initialize NUMA
> + * arch_numa_init() - Initialize NUMA
>   *
>   * Try each configured NUMA initialization method until one succeeds. The
>   * last fallback is dummy single node config encomapssing whole memory.
>   */
> -void __init arm64_numa_init(void)
> +void __init arch_numa_init(void)
>  {
>  	if (!numa_off) {
> +#ifdef CONFIG_ARM64
>  		if (!acpi_disabled && !numa_init(arm64_acpi_numa_init))
>  			return;
> +#endif
>  		if (acpi_disabled && !numa_init(of_numa_init))
>  			return;
>  	}
> diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
> index 0635c0724b7c..309eca8c0b5d 100644
> --- a/include/asm-generic/numa.h
> +++ b/include/asm-generic/numa.h
> @@ -27,7 +27,7 @@ static inline const struct cpumask *cpumask_of_node(int node)
>  }
>  #endif
>  
> -void __init arm64_numa_init(void);
> +void __init arch_numa_init(void);
>  int __init numa_add_memblk(int nodeid, u64 start, u64 end);
>  void __init numa_set_distance(int from, int to, int distance);
>  void __init numa_free_distance(void);
> @@ -41,7 +41,7 @@ void numa_remove_cpu(unsigned int cpu);
>  static inline void numa_store_cpu_info(unsigned int cpu) { }
>  static inline void numa_add_cpu(unsigned int cpu) { }
>  static inline void numa_remove_cpu(unsigned int cpu) { }
> -static inline void arm64_numa_init(void) { }
> +static inline void arch_numa_init(void) { }
>  static inline void early_map_cpu_to_node(unsigned int cpu, int nid) { }
>  
>  #endif	/* CONFIG_NUMA */



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

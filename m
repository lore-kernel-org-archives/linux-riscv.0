Return-Path: <SRS0=aYu6=C6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B206C43464
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2020 09:03:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEC6820773
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2020 09:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bML2sVEu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEC6820773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6JL4wdv2AlQ+8L0FE2IX+puyj4E7oN5EQm9MYV7Fxsc=; b=bML2sVEu73Zs7dYbYu6qpVIfm
	M/cV6mnND8I31ncAf+PKw6zdc/SYvmwU/YMXLw8FGeONPkOza/yBBfoYHg6BXuOZiqKByxgE2Kc+4
	pHCuD3Th628fIVLnbLQGlufJ2tP3VFkKXvJiPad56pVWOHPhzwEWoF656mSTIELjV/Nbmjk7UdGYn
	1Q/ahH2scUQCD6LsRPnqRsovnljXQDtiUYUEPttxNfbjjmcpzMvlo8ZqMxE96lj+9ittLcwUIFKPT
	GU0vVp6MpMyHKS1lpj0C0AKLijGprBdc2KrXDjx5Rot+z1F5aQe1AYkTh0YTJZdjmlQZPFPw1aRxV
	wCpOZh3Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKHjF-0003zs-Fu; Mon, 21 Sep 2020 09:03:21 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKHjB-0003xy-Tt; Mon, 21 Sep 2020 09:03:18 +0000
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 46539BE2DF49309FE3B4;
 Mon, 21 Sep 2020 10:03:11 +0100 (IST)
Received: from localhost (10.52.121.13) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 21 Sep
 2020 10:03:10 +0100
Date: Mon, 21 Sep 2020 10:01:31 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFT PATCH v3 2/5] arm64, numa: Change the numa init functions
 name to be generic
Message-ID: <20200921100131.00005238@Huawei.com>
In-Reply-To: <20200918201140.3172284-3-atish.patra@wdc.com>
References: <20200918201140.3172284-1-atish.patra@wdc.com>
 <20200918201140.3172284-3-atish.patra@wdc.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.121.13]
X-ClientProxiedBy: lhreml744-chm.china.huawei.com (10.201.108.194) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_050318_081493_9E882438 
X-CRM114-Status: GOOD (  23.42  )
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
Cc: linux-arch@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Arnd
 Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Anup Patel <anup@brainfault.org>, David
 Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 18 Sep 2020 13:11:37 -0700
Atish Patra <atish.patra@wdc.com> wrote:

> As we are using generic numa implementation code, modify the acpi & numa
> init functions name to indicate that generic implementation.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Other than the double include of linux/acpi.h below this looks good to me.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  arch/arm64/kernel/acpi_numa.c | 13 -------------
>  arch/arm64/mm/init.c          |  4 ++--
>  drivers/base/arch_numa.c      | 31 +++++++++++++++++++++++++++----
>  include/asm-generic/numa.h    |  4 ++--
>  4 files changed, 31 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> index 7ff800045434..96502ff92af5 100644
> --- a/arch/arm64/kernel/acpi_numa.c
> +++ b/arch/arm64/kernel/acpi_numa.c
> @@ -117,16 +117,3 @@ void __init acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa)
>  
>  	node_set(node, numa_nodes_parsed);
>  }
> -
> -int __init arm64_acpi_numa_init(void)
> -{
> -	int ret;
> -
> -	ret = acpi_numa_init();
> -	if (ret) {
> -		pr_info("Failed to initialise from firmware\n");
> -		return ret;
> -	}
> -
> -	return srat_disabled() ? -EINVAL : 0;
> -}
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
> index 73f8b49d485c..1649c90a3bc5 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -13,7 +13,9 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  
> -#include <asm/acpi.h>
> +#ifdef CONFIG_ACPI_NUMA
> +#include <linux/acpi.h>
> +#endif

Why do we need this ifdef stuff here?
In particular acpi_disabled is defined in that header
in the !CONFIG_ACPI case so seems like we should include it always.

Also given we've just moved arch/arm64/numa.c to become this file,
it has an include of that header a few lines off the top of this diff anyway.

So I think you can just drop the additional include here.


>  #include <asm/sections.h>
>  
>  struct pglist_data *node_data[MAX_NUMNODES] __read_mostly;
> @@ -444,16 +446,37 @@ static int __init dummy_numa_init(void)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_ACPI_NUMA
> +static int __init arch_acpi_numa_init(void)
> +{
> +	int ret;
> +
> +	ret = acpi_numa_init();
> +	if (ret) {
> +		pr_info("Failed to initialise from firmware\n");
> +		return ret;
> +	}
> +
> +	return srat_disabled() ? -EINVAL : 0;
> +}
> +#else
> +static int __init arch_acpi_numa_init(void)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +#endif
> +
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
> -		if (!acpi_disabled && !numa_init(arm64_acpi_numa_init))
> +		if (!acpi_disabled && !numa_init(arch_acpi_numa_init))
>  			return;
>  		if (acpi_disabled && !numa_init(of_numa_init))
>  			return;
> diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
> index 2718d5a6ff03..e7962db4ba44 100644
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

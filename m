Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB4BC3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 18:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6GyWFKySgOH9ACS/jUiXQ8tab0C7jNdDG+5pLLyis0=; b=XMzIW9RZNQ4YjD
	WZE19jiN6Ly2E61bVINs+VsD1ZM/wUoKtmnbW8zfYfpdMmKri6IAE/J4CsFhnBxF9DzSUpAlU9OxE
	TNXWV1CeKhTH1su/ft4ihXIZANdByIFEtinLC8OIJItSU1rWEv+nRybCqUTsRoKzjuHjM5vR3MHCI
	auMu3IZYwljYvfs0CvywoJDfjAzoe0NoZvmmEqufkkwWN29FWU5UZKQ1urbmMse49k94aj/jHuSLk
	TsF0dndJeQHC31C3Ew0luDRRiSaqg4krbURRBmUcxNnP3Mm3IhvqeI7GCRCTqJCRULNyF394Wdv0u
	CHMkuTccfd7VhQunGGlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUs1b-00000003SGf-4020;
	Fri, 19 Jul 2024 18:08:11 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUs1D-00000003S7R-0wBk;
	Fri, 19 Jul 2024 18:07:49 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WQczd6dCfz6J9r5;
	Sat, 20 Jul 2024 02:05:49 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 9EC131408FE;
	Sat, 20 Jul 2024 02:07:14 +0800 (CST)
Received: from localhost (10.48.157.16) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 19 Jul
 2024 19:07:13 +0100
Date: Fri, 19 Jul 2024 19:07:12 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, "Borislav
 Petkov" <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand
	<david@redhat.com>, "David S. Miller" <davem@davemloft.net>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Carstens
	<hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "John Paul Adrian
 Glaubitz" <glaubitz@physik.fu-berlin.de>, Michael Ellerman
	<mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>, Thomas Gleixner
	<tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon
	<will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linux-mips@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-cxl@vger.kernel.org>, <nvdimm@lists.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <x86@kernel.org>
Subject: Re: [PATCH 15/17] mm: make numa_memblks more self-contained
Message-ID: <20240719190712.00001307@Huawei.com>
In-Reply-To: <20240716111346.3676969-16-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
	<20240716111346.3676969-16-rppt@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.48.157.16]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_110747_566379_53035173 
X-CRM114-Status: GOOD (  35.01  )
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

On Tue, 16 Jul 2024 14:13:44 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Introduce numa_memblks_init() and move some code around to avoid several
> global variables in numa_memblks.

Hi Mike,

Adding the effectively always on memblock_force_top_down
deserves a comment on why. I assume because you are going to do
something with it later? 

There also seems to be more going on in here such as the change to
get_pfn_range_for_nid()  Perhaps break this up so each
change can have an explanation. 


> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/mm/numa.c           | 53 ++++---------------------
>  include/linux/numa_memblks.h |  9 +----
>  mm/numa_memblks.c            | 77 +++++++++++++++++++++++++++---------
>  3 files changed, 68 insertions(+), 71 deletions(-)
> 
> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index 3848e68d771a..16bc703c9272 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -115,30 +115,19 @@ void __init setup_node_to_cpumask_map(void)
>  	pr_debug("Node to cpumask map for %u nodes\n", nr_node_ids);
>  }
>  
> -static int __init numa_register_memblks(struct numa_meminfo *mi)
> +static int __init numa_register_nodes(void)
>  {
> -	int i, nid, err;
> -
> -	err = numa_register_meminfo(mi);
> -	if (err)
> -		return err;
> +	int nid;
>  
>  	if (!memblock_validate_numa_coverage(SZ_1M))
>  		return -EINVAL;
>  
>  	/* Finally register nodes. */
>  	for_each_node_mask(nid, node_possible_map) {
> -		u64 start = PFN_PHYS(max_pfn);
> -		u64 end = 0;
> -
> -		for (i = 0; i < mi->nr_blks; i++) {
> -			if (nid != mi->blk[i].nid)
> -				continue;
> -			start = min(mi->blk[i].start, start);
> -			end = max(mi->blk[i].end, end);
> -		}
> +		unsigned long start_pfn, end_pfn;
>  
> -		if (start >= end)
> +		get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);

It's not immediately obvious to me that this code is equivalent so I'd
prefer it in a separate patch with some description of why
it is a valid change.

> +		if (start_pfn >= end_pfn)
>  			continue;
>  
>  		alloc_node_data(nid);
> @@ -178,39 +167,11 @@ static int __init numa_init(int (*init_func)(void))
>  	for (i = 0; i < MAX_LOCAL_APIC; i++)
>  		set_apicid_to_node(i, NUMA_NO_NODE);
>  
> -	nodes_clear(numa_nodes_parsed);
> -	nodes_clear(node_possible_map);
> -	nodes_clear(node_online_map);
> -	memset(&numa_meminfo, 0, sizeof(numa_meminfo));
> -	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.memory,
> -				  NUMA_NO_NODE));
> -	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.reserved,
> -				  NUMA_NO_NODE));
> -	/* In case that parsing SRAT failed. */
> -	WARN_ON(memblock_clear_hotplug(0, ULLONG_MAX));
> -	numa_reset_distance();
> -
> -	ret = init_func();
> -	if (ret < 0)
> -		return ret;
> -
> -	/*
> -	 * We reset memblock back to the top-down direction
> -	 * here because if we configured ACPI_NUMA, we have
> -	 * parsed SRAT in init_func(). It is ok to have the
> -	 * reset here even if we did't configure ACPI_NUMA
> -	 * or acpi numa init fails and fallbacks to dummy
> -	 * numa init.
> -	 */
> -	memblock_set_bottom_up(false);
> -
> -	ret = numa_cleanup_meminfo(&numa_meminfo);
> +	ret = numa_memblks_init(init_func, /* memblock_force_top_down */ true);
The comment in parameter list seems unnecessary.
Maybe add a comment above the call instead if need to call that out?

>  	if (ret < 0)
>  		return ret;
>  
> -	numa_emulation(&numa_meminfo, numa_distance_cnt);
> -
> -	ret = numa_register_memblks(&numa_meminfo);
> +	ret = numa_register_nodes();
>  	if (ret < 0)
>  		return ret;
>  

> diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
> index e0039549aaac..640f3a3ce0ee 100644
> --- a/mm/numa_memblks.c
> +++ b/mm/numa_memblks.c
> @@ -7,13 +7,27 @@
>  #include <linux/numa.h>
>  #include <linux/numa_memblks.h>
>  

> +/*
> + * Set nodes, which have memory in @mi, in *@nodemask.
> + */
> +static void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
> +					      const struct numa_meminfo *mi)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
> +		if (mi->blk[i].start != mi->blk[i].end &&
> +		    mi->blk[i].nid != NUMA_NO_NODE)
> +			node_set(mi->blk[i].nid, *nodemask);
> +}

The code move doesn't have an obvious purpose. Maybe call that
out in the patch description if it is needed for a future patch.
Or do it in two goes so first just adds the static, 2nd shuffles
the code.

>  
>  /**
>   * numa_reset_distance - Reset NUMA distance table
> @@ -287,20 +301,6 @@ int __init numa_cleanup_meminfo(struct numa_meminfo *mi)
>  	return 0;
>  }
>  
> -/*
> - * Set nodes, which have memory in @mi, in *@nodemask.
> - */
> -void __init numa_nodemask_from_meminfo(nodemask_t *nodemask,
> -				       const struct numa_meminfo *mi)
> -{
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(mi->blk); i++)
> -		if (mi->blk[i].start != mi->blk[i].end &&
> -		    mi->blk[i].nid != NUMA_NO_NODE)
> -			node_set(mi->blk[i].nid, *nodemask);
> -}
> -
>  /*
>   * Mark all currently memblock-reserved physical memory (which covers the
>   * kernel's own memory ranges) as hot-unswappable.
> @@ -368,7 +368,7 @@ static void __init numa_clear_kernel_node_hotplug(void)
>  	}
>  }
>  
> -int __init numa_register_meminfo(struct numa_meminfo *mi)
> +static int __init numa_register_meminfo(struct numa_meminfo *mi)
>  {
>  	int i;
>  
> @@ -412,6 +412,47 @@ int __init numa_register_meminfo(struct numa_meminfo *mi)
>  	return 0;
>  }
>  
> +int __init numa_memblks_init(int (*init_func)(void),
> +			     bool memblock_force_top_down)
> +{
> +	int ret;
> +
> +	nodes_clear(numa_nodes_parsed);
> +	nodes_clear(node_possible_map);
> +	nodes_clear(node_online_map);
> +	memset(&numa_meminfo, 0, sizeof(numa_meminfo));
> +	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.memory,
> +				  NUMA_NO_NODE));
> +	WARN_ON(memblock_set_node(0, ULLONG_MAX, &memblock.reserved,
> +				  NUMA_NO_NODE));
> +	/* In case that parsing SRAT failed. */
> +	WARN_ON(memblock_clear_hotplug(0, ULLONG_MAX));
> +	numa_reset_distance();
> +
> +	ret = init_func();
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * We reset memblock back to the top-down direction
> +	 * here because if we configured ACPI_NUMA, we have
> +	 * parsed SRAT in init_func(). It is ok to have the
> +	 * reset here even if we did't configure ACPI_NUMA
> +	 * or acpi numa init fails and fallbacks to dummy
> +	 * numa init.
> +	 */
> +	if (memblock_force_top_down)
> +		memblock_set_bottom_up(false);
> +
> +	ret = numa_cleanup_meminfo(&numa_meminfo);
> +	if (ret < 0)
> +		return ret;
> +
> +	numa_emulation(&numa_meminfo, numa_distance_cnt);
> +
> +	return numa_register_meminfo(&numa_meminfo);
> +}
> +
>  static int __init cmp_memblk(const void *a, const void *b)
>  {
>  	const struct numa_memblk *ma = *(const struct numa_memblk **)a;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

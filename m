Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E737C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 16:33:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0023B21902
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 16:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dVF4z1iA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0023B21902
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fnRiq6aHTs/+gBabdnwqQUcgMZkyXjEUjUl7YCuHF88=; b=dVF4z1iAl30iD/
	jgMAsfZCLOeOT0odekk9y9oNaj1xzVn4n/7oM76JuQQegKZjk+Lgmte+hyoR8FRZICRiR2/9JKuCZ
	J8CXPNabuMLY884/rqo8PerHqOilczrtmE4n5xdFSNH75vuwHnVC+JAdJD4SXRIy2+5JhzZwnJfNV
	wkA2hIEdYlnInsXlpWVMNvyl0StZHi+rg08cnc0qYfnFRhFhVnTdWWyGfaD382aVJSdURvwit92gE
	Tfm+UXVdpX7JAwjTc2DVQ0o9tLYq0mSwh4kjtWtN/CpVtV+cstrv6NjwhE3mjCizlhIwEO56922Uz
	rWOp0X0QlUP4LyjHlhMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtxTK-0002mm-G1; Wed, 13 Feb 2019 16:33:18 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtxTG-0002m9-NQ
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 16:33:16 +0000
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1DGUWct036215
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 11:33:13 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qmpeg1jg5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 11:33:12 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Wed, 13 Feb 2019 16:33:10 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 13 Feb 2019 16:33:07 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1DGX6Dh42598476
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Feb 2019 16:33:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF04D5204F;
 Wed, 13 Feb 2019 16:33:06 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.84])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 3CFFD52059;
 Wed, 13 Feb 2019 16:33:06 +0000 (GMT)
Date: Wed, 13 Feb 2019 18:33:04 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v6 2/5] RISC-V: Move setup_bootmem() to mm/init.c
References: <20190213115301.103989-1-anup.patel@wdc.com>
 <20190213115301.103989-3-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190213115301.103989-3-anup.patel@wdc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19021316-4275-0000-0000-0000030F141A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021316-4276-0000-0000-0000381D2D66
Message-Id: <20190213163304.GB6110@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-13_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902130118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_083314_882691_8F5D97E2 
X-CRM114-Status: GOOD (  30.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 13, 2019 at 11:53:37AM +0000, Anup Patel wrote:
> The setup_bootmem() mainly populates memblocks and does early memory
> reservations. The right location for this function is mm/init.c. It
> calls setup_initrd() so we move that as well.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  arch/riscv/include/asm/pgtable.h |  1 +
>  arch/riscv/kernel/setup.c        | 72 --------------------------------
>  arch/riscv/mm/init.c             | 70 +++++++++++++++++++++++++++++++
>  3 files changed, 71 insertions(+), 72 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 16301966d65b..35893810cba3 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -404,6 +404,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>  #define kern_addr_valid(addr)   (1) /* FIXME */
>  #endif
>  
> +extern void setup_bootmem(void);
>  extern void paging_init(void);
>  
>  static inline void pgtable_cache_init(void)
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index c6e858122815..49bce6692f39 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -23,7 +23,6 @@
>  #include <linux/mm.h>
>  #include <linux/memblock.h>
>  #include <linux/sched.h>
> -#include <linux/initrd.h>
>  #include <linux/console.h>
>  #include <linux/screen_info.h>
>  #include <linux/of_fdt.h>
> @@ -70,34 +69,6 @@ void __init smp_setup_processor_id(void)
>  	cpuid_to_hartid_map(0) = boot_cpu_hartid;
>  }
>  
> -#ifdef CONFIG_BLK_DEV_INITRD
> -static void __init setup_initrd(void)
> -{
> -	unsigned long size;
> -
> -	if (initrd_start >= initrd_end) {
> -		printk(KERN_INFO "initrd not found or empty");
> -		goto disable;
> -	}
> -	if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
> -		printk(KERN_ERR "initrd extends beyond end of memory");
> -		goto disable;
> -	}
> -
> -	size =  initrd_end - initrd_start;
> -	memblock_reserve(__pa(initrd_start), size);
> -	initrd_below_start_ok = 1;
> -
> -	printk(KERN_INFO "Initial ramdisk at: 0x%p (%lu bytes)\n",
> -		(void *)(initrd_start), size);
> -	return;
> -disable:
> -	pr_cont(" - disabling initrd\n");
> -	initrd_start = 0;
> -	initrd_end = 0;
> -}
> -#endif /* CONFIG_BLK_DEV_INITRD */
> -
>  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>  
> @@ -159,49 +130,6 @@ void __init parse_dtb(unsigned int hartid, void *dtb)
>  #endif
>  }
>  
> -static void __init setup_bootmem(void)
> -{
> -	struct memblock_region *reg;
> -	phys_addr_t mem_size = 0;
> -
> -	/* Find the memory region containing the kernel */
> -	for_each_memblock(memory, reg) {
> -		phys_addr_t vmlinux_end = __pa(_end);
> -		phys_addr_t end = reg->base + reg->size;
> -
> -		if (reg->base <= vmlinux_end && vmlinux_end <= end) {
> -			/*
> -			 * Reserve from the start of the region to the end of
> -			 * the kernel
> -			 */
> -			memblock_reserve(reg->base, vmlinux_end - reg->base);
> -			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
> -		}
> -	}
> -	BUG_ON(mem_size == 0);
> -
> -	set_max_mapnr(PFN_DOWN(mem_size));
> -	max_low_pfn = PFN_DOWN(memblock_end_of_DRAM());
> -
> -#ifdef CONFIG_BLK_DEV_INITRD
> -	setup_initrd();
> -#endif /* CONFIG_BLK_DEV_INITRD */
> -
> -	early_init_fdt_reserve_self();
> -	early_init_fdt_scan_reserved_mem();
> -	memblock_allow_resize();
> -	memblock_dump_all();
> -
> -	for_each_memblock(memory, reg) {
> -		unsigned long start_pfn = memblock_region_memory_base_pfn(reg);
> -		unsigned long end_pfn = memblock_region_memory_end_pfn(reg);
> -
> -		memblock_set_node(PFN_PHYS(start_pfn),
> -		                  PFN_PHYS(end_pfn - start_pfn),
> -		                  &memblock.memory, 0);
> -	}
> -}
> -
>  void __init setup_arch(char **cmdline_p)
>  {
>  	init_mm.start_code = (unsigned long) _stext;
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 658ebf645f42..bedaf04f9c2f 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -17,6 +17,7 @@
>  #include <linux/initrd.h>
>  #include <linux/swap.h>
>  #include <linux/sizes.h>
> +#include <linux/of_fdt.h>
>  
>  #include <asm/tlbflush.h>
>  #include <asm/sections.h>
> @@ -66,7 +67,76 @@ void free_initmem(void)
>  }
>  
>  #ifdef CONFIG_BLK_DEV_INITRD
> +static void __init setup_initrd(void)
> +{
> +	unsigned long size;
> +
> +	if (initrd_start >= initrd_end) {
> +		printk(KERN_INFO "initrd not found or empty");
> +		goto disable;
> +	}
> +	if (__pa(initrd_end) > PFN_PHYS(max_low_pfn)) {
> +		printk(KERN_ERR "initrd extends beyond end of memory");
> +		goto disable;
> +	}
> +
> +	size =  initrd_end - initrd_start;
> +	memblock_reserve(__pa(initrd_start), size);
> +	initrd_below_start_ok = 1;
> +
> +	printk(KERN_INFO "Initial ramdisk at: 0x%p (%lu bytes)\n",
> +		(void *)(initrd_start), size);
> +	return;
> +disable:
> +	pr_cont(" - disabling initrd\n");
> +	initrd_start = 0;
> +	initrd_end = 0;
> +}
> +
>  void free_initrd_mem(unsigned long start, unsigned long end)
>  {
>  }
>  #endif /* CONFIG_BLK_DEV_INITRD */
> +
> +void __init setup_bootmem(void)
> +{
> +	struct memblock_region *reg;
> +	phys_addr_t mem_size = 0;
> +
> +	/* Find the memory region containing the kernel */
> +	for_each_memblock(memory, reg) {
> +		phys_addr_t vmlinux_end = __pa(_end);
> +		phys_addr_t end = reg->base + reg->size;
> +
> +		if (reg->base <= vmlinux_end && vmlinux_end <= end) {
> +			/*
> +			 * Reserve from the start of the region to the end of
> +			 * the kernel
> +			 */
> +			memblock_reserve(reg->base, vmlinux_end - reg->base);
> +			mem_size = min(reg->size, (phys_addr_t)-PAGE_OFFSET);
> +		}
> +	}
> +	BUG_ON(mem_size == 0);
> +
> +	set_max_mapnr(PFN_DOWN(mem_size));
> +	max_low_pfn = PFN_DOWN(memblock_end_of_DRAM());
> +
> +#ifdef CONFIG_BLK_DEV_INITRD
> +	setup_initrd();
> +#endif /* CONFIG_BLK_DEV_INITRD */
> +
> +	early_init_fdt_reserve_self();
> +	early_init_fdt_scan_reserved_mem();
> +	memblock_allow_resize();
> +	memblock_dump_all();
> +
> +	for_each_memblock(memory, reg) {
> +		unsigned long start_pfn = memblock_region_memory_base_pfn(reg);
> +		unsigned long end_pfn = memblock_region_memory_end_pfn(reg);
> +
> +		memblock_set_node(PFN_PHYS(start_pfn),
> +				  PFN_PHYS(end_pfn - start_pfn),
> +				  &memblock.memory, 0);
> +	}
> +}
> -- 
> 2.17.1
> 

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

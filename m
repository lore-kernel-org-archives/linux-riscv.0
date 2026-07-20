Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B634EC4451B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWFhBOiYfk05fjVjqGXiXGSQr5hrkXayFav9XWuACng=; b=I6Qj19xS7YC1+X
	5zBsfgV0Bk1+hxcmir6xMXwvNJnY4vEs/ZORYHm9mXwiUd4j0ijILEeMndMVIQj1rPP3dXxgL3xEB
	267imYYHSkIvr8YxJmRbj7z1/fmNsvKNzl/j47XN6ho4JTE8hpLUxMGSpGP1PtKxNC84BMq+ERQde
	rDLatnxs6Xaek/b38ThmVC8rtgidx4buEHOS2irav4CSqg9OVbVVqhbZ49kQv1qfI8JodSbv4pvw0
	PZH1Bx1hDw+aF4KVQrpRYSFv+Crwk3/NgAYqBHooSY8gkvcr0yzSaT45Y1rqrEaSjzk9eq1+Z+oGG
	btGLzPHkiknKxeCh9ZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkB7-00000006Hu8-46ic;
	Mon, 20 Jul 2026 09:20:50 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkB5-00000006HtW-0zoY
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 09:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784539241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q6Qx3g1wyEXx3VvARHzwZS3T+SdKlMvCVf7lyUGl5RA=;
	b=F6yiRazt6V8WVAZ2vIYZXz2wfCACW2FCaZ9NbERExgwoeNBPEupZjkFTRb8wF3N6PIEwE2
	ZqbXPDhx6oJQydjCdKkPuBykD4PsVol0KydWRJN6Ia/NAOfC1De9cwRtwnJmPL9Id6T/2P
	42Xy0NNiOMxiF2mATGfAQKlwgVxm2f8=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] riscv/mm: use physical alignment for vmemmap_start_pfn
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260716115326.3466926-1-xujiakai2025@iscas.ac.cn>
Date: Mon, 20 Jul 2026 17:20:16 +0800
Cc: linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 David Hildenbrand <david@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Vishal Moola <vishal.moola@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 Junhui Liu <junhui.liu@pigmoral.tech>,
 Kiryl Shutsemau <kas@kernel.org>,
 Nam Cao <namcao@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>
Message-Id: <599C4370-89C3-4C73-8296-5723D73DDBB8@linux.dev>
References: <20260716115326.3466926-1-xujiakai2025@iscas.ac.cn>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_022047_635041_12345DCE 
X-CRM114-Status: GOOD (  24.02  )
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



> On Jul 16, 2026, at 19:53, Jiakai Xu <xujiakai2025@iscas.ac.cn> wrote:
> 
> RISC-V computes vmemmap_start_pfn by rounding phys_ram_base down to
> VMEMMAP_ADDR_ALIGN. That alignment must therefore be expressed in the
> physical-address domain.
> 
> Commit 476849b0fba4 ("riscv/mm: align vmemmap to maximal folio size")
> attempted to account for the maximal folio alignment by feeding
> MAX_FOLIO_VMEMMAP_ALIGN directly into VMEMMAP_ADDR_ALIGN. However,
> MAX_FOLIO_VMEMMAP_ALIGN is measured in bytes of struct page storage,
> whereas VMEMMAP_ADDR_ALIGN is used to align a physical address.
> 
> The mask-based compound_info encoding requires pfn_to_page(0) to be
> naturally aligned to MAX_FOLIO_VMEMMAP_ALIGN. Commit 9f94db4c7eaa
> ("mm/sparse: check memmap alignment for compound_info_has_mask()")
> added a check for that requirement and exposed the unit mismatch on
> systems such as QEMU virt, where the DRAM base is not aligned to
> MAX_FOLIO_NR_PAGES * PAGE_SIZE.
> 
> Convert MAX_FOLIO_VMEMMAP_ALIGN to the equivalent physical alignment
> before using it in VMEMMAP_ADDR_ALIGN. This keeps the existing
> round_down() logic while making the resulting vmemmap base satisfy the
> mask-alignment requirement.
> 
> Fixes: 476849b0fba4 ("riscv/mm: align vmemmap to maximal folio size")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Assisted-by: YuanSheng:DeepSeek-V4-Flash

I've always wondered why RISC-V uses a complex logic to calculate the
mapping relationship between vmemmap and PFN. We could easily follow the
x86 approach to make it much simpler.

I previously ran an experiment and found that the system boots perfectly
fine using the following diff code. Granted, I wrote this quite a while ago,
so it might not be directly compatible with the current codebase, but it
should work with some minor adjustments.

In this scenario, the overall processing logic would become significantly
more straightforward, and handling alignment would be much easier as well.

I'm not sure if the following direction is correct (Perhaps this was a
deliberate choice by RISC-V; I'm just not aware of the background behind it),
but from my perspective, it makes the code much simpler. We might need to
reach out to the relevant RISC-V maintainers to confirm whether this aligns
with what's expected.

Thanks,
Muchun

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index ffe213ad65a4..f2f67007f482 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -119,7 +119,6 @@ struct kernel_mapping {

extern struct kernel_mapping kernel_map;
extern phys_addr_t phys_ram_base;
-extern unsigned long vmemmap_start_pfn;

#define is_kernel_mapping(x) \
	((x) >= kernel_map.virt_addr && (x) < (kernel_map.virt_addr + kernel_map.size))
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 8bd36ac842eb..067c87062bcf 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -91,7 +91,7 @@
* Define vmemmap for pfn_to_page & page_to_pfn calls. Needed if kernel
* is configured with CONFIG_SPARSEMEM_VMEMMAP enabled.
*/
-#define vmemmap ((struct page *)VMEMMAP_START - vmemmap_start_pfn)
+#define vmemmap ((struct page *)VMEMMAP_START)

#define PCI_IO_SIZE SZ_16M
#define PCI_IO_END VMEMMAP_START
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index addb8a9305be..8f86a6d07a53 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -62,13 +62,6 @@ EXPORT_SYMBOL(pgtable_l5_enabled);
phys_addr_t phys_ram_base __ro_after_init;
EXPORT_SYMBOL(phys_ram_base);

-#ifdef CONFIG_SPARSEMEM_VMEMMAP
-#define VMEMMAP_ADDR_ALIGN (1ULL << SECTION_SIZE_BITS)
-
-unsigned long vmemmap_start_pfn __ro_after_init;
-EXPORT_SYMBOL(vmemmap_start_pfn);
-#endif
-
unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
__page_aligned_bss;
EXPORT_SYMBOL(empty_zero_page);
@@ -246,12 +239,8 @@ static void __init setup_bootmem(void)
	* Make sure we align the start of the memory on a PMD boundary so that
	* at worst, we map the linear mapping with PMD mappings.
	*/
- 	if (!IS_ENABLED(CONFIG_XIP_KERNEL)) {
+ 	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
		phys_ram_base = memblock_start_of_DRAM() & PMD_MASK;
-#ifdef CONFIG_SPARSEMEM_VMEMMAP
- 		vmemmap_start_pfn = round_down(phys_ram_base, VMEMMAP_ADDR_ALIGN) >> PAGE_SHIFT;
-#endif
- 	}

	/*
	 * In 64-bit, any use of __va/__pa before this point is wrong as we
@@ -1121,9 +1110,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
	kernel_map.xiprom_sz = (uintptr_t)(&_exiprom) - (uintptr_t)(&_xiprom);

	phys_ram_base = CONFIG_PHYS_RAM_BASE;
-#ifdef CONFIG_SPARSEMEM_VMEMMAP
- 	vmemmap_start_pfn = round_down(phys_ram_base, VMEMMAP_ADDR_ALIGN) >> PAGE_SHIFT;
-#endif
	kernel_map.phys_addr = (uintptr_t)CONFIG_PHYS_RAM_BASE;
	kernel_map.size = (uintptr_t)(&_end) - (uintptr_t)(&_start);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

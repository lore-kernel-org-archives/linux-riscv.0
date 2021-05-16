Return-Path: <SRS0=Jr9t=KL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BDFC433B4
	for <linux-riscv@archiver.kernel.org>; Sun, 16 May 2021 13:25:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0AB661007
	for <linux-riscv@archiver.kernel.org>; Sun, 16 May 2021 13:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0AB661007
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F0KYveneFgAvobOIij+NyClweLKx2KWdUVimqXHDuPQ=; b=k/2cTpWN8qDCqOuyY3hFpoyWH
	hsksONTu0eZEwb7c7KzchbExlpoY0xGERoTmtlrYjEQips9znHBWqE+aGBBHNbq04XuvKpORRi0VX
	qsaCKeXhnB0akkgvP/u/bYWO0NJzlmq1osgNMfE90Z0WD4RXV4ze7p//2E8ESMnMevCeKcCUzP1Mh
	ReEEeRJHAeFIr0SP23SVAtfmGwFaIOGVbeclGEmtg0VliDntDQmj3Dfogs1tDCln8/gwmatt+OLeF
	/a++kJuZ+glfnFUUt11YPLtNh2Bk1R9E5sSpUHTlA0Vwommtc5rziZtT9Om3vLm0WfS0lP58KjQPn
	TXIi7GSTA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liGlN-00CI3m-1H; Sun, 16 May 2021 13:24:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liGlL-00CI3K-Ge
 for linux-riscv@desiato.infradead.org; Sun, 16 May 2021 13:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:
 Date:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=ol06G4nr1oo7MVn8heW3nWJm+xuuLewzgqmixnQS5zA=; b=ZIu/MtVCrknP/izoSlHZd5Iflg
 351bHxfIas5jTqserOeBTyRy+srAUz7byHGnUM088uwvIGyTK4x+dl4XrDRfXZI17C+Z7EoHAq8Eb
 d0okDbIhbufYeLkJ/z1oL0G/+VdFHTEP5eSkQGIhLBiuC2yn7rwdVi9wxP1yHlcUJ9AsmgX+VK5BU
 CXIPKmowJczzXkN5123zr3U4aaQ8HbBwIEZCIMR62KVS1zao8Li13bsSDt+KN+aEBt7+8OF315a2H
 CQJiFJt6p7JKJasyWG2oQAK5I+hGYOx9yXzJV1hYtOEtwmxQcO9WTPoHdI91vGAazhF/flftLu9EZ
 +sycXlzg==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1liGlH-00CwP5-Ax
 for linux-riscv@lists.infradead.org; Sun, 16 May 2021 13:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=ol06G4nr1oo7MVn8heW3nWJm+xuuLewzgq
 mixnQS5zA=; b=aKYU5AejENmlnO2F4v2j4l1Aun/VW+VfkhGftLw6NMNTx5YP3o
 lb0I7b/VmYHwkfBbO5hBqAOxjCxWWjqQfTZ5u7SlA+Fl4DvC/EsruNDUpvFGO+Xx
 dtOqecXA7wy28Vh+n5l1RMaJo6oph4GK3J+dk05J7eMICbDSCjts2JLNg=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDX3JgWHaFgcOLoAA--.17748S2; 
 Sun, 16 May 2021 21:24:38 +0800 (CST)
Date: Sun, 16 May 2021 21:19:22 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: mm: init: Consolidate vars, functions
Message-ID: <20210516211922.2110232e@xhacker>
In-Reply-To: <20210516211556.43c00055@xhacker>
References: <20210516211556.43c00055@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDX3JgWHaFgcOLoAA--.17748S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AFy3Cr15CF43CrW5ArW3Awb_yoWxurWrpr
 WkJF1UGF4UXFyqgayxJr98uryrZwn7Wry3tF42k34kA3ZxCr1fWr1jgr4Svry0grWkWa1f
 ZrZ5ta9rZa17trUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
 W3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
 JrUvcSsGvfC2KfnxnUUI43ZEXa7IU56UDtUUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_062452_715556_82B9BC10 
X-CRM114-Status: GOOD (  19.61  )
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

On Sun, 16 May 2021 21:15:56 +0800 Jisheng Zhang  wrote:

> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Consolidate the following items in init.c
> 
> Staticize global vars as much as possible;
> Add __initdata mark if the global var isn't needed after init
> Add __init mark if the func isn't needed after init
> Add __ro_after_init if the global var is read only after init

Hi Alexandre,

I think kernel_virt_addr can be removed, users can directly use
the KERNEL_LINK_ADDR MACRO. Maybe I miss the reason of intrducing
it in commit 2bfc6cd81bd17e43 ("riscv: Move kernel mapping outside of
linear mapping"), could you please comment?

Thanks in advance

> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/set_memory.h |  2 +-
>  arch/riscv/mm/init.c                | 36 +++++++++++++++--------------
>  2 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index 086f757e8ba3..9d4d455726d4 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -27,7 +27,7 @@ static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0;
>  #endif
>  
>  #if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> -void protect_kernel_linear_mapping_text_rodata(void);
> +void __init protect_kernel_linear_mapping_text_rodata(void);
>  #else
>  static inline void protect_kernel_linear_mapping_text_rodata(void) {}
>  #endif
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 4c4c92ce0bb8..eac2d5c27b3e 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -53,7 +53,7 @@ struct pt_alloc_ops {
>  #endif
>  };
>  
> -static phys_addr_t dma32_phys_limit __ro_after_init;
> +static phys_addr_t dma32_phys_limit __initdata;
>  
>  static void __init zone_sizes_init(void)
>  {
> @@ -184,7 +184,7 @@ extern char _sdata[], _edata[];
>  #endif /* CONFIG_XIP_KERNEL */
>  
>  #ifdef CONFIG_MMU
> -static struct pt_alloc_ops _pt_ops __ro_after_init;
> +static struct pt_alloc_ops _pt_ops __initdata;
>  
>  #ifdef CONFIG_XIP_KERNEL
>  #define pt_ops (*(struct pt_alloc_ops *)XIP_FIXUP(&_pt_ops))
> @@ -200,13 +200,13 @@ EXPORT_SYMBOL(va_pa_offset);
>  #endif
>  /* Offset between kernel mapping virtual address and kernel load address */
>  #ifdef CONFIG_64BIT
> -unsigned long va_kernel_pa_offset;
> +unsigned long va_kernel_pa_offset __ro_after_init;
>  EXPORT_SYMBOL(va_kernel_pa_offset);
>  #endif
>  #ifdef CONFIG_XIP_KERNEL
>  #define va_kernel_pa_offset    (*((unsigned long *)XIP_FIXUP(&va_kernel_pa_offset)))
>  #endif
> -unsigned long va_kernel_xip_pa_offset;
> +unsigned long va_kernel_xip_pa_offset __ro_after_init;
>  EXPORT_SYMBOL(va_kernel_xip_pa_offset);
>  #ifdef CONFIG_XIP_KERNEL
>  #define va_kernel_xip_pa_offset        (*((unsigned long *)XIP_FIXUP(&va_kernel_xip_pa_offset)))
> @@ -216,7 +216,7 @@ EXPORT_SYMBOL(pfn_base);
>  
>  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> -pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
> +static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
>  
>  pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>  
> @@ -253,7 +253,7 @@ static inline pte_t *__init get_pte_virt_fixmap(phys_addr_t pa)
>  	return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
>  }
>  
> -static inline pte_t *get_pte_virt_late(phys_addr_t pa)
> +static inline pte_t *__init get_pte_virt_late(phys_addr_t pa)
>  {
>  	return (pte_t *) __va(pa);
>  }
> @@ -272,7 +272,7 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
>  	return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
>  }
>  
> -static phys_addr_t alloc_pte_late(uintptr_t va)
> +static phys_addr_t __init alloc_pte_late(uintptr_t va)
>  {
>  	unsigned long vaddr;
>  
> @@ -296,10 +296,10 @@ static void __init create_pte_mapping(pte_t *ptep,
>  
>  #ifndef __PAGETABLE_PMD_FOLDED
>  
> -pmd_t trampoline_pmd[PTRS_PER_PMD] __page_aligned_bss;
> -pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
> -pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
> -pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
> +static pmd_t trampoline_pmd[PTRS_PER_PMD] __page_aligned_bss;
> +static pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
> +static pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
> +static pmd_t early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
>  
>  #ifdef CONFIG_XIP_KERNEL
>  #define trampoline_pmd ((pmd_t *)XIP_FIXUP(trampoline_pmd))
> @@ -319,7 +319,7 @@ static pmd_t *__init get_pmd_virt_fixmap(phys_addr_t pa)
>  	return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
>  }
>  
> -static pmd_t *get_pmd_virt_late(phys_addr_t pa)
> +static pmd_t *__init get_pmd_virt_late(phys_addr_t pa)
>  {
>  	return (pmd_t *) __va(pa);
>  }
> @@ -336,7 +336,7 @@ static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
>  	return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
>  }
>  
> -static phys_addr_t alloc_pmd_late(uintptr_t va)
> +static phys_addr_t __init alloc_pmd_late(uintptr_t va)
>  {
>  	unsigned long vaddr;
>  
> @@ -454,14 +454,16 @@ asmlinkage void __init __copy_data(void)
>  #error "setup_vm() is called from head.S before relocate so it should not use absolute addressing."
>  #endif
>  
> -uintptr_t load_pa, load_sz;
> +static uintptr_t load_pa __initdata;
> +static uintptr_t load_sz __initdata;
>  #ifdef CONFIG_XIP_KERNEL
>  #define load_pa        (*((uintptr_t *)XIP_FIXUP(&load_pa)))
>  #define load_sz        (*((uintptr_t *)XIP_FIXUP(&load_sz)))
>  #endif
>  
>  #ifdef CONFIG_XIP_KERNEL
> -uintptr_t xiprom, xiprom_sz;
> +static uintptr_t xiprom __inidata;
> +static uintptr_t xiprom_sz __initdata;
>  #define xiprom_sz      (*((uintptr_t *)XIP_FIXUP(&xiprom_sz)))
>  #define xiprom         (*((uintptr_t *)XIP_FIXUP(&xiprom)))
>  
> @@ -646,7 +648,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  }
>  
>  #if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> -void protect_kernel_linear_mapping_text_rodata(void)
> +void __init protect_kernel_linear_mapping_text_rodata(void)
>  {
>  	unsigned long text_start = (unsigned long)lm_alias(_start);
>  	unsigned long init_text_start = (unsigned long)lm_alias(__init_text_begin);
> @@ -858,7 +860,7 @@ static void __init reserve_crashkernel(void)
>   * reserved once we call early_init_fdt_scan_reserved_mem()
>   * later on.
>   */
> -static int elfcore_hdr_setup(struct reserved_mem *rmem)
> +static int __init elfcore_hdr_setup(struct reserved_mem *rmem)
>  {
>  	elfcorehdr_addr = rmem->base;
>  	elfcorehdr_size = rmem->size;



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

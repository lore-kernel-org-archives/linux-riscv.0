Return-Path: <SRS0=qf9j=BX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BAAC433E3
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 08:58:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83A7E20771
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2020 08:58:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uwo6rgat";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="P0vxc039"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83A7E20771
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VelwrjvH2/4HvASl+Y0wFNGGDDEYCGjsOIcorSLMXl0=; b=uwo6rgatrlivHiqGeYOEAJFSi
	28iQ3DkFONyT6qBkxuUKSt+tJzNoaujO83/DCa9qkYDoPx1TMs3AyHjo9fOYOO/lmeU0yUNGdFzjg
	XdUT61enGCUwue6zBkRwQ+1VGSXuXrCG40XMGC+CcTF7YhhGZhyGGc4IFGETQYUdV0Dk0MdqGeSYC
	1x82JThxk2cMYF1ApxS7k7dFhpjk/LU3IB0q6G9ZY/SN9YqXXSfBgTduS0Rebcz1yuXkpvPbawrL/
	0xPrkRqQLZ6eo2RbmJUcR2e7exhmfuNiJZYfR1QRHHzsgSHK8R/3uPkI3I75xR0PiOmXv3eM0vfxN
	qnIWwpzow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k693y-0005pu-Kk; Thu, 13 Aug 2020 08:58:18 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k693w-0005pY-Ka
 for linux-riscv@lists.infradead.org; Thu, 13 Aug 2020 08:58:17 +0000
Received: by mail-wm1-x343.google.com with SMTP id c80so4025990wme.0
 for <linux-riscv@lists.infradead.org>; Thu, 13 Aug 2020 01:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7ejOXH1LQTXrGTOxhVaMU2TYELrccVatdEWcGAK3Sjw=;
 b=P0vxc039Nc76V/6Rh0lKYHO+QHOD59pM77+iDKGJHEdV1gXadGYcNlamm6GJok7Lcx
 erNEgkh194Mu2P90joK7JlyIHPQxnUZW8mDcF2HS6T+L45gkx1fqoPO/GvKZ3D2yFBSc
 kBnDZh31uDw6IJCEf9aP89Ee6TwK0F7xVcrUWFWeHGmk7BibunPOcqRp7ddlTdcbsEPp
 uWeYrjGmuC3umaZYRvPVjAmViw67Fs8d1CUOuZnpGVyCZD8Po+bcK9HV7xqyAEATcXFy
 HOTJ7a+qFjtIE3/Ldo5+Z1Yox4Y5EFnDve9qnTUVQ54+7jO7PfJHuhI4cb0dQn/Y7Aic
 3qOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ejOXH1LQTXrGTOxhVaMU2TYELrccVatdEWcGAK3Sjw=;
 b=Z2g3XhfMJQKirdl0SPf/d7qay1mArxn7kdI2z1AIZzciWoViUzWy1aT5m5ZdZSBeuC
 kH9C3LYNt2hrHvAQEKDyY8OITfVLA2uzqpYsroKyCYl4cwC5RXAgohzJoTjXeOfiRhY5
 KOaPlOOGR+dtm8i8aIOxsoDVSv4F6doU+mFHng6dcsSCpz8A2MMoMRn/Nf7KhjXe9q46
 e35MEsVwW+Rc5P4tLAsi14NsBHt1KrYGhiffNU+28w42YDZh1Y1la2hhxL12KIpW+HOW
 hcCdoIY9SCymihOXuXZ15nYV9Omoi1AnFLuygv/+IS5lAvPv3zs+InSeJTYoew2RiW6U
 zZsQ==
X-Gm-Message-State: AOAM530uaBy3zq9AIHXyqAt2DOu1sqIjkrFvZFKy+WKsxKSD1+L6eaoI
 XZOPIy+ilzAKY6Ll26dr3uk/WPKHfWUuOhSuMLEY4g==
X-Google-Smtp-Source: ABdhPJydHDppTz/E+mk7vmLwdcwMEGXhikXzJOI8CfN3YTccGMRBhG08jWr2bhSuzMpdsnC0rgQs2DRZ3VOpfnSt+N0=
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr3596831wmk.185.1597309095228; 
 Thu, 13 Aug 2020 01:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200812234758.3563-1-atish.patra@wdc.com>
 <20200812234758.3563-4-atish.patra@wdc.com>
In-Reply-To: <20200812234758.3563-4-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Aug 2020 14:28:03 +0530
Message-ID: <CAAhSdy3AuDi=JZN9beo5rhNnUD+bng+7t9qVTNNLZY8Yr2+Qhg@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] RISC-V: Implement late mapping page table
 allocation functions
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_045816_712495_39414D39 
X-CRM114-Status: GOOD (  27.15  )
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
Cc: linux-efi <linux-efi@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arvind Sankar <nivedita@alum.mit.edu>,
 Alistair Francis <alistair.francis@wdc.com>, Waiman Long <longman@redhat.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Steven Price <steven.price@arm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Borislav Petkov <bp@suse.de>,
 Mao Han <han_mao@c-sky.com>, Daniel Schaefer <daniel.schaefer@hpe.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 "abner.chang@hpe.com" <abner.chang@hpe.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, fwts-devel@lists.ubuntu.com,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 13, 2020 at 5:19 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, page table setup is done during setup_va_final where fixmap can
> be used to create the temporary mappings. The physical frame is allocated
> from memblock_alloc_* functions. However, this won't work if page table
> mapping needs to be created for a different mm context (i.e. efi mm) at
> a later point of time.
>
> Use generic kernel page allocation function & macros for any mapping
> after setup_vm_final.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/mm/init.c | 130 ++++++++++++++++++++++++++++++++-----------
>  1 file changed, 99 insertions(+), 31 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b75ebe8e7a92..d238cdc501ee 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -32,6 +32,17 @@ extern char _start[];
>  void *dtb_early_va __initdata;
>  uintptr_t dtb_early_pa __initdata;
>
> +struct pt_alloc_ops {
> +       pte_t *(*get_pte_virt)(phys_addr_t pa);
> +       phys_addr_t (*alloc_pte)(uintptr_t va);
> +#ifndef __PAGETABLE_PMD_FOLDED
> +       pmd_t *(*get_pmd_virt)(phys_addr_t pa);
> +       phys_addr_t (*alloc_pmd)(uintptr_t va);
> +#endif
> +};
> +
> +struct pt_alloc_ops pt_ops;
> +
>  static void __init zone_sizes_init(void)
>  {
>         unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
> @@ -211,7 +222,6 @@ EXPORT_SYMBOL(pfn_base);
>  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
> -static bool mmu_enabled;
>
>  #define MAX_EARLY_MAPPING_SIZE SZ_128M
>
> @@ -234,27 +244,46 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
>         }
>  }
>
> -static pte_t *__init get_pte_virt(phys_addr_t pa)
> +static inline pte_t *__init get_pte_virt_early(phys_addr_t pa)
>  {
> -       if (mmu_enabled) {
> -               clear_fixmap(FIX_PTE);
> -               return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
> -       } else {
> -               return (pte_t *)((uintptr_t)pa);
> -       }
> +       return (pte_t *)((uintptr_t)pa);
>  }
>
> -static phys_addr_t __init alloc_pte(uintptr_t va)
> +static inline pte_t *__init get_pte_virt_fixmap(phys_addr_t pa)
> +{
> +       clear_fixmap(FIX_PTE);
> +       return (pte_t *)set_fixmap_offset(FIX_PTE, pa);
> +}
> +
> +static inline pte_t *get_pte_virt_late(phys_addr_t pa)
> +{
> +       return (pte_t *) __va(pa);
> +}
> +
> +static inline phys_addr_t __init alloc_pte_early(uintptr_t va)
>  {
>         /*
>          * We only create PMD or PGD early mappings so we
>          * should never reach here with MMU disabled.
>          */
> -       BUG_ON(!mmu_enabled);
> +       BUG();
> +}
>
> +static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
> +{
>         return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
>  }
>
> +static phys_addr_t alloc_pte_late(uintptr_t va)
> +{
> +       unsigned long vaddr;
> +
> +       vaddr = __get_free_page(GFP_KERNEL);
> +       if (!vaddr || !pgtable_pte_page_ctor(virt_to_page(vaddr)))
> +               BUG();
> +       return __pa(vaddr);
> +}
> +
>  static void __init create_pte_mapping(pte_t *ptep,
>                                       uintptr_t va, phys_addr_t pa,
>                                       phys_addr_t sz, pgprot_t prot)
> @@ -279,28 +308,46 @@ pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
>  #endif
>  pmd_t early_pmd[PTRS_PER_PMD * NUM_EARLY_PMDS] __initdata __aligned(PAGE_SIZE);
>
> -static pmd_t *__init get_pmd_virt(phys_addr_t pa)
> +static pmd_t *__init get_pmd_virt_early(phys_addr_t pa)
>  {
> -       if (mmu_enabled) {
> -               clear_fixmap(FIX_PMD);
> -               return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
> -       } else {
> -               return (pmd_t *)((uintptr_t)pa);
> -       }
> +       /* Before MMU is enabled */
> +       return (pmd_t *)((uintptr_t)pa);
>  }
>
> -static phys_addr_t __init alloc_pmd(uintptr_t va)
> +static pmd_t *__init get_pmd_virt_fixmap(phys_addr_t pa)
>  {
> -       uintptr_t pmd_num;
> +       clear_fixmap(FIX_PMD);
> +       return (pmd_t *)set_fixmap_offset(FIX_PMD, pa);
> +}
> +
> +static pmd_t *get_pmd_virt_late(phys_addr_t pa)
> +{
> +       return (pmd_t *) __va(pa);
> +}
>
> -       if (mmu_enabled)
> -               return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> +static phys_addr_t __init alloc_pmd_early(uintptr_t va)
> +{
> +       uintptr_t pmd_num;
>
>         pmd_num = (va - PAGE_OFFSET) >> PGDIR_SHIFT;
>         BUG_ON(pmd_num >= NUM_EARLY_PMDS);
>         return (uintptr_t)&early_pmd[pmd_num * PTRS_PER_PMD];
>  }
>
> +static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
> +{
> +       return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> +}
> +
> +static phys_addr_t alloc_pmd_late(uintptr_t va)
> +{
> +       unsigned long vaddr;
> +
> +       vaddr = __get_free_page(GFP_KERNEL);
> +       BUG_ON(!vaddr);
> +       return __pa(vaddr);
> +}
> +
>  static void __init create_pmd_mapping(pmd_t *pmdp,
>                                       uintptr_t va, phys_addr_t pa,
>                                       phys_addr_t sz, pgprot_t prot)
> @@ -316,28 +363,28 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
>         }
>
>         if (pmd_none(pmdp[pmd_idx])) {
> -               pte_phys = alloc_pte(va);
> +               pte_phys = pt_ops.alloc_pte(va);
>                 pmdp[pmd_idx] = pfn_pmd(PFN_DOWN(pte_phys), PAGE_TABLE);
> -               ptep = get_pte_virt(pte_phys);
> +               ptep = pt_ops.get_pte_virt(pte_phys);
>                 memset(ptep, 0, PAGE_SIZE);
>         } else {
>                 pte_phys = PFN_PHYS(_pmd_pfn(pmdp[pmd_idx]));
> -               ptep = get_pte_virt(pte_phys);
> +               ptep = pt_ops.get_pte_virt(pte_phys);
>         }
>
>         create_pte_mapping(ptep, va, pa, sz, prot);
>  }
>
>  #define pgd_next_t             pmd_t
> -#define alloc_pgd_next(__va)   alloc_pmd(__va)
> -#define get_pgd_next_virt(__pa)        get_pmd_virt(__pa)
> +#define alloc_pgd_next(__va)   pt_ops.alloc_pmd(__va)
> +#define get_pgd_next_virt(__pa)        pt_ops.get_pmd_virt(__pa)
>  #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)     \
>         create_pmd_mapping(__nextp, __va, __pa, __sz, __prot)
>  #define fixmap_pgd_next                fixmap_pmd
>  #else
>  #define pgd_next_t             pte_t
> -#define alloc_pgd_next(__va)   alloc_pte(__va)
> -#define get_pgd_next_virt(__pa)        get_pte_virt(__pa)
> +#define alloc_pgd_next(__va)   pt_ops.alloc_pte(__va)
> +#define get_pgd_next_virt(__pa)        pt_ops.get_pte_virt(__pa)
>  #define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)     \
>         create_pte_mapping(__nextp, __va, __pa, __sz, __prot)
>  #define fixmap_pgd_next                fixmap_pte
> @@ -421,6 +468,12 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>         BUG_ON((load_pa % map_size) != 0);
>         BUG_ON(load_sz > MAX_EARLY_MAPPING_SIZE);
>
> +       pt_ops.alloc_pte = alloc_pte_early;
> +       pt_ops.get_pte_virt = get_pte_virt_early;
> +#ifndef __PAGETABLE_PMD_FOLDED
> +       pt_ops.alloc_pmd = alloc_pmd_early;
> +       pt_ops.get_pmd_virt = get_pmd_virt_early;
> +#endif
>         /* Setup early PGD for fixmap */
>         create_pgd_mapping(early_pg_dir, FIXADDR_START,
>                            (uintptr_t)fixmap_pgd_next, PGDIR_SIZE, PAGE_TABLE);
> @@ -497,9 +550,16 @@ static void __init setup_vm_final(void)
>         phys_addr_t pa, start, end;
>         struct memblock_region *reg;
>
> -       /* Set mmu_enabled flag */
> -       mmu_enabled = true;
> -
> +       /**
> +        * MMU is enabled at this point. But page table setup is not complete yet.
> +        * fixmap page table alloc functions should be used at this point
> +        */
> +       pt_ops.alloc_pte = alloc_pte_fixmap;
> +       pt_ops.get_pte_virt = get_pte_virt_fixmap;
> +#ifndef __PAGETABLE_PMD_FOLDED
> +       pt_ops.alloc_pmd = alloc_pmd_fixmap;
> +       pt_ops.get_pmd_virt = get_pmd_virt_fixmap;
> +#endif
>         /* Setup swapper PGD for fixmap */
>         create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
>                            __pa_symbol(fixmap_pgd_next),
> @@ -533,6 +593,14 @@ static void __init setup_vm_final(void)
>         /* Move to swapper page table */
>         csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | SATP_MODE);
>         local_flush_tlb_all();
> +
> +       /* generic page allocation functions must be used to setup page table */
> +       pt_ops.alloc_pte = alloc_pte_late;
> +       pt_ops.get_pte_virt = get_pte_virt_late;
> +#ifndef __PAGETABLE_PMD_FOLDED
> +       pt_ops.alloc_pmd = alloc_pmd_late;
> +       pt_ops.get_pmd_virt = get_pmd_virt_late;
> +#endif
>  }
>  #else
>  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> --
> 2.24.0
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

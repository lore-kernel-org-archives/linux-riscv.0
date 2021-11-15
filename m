Return-Path: <SRS0=clKS=QC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E76C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Nov 2021 08:28:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50EAE61BFD
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Nov 2021 08:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50EAE61BFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stmzWfxwy7kUYxfXhxZktzyQmRn0iR1KJnijRqG0HAI=; b=KaknGlOQg+75ks
	OQed6bAvp6UndOGHNIPIHESHoZrxc7ZRjYUx6BjicJwkJXRWvNEby/Oj40373/2eVvLwW5mUUZubB
	9wXz0fkZVqIPlb1+V5pLJ4P/qYAdpYpKy83pjLx8F29Ekhwcoqiznb/mk2EGibYKNGdnr6H6V8DBR
	hAL6uXvvRWRrbrp3rx51XV82HE9lhuXYSz87nrChxl7N7k7rjo+k0JMKW9rtKtH7CIV0bSu8GJQkx
	f1cEu9I9w3dIuNRlqkZncId0RyQ2KhcvU07c+Lqq3SWYmPDwIAkJjAoRRnU15Mq9mV+ey+XkgdmAI
	K2xG595D6/KDUI1GVq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmXM7-00EhFy-TF; Mon, 15 Nov 2021 08:28:47 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmXM3-00EhFE-2f
 for linux-riscv@lists.infradead.org; Mon, 15 Nov 2021 08:28:46 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 109B83F19D
 for <linux-riscv@lists.infradead.org>; Mon, 15 Nov 2021 08:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636964915;
 bh=CJ0wNgaWQdOtyQPjBJqz2DGZ/nNU0zzRHg0aLcE/7Dk=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=tBS7n9j+yB97RFUsdFTBDCOMJg8JGjKUdW/diCujkIerLnZj0AgSvEAqOAQXIwXvP
 TZ5IldACGenXJH3vYpkIL/Bp3h02Sl2P9D1zYGKecUHMxD9hpW7Ma/69MUvWPj/mQ9
 g2dQ0QGlAfHXFKkhqiygqdRUpHbo4FOClT0G6A4J1WcB59MAmEdCjAV8HuTVHOrHbi
 GmsC3f0ZYsX0mBTMKdK9MXSTkq7x6VmIvLCyZyub6192dWQfcNMZSxLiIKPCubJwQJ
 jdA9m1zCCaFhe3qAsGt54Eggmt5vMpHFR1z5HlzJqq6C5bB6MStcxjK6PCbou93oPq
 mzUGLk5vgbPyw==
Received: by mail-ed1-f70.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so13259359edl.17
 for <linux-riscv@lists.infradead.org>; Mon, 15 Nov 2021 00:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CJ0wNgaWQdOtyQPjBJqz2DGZ/nNU0zzRHg0aLcE/7Dk=;
 b=KSxfXM1S2YLYLIE0Xj7JFmyh4VgSYaqZyQvfssalMdXTVriuv/X85qP2EIvQ1GsvFi
 zfePdmum232s1lchO+6tnb+PfWp63n/C7ULTtqqwhEP76YhnfJCcCqLCcGiPK28mKxK9
 ZpqlZNQbS3cWJ31mGYKvz1UHQXWVj4GbSNLjXa8+3dtNItQzgnOOEDFGyt2L1Jq33+Nn
 3XovTDSmTF5GLTF1p36nVOQkct8E8EynhfMu5wQKTWx6TUNw6N2x0t/h+7C2nG8emvrX
 bWK5LJKVi0faEkbFBCzQQqCQPUPEseiq+nI+NYojhCmXPcc3D/rZ2CdjYUu5AHPVNy8a
 m6yQ==
X-Gm-Message-State: AOAM530zTjOJEOcgOzaNsZE742OuEMXcRZicX3kM/dKBy2xChxZSnMf+
 I77O0gJecmOtD7aPBHw7dVeLhTrhd+SWzNaHuyCeGApulJP4xM/VXOV+cFUxbVnMt6s/Ya5FyPI
 xYvpwRDjXk6u3gTuE5ktXfEUWOp4OWATkto3xIv5jxfrNY45W6MZaKzVeJwJnRg==
X-Received: by 2002:a50:d74e:: with SMTP id i14mr31089579edj.243.1636964914122; 
 Mon, 15 Nov 2021 00:28:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/PX6XKXBNspT6O6NlB4nZie8jhUK/dnz2W0uoPC0ZS7wUzlMPs8G8GFcYyaU6+O2bSzH2UvNc/hkT3ehEOLw=
X-Received: by 2002:a50:d74e:: with SMTP id i14mr31089532edj.243.1636964913722; 
 Mon, 15 Nov 2021 00:28:33 -0800 (PST)
MIME-Version: 1.0
References: <20211114070449.2891370-1-panqinglin2020@iscas.ac.cn>
In-Reply-To: <20211114070449.2891370-1-panqinglin2020@iscas.ac.cn>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Mon, 15 Nov 2021 09:28:22 +0100
Message-ID: <CA+zEjCuBBQ6Efs_agOohJtd3C1sXR6QcHevZEci5Yjmi+dykKA@mail.gmail.com>
Subject: Re: [PATCH] Add Sv57 page table support
To: panqinglin2020@iscas.ac.cn
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>,
 xuyinan@ict.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_002843_533550_AE0AEBFE 
X-CRM114-Status: GOOD (  29.84  )
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

Hi Qinglin,

On Sun, Nov 14, 2021 at 8:10 AM <panqinglin2020@iscas.ac.cn> wrote:
>
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>
> Sv57 is the 5-level page table for RISC-V in 64 bits. This extension
> accepts 57-bits virtual address and converts it to 56-bits physical
> address.
>
> This patch add pgtable helper functions needed by Sv57 and makes it
> compatible with current Sv32 and Sv39. It has been tested by
>
> * set configuration file to defconfig and the Page Table Type config item
>   to Sv39 or Sv57, and boot the kernel on qemu
> * set configuration file to rv32_defconfig and the Page Table Type config item
>   to Sv32, and boot the kernel on qemu
>
> Yours,
> Qinglin
>
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: xuyinan@ict.ac.cn
> ---
>  arch/riscv/Kconfig                  |  36 ++-
>  arch/riscv/include/asm/csr.h        |   5 +
>  arch/riscv/include/asm/fixmap.h     |   6 +
>  arch/riscv/include/asm/pgalloc.h    |  51 ++++-
>  arch/riscv/include/asm/pgtable-64.h | 136 ++++++++++++
>  arch/riscv/include/asm/pgtable.h    |   1 -
>  arch/riscv/mm/init.c                | 326 ++++++++++++++++++++++++----
>  7 files changed, 506 insertions(+), 55 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 301a54233c7e..b4b65f054ffb 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -125,8 +125,9 @@ config ARCH_MMAP_RND_BITS_MIN
>  # max bits determined by the following formula:
>  #  VA_BITS - PAGE_SHIFT - 3
>  config ARCH_MMAP_RND_BITS_MAX
> -       default 24 if 64BIT # SV39 based
> -       default 17
> +       default 42 if PGTABLE_LEVELS = 5
> +       default 24 if PGTABLE_LEVELS = 3
> +       default 17 if PGTABLE_LEVELS = 2
>
>  # set if we run in machine mode, cleared if we run in supervisor mode
>  config RISCV_M_MODE
> @@ -148,8 +149,9 @@ config MMU
>
>  config VA_BITS
>         int
> -       default 32 if 32BIT
> -       default 39 if 64BIT
> +       default 57 if PGTABLE_LEVELS = 5
> +       default 39 if PGTABLE_LEVELS = 3
> +       default 32 if PGTABLE_LEVELS = 2
>
>  config PA_BITS
>         int
> @@ -204,10 +206,32 @@ config GENERIC_HWEIGHT
>  config FIX_EARLYCON_MEM
>         def_bool MMU
>
> +choice
> +       prompt  "Page Table Type"
> +       default Sv32 if 32BIT
> +       default Sv39 if 64BIT
> +
> +config Sv32
> +       bool "Sv32 Page Table"
> +       depends on MMU
> +       depends on 32BIT
> +
> +config Sv39
> +       bool "Sv39 Page Table"
> +       depends on MMU
> +       depends on 64BIT
> +
> +config Sv57
> +       bool "Sv57 Page Table"
> +       depends on MMU
> +       depends on 64BIT
> +endchoice
> +
>  config PGTABLE_LEVELS
>         int
> -       default 3 if 64BIT
> -       default 2
> +       default 5 if Sv57
> +       default 3 if Sv39
> +       default 2 if Sv32
>
>  config LOCKDEP_SUPPORT
>         def_bool y
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 87ac65696871..7b2e837827c1 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -47,7 +47,12 @@
>  #else
>  #define SATP_PPN       _AC(0x00000FFFFFFFFFFF, UL)
>  #define SATP_MODE_39   _AC(0x8000000000000000, UL)
> +#define SATP_MODE_57   _AC(0xA000000000000000, UL)
> +#if CONFIG_PGTABLE_LEVELS > 4
> +#define SATP_MODE      SATP_MODE_57
> +#else
>  #define SATP_MODE      SATP_MODE_39
> +#endif
>  #define SATP_ASID_BITS 16
>  #define SATP_ASID_SHIFT        44
>  #define SATP_ASID_MASK _AC(0xFFFF, UL)
> diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
> index 54cbf07fb4e9..80bc814bec82 100644
> --- a/arch/riscv/include/asm/fixmap.h
> +++ b/arch/riscv/include/asm/fixmap.h
> @@ -24,6 +24,12 @@ enum fixed_addresses {
>         FIX_HOLE,
>         FIX_PTE,
>         FIX_PMD,
> +#if CONFIG_PGTABLE_LEVELS > 3
> +       FIX_PUD,
> +#endif
> +#if CONFIG_PGTABLE_LEVELS > 4
> +       FIX_P4D,
> +#endif
>         FIX_TEXT_POKE1,
>         FIX_TEXT_POKE0,
>         FIX_EARLYCON_MEM_BASE,
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> index 0af6933a7100..27d6fb2f65fe 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -29,14 +29,55 @@ static inline void pmd_populate(struct mm_struct *mm,
>         set_pmd(pmd, __pmd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
>  }
>
> -#ifndef __PAGETABLE_PMD_FOLDED
> +#if CONFIG_PGTABLE_LEVELS > 2
>  static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
>  {
>         unsigned long pfn = virt_to_pfn(pmd);
>
>         set_pud(pud, __pud((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
>  }
> -#endif /* __PAGETABLE_PMD_FOLDED */
> +
> +#define __pmd_free_tlb(tlb, pmd, addr)  pmd_free((tlb)->mm, pmd)
> +
> +#if CONFIG_PGTABLE_LEVELS > 3
> +
> +static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
> +{
> +       unsigned long pfn = virt_to_pfn(pud);
> +
> +       set_p4d(p4d, __p4d((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
> +}
> +
> +static inline void pud_free(struct mm_struct *mm, pud_t *pud);
> +#define __pud_free_tlb(tlb, pud, addr)  pud_free((tlb)->mm, pud)
> +
> +#if CONFIG_PGTABLE_LEVELS > 4
> +static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
> +{
> +       unsigned long pfn = virt_to_pfn(p4d);
> +
> +       set_pgd(pgd, __pgd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
> +}
> +
> +static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
> +{
> +       gfp_t gfp = GFP_KERNEL_ACCOUNT;
> +
> +       if (mm == &init_mm)
> +               gfp &= ~__GFP_ACCOUNT;
> +       return (p4d_t *)get_zeroed_page(gfp);
> +}
> +
> +static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
> +{
> +       WARN_ON((unsigned long)p4d & (PAGE_SIZE-1));
> +       free_page((unsigned long)p4d);
> +}
> +
> +#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
> +#endif /* CONFIG_PGTABLE_LEVELS > 4 */
> +#endif /* CONFIG_PGTABLE_LEVELS > 3 */
> +#endif /* CONFIG_PGTABLE_LEVELS > 2 */
>
>  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
> @@ -53,12 +94,6 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>         return pgd;
>  }
>
> -#ifndef __PAGETABLE_PMD_FOLDED
> -
> -#define __pmd_free_tlb(tlb, pmd, addr)  pmd_free((tlb)->mm, pmd)
> -
> -#endif /* __PAGETABLE_PMD_FOLDED */
> -
>  #define __pte_free_tlb(tlb, pte, buf)   \
>  do {                                    \
>         pgtable_pte_page_dtor(pte);     \
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 228261aa9628..2b5f877681ca 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -8,7 +8,143 @@
>
>  #include <linux/const.h>
>
> +#if CONFIG_PGTABLE_LEVELS > 3
> +typedef struct {
> +       unsigned long p4d;
> +} p4d_t;
> +
> +static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
> +{
> +       *pgdp = pgd;
> +}
> +
> +static inline int pgd_none(pgd_t pgd)
> +{
> +       return (pgd_val(pgd) == 0);
> +}
> +
> +static inline int pgd_present(pgd_t pgd)
> +{
> +       return (pgd_val(pgd) & _PAGE_PRESENT);
> +}
> +
> +static inline int pgd_bad(pgd_t pgd)
> +{
> +       return !pgd_present(pgd);
> +}
> +
> +static inline void pgd_clear(pgd_t *pgdp)
> +{
> +       set_pgd(pgdp, __pgd(0));
> +}
> +
> +static inline struct page *pgd_page(pgd_t pgd)
> +{
> +       return pfn_to_page(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
> +}
> +
> +static inline p4d_t *pgd_pgtable(pgd_t pgd)
> +{
> +       return (p4d_t *)pfn_to_virt(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
> +}
> +
> +#define p4d_ERROR(p4d)                         \
> +       pr_err("%s:%d: bad p4d " PTE_FMT ".\n", __FILE__, __LINE__, p4d_val(p4d))
> +
> +#define P4D_SHIFT              39
> +#define PTRS_PER_P4D           (PAGE_SIZE / sizeof(p4d_t))
> +#define P4D_SIZE               (1UL << P4D_SHIFT)
> +#define P4D_MASK               (~(P4D_SIZE-1))
> +
> +#define p4d_val(x)                             ((x).p4d)
> +#define __p4d(x)                               ((p4d_t) { (x) })
> +
> +static inline unsigned long p4d_index(unsigned long address)
> +{
> +       return (address >> P4D_SHIFT) & (PTRS_PER_P4D - 1);
> +}
> +#define p4d_index p4d_index
> +
> +static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
> +{
> +       return pgd_pgtable(*pgd) + p4d_index(address);
> +}
> +
> +static inline p4d_t pfn_p4d(unsigned long pfn, pgprot_t prot)
> +{
> +       return __p4d((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
> +}
> +
> +static inline unsigned long _p4d_pfn(p4d_t p4d)
> +{
> +       return p4d_val(p4d) >> _PAGE_PFN_SHIFT;
> +}
> +
> +static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
> +{
> +       *p4dp = p4d;
> +}
> +
> +static inline int p4d_none(p4d_t p4d)
> +{
> +       return (p4d_val(p4d) == 0);
> +}
> +
> +static inline int p4d_present(p4d_t p4d)
> +{
> +       return (p4d_val(p4d) & _PAGE_PRESENT);
> +}
> +
> +static inline int p4d_bad(p4d_t p4d)
> +{
> +       return !p4d_present(p4d);
> +}
> +
> +static inline void p4d_clear(p4d_t *p4dp)
> +{
> +       set_p4d(p4dp, __p4d(0));
> +}
> +
> +#define pud_ERROR(pud)                         \
> +       pr_err("%s:%d: bad pud " PTE_FMT ".\n", __FILE__, __LINE__, pud_val(pud))
> +typedef struct {
> +       unsigned long pud;
> +} pud_t;
> +
> +#define PUD_SHIFT      30
> +#define PTRS_PER_PUD   (PAGE_SIZE / sizeof(pud_t))
> +#define PUD_SIZE       (1UL << PUD_SHIFT)
> +#define PUD_MASK       (~(PUD_SIZE-1))
> +
> +static inline struct page *p4d_page(p4d_t p4d)
> +{
> +       return pfn_to_page(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
> +}
> +
> +static inline pud_t *p4d_pgtable(p4d_t p4d)
> +{
> +       return (pud_t *)pfn_to_virt(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
> +}
> +
> +#define pud_val(x)                             ((x).pud)
> +#define __pud(x)                               ((pud_t) { x })
> +
> +static inline pud_t pfn_pud(unsigned long pfn, pgprot_t prot)
> +{
> +       return __pud((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
> +}
> +
> +static inline unsigned long _pud_pfn(pud_t pud)
> +{
> +       return pud_val(pud) >> _PAGE_PFN_SHIFT;
> +}
> +
> +#define PGDIR_SHIFT     48
> +#else /* CONFIG_PGTABLE_LEVELS > 3 */
> +#include <asm-generic/pgtable-nopud.h>
>  #define PGDIR_SHIFT     30
> +#endif /* CONFIG_PGTABLE_LEVELS > 3 */
> +
>  /* Size of region mapped by a page global directory */
>  #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
>  #define PGDIR_MASK      (~(PGDIR_SIZE - 1))
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 39b550310ec6..8a456bff33c6 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -83,7 +83,6 @@
>  #ifndef __ASSEMBLY__
>
>  /* Page Upper Directory not used in RISC-V */
> -#include <asm-generic/pgtable-nopud.h>
>  #include <asm/page.h>
>  #include <asm/tlbflush.h>
>  #include <linux/mm_types.h>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index c0cddf0fc22d..a14f4a7b3e59 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -60,6 +60,14 @@ struct pt_alloc_ops {
>         pmd_t *(*get_pmd_virt)(phys_addr_t pa);
>         phys_addr_t (*alloc_pmd)(uintptr_t va);
>  #endif
> +#ifndef __PAGETABLE_PUD_FOLDED
> +       pud_t *(*get_pud_virt)(phys_addr_t pa);
> +       phys_addr_t (*alloc_pud)(uintptr_t va);
> +#endif
> +#ifndef __PAGETABLE_P4D_FOLDED
> +       p4d_t *(*get_p4d_virt)(phys_addr_t pa);
> +       phys_addr_t (*alloc_p4d)(uintptr_t va);
> +#endif
>  };
>
>  static phys_addr_t dma32_phys_limit __initdata;
> @@ -246,6 +254,8 @@ static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
>
>  pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>  static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
> +static pud_t __maybe_unused early_dtb_pud[PTRS_PER_PUD] __initdata __aligned(PAGE_SIZE);
> +static p4d_t __maybe_unused early_dtb_p4d[PTRS_PER_P4D] __initdata __aligned(PAGE_SIZE);
>
>  #ifdef CONFIG_XIP_KERNEL
>  #define trampoline_pg_dir      ((pgd_t *)XIP_FIXUP(trampoline_pg_dir))
> @@ -322,7 +332,6 @@ static void __init create_pte_mapping(pte_t *ptep,
>  }
>
>  #ifndef __PAGETABLE_PMD_FOLDED
> -
>  static pmd_t trampoline_pmd[PTRS_PER_PMD] __page_aligned_bss;
>  static pmd_t fixmap_pmd[PTRS_PER_PMD] __page_aligned_bss;
>  static pmd_t early_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
> @@ -397,14 +406,151 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
>
>         create_pte_mapping(ptep, va, pa, sz, prot);
>  }
> +#endif /* __PAGETABLE_PMD_FOLDED */
>
> -#define pgd_next_t             pmd_t
> -#define alloc_pgd_next(__va)   pt_ops.alloc_pmd(__va)
> -#define get_pgd_next_virt(__pa)        pt_ops.get_pmd_virt(__pa)
> -#define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)     \
> -       create_pmd_mapping(__nextp, __va, __pa, __sz, __prot)
> -#define fixmap_pgd_next                fixmap_pmd
> -#else
> +#ifndef __PAGETABLE_PUD_FOLDED
> +static pud_t trampoline_pud[PTRS_PER_PUD] __page_aligned_bss;
> +static pud_t fixmap_pud[PTRS_PER_PUD] __page_aligned_bss;
> +static pud_t early_pud[PTRS_PER_PUD] __initdata __aligned(PAGE_SIZE);
> +static pud_t *__init get_pud_virt_early(phys_addr_t pa)
> +{
> +       /* Before MMU is enabled */
> +       return (pud_t *)((uintptr_t)pa);
> +}
> +
> +static pud_t *__init get_pud_virt_fixmap(phys_addr_t pa)
> +{
> +       clear_fixmap(FIX_PUD);
> +       return (pud_t *)set_fixmap_offset(FIX_PUD, pa);
> +}
> +
> +static pud_t *__init get_pud_virt_late(phys_addr_t pa)
> +{
> +       return (pud_t *) __va(pa);
> +}
> +
> +static phys_addr_t __init alloc_pud_early(uintptr_t va)
> +{
> +       WARN_ON((va - kernel_map.virt_addr) >> PGDIR_SHIFT);
> +
> +       return (uintptr_t)early_pud;
> +}
> +
> +static phys_addr_t __init alloc_pud_fixmap(uintptr_t va)
> +{
> +       return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> +}
> +
> +static phys_addr_t __init alloc_pud_late(uintptr_t va)
> +{
> +       unsigned long vaddr;
> +
> +       vaddr = __get_free_page(GFP_KERNEL);
> +       WARN_ON(!vaddr);
> +       return __pa(vaddr);
> +}
> +
> +void __init create_pud_mapping(pud_t *pudp,
> +                                     uintptr_t va, phys_addr_t pa,
> +                                     phys_addr_t sz, pgprot_t prot)
> +{
> +       pmd_t *pmdp;
> +       phys_addr_t next_phys;
> +       uintptr_t pud_idx = pud_index(va);
> +
> +       if (sz == PUD_SIZE) {
> +               if (pud_val(pudp[pud_idx]) == 0)
> +                       pudp[pud_idx] = pfn_pud(PFN_DOWN(pa), prot);
> +               return;
> +       }
> +
> +       if (pud_val(pudp[pud_idx]) == 0) {
> +               next_phys = pt_ops.alloc_pmd(va);
> +               pudp[pud_idx] = pfn_pud(PFN_DOWN(next_phys), PAGE_TABLE);
> +               pmdp = pt_ops.get_pmd_virt(next_phys);
> +               memset(pmdp, 0, PAGE_SIZE);
> +       } else {
> +               next_phys = PFN_PHYS(_pud_pfn(pudp[pud_idx]));
> +               pmdp = pt_ops.get_pmd_virt(next_phys);
> +       }
> +
> +       create_pmd_mapping(pmdp, va, pa, sz, prot);
> +}
> +
> +#endif
> +
> +#ifndef __PAGETABLE_P4D_FOLDED
> +static p4d_t trampoline_p4d[PTRS_PER_P4D] __page_aligned_bss;
> +static p4d_t fixmap_p4d[PTRS_PER_P4D] __page_aligned_bss;
> +static p4d_t early_p4d[PTRS_PER_P4D] __initdata __aligned(PAGE_SIZE);
> +
> +static p4d_t *__init get_p4d_virt_early(phys_addr_t pa)
> +{
> +       /* Before MMU is enabled */
> +       return (p4d_t *)((uintptr_t)pa);
> +}
> +
> +static p4d_t *__init get_p4d_virt_fixmap(phys_addr_t pa)
> +{
> +       clear_fixmap(FIX_P4D);
> +       return (p4d_t *)set_fixmap_offset(FIX_P4D, pa);
> +}
> +
> +static p4d_t *__init get_p4d_virt_late(phys_addr_t pa)
> +{
> +       return (p4d_t *) __va(pa);
> +}
> +
> +static phys_addr_t __init alloc_p4d_early(uintptr_t va)
> +{
> +       WARN_ON((va - kernel_map.virt_addr) >> PGDIR_SHIFT);
> +
> +       return (uintptr_t)early_p4d;
> +}
> +
> +static phys_addr_t __init alloc_p4d_fixmap(uintptr_t va)
> +{
> +       return memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> +}
> +
> +static phys_addr_t __init alloc_p4d_late(uintptr_t va)
> +{
> +       unsigned long vaddr;
> +
> +       vaddr = __get_free_page(GFP_KERNEL);
> +       WARN_ON(!vaddr);
> +       return __pa(vaddr);
> +}
> +
> +void __init create_p4d_mapping(p4d_t *p4dp,
> +                                     uintptr_t va, phys_addr_t pa,
> +                                     phys_addr_t sz, pgprot_t prot)
> +{
> +       pud_t *nextp;
> +       phys_addr_t next_phys;
> +       uintptr_t p4d_idx = p4d_index(va);
> +
> +       if (sz == P4D_SIZE) {
> +               if (p4d_val(p4dp[p4d_idx]) == 0)
> +                       p4dp[p4d_idx] = pfn_p4d(PFN_DOWN(pa), prot);
> +               return;
> +       }
> +
> +       if (p4d_val(p4dp[p4d_idx]) == 0) {
> +               next_phys = pt_ops.alloc_pud(va);
> +               p4dp[p4d_idx] = pfn_p4d(PFN_DOWN(next_phys), PAGE_TABLE);
> +               nextp = pt_ops.get_pud_virt(next_phys);
> +               memset(nextp, 0, PAGE_SIZE);
> +       } else {
> +               next_phys = PFN_PHYS(_p4d_pfn(p4dp[p4d_idx]));
> +               nextp = pt_ops.get_pud_virt(next_phys);
> +       }
> +
> +       create_pud_mapping(nextp, va, pa, sz, prot);
> +}
> +#endif
> +
> +#if defined(__PAGETABLE_PMD_FOLDED) /* Sv32 */
>  #define pgd_next_t             pte_t
>  #define alloc_pgd_next(__va)   pt_ops.alloc_pte(__va)
>  #define get_pgd_next_virt(__pa)        pt_ops.get_pte_virt(__pa)
> @@ -412,6 +558,28 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
>         create_pte_mapping(__nextp, __va, __pa, __sz, __prot)
>  #define fixmap_pgd_next                fixmap_pte
>  #define create_pmd_mapping(__pmdp, __va, __pa, __sz, __prot)
> +#elif defined(__PAGETABLE_PUD_FOLDED) /* Sv39 */
> +#define pgd_next_t             pmd_t
> +#define alloc_pgd_next(__va)   pt_ops.alloc_pmd(__va)
> +#define get_pgd_next_virt(__pa)        pt_ops.get_pmd_virt(__pa)
> +#define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)     \
> +       create_pmd_mapping(__nextp, __va, __pa, __sz, __prot)
> +#define fixmap_pgd_next                fixmap_pmd
> +#define dtb_pgd_next           early_dtb_pmd
> +#define trampoline_pgd_next    trampoline_pmd
> +#elif defined(__PAGETABLE_P4D_FOLDED) /* Sv48 */
> +#error "Sv48 is not supported now"
> +#else /* Sv57 */
> +#define pgd_next_t             p4d_t
> +#define p4d_next_t             pud_t
> +#define pud_next_t             pmd_t
> +#define alloc_pgd_next(__va)   pt_ops.alloc_p4d(__va)
> +#define get_pgd_next_virt(__pa)        pt_ops.get_p4d_virt(__pa)
> +#define create_pgd_next_mapping(__nextp, __va, __pa, __sz, __prot)     \
> +       create_p4d_mapping(__nextp, __va, __pa, __sz, __prot)
> +#define fixmap_pgd_next                fixmap_p4d
> +#define dtb_pgd_next           early_dtb_p4d
> +#define trampoline_pgd_next    trampoline_p4d
>  #endif
>
>  void __init create_pgd_mapping(pgd_t *pgdp,
> @@ -441,6 +609,88 @@ void __init create_pgd_mapping(pgd_t *pgdp,
>         create_pgd_next_mapping(nextp, va, pa, sz, prot);
>  }
>
> +static inline void __init complete_fixmap_mapping(pgd_t *pgdp, uintptr_t va)
> +{
> +       create_pgd_mapping(pgdp, va,
> +                          (uintptr_t)fixmap_pgd_next, PGDIR_SIZE, PAGE_TABLE);
> +#ifndef __PAGETABLE_P4D_FOLDED
> +       create_p4d_mapping(fixmap_p4d, va,
> +                          (uintptr_t)fixmap_pud, P4D_SIZE, PAGE_TABLE);
> +#endif
> +#ifndef __PAGETABLE_PUD_FOLDED
> +       create_pud_mapping(fixmap_pud, va,
> +                          (uintptr_t)fixmap_pmd, PUD_SIZE, PAGE_TABLE);
> +#endif
> +#ifndef __PAGETABLE_PMD_FOLDED
> +       create_pmd_mapping(fixmap_pmd, va,
> +                          (uintptr_t)fixmap_pte, PMD_SIZE, PAGE_TABLE);
> +#endif
> +}
> +
> +static inline void __init complete_trampoline_mapping(pgd_t *pgdp, uintptr_t va)
> +{
> +#ifdef CONFIG_XIP_KERNEL
> +       uintptr_t pa = kernel_map.xiprom;
> +#else
> +       uintptr_t pa = kernel_map.phys_addr;
> +#endif
> +
> +#if IS_ENABLED(CONFIG_64BIT)
> +       create_pgd_mapping(pgdp, va,
> +                          (uintptr_t)trampoline_pgd_next,
> +                          PGDIR_SIZE,
> +                          PAGE_TABLE);
> +#else
> +       create_pgd_mapping(pgdp, va,
> +                          pa,
> +                          PGDIR_SIZE,
> +                          PAGE_KERNEL_EXEC);
> +#endif
> +
> +#ifndef __PAGETABLE_P4D_FOLDED
> +       create_p4d_mapping(trampoline_p4d, va,
> +                          (uintptr_t)trampoline_pud, P4D_SIZE, PAGE_TABLE);
> +#endif
> +#ifndef __PAGETABLE_PUD_FOLDED
> +       create_pud_mapping(trampoline_pud, va,
> +                          (uintptr_t)trampoline_pmd, PUD_SIZE, PAGE_TABLE);
> +#endif
> +#ifndef __PAGETABLE_PMD_FOLDED
> +       create_pmd_mapping(trampoline_pmd, va,
> +                          pa, PMD_SIZE, PAGE_KERNEL_EXEC);
> +#endif
> +}
> +
> +static inline void __init complete_dtb_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t pa)
> +{
> +#if IS_ENABLED(CONFIG_64BIT)
> +       create_pgd_mapping(pgdp, va,
> +                          (uintptr_t)dtb_pgd_next,
> +                          PGDIR_SIZE,
> +                          PAGE_TABLE);
> +#else
> +       create_pgd_mapping(pgdp, va,
> +                          pa,
> +                          PGDIR_SIZE,
> +                          PAGE_KERNEL);
> +#endif
> +
> +#ifndef __PAGETABLE_P4D_FOLDED
> +       create_p4d_mapping(early_dtb_p4d, va,
> +                       (uintptr_t)early_dtb_pud, P4D_SIZE, PAGE_TABLE);
> +#endif
> +#ifndef __PAGETABLE_PUD_FOLDED
> +       create_pud_mapping(early_dtb_pud, va,
> +                       (uintptr_t)early_dtb_pmd, PUD_SIZE, PAGE_TABLE);
> +#endif
> +#ifndef __PAGETABLE_PMD_FOLDED
> +       create_pmd_mapping(early_dtb_pmd, va,
> +                       pa, PMD_SIZE, PAGE_KERNEL);
> +       create_pmd_mapping(early_dtb_pmd, va + PMD_SIZE,
> +                       pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
> +#endif
> +}
> +
>  static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
>  {
>         /* Upgrade to PMD_SIZE mappings whenever possible */
> @@ -563,17 +813,7 @@ static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
>  #ifndef CONFIG_BUILTIN_DTB
>         uintptr_t pa = dtb_pa & ~(PMD_SIZE - 1);
>
> -       create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
> -                          IS_ENABLED(CONFIG_64BIT) ? (uintptr_t)early_dtb_pmd : pa,
> -                          PGDIR_SIZE,
> -                          IS_ENABLED(CONFIG_64BIT) ? PAGE_TABLE : PAGE_KERNEL);
> -
> -       if (IS_ENABLED(CONFIG_64BIT)) {
> -               create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
> -                                  pa, PMD_SIZE, PAGE_KERNEL);
> -               create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA + PMD_SIZE,
> -                                  pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
> -       }
> +       complete_dtb_mapping(early_pg_dir, DTB_EARLY_BASE_VA, pa);
>
>         dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
>  #else
> @@ -614,7 +854,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>         riscv_pfn_base = PFN_DOWN(kernel_map.phys_addr);
>
>         /* Sanity check alignment and size */
> -       BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
>         BUG_ON((kernel_map.phys_addr % PMD_SIZE) != 0);
>
>  #ifdef CONFIG_64BIT
> @@ -631,29 +870,20 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>         pt_ops.alloc_pmd = alloc_pmd_early;
>         pt_ops.get_pmd_virt = get_pmd_virt_early;
>  #endif
> +#ifndef __PAGETABLE_PUD_FOLDED
> +       pt_ops.alloc_pud = alloc_pud_early;
> +       pt_ops.get_pud_virt = get_pud_virt_early;
> +#endif
> +#ifndef __PAGETABLE_P4D_FOLDED
> +       pt_ops.alloc_p4d = alloc_p4d_early;
> +       pt_ops.get_p4d_virt = get_p4d_virt_early;
> +#endif
> +
>         /* Setup early PGD for fixmap */
> -       create_pgd_mapping(early_pg_dir, FIXADDR_START,
> -                          (uintptr_t)fixmap_pgd_next, PGDIR_SIZE, PAGE_TABLE);
> +       complete_fixmap_mapping(early_pg_dir, FIXADDR_START);
>
> -#ifndef __PAGETABLE_PMD_FOLDED
> -       /* Setup fixmap PMD */
> -       create_pmd_mapping(fixmap_pmd, FIXADDR_START,
> -                          (uintptr_t)fixmap_pte, PMD_SIZE, PAGE_TABLE);
> -       /* Setup trampoline PGD and PMD */
> -       create_pgd_mapping(trampoline_pg_dir, kernel_map.virt_addr,
> -                          (uintptr_t)trampoline_pmd, PGDIR_SIZE, PAGE_TABLE);
> -#ifdef CONFIG_XIP_KERNEL
> -       create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
> -                          kernel_map.xiprom, PMD_SIZE, PAGE_KERNEL_EXEC);
> -#else
> -       create_pmd_mapping(trampoline_pmd, kernel_map.virt_addr,
> -                          kernel_map.phys_addr, PMD_SIZE, PAGE_KERNEL_EXEC);
> -#endif
> -#else
>         /* Setup trampoline PGD */
> -       create_pgd_mapping(trampoline_pg_dir, kernel_map.virt_addr,
> -                          kernel_map.phys_addr, PGDIR_SIZE, PAGE_KERNEL_EXEC);
> -#endif
> +       complete_trampoline_mapping(trampoline_pg_dir, kernel_map.virt_addr);
>
>         /*
>          * Setup early PGD covering entire kernel which will allow
> @@ -711,6 +941,14 @@ static void __init setup_vm_final(void)
>  #ifndef __PAGETABLE_PMD_FOLDED
>         pt_ops.alloc_pmd = alloc_pmd_fixmap;
>         pt_ops.get_pmd_virt = get_pmd_virt_fixmap;
> +#endif
> +#ifndef __PAGETABLE_PUD_FOLDED
> +       pt_ops.alloc_pud = alloc_pud_fixmap;
> +       pt_ops.get_pud_virt = get_pud_virt_fixmap;
> +#endif
> +#ifndef __PAGETABLE_P4D_FOLDED
> +       pt_ops.alloc_p4d = alloc_p4d_fixmap;
> +       pt_ops.get_p4d_virt = get_p4d_virt_fixmap;
>  #endif
>         /* Setup swapper PGD for fixmap */
>         create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
> @@ -756,6 +994,14 @@ static void __init setup_vm_final(void)
>         pt_ops.alloc_pmd = alloc_pmd_late;
>         pt_ops.get_pmd_virt = get_pmd_virt_late;
>  #endif
> +#ifndef __PAGETABLE_PUD_FOLDED
> +       pt_ops.alloc_pud = alloc_pud_late;
> +       pt_ops.get_pud_virt = get_pud_virt_late;
> +#endif
> +#ifndef __PAGETABLE_P4D_FOLDED
> +       pt_ops.alloc_p4d = alloc_p4d_late;
> +       pt_ops.get_p4d_virt = get_p4d_virt_late;
> +#endif
>  }
>  #else
>  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> --

That's a lot of ifdefs whereas we should aim for fewer: the mmu
configuration should be done at runtime, not at compile time,
otherwise we would have to deal with multiple kernels for 64-bit. And
it should be rebased on top of the sv48 patchset too.

Thanks,

Alex

> 2.32.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

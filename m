Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0153CD12671
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUXl7Zb3FbvC1XVWC8o/roIpsxYFyXgJHLuuzayNrDA=; b=H11rJCiVeAls9D
	yHaNltHcZgW3BiSLLfxV8rn0ZzZ2QeWjB2jMIdr5YrMWYxIQBxWqCgp0+v4fUGB218qx8/gUBw3vZ
	xBVLGVNrEQBqFps3wZ22+4ZWFSS2/rtWUdmQA/BToV3LW6cl9l+tPa2nryzQpD1xK9eXExx1PqjMp
	RK/JCMOudGO8NFy+n18x6io0DMndOvZUu6MnPpEelU/56YLKOaqVi3Wq0h8ERlRMioCvD0nNtA8MS
	KS/o9X+T+YMCFvgC4kEdXbd3YzG3rvkcDaEm8XayA/jiMGCfEZaQIuPYWDTgpuHAQddU/84NjS79T
	T8IIuYDN3BFK68LkHmnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GMN-0000000GbhD-1EFG;
	Tue, 05 Nov 2024 10:00:27 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GKn-0000000GbKF-01kI
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 09:58:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F25DC0002;
	Tue,  5 Nov 2024 09:58:43 +0000 (UTC)
Message-ID: <6a62e26b-3c55-425c-813f-2f84b56c6951@ghiti.fr>
Date: Tue, 5 Nov 2024 10:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] riscv: mm: Deduplicate pgtable address conversion
 functions
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
 <20241102000843.1301099-4-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241102000843.1301099-4-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_015849_389838_8C3E2DF2 
X-CRM114-Status: GOOD (  21.36  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Samuel,

On 02/11/2024 01:07, Samuel Holland wrote:
> Some functions were defined equivalently in both pgtable.h and
> pgtable-64.h. Keep only one definition, and move it to pgtable-64.h
> unless it is also used for Sv32. Note that while Sv32 uses only two
> levels of page tables, the kernel is not consistent with how they are
> folded. THP requires pfn_pmd()/pmd_pfn() and mm/init.c requires
> pfn_pgd()/pgd_pfn(), so for now both are provided.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>   arch/riscv/include/asm/pgtable-32.h |  4 ++++
>   arch/riscv/include/asm/pgtable-64.h | 28 ++++++++++++++--------------
>   arch/riscv/include/asm/pgtable.h    | 23 ++++-------------------
>   arch/riscv/mm/init.c                |  8 ++++----
>   arch/riscv/mm/kasan_init.c          |  8 ++++----
>   5 files changed, 30 insertions(+), 41 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
> index 00f3369570a8..23137347dc15 100644
> --- a/arch/riscv/include/asm/pgtable-32.h
> +++ b/arch/riscv/include/asm/pgtable-32.h
> @@ -33,6 +33,10 @@
>   					  _PAGE_WRITE | _PAGE_EXEC |	\
>   					  _PAGE_USER | _PAGE_GLOBAL))
>   
> +#define pud_pfn(pud)				(pmd_pfn((pmd_t){ pud }))
> +#define p4d_pfn(p4d)				(pud_pfn((pud_t){ p4d }))


pud_pfn() and p4d_pfn() should not be used in 32-bit right? I think you 
can remove their definitions and simplify pgd_pfn().


> +#define pgd_pfn(pgd)				(p4d_pfn((p4d_t){ pgd }))
> +
>   static const __maybe_unused int pgtable_l4_enabled;
>   static const __maybe_unused int pgtable_l5_enabled;
>   
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 0897dd99ab8d..33e7ff049c4a 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -213,19 +213,20 @@ static inline pud_t pfn_pud(unsigned long pfn, pgprot_t prot)
>   	return __pud((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
>   }
>   
> -static inline unsigned long _pud_pfn(pud_t pud)
> +#define pud_pfn pud_pfn
> +static inline unsigned long pud_pfn(pud_t pud)
>   {
>   	return __page_val_to_pfn(pud_val(pud));
>   }
>   
>   static inline pmd_t *pud_pgtable(pud_t pud)
>   {
> -	return (pmd_t *)pfn_to_virt(__page_val_to_pfn(pud_val(pud)));
> +	return (pmd_t *)pfn_to_virt(pud_pfn(pud));
>   }
>   
>   static inline struct page *pud_page(pud_t pud)
>   {
> -	return pfn_to_page(__page_val_to_pfn(pud_val(pud)));
> +	return pfn_to_page(pud_pfn(pud));
>   }
>   
>   #define mm_p4d_folded  mm_p4d_folded
> @@ -257,11 +258,6 @@ static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
>   	return __pmd((pfn << _PAGE_PFN_SHIFT) | prot_val);
>   }
>   
> -static inline unsigned long _pmd_pfn(pmd_t pmd)
> -{
> -	return __page_val_to_pfn(pmd_val(pmd));
> -}
> -
>   #define mk_pmd(page, prot)    pfn_pmd(page_to_pfn(page), prot)
>   
>   #define pmd_ERROR(e) \
> @@ -316,7 +312,7 @@ static inline p4d_t pfn_p4d(unsigned long pfn, pgprot_t prot)
>   	return __p4d((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
>   }
>   
> -static inline unsigned long _p4d_pfn(p4d_t p4d)
> +static inline unsigned long p4d_pfn(p4d_t p4d)
>   {
>   	return __page_val_to_pfn(p4d_val(p4d));
>   }
> @@ -324,7 +320,7 @@ static inline unsigned long _p4d_pfn(p4d_t p4d)
>   static inline pud_t *p4d_pgtable(p4d_t p4d)
>   {
>   	if (pgtable_l4_enabled)
> -		return (pud_t *)pfn_to_virt(__page_val_to_pfn(p4d_val(p4d)));
> +		return (pud_t *)pfn_to_virt(p4d_pfn(p4d));
>   
>   	return (pud_t *)pud_pgtable((pud_t) { p4d_val(p4d) });
>   }
> @@ -332,7 +328,7 @@ static inline pud_t *p4d_pgtable(p4d_t p4d)
>   
>   static inline struct page *p4d_page(p4d_t p4d)
>   {
> -	return pfn_to_page(__page_val_to_pfn(p4d_val(p4d)));
> +	return pfn_to_page(p4d_pfn(p4d));
>   }
>   
>   #define pud_index(addr) (((addr) >> PUD_SHIFT) & (PTRS_PER_PUD - 1))
> @@ -378,10 +374,15 @@ static inline void pgd_clear(pgd_t *pgd)
>   		set_pgd(pgd, __pgd(0));
>   }
>   
> +static inline unsigned long pgd_pfn(pgd_t pgd)
> +{
> +	return __page_val_to_pfn(pgd_val(pgd));
> +}
> +
>   static inline p4d_t *pgd_pgtable(pgd_t pgd)
>   {
>   	if (pgtable_l5_enabled)
> -		return (p4d_t *)pfn_to_virt(__page_val_to_pfn(pgd_val(pgd)));
> +		return (p4d_t *)pfn_to_virt(pgd_pfn(pgd));
>   
>   	return (p4d_t *)p4d_pgtable((p4d_t) { pgd_val(pgd) });
>   }
> @@ -389,9 +390,8 @@ static inline p4d_t *pgd_pgtable(pgd_t pgd)
>   
>   static inline struct page *pgd_page(pgd_t pgd)
>   {
> -	return pfn_to_page(__page_val_to_pfn(pgd_val(pgd)));
> +	return pfn_to_page(pgd_pfn(pgd));
>   }
> -#define pgd_page(pgd)	pgd_page(pgd)
>   
>   #define p4d_index(addr) (((addr) >> P4D_SHIFT) & (PTRS_PER_P4D - 1))
>   
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index e79f15293492..3e0e1177107d 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -258,19 +258,19 @@ static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
>   	return __pgd((pfn << _PAGE_PFN_SHIFT) | prot_val);
>   }
>   
> -static inline unsigned long _pgd_pfn(pgd_t pgd)
> +static inline unsigned long pmd_pfn(pmd_t pmd)
>   {
> -	return __page_val_to_pfn(pgd_val(pgd));
> +	return __page_val_to_pfn(pmd_val(pmd));
>   }
>   
>   static inline struct page *pmd_page(pmd_t pmd)
>   {
> -	return pfn_to_page(__page_val_to_pfn(pmd_val(pmd)));
> +	return pfn_to_page(pmd_pfn(pmd));
>   }
>   
>   static inline unsigned long pmd_page_vaddr(pmd_t pmd)
>   {
> -	return (unsigned long)pfn_to_virt(__page_val_to_pfn(pmd_val(pmd)));
> +	return (unsigned long)pfn_to_virt(pmd_pfn(pmd));
>   }
>   
>   static inline pte_t pmd_pte(pmd_t pmd)
> @@ -673,21 +673,6 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
>   	return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
>   }
>   
> -#define __pmd_to_phys(pmd)  (__page_val_to_pfn(pmd_val(pmd)) << PAGE_SHIFT)
> -
> -static inline unsigned long pmd_pfn(pmd_t pmd)
> -{
> -	return ((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT);
> -}
> -
> -#define __pud_to_phys(pud)  (__page_val_to_pfn(pud_val(pud)) << PAGE_SHIFT)
> -
> -#define pud_pfn pud_pfn
> -static inline unsigned long pud_pfn(pud_t pud)
> -{
> -	return ((__pud_to_phys(pud) & PUD_MASK) >> PAGE_SHIFT);
> -}
> -
>   static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>   {
>   	return pte_pmd(pte_modify(pmd_pte(pmd), newprot));
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 0e8c20adcd98..7282b62b7e8d 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -497,7 +497,7 @@ static void __meminit create_pmd_mapping(pmd_t *pmdp,
>   		ptep = pt_ops.get_pte_virt(pte_phys);
>   		memset(ptep, 0, PAGE_SIZE);
>   	} else {
> -		pte_phys = PFN_PHYS(_pmd_pfn(pmdp[pmd_idx]));
> +		pte_phys = PFN_PHYS(pmd_pfn(pmdp[pmd_idx]));
>   		ptep = pt_ops.get_pte_virt(pte_phys);
>   	}
>   
> @@ -599,7 +599,7 @@ static void __meminit create_pud_mapping(pud_t *pudp, uintptr_t va, phys_addr_t
>   		nextp = pt_ops.get_pmd_virt(next_phys);
>   		memset(nextp, 0, PAGE_SIZE);
>   	} else {
> -		next_phys = PFN_PHYS(_pud_pfn(pudp[pud_index]));
> +		next_phys = PFN_PHYS(pud_pfn(pudp[pud_index]));
>   		nextp = pt_ops.get_pmd_virt(next_phys);
>   	}
>   
> @@ -625,7 +625,7 @@ static void __meminit create_p4d_mapping(p4d_t *p4dp, uintptr_t va, phys_addr_t
>   		nextp = pt_ops.get_pud_virt(next_phys);
>   		memset(nextp, 0, PAGE_SIZE);
>   	} else {
> -		next_phys = PFN_PHYS(_p4d_pfn(p4dp[p4d_index]));
> +		next_phys = PFN_PHYS(p4d_pfn(p4dp[p4d_index]));
>   		nextp = pt_ops.get_pud_virt(next_phys);
>   	}
>   
> @@ -682,7 +682,7 @@ void __meminit create_pgd_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t pa, phy
>   		nextp = get_pgd_next_virt(next_phys);
>   		memset(nextp, 0, PAGE_SIZE);
>   	} else {
> -		next_phys = PFN_PHYS(_pgd_pfn(pgdp[pgd_idx]));
> +		next_phys = PFN_PHYS(pgd_pfn(pgdp[pgd_idx]));
>   		nextp = get_pgd_next_virt(next_phys);
>   	}
>   
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index c301c8d291d2..bac65e3268a4 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -171,7 +171,7 @@ static void __init kasan_early_clear_pud(p4d_t *p4dp,
>   	if (!pgtable_l4_enabled) {
>   		pudp = (pud_t *)p4dp;
>   	} else {
> -		base_pud = pt_ops.get_pud_virt(pfn_to_phys(_p4d_pfn(p4dp_get(p4dp))));
> +		base_pud = pt_ops.get_pud_virt(pfn_to_phys(p4d_pfn(p4dp_get(p4dp))));
>   		pudp = base_pud + pud_index(vaddr);
>   	}
>   
> @@ -196,7 +196,7 @@ static void __init kasan_early_clear_p4d(pgd_t *pgdp,
>   	if (!pgtable_l5_enabled) {
>   		p4dp = (p4d_t *)pgdp;
>   	} else {
> -		base_p4d = pt_ops.get_p4d_virt(pfn_to_phys(_pgd_pfn(pgdp_get(pgdp))));
> +		base_p4d = pt_ops.get_p4d_virt(pfn_to_phys(pgd_pfn(pgdp_get(pgdp))));
>   		p4dp = base_p4d + p4d_index(vaddr);
>   	}
>   
> @@ -242,7 +242,7 @@ static void __init kasan_early_populate_pud(p4d_t *p4dp,
>   	if (!pgtable_l4_enabled) {
>   		pudp = (pud_t *)p4dp;
>   	} else {
> -		base_pud = pt_ops.get_pud_virt(pfn_to_phys(_p4d_pfn(p4dp_get(p4dp))));
> +		base_pud = pt_ops.get_pud_virt(pfn_to_phys(p4d_pfn(p4dp_get(p4dp))));
>   		pudp = base_pud + pud_index(vaddr);
>   	}
>   
> @@ -280,7 +280,7 @@ static void __init kasan_early_populate_p4d(pgd_t *pgdp,
>   	if (!pgtable_l5_enabled) {
>   		p4dp = (p4d_t *)pgdp;
>   	} else {
> -		base_p4d = pt_ops.get_p4d_virt(pfn_to_phys(_pgd_pfn(pgdp_get(pgdp))));
> +		base_p4d = pt_ops.get_p4d_virt(pfn_to_phys(pgd_pfn(pgdp_get(pgdp))));
>   		p4dp = base_p4d + p4d_index(vaddr);
>   	}
>   


Otherwise, this is a nice cleanup, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

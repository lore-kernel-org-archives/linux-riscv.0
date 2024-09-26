Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9832CCCFA15
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 04:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4StYQrIPlsjNQQ//lKd/tuPy7mweMW351qHA9mpJGAU=; b=VZ0AaNYW8CPFZI
	4dAj0gxhbfyq3yoHBA4K17iNKMSqlJPY24l4jmdU1/C4r4x1598rIvDl8H7qkgKZ+QdNL2VlFvPQP
	4qI76+LHlk5h7o58q+XdGj2usB30GFNZLvdfnEYB70mrxzyITrNVMeRJWrQO2ip9WbAeYk4IK40FD
	PmEx5ur3rOAndVfJLAMGOwf3t2wLmSBoX1x/wlbW1/H6FdYBkDWRlKmQfMlhJL6Y373HK0s6GbWLT
	E6vwwQWJldmxjKIEcgkx9mLL61mUF+Ia/w9BgHLESIV9fzobvqc3eI5RZndxM8N4vuzI9Lm76M7k1
	CAlNakN90+KAJumC8U7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stfxH-000000079o0-0Pt3;
	Thu, 26 Sep 2024 04:18:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stfxC-000000079n3-48o1
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 04:18:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C367615A1;
	Wed, 25 Sep 2024 21:18:36 -0700 (PDT)
Received: from [10.163.35.5] (unknown [10.163.35.5])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DF693F528;
	Wed, 25 Sep 2024 21:18:03 -0700 (PDT)
Message-ID: <97c9f027-0162-4093-a5d7-0dc561ea28c7@arm.com>
Date: Thu, 26 Sep 2024 09:48:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Move set_pxd_safe() helpers from generic to platform
To: linux-mm@kvack.org, akpm@linux-foundation.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 x86@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240920053017.2514920-1-anshuman.khandual@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240920053017.2514920-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_211811_156925_97BEE55C 
X-CRM114-Status: GOOD (  19.78  )
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



On 9/20/24 11:00, Anshuman Khandual wrote:
> set_pxd_safe() helpers that serve a specific purpose for both x86 and riscv
> platforms, do not need to be in the common memory code. Otherwise they just
> unnecessarily make the common API more complicated. This moves the helpers
> from common code to platform instead.
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: x86@kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 19 ++++++++++++++++
>  arch/x86/include/asm/pgtable.h   | 37 +++++++++++++++++++++++++++++++
>  include/linux/pgtable.h          | 38 --------------------------------
>  3 files changed, 56 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 089f3c9f56a3..39ca652c5ebe 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -957,6 +957,25 @@ void misc_mem_init(void);
>  extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
>  #define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
>  
> +/*
> + * Use set_p*_safe(), and elide TLB flushing, when confident that *no*
> + * TLB flush will be required as a result of the "set". For example, use
> + * in scenarios where it is known ahead of time that the routine is
> + * setting non-present entries, or re-setting an existing entry to the
> + * same value. Otherwise, use the typical "set" helpers and flush the
> + * TLB.
> + */
> +#define set_p4d_safe(p4dp, p4d) \
> +({ \
> +	WARN_ON_ONCE(p4d_present(*p4dp) && !p4d_same(*p4dp, p4d)); \
> +	set_p4d(p4dp, p4d); \
> +})
> +
> +#define set_pgd_safe(pgdp, pgd) \
> +({ \
> +	WARN_ON_ONCE(pgd_present(*pgdp) && !pgd_same(*pgdp, pgd)); \
> +	set_pgd(pgdp, pgd); \
> +})
>  #endif /* !__ASSEMBLY__ */
>  
>  #endif /* _ASM_RISCV_PGTABLE_H */
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index e39311a89bf4..fefb52bb6b4d 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1701,6 +1701,43 @@ bool arch_is_platform_page(u64 paddr);
>  #define arch_is_platform_page arch_is_platform_page
>  #endif
>  
> +/*
> + * Use set_p*_safe(), and elide TLB flushing, when confident that *no*
> + * TLB flush will be required as a result of the "set". For example, use
> + * in scenarios where it is known ahead of time that the routine is
> + * setting non-present entries, or re-setting an existing entry to the
> + * same value. Otherwise, use the typical "set" helpers and flush the
> + * TLB.
> + */
> +#define set_pte_safe(ptep, pte) \
> +({ \
> +	WARN_ON_ONCE(pte_present(*ptep) && !pte_same(*ptep, pte)); \
> +	set_pte(ptep, pte); \
> +})
> +
> +#define set_pmd_safe(pmdp, pmd) \
> +({ \
> +	WARN_ON_ONCE(pmd_present(*pmdp) && !pmd_same(*pmdp, pmd)); \
> +	set_pmd(pmdp, pmd); \
> +})
> +
> +#define set_pud_safe(pudp, pud) \
> +({ \
> +	WARN_ON_ONCE(pud_present(*pudp) && !pud_same(*pudp, pud)); \
> +	set_pud(pudp, pud); \
> +})
> +
> +#define set_p4d_safe(p4dp, p4d) \
> +({ \
> +	WARN_ON_ONCE(p4d_present(*p4dp) && !p4d_same(*p4dp, p4d)); \
> +	set_p4d(p4dp, p4d); \
> +})
> +
> +#define set_pgd_safe(pgdp, pgd) \
> +({ \
> +	WARN_ON_ONCE(pgd_present(*pgdp) && !pgd_same(*pgdp, pgd)); \
> +	set_pgd(pgdp, pgd); \
> +})
>  #endif	/* __ASSEMBLY__ */
>  
>  #endif /* _ASM_X86_PGTABLE_H */
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 2a6a3cccfc36..0bf88e505aad 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1050,44 +1050,6 @@ static inline int pgd_same(pgd_t pgd_a, pgd_t pgd_b)
>  }
>  #endif
>  
> -/*
> - * Use set_p*_safe(), and elide TLB flushing, when confident that *no*
> - * TLB flush will be required as a result of the "set". For example, use
> - * in scenarios where it is known ahead of time that the routine is
> - * setting non-present entries, or re-setting an existing entry to the
> - * same value. Otherwise, use the typical "set" helpers and flush the
> - * TLB.
> - */
> -#define set_pte_safe(ptep, pte) \
> -({ \
> -	WARN_ON_ONCE(pte_present(*ptep) && !pte_same(*ptep, pte)); \
> -	set_pte(ptep, pte); \
> -})
> -
> -#define set_pmd_safe(pmdp, pmd) \
> -({ \
> -	WARN_ON_ONCE(pmd_present(*pmdp) && !pmd_same(*pmdp, pmd)); \
> -	set_pmd(pmdp, pmd); \
> -})
> -
> -#define set_pud_safe(pudp, pud) \
> -({ \
> -	WARN_ON_ONCE(pud_present(*pudp) && !pud_same(*pudp, pud)); \
> -	set_pud(pudp, pud); \
> -})
> -
> -#define set_p4d_safe(p4dp, p4d) \
> -({ \
> -	WARN_ON_ONCE(p4d_present(*p4dp) && !p4d_same(*p4dp, p4d)); \
> -	set_p4d(p4dp, p4d); \
> -})
> -
> -#define set_pgd_safe(pgdp, pgd) \
> -({ \
> -	WARN_ON_ONCE(pgd_present(*pgdp) && !pgd_same(*pgdp, pgd)); \
> -	set_pgd(pgdp, pgd); \
> -})
> -
>  #ifndef __HAVE_ARCH_DO_SWAP_PAGE
>  static inline void arch_do_swap_page_nr(struct mm_struct *mm,
>  				     struct vm_area_struct *vma,

Hello Dave/Palmer,

Unless there is still any more objection from x86 or riscv, could this
patch be pulled ?

- Anshuman

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

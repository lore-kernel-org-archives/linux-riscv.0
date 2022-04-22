Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5A5C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 06:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EgevnBmWDheyfuGCrznDNIZI7hYbtYi2+Vu8YEhegao=; b=1jZxUw65n/NA5l
	ual2+dj/96JlUua2ZX+ZkyrmfRTLiJ8xK9KW08OJw/ZBi/Euz/NmEaN45t6k9HS/c2ajcWmxU9wJ4
	ByHrJf5STZoNLLwGDZafp3lJfd4Aq7sgdcreYjhtSEvo1d8sUQ4ddcfmLUF57JWd3jI3AgRx7b5VM
	4jq9A5zfJnrKtmThRmFVCixqJfOptgxz7a/52RdEfha5MOifloWfdDo0EI46LKZ0lPOKko/RhMGQs
	Rcycb6SZqoyyPpJE8DT2G1/AYRSu8xIb87YANsF6+yVK4LfM6qMDjbVQO+n1qTmLjjKRRDWgp2Gh7
	KMCfagRfb7Ld/rdW2T8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhn2X-00GeN6-H4; Fri, 22 Apr 2022 06:45:13 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhn2J-00GeIw-4m; Fri, 22 Apr 2022 06:45:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 007EF1570;
 Thu, 21 Apr 2022 23:44:58 -0700 (PDT)
Received: from [10.163.40.48] (unknown [10.163.40.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD6A93F5A1;
 Thu, 21 Apr 2022 23:44:47 -0700 (PDT)
Message-ID: <89ec03a9-5fee-7f4f-d189-67eb2aad24a3@arm.com>
Date: Fri, 22 Apr 2022 12:15:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next v5 4/5] arm64: mm: add support for page table check
Content-Language: en-US
To: Tong Tiangen <tongtiangen@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220421082042.1167967-1-tongtiangen@huawei.com>
 <20220421082042.1167967-5-tongtiangen@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20220421082042.1167967-5-tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_234459_321247_1B086654 
X-CRM114-Status: GOOD (  19.33  )
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

Please change the subject line as

arm64/mm: Enable ARCH_SUPPORTS_PAGE_TABLE_CHECK

OR

arm64/mm: Subscribe ARCH_SUPPORTS_PAGE_TABLE_CHECK

On 4/21/22 13:50, Tong Tiangen wrote:
> From: Kefeng Wang <wangkefeng.wang@huawei.com>
> 
> As commit d283d422c6c4 ("x86: mm: add x86_64 support for page table
> check"), add some necessary page table check hooks into routines that
> modify user page tables.

Please make the commit message comprehensive, which should include

- Enabling ARCH_SUPPORTS_PAGE_TABLE_CHECK on arm64
- Adding all additional page table helpers required for PAGE_TABLE_CHECK
- Instrumenting existing page table helpers with page table check hooks

> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  arch/arm64/Kconfig               |  1 +
>  arch/arm64/include/asm/pgtable.h | 65 +++++++++++++++++++++++++++++---
>  2 files changed, 61 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 18a18a0e855d..c1509525ab8e 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -92,6 +92,7 @@ config ARM64
>  	select ARCH_SUPPORTS_ATOMIC_RMW
>  	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>  	select ARCH_SUPPORTS_NUMA_BALANCING
> +	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
>  	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
>  	select ARCH_WANT_DEFAULT_BPF_JIT
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 930077f7b572..9f8f97a7cc7c 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -33,6 +33,7 @@
>  #include <linux/mmdebug.h>
>  #include <linux/mm_types.h>
>  #include <linux/sched.h>
> +#include <linux/page_table_check.h>
>  
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
> @@ -96,6 +97,7 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>  #define pte_young(pte)		(!!(pte_val(pte) & PTE_AF))
>  #define pte_special(pte)	(!!(pte_val(pte) & PTE_SPECIAL))
>  #define pte_write(pte)		(!!(pte_val(pte) & PTE_WRITE))
> +#define pte_user(pte)		(!!(pte_val(pte) & PTE_USER))
>  #define pte_user_exec(pte)	(!(pte_val(pte) & PTE_UXN))
>  #define pte_cont(pte)		(!!(pte_val(pte) & PTE_CONT))
>  #define pte_devmap(pte)		(!!(pte_val(pte) & PTE_DEVMAP))
> @@ -312,7 +314,7 @@ static inline void __check_racy_pte_update(struct mm_struct *mm, pte_t *ptep,
>  		     __func__, pte_val(old_pte), pte_val(pte));
>  }
>  
> -static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
> +static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
>  			      pte_t *ptep, pte_t pte)
>  {
>  	if (pte_present(pte) && pte_user_exec(pte) && !pte_special(pte))
> @@ -343,6 +345,13 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
>  	set_pte(ptep, pte);
>  }
>  
> +static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
> +			      pte_t *ptep, pte_t pte)
> +{
> +	page_table_check_pte_set(mm, addr, ptep, pte);
> +	return __set_pte_at(mm, addr, ptep, pte);
> +}
> +
>  /*
>   * Huge pte definitions.
>   */
> @@ -454,6 +463,8 @@ static inline int pmd_trans_huge(pmd_t pmd)
>  #define pmd_dirty(pmd)		pte_dirty(pmd_pte(pmd))
>  #define pmd_young(pmd)		pte_young(pmd_pte(pmd))
>  #define pmd_valid(pmd)		pte_valid(pmd_pte(pmd))
> +#define pmd_user(pmd)		pte_user(pmd_pte(pmd))
> +#define pmd_user_exec(pmd)	pte_user_exec(pmd_pte(pmd))
>  #define pmd_cont(pmd)		pte_cont(pmd_pte(pmd))
>  #define pmd_wrprotect(pmd)	pte_pmd(pte_wrprotect(pmd_pte(pmd)))
>  #define pmd_mkold(pmd)		pte_pmd(pte_mkold(pmd_pte(pmd)))
> @@ -501,8 +512,19 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
>  #define pud_pfn(pud)		((__pud_to_phys(pud) & PUD_MASK) >> PAGE_SHIFT)
>  #define pfn_pud(pfn,prot)	__pud(__phys_to_pud_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))
>  
> -#define set_pmd_at(mm, addr, pmdp, pmd)	set_pte_at(mm, addr, (pte_t *)pmdp, pmd_pte(pmd))
> -#define set_pud_at(mm, addr, pudp, pud)	set_pte_at(mm, addr, (pte_t *)pudp, pud_pte(pud))
> +static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> +			      pmd_t *pmdp, pmd_t pmd)
> +{
> +	page_table_check_pmd_set(mm, addr, pmdp, pmd);
> +	return __set_pte_at(mm, addr, (pte_t *)pmdp, pmd_pte(pmd));
> +}
> +
> +static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
> +			      pud_t *pudp, pud_t pud)
> +{
> +	page_table_check_pud_set(mm, addr, pudp, pud);
> +	return __set_pte_at(mm, addr, (pte_t *)pudp, pud_pte(pud));
> +}
>  
>  #define __p4d_to_phys(p4d)	__pte_to_phys(p4d_pte(p4d))
>  #define __phys_to_p4d_val(phys)	__phys_to_pte_val(phys)
> @@ -643,6 +665,24 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
>  #define pud_present(pud)	pte_present(pud_pte(pud))
>  #define pud_leaf(pud)		pud_sect(pud)
>  #define pud_valid(pud)		pte_valid(pud_pte(pud))
> +#define pud_user(pud)		pte_user(pud_pte(pud))
> +
> +#ifdef CONFIG_PAGE_TABLE_CHECK
> +static inline bool pte_user_accessible_page(pte_t pte)
> +{
> +	return pte_present(pte) && (pte_user(pte) || pte_user_exec(pte));
> +}
> +
> +static inline bool pmd_user_accessible_page(pmd_t pmd)
> +{
> +	return pmd_present(pmd) && (pmd_user(pmd) || pmd_user_exec(pmd));
> +}
> +
> +static inline bool pud_user_accessible_page(pud_t pud)
> +{
> +	return pud_present(pud) && pud_user(pud);
> +}
> +#endif
>  
>  static inline void set_pud(pud_t *pudp, pud_t pud)
>  {
> @@ -872,11 +912,21 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> +static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
> +				       unsigned long address, pte_t *ptep)
> +{
> +	return __pte(xchg_relaxed(&pte_val(*ptep), 0));
> +}
> +
>  #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
>  static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>  				       unsigned long address, pte_t *ptep)
>  {
> -	return __pte(xchg_relaxed(&pte_val(*ptep), 0));
> +	pte_t pte = __ptep_get_and_clear(mm, address, ptep);
>

__ptep_get_and_clear() is not required. Please keep the __pte(xchg_relaxed(..),..)
unchanged as in the case with pmdp_huge_get_and_clear() helper below.

 +
> +	page_table_check_pte_clear(mm, address, pte);
> +
> +	return pte;
>  }
>  
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> @@ -884,7 +934,11 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>  static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>  					    unsigned long address, pmd_t *pmdp)
>  {
> -	return pte_pmd(ptep_get_and_clear(mm, address, (pte_t *)pmdp));
> +	pmd_t pmd = pte_pmd(__ptep_get_and_clear(mm, address, (pte_t *)pmdp));
> +
> +	page_table_check_pmd_clear(mm, address, pmd);
> +
> +	return pmd;
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> @@ -918,6 +972,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
>  static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>  		unsigned long address, pmd_t *pmdp, pmd_t pmd)
>  {
> +	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
>  	return __pmd(xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
>  }
>  #endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

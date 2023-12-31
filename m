Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85824C3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Dec 2023 06:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bszdpn/knOFreX1FUNvmXyyeT1HRZNJFNKxITq+0YcY=; b=JedmWI453z53lA
	0ZlSyVNDrXyZKzzrvabuBa3TSGS4fB8MfDBjQu4k/BLGudT8wscQw0T5ZEReZdj9pa27hOFzkyZeO
	oQ9wPu7sA8LV9bWMoIjs0gFqobJynI6RBydLk1RxPjfm7h2q19Y4XLT5UzHjbvw6Pe+TIx3qCtQ/m
	pSBiJG1SmhJ6fKp30XeQQANoBmeRaYyEvCAzd+Wu6nMm7HfCUGkandgltsd2kpSWy/F6WvnXvHHwZ
	x8m6lg94RAbNMrFd3iCsganU1zHRSM8SKDnqsCM8vu/yfNNwJCtX80TLXUSh+wGgIH2A3nUTqf2jD
	MFqiTEh25Xb0KNxl/PAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJpFM-0043uA-17;
	Sun, 31 Dec 2023 06:24:28 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJpFJ-0043tB-2y
	for linux-riscv@lists.infradead.org;
	Sun, 31 Dec 2023 06:24:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DD381C0002;
	Sun, 31 Dec 2023 06:24:22 +0000 (UTC)
Message-ID: <dc5e01b7-010b-4fc7-867b-b738a05becd9@ghiti.fr>
Date: Sun, 31 Dec 2023 07:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] riscv: tlb: convert __p*d_free_tlb() to inline
 functions
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
References: <20231219175046.2496-1-jszhang@kernel.org>
 <20231219175046.2496-3-jszhang@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231219175046.2496-3-jszhang@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231230_222426_240169_349C5F6F 
X-CRM114-Status: GOOD (  13.20  )
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

On 19/12/2023 18:50, Jisheng Zhang wrote:
> This is to prepare for enabling MMU_GATHER_RCU_TABLE_FREE.
> No functionality changes.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/include/asm/pgalloc.h | 54 +++++++++++++++++++-------------
>   1 file changed, 32 insertions(+), 22 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> index a12fb83fa1f5..3c5e3bd15f46 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -95,13 +95,16 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
>   		__pud_free(mm, pud);
>   }
>   
> -#define __pud_free_tlb(tlb, pud, addr)					\
> -do {									\
> -	if (pgtable_l4_enabled) {					\
> -		pagetable_pud_dtor(virt_to_ptdesc(pud));		\
> -		tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pud));	\
> -	}								\
> -} while (0)
> +static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
> +				  unsigned long addr)
> +{
> +	if (pgtable_l4_enabled) {
> +		struct ptdesc *ptdesc = virt_to_ptdesc(pud);
> +
> +		pagetable_pud_dtor(ptdesc);
> +		tlb_remove_page_ptdesc(tlb, ptdesc);
> +	}
> +}
>   
>   #define p4d_alloc_one p4d_alloc_one
>   static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
> @@ -130,11 +133,12 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
>   		__p4d_free(mm, p4d);
>   }
>   
> -#define __p4d_free_tlb(tlb, p4d, addr)					\
> -do {									\
> -	if (pgtable_l5_enabled)						\
> -		tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(p4d));	\
> -} while (0)
> +static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
> +				  unsigned long addr)
> +{
> +	if (pgtable_l5_enabled)
> +		tlb_remove_page_ptdesc(tlb, virt_to_ptdesc(p4d));
> +}
>   #endif /* __PAGETABLE_PMD_FOLDED */
>   
>   static inline void sync_kernel_mappings(pgd_t *pgd)
> @@ -159,19 +163,25 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>   
>   #ifndef __PAGETABLE_PMD_FOLDED
>   
> -#define __pmd_free_tlb(tlb, pmd, addr)				\
> -do {								\
> -	pagetable_pmd_dtor(virt_to_ptdesc(pmd));		\
> -	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
> -} while (0)
> +static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
> +				  unsigned long addr)
> +{
> +	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
> +
> +	pagetable_pmd_dtor(ptdesc);
> +	tlb_remove_page_ptdesc(tlb, ptdesc);
> +}
>   
>   #endif /* __PAGETABLE_PMD_FOLDED */
>   
> -#define __pte_free_tlb(tlb, pte, buf)			\
> -do {							\
> -	pagetable_pte_dtor(page_ptdesc(pte));		\
> -	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));\
> -} while (0)
> +static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
> +				  unsigned long addr)
> +{
> +	struct ptdesc *ptdesc = page_ptdesc(pte);
> +
> +	pagetable_pte_dtor(ptdesc);
> +	tlb_remove_page_ptdesc(tlb, ptdesc);
> +}
>   #endif /* CONFIG_MMU */
>   
>   #endif /* _ASM_RISCV_PGALLOC_H */


You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

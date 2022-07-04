Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77435C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 07:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8C0/FK5BcAMPma1+98MQGoizOoit77brABloyOQ0cmw=; b=H38ev03wVXsW6gPBeEXBGlJSbd
	n6LoUENcAviyuUvcc5O/1R1zczidsQyF1wVNrQeFhGeqRFY9KK+gecrsa2DzQeOVKKZ7FqGEkcRVb
	6Ts8BPCTrvmlgfMgvJu9pj/U47glq9mOcKJ7T3xhyy/sCRaKwC48letmZPHLebJ59LB6EuV//d2eJ
	MstkzhPHy0X0JBsROJTOnyZuFdzckg8kg9/ZTcMdXpuiviOCB6Yez4SLC8DnItwRxVJvemG/vk+BV
	wnzhY5HU9MwOlNCMdEzynLOOxcaWR+Y8G8i7R3wquvE7RUAdjamH3iLG+S7vUeJut8cn0QVBQ+cOO
	GjExs5zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8G73-005Xg0-8u; Mon, 04 Jul 2022 07:03:17 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8G6z-005Xcx-E8; Mon, 04 Jul 2022 07:03:15 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id BF6851C0009;
	Mon,  4 Jul 2022 07:03:01 +0000 (UTC)
Message-ID: <d5d1a6ef-1153-272b-af9b-9f369bbdd4e5@ghiti.fr>
Date: Mon, 4 Jul 2022 09:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH -fixes v2] riscv: Fix missing PAGE_PFN_MASK
Content-Language: en-US
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, Guo Ren
 <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20220613085307.260256-1-alexandre.ghiti@canonical.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20220613085307.260256-1-alexandre.ghiti@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_000313_819732_14415A27 
X-CRM114-Status: GOOD (  17.86  )
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

On 6/13/22 10:53, Alexandre Ghiti wrote:
> There are a bunch of functions that use the PFN from a page table entry
> that end up with the svpbmt upper-bits because they are missing the newly
> introduced PAGE_PFN_MASK which leads to wrong addresses conversions and
> then crash: fix this by adding this mask.
>
> Fixes: 100631b48ded ("riscv: Fix accessing pfn bits in PTEs for non-32bit variants")
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>   arch/riscv/include/asm/pgtable-64.h | 12 ++++++------
>   arch/riscv/include/asm/pgtable.h    |  6 +++---
>   arch/riscv/kvm/mmu.c                |  2 +-
>   3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 5c2aba5efbd0..dc42375c2357 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -175,7 +175,7 @@ static inline pud_t pfn_pud(unsigned long pfn, pgprot_t prot)
>   
>   static inline unsigned long _pud_pfn(pud_t pud)
>   {
> -	return pud_val(pud) >> _PAGE_PFN_SHIFT;
> +	return __page_val_to_pfn(pud_val(pud));
>   }
>   
>   static inline pmd_t *pud_pgtable(pud_t pud)
> @@ -278,13 +278,13 @@ static inline p4d_t pfn_p4d(unsigned long pfn, pgprot_t prot)
>   
>   static inline unsigned long _p4d_pfn(p4d_t p4d)
>   {
> -	return p4d_val(p4d) >> _PAGE_PFN_SHIFT;
> +	return __page_val_to_pfn(p4d_val(p4d));
>   }
>   
>   static inline pud_t *p4d_pgtable(p4d_t p4d)
>   {
>   	if (pgtable_l4_enabled)
> -		return (pud_t *)pfn_to_virt(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
> +		return (pud_t *)pfn_to_virt(__page_val_to_pfn(p4d_val(p4d)));
>   
>   	return (pud_t *)pud_pgtable((pud_t) { p4d_val(p4d) });
>   }
> @@ -292,7 +292,7 @@ static inline pud_t *p4d_pgtable(p4d_t p4d)
>   
>   static inline struct page *p4d_page(p4d_t p4d)
>   {
> -	return pfn_to_page(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
> +	return pfn_to_page(__page_val_to_pfn(p4d_val(p4d)));
>   }
>   
>   #define pud_index(addr) (((addr) >> PUD_SHIFT) & (PTRS_PER_PUD - 1))
> @@ -347,7 +347,7 @@ static inline void pgd_clear(pgd_t *pgd)
>   static inline p4d_t *pgd_pgtable(pgd_t pgd)
>   {
>   	if (pgtable_l5_enabled)
> -		return (p4d_t *)pfn_to_virt(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
> +		return (p4d_t *)pfn_to_virt(__page_val_to_pfn(pgd_val(pgd)));
>   
>   	return (p4d_t *)p4d_pgtable((p4d_t) { pgd_val(pgd) });
>   }
> @@ -355,7 +355,7 @@ static inline p4d_t *pgd_pgtable(pgd_t pgd)
>   
>   static inline struct page *pgd_page(pgd_t pgd)
>   {
> -	return pfn_to_page(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
> +	return pfn_to_page(__page_val_to_pfn(pgd_val(pgd)));
>   }
>   #define pgd_page(pgd)	pgd_page(pgd)
>   
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 1d1be9d9419c..5dbd6610729b 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -261,7 +261,7 @@ static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
>   
>   static inline unsigned long _pgd_pfn(pgd_t pgd)
>   {
> -	return pgd_val(pgd) >> _PAGE_PFN_SHIFT;
> +	return __page_val_to_pfn(pgd_val(pgd));
>   }
>   
>   static inline struct page *pmd_page(pmd_t pmd)
> @@ -590,14 +590,14 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
>   	return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
>   }
>   
> -#define __pmd_to_phys(pmd)  (pmd_val(pmd) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
> +#define __pmd_to_phys(pmd)  (__page_val_to_pfn(pmd_val(pmd)) << PAGE_SHIFT)
>   
>   static inline unsigned long pmd_pfn(pmd_t pmd)
>   {
>   	return ((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT);
>   }
>   
> -#define __pud_to_phys(pud)  (pud_val(pud) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
> +#define __pud_to_phys(pud)  (__page_val_to_pfn(pud_val(pud)) << PAGE_SHIFT)
>   
>   static inline unsigned long pud_pfn(pud_t pud)
>   {
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 1c00695ebee7..9826073fbc67 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -54,7 +54,7 @@ static inline unsigned long gstage_pte_index(gpa_t addr, u32 level)
>   
>   static inline unsigned long gstage_pte_page_vaddr(pte_t pte)
>   {
> -	return (unsigned long)pfn_to_virt(pte_val(pte) >> _PAGE_PFN_SHIFT);
> +	return (unsigned long)pfn_to_virt(__page_val_to_pfn(pte_val(pte)));
>   }
>   
>   static int gstage_page_size_to_level(unsigned long page_size, u32 *out_level)


@Palmer: IMO this should land in 5.19-rcX.

Thanks Heiko and Anup for the review,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

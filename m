Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D805C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jun 2022 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZsRjQQHNr+F1+BBPK2v2vS+0/bZUn+Nwl31owYyMjk=; b=V5tOl3URbbE+xm
	T1TIITq08vLg2jChNC8I6wwd7p3+6eu+6tPLiv/+R0KVOhZav32cN79gRFU90jjxjO57LBnVslcKu
	n7MzYtmNJT7/yDu9wIvXD0GCk2WhkTJtk05D3BhAv06XJ42urevj6uSho5UZ/ZJrqAqgbSOeMdN2Z
	/VISvHgsBNxBkHTegormnfUNcc01gx/dkvUJja6zslB6lgT7Rb/fWkui9rVmspZ6Q412yjknsAvwS
	i9Rp9NxZpr19pwznf2++xxHamLz6oGZ4CQyCOD32TsNeB2/IjxmMPINY2s8SJc1t3AF0oErEF94/k
	yfwDQC9KijHOYjmBZlwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx8ly-007uy6-T3; Fri, 03 Jun 2022 14:59:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx8lv-007uvX-Uj; Fri, 03 Jun 2022 14:59:33 +0000
Received: from p508fd41b.dip0.t-ipconnect.de ([80.143.212.27] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nx8li-00068q-A8; Fri, 03 Jun 2022 16:59:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>, Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: Re: [PATCH -for-next] riscv: Fix missing PAGE_PFN_MASK
Date: Fri, 03 Jun 2022 16:59:17 +0200
Message-ID: <6852601.cEBGB3zze1@phil>
In-Reply-To: <20220530094701.2891404-1-alexandre.ghiti@canonical.com>
References: <20220530094701.2891404-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_075932_039142_5DBFE312 
X-CRM114-Status: GOOD (  20.43  )
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

Hi,

Am Montag, 30. Mai 2022, 11:47:01 CEST schrieb Alexandre Ghiti:
> There are a bunch of functions that use the PFN from a page table entry
> that end up with the svpbmt upper-bits because they are missing the newly
> introduced PAGE_PFN_MASK which leads to wrong addresses conversions and
> then crash: fix this by adding this mask.
> 
> Fixes: 100631b48ded ("riscv: Fix accessing pfn bits in PTEs for non-32bit variants")
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>

agree with the approach but some things below:

> ---
>  arch/riscv/include/asm/pgtable-64.h | 4 ++--
>  arch/riscv/include/asm/pgtable.h    | 4 ++--
>  arch/riscv/kvm/mmu.c                | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
> index 6d59e4695200..0e57bf1e25e9 100644
> --- a/arch/riscv/include/asm/pgtable-64.h
> +++ b/arch/riscv/include/asm/pgtable-64.h
> @@ -153,7 +153,7 @@ static inline pud_t pfn_pud(unsigned long pfn, pgprot_t prot)
>  
>  static inline unsigned long _pud_pfn(pud_t pud)
>  {
> -	return pud_val(pud) >> _PAGE_PFN_SHIFT;
> +	return (pud_val(pud) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT;

we already have defined a helper:
	#define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)

so maybe just use

	return __page_val_to_pfn(pud_val(pud));

>  }
>  
>  static inline pmd_t *pud_pgtable(pud_t pud)
> @@ -240,7 +240,7 @@ static inline void p4d_clear(p4d_t *p4d)
>  static inline pud_t *p4d_pgtable(p4d_t p4d)
>  {
>  	if (pgtable_l4_enabled)
> -		return (pud_t *)pfn_to_virt(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
> +		return (pud_t *)pfn_to_virt((p4d_val(p4d) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);

	return (pud_t *)pfn_to_virt(__page_val_to_pfn(p4d_val(p4d)));

>  
>  	return (pud_t *)pud_pgtable((pud_t) { p4d_val(p4d) });
>  }
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index e2658a25f06d..43064025f4b0 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -255,7 +255,7 @@ static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
>  
>  static inline unsigned long _pgd_pfn(pgd_t pgd)
>  {
> -	return pgd_val(pgd) >> _PAGE_PFN_SHIFT;
> +	return (pgd_val(pgd) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT;

	return __page_val_to_pfn(pgd_val(pgd));

>  }
>  
>  static inline struct page *pmd_page(pmd_t pmd)
> @@ -568,7 +568,7 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
>  	return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
>  }
>  
> -#define __pmd_to_phys(pmd)  (pmd_val(pmd) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
> +#define __pmd_to_phys(pmd)  ((pmd_val(pmd) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)

	#define __pmd_to_phys(pmd)  (__page_val_to_pfn(pmd_val(pmd)) << PAGE_SHIFT)

>  
>  static inline unsigned long pmd_pfn(pmd_t pmd)
>  {
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index f80a34fbf102..db03c5a29d4c 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -55,7 +55,7 @@ static inline unsigned long stage2_pte_index(gpa_t addr, u32 level)
>  
>  static inline unsigned long stage2_pte_page_vaddr(pte_t pte)

This got renamed to gstage_pte_page_vaddr()
in commit 26708234eb12 ("RISC-V: KVM: Use G-stage name for hypervisor page table")

>  {
> -	return (unsigned long)pfn_to_virt(pte_val(pte) >> _PAGE_PFN_SHIFT);
> +	return (unsigned long)pfn_to_virt((pte_val(pte) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT);

return (unsigned long)pfn_to_virt(__page_val_to_pfn(pte_val(pte)));


Heiko

>  }
>  
>  static int stage2_page_size_to_level(unsigned long page_size, u32 *out_level)
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

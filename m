Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E908D1267A
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JM9Z8c4rv3qjxrcB7AqMJ0h1S2W4X+arCkHDdS/ZwO4=; b=QVl3qZZkKF4VNr
	dBgqfNpDJ8dg/WJvJzqOfxMzjX/6m5jSoicAz0rSEVRuVu6yZQU3ydM9kwpYoxKNd7h/MuR+aLfrg
	YWsXEVyaPX//saIxobBdPLkQU9jLF8IyxSbkDxTkoSssPxtrjSJBRSU//vXh4bsEmQ1WRlzKp1eHn
	RKb/nna+cb3v2QJF4zKHeM4YP5i+Ya0uzB4MAdExCV5CH9PdT3q//hGOR8yDJO/B+PXwEwjbMqUKL
	GndIx1ZUrUxdNOXN4Y+8U/CEzIzwM8HbzoDRyJIJ3S8qMyOlJU9RVgCU510AN0/u83v/Ms+jorIUn
	yScmfZ19o7ftTSqeslAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GkI-0000000GfOf-3DWP;
	Tue, 05 Nov 2024 10:25:10 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GkF-0000000GfMz-2tsZ
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 10:25:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E22181C0003;
	Tue,  5 Nov 2024 10:25:01 +0000 (UTC)
Message-ID: <38936e70-e293-446a-8efc-208d52e42573@ghiti.fr>
Date: Tue, 5 Nov 2024 11:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] riscv: mm: Increment PFN in place when splitting
 mappings
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
 <20241102000843.1301099-3-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241102000843.1301099-3-samuel.holland@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_022508_083140_273B82B3 
X-CRM114-Status: GOOD (  17.45  )
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
> The current code separates page table entry values into a PFN and a
> pgprot_t before incrementing the PFN and combining the two parts using
> pfn_pXX(). On some hardware with custom page table formats or memory
> aliases, the pfn_pXX() functions need to transform the PTE value, so
> these functions would need to apply the opposite transformation when
> breaking apart the PTE value.
>
> However, both transformations can be avoided by incrementing the PFN in
> place, as done by pte_advance_pfn() and set_ptes().
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>   arch/riscv/mm/pageattr.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index 271d01a5ba4d..335060adc1a6 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -109,9 +109,8 @@ static int __split_linear_mapping_pmd(pud_t *pudp,
>   			continue;
>   
>   		if (pmd_leaf(pmdp_get(pmdp))) {
> +			pte_t pte = pmd_pte(pmdp_get(pmdp));
>   			struct page *pte_page;
> -			unsigned long pfn = _pmd_pfn(pmdp_get(pmdp));
> -			pgprot_t prot = __pgprot(pmd_val(pmdp_get(pmdp)) & ~_PAGE_PFN_MASK);
>   			pte_t *ptep_new;
>   			int i;
>   
> @@ -121,7 +120,7 @@ static int __split_linear_mapping_pmd(pud_t *pudp,
>   
>   			ptep_new = (pte_t *)page_address(pte_page);
>   			for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep_new)
> -				set_pte(ptep_new, pfn_pte(pfn + i, prot));
> +				set_pte(ptep_new, pte_advance_pfn(pte, i));
>   
>   			smp_wmb();
>   
> @@ -149,9 +148,8 @@ static int __split_linear_mapping_pud(p4d_t *p4dp,
>   			continue;
>   
>   		if (pud_leaf(pudp_get(pudp))) {
> +			pmd_t pmd = __pmd(pud_val(pudp_get(pudp)));


Nit: You could use pud_pte() here.


>   			struct page *pmd_page;
> -			unsigned long pfn = _pud_pfn(pudp_get(pudp));
> -			pgprot_t prot = __pgprot(pud_val(pudp_get(pudp)) & ~_PAGE_PFN_MASK);
>   			pmd_t *pmdp_new;
>   			int i;
>   
> @@ -162,7 +160,8 @@ static int __split_linear_mapping_pud(p4d_t *p4dp,
>   			pmdp_new = (pmd_t *)page_address(pmd_page);
>   			for (i = 0; i < PTRS_PER_PMD; ++i, ++pmdp_new)
>   				set_pmd(pmdp_new,
> -					pfn_pmd(pfn + ((i * PMD_SIZE) >> PAGE_SHIFT), prot));
> +					__pmd(pmd_val(pmd) +
> +					      (i << (PMD_SHIFT - PAGE_SHIFT + PFN_PTE_SHIFT))));


Nit: Here you could use pte_advance_pfn(pmd, i << (PMD_SHIFT - PAGE_SHIFT))


>   
>   			smp_wmb();
>   
> @@ -198,9 +197,8 @@ static int __split_linear_mapping_p4d(pgd_t *pgdp,
>   			continue;
>   
>   		if (p4d_leaf(p4dp_get(p4dp))) {
> +			pud_t pud = __pud(p4d_val(p4dp_get(p4dp)));
>   			struct page *pud_page;
> -			unsigned long pfn = _p4d_pfn(p4dp_get(p4dp));
> -			pgprot_t prot = __pgprot(p4d_val(p4dp_get(p4dp)) & ~_PAGE_PFN_MASK);
>   			pud_t *pudp_new;
>   			int i;
>   
> @@ -215,7 +213,8 @@ static int __split_linear_mapping_p4d(pgd_t *pgdp,
>   			pudp_new = (pud_t *)page_address(pud_page);
>   			for (i = 0; i < PTRS_PER_PUD; ++i, ++pudp_new)
>   				set_pud(pudp_new,
> -					pfn_pud(pfn + ((i * PUD_SIZE) >> PAGE_SHIFT), prot));
> +					__pud(pud_val(pud) +
> +					      (i << (PUD_SHIFT - PAGE_SHIFT + PFN_PTE_SHIFT))));


Nit: Ditto


>   
>   			/*
>   			 * Make sure the pud filling is not reordered with the


Other than the nits (which are up to you), you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

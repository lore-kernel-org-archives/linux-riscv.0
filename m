Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE22C433E9
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 08:51:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C01264F56
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 08:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C01264F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qYCuEAP7Te0Wa9yD0nQczD8cbSLDM1cbWqs1wVUglM0=; b=1PCUxYDmplM5YUt555q3qj4t8
	Wo+20Z6cNspYcGt3VwpSg5bFZKw6cDXSqFT1tbnCAlgZ9X6Moo51UMrJ3fGF9uXVIOI5YiP5+8IWu
	+4I/VwFpMx5nic8+GD3GspX5rX6WF8MDo46UE++m+SQRV7mQebmaXNudryS3K2uPU/q4JrRytvJZH
	CKt14L0HDYeHDOVgQzL1cVhuLq2QQdAnJxdO1TZLeV7ibFwMwoZyC5ZmkDKkYtFZxswMeF8g3ocvZ
	WWx47MDP/bKjaF07sjcIjpn8XvkQFzuyV2+6GL3AW70DkPsvynT6hpcuVeAGghExoF12nB4Qncj8q
	Y8W1YrAHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6rOh-00061q-3y; Tue, 02 Feb 2021 08:50:55 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6rOe-000616-6y
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 08:50:53 +0000
X-Originating-IP: 82.65.183.113
Received: from [172.16.5.113] (82-65-183-113.subs.proxad.net [82.65.183.113])
 (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 70341240011;
 Tue,  2 Feb 2021 08:50:45 +0000 (UTC)
Subject: Re: [PATCH] riscv: Improve kasan population by using hugepages when
 possible
To: Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210201080024.844-1-alex@ghiti.fr>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <74fef5c9-0632-3e12-e11b-81dd115a4be5@ghiti.fr>
Date: Tue, 2 Feb 2021 03:50:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201080024.844-1-alex@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_035052_433894_74318CB9 
X-CRM114-Status: GOOD (  28.25  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Le 2/1/21 =E0 3:00 AM, Alexandre Ghiti a =E9crit=A0:
> Kasan function that populates the shadow regions used to allocate them
> page by page and did not take advantage of hugepages, so fix this by
> trying to allocate hugepages of 1GB and fallback to 2MB hugepages or 4K
> pages in case it fails.
> =

> This reduces the page table memory consumption and improves TLB usage,
> as shown below:
> =

> Before this patch:
> =

> ---[ Kasan shadow start ]---
> 0xffffffc000000000-0xffffffc400000000    0x00000000818ef000        16G PT=
E     . A . . . . R V
> 0xffffffc400000000-0xffffffc447fc0000    0x00000002b7f4f000   1179392K PT=
E     D A . . . W R V
> 0xffffffc480000000-0xffffffc800000000    0x00000000818ef000        14G PT=
E     . A . . . . R V
> ---[ Kasan shadow end ]---
> =

> After this patch:
> =

> ---[ Kasan shadow start ]---
> 0xffffffc000000000-0xffffffc400000000    0x00000000818ef000        16G PT=
E     . A . . . . R V
> 0xffffffc400000000-0xffffffc440000000    0x0000000240000000         1G PG=
D     D A . . . W R V
> 0xffffffc440000000-0xffffffc447e00000    0x00000002b7e00000       126M PM=
D     D A . . . W R V
> 0xffffffc447e00000-0xffffffc447fc0000    0x00000002b818f000      1792K PT=
E     D A . . . W R V
> 0xffffffc480000000-0xffffffc800000000    0x00000000818ef000        14G PT=
E     . A . . . . R V
> ---[ Kasan shadow end ]---
> =

> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>   arch/riscv/mm/kasan_init.c | 101 +++++++++++++++++++++++++++----------
>   1 file changed, 73 insertions(+), 28 deletions(-)
> =

> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index a8a2ffd9114a..8f11b73018b1 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -47,37 +47,82 @@ asmlinkage void __init kasan_early_init(void)
>   	local_flush_tlb_all();
>   }
>   =

> -static void __init populate(void *start, void *end)
> +static void kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned=
 long end)
> +{
> +	phys_addr_t phys_addr;
> +	pte_t *ptep =3D memblock_alloc(PTRS_PER_PTE * sizeof(pte_t), PAGE_SIZE);
> +
> +	do {
> +		phys_addr =3D memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> +		set_pte(ptep, pfn_pte(PFN_DOWN(phys_addr), PAGE_KERNEL));
> +	} while (ptep++, vaddr +=3D PAGE_SIZE, vaddr !=3D end);
> +
> +	set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa(ptep)), PAGE_TABLE));
> +}
> +
> +static void kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned=
 long end)
> +{
> +	phys_addr_t phys_addr;
> +	pmd_t *pmdp =3D memblock_alloc(PTRS_PER_PMD * sizeof(pmd_t), PAGE_SIZE);
> +	unsigned long next;
> +
> +	do {
> +		next =3D pmd_addr_end(vaddr, end);
> +
> +		if (IS_ALIGNED(vaddr, PMD_SIZE) && (next - vaddr) >=3D PMD_SIZE) {
> +			phys_addr =3D memblock_phys_alloc(PMD_SIZE, PMD_SIZE);
> +			if (phys_addr) {
> +				set_pmd(pmdp, pfn_pmd(PFN_DOWN(phys_addr), PAGE_KERNEL));
> +				continue;
> +			}
> +		}
> +
> +		kasan_populate_pte(pmdp, vaddr, end);
> +	} while (pmdp++, vaddr =3D next, vaddr !=3D end);
> +
> +	/*
> +	 * Wait for the whole PGD to be populated before setting the PGD in
> +	 * the page table, otherwise, if we did set the PGD before populating
> +	 * it entirely, memblock could allocate a page at a physical address
> +	 * where KASAN is not populated yet and then we'd get a page fault.
> +	 */
> +	set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa(pmdp)), PAGE_TABLE));

In case the PMD was filled entirely, PFN_DOWN(__pa(pmdp)) will point to =

the next physical page, which is wrong. The same problem happens on the =

other levels too.

I'll fix that in a v2 later today.

Alex

> +}
> +
> +static void kasan_populate_pgd(unsigned long vaddr, unsigned long end)
> +{
> +	phys_addr_t phys_addr;
> +	pgd_t *pgdp =3D pgd_offset_k(vaddr);
> +	unsigned long next;
> +
> +	do {
> +		next =3D pgd_addr_end(vaddr, end);
> +
> +		if (IS_ALIGNED(vaddr, PGDIR_SIZE) && (next - vaddr) >=3D PGDIR_SIZE) {
> +			phys_addr =3D memblock_phys_alloc(PGDIR_SIZE, PGDIR_SIZE);
> +			if (phys_addr) {
> +				set_pgd(pgdp, pfn_pgd(PFN_DOWN(phys_addr), PAGE_KERNEL));
> +				continue;
> +			}
> +		}
> +
> +		kasan_populate_pmd(pgdp, vaddr, end);
> +	} while (pgdp++, vaddr =3D next, vaddr !=3D end);
> +}
> +
> +/*
> + * This function populates KASAN shadow region focusing on hugepages in
> + * order to minimize the page table cost and TLB usage too.
> + * Note that start must be PGDIR_SIZE-aligned in SV39 which amounts to be
> + * 1G aligned (that represents a 8G alignment constraint on virtual addr=
ess
> + * ranges because of KASAN_SHADOW_SCALE_SHIFT).
> + */
> +static void __init kasan_populate(void *start, void *end)
>   {
> -	unsigned long i, offset;
>   	unsigned long vaddr =3D (unsigned long)start & PAGE_MASK;
>   	unsigned long vend =3D PAGE_ALIGN((unsigned long)end);
> -	unsigned long n_pages =3D (vend - vaddr) / PAGE_SIZE;
> -	unsigned long n_ptes =3D
> -	    ((n_pages + PTRS_PER_PTE) & -PTRS_PER_PTE) / PTRS_PER_PTE;
> -	unsigned long n_pmds =3D
> -	    ((n_ptes + PTRS_PER_PMD) & -PTRS_PER_PMD) / PTRS_PER_PMD;
> -
> -	pte_t *pte =3D
> -	    memblock_alloc(n_ptes * PTRS_PER_PTE * sizeof(pte_t), PAGE_SIZE);
> -	pmd_t *pmd =3D
> -	    memblock_alloc(n_pmds * PTRS_PER_PMD * sizeof(pmd_t), PAGE_SIZE);
> -	pgd_t *pgd =3D pgd_offset_k(vaddr);
> -
> -	for (i =3D 0; i < n_pages; i++) {
> -		phys_addr_t phys =3D memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
> -		set_pte(&pte[i], pfn_pte(PHYS_PFN(phys), PAGE_KERNEL));
> -	}
> -
> -	for (i =3D 0, offset =3D 0; i < n_ptes; i++, offset +=3D PTRS_PER_PTE)
> -		set_pmd(&pmd[i],
> -			pfn_pmd(PFN_DOWN(__pa(&pte[offset])),
> -				__pgprot(_PAGE_TABLE)));
>   =

> -	for (i =3D 0, offset =3D 0; i < n_pmds; i++, offset +=3D PTRS_PER_PMD)
> -		set_pgd(&pgd[i],
> -			pfn_pgd(PFN_DOWN(__pa(&pmd[offset])),
> -				__pgprot(_PAGE_TABLE)));
> +	kasan_populate_pgd(vaddr, vend);
>   =

>   	local_flush_tlb_all();
>   	memset(start, 0, end - start);
> @@ -99,7 +144,7 @@ void __init kasan_init(void)
>   		if (start >=3D end)
>   			break;
>   =

> -		populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
> +		kasan_populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
>   	};
>   =

>   	for (i =3D 0; i < PTRS_PER_PTE; i++)
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

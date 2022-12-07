Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8851AC352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 18:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKq4vBnJg/b46ENR4lwM2YnmF6tn69Y/t61QPMTHfVY=; b=mF8OU8bJiHEf77Ocd4ITGx3b66
	iLI6xo4dhisXGszNlPa2JG5z+C4hcQ+iP7w4g1DiIxL5ubXC6TUupPa2v5gDGoiuGbFrIIHU+rOWJ
	FSUOFGjh1VQ3EkgHiNgoAHnRte6T4pYpVZGRE0xCx9yOUMeMoQSDzpUK+tq8/Sd4P3SIgJEYkv/Kl
	mWAR9RDI2i6boqv209czGYNmEdlIz8B8fKa/apxb7Shdf0z47BbxuO+VG7+Z9konpacU7qtpfCIxU
	g7ukQP0iAnUA5nTue49EwK8qkhs6o7cqTFTHUbf6oUnyixM+ddtDuUzpK/slYhrfmY3vNKMrmUK/v
	7hbnybCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2zZl-009rQn-F7; Wed, 07 Dec 2022 18:55:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2zZZ-009qgJ-GA
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 18:55:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C1F2DB8204F;
	Wed,  7 Dec 2022 18:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97144C433D6;
	Wed,  7 Dec 2022 18:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670439310;
	bh=hfyKDGUyWW40ovwevt7VK1jNev6LCUvTr6H1/Iuy6c4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=byR9K4+p25QbFNxKazq5olXLtsxZXApx+fDW+kQ8Pi/atat7qI1Msth21ub9aHbLF
	 Vb5yqQq1ruqD/i5bphX6tocdvINJACa6+y/NBPMdJlooX5AMryf+uiAkSLTlwd6ohY
	 kECzsoumQeEnkHtS9wrrHQSWoYyoI+mjT5x81cG+AfWe3qav5Sq7TsGMPpbzPbY6p6
	 Q3MaccuRIpANHwzfOEtl9/sRcAMP/mJrj1u9YncyZ//EOfcoJwXfkRWpPGFGqCmqQ6
	 NXxD2tK6zmOGkmkBJat17ReRH5MW/2fx6tnX9eziIMX0igozwcapD99hEK+Yr8fO3b
	 r/mPZ/1Pea7bQ==
Date: Wed, 7 Dec 2022 18:55:06 +0000
From: Conor Dooley <conor@kernel.org>
To: panqinglin2020@iscas.ac.cn
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
	xuyinan@ict.ac.cn, ajones@ventanamicro.com, alex@ghiti.fr,
	jszhang@kernel.org
Subject: Re: [PATCH v9 2/3] riscv: mm: support Svnapot in hugetlb page
Message-ID: <Y5Dhii4DwcIPqvyh@spud>
References: <20221204141137.691790-1-panqinglin2020@iscas.ac.cn>
 <20221204141137.691790-3-panqinglin2020@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20221204141137.691790-3-panqinglin2020@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_105513_854874_1A6650CC 
X-CRM114-Status: GOOD (  30.56  )
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
Content-Type: multipart/mixed; boundary="===============3894567194989783417=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3894567194989783417==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="faMyzldzwzGgXySz"
Content-Disposition: inline


--faMyzldzwzGgXySz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 04, 2022 at 10:11:36PM +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>=20
> Svnapot can be used to support 64KB hugetlb page, so it can become a new
> option when using hugetlbfs. Add a basic implementation of hugetlb page,
> and support 64KB as a size in it by using Svnapot.
>=20
> For test, boot kernel with command line contains "default_hugepagesz=3D64K
> hugepagesz=3D64K hugepages=3D20" and run a simple test like this:
>=20
> tools/testing/selftests/vm/map_hugetlb 1 16
>=20
> And it should be passed.
>=20
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1d8477c0af7c..be5c1edea70f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -43,7 +43,7 @@ config RISCV
>  	select ARCH_USE_QUEUED_RWLOCKS
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>  	select ARCH_WANT_FRAME_POINTERS
> -	select ARCH_WANT_GENERAL_HUGETLB
> +	select ARCH_WANT_GENERAL_HUGETLB if !RISCV_ISA_SVNAPOT

I am expecting this to be a dumb question too, but I'm curious again
about what happens in a system that enables CONFIG_RISCV_ISA_SVNAPOT but
the platform it is running on does not support it...

>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>  	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
>  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
> diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hu=
getlb.h
> index ec19d6afc896..fe6f23006641 100644
> --- a/arch/riscv/include/asm/hugetlb.h
> +++ b/arch/riscv/include/asm/hugetlb.h
> @@ -2,7 +2,6 @@
>  #ifndef _ASM_RISCV_HUGETLB_H
>  #define _ASM_RISCV_HUGETLB_H
> =20
> -#include <asm-generic/hugetlb.h>
>  #include <asm/page.h>
> =20
>  static inline void arch_clear_hugepage_flags(struct page *page)
> @@ -11,4 +10,37 @@ static inline void arch_clear_hugepage_flags(struct pa=
ge *page)
>  }
>  #define arch_clear_hugepage_flags arch_clear_hugepage_flags
> =20
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +#define __HAVE_ARCH_HUGE_PTE_CLEAR
> +void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
> +		    pte_t *ptep, unsigned long sz);
> +
> +#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
> +void set_huge_pte_at(struct mm_struct *mm,
> +		     unsigned long addr, pte_t *ptep, pte_t pte);
> +
> +#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> +			      unsigned long addr, pte_t *ptep);
> +
> +#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
> +pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> +			    unsigned long addr, pte_t *ptep);
> +
> +#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
> +void huge_ptep_set_wrprotect(struct mm_struct *mm,
> +			     unsigned long addr, pte_t *ptep);
> +
> +#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
> +int huge_ptep_set_access_flags(struct vm_area_struct *vma,
> +			       unsigned long addr, pte_t *ptep,
> +			       pte_t pte, int dirty);
> +
> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t fla=
gs);
> +#define arch_make_huge_pte arch_make_huge_pte
> +
> +#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
> +
> +#include <asm-generic/hugetlb.h>

=2E..is this sufficient to fall back to generic huge pages?

Hopefully that's just my ignorance on show!

Thanks,
Conor.

> +
>  #endif /* _ASM_RISCV_HUGETLB_H */
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index 932dadfdca54..49f92f8cd431 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -2,6 +2,301 @@
>  #include <linux/hugetlb.h>
>  #include <linux/err.h>
> =20
> +#ifdef CONFIG_RISCV_ISA_SVNAPOT
> +pte_t *huge_pte_alloc(struct mm_struct *mm,
> +		      struct vm_area_struct *vma,
> +		      unsigned long addr,
> +		      unsigned long sz)
> +{
> +	pgd_t *pgd;
> +	p4d_t *p4d;
> +	pud_t *pud;
> +	pmd_t *pmd;
> +	pte_t *pte =3D NULL;
> +	unsigned long order;
> +
> +	pgd =3D pgd_offset(mm, addr);
> +	p4d =3D p4d_alloc(mm, pgd, addr);
> +	if (!p4d)
> +		return NULL;
> +
> +	pud =3D pud_alloc(mm, p4d, addr);
> +	if (!pud)
> +		return NULL;
> +
> +	if (sz =3D=3D PUD_SIZE) {
> +		pte =3D (pte_t *)pud;
> +		goto out;
> +	}
> +
> +	if (sz =3D=3D PMD_SIZE) {
> +		if (want_pmd_share(vma, addr) && pud_none(*pud))
> +			pte =3D huge_pmd_share(mm, vma, addr, pud);
> +		else
> +			pte =3D (pte_t *)pmd_alloc(mm, pud, addr);
> +		goto out;
> +	}
> +
> +	pmd =3D pmd_alloc(mm, pud, addr);
> +	if (!pmd)
> +		return NULL;
> +
> +	for_each_napot_order(order) {
> +		if (napot_cont_size(order) =3D=3D sz) {
> +			pte =3D pte_alloc_map(mm, pmd, (addr & napot_cont_mask(order)));
> +			break;
> +		}
> +	}
> +
> +out:
> +	WARN_ON_ONCE(pte && pte_present(*pte) && !pte_huge(*pte));
> +	return pte;
> +}
> +
> +pte_t *huge_pte_offset(struct mm_struct *mm,
> +		       unsigned long addr,
> +		       unsigned long sz)
> +{
> +	pgd_t *pgd;
> +	p4d_t *p4d;
> +	pud_t *pud;
> +	pmd_t *pmd;
> +	pte_t *pte =3D NULL;
> +	unsigned long order;
> +
> +	pgd =3D pgd_offset(mm, addr);
> +	if (!pgd_present(*pgd))
> +		return NULL;
> +	p4d =3D p4d_offset(pgd, addr);
> +	if (!p4d_present(*p4d))
> +		return NULL;
> +
> +	pud =3D pud_offset(p4d, addr);
> +	if (sz =3D=3D PUD_SIZE)
> +		/* must be pud huge, non-present or none */
> +		return (pte_t *)pud;
> +	if (!pud_present(*pud))
> +		return NULL;
> +
> +	pmd =3D pmd_offset(pud, addr);
> +	if (sz =3D=3D PMD_SIZE)
> +		/* must be pmd huge, non-present or none */
> +		return (pte_t *)pmd;
> +	if (!pmd_present(*pmd))
> +		return NULL;
> +
> +	for_each_napot_order(order) {
> +		if (napot_cont_size(order) =3D=3D sz) {
> +			pte =3D pte_offset_kernel(pmd, (addr & napot_cont_mask(order)));
> +			break;
> +		}
> +	}
> +	return pte;
> +}
> +
> +static pte_t get_clear_contig(struct mm_struct *mm,
> +			      unsigned long addr,
> +			      pte_t *ptep,
> +			      unsigned long pte_num)
> +{
> +	pte_t orig_pte =3D ptep_get(ptep);
> +	unsigned long i;
> +
> +	for (i =3D 0; i < pte_num; i++, addr +=3D PAGE_SIZE, ptep++) {
> +		pte_t pte =3D ptep_get_and_clear(mm, addr, ptep);
> +
> +		if (pte_dirty(pte))
> +			orig_pte =3D pte_mkdirty(orig_pte);
> +
> +		if (pte_young(pte))
> +			orig_pte =3D pte_mkyoung(orig_pte);
> +	}
> +	return orig_pte;
> +}
> +
> +static pte_t get_clear_contig_flush(struct mm_struct *mm,
> +				    unsigned long addr,
> +				    pte_t *ptep,
> +				    unsigned long pte_num)
> +{
> +	pte_t orig_pte =3D get_clear_contig(mm, addr, ptep, pte_num);
> +	bool valid =3D !pte_none(orig_pte);
> +	struct vm_area_struct vma =3D TLB_FLUSH_VMA(mm, 0);
> +
> +	if (valid)
> +		flush_tlb_range(&vma, addr, addr + (PAGE_SIZE * pte_num));
> +
> +	return orig_pte;
> +}
> +
> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t fla=
gs)
> +{
> +	unsigned long order;
> +
> +	for_each_napot_order(order) {
> +		if (shift =3D=3D napot_cont_shift(order)) {
> +			entry =3D pte_mknapot(entry, order);
> +			break;
> +		}
> +	}
> +	if (order =3D=3D NAPOT_ORDER_MAX)
> +		entry =3D pte_mkhuge(entry);
> +
> +	return entry;
> +}
> +
> +void set_huge_pte_at(struct mm_struct *mm,
> +		     unsigned long addr,
> +		     pte_t *ptep,
> +		     pte_t pte)
> +{
> +	int i;
> +	int pte_num;
> +
> +	if (!pte_napot(pte)) {
> +		set_pte_at(mm, addr, ptep, pte);
> +		return;
> +	}
> +
> +	pte_num =3D napot_pte_num(napot_cont_order(pte));
> +	for (i =3D 0; i < pte_num; i++, ptep++, addr +=3D PAGE_SIZE)
> +		set_pte_at(mm, addr, ptep, pte);
> +}
> +
> +int huge_ptep_set_access_flags(struct vm_area_struct *vma,
> +			       unsigned long addr,
> +			       pte_t *ptep,
> +			       pte_t pte,
> +			       int dirty)
> +{
> +	pte_t orig_pte;
> +	int i;
> +	int pte_num;
> +	struct mm_struct *mm =3D vma->vm_mm;
> +
> +	if (!pte_napot(pte))
> +		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
> +
> +	pte_num =3D napot_pte_num(napot_cont_order(pte));
> +	ptep =3D huge_pte_offset(mm, addr,
> +			       napot_cont_size(napot_cont_order(pte)));
> +	orig_pte =3D get_clear_contig_flush(mm, addr, ptep, pte_num);
> +
> +	if (pte_dirty(orig_pte))
> +		pte =3D pte_mkdirty(pte);
> +
> +	if (pte_young(orig_pte))
> +		pte =3D pte_mkyoung(pte);
> +
> +	for (i =3D 0; i < pte_num; i++, addr +=3D PAGE_SIZE, ptep++)
> +		set_pte_at(mm, addr, ptep, pte);
> +
> +	return true;
> +}
> +
> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> +			      unsigned long addr,
> +			      pte_t *ptep)
> +{
> +	int pte_num;
> +	pte_t orig_pte =3D ptep_get(ptep);
> +
> +	if (!pte_napot(orig_pte))
> +		return ptep_get_and_clear(mm, addr, ptep);
> +
> +	pte_num =3D napot_pte_num(napot_cont_order(orig_pte));
> +
> +	return get_clear_contig(mm, addr, ptep, pte_num);
> +}
> +
> +void huge_ptep_set_wrprotect(struct mm_struct *mm,
> +			     unsigned long addr,
> +			     pte_t *ptep)
> +{
> +	int i;
> +	int pte_num;
> +	pte_t pte =3D ptep_get(ptep);
> +
> +	if (!pte_napot(pte)) {
> +		ptep_set_wrprotect(mm, addr, ptep);
> +		return;
> +	}
> +
> +	pte_num =3D napot_pte_num(napot_cont_order(pte));
> +	ptep =3D huge_pte_offset(mm, addr, napot_cont_size(napot_cont_order(pte=
)));
> +
> +	for (i =3D 0; i < pte_num; i++, addr +=3D PAGE_SIZE, ptep++)
> +		ptep_set_wrprotect(mm, addr, ptep);
> +}
> +
> +pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> +			    unsigned long addr,
> +			    pte_t *ptep)
> +{
> +	int pte_num;
> +	pte_t pte =3D ptep_get(ptep);
> +
> +	if (!pte_napot(pte))
> +		return ptep_clear_flush(vma, addr, ptep);
> +
> +	pte_num =3D napot_pte_num(napot_cont_order(pte));
> +
> +	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
> +}
> +
> +void huge_pte_clear(struct mm_struct *mm,
> +		    unsigned long addr,
> +		    pte_t *ptep,
> +		    unsigned long sz)
> +{
> +	int i, pte_num;
> +	pte_t pte =3D READ_ONCE(*ptep);
> +
> +	if (!pte_napot(pte)) {
> +		pte_clear(mm, addr, ptep);
> +		return;
> +	}
> +
> +	pte_num =3D napot_pte_num(napot_cont_order(pte));
> +	for (i =3D 0; i < pte_num; i++, addr +=3D PAGE_SIZE, ptep++)
> +		pte_clear(mm, addr, ptep);
> +}
> +
> +bool __init is_napot_size(unsigned long size)
> +{
> +	unsigned long order;
> +
> +	if (!has_svnapot())
> +		return false;
> +
> +	for_each_napot_order(order) {
> +		if (size =3D=3D napot_cont_size(order))
> +			return true;
> +	}
> +	return false;
> +}
> +
> +static __init int napot_hugetlbpages_init(void)
> +{
> +	if (has_svnapot()) {
> +		unsigned long order;
> +
> +		for_each_napot_order(order)
> +			hugetlb_add_hstate(order);
> +	}
> +	return 0;
> +}
> +arch_initcall(napot_hugetlbpages_init);
> +
> +#else
> +
> +bool __init is_napot_size(unsigned long size)
> +{
> +	return false;
> +}
> +
> +#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
> +
>  int pud_huge(pud_t pud)
>  {
>  	return pud_leaf(pud);
> @@ -18,6 +313,8 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>  		return true;
>  	else if (IS_ENABLED(CONFIG_64BIT) && size =3D=3D PUD_SIZE)
>  		return true;
> +	else if (is_napot_size(size))
> +		return true;
>  	else
>  		return false;
>  }
> --=20
> 2.37.4
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

--faMyzldzwzGgXySz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5DhiQAKCRB4tDGHoIJi
0tqjAPwIirBjld7QIqWdskBlXrc3NxWRffF7lxguSRIzGVYtkAEA+sdpJseBDHPA
UyIfWbBh+AFN5YZGzKtIjHYodJNWSAI=
=dYyB
-----END PGP SIGNATURE-----

--faMyzldzwzGgXySz--


--===============3894567194989783417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3894567194989783417==--


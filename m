Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F2C606A323
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 20:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hg4b7RTl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ikPR7pJe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zOxgvOvXH02dE0KloC3PBEHQp/mnYWwN4fNIf7ARcWI=; b=Hg4b7RTl7wgCVE1gwnXdAbhjho
	h8w2LG7fCmCJZzNUdB5RvDso6QSNebKMXeWJJpRFrnhwXzLO6+ywkJcdmqGAPNebOX0VQtYs9hxsL
	Dl74yEk5f2YfYA5gWvpxlzJrmSN50ypmtKkGpPPynqrLX67+uGN5y7OANdd619X7f1VZSdfpW4jdr
	SG8D1J3hrU9cx8WcPQmio4tIC5f+PgEFfic5UwOSOUP+cSmplGoanX6WwDH+QqC33MPaqNne7bxxI
	5c//h31q/+rKIzpxwK/8P0ygT0bNhB3GpEWJv5LpvP7D7oHLqZz7YrNWqy3xLjWOUtQPMyzpI42cx
	8DRXsIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyCU-0000000EUMa-1KZC;
	Fri, 13 Nov 2026 20:48:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyCT-0000000EULv-1GuH
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 20:48:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA540414C3;
	Fri, 13 Nov 2026 20:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB9B1F000CF;
	Fri, 13 Nov 2026 20:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602924;
	bh=HbZ+0LydDJ6rcuj2MEvM/ZyS22hRjkKslj361gDn6Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ikPR7pJevGBa7Go85rNPXEZVUfBVgf/s0MJkuGJuESAF+idbRbGTE+B84+gCxM8x8
	 vL3li2nBMSJMMM96wmdfIu9JXpkzZji86uJ5QqLuOmaO68XarXA/+S9slrp8X83qZg
	 CFfeMV4/gjVZ21nmSuMOfs8xNVk+hg/FOS/2AqePaBlWCRfe1xE7wVKI9qEu34Z7zQ
	 CZB7C8Jgj43VDP16H7xpvd3SJn4KhnLKJrAXtzvcttnAJLmvfWZSvf7ArDNdbFNDUd
	 BIcWrUDH5dwLvlwlVUmJO9pALbhe70m6DPVhTPU3z4ROHr1eeU6+L8jBP7iit8QWX4
	 k1ZuepTwYyWdw==
Date: Fri, 13 Nov 2026 20:48:34 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org, seanjc@google.com, 
	pbonzini@redhat.com, akpm@linux-foundation.org, david@kernel.org, peterx@redhat.com, 
	imbrenda@linux.ibm.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>
Subject: Re: [PATCH v3 3/9] mm/huge_memory: honor MM_CP_TRY_CHANGE_WRITABLE
 in change_huge_pud()
Message-ID: <avd0Cexmmu7kCN45@gremlin>
References: <20261112142039.907090-2-clopez@suse.de>
 <20261112142039.907090-5-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261112142039.907090-5-clopez@suse.de>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 03:20:32PM +0100, Carlos L=F3pez wrote:
> change_protection() applies vma->vm_page_prot, which lacks the write bit
> for CoW and write-notified mappings. MM_CP_TRY_CHANGE_WRITABLE makes
> entries writable again if a write fault would only set the write bit.
>
> However, change_huge_pud() ignores the flag. For example, device DAX
> mappings are write-notified once soft-dirty tracking is armed through
> /proc/pid/clear_refs, and a protection change then leaves dirty PUDs
> read-only, so the next write to each of them faults.
>
> Fix this by adding can_change_pud_writable(), based on
> can_change_pmd_writable(). It omits the NUMA and uffd-wp checks, as
> change_huge_pud() bails out on those changes.
>
> Signed-off-by: Carlos L=F3pez <clopez@suse.de>

Is this a real problem that actual people have had?

The why of all this is still eluding me, especially for THP PUD...

> ---
>  include/linux/pgtable.h |  5 +++++
>  mm/huge_memory.c        | 28 +++++++++++++++++++++++++++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 780fe849ff8b..943d7e95f426 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1866,6 +1866,11 @@ static inline int pmd_soft_dirty(pmd_t pmd)
>  	return 0;
>  }
>
> +static inline int pud_soft_dirty(pud_t pud)
> +{
> +	return 0;
> +}
> +
>  static inline pte_t pte_mksoft_dirty(pte_t pte)
>  {
>  	return pte;
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index eb913acb03b7..080b718eb7de 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2833,6 +2833,29 @@ int change_huge_pmd(struct mmu_gather *tlb, struct=
 vm_area_struct *vma,
>  	return ret;
>  }
>
> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> +static inline bool can_change_pud_writable(struct vm_area_struct *vma,
> +					   unsigned long addr, pud_t pud)
> +{
> +	struct page *page;
> +
> +	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
> +		return false;
> +
> +	/* Do we need write faults for softdirty tracking? */
> +	if (vma_soft_dirty_enabled(vma) && !pud_soft_dirty(pud))
> +		return false;
> +
> +	if (!(vma->vm_flags & VM_SHARED)) {

This is getting annoying now, you're seemingly _knowingly_ writing deprecat=
ed
VMA flag API code on purpose.

> +		/* See can_change_pte_writable(). */
> +		page =3D vm_normal_page_pud(vma, addr, pud);
> +		return page && PageAnon(page) && PageAnonExclusive(page);
> +	}
> +
> +	/* See can_change_pte_writable(). */
> +	return pud_dirty(pud);
> +}
> +
>  /*
>   * Returns:
>   *
> @@ -2840,7 +2863,6 @@ int change_huge_pmd(struct mmu_gather *tlb, struct =
vm_area_struct *vma,
>   * - 1: if pud can be skipped
>   * - HPAGE_PUD_NR: if pud was successfully processed
>   */
> -#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>  int change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  		    pud_t *pudp, unsigned long addr, pgprot_t newprot,
>  		    unsigned long cp_flags)
> @@ -2872,6 +2894,10 @@ int change_huge_pud(struct mmu_gather *tlb, struct=
 vm_area_struct *vma,
>  	 */
>  	oldpud =3D pudp_invalidate(vma, addr, pudp);
>  	entry =3D pud_modify(oldpud, newprot);
> +	/* See change_pte_range(). */
> +	if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) && !pud_write(entry) &&
> +	    can_change_pud_writable(vma, addr, entry))
> +		entry =3D pud_mkwrite(entry);
>  	set_pud_at(mm, addr, pudp, entry);
>  	tlb_flush_pud_range(tlb, addr, HPAGE_PUD_SIZE);
>
> --
> 2.51.0
>

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

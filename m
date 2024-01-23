Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0F8C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 12:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzxouNi14zm/DpE38l6flNziRjivbbiWZVDrVev71fQ=; b=ugx+yY3xzKMsCd
	f6WSQoxCwzV6+PMZjPxTnNlGZn2bPjQPyufsKAZqoxOqz8bURTXZ/CPscgcW8JnjVPg2yHYpty4oR
	1MHLWUyazX01oTZUlg5OMr8mKV0CAVTysdyuZpnnyvK30IWsgE1Vt2noKJxuE+GEZM8HwQwq2HiUM
	w5zLn7HEugHfZtV+nSuQ+GgTVU1Rs5Q1m/0JrGj+JgcPfLHKaAWGS162EnVB3fAB3MG4SAn43fSj0
	7aot1htKW6VLNEnEl6/W5VdpZD6QdQ6hH+35DFYEWY/l6fkgQQAn3XdVkvcf8z8XKId0ahO/Nw4Y5
	eyMXUj2IMPVSyyHd+TjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSFzr-00GQfG-0i;
	Tue, 23 Jan 2024 12:35:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSFzm-00GQdb-2w;
	Tue, 23 Jan 2024 12:35:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C011FB;
	Tue, 23 Jan 2024 04:35:57 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D4703F762;
	Tue, 23 Jan 2024 04:35:08 -0800 (PST)
Message-ID: <2ed34573-2f11-485d-9d8d-224e98aa59b2@arm.com>
Date: Tue, 23 Jan 2024 12:35:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/11] mm/memory: ignore writable bit in
 folio_pte_batch()
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-12-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240122194200.381241-12-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_043515_043163_DA7055AF 
X-CRM114-Status: GOOD (  21.26  )
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

On 22/01/2024 19:42, David Hildenbrand wrote:
> ... and conditionally return to the caller if any pte except the first one
> is writable. fork() has to make sure to properly write-protect in case any
> PTE is writable. Other users (e.g., page unmaping) won't care.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  mm/memory.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 341b2be845b6e..a26fd0669016b 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -955,7 +955,7 @@ static __always_inline void __copy_present_ptes(struct vm_area_struct *dst_vma,
>  
>  static inline pte_t __pte_batch_clear_ignored(pte_t pte)
>  {
> -	return pte_clear_soft_dirty(pte_mkclean(pte_mkold(pte)));
> +	return pte_wrprotect(pte_clear_soft_dirty(pte_mkclean(pte_mkold(pte))));
>  }
>  
>  /*
> @@ -963,20 +963,29 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte)
>   * pages of the same folio.
>   *
>   * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN.
> - * the accessed bit, dirty bit and soft-dirty bit.
> + * the accessed bit, dirty bit, soft-dirty bit and writable bit.
> + . If "any_writable" is set, it will indicate if any other PTE besides the
> + * first (given) PTE is writable.
>   */
>  static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
> -		pte_t *start_ptep, pte_t pte, int max_nr)
> +		pte_t *start_ptep, pte_t pte, int max_nr, bool *any_writable)
>  {
>  	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
>  	const pte_t *end_ptep = start_ptep + max_nr;
>  	pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte));
>  	pte_t *ptep = start_ptep + 1;
> +	bool writable;
> +
> +	if (any_writable)
> +		*any_writable = false;
>  
>  	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>  
>  	while (ptep != end_ptep) {
> -		pte = __pte_batch_clear_ignored(ptep_get(ptep));
> +		pte = ptep_get(ptep);
> +		if (any_writable)
> +			writable = !!pte_write(pte);
> +		pte = __pte_batch_clear_ignored(pte);
>  
>  		if (!pte_same(pte, expected_pte))
>  			break;
> @@ -989,6 +998,9 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
>  		if (pte_pfn(pte) == folio_end_pfn)
>  			break;
>  
> +		if (any_writable)
> +			*any_writable |= writable;
> +
>  		expected_pte = pte_next_pfn(expected_pte);
>  		ptep++;
>  	}
> @@ -1010,6 +1022,7 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  {
>  	struct page *page;
>  	struct folio *folio;
> +	bool any_writable;
>  	int err, nr;
>  
>  	page = vm_normal_page(src_vma, addr, pte);
> @@ -1024,7 +1037,8 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  	 * by keeping the batching logic separate.
>  	 */
>  	if (unlikely(!*prealloc && folio_test_large(folio) && max_nr != 1)) {
> -		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr);
> +		nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr,
> +				     &any_writable);
>  		if (folio_test_anon(folio)) {
>  			folio_ref_add(folio, nr);
>  			if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,
> @@ -1039,6 +1053,8 @@ copy_present_ptes(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma
>  			folio_dup_file_rmap_ptes(folio, page, nr);
>  			rss[mm_counter_file(page)] += nr;
>  		}
> +		if (any_writable)
> +			pte = pte_mkwrite(pte, src_vma);
>  		__copy_present_ptes(dst_vma, src_vma, dst_pte, src_pte, pte,
>  				    addr, nr);
>  		return nr;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

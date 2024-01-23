Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64338C47DDB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rszab+qoRvZAsQPdgmjHv3SeipiC75YGN5RH40Od/6g=; b=11xb0aoDYWW8iE
	4YbOX+jVy3S7IlwoXDzT2JGZlNaTH8H6KWnStszfpa8WxIUVzxLaKdPv9KpeT1WzdT9yA+SK31Zus
	KOm9oL/ocylgp7rwuvrYPQdSJqam/zOfa7mDUqdb0XLkm135+5o6+fJxXTRrpnPQRN0H2C20URXdH
	uhMDCGgOIOLmYWFAHWXymTvMrMC8kvrARN3aQLMqjoc0ic2NkhuGLbtycpae6kv6k6ot/0rOtCp8S
	sLGh1yOcj++b3zmKnvM+hPuHIOjd0H/VFeReQqtGK9gILT3yQz4+L/hkBfg+A1EEkCJQvaqr5Mfhh
	cNPDIR7yqJ7KOUzoYF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSFqB-00GOxc-1m;
	Tue, 23 Jan 2024 12:25:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSFq6-00GOvx-29;
	Tue, 23 Jan 2024 12:25:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69D231FB;
	Tue, 23 Jan 2024 04:25:56 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6A213F762;
	Tue, 23 Jan 2024 04:25:05 -0800 (PST)
Message-ID: <59592b50-fe89-4b32-8490-2e6c296f972f@arm.com>
Date: Tue, 23 Jan 2024 12:25:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/11] mm/memory: ignore dirty/accessed/soft-dirty bits
 in folio_pte_batch()
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
 <20240122194200.381241-11-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240122194200.381241-11-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_042514_821777_FB73C21F 
X-CRM114-Status: GOOD (  18.74  )
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

On 22/01/2024 19:41, David Hildenbrand wrote:
> Let's ignore these bits: they are irrelevant for fork, and will likely
> be irrelevant for upcoming users such as page unmapping.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memory.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index f563aec85b2a8..341b2be845b6e 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -953,24 +953,30 @@ static __always_inline void __copy_present_ptes(struct vm_area_struct *dst_vma,
>  	set_ptes(dst_vma->vm_mm, addr, dst_pte, pte, nr);
>  }
>  
> +static inline pte_t __pte_batch_clear_ignored(pte_t pte)
> +{
> +	return pte_clear_soft_dirty(pte_mkclean(pte_mkold(pte)));
> +}
> +
>  /*
>   * Detect a PTE batch: consecutive (present) PTEs that map consecutive
>   * pages of the same folio.
>   *
>   * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN.

nit: last char should be a comma (,) not a full stop (.)

> + * the accessed bit, dirty bit and soft-dirty bit.
>   */
>  static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
>  		pte_t *start_ptep, pte_t pte, int max_nr)
>  {
>  	unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
>  	const pte_t *end_ptep = start_ptep + max_nr;
> -	pte_t expected_pte = pte_next_pfn(pte);
> +	pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte));
>  	pte_t *ptep = start_ptep + 1;
>  
>  	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>  
>  	while (ptep != end_ptep) {
> -		pte = ptep_get(ptep);
> +		pte = __pte_batch_clear_ignored(ptep_get(ptep));
>  
>  		if (!pte_same(pte, expected_pte))
>  			break;

I think you'll lose dirty information in the child for private mappings? If the
first pte in a batch is clean, but a subsequent page is dirty, you will end up
setting all the pages in the batch as clean in the child. Previous behavior
would preserve dirty bit for private mappings.

In my version (v3) that did arbitrary batching, I had some fun and games
tracking dirty, write and uffd_wp:
https://lore.kernel.org/linux-arm-kernel/20231204105440.61448-2-ryan.roberts@arm.com/

Also, I think you will currently either set soft dirty on all or none of the
pages in the batch, depending on the value of the first. I previously convinced
myself that the state was unimportant so always cleared it in the child to
provide consistency.




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

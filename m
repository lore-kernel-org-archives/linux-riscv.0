Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9912BCD4841
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnEN5Mm9k07axbWK43hpaL0R+oqDx9Omt7O5TAqG9XM=; b=pzfe7J9QCmsFRB
	5lKUo45NbNdRlS2kFhiEKRUh9Zxr87omlITyW6vb+NkygvbkyNH9Yi9yYJct8JGFSp4mAh9CDPvH0
	8mrDP0T2x9rH6daTxHC9pXfC+IDusGDAu5jE4Xc3gAZnxkf9nyYwi8QgY2ZHUnvHx34WZbSdGyW5f
	VZ1XajJzmTuZq8RFSg5kncZ/oDPPipoJpR9fru/UoFxpv+6Pp0i4bVer5aEkqLDKuyO+/GwYS0p2a
	9Cbsq5QAYCkzHhjJ3PnUFv6Dz/fEq96M2sHgmTTdy4HKczQqOhNnNrqlawnftqS6Gstz8pFQl0aam
	IfKsYMrAT1pghKr/NZxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjinR-009O2J-32;
	Fri, 22 Sep 2023 16:14:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjinL-009O0M-0L;
	Fri, 22 Sep 2023 16:14:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D5ACBCE2342;
	Fri, 22 Sep 2023 16:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A71C433C7;
	Fri, 22 Sep 2023 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695399254;
	bh=ghtojmtAqFRtX4PcgZLlC2VPw2Ttv8ZnkZD0uHf6G3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2KQI46MuFtdt7QHNa6AqgiJz/M5ENzMW7kPwq5MHDWzFycJ2+pY4u3MqsA9xu0nC
	 W/HNBy22Xw7JneqjviL2IaJu3dGzWLn16NZ5LDkp581LGZMdDZg4052edSPlLkbLHO
	 EwdDs5kw6QxWcMB8DPa5TapO2QHn2N4oQOpAikE02mi4L04UnKYumRRdcwACdUxhgT
	 xMQKjaY0zqYX4QHMGOi217/faMzXeE4+N/6foqQ34cnGlWvVCbUdZdJPU2NbwsyjUC
	 p3AMpsc8yh3FbtfuQO9iVhIkFE9bRCE4VRqafiuyTvaj8qLItH92nbbD52ZVQBMP1Q
	 LphK+HBo/3yDg==
Date: Fri, 22 Sep 2023 17:14:04 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>, SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Peter Xu <peterx@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: hugetlb: Fix set_huge_pte_at() to work
 with all swap entries
Message-ID: <20230922161404.GA23332@willie-the-truck>
References: <20230922115804.2043771-1-ryan.roberts@arm.com>
 <20230922115804.2043771-3-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922115804.2043771-3-ryan.roberts@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_091419_534649_EF103794 
X-CRM114-Status: GOOD (  38.91  )
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

On Fri, Sep 22, 2023 at 12:58:04PM +0100, Ryan Roberts wrote:
> When called with a swap entry that does not embed a PFN (e.g.
> PTE_MARKER_POISONED or PTE_MARKER_UFFD_WP), the previous implementation
> of set_huge_pte_at() would either cause a BUG() to fire (if
> CONFIG_DEBUG_VM is enabled) or cause a dereference of an invalid address
> and subsequent panic.
> 
> arm64's huge pte implementation supports multiple huge page sizes, some
> of which are implemented in the page table with multiple contiguous
> entries. So set_huge_pte_at() needs to work out how big the logical pte
> is, so that it can also work out how many physical ptes (or pmds) need
> to be written. It previously did this by grabbing the folio out of the
> pte and querying its size.
> 
> However, there are cases when the pte being set is actually a swap
> entry. But this also used to work fine, because for huge ptes, we only
> ever saw migration entries and hwpoison entries. And both of these types
> of swap entries have a PFN embedded, so the code would grab that and
> everything still worked out.
> 
> But over time, more calls to set_huge_pte_at() have been added that set
> swap entry types that do not embed a PFN. And this causes the code to go
> bang. The triggering case is for the uffd poison test, commit
> 99aa77215ad0 ("selftests/mm: add uffd unit test for UFFDIO_POISON"),
> which causes a PTE_MARKER_POISONED swap entry to be set, coutesey of
> commit 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for
> hugetlbfs") - added in v6.5-rc7. Although review shows that there are
> other call sites that set PTE_MARKER_UFFD_WP (which also has no PFN),
> these don't trigger on arm64 because arm64 doesn't support UFFD WP.
> 
> Arguably, the root cause is really due to commit 18f3962953e4 ("mm:
> hugetlb: kill set_huge_swap_pte_at()"), which aimed to simplify the
> interface to the core code by removing set_huge_swap_pte_at() (which
> took a page size parameter) and replacing it with calls to
> set_huge_pte_at() where the size was inferred from the folio, as
> descibed above. While that commit didn't break anything at the time, it
> did break the interface because it couldn't handle swap entries without
> PFNs. And since then new callers have come along which rely on this
> working. But given the brokeness is only observable after commit
> 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs"),
> that one gets the Fixes tag.
> 
> Now that we have modified the set_huge_pte_at() interface to pass the
> huge page size in the previous patch, we can trivially fix this issue.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Fixes: 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs")
> Cc: <stable@vger.kernel.org> # 6.5+
> ---
>  arch/arm64/mm/hugetlbpage.c | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index a7f8c8db3425..13fd592228b1 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -241,13 +241,6 @@ static void clear_flush(struct mm_struct *mm,
>  	flush_tlb_range(&vma, saddr, addr);
>  }
>  
> -static inline struct folio *hugetlb_swap_entry_to_folio(swp_entry_t entry)
> -{
> -	VM_BUG_ON(!is_migration_entry(entry) && !is_hwpoison_entry(entry));
> -
> -	return page_folio(pfn_to_page(swp_offset_pfn(entry)));
> -}
> -
>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>  			    pte_t *ptep, pte_t pte, unsigned long sz)
>  {
> @@ -257,13 +250,10 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>  	unsigned long pfn, dpfn;
>  	pgprot_t hugeprot;
>  
> -	if (!pte_present(pte)) {
> -		struct folio *folio;
> -
> -		folio = hugetlb_swap_entry_to_folio(pte_to_swp_entry(pte));
> -		ncontig = num_contig_ptes(folio_size(folio), &pgsize);
> +	ncontig = num_contig_ptes(sz, &pgsize);
>  
> -		for (i = 0; i < ncontig; i++, ptep++)
> +	if (!pte_present(pte)) {
> +		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
>  			set_pte_at(mm, addr, ptep, pte);

Our set_pte_at() doesn't use 'addr' for anything and the old code didn't
even bother to increment it here! I'm fine adding that, but it feels
unrelated to the issue which this patch is actually fixing.

Either way:

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

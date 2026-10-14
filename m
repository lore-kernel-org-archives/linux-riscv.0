Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D8ACC6B1D
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 02:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkAoQUTsjlRdGeT7PvRRzuQTvOPPn476TUzjheKhexw=; b=W8HyZEHWwIU7pw
	Op8sHnX50tJadT5MBbp/5hLvGVdV/mhCg2rNqqqFkcvXXfBIbIRDKcq7TIOqI+tFkqo2jJzWkIvUT
	dgmsgy7yH3OaPd9b40ccmwaNy/TvJPuFSb30vvq6tE0UwnxWRapBe5IiyhSe9ujXChAPHpQ076zTg
	IgJkIEdu5adPswquxjqCoh2albvYVic8Vrgj6NAEdTcHbqbF7fsokjtkspBULopGLJ6iqUG5Ttaxr
	Yo3m1f86hJ5UJigWfKPuOdk2Qiq4wmxcXflcvWJO+sXB5zjnqR2jEkPq05aiLVfQLMqZQ96FM6HsU
	Kr8S0fZveP2cev9skjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGos9-0000000EN6D-0Xhi;
	Wed, 14 Oct 2026 02:37:41 +0000
Received: from out-137.mta0.migadu.com ([2001:41d0:1004:224b::89] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGos1-0000000EN4c-0s3t
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 02:37:38 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7UUTt82RGwkEsPz4m1IMAXE3gzzct3/wWyS9tYPd83k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791945448; v=1; x=1792550248;
 b=SuKgG0h1oLdHqaaJ9RHrwR/s04x1jK5Mwqs5ZzfmH0XRLckS0tHu2iba+7mwMZGIMKTwlbiO
 huUqRETO+zV2D+xoIvimg0dmf4nPISBkwfV51fkak4Bxb2YH7ZLI6YFPMxEPo+2+jE1iQOwEt0x
 1gqWhvXrcPj0282aAU5le8mQ=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 48e5c038101e18a7;
	Wed, 14 Oct 2026 02:37:27 +0000
X-Mizu-Trace-ID: 48e5c038101e18a7
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <2552e0bd-0e50-4dd5-a3d9-00e9204eb2c2@arm.com>
Date: Wed, 14 Oct 2026 10:37:04 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Dave Hansen <dave.hansen@intel.com>,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org,
 linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-Id: <6DB87EB4-93BB-4861-AC17-159DCD1E442B@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
 <2552e0bd-0e50-4dd5-a3d9-00e9204eb2c2@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_193734_154588_BF641604 
X-CRM114-Status: GOOD (  29.82  )
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



> On Oct 13, 2026, at 23:46, Kevin Brodsky <kevin.brodsky@arm.com> wrote:
> 
> On 10/10/2026 13:24, Muchun Song wrote:
>> Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
>> pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
>> tables.
>> 
>> HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
>> splitting a PMD. Restoring the vmemmap backing pages does not collapse
>> the PTE table, so a later memory hot-remove eventually frees it through
>> pagetable_free() on x86-64. That releases the page without running the
>> matching destructor and leaves NR_PAGETABLE elevated.
>> 
>> Make pagetable_free() detect constructor-backed pages and run the
>> destructor before releasing their memory to fix the problem.
>> 
>> Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
>> Cc: stable@vger.kernel.org
>> Assisted-by: LLM
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>> v2:
>> - Move destructor handling from x86 into pagetable_free() (suggested by
>>  David Hildenbrand)
>> - Trim and update the commit message (requested by Dave Hansen)
>> ---
>> include/linux/mm.h | 37 ++++++++++++++++++++-----------------
>> 1 file changed, 20 insertions(+), 17 deletions(-)
>> 
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 5cca90fc1df6..771a7d60b0a5 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -3969,23 +3969,6 @@ static inline void pagetable_free_kernel(struct ptdesc *pt)
>> __pagetable_free(pt);
>> }
>> #endif
>> -/**
>> - * pagetable_free - Free pagetables
>> - * @pt: The page table descriptor
>> - *
>> - * pagetable_free frees the memory of all page tables described by a page
>> - * table descriptor and the memory for the descriptor itself.
>> - */
>> -static inline void pagetable_free(struct ptdesc *pt)
>> -{
>> - 	if (ptdesc_test_kernel(pt)) {
>> - 		ptdesc_clear_kernel(pt);
>> - 		pagetable_free_kernel(pt);
>> - 	} else {
>> - 		__pagetable_free(pt);
>> - 	}
>> -}
>> -
>> #if defined(CONFIG_SPLIT_PTE_PTLOCKS)
>> #if ALLOC_SPLIT_PTLOCKS
>> void __init ptlock_cache_init(void);
>> @@ -4078,6 +4061,26 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
>> 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>> }
>> 
>> +/**
>> + * pagetable_free - Free pagetables
>> + * @pt: The page table descriptor
>> + *
>> + * pagetable_free frees the memory of all page tables described by a page
>> + * table descriptor and the memory for the descriptor itself.
>> + */
>> +static inline void pagetable_free(struct ptdesc *pt)
>> +{
>> + 	if (PageTable(ptdesc_page(pt)))
>> + 		pagetable_dtor(pt);
> 
> Took me a while to understand why this is fine. Currently we have:
> 
>     ptdesc = pagetable_alloc();
>     pagetable_*_ctor(mm, ptdesc);
>     [...]
>     pagetable_dtor(ptdesc);
>     pagetable_free(ptdesc);
> 
> All good, nice and balanced.
> 
> Now we're saying that pagetable_free() should call the dtor. But of
> course, in most cases, the dtor has already been called. Yes, this is
> fine because in that case PageTable(page) returns false. Still, the
> casual reader is likely to be confused (like I was).
> 
> The commit message should really explain this. I'm not a big fan of the

Maybe I should mention that pagetable_free() is supposed to free page
table page from now on.

> asymmetry we're creating between explicit alloc+ctor and free implicitly
> calling dtor, but I suppose it's safer this way. (And looking at the
> rest of the series, it does bring some nice cleanups.)

Make sense. That's my plan.

> 
> I understand this is a bugfix series so its scope is limited, but if
> time allows please post a follow-up series removing all those explicit
> dtor calls that are no longer required.
> 
> Now don't get me wrong, I am absolutely in favour of moving as much
> handling as possible out of the ctor/dtor and into
> pagetable_{alloc,free}; a series I posted earlier [1] was a step in that

Excellent work.

> direction. It unfortunately had many issues, including the unmatched
> alloc/free calls [2]. The work you're doing in this series, and your
> plan to use pagetable_alloc() for vmemmap, are exactly what I was
> planning to do next, so thank you for taking care of that :)
> With the commit message improved:
> 
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

Thanks.

> 
> - Kevin
> 
> [1]
> https://lore.kernel.org/linux-mm/20260714-remove_pgtable_cdtor-v1-0-44be8a7685d7@arm.com/
> [2]
> https://lore.kernel.org/linux-mm/6d167aaa-e9b0-4687-970c-1c67d0df6344@arm.com/
> 
>> +
>> + if (ptdesc_test_kernel(pt)) {
>> + 	ptdesc_clear_kernel(pt);
>> + 	pagetable_free_kernel(pt);
>> + } else {
>> + 	__pagetable_free(pt);
>> + }
>> +}
>> +
>> static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
>> {
>> 	pagetable_dtor(ptdesc);



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

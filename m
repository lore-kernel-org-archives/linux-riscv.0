Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC3FC54E71
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 20:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUnyesimNqCCdPrt3a/qgrmjZ9fQVmst9mdoqJZth1U=; b=GXMAAQHwwzfmL+
	cTwiCmwjEY2gx9WJ57Dogh01VBaisGzm1rxzHGE2qgETCxPfIBtxFaTD4EQfqt8prG9NP1otJva+X
	iX+mUFxHwRAmLPPT9SGpHCWPvr7TdZhXCDBM4lbHckc6YBSmjkOw7AXCp0U5OgSJ3aRhAhS/G1l3r
	7hhyBXowQZ51WIxSjbhQ1hz2M7qz5evcTegrFawKirdNFX+POdl5Trw4T5R7GOyOVVrAGu2UU2Dge
	cCKkWt1hSOydjwuc1M51P/hcM7sKm5KTGQZkYc7mAZc1RBixsv5gq7iu2diTD703wYRFUolskgUNk
	DmCPn7eVVzrMdgfKAT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnloS-00000008dpw-0Ldt;
	Fri, 22 Mar 2024 20:48:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnloO-00000008dox-2HG6;
	Fri, 22 Mar 2024 20:48:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5D07ECE182D;
	Fri, 22 Mar 2024 20:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52B0C433C7;
	Fri, 22 Mar 2024 20:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1711140499;
	bh=Uf9dSpYITp6bxdnwZZqCFp6GDVfEBgn7BjvTh1fsU0E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QVRAKzAUPqWp2P8fFfJjymQCiqf8/IWwd1wmqWmnRlxsqAjKHpKVO/2FMY54BdYVe
	 MtuhTuaPMg1SbalsaWAguHK6KathmRCmewglEhgp1kUsqyLrxGR7rhkCkBiCs/cIST
	 Foh0xWAZf8YKEf1Z8kAQrZNZWmXaYiyM/6VzFqZo=
Date: Fri, 22 Mar 2024 13:48:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: peterx@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Matthew Wilcox
 <willy@infradead.org>, Rik van Riel <riel@surriel.com>, Lorenzo Stoakes
 <lstoakes@gmail.com>, Axel Rasmussen <axelrasmussen@google.com>, Yang Shi
 <shy828301@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, "Kirill A . Shutemov"
 <kirill@shutemov.name>, Andrew Jones <andrew.jones@linux.dev>, Vlastimil
 Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Muchun Song
 <muchun.song@linux.dev>, Christoph Hellwig <hch@infradead.org>,
 linux-riscv@lists.infradead.org, James Houghton <jthoughton@google.com>,
 David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v3 12/12] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-Id: <20240322134818.9b312f77629f79fcf1564b6f@linux-foundation.org>
In-Reply-To: <20240321220802.679544-13-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
	<20240321220802.679544-13-peterx@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_134824_977723_CDBDB8F6 
X-CRM114-Status: GOOD (  19.47  )
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

On Thu, 21 Mar 2024 18:08:02 -0400 peterx@redhat.com wrote:

> From: Peter Xu <peterx@redhat.com>
> 
> Now follow_page() is ready to handle hugetlb pages in whatever form, and
> over all architectures.  Switch to the generic code path.
> 
> Time to retire hugetlb_follow_page_mask(), following the previous
> retirement of follow_hugetlb_page() in 4849807114b8.
> 
> There may be a slight difference of how the loops run when processing slow
> GUP over a large hugetlb range on cont_pte/cont_pmd supported archs: each
> loop of __get_user_pages() will resolve one pgtable entry with the patch
> applied, rather than relying on the size of hugetlb hstate, the latter may
> cover multiple entries in one loop.
> 
> A quick performance test on an aarch64 VM on M1 chip shows 15% degrade over
> a tight loop of slow gup after the path switched.  That shouldn't be a
> problem because slow-gup should not be a hot path for GUP in general: when
> page is commonly present, fast-gup will already succeed, while when the
> page is indeed missing and require a follow up page fault, the slow gup
> degrade will probably buried in the fault paths anyway.  It also explains
> why slow gup for THP used to be very slow before 57edfcfd3419 ("mm/gup:
> accelerate thp gup even for "pages != NULL"") lands, the latter not part of
> a performance analysis but a side benefit.  If the performance will be a
> concern, we can consider handle CONT_PTE in follow_page().
> 
> Before that is justified to be necessary, keep everything clean and simple.
> 

mm/gup.c:33:21: warning: 'follow_hugepd' declared 'static' but never defined [-Wunused-function]
   33 | static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
      |                     ^~~~~~~~~~~~~

--- a/mm/gup.c~mm-gup-handle-hugepd-for-follow_page-fix
+++ a/mm/gup.c
@@ -30,10 +30,12 @@ struct follow_page_context {
 	unsigned int page_mask;
 };
 
+#ifdef CONFIG_HAVE_FAST_GUP
 static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
 				  unsigned long addr, unsigned int pdshift,
 				  unsigned int flags,
 				  struct follow_page_context *ctx);
+#endif
 
 static inline void sanity_check_pinned_pages(struct page **pages,
 					     unsigned long npages)
_


This looks inelegant.

That's two build issues so far.  Please be more expansive in the
Kconfig variations when testing.  Especially when mucking with pgtable
macros.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

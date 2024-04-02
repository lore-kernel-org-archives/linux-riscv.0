Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F033CC6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++BNUHttbIwpyka+zhyIaz2+3MK0jMFGvJSM3jfjXmA=; b=BZ25rai9XoAwut
	Jt8GMOPH60G9in2B9cw1CTj7sbxtD60NH0oGMJpmj53QuUaHwFKel4+Sigfbp6z7jsaAALf8ad4rq
	2qed1zMYMqL+9HkWCAhqqsnV5bapM6W1MGEg8T756U/UTFfSdebaRaPe3s+0NiaDs6xs8jyuFQURi
	mOHok2qs22ZCfIEdG8C/5U4cK9UYscCUA6DnwmqSEStxb2FERMox36tKddQR57R4bItqVBnAaYv1x
	06OUh7e8U0QTFMVPp/bw+AZpfrazi2TVRWDSKi5Dd3J/MPFx4s/qEp3bm+8GDq1EUZMU5t5vjUojW
	HcEpi8urHGH2A4UmhhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgYW-0000000BvuN-3VRf;
	Tue, 02 Apr 2024 16:00:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgYU-0000000BvsL-3XYE;
	Tue, 02 Apr 2024 16:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J1C2/bPg/F9WrdiBHSYL5RX039VeHvKnxuGgTbDm1H0=; b=R2IN4t4he6Ikh2eCoolYn2D1ln
	bR/xnpgwp5nTMZdagY0yP7uhv+3h48ujjYE5yB9UplVKqXGoqHhQDFx6Jkksdob89JG3X92Toiy2n
	tpdQXC31wQj8/IoO4Y+ZlLIelTem8wG91gEnWIZCkA/fbYyUxmEHFosVKc03Os3c8PAmqwJMB0gB9
	hyAJUfPQ7tDBLByuN78X7TsKnwe4D8xS+YIdylZ9PDwDcfTzdsT+W4Zn0ntQp+aMaESEJLalvpLlI
	gcDIt6Sh0qyQ2cSKN8hyf81O7nNdTQGTV5wXPOX30EbVaeNoRNVmi6sGvQxqceiq9vEjpBDFFKqBe
	GnoA5Zzw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgYO-00000003OYG-2Yps;
	Tue, 02 Apr 2024 16:00:04 +0000
Date: Tue, 2 Apr 2024 17:00:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, peterx@redhat.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Yang Shi <shy828301@gmail.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Jones <andrew.jones@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Rik van Riel <riel@surriel.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	James Houghton <jthoughton@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH v4 13/13] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-ID: <ZgwrhKuypBtSpKdI@casper.infradead.org>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-14-peterx@redhat.com>
 <adfdd89b-ee56-4758-836e-c66a0be7de25@arm.com>
 <5d9dd9a7-e544-4741-944c-469b79c2c649@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d9dd9a7-e544-4741-944c-469b79c2c649@redhat.com>
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

On Tue, Apr 02, 2024 at 05:26:28PM +0200, David Hildenbrand wrote:
> > The oops trigger is at mm/gup.c:778:
> > VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
> > 
> > So 2M passed ok, and its failing for 32M, which is cont-pmd. I'm guessing you're trying to iterate 2M into a cont-pmd folio and ending up with an unexpected tail page?
> 
> I assume we find the expected tail page, it's just that the check
> 
> VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
> 
> Doesn't make sense with hugetlb folios. We might have a tail page mapped in
> a cont-pmd entry. As soon as we call follow_huge_pmd() on "not the first
> cont-pmd entry", we trigger this check.
> 
> Likely this sanity check must also allow for hugetlb folios. Or we should
> just remove it completely.
> 
> In the past, we wanted to make sure that we never get tail pages of THP from
> PMD entries, because something would currently be broken (we don't support
> THP > PMD).

That was a practical limitation on my part.  We have various parts of
the MM which assume that pmd_page() returns a head page and until we
get all of those fixed, adding support for folios larger than PMD_SIZE
was only going to cause trouble for no significant wins.

I agree with you we should get rid of this assertion entirely.  We should
fix all the places which assume that pmd_page() returns a head page,
but that may take some time.

As an example, filemap_map_pmd() has:

       if (pmd_none(*vmf->pmd) && folio_test_pmd_mappable(folio)) {
                struct page *page = folio_file_page(folio, start);
                vm_fault_t ret = do_set_pmd(vmf, page);

and then do_set_pmd() has:

        if (page != &folio->page || folio_order(folio) != HPAGE_PMD_ORDER)
                return ret;

so we'd simply refuse to use a PMD to map a folio larger than PMD_SIZE.
There's a lot of work to be done to make this work generally (not to
mention figuring out how to handle mapcount for such folios ;-).

This particular case seems straightforward though.  Just remove the
assertion.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

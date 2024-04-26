Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0522C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 16:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRKr5ywc5MnmJhSSgDl+d7G0A+MIlIFo/dmKiF+r8jw=; b=XPKnw68Cjb1LTR
	RUvxv2X6wxkLBdt9XLST8PAisuBpYsuZM1I1bPU0J1Kvq/70qOlOMzVwzkUgCankxlPuM0kAJ7Msw
	LkiTubRXQaMsr/UGY/zyLr+QPSldnpWKhZHiQfSuglU/7XDxUzUH1T1+MdEjyLBJmwu6zgfsQLQGJ
	3bfUdWok1avfCwePY4aCD8F46kIbULl+Zgsd0q+I14uji1K/uXNFz3dgP9hfe5DlUj9m1ioKpeiMO
	xJNaSTdCUeC7l/HTppnzgGqiJY7feL4zA+cVPJdvqvXhRgyuwRChr4G9mCBRoA6kQcJgs2dmNc2Av
	jq8rvW10s3X5N4o1VvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0OBu-0000000DCgN-1nZG;
	Fri, 26 Apr 2024 16:12:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0OBp-0000000DCe7-1FzB
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 16:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714147963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eYUqEa4yY2qzSFoFdIvLcLWvg/98iZ7Cq/Vjg2cb5Pg=;
	b=LypP9JvOUwTJ+H67rwONo9wwRCDu7c4QosQU9i/xSC7EmmvETQP+nnNJgYw4vxqKKqI2rT
	p6+9SIKxj7B8VcSqnaf+5p3cIiRNM+TEH2OxbP52yBiEALFUWqq9N6PaG46XJ+JZ/4ZpKC
	y8QXaCCaiIVIz4CAWLMaud9ezd13PoQ=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-sFe7WWm0Pv2EEEmaWwxSkA-1; Fri, 26 Apr 2024 12:12:42 -0400
X-MC-Unique: sFe7WWm0Pv2EEEmaWwxSkA-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6eba7dc8f1dso621416a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 09:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714147962; x=1714752762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYUqEa4yY2qzSFoFdIvLcLWvg/98iZ7Cq/Vjg2cb5Pg=;
        b=IilnwLuWU1QXJiynvtKLpLRFJ2+7xADcGYOWAr/pO+Nu4H9Y0UYJ/nKx6hxbYZBddW
         dqWFzgEi8RXg8HhvAasUlMKGJgB/5bIEIqXk6S5YZi18qgdHt20fb7BudDmUQIgJbgg0
         4EI3Hr+pdwzLyTxSJA1hUk3yUCJ67/09ndxA8mwj9cMzJs5h+C8URWiM67+wcTQ0+zVl
         eMQYb4yOQv9+CrdW59Yse9H6dKQCbM3GWRjd3GEHmtGVJCdJILLvjK28TdSTzzLtNSdP
         K1AncelQWuUspUiwUaxWdudFck+Z+E9gFcYYgqmmeZkV0SSRZ+vzMbeLTLDp7xhSFbqK
         /+5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNTeaQP51bOMHOpLpyV9dxssf3yvms5EdkcnRc3D6sWhuux11p/YZ7rjlESJM3Qm47pZIkvkqXzEtG0jIRZ9pT/VOoreAuzZqp6N058oAa
X-Gm-Message-State: AOJu0YwbmAL0kvhD9HAsDdRDClSabhTfnUDx2bneAcEzGxvKb2dGh3uM
	SAj4r02KL2GLp+JbbXsPDL+BYsoe31+LqKttpfA2m5/93yPVp1YuzEyzk224zLan0ZeoD7IFImk
	k/bQj1S+BuloE6QEbD4yeb1hiMEFzusBrWlIAIftownBc85SXHTplbDLj6QX0s1dw4w==
X-Received: by 2002:a05:6870:a40f:b0:235:3e97:ed24 with SMTP id m15-20020a056870a40f00b002353e97ed24mr3125231oal.1.1714147961418;
        Fri, 26 Apr 2024 09:12:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKK09FSsz1w18C9O+QSKywaneNtUpj/aPvoeb+SOH3u9egTJYXPSkxUgqSN3BOrRHAMYNm3w==
X-Received: by 2002:a05:6870:a40f:b0:235:3e97:ed24 with SMTP id m15-20020a056870a40f00b002353e97ed24mr3125169oal.1.1714147960484;
        Fri, 26 Apr 2024 09:12:40 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id m6-20020ac807c6000000b00434fd7d6d00sm8007149qth.2.2024.04.26.09.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 09:12:40 -0700 (PDT)
Date: Fri, 26 Apr 2024 12:12:32 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v1 1/3] mm/gup: consistently name GUP-fast functions
Message-ID: <ZivScN8-Uoi9eye8@x1n>
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-2-david@redhat.com>
 <e685c532-8330-4a57-bc08-c67845e0c352@redhat.com>
 <Ziuv2jLY1wgBITiP@x1n>
MIME-Version: 1.0
In-Reply-To: <Ziuv2jLY1wgBITiP@x1n>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_091245_507350_E6739124 
X-CRM114-Status: GOOD (  43.95  )
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

On Fri, Apr 26, 2024 at 09:44:58AM -0400, Peter Xu wrote:
> On Fri, Apr 26, 2024 at 09:17:47AM +0200, David Hildenbrand wrote:
> > On 02.04.24 14:55, David Hildenbrand wrote:
> > > Let's consistently call the "fast-only" part of GUP "GUP-fast" and rename
> > > all relevant internal functions to start with "gup_fast", to make it
> > > clearer that this is not ordinary GUP. The current mixture of
> > > "lockless", "gup" and "gup_fast" is confusing.
> > > 
> > > Further, avoid the term "huge" when talking about a "leaf" -- for
> > > example, we nowadays check pmd_leaf() because pmd_huge() is gone. For the
> > > "hugepd"/"hugepte" stuff, it's part of the name ("is_hugepd"), so that
> > > stays.
> > > 
> > > What remains is the "external" interface:
> > > * get_user_pages_fast_only()
> > > * get_user_pages_fast()
> > > * pin_user_pages_fast()
> > > 
> > > The high-level internal functions for GUP-fast (+slow fallback) are now:
> > > * internal_get_user_pages_fast() -> gup_fast_fallback()
> > > * lockless_pages_from_mm() -> gup_fast()
> > > 
> > > The basic GUP-fast walker functions:
> > > * gup_pgd_range() -> gup_fast_pgd_range()
> > > * gup_p4d_range() -> gup_fast_p4d_range()
> > > * gup_pud_range() -> gup_fast_pud_range()
> > > * gup_pmd_range() -> gup_fast_pmd_range()
> > > * gup_pte_range() -> gup_fast_pte_range()
> > > * gup_huge_pgd()  -> gup_fast_pgd_leaf()
> > > * gup_huge_pud()  -> gup_fast_pud_leaf()
> > > * gup_huge_pmd()  -> gup_fast_pmd_leaf()
> > > 
> > > The weird hugepd stuff:
> > > * gup_huge_pd() -> gup_fast_hugepd()
> > > * gup_hugepte() -> gup_fast_hugepte()
> > 
> > I just realized that we end up calling these from follow_hugepd() as well.
> > And something seems to be off, because gup_fast_hugepd() won't have the VMA
> > even in the slow-GUP case to pass it to gup_must_unshare().
> > 
> > So these are GUP-fast functions and the terminology seem correct. But the
> > usage from follow_hugepd() is questionable,
> > 
> > commit a12083d721d703f985f4403d6b333cc449f838f6
> > Author: Peter Xu <peterx@redhat.com>
> > Date:   Wed Mar 27 11:23:31 2024 -0400
> > 
> >     mm/gup: handle hugepd for follow_page()
> > 
> > 
> > states "With previous refactors on fast-gup gup_huge_pd(), most of the code
> > can be leveraged", which doesn't look quite true just staring the the
> > gup_must_unshare() call where we don't pass the VMA. Also,
> > "unlikely(pte_val(pte) != pte_val(ptep_get(ptep)" doesn't make any sense for
> > slow GUP ...
> 
> Yes it's not needed, just doesn't look worthwhile to put another helper on
> top just for this.  I mentioned this in the commit message here:
> 
>   There's something not needed for follow page, for example, gup_hugepte()
>   tries to detect pgtable entry change which will never happen with slow
>   gup (which has the pgtable lock held), but that's not a problem to check.
> 
> > 
> > @Peter, any insights?
> 
> However I think we should pass vma in for sure, I guess I overlooked that,
> and it didn't expose in my tests too as I probably missed ./cow.
> 
> I'll prepare a separate patch on top of this series and the gup-fast rename
> patches (I saw this one just reached mm-stable), and I'll see whether I can
> test it too if I can find a Power system fast enough.  I'll probably drop
> the "fast" in the hugepd function names too.

Hmm, so when I enable 2M hugetlb I found ./cow is even failing on x86.

  # ./cow  | grep -B1 "not ok"
  # [RUN] vmsplice() + unmap in child ... with hugetlb (2048 kB)
  not ok 161 No leak from parent into child
  --
  # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with hugetlb (2048 kB)
  not ok 215 No leak from parent into child
  --
  # [RUN] vmsplice() before fork(), unmap in parent after fork() ... with hugetlb (2048 kB)
  not ok 269 No leak from child into parent
  --
  # [RUN] vmsplice() + unmap in parent after fork() ... with hugetlb (2048 kB)
  not ok 323 No leak from child into parent

And it looks like it was always failing.. perhaps since the start?  We
didn't do the same on hugetlb v.s. normal anon from that regard on the
vmsplice() fix.

I drafted a patch to allow refcount>1 detection as the same, then all tests
pass for me, as below.

David, I'd like to double check with you before I post anything: is that
your intention to do so when working on the R/O pinning or not?

Thanks,

=========
From 7300c249738dadda1457c755b597c1551dfe8dc6 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Fri, 26 Apr 2024 11:41:12 -0400
Subject: [PATCH] mm/hugetlb: Fix vmsplice case on memory leak once more

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/hugetlb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 417fc5cdb6ee..1ca102013561 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5961,10 +5961,13 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 
 retry_avoidcopy:
 	/*
-	 * If no-one else is actually using this page, we're the exclusive
-	 * owner and can reuse this page.
+	 * If the page is marked exlusively owned (e.g. longterm pinned),
+	 * we can reuse it.  Otherwise if no-one else is using this page,
+	 * we can savely set the exclusive bit and reuse it.
 	 */
-	if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
+	if (folio_test_anon(old_folio) &&
+	    (PageAnonExclusive(&old_folio->page) ||
+	     folio_ref_count(old_folio) == 1)) {
 		if (!PageAnonExclusive(&old_folio->page)) {
 			folio_move_anon_rmap(old_folio, vma);
 			SetPageAnonExclusive(&old_folio->page);
-- 
2.44.0


-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

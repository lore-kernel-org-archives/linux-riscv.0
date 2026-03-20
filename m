Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A441099B41
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+xT5p/njzhQlIf0lmCatw0LHRbyLvyuz0Zc5PW6HL4=; b=hyf4ibh1C2RcLu
	4RxyywUkLnCwYpzuZeb2CWsaZogQ1u+ZZnMieAcYpbgFnN2DW1+YkgSisro4hNuA516dBfRNTTIgv
	sqyuCvTe02poynNzkdP+T16Q5TTCQXdKMSErXqP1isfXnunjkIKcjUhPmq7/iUu2ZTDmwc0ju98wn
	zdfJExAWqE+gI3i3sdkRj2qTbcxGMW/WYbV4Jkom0EIVF8mHx0Bk631C7bDwOPrvJwCvslYMHFWEL
	o3c8pVtv7Ja0k6oOZv7rO4u8CF3x3PDvbuKpjGWdRWl9OA+eqm3OJ2mdT75yMNkb0w7p+L2Wy7aLt
	+29pSGeIzHTCUvErlrSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6L-0000000DfKc-1zr1;
	Fri, 20 Mar 2026 22:13:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6H-0000000DfKC-2i08
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 22:13:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A55C960126;
	Fri, 20 Mar 2026 22:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74D4C4CEF7;
	Fri, 20 Mar 2026 22:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774044828;
	bh=nHbTHkZVPmgr07xrNZlc6QBoO7DF8u1xsHWbyTYeiTQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tQfW0O52ZtyktIiPAk6j94DCE/TASe1TGKNwSCHH/AqiVoKikGBfFF3W4UcBK/nfw
	 8V7Vb27Vcmrr0XvfznjhmwdnhGVPlZCBt7c1tUzBlzwi7wYWY0KR84ObQEtEz6uESv
	 dRzL5KUAy9mEFD4GI/QVpkY+cklyuLv1v1lmUNE7D7i6zqVl2H/QaLAOr83tthbwZl
	 jIT3N5KVDUM3OYBhJFn5GCC1nY/SIvLbps9ZcbkHdoN80Bzuh8s1eM7pV8Bva0XXDY
	 h8kXTpPAdxsUhuyQ3Sg8Xd7BkRgiNQ4pgqYN84AN08nzdlaoP9hShigTqDXP9QruqH
	 SbtczXznDUijA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 20 Mar 2026 23:13:33 +0100
Subject: [PATCH v2 01/15] mm/memory_hotplug: fix possible race in
 scan_movable_pages()
MIME-Version: 1.0
Message-Id: <20260320-sparsemem_cleanups-v2-1-096addc8800d@kernel.org>
References: <20260320-sparsemem_cleanups-v2-0-096addc8800d@kernel.org>
In-Reply-To: <20260320-sparsemem_cleanups-v2-0-096addc8800d@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Oscar Salvador <osalvador@suse.de>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Sidhartha Kumar <sidhartha.kumar@oracle.com>, linux-mm@kvack.org, 
 linux-cxl@vger.kernel.org, linux-riscv@lists.infradead.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.13.0
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

If a hugetlb folio gets freed while we are in scan_movable_pages(),
folio_nr_pages() could return 0, resulting in or'ing "0 - 1 = -1"
to the PFN, resulting in PFN = -1. We're not holding any locks or
references that would prevent that.

for_each_valid_pfn() would then search for the next valid PFN, and could
return a PFN that is outside of the range of the original requested
range. do_migrate_page() would then try to migrate quite a big range,
which is certainly undesirable.

To fix it, simply test for valid folio_nr_pages() values. While at it,
as PageHuge() really just does a page_folio() internally, we can just
use folio_test_hugetlb() on the folio directly.

scan_movable_pages() is expected to be fast, and we try to avoid taking
locks or grabbing references. We cannot use folio_try_get() as that does
not work for free hugetlb folios. We could grab the hugetlb_lock, but
that just adds complexity.

The race is unlikely to trigger in practice, so we won't be CCing
stable.

Fixes: 16540dae959d ("mm/hugetlb: mm/memory_hotplug: use a folio in scan_movable_pages()")
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/memory_hotplug.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 86d3faf50453..969cd7ddf68f 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1747,6 +1747,7 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 	unsigned long pfn;
 
 	for_each_valid_pfn(pfn, start, end) {
+		unsigned long nr_pages;
 		struct page *page;
 		struct folio *folio;
 
@@ -1763,9 +1764,9 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 		if (PageOffline(page) && page_count(page))
 			return -EBUSY;
 
-		if (!PageHuge(page))
-			continue;
 		folio = page_folio(page);
+		if (!folio_test_hugetlb(folio))
+			continue;
 		/*
 		 * This test is racy as we hold no reference or lock.  The
 		 * hugetlb page could have been free'ed and head is no longer
@@ -1775,7 +1776,11 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 		 */
 		if (folio_test_hugetlb_migratable(folio))
 			goto found;
-		pfn |= folio_nr_pages(folio) - 1;
+		nr_pages = folio_nr_pages(folio);
+		if (unlikely(nr_pages < 1 || nr_pages > MAX_FOLIO_NR_PAGES ||
+			     !is_power_of_2(nr_pages)))
+			continue;
+		pfn |= nr_pages - 1;
 	}
 	return -ENOENT;
 found:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

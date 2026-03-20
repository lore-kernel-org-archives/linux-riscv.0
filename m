Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FDF1099B3B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVQSAdru8h09jJPc589VAKBsr+tcq9iCHgif8l3SBV8=; b=PY7IBVTmKzzWP1
	nVZOvL0NiCKv54rr/g8fggGj5/fpUDfiVJjBfpUx9rBme48jOjU/pQHD4/7FIU1SsMD/tCHZ+1bNj
	tgfI+/xOdn63chDkzO2GHqzgYo1tCHsSoawMuKHUfuIntYu2sQnnX+zqTwtYDXd6Y7K0fhgNrl+I8
	uCdRWiugqb+h2WphX7EKOhCX6D7I+UW5W8lVhH/HD03f/3vVbyR9eHafgMMo3oQ86yAzqHqylT/OJ
	7hhfmcequXwXZVRTlydectdaGF61RxixtJtFBv1MnFl4OlDhgDL7aHypak9MBaN8USHC7bY4xIQix
	y7hyauOzDfGi74JzxhBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6a-0000000DfQ9-2rIT;
	Fri, 20 Mar 2026 22:14:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6Y-0000000DfOL-0rmU
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 22:14:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3410942A1D;
	Fri, 20 Mar 2026 22:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533C1C4CEF7;
	Fri, 20 Mar 2026 22:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774044845;
	bh=IA23Gy39M2F3BrgjRU1645p2gPCHoKr3S7Gd6stw5xY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ITuTXaTR5d3MLfnoE8tiWvMk3cJVFd3Gn4KFKc27ZUXry5hmpyQELFB1C+kYArpwP
	 E68SqIwWSExdhJKLtwAb8/MnDcxtEzcli+cyl8rEOVXy7QUJttlz4Cs/vtHelyYvP3
	 MhBm0AMFhp9AV1a/Rp0cp6DluC2ISIen3+X7xuRxf5M//eU6B65u8yZDbBBB/9fk5o
	 CzhinwrYTx4Pr2gD4mtFdMumrSj2a/MequJzUXzrkLsZ+sT/qMEvLquBZzaeByDTBP
	 SNOXBPB7LC6GIlWCEKYfJoDyoNHCpxCA98DY3irXB4tVAUChm6T+w8VsIuqcwuBd1l
	 0psq2Gp2a4cIg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 20 Mar 2026 23:13:37 +0100
Subject: [PATCH v2 05/15] mm/memory_hotplug: simplify check_pfn_span()
MIME-Version: 1.0
Message-Id: <20260320-sparsemem_cleanups-v2-5-096addc8800d@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_151406_274880_F7808DD2 
X-CRM114-Status: GOOD (  10.47  )
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

We now always have CONFIG_SPARSEMEM_VMEMMAP, so remove the dead code.

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/memory_hotplug.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 0c26b1f2be6e..ef2b03eb1873 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -320,21 +320,13 @@ static void release_memory_resource(struct resource *res)
 static int check_pfn_span(unsigned long pfn, unsigned long nr_pages)
 {
 	/*
-	 * Disallow all operations smaller than a sub-section and only
-	 * allow operations smaller than a section for
-	 * SPARSEMEM_VMEMMAP. Note that check_hotplug_memory_range()
-	 * enforces a larger memory_block_size_bytes() granularity for
-	 * memory that will be marked online, so this check should only
-	 * fire for direct arch_{add,remove}_memory() users outside of
-	 * add_memory_resource().
+	 * Disallow all operations smaller than a sub-section.
+	 * Note that check_hotplug_memory_range() enforces a larger
+	 * memory_block_size_bytes() granularity for memory that will be marked
+	 * online, so this check should only fire for direct
+	 * arch_{add,remove}_memory() users outside of add_memory_resource().
 	 */
-	unsigned long min_align;
-
-	if (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP))
-		min_align = PAGES_PER_SUBSECTION;
-	else
-		min_align = PAGES_PER_SECTION;
-	if (!IS_ALIGNED(pfn | nr_pages, min_align))
+	if (!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SUBSECTION))
 		return -EINVAL;
 	return 0;
 }

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

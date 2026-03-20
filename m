Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F461099B3B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2SIn8iwQtgVZEOroJnjCAjopICUeCW/pSMRHxdI88A=; b=L8PeyBDVV7kb9I
	vrYOjwWZkiPeAQ79hPPCBLYwgE5PXambV237iF86rFgHKKBUwlmcREfFwXZ2S0fOA95mxYg4ENP/2
	QJZgE44SltHRPtYCcpJ9NzkQZ3cBcaFhAWfL8YNuDqC5VYioiHX3r+lhazVZIsj5/VMlALML5E4Mw
	DJlblxIza0LCJCBHJxqibdY570D61o/mATo/99MWe8KSQq8hve76ck3tCQ0Ll1+FbEkRlIHS/12gC
	X/YXtUTljHoqxwLfReVXY/Kcu+1TnlK0T5Rl1VF+wI88Qncqhkc4/nGthQ21D6o77mKiFiYfWvSbV
	+GCfnCld5NTt5bFrpyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6h-0000000DfTt-1JmX;
	Fri, 20 Mar 2026 22:14:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6g-0000000DfT0-1QxS
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 22:14:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C10C660132;
	Fri, 20 Mar 2026 22:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD735C2BCB6;
	Fri, 20 Mar 2026 22:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774044853;
	bh=QZECcZOo9XU6VE0O+G1ptFNqIVCOuWAko6C1OasJr/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BYJKP7zlv4jBTvu80a24WL8Ct5aU4DcbuPl7DomVKZQywcFSHmDul15sUSZzpOS9w
	 VGpkVDDKudEKjzp330WynQpTZJarltWaw0dHJ3u7eeAic+bRO3z2vaoJXKeKE8CzXJ
	 Hlir4vVzCgO/f2OKDKqS8rRg5eQw0Vi39t7NMLD4x1kMCvNqs1ghvWraXEpRmdgbkJ
	 ouDmSeYe65LVeauMLiEz99LE6nUEBfU2ntRObRZhG73T8ceIv43bw4PDm71NWkHgYS
	 M2POdUrqX1hIGxGX4jWTxYwJH7i/lYl4bma2SJk/M0epQ5B85WZGwtmdA9RUsRNrzD
	 BZVwwK53Fv3qA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 20 Mar 2026 23:13:39 +0100
Subject: [PATCH v2 07/15] mm/bootmem_info: remove handling for
 !CONFIG_SPARSEMEM_VMEMMAP
MIME-Version: 1.0
Message-Id: <20260320-sparsemem_cleanups-v2-7-096addc8800d@kernel.org>
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

It is not immediately obvious that CONFIG_HAVE_BOOTMEM_INFO_NODE is
only selected from CONFIG_MEMORY_HOTREMOVE, which itself depends on
CONFIG_MEMORY_HOTPLUG that ... depends on CONFIG_SPARSEMEM_VMEMMAP.

Let's remove the !CONFIG_SPARSEMEM_VMEMMAP leftovers that are dead code.

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/bootmem_info.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/mm/bootmem_info.c b/mm/bootmem_info.c
index b0e2a9fa641f..e61e08e24924 100644
--- a/mm/bootmem_info.c
+++ b/mm/bootmem_info.c
@@ -40,42 +40,6 @@ void put_page_bootmem(struct page *page)
 	}
 }
 
-#ifndef CONFIG_SPARSEMEM_VMEMMAP
-static void __init register_page_bootmem_info_section(unsigned long start_pfn)
-{
-	unsigned long mapsize, section_nr, i;
-	struct mem_section *ms;
-	struct page *page, *memmap;
-	struct mem_section_usage *usage;
-
-	section_nr = pfn_to_section_nr(start_pfn);
-	ms = __nr_to_section(section_nr);
-
-	/* Get section's memmap address */
-	memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
-
-	/*
-	 * Get page for the memmap's phys address
-	 * XXX: need more consideration for sparse_vmemmap...
-	 */
-	page = virt_to_page(memmap);
-	mapsize = sizeof(struct page) * PAGES_PER_SECTION;
-	mapsize = PAGE_ALIGN(mapsize) >> PAGE_SHIFT;
-
-	/* remember memmap's page */
-	for (i = 0; i < mapsize; i++, page++)
-		get_page_bootmem(section_nr, page, SECTION_INFO);
-
-	usage = ms->usage;
-	page = virt_to_page(usage);
-
-	mapsize = PAGE_ALIGN(mem_section_usage_size()) >> PAGE_SHIFT;
-
-	for (i = 0; i < mapsize; i++, page++)
-		get_page_bootmem(section_nr, page, MIX_SECTION_INFO);
-
-}
-#else /* CONFIG_SPARSEMEM_VMEMMAP */
 static void __init register_page_bootmem_info_section(unsigned long start_pfn)
 {
 	unsigned long mapsize, section_nr, i;
@@ -100,7 +64,6 @@ static void __init register_page_bootmem_info_section(unsigned long start_pfn)
 	for (i = 0; i < mapsize; i++, page++)
 		get_page_bootmem(section_nr, page, MIX_SECTION_INFO);
 }
-#endif /* !CONFIG_SPARSEMEM_VMEMMAP */
 
 void __init register_page_bootmem_info_node(struct pglist_data *pgdat)
 {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

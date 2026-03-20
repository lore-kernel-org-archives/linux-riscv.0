Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6F21099B3B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MVo4juxzeWuVksI6klPV3IAY30u30mWtuEs7I93cbQ=; b=pRcicgPnbRkW2o
	W5WT4b7bTNRmi9CrU/rxLRmgm1TldGOqXFth1IT64pBS/V7jETNrkg1eFQVpoZuJeagifYIGNj75l
	QF0JQCkIqj/zwuXO1yeWAcsa+JiYe/4d37m2cSe1mFFxiejiSr0Hgb14e06aEia3qNtVOqUeYBWQ1
	cep8t+YtXgPKXxZEia6plUoxsbYk6f3sti3j5R6CQ7VzkIKQrKap9yTb3jHlfEEV4uu3wpQDDzSCh
	/rVa3wq5oZ13fsoo4Jwfos6MJXE+NrXxSyGB51ntcAl5Rfg73PQCtKgsqdL2jHocklF1bja0vPHHk
	eYBjUeKfQWjjeoBXVH0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6M-0000000DfLS-3LfZ;
	Fri, 20 Mar 2026 22:13:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6L-0000000DfKa-0woC
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 22:13:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A993E60126;
	Fri, 20 Mar 2026 22:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECA5C2BC87;
	Fri, 20 Mar 2026 22:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774044832;
	bh=XBR2EPoKpXeNjq1txkLBTh/DgkCJHtoC1PlnginQxtA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tInuY984yzdIEuaZJXpPPAPu/jx6o88MxmPXqoEhhmH9XAKSJMbP9JmVw7KDYMdYI
	 cYFzrC3mXShUxMELrJRAOb8iFHCYRFYnMXADOypUly2tPI5LhdRJAlx6Y7vIsodwEE
	 Tb8WTg9dueCXRj24fln2u12nVVjS4oL3Ny2O8BgKFv5WAfttURT/QkCV02wu1LukEt
	 +WqU5eLPOYBtokHGt2yPjG/XvcY29bKMFzXiTW0vweT3cJdrcDYhDTgUwEXHa4yEL4
	 Ov9DFUt9eHboVve5zoTrH8Bv9mnM+yD+kzQ6+YJzB4D+h8DGu8XFoU9yIoZlUTet3N
	 5V0hxSVsZnYcA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 20 Mar 2026 23:13:34 +0100
Subject: [PATCH v2 02/15] mm/memory_hotplug: remove for_each_valid_pfn()
 usage
MIME-Version: 1.0
Message-Id: <20260320-sparsemem_cleanups-v2-2-096addc8800d@kernel.org>
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

When offlining memory, we know that the memory range has no holes.
Checking for valid pfns is not required.

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/memory_hotplug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 969cd7ddf68f..0c26b1f2be6e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1746,7 +1746,7 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 {
 	unsigned long pfn;
 
-	for_each_valid_pfn(pfn, start, end) {
+	for (pfn = start; pfn < end; pfn++) {
 		unsigned long nr_pages;
 		struct page *page;
 		struct folio *folio;
@@ -1796,7 +1796,7 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 	static DEFINE_RATELIMIT_STATE(migrate_rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 
-	for_each_valid_pfn(pfn, start_pfn, end_pfn) {
+	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
 		struct page *page;
 
 		page = pfn_to_page(pfn);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

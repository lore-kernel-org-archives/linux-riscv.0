Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4601099B47
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JE5nbpgXp+/iMNTb3RHLeI+bmfeYSpWnXFo65SSndU0=; b=MjD0AgUUofxBYO
	++V0kY10xbEKybfHxgQI9yFxnLtIj891Xb1MPzFqFk/4LZW+ALhahpYxUXfYjRb+v050/5BGi0eGg
	nJ+oX0POc9/j5KtUOiiKWaAPnZ1x7idMCPC8/1BOd1fHiJOfdokpTHoKdgYrZAvJsjue+SFmSi01o
	czGPDQ8hVBiw8+ccsr1z0B79ByORepwUWvvb5mQfErRGcguLgs/sYXvTTvUDqs4BF9JZpgptMDFvq
	ZSgExMJSg3yIswabXezO5FM9bgWjyOJ/c7bzGUe8NIwX0mby4RSUBDCgB6zSAQqvWpcJh/wsigWof
	vapBHAD/DrFmbm06ZAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i7A-0000000Dfw5-1fzA;
	Fri, 20 Mar 2026 22:14:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i79-0000000DfuK-1ec7
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 22:14:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CFBD76013A;
	Fri, 20 Mar 2026 22:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CE7C2BCAF;
	Fri, 20 Mar 2026 22:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774044882;
	bh=nAADk4O++zlIdaSsGnqecpm2JFYNOEQEolE0epkoJXM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cx1QfJeiw+fJiVi+TEUgbrb9326n7iVHjUNLjnMKlj6iprB7t2rO+Imn/dWGqdEq7
	 YfNIyImYbgavmRQUEAmCNUElbh5Kg1BFoe5ptLbRuN7ZuReCZI4rDY2a5jP7YFa8px
	 3Dok4Agv9vTrsTBNtsOBpywS0B05t15ubKY0+5O73+1FriKKgr5AGs+05Tvmqv7AdU
	 RyCJAM88Hs+79PzvgYeXn5SyIVMvqyy3JQ8WpvMDwEKL4HxAu0dR37XakI55NSR2rh
	 eRrtwzRqU4cSFG1lF8DErPwB1lfPA7mQ94KCMiW+AgFVXhOqgZu5WkrNADCZ1pDXHB
	 SiY7M3MEQJVBQ==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 20 Mar 2026 23:13:46 +0100
Subject: [PATCH v2 14/15] mm/sparse: move __section_mark_present() to
 internal.h
MIME-Version: 1.0
Message-Id: <20260320-sparsemem_cleanups-v2-14-096addc8800d@kernel.org>
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

Let's prepare for moving memory hotplug handling from sparse.c to
sparse-vmemmap.c by moving __section_mark_present() to internal.h.

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 mm/internal.h | 9 +++++++++
 mm/sparse.c   | 8 --------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 2f188f7702f7..b002c91e40a5 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -987,6 +987,15 @@ static inline void sparse_init_one_section(struct mem_section *ms,
 	ms->section_mem_map |= flags | SECTION_HAS_MEM_MAP;
 	ms->usage = usage;
 }
+
+static inline void __section_mark_present(struct mem_section *ms,
+		unsigned long section_nr)
+{
+	if (section_nr > __highest_present_section_nr)
+		__highest_present_section_nr = section_nr;
+
+	ms->section_mem_map |= SECTION_MARKED_PRESENT;
+}
 #else
 static inline void sparse_init(void) {}
 #endif /* CONFIG_SPARSEMEM */
diff --git a/mm/sparse.c b/mm/sparse.c
index ed5de1a25f04..ecd4c41c0ff0 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -161,14 +161,6 @@ static void __meminit mminit_validate_memmodel_limits(unsigned long *start_pfn,
  * those loops early.
  */
 unsigned long __highest_present_section_nr;
-static void __section_mark_present(struct mem_section *ms,
-		unsigned long section_nr)
-{
-	if (section_nr > __highest_present_section_nr)
-		__highest_present_section_nr = section_nr;
-
-	ms->section_mem_map |= SECTION_MARKED_PRESENT;
-}
 
 static inline unsigned long first_present_section_nr(void)
 {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

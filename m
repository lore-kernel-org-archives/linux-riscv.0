Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331FB1099B3B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxL/CkLQo9Na1YigNAAW20hfCTadYVA6knQvRQLQdJk=; b=uzCtyNF+yvH67M
	rCYhrntfh747TVtySFnPruiUY4mtzNx/7HPpUUfSbZufKpBfg3oV9ALCwe2+z16GFgE5g9dxOAtat
	/aiKKbNgweQDtZeSlKOIKqACeVCrOYCZxxVjLqIn3tzXpUC3Cs+7+xJlcO80zgbP3p3VohN6hHCjN
	OiqW8yFo4eMOPEbkQRHcYGU7y0/w+VVc0BTyjFuVQfBymhfcFGkcUJZ8T2dkuTweO/o1qI4TstM0l
	xlQ1ck3fwCtX63a4qjUOM79EM3LA4y7mXK3KhY02ZbNgVthjuzD6LGB3WCVZprtRYtDQLh89FM9e0
	kjljQ4MuJXNs9lmrGNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6y-0000000Dfj2-3hLE;
	Fri, 20 Mar 2026 22:14:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6w-0000000Dfg0-3vE8
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 22:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 448866014C;
	Fri, 20 Mar 2026 22:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBCBC2BC87;
	Fri, 20 Mar 2026 22:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774044870;
	bh=96Y5hAnwqjZz29h98raybd4EwBxokxu/LgenBd+sLbQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IHLJ7uy8oSWAv0WFrwtVAb5aqpsuUpirtjWzxOOeikkn8Cnj9WwzIvvRij484C45D
	 sDFL5mLdqScUm2fzsvdEC1JdLzvfsyk36kWc35PHmbWLs9cVbdiJLPGF62cKICafDO
	 FvnFCZhQ8o637F4GYescmIZk/JpTP9gIjiPNGg/V4UZUriDHGypjOdxwvdW0FCR0K/
	 1WFbCMNsgJnoktrK7x7yyswl4f1lMAvZ7eR9vfmwjEr8qzpMoFgMx8wbw1VC/InmpH
	 XRuHYmRJ+fUci09hGRGZwOpykKU7rmJk/cRic01Os9XnQTPnJfW0X7UsPtpQ+w+21D
	 OWMtzKPIBKBBg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 20 Mar 2026 23:13:43 +0100
Subject: [PATCH v2 11/15] mm: prepare to move subsection_map_init() to
 mm/sparse-vmemmap.c
MIME-Version: 1.0
Message-Id: <20260320-sparsemem_cleanups-v2-11-096addc8800d@kernel.org>
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

We want to move subsection_map_init() to mm/sparse-vmemmap.c.

To prepare for getting rid of subsection_map_init() in mm/sparse.c
completely, use a static inline function for !CONFIG_SPARSEMEM_VMEMMAP.

While at it, move the declaration to internal.h and rename it to
"sparse_init_subsection_map()".

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/mmzone.h |  3 ---
 mm/internal.h          | 12 ++++++++++++
 mm/mm_init.c           |  2 +-
 mm/sparse.c            |  6 +-----
 4 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 7bd0134c241c..b694c69dee04 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2002,8 +2002,6 @@ struct mem_section_usage {
 	unsigned long pageblock_flags[0];
 };
 
-void subsection_map_init(unsigned long pfn, unsigned long nr_pages);
-
 struct page;
 struct page_ext;
 struct mem_section {
@@ -2396,7 +2394,6 @@ static inline unsigned long next_present_section_nr(unsigned long section_nr)
 #define sparse_vmemmap_init_nid_early(_nid) do {} while (0)
 #define sparse_vmemmap_init_nid_late(_nid) do {} while (0)
 #define pfn_in_present_section pfn_valid
-#define subsection_map_init(_pfn, _nr_pages) do {} while (0)
 #endif /* CONFIG_SPARSEMEM */
 
 /*
diff --git a/mm/internal.h b/mm/internal.h
index f98f4746ac41..5f5c45d80aca 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -960,12 +960,24 @@ void memmap_init_range(unsigned long, int, unsigned long, unsigned long,
 		unsigned long, enum meminit_context, struct vmem_altmap *, int,
 		bool);
 
+/*
+ * mm/sparse.c
+ */
 #ifdef CONFIG_SPARSEMEM
 void sparse_init(void);
 #else
 static inline void sparse_init(void) {}
 #endif /* CONFIG_SPARSEMEM */
 
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+void sparse_init_subsection_map(unsigned long pfn, unsigned long nr_pages);
+#else
+static inline void sparse_init_subsection_map(unsigned long pfn,
+		unsigned long nr_pages)
+{
+}
+#endif /* CONFIG_SPARSEMEM_VMEMMAP */
+
 #if defined CONFIG_COMPACTION || defined CONFIG_CMA
 
 /*
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 969048f9b320..3c5f18537cd1 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1898,7 +1898,7 @@ static void __init free_area_init(void)
 		pr_info("  node %3d: [mem %#018Lx-%#018Lx]\n", nid,
 			(u64)start_pfn << PAGE_SHIFT,
 			((u64)end_pfn << PAGE_SHIFT) - 1);
-		subsection_map_init(start_pfn, end_pfn - start_pfn);
+		sparse_init_subsection_map(start_pfn, end_pfn - start_pfn);
 	}
 
 	/* Initialise every node */
diff --git a/mm/sparse.c b/mm/sparse.c
index e2048b1fbf5f..c96ac5e70c22 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -185,7 +185,7 @@ static void subsection_mask_set(unsigned long *map, unsigned long pfn,
 	bitmap_set(map, idx, end - idx + 1);
 }
 
-void __init subsection_map_init(unsigned long pfn, unsigned long nr_pages)
+void __init sparse_init_subsection_map(unsigned long pfn, unsigned long nr_pages)
 {
 	int end_sec_nr = pfn_to_section_nr(pfn + nr_pages - 1);
 	unsigned long nr, start_sec_nr = pfn_to_section_nr(pfn);
@@ -207,10 +207,6 @@ void __init subsection_map_init(unsigned long pfn, unsigned long nr_pages)
 		nr_pages -= pfns;
 	}
 }
-#else
-void __init subsection_map_init(unsigned long pfn, unsigned long nr_pages)
-{
-}
 #endif
 
 /* Record a memory area against a node. */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

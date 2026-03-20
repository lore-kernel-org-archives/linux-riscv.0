Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07D61099B3B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlvdaVZWySeOLgPC2WdiOCKAp+9OLarMf8A8nUAfYCY=; b=0uqiwybwSm/vp0
	y7HjONEMmihA43kkRTRp2SA3OexYOGMbwRCIB5Dcb+aWfuTK0xf0AD/eh1TdS4/NmPa0G5nHfD2/w
	Bmo//fEqbdWR57U3Fcu14qDvE4avkoCuXDSta07XAfFmvT1mL+qrKDzKM6lSPaMK0ogBK0LktxXPu
	Mn6CeyStNHiYWMwFPga6l+Y8qve9LgrrPHlCpyy56agiyFuTIp0XVlsVYbjxVxaw0VMBCRlkyG8Ks
	NmFmMUT0Ljh8bcWGw0pKp4GZHFBB2Z6C7usYzxUyOXxGTuRLShL/brC8P0EYY9+zoVCtYWWo7KJJg
	37eAHulURLp1gWAmnY4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i76-0000000Dfry-3MmT;
	Fri, 20 Mar 2026 22:14:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i75-0000000Dfq7-2IRb
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 22:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1CE46111B;
	Fri, 20 Mar 2026 22:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B066CC4CEF7;
	Fri, 20 Mar 2026 22:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774044878;
	bh=y3sgZkTrQ7ucF18Vg7qRa+O7aPCnDHgstTSd5M9UBOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TslszDhSAzMDVRIyuMv6paGVgSsd2CzTi2m+XDZauLL+oMPD8nN2y19WOg5QAxcN8
	 MJkxnPJI13xWM/TQBuUVFa8i2WBfcrPqP1pN4JyiIYxzvSpK68kow0YUXzxMwjLIvA
	 PZfMcLRp38aeBp/XZ/scY6XOVW8u6R2Vl2bxg7ZCjPYl5+Zw1cWeOJK9ueZjsjOuBI
	 /f+WZSPbGmI8Ms+0wdaf/gI3Ef6Dwbp58ZS76mf9o54sv2J4dxehoWLmTRoayHRyve
	 UXsBVGWUjpn8Bff33KBzLTvQ6RK33x76NgUJDEqM9svExTt2X8h0wOTNQ+4FrOCJLF
	 6X7zc7Xpdr5tg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 20 Mar 2026 23:13:45 +0100
Subject: [PATCH v2 13/15] mm/sparse: move sparse_init_one_section() to
 internal.h
MIME-Version: 1.0
Message-Id: <20260320-sparsemem_cleanups-v2-13-096addc8800d@kernel.org>
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

While at it, convert the BUG_ON to a VM_WARN_ON_ONCE, avoid long lines, and
merge sparse_encode_mem_map() into its only caller
sparse_init_one_section().

Clarify the comment a bit, pointing at page_to_pfn().

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/mmzone.h |  2 +-
 mm/internal.h          | 22 ++++++++++++++++++++++
 mm/sparse.c            | 24 ------------------------
 3 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index b694c69dee04..dcbbf36ed88c 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2008,7 +2008,7 @@ struct mem_section {
 	/*
 	 * This is, logically, a pointer to an array of struct
 	 * pages.  However, it is stored with some other magic.
-	 * (see sparse.c::sparse_init_one_section())
+	 * (see sparse_init_one_section())
 	 *
 	 * Additionally during early boot we encode node id of
 	 * the location of the section here to guide allocation.
diff --git a/mm/internal.h b/mm/internal.h
index 5f5c45d80aca..2f188f7702f7 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -965,6 +965,28 @@ void memmap_init_range(unsigned long, int, unsigned long, unsigned long,
  */
 #ifdef CONFIG_SPARSEMEM
 void sparse_init(void);
+
+static inline void sparse_init_one_section(struct mem_section *ms,
+		unsigned long pnum, struct page *mem_map,
+		struct mem_section_usage *usage, unsigned long flags)
+{
+	unsigned long coded_mem_map;
+
+	BUILD_BUG_ON(SECTION_MAP_LAST_BIT > PFN_SECTION_SHIFT);
+
+	/*
+	 * We encode the start PFN of the section into the mem_map such that
+	 * page_to_pfn() on !CONFIG_SPARSEMEM_VMEMMAP can simply subtract it
+	 * from the page pointer to obtain the PFN.
+	 */
+	coded_mem_map = (unsigned long)(mem_map - section_nr_to_pfn(pnum));
+	VM_WARN_ON(coded_mem_map & ~SECTION_MAP_MASK);
+
+	ms->section_mem_map &= ~SECTION_MAP_MASK;
+	ms->section_mem_map |= coded_mem_map;
+	ms->section_mem_map |= flags | SECTION_HAS_MEM_MAP;
+	ms->usage = usage;
+}
 #else
 static inline void sparse_init(void) {}
 #endif /* CONFIG_SPARSEMEM */
diff --git a/mm/sparse.c b/mm/sparse.c
index 5c9cad390282..ed5de1a25f04 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -256,30 +256,6 @@ static void __init memblocks_present(void)
 		memory_present(nid, start, end);
 }
 
-/*
- * Subtle, we encode the real pfn into the mem_map such that
- * the identity pfn - section_mem_map will return the actual
- * physical page frame number.
- */
-static unsigned long sparse_encode_mem_map(struct page *mem_map, unsigned long pnum)
-{
-	unsigned long coded_mem_map =
-		(unsigned long)(mem_map - (section_nr_to_pfn(pnum)));
-	BUILD_BUG_ON(SECTION_MAP_LAST_BIT > PFN_SECTION_SHIFT);
-	BUG_ON(coded_mem_map & ~SECTION_MAP_MASK);
-	return coded_mem_map;
-}
-
-static void __meminit sparse_init_one_section(struct mem_section *ms,
-		unsigned long pnum, struct page *mem_map,
-		struct mem_section_usage *usage, unsigned long flags)
-{
-	ms->section_mem_map &= ~SECTION_MAP_MASK;
-	ms->section_mem_map |= sparse_encode_mem_map(mem_map, pnum)
-		| SECTION_HAS_MEM_MAP | flags;
-	ms->usage = usage;
-}
-
 static unsigned long usemap_size(void)
 {
 	return BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS) * sizeof(unsigned long);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

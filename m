Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA40E606A322
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CXP5Zgv1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=f1XYeS51
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AIGgu/RxShc7sDYvCShlPUt6qu+7Ta5X1zqsK0mj5Gc=; b=CXP5Zgv1OOvYivrchKXnsGZXw8
	zZ2KpXW2VFEGFppi4Q/CZlqtxstGKSQa31feCEYXipl0NLmD9aXmZvF5hqweyGyTmeGIgWzZAgu+/
	ncJhEnpaMcRkptsrNvVkhkbHKRp9yAPWBugv4Y9kU92N89OL+UevQ9BUwVo0WXPWFRCHq2NNcw+4+
	iRb2IIzVUR0UhtpobLe5/hQ/qqe2F1gVVPmlFoIS7pgi++gQi+Hxo8c18DfQwvioSCKM6ld5+fO0k
	LoZhytZnHoWYCYpUCE+wvLSaXJaIIpLNqW7QayyR/HqQOkgpyF7MyiB4PWU4UTtrR46V1pBtd/BH9
	0T3E7+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHx-0000000Bpma-28Sf;
	Fri, 30 Oct 2026 14:09:01 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHp-0000000BpeR-2Wj7
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 14:08:54 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2e96502e447so7224175ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2026 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369332; x=1793974132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QjoN4+6LqE6BOGR2vrR9uNSgacxzY3BRDUxvEZuPaiQ=;
        b=f1XYeS51gPurIg+2EeeUFe2wDd0agX5bBxYYA0HBjRQfjGKcW5uDnymOQUq6d3y4KX
         o4iZGLYbzXRY78uxEaDjYWGXtABIgJDcqonl03pbkESIGAqZEO272/QJQNJaJzzoQde8
         Z7qA8mJLBN7e0GD+gEwOgmizbITFsKjKb9qwm8Caf5QI0G9X4SslHCAuD6lKkSQa4u7l
         yqZ/47R5mWdbBcH4yRFbMpCxVtcsPicLiPkRG8EnxtnVH90qkk1eXkFq2lDXVc9iVkTJ
         a4s4cTF3FdFAj8phMdB3LQuMONgVJxth61tO2BC0uUMSeMj2QfG6hpyyTRXZqCEAVMaq
         /9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369332; x=1793974132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QjoN4+6LqE6BOGR2vrR9uNSgacxzY3BRDUxvEZuPaiQ=;
        b=cw7lz0n6lJ9NlCcPtWJt7LV4D5STksqy/5CF7JDG0GMTtUDM+8fzMYNjdHDqI6szTB
         XB1RvEPIbBjqcChyJYEtAVK+ZjGGBRpnwU3nzEBN597EcAEGjtwLl5n8XF5kEERpBHrB
         x1iM29B1cD09nsFPZ3Z3kmGvXdtTeVzJu3VVNcZ+bZC62DtiMPbC+TVaTKQPOmYFPWeF
         jEo98ANogk9m67docmyz5fkgYeldK0CfbssYtIsYQXkkzD4HvVSLB8M/6CxgKQBar5fS
         9e+ZnYwGcaOY+1w3QPmXlTLnBjl+P4Vrf46SfHWSo0b/LB2HJDPB+4JWi/giYZXnvoMr
         VOZA==
X-Forwarded-Encrypted: i=1; AKwUvBzabQ5M/M7ndkcNRVZ//7te1L0tnroqoUQ5mESned33FbAOFx5/mJH4D21RiVUq8XHlzKE8b6wB4A6FQA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIv+8NX8aP8ivYTG1bp2PZacWjjTQ0Z4LtFVBFe/tt7X1vdMCo1
	KXll5KqBotbS/R86AkMOfm5b+y/XGSSO6ONUpgE+Qqd4gUy3Yv1T2lv2XX6+t7J2nsU=
X-Gm-Gg: AYBFou1pheIJraQhLHP49R6Uw9BgH08YVKY7HnxaMWrBfo4VGQTMaSHYjQF/eIBHkZZ
	iRcQy9B2weaTTyTxWP8TUFL2UAm4K4I/RJdGrdswlNoUzFBtuYvyqrqThP6WH/a6+zBB6sVX08x
	gEFlG9o1fL6IEWQfQDKOp43npc0t5nkOyjOFjFz46VvC3ynFsbMdP+Zazkq/UGPt1GuVd/CtdsM
	VDLHCaIc2sFnOOLgQq+FgrTTzKpbe6/Ezx8YtyM339yJ/tuD1dioGWtdnnB9DHPEerBxjhnrHjz
	6GUOIiarn2sqxJkGKuZvV887TVZg9qcGnyYodTaSm3DS+UrluYW7aFckfQggFUiisExFHnKtdL7
	m07Lo8XQGf0ryLr+ZaFl+qM2+FiWpFbUNGpfIlSC4pp3XcxozChFPTbJXq1g1aY9R5cRxDeWkgB
	A5v78srmNGvbGs4bq2VuUGsjiDDzxJH4hH2Y2kKTOFzo+XB1Cgqm2FHypykQLj3V8J/Bl683Rdt
	Gl7ScDTUAKfJ8BpiioxNB9xZA+q0ALLgNlo/HlWJZpYuRDN5WNMtjHEB9tSkitIvKNO3kt005hJ
	G+yYgz2gV10kCM7lwB30VEqL1JXl0j5Aqk0m7gfdaHjle2LU4FeIHgycmQCP7nYPHaXoPgJo
X-Received: by 2002:a17:903:2f03:b0:2e9:4f7b:affd with SMTP id d9443c01a7336-2eb36415069mr25082595ad.6.1793369332072;
        Fri, 30 Oct 2026 07:08:52 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:51 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 3/4] mm/sparse-vmemmap: drop vmemmap_can_optimize()
Date: Fri, 30 Oct 2026 22:07:19 +0800
Message-ID: <20261030140720.1256062-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030140720.1256062-1-songmuchun@bytedance.com>
References: <20261030140720.1256062-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070853_641425_0AA6DAD7 
X-CRM114-Status: GOOD (  15.40  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

section_vmemmap_optimizable() can already decide whether a section uses
vmemmap optimization based on the section compound order. The DAX-specific
vmemmap_can_optimize() helper duplicates that policy, so remove it to
simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/mm.h  | 37 -------------------------------------
 mm/sparse-vmemmap.c | 11 +++++++++--
 2 files changed, 9 insertions(+), 39 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index e875f73b0c6f..4fb48fbe712d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -38,7 +38,6 @@
 #include <linux/bitops.h>
 #include <linux/iommu-debug-pagealloc.h>
 #include <linux/kcsan-checks.h>
-#include <linux/vmemmap-optimization.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -5395,42 +5394,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
 }
 #endif
 
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
-					  struct dev_pagemap *pgmap)
-{
-	unsigned long nr_pages;
-	unsigned long nr_vmemmap_pages;
-
-	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
-		return false;
-
-	if (!pgmap || !is_power_of_2(sizeof(struct page)))
-		return false;
-
-	nr_pages = pgmap_vmemmap_nr(pgmap);
-	nr_vmemmap_pages = ((nr_pages * sizeof(struct page)) >> PAGE_SHIFT);
-	/*
-	 * For vmemmap optimization with DAX we need minimum 2 vmemmap
-	 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
-	 */
-	return !altmap && (nr_vmemmap_pages > VMEMMAP_OPTIMIZATION_PAGES);
-}
-/*
- * If we don't have an architecture override, use the generic rule
- */
-#ifndef vmemmap_can_optimize
-#define vmemmap_can_optimize __vmemmap_can_optimize
-#endif
-
-#else
-static inline bool vmemmap_can_optimize(struct vmem_altmap *altmap,
-					   struct dev_pagemap *pgmap)
-{
-	return false;
-}
-#endif
-
 enum mf_flags {
 	MF_COUNT_INCREASED = 1 << 0,
 	MF_ACTION_REQUIRED = 1 << 1,
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 3e9d6617c4bb..43559593107c 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -466,12 +466,20 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 {
 	unsigned long start = (unsigned long) pfn_to_page(pfn);
 	unsigned long end = start + nr_pages * sizeof(struct page);
+	struct mem_section *ms = __pfn_to_section(pfn);
 	int r;
 
 	if (WARN_ON_ONCE(!IS_ALIGNED(pfn, PAGES_PER_SUBSECTION) ||
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
+	/*
+	 * Vmemmap optimization is not supported when vmemmap pages are backed
+	 * by an altmap.
+	 */
+	if (altmap && section_vmemmap_optimizable(ms))
+		section_set_compound_order(ms, 0);
+
 	r = vmemmap_populate(start, end, nid, altmap);
 	if (r < 0)
 		return NULL;
@@ -699,10 +707,9 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
 	struct mem_section *ms = __pfn_to_section(pfn);
 	struct mem_section_usage *usage = NULL;
 	struct page *memmap;
-	unsigned int order;
+	unsigned int order = pgmap ? pgmap->vmemmap_shift : 0;
 	int rc;
 
-	order = vmemmap_can_optimize(altmap, pgmap) ? pgmap->vmemmap_shift : 0;
 	if (nr_pages < PAGES_PER_SECTION && section_compound_order(ms))
 		return ERR_PTR(-EOPNOTSUPP);
 
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

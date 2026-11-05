Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC075606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 06:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hVvYukJP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=H022UQ+Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TMgBavm3a2HWY1nspACZ2dVQmiBxUlMY9I0Hg5+7/GQ=; b=hVvYukJPqltMnabEUJcOTGGaDg
	cR7XElOBTHQA2Eg6QOh2W783MIfUwe8kgzQuGqxwt8DDoiHvUicRWSW5X2ANNVL4U2ejHtAdbZqxn
	SPRzYCS+tdymGW/Sj9uhwWZfp6c9a1aSQfBY/g/3vBm5CSnXv0R5D1S1WPmdleGhgrNVAQzXG0FNk
	KghjmYF7j00bSZ/N5hWqpNirm8JUi42ekRp2nYXpuMV4nzbFjqvf0Wws5roecsHFsFtCwWvNtxFJx
	bgeerTD7Vc8Bc8NierNRkIRMsIPEJFTFCDms5jOQpv+HEn28F6ZRMKkfOBo2SRx97c9lPakfLCyn9
	8rRQ1Ldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqic-00000007vLv-40fz;
	Thu, 05 Nov 2026 06:13:03 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqiY-00000007vHE-3NPD
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 06:13:01 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2e5378b281aso9458815ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 22:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859178; x=1794463978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKRQNq+YvdEons4PssMSMvDyZ1aDaAIj0dg+GEUgY+U=;
        b=H022UQ+YYtXkzMQodTpINPOwZ7U9j2tI/Uqnn0uPpg1YKhXEaJc/QEsM7xgC1ZCMC6
         O/kq196EVfG8plbufvR5XB8uXQtNp5a11DGBDFwdCjEUb8ceglL77wG3E+G/8S4gGWgP
         ibcpYBzMztHkgACx7FDUF6Q8fpfKUtyvAfxQNWnXwEr4JRzu4KhKTE5xoxshOxSCRBqQ
         l4nCJR8qtIL182brxzEzN4jaFZnpmJoBXcwCyObM0fTgvABzVJl8ip+Dw7Kw38a1JkqD
         jEyRMBxIBRZ2Da2neSB3/iWh4e9Ycb3DzghzGAmTDnAf913JX7sAKmEXwW0Xw297nlUS
         YDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859178; x=1794463978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kKRQNq+YvdEons4PssMSMvDyZ1aDaAIj0dg+GEUgY+U=;
        b=Oq2RaFhdxu1mWAsg19Onvdxms8YtazmwbdQJEpeQkR3/X125/xdLE4eeuVLB83Grkl
         kOWLErRGNXDxO56ahk9eRPrLWK93V1eVnSIwmnL4WmqhI24YOznx2VJ5CYjwu/ZvL+Po
         /Ypp22P8GfSE5Bq+OecJp12KoPAFJHx+NgyuJG//NO4RcnGEGCh1jywi7bTzVIHr/dzZ
         W43ysw1Gy1k7JoezyBqB8m6gwkDbymu/JGeDghRABqyB//9kA6ybz1G+W6logbEt4tYj
         TlOUJgbbhSLD755p9GbPF3TaFxtHCvvU4QW3Xlp9IjL1aBHCPo3iXVpNzsWi+gvRnku+
         l/Nw==
X-Forwarded-Encrypted: i=1; AKwUvBwmFMlDfvctfF7lv+p5imTEF3wNHJrOv0T9wLy8MyVpazI53LEXoFHcZ/X81ms1J9CyN7yhL3b8ZLwdEQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+fzQdo+0StpR8pe8+lRFnDY6W+mQCmDFdW02Zq07M9fZ/WTQaj
	vy56RCZd8mP5MEEo5pesJPIskWHciEGObi1KpDMikwSJ5kqrahQ2q47/8pQCwzWa/x0=
X-Gm-Gg: AYBFou0VJqSjgi5x2wfSLbQ21WrYX7ZLPf7S+0Q+HPZi6Zzl6p3uifyumvqIDbw09T1
	1dNoZ+ZYdah4eFEt9zlCpNGeHYi9jMtRgwU+5+YyNyI6uVq2JTFXtE21hjtj2chM/GrEnN5IUaT
	Vi5WrfvZ2qibJpiPaXihE6ngESdW3IEoMdml3HJnV25a1OUI1sYWgjU51/nlxIzS1oYTBMook3L
	nz0pIjg/US6lQZZp8cVRwQYy1xSaep6/XdULradT7CjlzYse00ZrGdvtBLlQH8hNIIjA5tgLyrJ
	AFqqDcYogeszekL9fHzJKk9wlqy8BCA7YzuhY8Z+OaYhFEhSD1db3B50+iKmh3dXyFN0TTmta/0
	EU/9NRcb4oTv7U/4pFJQAoms6dkSZ27wz62I3tUc0qNq30n9/p95OtyUuVGMkCo7FmGUE2p2+Dy
	RZVIbns1QLHo9Fu7SNp3B8K0RUy015QYIuW6wZ9LawKLrThxbG+tGiixjarHvJDiETueHYy4NEQ
	AgNiCh48vn0b5Gcg98XWhS20WANlNhmTtkPRkk0yk34Z7+eUyOO64nWrEiXFx0iCsMp6erXv86M
	XS5mbR3ASKTSViO23r9svWLIZ+Il1h0RT26kHw0GoAetsvPkz9gdLVw7FjptkuxK/Q==
X-Received: by 2002:a17:90b:380c:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3ae896f8315mr16195357a91.11.1793859177566;
        Wed, 04 Nov 2026 22:12:57 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:57 -0800 (PST)
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
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 4/5] mm/sparse-vmemmap: drop vmemmap_can_optimize()
Date: Thu,  5 Nov 2026 14:12:16 +0800
Message-ID: <20261105061217.13302-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105061217.13302-1-songmuchun@bytedance.com>
References: <20261105061217.13302-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_221259_908327_7F928519 
X-CRM114-Status: GOOD (  17.13  )
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
v2:
- Ignore non-optimizable nonzero section orders while retaining zero
  as the reset value (reported by Sashiko)
- Use section_vmemmap_optimization_disable() for the altmap fallback
- Move vmemmap_optimizable_order() before its first caller
---
 include/linux/mm.h                   | 37 ----------------------------
 include/linux/vmemmap-optimization.h | 25 ++++++++++---------
 mm/sparse-vmemmap.c                  |  6 +++--
 3 files changed, 18 insertions(+), 50 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a060a7150401..2fa5ce73b382 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -38,7 +38,6 @@
 #include <linux/bitops.h>
 #include <linux/iommu-debug-pagealloc.h>
 #include <linux/kcsan-checks.h>
-#include <linux/vmemmap-optimization.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -5366,42 +5365,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
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
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
index 5c09da4df4d8..9d9f7a67d195 100644
--- a/include/linux/vmemmap-optimization.h
+++ b/include/linux/vmemmap-optimization.h
@@ -31,6 +31,17 @@
 #define VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES	(VMEMMAP_OPTIMIZATION_SIZE / sizeof(struct page))
 #define VMEMMAP_OPTIMIZATION_MIN_ORDER		(ilog2(VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES) + 1)
 
+static inline bool vmemmap_optimizable_order(unsigned int order)
+{
+	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
+		return false;
+
+	if (!is_power_of_2(sizeof(struct page)))
+		return false;
+
+	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
+}
+
 #ifdef CONFIG_VMEMMAP_OPTIMIZATION
 static inline unsigned int section_compound_order(const struct mem_section *section)
 {
@@ -40,6 +51,9 @@ static inline unsigned int section_compound_order(const struct mem_section *sect
 static inline void section_set_compound_order(struct mem_section *section,
 					      unsigned int order)
 {
+	if (order && !vmemmap_optimizable_order(order))
+		return;
+
 	VM_WARN_ON(section_compound_order(section) && order &&
 		   section_compound_order(section) != order);
 	section->compound_page_order = order;
@@ -134,15 +148,4 @@ static inline bool vmemmap_optimizable_pfn(unsigned long pfn, unsigned int order
 
 	return (pfn & (nr_pages - 1)) >= VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
 }
-
-static inline bool vmemmap_optimizable_order(unsigned int order)
-{
-	if (!IS_ENABLED(CONFIG_VMEMMAP_OPTIMIZATION))
-		return false;
-
-	if (!is_power_of_2(sizeof(struct page)))
-		return false;
-
-	return order >= VMEMMAP_OPTIMIZATION_MIN_ORDER;
-}
 #endif /* _LINUX_VMEMMAP_OPTIMIZATION_H */
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index b8b55e12f5ba..71a927d67a9f 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -473,6 +473,9 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
+	/* Altmap-backed vmemmap pages cannot be optimized. */
+	if (altmap)
+		section_vmemmap_optimization_disable(start, end);
 	r = vmemmap_populate(start, end, nid, altmap);
 	if (r < 0)
 		return NULL;
@@ -700,10 +703,9 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
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

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E92606A326
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 04:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iLUWTp9h;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=OuWCez+B;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cLETZEHw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qP4EcY7gLk5SH2HtjPbUAIlF2CnUa/EgMw2GJG/UWgU=; b=iLUWTp9hDjAjFd0quypB4GoSqc
	xughfvZqxUAKYjuLyUFKqYFwdlAuqPAJAPyTLc4EO3gTHXTP8kZdQdiIYfKWS9Bgu2X4j75udoanP
	zOe6Hb+ow5zSqXTQwW3dUcp0m9xOFZRmjaOEq8dfR34YPjO6RdBwPe/q25s/rJTxzEoanBi1vbat6
	vcxTfm6OgPEzftmzg6yX88bqsFZfMR9hwefMhznJ+s4L60SqQRwCxxUfIcz38eGMt/hz3LUkBGv4x
	EfmovrJTMlV+DVzUdepq8EVHNRnacsxLBfnZ+1NWngPvow4AMPVhDZO9rUoQahHMgxg1GJuDUI6UV
	YMaE7XcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY6h-0000000ECSD-3rH1;
	Sat, 07 Nov 2026 04:32:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY6f-0000000ECP0-21bo
	for linux-riscv@bombadil.infradead.org;
	Sat, 07 Nov 2026 04:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BY1PW5EQCsSwahWNQsNirKWCM+cX6Fs3QmmMD9rosww=; b=OuWCez+BOCEwJKcApQBrzknuqh
	WJZfbblrtDPmG1qehL9bU6Ny5CIakqjXDUBgeWqcz/hn6xsbDpi9pM1FDHOwJ76GkE4lkJlBqwnbt
	1BIU9m4kqHvSu/2XUcVEPTVlYS3lO21U5Cz6VTneJpdyjdRSSkjxx7BoKp3THP6R6vScfujjE8HUd
	HrKA9dLAuDUXqoR4Uj+KIWTIsI1naklyZ8Vykk533ztLt+0SuR5NphTrj9VbPYdrp8Xpn3zUI/NsB
	lShkb/CqHR5f7nneS+m93TPJzY4SaYhS98i/XlLKDefnTqi0fF7AkJJMEE041wwntbOai+B0dvj+8
	2RJXmv8Q==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY6X-00000004ydv-2GDe
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 04:32:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso719378a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 20:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025951; x=1794630751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BY1PW5EQCsSwahWNQsNirKWCM+cX6Fs3QmmMD9rosww=;
        b=cLETZEHwzEV9QFF8D229I7hCuU4CznEAAnde4MxfUtGRJapfUZXMHMoXm5f9W2cS4r
         habIyLxyFOB+WQU0xob/XJrB2TYuU6ITEjrH1XBLYcrCQo7hIb38FmhxiVND2wqIGh0w
         ZSFSz93v12x6JwAQiFUOQN+M54lFHF6uo2DVhZ7cdjbESrfP34ZWjCjpay4TeefbQWy1
         TaYYsEmpTZEtbum5vyxlLO4fG5BNviJKuxZ/DrJnC7hqjzVaIKS2EYplzIZS7ZJSQBxe
         g3dPoVi0gTgiM9UgqLCkV7levW1hgXQhNWeqsh1597esw536QjupxeOLpOltg2XIZtGf
         89Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025951; x=1794630751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BY1PW5EQCsSwahWNQsNirKWCM+cX6Fs3QmmMD9rosww=;
        b=lEGeyojsrUsp3J/HalnTTRx67GxB3JmtHhTsGMcOrVqeBwXdnDHzw1daClr3MG3Jfr
         L727I1oyM13udv85y/3gu2j30c+0IrJS2mTOI4MRqjVO9f31E66oOGzJ1FJvlpbC/7Eh
         A6oLhB9sGjYLfjrNizmmbs4QvQXiKzIeM1C4vQG4qN+0nFkO5VB1zZK5nYhfdq2gV6TX
         OqwhqtfNmei4ggCPiA/mfxw3qZwMwVNw4QH98XltlnEWaQIu+FBbq9FVOuMs5GPB0LE5
         SSleecQkL6UgqHuPWrZkOQuNShsyEz43dRpT+emtW0uzE2mUEk+l4OdTrAsRH4XO6A9P
         /mtw==
X-Forwarded-Encrypted: i=1; AL+hErEoAvV9GEprpMvy6V34dq+Lr0ocqFhtMJDmotHKnNo3DRbJtRSnArlj6emg8p36+3FgIri8zk4e8hoGEw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9DFKTHhGY08mlaq4HI06Ik/X0pid3U+bzJ2tLW6fhqNjAIs2Rt
	RhV1rkF2uCEa8R3hbPPZIB5S1V3Upyy6ETUQnkjJNI/eP0++LZxa3OEkjMOJyjgYppI=
X-Gm-Gg: AYBFou2azrxsM8a9KR35/0pOmmssu8DHXabKTqZ1GBsjM7wjSbZZ1sCihEmNUaqyYo/
	UL6BxaGyrhWd+uHk0haJuOrfqfoWp3/nFM5mYk+LbLDgCIu0Ckwgg/AxddiB68yglVhQkFjxtXn
	JaMYRRIgIhNuyaA9hJoX9AFO+XHGouwtshNiaPiGhhpr6jepXJH59twwQqmIkBH2l7WL1hiX71D
	VkMdUQiHEKw6+UuRKzFVrL6SCjz4bIOm/ZKOWMAfl78yP3qLmqEFVNX6VeW/PWsOmAmSdsiJV99
	GUYbOZtZ5FsfenFnwb98i+AElR98rNzmjOCdk452NXKuwVTTWuoVU8JNtPFarkxQBnnJYjq+B+y
	9Z8k1AvtNQAGeCAc3TinFkSOcnyT8cxV4ia8RXVOgwEuUFJKJ4+aS5sAU8V04OYMeDG4sZqDSNB
	F63BsKeXlZxLYS0YQhtkTJXIYjc8kBi7O+XyfRfLYWOSjC0YvpFOlNZ0H6aBh27Z8Z+iax+d++Y
	rH9A9N9tmDIekgB6EsNmysbo8YBFEc2kalTtcJGa2jug/7q7amCOLGOa56VQ0ciImuWB/8mu0l4
	RytmuFUWlpM1LA2qV1nT3qXMInXeEFGW2uYHpEdhm0g3OO9pdrPtA0uYbABR/p7pPguroJ2tcQp
	7benQvw==
X-Received: by 2002:a17:90b:530c:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3b0db71d480mr4559125a91.57.1794025951057;
        Fri, 06 Nov 2026 20:32:31 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.32.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:32:30 -0800 (PST)
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
Subject: [PATCH v3 4/5] mm/sparse-vmemmap: drop vmemmap_can_optimize()
Date: Sat,  7 Nov 2026 12:31:21 +0800
Message-ID: <20261107043122.25650-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107043122.25650-1-songmuchun@bytedance.com>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_043237_683822_8F459133 
X-CRM114-Status: GOOD (  17.37  )
X-Spam-Score: -0.2 (/)
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
index 2d0b8a4c9974..43eb19474d26 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -38,7 +38,6 @@
 #include <linux/bitops.h>
 #include <linux/iommu-debug-pagealloc.h>
 #include <linux/kcsan-checks.h>
-#include <linux/vmemmap-optimization.h>
 
 struct mempolicy;
 struct anon_vma;
@@ -5385,42 +5384,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
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
index 22e5a322be0b..985a37dfcab7 100644
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
@@ -109,15 +123,4 @@ static inline bool vmemmap_optimizable_pfn(unsigned long pfn, unsigned int order
 
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
index 57aa5c2d8034..f6a8b8e51b6c 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -490,6 +490,9 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
+	/* Altmap-backed vmemmap pages cannot be optimized. */
+	if (altmap)
+		section_vmemmap_optimization_disable(start, end);
 	r = vmemmap_populate(start, end, nid, altmap);
 	if (r < 0)
 		return NULL;
@@ -717,10 +720,9 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
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

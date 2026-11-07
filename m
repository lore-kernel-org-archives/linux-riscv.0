Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F66606A334
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 04:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=brzduFr8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LuiXzbJT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k9FkNseJVG3u5AC/Z8XToWg1WsMTVvin+IJdfWik7g0=; b=brzduFr8kP5n8SzToG/il9/1Oq
	9fgGWy7eHvZ9vdFZPwsV72c3kz9y4Rmre81z47gPS+jelp7U79qG329001lWJg7PVEDBRpU14cgt6
	E1P1RYljoAYGeh5TkhC7mztOBeiC2ye8T2zK9rpaRtYz83aM5hnQteZC7vMC18mNdyTjKBHLUbcfX
	d1Kpxe6JIINFHPMyTUq9pplJsPFaIiMRcdJiKfjLyU8Uwd2aBG4Q8ggKCs1JtYhegCXwmmSA7zSXV
	4qkj/9hR3QlR5lP14kpCzfXFNL6wytja0jGr1DQ5xPLuItc1lnD7FfpFN8853giuLCznck6CvbrHX
	VBlRcfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY6F-0000000EC4a-0brR;
	Sat, 07 Nov 2026 04:32:19 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPY6B-0000000EC1V-1ei1
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 04:32:18 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso607467a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 20:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794025934; x=1794630734; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjmiDhGTyjFqhaR2vuKwqHt93n+hCHkzTadeMRKHv0k=;
        b=LuiXzbJTz3l7U/D/Pme+Zx2y3//CYAk4JA7V4nLtsj0/TQ7IHwkl9A8I4FfUpQ1MuT
         cPOMU+XhO+r2cbTTcFqPAgsM/1n8256moViwflpj9AVdVNyqCdr5+dnxMQBEW4iWsIot
         j/BrKUtiW/RjJsytNuuCig5pIDw6Z07cvOkFsKsieA0ppycCkRb3VCurrv6vyQTYi8ww
         ixxQRkmISZjADHEBM/LULwyjM7JCGlV8jTPAOftWxpIIEp87fNUl1/29TRfjKXiRTlw6
         Wn+A66ctb81keAd0bhO3JJ3+VD4J81iAuvQGp/Zsjir+JGGtxCnEhVx1gpiQ7x8v4+tN
         wRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025934; x=1794630734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EjmiDhGTyjFqhaR2vuKwqHt93n+hCHkzTadeMRKHv0k=;
        b=eGBaI1i5Jfhob0xe8uIEsi5EDQfhnOJ94x9hUA5xz/wb/08wLJJK8vn0HyEr7t3e+F
         5BvgsQasC4sxAmlm8nOzbS38dyqTKFBoo0Vj2f5Rx1dNNQ8aUxEur9cHtjFGHkw2hVVh
         6lvlEZ01HxAPzBvwNJh2xw0XsivoqYk3JAGequvNAjWcHT194E62CFBrEiYPe1rP6oXO
         WYuOaULHK0RqT4TwOFEpmpWPXrHtgbm2ZylnNyU0WwJ5Bu5QwkNq2pYRlt4Iqh2WSvB/
         fQ8piotpYq9qeKxriFxEhd9nV133j4cR1g36vTYDKGZTtZOYwGpetnZyLeIkYsq6iUKD
         Aqkg==
X-Forwarded-Encrypted: i=1; AL+hErGgfoX6s7iiWW2mQlE6NSLJe4Yb6KjhllXP2yBOc67YkN0XfKdI74XDIuMKBSGYsKObtDVRt2N0p4VB1g==@lists.infradead.org
X-Gm-Message-State: APuU4Z8N2Sl+W8Ipp1ok1XY1SGvInCL9JgD8HSk34Kmcy0xq53xknUV8
	i4KQXRgrGg2Rkil906sDL9SMkG2PnRnLH4HsycXOBz5kC6+rCJ1pt1kBpiPyaopesok=
X-Gm-Gg: AYBFou0x1o0h+ScaCN5g19YG5VmOLKQfxiTbg9xb7h/ituuLcD1DEsJgudB/vDVmL6L
	ckGMyJh43KMuQQI3JaYEujE3PGsDdqepx5FgE47u88Ar6vil++XfI2+Y9wcYTBlENzm2rhPsEIR
	/6JQvbB8/GYca/l0ziTOXIER/NBry+F+ThfjB+01h+RYHlg2Ps2IPXLglAPUuDlrNA3qa5pxxaQ
	LfbHwcKpKoQBdtjxM1HwGfyl1WNT/EMJaXitPt4SB3A7b0JG809OcsbvZtm11RkRsbnzlRBsKrT
	UtFuAeo2lAolDR+AB2b5HMr5hiA2sIVHqHKv7qCtufRz+4xY4ZICZMg77q+q5QWQ6VQnay3Ru+p
	JM/r8bHWI7umpMOnR8pPUhWC9TANPoFBa2MtXob2QLO5R525CmwJVN8utAh2blsmkGyFf2O/eYS
	IGOR5dCBK/TYcBFwdTlDSsKNfm2pTn3Ip66FlFMNvYtzz7c1vFMQOQrmF++dfJb+gtuAaEo3ycy
	ZBTmiPn/QgjKUgz4C+XmmsiRwZBGOFbRL4HqKHVRX+ha8t8y4Ke+xCPqpt8/zWYHZkEBJA5iBNa
	M5N6s9C9VEsblObRn48XgGB7ORZ7E5MtJjqkRNV7L/9H/wmeWNGMuv0Y+H4p
X-Received: by 2002:a17:90b:28c4:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b0db7114f1mr4190441a91.40.1794025934315;
        Fri, 06 Nov 2026 20:32:14 -0800 (PST)
Received: from G6L4RL2QG9 ([2409:8a00:1832:6900:c8de:13da:804b:a0fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10584b66bsm1578451a91.14.2026.11.06.20.32.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 20:32:13 -0800 (PST)
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
Subject: [PATCH v3 2/5] powerpc/mm: drop powerpc vmemmap_can_optimize()
Date: Sat,  7 Nov 2026 12:31:19 +0800
Message-ID: <20261107043122.25650-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107043122.25650-1-songmuchun@bytedance.com>
References: <20261107043122.25650-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_203215_459941_FDAFB758 
X-CRM114-Status: GOOD (  14.83  )
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

Whether the optimized mapping can be used is now decided in the
architecture-specific vmemmap_populate() path. When PowerPC has to fall
back, such as on Hash MMU, it can disable optimization for the populated
vmemmap range there.

Add section_vmemmap_optimization_disable() to centralize this fallback,
use it in the Hash MMU path, and drop the radix-specific
vmemmap_can_optimize() override.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v3:
- Move section_vmemmap_optimization_disable() to mm/sparse-vmemmap.c
  to avoid the LoongArch header dependency (reported by Sashiko)

v2:
- Add section_vmemmap_optimization_disable() for architecture fallbacks
- Use the helper for the PowerPC Hash MMU path
- Include vmemmap-optimization.h directly (reported by Sashiko)
---
 arch/powerpc/include/asm/book3s/64/radix.h |  5 -----
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 10 ----------
 arch/powerpc/mm/init_64.c                  |  2 ++
 include/linux/vmemmap-optimization.h       |  6 ++++++
 mm/sparse-vmemmap.c                        | 17 +++++++++++++++++
 5 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 8452a2714cb1..df67209b0c5b 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -351,10 +351,5 @@ int radix__create_section_mapping(unsigned long start, unsigned long end,
 				  int nid, pgprot_t prot);
 int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #endif /* CONFIG_MEMORY_HOTPLUG */
-
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-#define vmemmap_can_optimize vmemmap_can_optimize
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
-#endif
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 2924604fbb38..63f369d296b4 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -978,16 +978,6 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 	return 0;
 }
 
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
-{
-	if (radix_enabled())
-		return __vmemmap_can_optimize(altmap, pgmap);
-
-	return false;
-}
-#endif
-
 int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 				unsigned long addr, unsigned long next)
 {
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 0e777d7dc332..7329fcacdaf4 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -24,6 +24,7 @@
 #include <linux/types.h>
 #include <linux/mman.h>
 #include <linux/mm.h>
+#include <linux/vmemmap-optimization.h>
 #include <linux/swap.h>
 #include <linux/stddef.h>
 #include <linux/vmalloc.h>
@@ -281,6 +282,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 	if (radix_enabled())
 		return radix__vmemmap_populate(start, end, node, altmap);
 #endif
+	section_vmemmap_optimization_disable(start, end);
 
 	return __vmemmap_populate(start, end, node, altmap);
 }
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
index 858311a71b0c..22e5a322be0b 100644
--- a/include/linux/vmemmap-optimization.h
+++ b/include/linux/vmemmap-optimization.h
@@ -63,6 +63,7 @@ static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
 }
 
 struct page *vmemmap_shared_tail_page(unsigned int order, struct zone *zone);
+void section_vmemmap_optimization_disable(unsigned long start, unsigned long end);
 #else
 static inline unsigned int section_compound_order(const struct mem_section *section)
 {
@@ -79,6 +80,11 @@ static inline void section_set_compound_order_range(unsigned long pfn,
 {
 }
 
+static inline void section_vmemmap_optimization_disable(unsigned long start,
+		unsigned long end)
+{
+}
+
 static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
 {
 	return 0;
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index b8b55e12f5ba..57aa5c2d8034 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -232,6 +232,23 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 
 	return page;
 }
+
+void __meminit section_vmemmap_optimization_disable(unsigned long start,
+		unsigned long end)
+{
+	unsigned long pfn = page_to_pfn((struct page *)start);
+	unsigned long nr_pages = (end - start) / sizeof(struct page);
+	struct mem_section *section = __pfn_to_section(pfn);
+
+	if (nr_pages < PAGES_PER_SECTION) {
+		VM_WARN_ON_ONCE(section_vmemmap_optimizable(section));
+		return;
+	}
+
+	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn, PAGES_PER_SECTION));
+	VM_WARN_ON_ONCE(nr_pages != PAGES_PER_SECTION);
+	section_set_compound_order(section, 0);
+}
 #endif
 
 static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2BEC0219A
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 20:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mbypDyTNTuVl4aFCAvZagHzVcr9sYdCZ5JRK/+o7CC8=; b=BrSDhLxDEWoXnI
	Ah6B8r0gH/E1csOhpDpN4vTBYp2/NPsLms8y8GZW358Sgdn9TFevYJAhyZUmfWA5prvh5C30aCkuN
	yP9vi9+8pd9hHqkvd3s9bkvFpoItTN9elJYAuRRJ1lBb8ZsspRoLqW4C4t+fahoaAM3/QN7I7gDRv
	5WfCBXFN17QKhyEIkgA2Xw5Hwg4AE3Z0Ln8661Yh7DxrKvjMj77Xp9lz+QI+suXgGtAvWQKXocZTp
	mXgJZdEwPqPKVYDXjAEEIF0INupIPlpTU4VkPAKvYH8yxdr7Me2vn8lCqZE18GTOFTaCGN6A6R8If
	qLnKpvLfvoba+U/gvgZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfP6U-00000001SXA-3AlE;
	Tue, 04 Feb 2025 20:01:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMqt-000000017oH-0v21;
	Tue, 04 Feb 2025 17:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pLFVRgBwiXf+T1hr1v6y3oXYvLLcOkmu5U12KRQmKlw=; b=P4xYveaFpJK9pc4gYL/1MF4dzW
	OI68Y+6LfrnXjxMEjr3ujkMVPExu3z1oH/mG9V4WeBQGdfdjabeLa9f/JZOiUhZzMOc2MVDYFBtkz
	07jWanDc8eOftyKMs/oyUAQQoNQtCVZN27FoUV/vgZoHqywT8fs5BBVKEPwT/jatiKB0rPfpxX/LI
	crsWWcS/ekyu+xU/GgAeIhtyF0lyqNN0LOsoInCOkHNkZvozssaqCR7tVJc7rz01BsTOUrSzvlUX3
	Iwj2VU1a3J3HNtXU8zQDebomjax0A1pYe/TRDPMVpGUahC6dg2fx/JcpFt3mIOsdMGY18LlhletTx
	YrLn4b0g==;
Received: from mgamail.intel.com ([198.175.65.20])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMqo-0000000GLyH-2l8W;
	Tue, 04 Feb 2025 17:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690602; x=1770226602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J5wZ/mcDbil10hn8JDYxev0M9sT2GI5gsQFk6+vTupM=;
  b=MD8u5pZwNV6nqI3Vfm0GYAZ+eL3Ow8ODROe0TRHcLWo9zrMsFhCij/8q
   bj8utFGBci7HoRGse9nF272zdpq6LvpfHC5ibfTWsqjEY3x+PCTdDXAAZ
   fzRI+qfx4qih+JhcO9yIiK8XovHShHMwSlt2ChAdl1F6AU8xLL4b4xtU+
   i4541dGSOQkQjGBVNIJzB1Hp7oxV0T0ZmhspRBUEVjnK8y8Z/ub0Ep72X
   QhWtaYQOhy1LyRWss8vDBe2rifyrn3TLojyFx5zjcOswcgXmv2XCD6s76
   mOWDOidcLXIk5ARlaTobuQx50AS0pTWbezDEt4cQ6XkinrWBCIPFXu8RQ
   Q==;
X-CSE-ConnectionGUID: 7QsrvLh3Q0yfxDVzJOstrw==
X-CSE-MsgGUID: 9AD/To2cQN6c5aT34AINbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930931"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930931"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:39 -0800
X-CSE-ConnectionGUID: euT5Fx0UQBaZT6g1J2Ba6Q==
X-CSE-MsgGUID: VDPCZKL7T1GLAmeyS4orWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866863"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:27 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: luto@kernel.org,
	xin@zytor.com,
	kirill.shutemov@linux.intel.com,
	palmer@dabbelt.com,
	tj@kernel.org,
	andreyknvl@gmail.com,
	brgerst@gmail.com,
	ardb@kernel.org,
	dave.hansen@linux.intel.com,
	jgross@suse.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	corbet@lwn.net,
	maciej.wieczor-retman@intel.com,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	ytcoode@gmail.com,
	tglx@linutronix.de,
	hpa@zytor.com,
	seanjc@google.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	justinstitt@google.com,
	jason.andryuk@amd.com,
	glider@google.com,
	ubizjak@gmail.com,
	jannh@google.com,
	bhe@redhat.com,
	vincenzo.frascino@arm.com,
	rafael.j.wysocki@intel.com,
	ndesaulniers@google.com,
	mingo@redhat.com,
	catalin.marinas@arm.com,
	junichi.nomura@nec.com,
	nathan@kernel.org,
	ryabinin.a.a@gmail.com,
	dennis@kernel.org,
	bp@alien8.de,
	kevinloughlin@google.com,
	morbo@google.com,
	dan.j.williams@intel.com,
	julian.stecklina@cyberus-technology.de,
	peterz@infradead.org,
	cl@linux.com,
	kees@kernel.org
Cc: kasan-dev@googlegroups.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH 10/15] x86: KASAN raw shadow memory PTE init
Date: Tue,  4 Feb 2025 18:33:51 +0100
Message-ID: <28ddfb1694b19278405b4934f37d398794409749.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_173643_087071_BFF6CEB2 
X-CRM114-Status: GOOD (  16.40  )
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

In KASAN's generic mode the default value in shadow memory is zero.
During initialization of shadow memory pages they are allocated and
zeroed.

In KASAN's tag-based mode the default tag for the arm64 architecture is
0xFE which corresponds to any memory that should not be accessed. On x86
(where tags are 4-bit wide instead of 8-bit wide) that tag is 0xE so
during the initializations all the bytes in shadow memory pages should
be filled with 0xE or 0xEE if two tags should be packed in one shadow
byte.

Use memblock_alloc_try_nid_raw() instead of memblock_alloc_try_nid() to
avoid zeroing out the memory so it can be set with the KASAN invalid
tag.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/mm/kasan_init_64.c | 19 ++++++++++++++++---
 include/linux/kasan.h       | 25 +++++++++++++++++++++++++
 mm/kasan/kasan.h            | 19 -------------------
 3 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 9dddf19a5571..55d468d83682 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -35,6 +35,18 @@ static __init void *early_alloc(size_t size, int nid, bool should_panic)
 	return ptr;
 }
 
+static __init void *early_raw_alloc(size_t size, int nid, bool should_panic)
+{
+	void *ptr = memblock_alloc_try_nid_raw(size, size,
+			__pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, nid);
+
+	if (!ptr && should_panic)
+		panic("%pS: Failed to allocate page, nid=%d from=%lx\n",
+		      (void *)_RET_IP_, nid, __pa(MAX_DMA_ADDRESS));
+
+	return ptr;
+}
+
 static void __init kasan_populate_pmd(pmd_t *pmd, unsigned long addr,
 				      unsigned long end, int nid)
 {
@@ -64,8 +76,9 @@ static void __init kasan_populate_pmd(pmd_t *pmd, unsigned long addr,
 		if (!pte_none(*pte))
 			continue;
 
-		p = early_alloc(PAGE_SIZE, nid, true);
-		entry = pfn_pte(PFN_DOWN(__pa(p)), PAGE_KERNEL);
+		p = early_raw_alloc(PAGE_SIZE, nid, true);
+		memset(p, PAGE_SIZE, kasan_dense_tag(KASAN_SHADOW_INIT));
+		entry = pfn_pte(PFN_DOWN(__pa_nodebug(p)), PAGE_KERNEL);
 		set_pte_at(&init_mm, addr, pte, entry);
 	} while (pte++, addr += PAGE_SIZE, addr != end);
 }
@@ -437,7 +450,7 @@ void __init kasan_init(void)
 	 * it may contain some garbage. Now we can clear and write protect it,
 	 * since after the TLB flush no one should write to it.
 	 */
-	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
+	kasan_poison(kasan_early_shadow_page, PAGE_SIZE, KASAN_SHADOW_INIT, false);
 	for (i = 0; i < PTRS_PER_PTE; i++) {
 		pte_t pte;
 		pgprot_t prot;
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 83146367170a..af8272c74409 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -151,6 +151,31 @@ static __always_inline void kasan_unpoison_range(const void *addr, size_t size)
 		__kasan_unpoison_range(addr, size);
 }
 
+#ifdef CONFIG_KASAN_HW_TAGS
+
+static inline void kasan_poison(const void *addr, size_t size, u8 value, bool init)
+{
+	if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
+		return;
+	if (WARN_ON(size & KASAN_GRANULE_MASK))
+		return;
+
+	hw_set_mem_tag_range(kasan_reset_tag(addr), size, value, init);
+}
+
+#else /* CONFIG_KASAN_HW_TAGS */
+
+/**
+ * kasan_poison - mark the memory range as inaccessible
+ * @addr - range start address, must be aligned to KASAN_GRANULE_SIZE
+ * @size - range size, must be aligned to KASAN_GRANULE_SIZE
+ * @value - value that's written to metadata for the range
+ * @init - whether to initialize the memory range (only for hardware tag-based)
+ */
+void kasan_poison(const void *addr, size_t size, u8 value, bool init);
+
+#endif /* CONFIG_KASAN_HW_TAGS */
+
 void __kasan_poison_pages(struct page *page, unsigned int order, bool init);
 static __always_inline void kasan_poison_pages(struct page *page,
 						unsigned int order, bool init)
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index a56aadd51485..2405477c5899 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -466,16 +466,6 @@ static inline u8 kasan_random_tag(void) { return 0; }
 
 #ifdef CONFIG_KASAN_HW_TAGS
 
-static inline void kasan_poison(const void *addr, size_t size, u8 value, bool init)
-{
-	if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
-		return;
-	if (WARN_ON(size & KASAN_GRANULE_MASK))
-		return;
-
-	hw_set_mem_tag_range(kasan_reset_tag(addr), size, value, init);
-}
-
 static inline void kasan_unpoison(const void *addr, size_t size, bool init)
 {
 	u8 tag = get_tag(addr);
@@ -497,15 +487,6 @@ static inline bool kasan_byte_accessible(const void *addr)
 
 #else /* CONFIG_KASAN_HW_TAGS */
 
-/**
- * kasan_poison - mark the memory range as inaccessible
- * @addr - range start address, must be aligned to KASAN_GRANULE_SIZE
- * @size - range size, must be aligned to KASAN_GRANULE_SIZE
- * @value - value that's written to metadata for the range
- * @init - whether to initialize the memory range (only for hardware tag-based)
- */
-void kasan_poison(const void *addr, size_t size, u8 value, bool init);
-
 /**
  * kasan_unpoison - mark the memory range as accessible
  * @addr - range start address, must be aligned to KASAN_GRANULE_SIZE
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30867C433E6
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 08:50:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AF3C64E9F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 08:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AF3C64E9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EsscZ8HTtq3GKHR1qFNbqCZmP+sKUkbyiekpUcz3/EM=; b=T7csrisg8NvOMTBcZfmjj0iF6
	H2PoOJ0BvPidBsHhb10ypTKGEs1KA9eYlik1ZjR0o0iKURBINs/kgZOGb+5oDkGuJV9KKAy8Bx/09
	AjUZi1JwgpMBr3B0QbnwTP4khpMY06UGNYGFeyQ4Gf4zA40xZ1XaKbFI/LnQWy+w6p39Vy8x6OB1K
	RXLYh0t4fHa7pNfT4cLq5Pu8FD2D4IiblRg6Dx2nsQcD0/w4hh9ux1sahJFn34Vj/9vGlijEHtAr8
	dIBrOjgjxrHgoOajaRdC0YmWvK9UfbVQ1/LkyMutdFAIJmJ9Qmwha70fGjA1ml01Qm9nmmYMCp9Aw
	JE/XJFvmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l92Fk-0005RQ-3W; Mon, 08 Feb 2021 08:50:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l92FV-0005Ij-1N; Mon, 08 Feb 2021 08:50:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A414F64EA1;
 Mon,  8 Feb 2021 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612774224;
 bh=wrI2rMtjzZoGbfKW1QrkASkJKao4ojPb3fDSKgc3WAw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cKVlgLrYTLipzNHMEWDLPLlLOxNDOwO4LObZgNUPjRa1k6j1p3a6xkl96y7osLJv9
 IVjIPBQYaNj5EEM4Q6JkZe2NuWo8i3ZApcxBVoQ5a0s30Gvq9HF5EDKumgg0gOSXw9
 NyKezWA8B1w/IMUtEUvus/vp0LuUGjICTqkux+6UOdXNuLmyVOManuI1tOdmfg9Dfj
 GoWhTvnrznyPfWiljbdcQUjEo642n/IBWkJhZ0aCDCSSmKstvKQl4Z4gkpM5bbJhV7
 xlqm6+3MuOIuHcPiRLmIuETKXZvXjPM14uCSrQfqXqA9EYxE8LakwYFPfM6sK6NfMs
 dK3PboCxG6HzA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v17 04/10] set_memory: allow set_direct_map_*_noflush() for
 multiple pages
Date: Mon,  8 Feb 2021 10:49:14 +0200
Message-Id: <20210208084920.2884-5-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210208084920.2884-1-rppt@kernel.org>
References: <20210208084920.2884-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_035025_353519_B60DBFBB 
X-CRM114-Status: GOOD (  21.99  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

The underlying implementations of set_direct_map_invalid_noflush() and
set_direct_map_default_noflush() allow updating multiple contiguous pages
at once.

Add numpages parameter to set_direct_map_*_noflush() to expose this
ability with these APIs.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>	[arm64]
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Christopher Lameter <cl@linux.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Elena Reshetova <elena.reshetova@intel.com>
Cc: Hagen Paul Pfeifer <hagen@jauu.net>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James Bottomley <jejb@linux.ibm.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Roman Gushchin <guro@fb.com>
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Tycho Andersen <tycho@tycho.ws>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/cacheflush.h |  4 ++--
 arch/arm64/mm/pageattr.c            | 10 ++++++----
 arch/riscv/include/asm/set_memory.h |  4 ++--
 arch/riscv/mm/pageattr.c            |  8 ++++----
 arch/x86/include/asm/set_memory.h   |  4 ++--
 arch/x86/mm/pat/set_memory.c        |  8 ++++----
 include/linux/set_memory.h          |  4 ++--
 kernel/power/snapshot.c             |  4 ++--
 mm/vmalloc.c                        |  5 +++--
 9 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 45217f21f1fe..d3598419a284 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -138,8 +138,8 @@ static __always_inline void __flush_icache_all(void)
 
 int set_memory_valid(unsigned long addr, int numpages, int enable);
 
-int set_direct_map_invalid_noflush(struct page *page);
-int set_direct_map_default_noflush(struct page *page);
+int set_direct_map_invalid_noflush(struct page *page, int numpages);
+int set_direct_map_default_noflush(struct page *page, int numpages);
 bool kernel_page_present(struct page *page);
 
 #include <asm-generic/cacheflush.h>
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 92eccaf595c8..b53ef37bf95a 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -148,34 +148,36 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
 					__pgprot(PTE_VALID));
 }
 
-int set_direct_map_invalid_noflush(struct page *page)
+int set_direct_map_invalid_noflush(struct page *page, int numpages)
 {
 	struct page_change_data data = {
 		.set_mask = __pgprot(0),
 		.clear_mask = __pgprot(PTE_VALID),
 	};
+	unsigned long size = PAGE_SIZE * numpages;
 
 	if (!debug_pagealloc_enabled() && !rodata_full)
 		return 0;
 
 	return apply_to_page_range(&init_mm,
 				   (unsigned long)page_address(page),
-				   PAGE_SIZE, change_page_range, &data);
+				   size, change_page_range, &data);
 }
 
-int set_direct_map_default_noflush(struct page *page)
+int set_direct_map_default_noflush(struct page *page, int numpages)
 {
 	struct page_change_data data = {
 		.set_mask = __pgprot(PTE_VALID | PTE_WRITE),
 		.clear_mask = __pgprot(PTE_RDONLY),
 	};
+	unsigned long size = PAGE_SIZE * numpages;
 
 	if (!debug_pagealloc_enabled() && !rodata_full)
 		return 0;
 
 	return apply_to_page_range(&init_mm,
 				   (unsigned long)page_address(page),
-				   PAGE_SIZE, change_page_range, &data);
+				   size, change_page_range, &data);
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 211eb8244a45..1aaf2720b8f6 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -26,8 +26,8 @@ static inline void protect_kernel_text_data(void) {};
 static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
 #endif
 
-int set_direct_map_invalid_noflush(struct page *page);
-int set_direct_map_default_noflush(struct page *page);
+int set_direct_map_invalid_noflush(struct page *page, int numpages);
+int set_direct_map_default_noflush(struct page *page, int numpages);
 bool kernel_page_present(struct page *page);
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 5e49e4b4a4cc..9618181b70be 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -156,11 +156,11 @@ int set_memory_nx(unsigned long addr, int numpages)
 	return __set_memory(addr, numpages, __pgprot(0), __pgprot(_PAGE_EXEC));
 }
 
-int set_direct_map_invalid_noflush(struct page *page)
+int set_direct_map_invalid_noflush(struct page *page, int numpages)
 {
 	int ret;
 	unsigned long start = (unsigned long)page_address(page);
-	unsigned long end = start + PAGE_SIZE;
+	unsigned long end = start + PAGE_SIZE * numpages;
 	struct pageattr_masks masks = {
 		.set_mask = __pgprot(0),
 		.clear_mask = __pgprot(_PAGE_PRESENT)
@@ -173,11 +173,11 @@ int set_direct_map_invalid_noflush(struct page *page)
 	return ret;
 }
 
-int set_direct_map_default_noflush(struct page *page)
+int set_direct_map_default_noflush(struct page *page, int numpages)
 {
 	int ret;
 	unsigned long start = (unsigned long)page_address(page);
-	unsigned long end = start + PAGE_SIZE;
+	unsigned long end = start + PAGE_SIZE * numpages;
 	struct pageattr_masks masks = {
 		.set_mask = PAGE_KERNEL,
 		.clear_mask = __pgprot(0)
diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 4352f08bfbb5..6224cb291f6c 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -80,8 +80,8 @@ int set_pages_wb(struct page *page, int numpages);
 int set_pages_ro(struct page *page, int numpages);
 int set_pages_rw(struct page *page, int numpages);
 
-int set_direct_map_invalid_noflush(struct page *page);
-int set_direct_map_default_noflush(struct page *page);
+int set_direct_map_invalid_noflush(struct page *page, int numpages);
+int set_direct_map_default_noflush(struct page *page, int numpages);
 bool kernel_page_present(struct page *page);
 
 extern int kernel_set_to_readonly;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 16f878c26667..d157fd617c99 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2184,14 +2184,14 @@ static int __set_pages_np(struct page *page, int numpages)
 	return __change_page_attr_set_clr(&cpa, 0);
 }
 
-int set_direct_map_invalid_noflush(struct page *page)
+int set_direct_map_invalid_noflush(struct page *page, int numpages)
 {
-	return __set_pages_np(page, 1);
+	return __set_pages_np(page, numpages);
 }
 
-int set_direct_map_default_noflush(struct page *page)
+int set_direct_map_default_noflush(struct page *page, int numpages)
 {
-	return __set_pages_p(page, 1);
+	return __set_pages_p(page, numpages);
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index fe1aa4e54680..c650f82db813 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -15,11 +15,11 @@ static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
 #endif
 
 #ifndef CONFIG_ARCH_HAS_SET_DIRECT_MAP
-static inline int set_direct_map_invalid_noflush(struct page *page)
+static inline int set_direct_map_invalid_noflush(struct page *page, int numpages)
 {
 	return 0;
 }
-static inline int set_direct_map_default_noflush(struct page *page)
+static inline int set_direct_map_default_noflush(struct page *page, int numpages)
 {
 	return 0;
 }
diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index d63560e1cf87..64b7aab9aee4 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -86,7 +86,7 @@ static inline void hibernate_restore_unprotect_page(void *page_address) {}
 static inline void hibernate_map_page(struct page *page)
 {
 	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
-		int ret = set_direct_map_default_noflush(page);
+		int ret = set_direct_map_default_noflush(page, 1);
 
 		if (ret)
 			pr_warn_once("Failed to remap page\n");
@@ -99,7 +99,7 @@ static inline void hibernate_unmap_page(struct page *page)
 {
 	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
 		unsigned long addr = (unsigned long)page_address(page);
-		int ret  = set_direct_map_invalid_noflush(page);
+		int ret = set_direct_map_invalid_noflush(page, 1);
 
 		if (ret)
 			pr_warn_once("Failed to remap page\n");
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index d5f2a84e488a..1da9cd1d0758 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2195,13 +2195,14 @@ struct vm_struct *remove_vm_area(const void *addr)
 }
 
 static inline void set_area_direct_map(const struct vm_struct *area,
-				       int (*set_direct_map)(struct page *page))
+				       int (*set_direct_map)(struct page *page,
+							     int numpages))
 {
 	int i;
 
 	for (i = 0; i < area->nr_pages; i++)
 		if (page_address(area->pages[i]))
-			set_direct_map(area->pages[i]);
+			set_direct_map(area->pages[i], 1);
 }
 
 /* Handle removing and resetting vm mappings related to the vm_struct. */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

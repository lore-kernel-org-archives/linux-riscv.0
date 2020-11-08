Return-Path: <SRS0=tI+f=EO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B898CC388F9
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2020 06:58:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A24E22240
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2020 06:58:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SUv8YY9U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1Y5DBsw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A24E22240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cLutNr9RN+6cmwZVXxXf8vIgi9jZ/CRXVO7RJYbhuqM=; b=SUv8YY9U/J69GMu+8rQcdGnsJ
	7p3++XekZDpraGh6lkD2rMX7eBf/Vcv1ylD0YefOB6kUNqpuddE0VLhLg4x4HkrsPdPoSjwAcL3Ls
	MPhSuPwHIvvLlfjKCoXVVk5nys8Zr0cFLthbiXuxHzOx8b/XuUOE2sK+t81c4zGA+aQ+bFPHqCpxI
	7YdQ6A4Y8+ZUe1BAw+dpmHNUxpta8cQ96O/P4b1mFsIY2gT6XojRRHAPwEY8vsuN/ojfGSb0LyTV+
	vT8NQwlPNqD2vd4ZAxTQi8ok2h+NBtnlMI59KG8Sym/gTYM9X2Xxyx5a1zqwZVm4poQ2FBi4SGE4t
	ZLrzzZQYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbeej-0004sw-Mk; Sun, 08 Nov 2020 06:58:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbeee-0004r0-Cu; Sun, 08 Nov 2020 06:58:25 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48F71221FE;
 Sun,  8 Nov 2020 06:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604818703;
 bh=590zK77IIK/GRU0iesSEW1g1nAaxcF2LlciXyBdNWeI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S1Y5DBswnJRHvAhvlNmC6rXkkgTQxCugaaOkUKj5K5HgitkS61OQ0AYHixTLTqX7c
 AsmYAXrwvk4Jm9jm5qdYR9OjHM/USSXU7ddTb6jnhZOcumAy1eP1nZ3lLOSywTmN7K
 RZjefYfRwtk+pch6QAA8dQU6ZB0oI3gOHb8aaSxU=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 1/5] mm: introduce debug_pagealloc_{map,
 unmap}_pages() helpers
Date: Sun,  8 Nov 2020 08:57:54 +0200
Message-Id: <20201108065758.1815-2-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201108065758.1815-1-rppt@kernel.org>
References: <20201108065758.1815-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_015824_576590_CD69CD7A 
X-CRM114-Status: GOOD (  24.36  )
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

When CONFIG_DEBUG_PAGEALLOC is enabled, it unmaps pages from the kernel
direct mapping after free_pages(). The pages than need to be mapped back
before they could be used. Theese mapping operations use
__kernel_map_pages() guarded with with debug_pagealloc_enabled().

The only place that calls __kernel_map_pages() without checking whether
DEBUG_PAGEALLOC is enabled is the hibernation code that presumes
availability of this function when ARCH_HAS_SET_DIRECT_MAP is set.
Still, on arm64, __kernel_map_pages() will bail out when DEBUG_PAGEALLOC is
not enabled but set_direct_map_invalid_noflush() may render some pages not
present in the direct map and hibernation code won't be able to save such
pages.

To make page allocation debugging and hibernation interaction more robust,
the dependency on DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP has to be made
more explicit.

Start with combining the guard condition and the call to
__kernel_map_pages() into debug_pagealloc_map_pages() and
debug_pagealloc_unmap_pages() functions to emphasize that
__kernel_map_pages() should not be called without DEBUG_PAGEALLOC and use
these new functions to map/unmap pages when page allocation debugging is
enabled.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mm.h  | 15 +++++++++++++++
 mm/memory_hotplug.c |  3 +--
 mm/page_alloc.c     |  6 ++----
 mm/slab.c           | 16 +++++++---------
 4 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ef360fe70aaf..bb8c70178f4e 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2936,12 +2936,27 @@ kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	__kernel_map_pages(page, numpages, enable);
 }
+
+static inline void debug_pagealloc_map_pages(struct page *page, int numpages)
+{
+	if (debug_pagealloc_enabled_static())
+		__kernel_map_pages(page, numpages, 1);
+}
+
+static inline void debug_pagealloc_unmap_pages(struct page *page, int numpages)
+{
+	if (debug_pagealloc_enabled_static())
+		__kernel_map_pages(page, numpages, 0);
+}
+
 #ifdef CONFIG_HIBERNATION
 extern bool kernel_page_present(struct page *page);
 #endif	/* CONFIG_HIBERNATION */
 #else	/* CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 static inline void
 kernel_map_pages(struct page *page, int numpages, int enable) {}
+static inline void debug_pagealloc_map_pages(struct page *page, int numpages) {}
+static inline void debug_pagealloc_unmap_pages(struct page *page, int numpages) {}
 #ifdef CONFIG_HIBERNATION
 static inline bool kernel_page_present(struct page *page) { return true; }
 #endif	/* CONFIG_HIBERNATION */
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b44d4c7ba73b..f18f86ba2a68 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -614,8 +614,7 @@ void generic_online_page(struct page *page, unsigned int order)
 	 * so we should map it first. This is better than introducing a special
 	 * case in page freeing fast path.
 	 */
-	if (debug_pagealloc_enabled_static())
-		kernel_map_pages(page, 1 << order, 1);
+	debug_pagealloc_map_pages(page, 1 << order);
 	__free_pages_core(page, order);
 	totalram_pages_add(1UL << order);
 #ifdef CONFIG_HIGHMEM
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 23f5066bd4a5..db1bf70458d0 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1272,8 +1272,7 @@ static __always_inline bool free_pages_prepare(struct page *page,
 	 */
 	arch_free_page(page, order);
 
-	if (debug_pagealloc_enabled_static())
-		kernel_map_pages(page, 1 << order, 0);
+	debug_pagealloc_unmap_pages(page, 1 << order);
 
 	kasan_free_nondeferred_pages(page, order);
 
@@ -2270,8 +2269,7 @@ inline void post_alloc_hook(struct page *page, unsigned int order,
 	set_page_refcounted(page);
 
 	arch_alloc_page(page, order);
-	if (debug_pagealloc_enabled_static())
-		kernel_map_pages(page, 1 << order, 1);
+	debug_pagealloc_map_pages(page, 1 << order);
 	kasan_alloc_pages(page, order);
 	kernel_poison_pages(page, 1 << order, 1);
 	set_page_owner(page, order, gfp_flags);
diff --git a/mm/slab.c b/mm/slab.c
index b1113561b98b..07317386e150 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -1428,21 +1428,19 @@ static bool is_debug_pagealloc_cache(struct kmem_cache *cachep)
 	return false;
 }
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
 static void slab_kernel_map(struct kmem_cache *cachep, void *objp, int map)
 {
 	if (!is_debug_pagealloc_cache(cachep))
 		return;
 
-	kernel_map_pages(virt_to_page(objp), cachep->size / PAGE_SIZE, map);
+	if (map)
+		debug_pagealloc_map_pages(virt_to_page(objp),
+					  cachep->size / PAGE_SIZE);
+	else
+		debug_pagealloc_unmap_pages(virt_to_page(objp),
+					    cachep->size / PAGE_SIZE);
 }
 
-#else
-static inline void slab_kernel_map(struct kmem_cache *cachep, void *objp,
-				int map) {}
-
-#endif
-
 static void poison_obj(struct kmem_cache *cachep, void *addr, unsigned char val)
 {
 	int size = cachep->object_size;
@@ -2062,7 +2060,7 @@ int __kmem_cache_create(struct kmem_cache *cachep, slab_flags_t flags)
 
 #if DEBUG
 	/*
-	 * If we're going to use the generic kernel_map_pages()
+	 * If we're going to use the generic debug_pagealloc_map_pages()
 	 * poisoning, then it's going to smash the contents of
 	 * the redzone and userword anyhow, so switch them off.
 	 */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

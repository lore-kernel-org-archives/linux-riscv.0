Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6F7C001CC
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xgeye/n6gEC+lioONfPfeQ05h0jheakiXgERyd0GvMo=; b=oFGNJreLNtYs+G
	d1LrOkgZpyZ/ptMmI5ey/j8Wzs9e2wMBQr7E04yMeeV8wfjVfak7AToPd6Xph+nCy5LmA/4P9BtuH
	tMbPnSdWqGTH6ei2qatar8WCSUOSuEoB299Jzqm0W7+gQTdVk/zyv30PIze+UuaY/MUVOelxOmU4X
	ZeBy2jFBXp0jc3zsiMeLOPo1Fnz5Lwmz7YJqUQTDoqBd/hrza/V0QdKEQCrusivc6fTNkmFP5bIqv
	psJ/FxNrjoQYdzwShnzt4sguYdLX74EZQrdO52Rm67K8yNcUC6cNqbI0BFy5cKltmXNE0DtDlJq0g
	tN1enY/1tLF3umrsofDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwxo-0000000CxSA-2akr;
	Thu, 11 Apr 2024 16:07:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwwk-0000000Cwe5-0b4z;
	Thu, 11 Apr 2024 16:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1oLeYW4kNqv356U1vzmep8d+NvSaDxFlgcEZlsaSopY=; b=LvHbS26KxXiKzVRWNIzMDzAzrq
	R3wmLVZMfng9Q/nZucc00unzduL2iBlWD7M3GdddNVhw2RNQCQD8j5rFetS9cvjbRTkgJqNZ+wgVc
	aQTyUJL9+knkZY2KffKAZanFx+kpVCjtIOyhkuWvAuR51d/kDgFSxuJXZP2gLe0H09WT1VAtjkSdG
	h5R/4uuZRaBS14Xcg/Z7g3UiOso4NF9Hjt9fS5QQ7aGuqS1SYI82v0TPCZfvhaMRt1AlqjwEMj2/e
	Ptb2MH5/sMtKY1PJIHq5k0JKl23NAKXZ7nwAL6D1SDcKBD3mJ6nQm+ZKT0vTW2St/jR+LRwPPt2Yy
	8o5CpsgQ==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwwg-00000008hFv-0dXn;
	Thu, 11 Apr 2024 16:06:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BC1D7CE17B0;
	Thu, 11 Apr 2024 16:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEAFC113CD;
	Thu, 11 Apr 2024 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851594;
	bh=FzXFJSmb6FPYptE+tJEPsseMYyGfozQQhnGqwpvvWSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jgfDWV+kGnsVbXX4csXun1AXMBmRYtUhZyOYrmoXgqBXVZt0vYKNVnTNCAQEGOZf1
	 63C3Y2YATnhkd3fsJ7ynR6ExQsaOg5XSxMIi42VqOYQdnHjG3O79uTgW4oXlf1R9Gt
	 FHiNX9BiBg6uFHUNBZ8IfTJGYVZSeoquZk16BDVZjM5CwBNMoFy+7Wi9H150mRg9JS
	 CDcPK65or1p/QJwGKWJuUbTDXNT+joIdWuAt4AiweUmYb0xSdD5p6o/4lWaCTk1PdA
	 MNcxCn3pWEjarSozP7y/oxjgXvkg26U7ZofIVv33IMc4avvZLsf4M7hXrB0PgcsNpD
	 F9tI/iyfZnPYQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [RFC PATCH 6/7] execmem: add support for cache of large ROX pages
Date: Thu, 11 Apr 2024 19:05:25 +0300
Message-ID: <20240411160526.2093408-7-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411160526.2093408-1-rppt@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_170638_841996_FB03E20B 
X-CRM114-Status: GOOD (  23.74  )
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

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Using large pages to map text areas reduces iTLB pressure and improves
performance.

Extend execmem_alloc() with an ability to use PMD_SIZE'ed pages with ROX
permissions as a cache for smaller allocations.

To populate the cache, a writable large page is allocated from vmalloc with
VM_ALLOW_HUGE_VMAP, filled with invalid instructions and then remapped as
ROX.

Portions of that large page are handed out to execmem_alloc() callers
without any changes to the permissions.

When the memory is freed with execmem_free() it is invalidated again so
that it won't contain stale instructions.

The cache is enabled when an architecture sets EXECMEM_ROX_CACHE flag in
definition of an execmem_range.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/execmem.h |   2 +
 mm/execmem.c            | 267 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 262 insertions(+), 7 deletions(-)

diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 9d22999dbd7d..06f678e6fe55 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -77,12 +77,14 @@ struct execmem_range {
 
 /**
  * struct execmem_info - architecture parameters for code allocations
+ * @invalidate: set memory to contain invalid instructions
  * @ranges: array of parameter sets defining architecture specific
  * parameters for executable memory allocations. The ranges that are not
  * explicitly initialized by an architecture use parameters defined for
  * @EXECMEM_DEFAULT.
  */
 struct execmem_info {
+	void (*invalidate)(void *ptr, size_t size, bool writable);
 	struct execmem_range	ranges[EXECMEM_TYPE_MAX];
 };
 
diff --git a/mm/execmem.c b/mm/execmem.c
index c920d2b5a721..716fba68ab0e 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -1,30 +1,88 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/mm.h>
+#include <linux/mutex.h>
 #include <linux/vmalloc.h>
 #include <linux/execmem.h>
+#include <linux/maple_tree.h>
 #include <linux/moduleloader.h>
 #include <linux/text-patching.h>
 
+#include <asm/tlbflush.h>
+
+#include "internal.h"
+
 static struct execmem_info *execmem_info __ro_after_init;
 static struct execmem_info default_execmem_info __ro_after_init;
 
-static void *__execmem_alloc(struct execmem_range *range, size_t size)
+struct execmem_cache {
+	struct mutex mutex;
+	struct maple_tree busy_areas;
+	struct maple_tree free_areas;
+};
+
+static struct execmem_cache execmem_cache = {
+	.mutex = __MUTEX_INITIALIZER(execmem_cache.mutex),
+	.busy_areas = MTREE_INIT_EXT(busy_areas, MT_FLAGS_LOCK_EXTERN,
+				     execmem_cache.mutex),
+	.free_areas = MTREE_INIT_EXT(free_areas, MT_FLAGS_LOCK_EXTERN,
+				     execmem_cache.mutex),
+};
+
+static void execmem_cache_clean(struct work_struct *work)
+{
+	struct maple_tree *free_areas = &execmem_cache.free_areas;
+	struct mutex *mutex = &execmem_cache.mutex;
+	MA_STATE(mas, free_areas, 0, ULONG_MAX);
+	void *area;
+
+	mutex_lock(mutex);
+	mas_for_each(&mas, area, ULONG_MAX) {
+		size_t size;
+
+		if (!xa_is_value(area))
+			continue;
+
+		size = xa_to_value(area);
+
+		if (IS_ALIGNED(size, PMD_SIZE) && IS_ALIGNED(mas.index, PMD_SIZE)) {
+			void *ptr = (void *)mas.index;
+
+			mas_erase(&mas);
+			vfree(ptr);
+		}
+	}
+	mutex_unlock(mutex);
+}
+
+static DECLARE_WORK(execmem_cache_clean_work, execmem_cache_clean);
+
+static void execmem_invalidate(void *ptr, size_t size, bool writable)
+{
+	if (execmem_info->invalidate)
+		execmem_info->invalidate(ptr, size, writable);
+	else
+		memset(ptr, 0, size);
+}
+
+static void *execmem_vmalloc(struct execmem_range *range, size_t size,
+			     pgprot_t pgprot, unsigned long vm_flags)
 {
 	bool kasan = range->flags & EXECMEM_KASAN_SHADOW;
-	unsigned long vm_flags  = VM_FLUSH_RESET_PERMS;
 	gfp_t gfp_flags = GFP_KERNEL | __GFP_NOWARN;
+	unsigned int align = range->alignment;
 	unsigned long start = range->start;
 	unsigned long end = range->end;
-	unsigned int align = range->alignment;
-	pgprot_t pgprot = range->pgprot;
 	void *p;
 
 	if (kasan)
 		vm_flags |= VM_DEFER_KMEMLEAK;
 
-	p = __vmalloc_node_range(size, align, start, end, gfp_flags,
-				 pgprot, vm_flags, NUMA_NO_NODE,
+	if (vm_flags & VM_ALLOW_HUGE_VMAP)
+		align = PMD_SIZE;
+
+	p = __vmalloc_node_range(size, align, start, end, gfp_flags, pgprot,
+				 vm_flags, NUMA_NO_NODE,
 				 __builtin_return_address(0));
 	if (!p && range->fallback_start) {
 		start = range->fallback_start;
@@ -44,6 +102,199 @@ static void *__execmem_alloc(struct execmem_range *range, size_t size)
 		return NULL;
 	}
 
+	return p;
+}
+
+static int execmem_cache_add(void *ptr, size_t size)
+{
+	struct maple_tree *free_areas = &execmem_cache.free_areas;
+	struct mutex *mutex = &execmem_cache.mutex;
+	unsigned long addr = (unsigned long)ptr;
+	MA_STATE(mas, free_areas, addr - 1, addr + 1);
+	unsigned long lower, lower_size = 0;
+	unsigned long upper, upper_size = 0;
+	unsigned long area_size;
+	void *area = NULL;
+	int err;
+
+	lower = addr;
+	upper = addr + size - 1;
+
+	mutex_lock(mutex);
+	area = mas_walk(&mas);
+	if (area && xa_is_value(area) && mas.last == addr - 1) {
+		lower = mas.index;
+		lower_size = xa_to_value(area);
+	}
+
+	area = mas_next(&mas, ULONG_MAX);
+	if (area && xa_is_value(area) && mas.index == addr + size) {
+		upper = mas.last;
+		upper_size = xa_to_value(area);
+	}
+
+	mas_set_range(&mas, lower, upper);
+	area_size = lower_size + upper_size + size;
+	err = mas_store_gfp(&mas, xa_mk_value(area_size), GFP_KERNEL);
+	mutex_unlock(mutex);
+	if (err)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void *__execmem_cache_alloc(size_t size)
+{
+	struct maple_tree *free_areas = &execmem_cache.free_areas;
+	struct maple_tree *busy_areas = &execmem_cache.busy_areas;
+	MA_STATE(mas_free, free_areas, 0, ULONG_MAX);
+	MA_STATE(mas_busy, busy_areas, 0, ULONG_MAX);
+	struct mutex *mutex = &execmem_cache.mutex;
+	unsigned long addr, last, area_size = 0;
+	void *area, *ptr = NULL;
+	int err;
+
+	mutex_lock(mutex);
+	mas_for_each(&mas_free, area, ULONG_MAX) {
+		area_size = xa_to_value(area);
+		if (area_size >= size)
+			break;
+	}
+
+	if (area_size < size)
+		goto out_unlock;
+
+	addr = mas_free.index;
+	last = mas_free.last;
+
+	/* insert allocated size to busy_areas at range [addr, addr + size) */
+	mas_set_range(&mas_busy, addr, addr + size - 1);
+	err = mas_store_gfp(&mas_busy, xa_mk_value(size), GFP_KERNEL);
+	if (err)
+		goto out_unlock;
+
+	mas_erase(&mas_free);
+	if (area_size > size) {
+		/*
+		 * re-insert remaining free size to free_areas at range
+		 * [addr + size, last]
+		 */
+		mas_set_range(&mas_free, addr + size, last);
+		size = area_size - size;
+		err = mas_store_gfp(&mas_free, xa_mk_value(size), GFP_KERNEL);
+		if (err) {
+			mas_erase(&mas_busy);
+			goto out_unlock;
+		}
+	}
+	ptr = (void *)addr;
+
+out_unlock:
+	mutex_unlock(mutex);
+	return ptr;
+}
+
+static int execmem_cache_populate(struct execmem_range *range, size_t size)
+{
+	unsigned long vm_flags = VM_FLUSH_RESET_PERMS | VM_ALLOW_HUGE_VMAP;
+	unsigned long start, end;
+	struct vm_struct *vm;
+	size_t alloc_size;
+	int err = -ENOMEM;
+	void *p;
+
+	alloc_size = round_up(size, PMD_SIZE);
+	p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);
+	if (!p)
+		return err;
+
+	vm = find_vm_area(p);
+	if (!vm)
+		goto err_free_mem;
+
+	/* fill memory with invalid instructions */
+	execmem_invalidate(p, alloc_size, /* writable = */ true);
+
+	start = (unsigned long)p;
+	end = start + alloc_size;
+
+	vunmap_range_noflush(start, end);
+	flush_tlb_kernel_range(start, end);
+
+	/* FIXME: handle direct map alias */
+
+	err = vmap_pages_range_noflush(start, end, range->pgprot, vm->pages,
+				       PMD_SHIFT);
+	if (err)
+		goto err_free_mem;
+
+	err = execmem_cache_add(p, alloc_size);
+	if (err)
+		goto err_free_mem;
+
+	return 0;
+
+err_free_mem:
+	vfree(p);
+	return err;
+}
+
+static void *execmem_cache_alloc(struct execmem_range *range, size_t size)
+{
+	void *p;
+	int err;
+
+	p = __execmem_cache_alloc(size);
+	if (p)
+		return p;
+
+	err = execmem_cache_populate(range, size);
+	if (err)
+		return NULL;
+
+	return __execmem_cache_alloc(size);
+}
+
+static bool execmem_cache_free(void *ptr)
+{
+	struct maple_tree *busy_areas = &execmem_cache.busy_areas;
+	struct mutex *mutex = &execmem_cache.mutex;
+	unsigned long addr = (unsigned long)ptr;
+	MA_STATE(mas, busy_areas, addr, addr);
+	size_t size;
+	void *area;
+
+	mutex_lock(mutex);
+	area = mas_walk(&mas);
+	if (!area) {
+		mutex_unlock(mutex);
+		return false;
+	}
+	size = xa_to_value(area);
+	mas_erase(&mas);
+	mutex_unlock(mutex);
+
+	execmem_invalidate(ptr, size, /* writable = */ false);
+
+	execmem_cache_add(ptr, size);
+
+	schedule_work(&execmem_cache_clean_work);
+
+	return true;
+}
+
+static void *__execmem_alloc(struct execmem_range *range, size_t size)
+{
+	bool use_cache = range->flags & EXECMEM_ROX_CACHE;
+	unsigned long vm_flags = VM_FLUSH_RESET_PERMS;
+	pgprot_t pgprot = range->pgprot;
+	void *p;
+
+	if (use_cache)
+		p = execmem_cache_alloc(range, size);
+	else
+		p = execmem_vmalloc(range, size, pgprot, vm_flags);
+
 	return kasan_reset_tag(p);
 }
 
@@ -61,7 +312,9 @@ void execmem_free(void *ptr)
 	 * supported by vmalloc.
 	 */
 	WARN_ON(in_interrupt());
-	vfree(ptr);
+
+	if (!execmem_cache_free(ptr))
+		vfree(ptr);
 }
 
 void *execmem_update_copy(void *dst, const void *src, size_t size)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

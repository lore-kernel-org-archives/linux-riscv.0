Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533E8C531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 22:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DeqXh9TgTHSfdYopFifpOZRYCfKRsqQ9p19SsFfUudc=; b=TEyX/3iza12Rx/
	BoG/oW0Q6iIH/4craUjU/D2ndbZ5rEVgygWzvt7zXrNlb6V2bDVdE5W9bxGgJvkf/7+gxU0XJXtc+
	vFdqqPbQgKQFvC9U/CTLl//02BA4gijRYjlfDKA7qiyw80xJEdO3Q/GAGHhOr6HX+wJuxmqa1zUax
	m3UuRQH3xiYz6e23CJFo6G07/KY46Hx67TUVEyd90CVfhmBmz1kpyQYG8f47NBR3sKvvm8P5CEGci
	kmQqVeeTSDF/VKEQq13bBRTbdOvazzveKoPcaWCaslJylSxOTnxBui5qBBB27VmweKdFSdAnkf1+I
	8edLkQT+52m2aRLjJygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnORz-0000000HJly-1Sb3;
	Fri, 24 Jul 2026 22:33:03 +0000
Received: from shelob.surriel.com ([96.67.55.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnORx-0000000HJlP-049M
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 22:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IF4h0IOGesCPD6JnizKVFYQDqwHWpzKQAHqpitemykk=; b=DwRMlYPQpIsFsEsXZzPPL3sxm/
	XwEli1sW2qLlJIwTseXX2o/q1glQCXOW/6qb3eWO+YB9NsZJ21DXr8JDOmcD4G8gCuqrbySUNPK0X
	AeN9ZFPsQawYFLRUwxaTF0qcs/+YwkcQm3g17KMh1EuuHv6EHqkdEfHW5IDK3KUSQ5zpTkQ75MAe7
	xMin7ON9QwNgwRZWPvemLN7ReOBz/2+blnX+hqbzOcZ+CVBqoJItKziZOvlfBfywfefvI80kHSH7u
	48Irw4hOCzBUYEdb5XsYKbjnzXSQK4vHCnAHc0nabbE43UPB8NzmeRB55+/i970oo+hEwo0d6bduS
	oRzqlBOA==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1wnOOs-0000000027h-14Iy;
	Fri, 24 Jul 2026 18:29:50 -0400
From: Rik van Riel <riel@surriel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Rik van Riel <riel@surriel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC v4 02/12] riscv/mm: add untagged_addr_remote_unlocked()
Date: Fri, 24 Jul 2026 18:29:24 -0400
Message-ID: <20260724222934.1463812-3-riel@surriel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724222934.1463812-1-riel@surriel.com>
References: <20260724222934.1463812-1-riel@surriel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_153301_081335_8D7F882F 
X-CRM114-Status: GOOD (  14.72  )
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

__access_remote_vm() reads another task's memory under the mmap lock. That
lock is contended on large multi-threaded workloads, where an mmap() or
munmap() stalls readers like /proc/PID/cmdline or process_vm_readv() even
though the target memory is resident and reachable under the per-VMA lock.

Reaching it under the per-VMA lock means looking up the VMA first, which
requires untagging the remote address without the mmap lock. riscv's
untagged_addr_remote() asserts that lock and has no unlocked variant; the
generic untagged_addr_remote_unlocked() falls back to untagged_addr(),
which masks against current->mm, not the target mm.

Add untagged_addr_remote_unlocked(), which masks @addr against the target
mm without asserting the lock, and redefine untagged_addr_remote() on top
of it so it keeps the assertion.

The mask width is mm->context.pmlen, written while a program is single
threaded, and frozen with MM_CONTEXT_LOCK_PMLEN once it spawns a second
thread.

That read need not be stable: pmlen is already read locklessly by
untagged_addr() and mm_untag_mask(), and a remote untag is best-effort.
Annotate the lockless reads with READ_ONCE() and the writes with
WRITE_ONCE(), so a reader sees one whole value and the accesses are
KCSAN-clean.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/riscv/include/asm/mmu_context.h |  4 ++--
 arch/riscv/include/asm/uaccess.h     | 10 +++++++---
 arch/riscv/kernel/process.c          | 12 +++++++-----
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index dbf27a78df6c..3ce16796e5a2 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -21,7 +21,7 @@ static inline void activate_mm(struct mm_struct *prev,
 			       struct mm_struct *next)
 {
 #ifdef CONFIG_RISCV_ISA_SUPM
-	next->context.pmlen = 0;
+	WRITE_ONCE(next->context.pmlen, 0);
 #endif
 	switch_mm(prev, next, NULL);
 }
@@ -44,7 +44,7 @@ DECLARE_STATIC_KEY_FALSE(use_asid_allocator);
 #define mm_untag_mask mm_untag_mask
 static inline unsigned long mm_untag_mask(struct mm_struct *mm)
 {
-	return -1UL >> mm->context.pmlen;
+	return -1UL >> READ_ONCE(mm->context.pmlen);
 }
 #endif
 
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 5d4ec15584cf..53806e0f7dcf 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -16,7 +16,7 @@
 static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigned long addr)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM)) {
-		u8 pmlen = mm->context.pmlen;
+		u8 pmlen = READ_ONCE(mm->context.pmlen);
 
 		/* Virtual addresses are sign-extended; physical addresses are zero-extended. */
 		if (IS_ENABLED(CONFIG_MMU))
@@ -33,12 +33,16 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
 	(__force __typeof__(addr))__untagged_addr_remote(current->mm, __addr);	\
 })
 
-#define untagged_addr_remote(mm, addr) ({					\
+#define untagged_addr_remote_unlocked(mm, addr) ({				\
 	unsigned long __addr = (__force unsigned long)(addr);			\
-	mmap_assert_locked(mm);							\
 	(__force __typeof__(addr))__untagged_addr_remote(mm, __addr);		\
 })
 
+#define untagged_addr_remote(mm, addr) ({					\
+	mmap_assert_locked(mm);							\
+	untagged_addr_remote_unlocked(mm, addr);				\
+})
+
 #define access_ok(addr, size) likely(__access_ok(untagged_addr(addr), size))
 #else
 #define untagged_addr(addr) (addr)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a..6ae7552fed09 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -357,13 +357,15 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg)
 	if (mmap_write_lock_killable(mm))
 		return -EINTR;
 
-	if (test_bit(MM_CONTEXT_LOCK_PMLEN, &mm->context.flags) && mm->context.pmlen != pmlen) {
-		mmap_write_unlock(mm);
-		return -EBUSY;
+	if (test_bit(MM_CONTEXT_LOCK_PMLEN, &mm->context.flags)) {
+		if (READ_ONCE(mm->context.pmlen) != pmlen) {
+			mmap_write_unlock(mm);
+			return -EBUSY;
+		}
 	}
 
 	envcfg_update_bits(task, ENVCFG_PMM, pmm);
-	mm->context.pmlen = pmlen;
+	WRITE_ONCE(mm->context.pmlen, pmlen);
 
 	mmap_write_unlock(mm);
 
@@ -394,7 +396,7 @@ long get_tagged_addr_ctrl(struct task_struct *task)
 		break;
 	}
 
-	if (task->mm->context.pmlen)
+	if (READ_ONCE(task->mm->context.pmlen))
 		ret |= PR_TAGGED_ADDR_ENABLE;
 
 	return ret;
-- 
2.53.0-Meta


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

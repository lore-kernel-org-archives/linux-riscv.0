Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BAAC44515
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 17:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8XVilQHNZEoI8rVXMkhdgOE1CWefUMuPgiloA+Ub3c=; b=gUID5tSmMiS/Fm
	wEN1ueZBodc0xYR3imHGNTdca04HrFQ/TPBrbMM8SgvKPyXawhuozm0B9+hAtnYq67u5E1FezwAB7
	VXMzCEmgZVuJGbkYziUTRIPt4vIm1+zglvHKGFUOd/SoTiH1IXYl/OBz3/CxKqWMU8WObDG5ZI2nP
	64NdbwUqFwdyI96UUuY/mVjriNcUEUcnjmUES65RG1B2+8qCZ5vznA1crCWTcjbLkib+2B/1mZL7R
	hg0GF7/98muGv59e65gJzPNGl6agqdqCyqjzsCeYDCJNHyDrBcB0Wz5IgzCNSgPWyVwdzcU4MNj4g
	fPWVxnuvJsKuWbh/v+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklwE-00000002ng9-03J4;
	Fri, 17 Jul 2026 17:01:26 +0000
Received: from shelob.surriel.com ([96.67.55.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklwB-00000002nfD-1mPJ
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 17:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=g3vbKYZxRsDMfVpHBxPVOyxjBlSbaKA9GcdBzuhy8/M=; b=XMjTuISn/VdlNzVWcRsravLbi+
	hkm1J4NIe32NGtJ/rpWfaJWjH8D3byPUvCx2Ep3/yG+yt2xCVZMtqVpq8gZpHQsbh9iym/67wN+lA
	AkBJFCYjoPUHE2exwMEyZUSMaW6xyxpezzSRV60t6ynJO4+YvOrGE33wfARHZm/ZxrvkfrcJr/H+w
	AbBMHegmNPgTO24/Zh3o/6OKRsqZ5Q2svwFm82Ln5N9ol24MwTbvJ8pvmCZ1vrqnVqFrgXmtuKCnw
	9i8ALaPLZqrixvZNaZsMgrrdjRL4569xiHMD+rtQKmSgjeKoTq7zLx2RCPLv5nJvr4iC//wmWo9qS
	v9oLlYZg==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1wklvS-000000001w4-0K81;
	Fri, 17 Jul 2026 13:00:38 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-team@meta.com,
	Rik van Riel <riel@surriel.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC v3 2/6] riscv/mm: add untagged_addr_remote_unlocked()
Date: Fri, 17 Jul 2026 13:00:32 -0400
Message-ID: <20260717170036.743149-3-riel@surriel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717170036.743149-1-riel@surriel.com>
References: <20260717170036.743149-1-riel@surriel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_100123_465337_C900D167 
X-CRM114-Status: GOOD (  13.55  )
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

__access_remote_vm() untags the remote address before looking up the VMA,
now without holding the mmap lock. riscv defines untagged_addr_remote() but
not untagged_addr_remote_unlocked(), so it falls back to the generic
version, which untags with untagged_addr().

That reads current->mm, not the target mm, so a remote access to a process
using pointer masking would untag with the wrong mask.

mm->context.pmlen is set only through PR_SET_TAGGED_ADDR_CTRL and is stable
afterwards, so it can be read without the mmap lock, as it already is from
untagged_addr() and mm_untag_mask().

Add untagged_addr_remote_unlocked(), which untags against the target mm,
and annotate context.pmlen accesses with READ_ONCE() and WRITE_ONCE() so
the lockless reads are explicit and KCSAN-clean. untagged_addr_remote()
keeps its mmap_assert_locked() and shares the code.

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

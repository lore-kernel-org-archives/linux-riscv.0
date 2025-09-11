Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B713ACAC595
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 09:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09Aa2ln6JYU0bHanQAdkXBJYtXWinHhjd2vmI7OEYmE=; b=t82LAay8ckyIBn
	0EdOsvYGzH9+7uZcemak+/3L1m+kIz6WJoGyex/UTCJapRvXRysSyV7AkfeoTML8aCs0Mt+wM0XN4
	489Z5Wp9CewrmUiL34t/wk7VWsy1WdLK+AddcqORD4PdihNfE1oNCYj9z5uJ4fL5k9vygi0r+7X7J
	0pKM1y9+J9i1TsIc/aQSPKP2n4R4Zaz1Qf1faZFXNVWiDHzmTTj7dF3uooF/QpN28IcvJu55V7++9
	aREiCTFZLnDqhqg2BN2HOzCVa2X0yKtc31MMBcNob/ibI+4hHF2Ekhs3/qTIOU4bTPdxwP+iMGKkP
	o+NBXJqehs+gwLVwcoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwe2t-00000002FHK-1N2s;
	Thu, 11 Sep 2025 09:56:51 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwe2q-00000002FEc-2fuf
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 09:56:50 +0000
Received: from ubt.. (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowACH2IK5nMJoo6pCAg--.44660S3;
	Thu, 11 Sep 2025 17:56:11 +0800 (CST)
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH v11 1/5] mm: softdirty: Add pgtable_soft_dirty_supported()
Date: Thu, 11 Sep 2025 17:55:58 +0800
Message-Id: <20250911095602.1130290-2-zhangchunyan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911095602.1130290-1-zhangchunyan@iscas.ac.cn>
References: <20250911095602.1130290-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACH2IK5nMJoo6pCAg--.44660S3
X-Coremail-Antispam: 1UD129KBjvJXoWxtrWfArW7XF1UKF4UZr17trb_yoW3Wr4Dpa
	yrGa4Fq3y8JF1vgayfJF4qqryaqF1Sqa47JryfC348J3y5G345WF4vqFyFvF1SgFy8XayS
	vrsrta13Gwsrtr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x
	0262kKe7AKxVW8ZVWrXwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
	JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IUYk-P5UUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiBwoCB2jCjnQ4OgAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_025649_223579_468B9516 
X-CRM114-Status: GOOD (  19.43  )
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

Some platforms can customize the PTE PMD entry soft-dirty bit making it
unavailable even if the architecture provides the resource.

Add an API which architectures can define their specific implementations
to detect if soft-dirty bit is available on which device the kernel is
running.

Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
---
 fs/proc/task_mmu.c      | 17 ++++++++++++++++-
 include/linux/pgtable.h | 12 ++++++++++++
 mm/debug_vm_pgtable.c   | 10 +++++-----
 mm/huge_memory.c        | 13 +++++++------
 mm/internal.h           |  2 +-
 mm/mremap.c             | 13 +++++++------
 mm/userfaultfd.c        | 10 ++++------
 7 files changed, 52 insertions(+), 25 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 29cca0e6d0ff..9e8083b6d4cd 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1058,7 +1058,7 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 	 * -Werror=unterminated-string-initialization warning
 	 *  with GCC 15
 	 */
-	static const char mnemonics[BITS_PER_LONG][3] = {
+	static char mnemonics[BITS_PER_LONG][3] = {
 		/*
 		 * In case if we meet a flag we don't know about.
 		 */
@@ -1129,6 +1129,16 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 		[ilog2(VM_SEALED)] = "sl",
 #endif
 	};
+/*
+ * We should remove the VM_SOFTDIRTY flag if the soft-dirty bit is
+ * unavailable on which the kernel is running, even if the architecture
+ * provides the resource and soft-dirty is compiled in.
+ */
+#ifdef CONFIG_MEM_SOFT_DIRTY
+	if (!pgtable_soft_dirty_supported())
+		mnemonics[ilog2(VM_SOFTDIRTY)][0] = 0;
+#endif
+
 	size_t i;
 
 	seq_puts(m, "VmFlags: ");
@@ -1531,6 +1541,8 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
 static inline void clear_soft_dirty(struct vm_area_struct *vma,
 		unsigned long addr, pte_t *pte)
 {
+	if (!pgtable_soft_dirty_supported())
+		return;
 	/*
 	 * The soft-dirty tracker uses #PF-s to catch writes
 	 * to pages, so write-protect the pte as well. See the
@@ -1566,6 +1578,9 @@ static inline void clear_soft_dirty_pmd(struct vm_area_struct *vma,
 {
 	pmd_t old, pmd = *pmdp;
 
+	if (!pgtable_soft_dirty_supported())
+		return;
+
 	if (pmd_present(pmd)) {
 		/* See comment in change_huge_pmd() */
 		old = pmdp_invalidate(vma, addr, pmdp);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 4c035637eeb7..2a3578a4ae4c 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1537,6 +1537,18 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
 #define arch_start_context_switch(prev)	do {} while (0)
 #endif
 
+/*
+ * Some platforms can customize the PTE soft-dirty bit making it unavailable
+ * even if the architecture provides the resource.
+ * Adding this API allows architectures to add their own checks for the
+ * devices on which the kernel is running.
+ * Note: When overiding it, please make sure the CONFIG_MEM_SOFT_DIRTY
+ * is part of this macro.
+ */
+#ifndef pgtable_soft_dirty_supported
+#define pgtable_soft_dirty_supported()	IS_ENABLED(CONFIG_MEM_SOFT_DIRTY)
+#endif
+
 #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
 #ifndef CONFIG_ARCH_ENABLE_THP_MIGRATION
 static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 830107b6dd08..b32ce2b0b998 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -690,7 +690,7 @@ static void __init pte_soft_dirty_tests(struct pgtable_debug_args *args)
 {
 	pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
 
-	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
+	if (!pgtable_soft_dirty_supported())
 		return;
 
 	pr_debug("Validating PTE soft dirty\n");
@@ -702,7 +702,7 @@ static void __init pte_swap_soft_dirty_tests(struct pgtable_debug_args *args)
 {
 	pte_t pte;
 
-	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
+	if (!pgtable_soft_dirty_supported())
 		return;
 
 	pr_debug("Validating PTE swap soft dirty\n");
@@ -718,7 +718,7 @@ static void __init pmd_soft_dirty_tests(struct pgtable_debug_args *args)
 {
 	pmd_t pmd;
 
-	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
+	if (!pgtable_soft_dirty_supported())
 		return;
 
 	if (!has_transparent_hugepage())
@@ -734,8 +734,8 @@ static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args)
 {
 	pmd_t pmd;
 
-	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY) ||
-		!IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION))
+	if (!pgtable_soft_dirty_supported() ||
+	    !IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION))
 		return;
 
 	if (!has_transparent_hugepage())
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 9c38a95e9f09..218d430a2ec6 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2271,12 +2271,13 @@ static inline int pmd_move_must_withdraw(spinlock_t *new_pmd_ptl,
 
 static pmd_t move_soft_dirty_pmd(pmd_t pmd)
 {
-#ifdef CONFIG_MEM_SOFT_DIRTY
-	if (unlikely(is_pmd_migration_entry(pmd)))
-		pmd = pmd_swp_mksoft_dirty(pmd);
-	else if (pmd_present(pmd))
-		pmd = pmd_mksoft_dirty(pmd);
-#endif
+	if (pgtable_soft_dirty_supported()) {
+		if (unlikely(is_pmd_migration_entry(pmd)))
+			pmd = pmd_swp_mksoft_dirty(pmd);
+		else if (pmd_present(pmd))
+			pmd = pmd_mksoft_dirty(pmd);
+	}
+
 	return pmd;
 }
 
diff --git a/mm/internal.h b/mm/internal.h
index 45b725c3dc03..c6ca62f8ecf3 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1538,7 +1538,7 @@ static inline bool vma_soft_dirty_enabled(struct vm_area_struct *vma)
 	 * VM_SOFTDIRTY is defined as 0x0, then !(vm_flags & VM_SOFTDIRTY)
 	 * will be constantly true.
 	 */
-	if (!IS_ENABLED(CONFIG_MEM_SOFT_DIRTY))
+	if (!pgtable_soft_dirty_supported())
 		return false;
 
 	/*
diff --git a/mm/mremap.c b/mm/mremap.c
index e618a706aff5..7beb3114dbf5 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -162,12 +162,13 @@ static pte_t move_soft_dirty_pte(pte_t pte)
 	 * Set soft dirty bit so we can notice
 	 * in userspace the ptes were moved.
 	 */
-#ifdef CONFIG_MEM_SOFT_DIRTY
-	if (pte_present(pte))
-		pte = pte_mksoft_dirty(pte);
-	else if (is_swap_pte(pte))
-		pte = pte_swp_mksoft_dirty(pte);
-#endif
+	if (pgtable_soft_dirty_supported()) {
+		if (pte_present(pte))
+			pte = pte_mksoft_dirty(pte);
+		else if (is_swap_pte(pte))
+			pte = pte_swp_mksoft_dirty(pte);
+	}
+
 	return pte;
 }
 
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 45e6290e2e8b..85f43479b67a 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1065,9 +1065,8 @@ static int move_present_pte(struct mm_struct *mm,
 
 	orig_dst_pte = folio_mk_pte(src_folio, dst_vma->vm_page_prot);
 	/* Set soft dirty bit so userspace can notice the pte was moved */
-#ifdef CONFIG_MEM_SOFT_DIRTY
-	orig_dst_pte = pte_mksoft_dirty(orig_dst_pte);
-#endif
+	if (pgtable_soft_dirty_supported())
+		orig_dst_pte = pte_mksoft_dirty(orig_dst_pte);
 	if (pte_dirty(orig_src_pte))
 		orig_dst_pte = pte_mkdirty(orig_dst_pte);
 	orig_dst_pte = pte_mkwrite(orig_dst_pte, dst_vma);
@@ -1134,9 +1133,8 @@ static int move_swap_pte(struct mm_struct *mm, struct vm_area_struct *dst_vma,
 	}
 
 	orig_src_pte = ptep_get_and_clear(mm, src_addr, src_pte);
-#ifdef CONFIG_MEM_SOFT_DIRTY
-	orig_src_pte = pte_swp_mksoft_dirty(orig_src_pte);
-#endif
+	if (pgtable_soft_dirty_supported())
+		orig_src_pte = pte_swp_mksoft_dirty(orig_src_pte);
 	set_pte_at(mm, dst_addr, dst_pte, orig_src_pte);
 	double_pt_unlock(dst_ptl, src_ptl);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

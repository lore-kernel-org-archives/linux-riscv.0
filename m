Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE19FEE4996
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 12:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4s2yGZTO2uuK+6SgQ6pQ661bieQyab2NOIlfQLvM/w=; b=C315QCunk5CqYz
	zJKBrvTXNUJnoXR1YBg3+7c+qhpxNO9gKU1pYtm4etwmNmlWlmiCTDTeKTRFnB1Uai8/7gzs8Q87V
	pV1Jxss7xGQezAK4Y4LVX/C0NTpgvN9gJ+zTzeyUMvI09hUnVkQ+Bd3VRZlQylq+BP6WFjEDFMHA5
	/SRbLfB2gXcFcXWCcMG6392R/B9eySJAGfeUR3DSlsVarFVw/zAAZal6maSqlMDlS2q3Sd9gFLPOO
	E9HS7czM+K1nOnVbT6eesoTvyB5q9LkphdV8yvkmVWHbqbzuFaulE0NWXDll6B9fcwtrux4lH7MD9
	ayHKiOEOXQyFmoxR4kTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY44c-00DzMy-1o;
	Mon, 21 Aug 2023 12:31:58 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY442-00Dys1-2v;
	Mon, 21 Aug 2023 12:31:29 +0000
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTsF81thwzNnKj;
	Mon, 21 Aug 2023 20:27:40 +0800 (CST)
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 21 Aug 2023 20:31:12 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>
CC: <surenb@google.com>, <willy@infradead.org>, Russell King
	<linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
	<kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Kefeng Wang
	<wangkefeng.wang@huawei.com>
Subject: [PATCH rfc v2 01/10] mm: add a generic VMA lock-based page fault handler
Date: Mon, 21 Aug 2023 20:30:47 +0800
Message-ID: <20230821123056.2109942-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_053123_535210_07374950 
X-CRM114-Status: GOOD (  17.17  )
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

The ARCH_SUPPORTS_PER_VMA_LOCK are enabled by more and more architectures,
eg, x86, arm64, powerpc and s390, and riscv, those implementation are very
similar which results in some duplicated codes, let's add a generic VMA
lock-based page fault handler try_to_vma_locked_page_fault() to eliminate
them, and which also make us easy to support this on new architectures.

Since different architectures use different way to check vma whether is
accessable or not, the struct pt_regs, page fault error code and vma flags
are added into struct vm_fault, then, the architecture's page fault code
could re-use struct vm_fault to record and check vma accessable by each
own implementation.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 include/linux/mm.h       | 17 +++++++++++++++++
 include/linux/mm_types.h |  2 ++
 mm/memory.c              | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 3f764e84e567..22a6f4c56ff3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -512,9 +512,12 @@ struct vm_fault {
 		pgoff_t pgoff;			/* Logical page offset based on vma */
 		unsigned long address;		/* Faulting virtual address - masked */
 		unsigned long real_address;	/* Faulting virtual address - unmasked */
+		unsigned long fault_code;	/* Faulting error code during page fault */
+		struct pt_regs *regs;		/* The registers stored during page fault */
 	};
 	enum fault_flag flags;		/* FAULT_FLAG_xxx flags
 					 * XXX: should really be 'const' */
+	vm_flags_t vm_flags;		/* VMA flags to be used for access checking */
 	pmd_t *pmd;			/* Pointer to pmd entry matching
 					 * the 'address' */
 	pud_t *pud;			/* Pointer to pud entry matching
@@ -774,6 +777,9 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
 struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 					  unsigned long address);
 
+bool arch_vma_access_error(struct vm_area_struct *vma, struct vm_fault *vmf);
+vm_fault_t try_vma_locked_page_fault(struct vm_fault *vmf);
+
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline bool vma_start_read(struct vm_area_struct *vma)
@@ -801,6 +807,17 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
 	mmap_assert_locked(vmf->vma->vm_mm);
 }
 
+static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
+		unsigned long address)
+{
+	return NULL;
+}
+
+static inline vm_fault_t try_vma_locked_page_fault(struct vm_fault *vmf)
+{
+	return VM_FAULT_NONE;
+}
+
 #endif /* CONFIG_PER_VMA_LOCK */
 
 extern const struct vm_operations_struct vma_dummy_vm_ops;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index f5ba5b0bc836..702820cea3f9 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1119,6 +1119,7 @@ typedef __bitwise unsigned int vm_fault_t;
  * fault. Used to decide whether a process gets delivered SIGBUS or
  * just gets major/minor fault counters bumped up.
  *
+ * @VM_FAULT_NONE:		Special case, not starting to handle fault
  * @VM_FAULT_OOM:		Out Of Memory
  * @VM_FAULT_SIGBUS:		Bad access
  * @VM_FAULT_MAJOR:		Page read from storage
@@ -1139,6 +1140,7 @@ typedef __bitwise unsigned int vm_fault_t;
  *
  */
 enum vm_fault_reason {
+	VM_FAULT_NONE		= (__force vm_fault_t)0x000000,
 	VM_FAULT_OOM            = (__force vm_fault_t)0x000001,
 	VM_FAULT_SIGBUS         = (__force vm_fault_t)0x000002,
 	VM_FAULT_MAJOR          = (__force vm_fault_t)0x000004,
diff --git a/mm/memory.c b/mm/memory.c
index 3b4aaa0d2fff..60fe35db5134 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5510,6 +5510,45 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	count_vm_vma_lock_event(VMA_LOCK_ABORT);
 	return NULL;
 }
+
+#ifdef CONFIG_PER_VMA_LOCK
+bool __weak arch_vma_access_error(struct vm_area_struct *vma, struct vm_fault *vmf)
+{
+	return (vma->vm_flags & vmf->vm_flags) == 0;
+}
+#endif
+
+vm_fault_t try_vma_locked_page_fault(struct vm_fault *vmf)
+{
+	vm_fault_t fault = VM_FAULT_NONE;
+	struct vm_area_struct *vma;
+
+	if (!(vmf->flags & FAULT_FLAG_USER))
+		return fault;
+
+	vma = lock_vma_under_rcu(current->mm, vmf->real_address);
+	if (!vma)
+		return fault;
+
+	if (arch_vma_access_error(vma, vmf)) {
+		vma_end_read(vma);
+		return fault;
+	}
+
+	fault = handle_mm_fault(vma, vmf->real_address,
+				vmf->flags | FAULT_FLAG_VMA_LOCK, vmf->regs);
+
+	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
+		vma_end_read(vma);
+
+	if (fault & VM_FAULT_RETRY)
+		count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	else
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+
+	return fault;
+}
+
 #endif /* CONFIG_PER_VMA_LOCK */
 
 #ifndef __PAGETABLE_P4D_FOLDED
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

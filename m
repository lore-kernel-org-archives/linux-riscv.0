Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9172EC00528
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2i7YNByYjrPYyFDqXOYzvN06CGeVvWxiGYqy8WkHJ0=; b=VgchK4MaCOq9wb
	zg2STvFyAahF0LcXrkfjCC/d8TtRhHYNNvTs5YHxwJMRuURN4hy41NHObGBIN30WxuzRfM9Sqsjxe
	xaxfQgUcCjUMMTES9aYcTwpxFpbQUqYvsqljfiTf6GX1FIreVK0rWr3Tihu8T4NGT7Mo9QCBAv+Ts
	5r7nrS9qS11IC7uJe19g7v0Xtwc+M62T4SMBGEfLvOyxL29vDmEVJbvLquAt1LhuEVnvGKYIEn6rv
	4RD+pMgxD9Dl56KzeFOZDuJcCW8oSKGnksuAa2HT8xTk/78WYprBimnvlrrvqauHge68UXE1zL3g5
	Ri1WqQWB2qGV6e6PVoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsoU-002eGD-0L;
	Thu, 13 Jul 2023 09:40:42 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsoJ-002e0z-0J;
	Thu, 13 Jul 2023 09:40:35 +0000
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4R1qMR24J5zrRlb;
	Thu, 13 Jul 2023 17:39:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 13 Jul 2023 17:40:22 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
	<surenb@google.com>
CC: Russell King <linux@armlinux.org.uk>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Kefeng Wang
	<wangkefeng.wang@huawei.com>
Subject: [PATCH rfc -next 01/10] mm: add a generic VMA lock-based page fault handler
Date: Thu, 13 Jul 2023 17:53:29 +0800
Message-ID: <20230713095339.189715-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
References: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_024031_511339_94262F0C 
X-CRM114-Status: GOOD (  12.72  )
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

There are more and more architectures enabled ARCH_SUPPORTS_PER_VMA_LOCK,
eg, x86, arm64, powerpc and s390, and riscv, those implementation are very
similar which results in some duplicated codes, let's add a generic VMA
lock-based page fault handler to eliminate them, and which also make it
easy to support this feature on new architectures.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 include/linux/mm.h | 28 ++++++++++++++++++++++++++++
 mm/memory.c        | 42 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index c7886784832b..cba1b7b19c9d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -633,6 +633,15 @@ static inline void vma_numab_state_init(struct vm_area_struct *vma) {}
 static inline void vma_numab_state_free(struct vm_area_struct *vma) {}
 #endif /* CONFIG_NUMA_BALANCING */
 
+struct vm_locked_fault {
+	struct mm_struct *mm;
+	unsigned long address;
+	unsigned int fault_flags;
+	unsigned long vm_flags;
+	struct pt_regs *regs;
+	unsigned long fault_code;
+};
+
 #ifdef CONFIG_PER_VMA_LOCK
 /*
  * Try to read-lock a vma. The function is allowed to occasionally yield false
@@ -733,6 +742,19 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
 struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 					  unsigned long address);
 
+#define VM_LOCKED_FAULT_INIT(_name, _mm, _address, _fault_flags, _vm_flags, _regs, _fault_code) \
+	_name.mm		= _mm;			\
+	_name.address		= _address;		\
+	_name.fault_flags	= _fault_flags;		\
+	_name.vm_flags		= _vm_flags;		\
+	_name.regs		= _regs;		\
+	_name.fault_code	= _fault_code
+
+int __weak arch_vma_check_access(struct vm_area_struct *vma,
+				 struct vm_locked_fault *vmlf);
+
+int try_vma_locked_page_fault(struct vm_locked_fault *vmlf, vm_fault_t *ret);
+
 #else /* CONFIG_PER_VMA_LOCK */
 
 static inline bool vma_start_read(struct vm_area_struct *vma)
@@ -742,6 +764,12 @@ static inline void vma_start_write(struct vm_area_struct *vma) {}
 static inline void vma_assert_write_locked(struct vm_area_struct *vma) {}
 static inline void vma_mark_detached(struct vm_area_struct *vma,
 				     bool detached) {}
+#define VM_LOCKED_FAULT_INIT(_name, _mm, _address, _fault_flags, _vm_flags, _regs, _fault_code)
+static inline int try_vma_locked_page_fault(struct vm_locked_fault *vmlf,
+					    vm_fault_t *ret)
+{
+	return -EINVAL;
+}
 
 static inline void release_fault_lock(struct vm_fault *vmf)
 {
diff --git a/mm/memory.c b/mm/memory.c
index ad790394963a..d3f5d1270e7a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5449,6 +5449,48 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	count_vm_vma_lock_event(VMA_LOCK_ABORT);
 	return NULL;
 }
+
+int __weak arch_vma_check_access(struct vm_area_struct *vma,
+				 struct vm_locked_fault *vmlf)
+{
+	if (!(vma->vm_flags & vmlf->vm_flags))
+		return -EINVAL;
+	return 0;
+}
+
+int try_vma_locked_page_fault(struct vm_locked_fault *vmlf, vm_fault_t *ret)
+{
+	struct vm_area_struct *vma;
+	vm_fault_t fault;
+
+	if (!(vmlf->fault_flags & FAULT_FLAG_USER))
+		return -EINVAL;
+
+	vma = lock_vma_under_rcu(vmlf->mm, vmlf->address);
+	if (!vma)
+		return -EINVAL;
+
+	if (arch_vma_check_access(vma, vmlf)) {
+		vma_end_read(vma);
+		return -EINVAL;
+	}
+
+	fault = handle_mm_fault(vma, vmlf->address,
+				vmlf->fault_flags | FAULT_FLAG_VMA_LOCK,
+				vmlf->regs);
+	*ret = fault;
+
+	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
+		vma_end_read(vma);
+
+	if ((fault & VM_FAULT_RETRY))
+		count_vm_vma_lock_event(VMA_LOCK_RETRY);
+	else
+		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
+
+	return 0;
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB58F327C2
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 09:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4C4jvM+i4HSsNxLauqibyH6HCvDApbbX5YA7c50+fT4=; b=B7Eyb0b0Ck75fT
	BjWhtJGkEacDmTKBDqAWiuZMnCo5H7HmHU/ubfdZVcGJzdjsnU47JeVaT8ISJNKyKcHu4RRrL9ptm
	JcDoGcvR5hX3gqRaxaqgt/ZofV82BWBy0fRYxuT7aldi0fO9xChE8Kp6kMe0xDvArUdOIz1lkwdkh
	rdmLdIBtgI3e8Ib7nVrS6UQxuwKWJzF7YusbKbSqC/6SIyxGpPFOmI0s4AnNWFMgEwzQtMN/zUAD2
	ztSC7BjR0P/5k9wyy9VjytVMgEvxGE+0tdAZxsV1lbUMbtux3OZ9lPOFO53zx7taecDQyJlwIOnZc
	V9YWFdvUuMsXs3DBDVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7MB-00000008KJH-071X;
	Tue, 21 Apr 2026 09:25:24 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7M8-00000008KI6-30oJ
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 09:25:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2b24fdac394so38162525ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1776763520; x=1777368320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQRro4iFet5g6RlukJUR9qjzAO0LrmO0ikVc7Fh+rVg=;
        b=fefcjvdJvH8erCdOLrB5wilyevuUR+5/kUMC+Nl4aZIOojM4++j+oVD1Df/Hc88Ztb
         zIFAUKPPtM9uyrZoNagJ1I3TDEp9R1w4tevsPrM40ZzQ4z738V0/TAd1SudOXqwXVXXH
         tm/bzDqpqZxvndThqapH3r4RYu6Pxe1NJ1F8LY8Kftl5CRb+jnvJweewuGDSnZwPzeqo
         9wtE+wBp7ACsuncpePvW5B6UwVZEe9f9fdiS7lazElFqekDqPdXfCpSHssOOOMLNSLN+
         oNZx1S3OXttp+s08QYKNcfSsApB48ZyptzrrCpM5+Axh+eRFbUcSLwGKqvsnvB04QKLO
         Xt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763520; x=1777368320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jQRro4iFet5g6RlukJUR9qjzAO0LrmO0ikVc7Fh+rVg=;
        b=furlWrYlvY4ioNVdLg08LjwlAh3sMlUicUCtVmjaJElToa3f87zmyLtuiLV4LDjnz9
         2MmG2NURxfsd118Wy7Gt8EwvVwlpVEpKYs1Nl11KII7ZT83jF0Ome04VEP217pXbSqe+
         YsjEb+UsNpFuiqRjbyg8PImhIJ8U42Z7CwR/ygsjuYx7/x7BfElVD/hOIrzmks60d9Hm
         4vQd8xA5ZdtY+2DiWDKVh0exDHpJF7r/fbyiPfrgzKgEiNBe2aEK29ttVfZhyVNDS6qr
         Rgdq7glzaXmN2FR5xV8/PlqC27ZbrawtDR0JlAJXJkNcNtMMYpAbT6ngOFuj/BIpF+IZ
         30kg==
X-Forwarded-Encrypted: i=1; AFNElJ9h/GzU4KRJMVKj2Erzg3Y7XTW4JcnsbyItcXC2H0QF/n9d+heBOYEOXuEO089CxgKGoLmSOzTiX0Y/9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWCLUSdq+tW9dZdIn8xQGqKolHKLoe0wMVbJb/0xGlpIOpwi/5
	fsuQZDo0wmj2yq5JAlhSGaS9wCWBVojgiAd/1lmQ+H4oPzmmGe312KXQLLTtLDOvjmA=
X-Gm-Gg: AeBDiesNv82NH5y1PmtDKgu2t+1fgCuN8wcAsl4+YM3zOoGfM7YvIyNF/8vJ8eO7WD9
	JEOrAbQMzs5CuE6gTwMJAdbeP9iiF7cthCIvgUL24eg9FR9Ekc4IIXDa9sojcEW4NUplif58uk/
	7occes9rFt9wHiMRIK6iqAXYx1FWL1c/CTfEw8O3dTZswUxyy18x6RcmBxLJneglIyLLD65jL9Q
	FLa0k+Tum1OQ3PvfRm/T9lzH6UulibklMYQlTl9pSay9UuZ2MQfUWHYJL0HBxFwNRq0K+/vmuS/
	AEUCcZRF4hPvafnn2pjWUg77TPkOhamW5t/cuJ9XRsbDHjdYlj8nphKotxbLhf+bSSs0s3IOatm
	wE39ZP6giyHkdrkvUOaMwBGyqN8+UoBU0K54adPK7oD33MyGAq2m/nIlARTA107Cn45//7YNyH+
	EKncFbxp0/NNBJi1lM4JuERIJIEvT0/vtw3/x/GDkVJ2VxQo6Cp3015hlOMpowuI0+W4gu
X-Received: by 2002:a17:902:9001:b0:2b4:5893:3f3c with SMTP id d9443c01a7336-2b5f9ef4c3fmr117016875ad.13.1776763519593;
        Tue, 21 Apr 2026 02:25:19 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff39csm131965105ad.4.2026.04.21.02.25.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Apr 2026 02:25:19 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	andreyknvl@gmail.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	apopple@nvidia.com,
	ardb@kernel.org,
	atish.patra@linux.dev,
	baolin.wang@linux.alibaba.com,
	cuiyunhui@bytedance.com,
	david@kernel.org,
	debug@rivosinc.com,
	djordje.todorovic@htecgroup.com,
	dvyukov@google.com,
	elver@google.com,
	glider@google.com,
	ilias.apalodimas@linaro.org,
	junhui.liu@pigmoral.tech,
	kasan-dev@googlegroups.com,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	ljs@kernel.org,
	namcao@linutronix.de,
	osalvador@suse.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rmclure@linux.ibm.com,
	rostedt@goodmis.org,
	rppt@kernel.org,
	ryabinin.a.a@gmail.com,
	surenb@google.com,
	vincenzo.frascino@arm.com,
	vishal.moola@gmail.com,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn
Subject: [PATCH 1/7] riscv: mm: split raw and public PTE helpers
Date: Tue, 21 Apr 2026 17:24:51 +0800
Message-Id: <20260421092457.37649-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260421092457.37649-1-cuiyunhui@bytedance.com>
References: <20260421092457.37649-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_022520_792019_401F692B 
X-CRM114-Status: GOOD (  15.72  )
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

Introduce raw PTE helpers prefixed with double underscores for callers
that need direct access to the underlying PTE encoding. These __* helpers
form private low-level primitives, while the existing helpers remain the
public core-MM-facing API that RISC-V can later wrap with additional
architecture-specific semantics without exposing those details to generic
callers.

Switch kernel internal page table users in early boot, KASAN, EFI,
hibernate and pageattr to use the private raw helpers directly.

No functional change intended.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/kfence.h  |  4 +-
 arch/riscv/include/asm/pgtable.h | 87 ++++++++++++++++++++++++++++----
 arch/riscv/kernel/efi.c          |  4 +-
 arch/riscv/kernel/hibernate.c    |  2 +-
 arch/riscv/mm/fault.c            |  4 +-
 arch/riscv/mm/init.c             |  8 +--
 arch/riscv/mm/kasan_init.c       | 14 ++---
 arch/riscv/mm/pageattr.c         | 12 ++---
 arch/riscv/mm/pgtable.c          | 19 ++++++-
 9 files changed, 117 insertions(+), 37 deletions(-)

diff --git a/arch/riscv/include/asm/kfence.h b/arch/riscv/include/asm/kfence.h
index d08bf7fb3aee6..2bcaeff1167c6 100644
--- a/arch/riscv/include/asm/kfence.h
+++ b/arch/riscv/include/asm/kfence.h
@@ -18,9 +18,9 @@ static inline bool kfence_protect_page(unsigned long addr, bool protect)
 	pte_t *pte = virt_to_kpte(addr);
 
 	if (protect)
-		set_pte(pte, __pte(pte_val(ptep_get(pte)) & ~_PAGE_PRESENT));
+		__set_pte(pte, __pte(pte_val(__ptep_get(pte)) & ~_PAGE_PRESENT));
 	else
-		set_pte(pte, __pte(pte_val(ptep_get(pte)) | _PAGE_PRESENT));
+		__set_pte(pte, __pte(pte_val(__ptep_get(pte)) | _PAGE_PRESENT));
 
 	preempt_disable();
 	local_flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index a1a7c6520a095..4de1f40fa77ea 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -602,11 +602,18 @@ static inline int pte_same(pte_t pte_a, pte_t pte_b)
  * a page table are directly modified.  Thus, the following hook is
  * made available.
  */
-static inline void set_pte(pte_t *ptep, pte_t pteval)
+static inline void __set_pte(pte_t *ptep, pte_t pteval)
 {
 	WRITE_ONCE(*ptep, pteval);
 }
 
+#define __set_pte __set_pte
+
+static inline void set_pte(pte_t *ptep, pte_t pteval)
+{
+	__set_pte(ptep, pteval);
+}
+
 void flush_icache_pte(struct mm_struct *mm, pte_t pte);
 
 static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
@@ -619,8 +626,8 @@ static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
 
 #define PFN_PTE_SHIFT		_PAGE_PFN_SHIFT
 
-static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
-		pte_t *ptep, pte_t pteval, unsigned int nr)
+static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep, pte_t pteval, unsigned int nr)
 {
 	page_table_check_ptes_set(mm, addr, ptep, pteval, nr);
 
@@ -632,31 +639,61 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_val(pteval) += 1 << _PAGE_PFN_SHIFT;
 	}
 }
-#define set_ptes set_ptes
+
+#define __set_ptes __set_ptes
+
+static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
+			    pte_t *ptep, pte_t pteval, unsigned int nr)
+{
+	__set_ptes(mm, addr, ptep, pteval, nr);
+}
+
+static inline void __pte_clear(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep)
+{
+	__set_pte_at(mm, ptep, __pte(0));
+}
 
 static inline void pte_clear(struct mm_struct *mm,
 	unsigned long addr, pte_t *ptep)
 {
-	__set_pte_at(mm, ptep, __pte(0));
+	__pte_clear(mm, addr, ptep);
+}
+
+#define __ptep_get __ptep_get
+static inline pte_t __ptep_get(pte_t *ptep)
+{
+	return READ_ONCE(*ptep);
+}
+
+#define __ptep_get_lockless __ptep_get_lockless
+static inline pte_t __ptep_get_lockless(pte_t *ptep)
+{
+	return __ptep_get(ptep);
 }
 
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS	/* defined in mm/pgtable.c */
 extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 				 pte_t *ptep, pte_t entry, int dirty);
+int __ptep_set_access_flags(struct vm_area_struct *vma,
+			    unsigned long address, pte_t *ptep,
+			    pte_t entry, int dirty);
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG	/* defined in mm/pgtable.c */
 bool ptep_test_and_clear_young(struct vm_area_struct *vma,
 		unsigned long address, pte_t *ptep);
+bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
+				 unsigned long address, pte_t *ptep);
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
-static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
-				       unsigned long address, pte_t *ptep)
+static inline pte_t
+__ptep_get_and_clear(struct mm_struct *mm, unsigned long address, pte_t *ptep)
 {
 #ifdef CONFIG_SMP
 	pte_t pte = __pte(xchg(&ptep->pte, 0));
 #else
 	pte_t pte = *ptep;
 
-	set_pte(ptep, __pte(0));
+	__set_pte(ptep, __pte(0));
 #endif
 
 	page_table_check_pte_clear(mm, address, pte);
@@ -664,9 +701,16 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 	return pte;
 }
 
-#define __HAVE_ARCH_PTEP_SET_WRPROTECT
-static inline void ptep_set_wrprotect(struct mm_struct *mm,
-				      unsigned long address, pte_t *ptep)
+#define __ptep_get_and_clear __ptep_get_and_clear
+
+static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
+				       unsigned long address, pte_t *ptep)
+{
+	return __ptep_get_and_clear(mm, address, ptep);
+}
+
+static inline void
+__ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
 {
 	pte_t read_pte = READ_ONCE(*ptep);
 	/*
@@ -679,6 +723,27 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm,
 			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
+#define __ptep_set_wrprotect __ptep_set_wrprotect
+
+#define __HAVE_ARCH_PTEP_SET_WRPROTECT
+static inline void ptep_set_wrprotect(struct mm_struct *mm,
+				      unsigned long address, pte_t *ptep)
+{
+	__ptep_set_wrprotect(mm, address, ptep);
+}
+
+static inline pte_t __ptep_clear_flush(struct vm_area_struct *vma,
+				       unsigned long address,
+				       pte_t *ptep)
+{
+	pte_t pte = __ptep_get_and_clear(vma->vm_mm, address, ptep);
+
+	if (pte_accessible(vma->vm_mm, pte))
+		flush_tlb_page(vma, address);
+
+	return pte;
+}
+
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 static inline bool ptep_clear_flush_young(struct vm_area_struct *vma,
 		unsigned long address, pte_t *ptep)
diff --git a/arch/riscv/kernel/efi.c b/arch/riscv/kernel/efi.c
index b64bf1624a052..673eca7705ba5 100644
--- a/arch/riscv/kernel/efi.c
+++ b/arch/riscv/kernel/efi.c
@@ -60,7 +60,7 @@ int __init efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md)
 static int __init set_permissions(pte_t *ptep, unsigned long addr, void *data)
 {
 	efi_memory_desc_t *md = data;
-	pte_t pte = ptep_get(ptep);
+	pte_t pte = __ptep_get(ptep);
 	unsigned long val;
 
 	if (md->attribute & EFI_MEMORY_RO) {
@@ -72,7 +72,7 @@ static int __init set_permissions(pte_t *ptep, unsigned long addr, void *data)
 		val = pte_val(pte) & ~_PAGE_EXEC;
 		pte = __pte(val);
 	}
-	set_pte(ptep, pte);
+	__set_pte(ptep, pte);
 
 	return 0;
 }
diff --git a/arch/riscv/kernel/hibernate.c b/arch/riscv/kernel/hibernate.c
index 982843828adb7..0360a6f3e1bf2 100644
--- a/arch/riscv/kernel/hibernate.c
+++ b/arch/riscv/kernel/hibernate.c
@@ -186,7 +186,7 @@ static int temp_pgtable_map_pte(pmd_t *dst_pmdp, pmd_t *src_pmdp, unsigned long
 		pte_t pte = READ_ONCE(*src_ptep);
 
 		if (pte_present(pte))
-			set_pte(dst_ptep, __pte(pte_val(pte) | pgprot_val(prot)));
+			__set_pte(dst_ptep, __pte(pte_val(pte) | pgprot_val(prot)));
 	} while (dst_ptep++, src_ptep++, start += PAGE_SIZE, start < end);
 
 	return 0;
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 04ed6f8acae4f..fe8b11a8ad143 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -69,7 +69,7 @@ static void show_pte(unsigned long addr)
 	if (!ptep)
 		goto out;
 
-	pte = ptep_get(ptep);
+	pte = READ_ONCE(*ptep);
 	pr_cont(", pte=%016lx", pte_val(pte));
 	pte_unmap(ptep);
 out:
@@ -231,7 +231,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 	 * silently loop forever.
 	 */
 	pte_k = pte_offset_kernel(pmd_k, addr);
-	if (!pte_present(ptep_get(pte_k))) {
+	if (!pte_present(__ptep_get(pte_k))) {
 		no_context(regs, addr);
 		return;
 	}
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index decd7df40fa42..86321b093d252 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -376,9 +376,9 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 	ptep = &fixmap_pte[pte_index(addr)];
 
 	if (pgprot_val(prot))
-		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, prot));
+		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, prot));
 	else
-		pte_clear(&init_mm, addr, ptep);
+		__pte_clear(&init_mm, addr, ptep);
 	local_flush_tlb_page(addr);
 }
 
@@ -1558,11 +1558,11 @@ static void __meminit remove_pte_mapping(pte_t *pte_base, unsigned long addr, un
 			next = end;
 
 		ptep = pte_base + pte_index(addr);
-		pte = ptep_get(ptep);
+		pte = __ptep_get(ptep);
 		if (!pte_present(*ptep))
 			continue;
 
-		pte_clear(&init_mm, addr, ptep);
+		__pte_clear(&init_mm, addr, ptep);
 		if (is_vmemmap)
 			free_vmemmap_storage(pte_page(pte), PAGE_SIZE, altmap);
 	}
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index c4a2a9e5586e7..0c2f5e8e48063 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -39,9 +39,9 @@ static void __init kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned
 	ptep = pte_offset_kernel(pmd, vaddr);
 
 	do {
-		if (pte_none(ptep_get(ptep))) {
+		if (pte_none(__ptep_get(ptep))) {
 			phys_addr = memblock_phys_alloc(PAGE_SIZE, PAGE_SIZE);
-			set_pte(ptep, pfn_pte(PFN_DOWN(phys_addr), PAGE_KERNEL));
+			__set_pte(ptep, pfn_pte(PFN_DOWN(phys_addr), PAGE_KERNEL));
 			memset(__va(phys_addr), KASAN_SHADOW_INIT, PAGE_SIZE);
 		}
 	} while (ptep++, vaddr += PAGE_SIZE, vaddr != end);
@@ -327,8 +327,8 @@ asmlinkage void __init kasan_early_init(void)
 		KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
 
 	for (i = 0; i < PTRS_PER_PTE; ++i)
-		set_pte(kasan_early_shadow_pte + i,
-			pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL));
+		__set_pte(kasan_early_shadow_pte + i,
+			  pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL));
 
 	for (i = 0; i < PTRS_PER_PMD; ++i)
 		set_pmd(kasan_early_shadow_pmd + i,
@@ -523,9 +523,9 @@ void __init kasan_init(void)
 		       kasan_mem_to_shadow((const void *)MODULES_VADDR + SZ_2G));
 
 	for (i = 0; i < PTRS_PER_PTE; i++)
-		set_pte(&kasan_early_shadow_pte[i],
-			mk_pte(virt_to_page(kasan_early_shadow_page),
-			       __pgprot(_PAGE_PRESENT | _PAGE_READ |
+		__set_pte(&kasan_early_shadow_pte[i],
+			  mk_pte(virt_to_page(kasan_early_shadow_page),
+				 __pgprot(_PAGE_PRESENT | _PAGE_READ |
 					_PAGE_ACCESSED)));
 
 	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 3f76db3d27699..e0271e2a0b295 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -68,10 +68,10 @@ static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
 static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
 			      unsigned long next, struct mm_walk *walk)
 {
-	pte_t val = ptep_get(pte);
+	pte_t val = __ptep_get(pte);
 
 	val = __pte(set_pageattr_masks(pte_val(val), walk));
-	set_pte(pte, val);
+	__set_pte(pte, val);
 
 	return 0;
 }
@@ -121,7 +121,7 @@ static int __split_linear_mapping_pmd(pud_t *pudp,
 
 			ptep_new = (pte_t *)page_address(pte_page);
 			for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep_new)
-				set_pte(ptep_new, pfn_pte(pfn + i, prot));
+				__set_pte(ptep_new, pfn_pte(pfn + i, prot));
 
 			smp_wmb();
 
@@ -406,14 +406,14 @@ static int debug_pagealloc_set_page(pte_t *pte, unsigned long addr, void *data)
 {
 	int enable = *(int *)data;
 
-	unsigned long val = pte_val(ptep_get(pte));
+	unsigned long val = pte_val(__ptep_get(pte));
 
 	if (enable)
 		val |= _PAGE_PRESENT;
 	else
 		val &= ~_PAGE_PRESENT;
 
-	set_pte(pte, __pte(val));
+	__set_pte(pte, __pte(val));
 
 	return 0;
 }
@@ -466,5 +466,5 @@ bool kernel_page_present(struct page *page)
 		return true;
 
 	pte = pte_offset_kernel(pmd, addr);
-	return pte_present(ptep_get(pte));
+	return pte_present(__ptep_get(pte));
 }
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 9c4427d0b1874..9131a78fe15c4 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -8,6 +8,13 @@
 int ptep_set_access_flags(struct vm_area_struct *vma,
 			  unsigned long address, pte_t *ptep,
 			  pte_t entry, int dirty)
+{
+	return __ptep_set_access_flags(vma, address, ptep, entry, dirty);
+}
+
+int __ptep_set_access_flags(struct vm_area_struct *vma,
+			    unsigned long address, pte_t *ptep,
+			    pte_t entry, int dirty)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC)) {
 		if (!pte_same(ptep_get(ptep), entry)) {
@@ -32,11 +39,19 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 bool ptep_test_and_clear_young(struct vm_area_struct *vma,
 		unsigned long address, pte_t *ptep)
 {
-	if (!pte_young(ptep_get(ptep)))
+	return __ptep_test_and_clear_young(vma, address, ptep);
+}
+EXPORT_SYMBOL_GPL(ptep_test_and_clear_young);
+
+bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
+				 unsigned long address, pte_t *ptep)
+{
+	if (!pte_young(__ptep_get(ptep)))
 		return false;
+
 	return test_and_clear_bit(_PAGE_ACCESSED_OFFSET, &pte_val(*ptep));
 }
-EXPORT_SYMBOL_GPL(ptep_test_and_clear_young);
+EXPORT_SYMBOL_GPL(__ptep_test_and_clear_young);
 
 #ifdef CONFIG_64BIT
 pud_t *pud_offset(p4d_t *p4d, unsigned long address)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

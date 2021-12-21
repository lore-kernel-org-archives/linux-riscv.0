Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF4FC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 16:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FaJ+9a7XVFMXYnxfDm1AC3l64OF/w/tDZe3Wn8i9/w4=; b=srYRoBgyD0T9gE
	0sXw6WCFU5DCTjkz8ldjU1cUZ2GSsKtcNdJaCFzm/HVeF/B9ZgzFRaG44ciOTM/YQuB9byaFTyn9Z
	c2NOF8oUN/nOCN8Dd8MuQ4MKGp2iJ+Fs3GxFIGRaVH3tbh2pUoxeqzkSid+xRwpevtZOGjbNLB0/z
	MdQ5fOQLTZOYV2J6AuBuI7iIGRVoITZ/r+98ny63NGI310SzJMzozRsR3yZLZ22vwJ2rPZ+fbcMwr
	Lvrww8o5Pxc73wFLdKD+zcGkgb7ryhadX6PArjPuVMTLywbTJ0KpJEgbVNQxM8z1GGlDULMZKzpB2
	Uh8DeZNl0msrRICb6drw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzi84-007aW8-7m; Tue, 21 Dec 2021 16:36:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzi7w-007aNV-HH
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 16:36:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 22055B817C1;
 Tue, 21 Dec 2021 16:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FE6C36AEA;
 Tue, 21 Dec 2021 16:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640104594;
 bh=EVaTO2DeXNYGndqVY2E9gGPs9Se6iurzYp6o4ptspGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VpKlPb33JoXhqCPnC+c7DU0MHbauTDMaX5pggD1lzGKMIdqZu8EcP9PuR72zPn4y0
 M5F1U5VuuCzFlZoVZur8JU8QH2a+C1YTq74yiahx4zu5MaCIP01vhWQHaawH8jbR/d
 mYF7gVt/AnOb+G1aSzEXHjYaQ6EXGe6hQ1s/i1ZDGMzpMW0nlEN9vsr09VkwN1QDqk
 95eGE/M3FszldW2kSnXnircZh9fluxAn/s8Qj20loUlkIWAHZOdQVIwDCfP1Ck08Fq
 dEeL5rr4Fd5wqdJnzvDOPSaVLUWXPY1P6GmC1rEQA2y3Dwq7/Jo5I/xKr7mMATn1iN
 4eNAep9E1kQkg==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 11/13] riscv: compat: vdso: Add setup additional pages
 implementation
Date: Wed, 22 Dec 2021 00:35:30 +0800
Message-Id: <20211221163532.2636028-12-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221163532.2636028-1-guoren@kernel.org>
References: <20211221163532.2636028-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_083636_935242_7E4DB0ED 
X-CRM114-Status: GOOD (  19.96  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Reconstruct __setup_additional_pages() by appending vdso info
pointer argument to meet compat_vdso_info requirement. And change
vm_special_mapping *dm, *cm initialization into static.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/include/asm/mmu.h |  1 +
 arch/riscv/kernel/vdso.c     | 98 +++++++++++++++++++++++++-----------
 2 files changed, 69 insertions(+), 30 deletions(-)

diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 0099dc116168..cedcf8ea3c76 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -16,6 +16,7 @@ typedef struct {
 	atomic_long_t id;
 #endif
 	void *vdso;
+	void *vdso_info;
 #ifdef CONFIG_SMP
 	/* A local icache flush is needed before user execution can resume. */
 	cpumask_t icache_stale_mask;
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 4f523a23a5d1..deca69524799 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -23,6 +23,9 @@ struct vdso_data {
 #endif
 
 extern char vdso_start[], vdso_end[];
+#ifdef CONFIG_COMPAT
+extern char compat_vdso_start[], compat_vdso_end[];
+#endif
 
 enum vvar_pages {
 	VVAR_DATA_PAGE_OFFSET,
@@ -30,6 +33,11 @@ enum vvar_pages {
 	VVAR_NR_PAGES,
 };
 
+enum rv_vdso_map {
+	RV_VDSO_MAP_VVAR,
+	RV_VDSO_MAP_VDSO,
+};
+
 #define VVAR_SIZE  (VVAR_NR_PAGES << PAGE_SHIFT)
 
 /*
@@ -52,12 +60,6 @@ struct __vdso_info {
 	struct vm_special_mapping *cm;
 };
 
-static struct __vdso_info vdso_info __ro_after_init = {
-	.name = "vdso",
-	.vdso_code_start = vdso_start,
-	.vdso_code_end = vdso_end,
-};
-
 static int vdso_mremap(const struct vm_special_mapping *sm,
 		       struct vm_area_struct *new_vma)
 {
@@ -66,35 +68,35 @@ static int vdso_mremap(const struct vm_special_mapping *sm,
 	return 0;
 }
 
-static int __init __vdso_init(void)
+static int __init __vdso_init(struct __vdso_info *vdso_info)
 {
 	unsigned int i;
 	struct page **vdso_pagelist;
 	unsigned long pfn;
 
-	if (memcmp(vdso_info.vdso_code_start, "\177ELF", 4)) {
+	if (memcmp(vdso_info->vdso_code_start, "\177ELF", 4)) {
 		pr_err("vDSO is not a valid ELF object!\n");
 		return -EINVAL;
 	}
 
-	vdso_info.vdso_pages = (
-		vdso_info.vdso_code_end -
-		vdso_info.vdso_code_start) >>
+	vdso_info->vdso_pages = (
+		vdso_info->vdso_code_end -
+		vdso_info->vdso_code_start) >>
 		PAGE_SHIFT;
 
-	vdso_pagelist = kcalloc(vdso_info.vdso_pages,
+	vdso_pagelist = kcalloc(vdso_info->vdso_pages,
 				sizeof(struct page *),
 				GFP_KERNEL);
 	if (vdso_pagelist == NULL)
 		return -ENOMEM;
 
 	/* Grab the vDSO code pages. */
-	pfn = sym_to_pfn(vdso_info.vdso_code_start);
+	pfn = sym_to_pfn(vdso_info->vdso_code_start);
 
-	for (i = 0; i < vdso_info.vdso_pages; i++)
+	for (i = 0; i < vdso_info->vdso_pages; i++)
 		vdso_pagelist[i] = pfn_to_page(pfn + i);
 
-	vdso_info.cm->pages = vdso_pagelist;
+	vdso_info->cm->pages = vdso_pagelist;
 
 	return 0;
 }
@@ -116,13 +118,14 @@ int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
 {
 	struct mm_struct *mm = task->mm;
 	struct vm_area_struct *vma;
+	struct __vdso_info *vdso_info = mm->context.vdso_info;
 
 	mmap_read_lock(mm);
 
 	for (vma = mm->mmap; vma; vma = vma->vm_next) {
 		unsigned long size = vma->vm_end - vma->vm_start;
 
-		if (vma_is_special_mapping(vma, vdso_info.dm))
+		if (vma_is_special_mapping(vma, vdso_info->dm))
 			zap_page_range(vma, vma->vm_start, size);
 	}
 
@@ -187,11 +190,6 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 	return vmf_insert_pfn(vma, vmf->address, pfn);
 }
 
-enum rv_vdso_map {
-	RV_VDSO_MAP_VVAR,
-	RV_VDSO_MAP_VDSO,
-};
-
 static struct vm_special_mapping rv_vdso_maps[] __ro_after_init = {
 	[RV_VDSO_MAP_VVAR] = {
 		.name   = "[vvar]",
@@ -203,25 +201,53 @@ static struct vm_special_mapping rv_vdso_maps[] __ro_after_init = {
 	},
 };
 
+static struct __vdso_info vdso_info __ro_after_init = {
+	.name = "vdso",
+	.vdso_code_start = vdso_start,
+	.vdso_code_end = vdso_end,
+	.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR],
+	.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
+};
+
+#ifdef CONFIG_COMPAT
+static struct __vdso_info compat_vdso_info __ro_after_init = {
+	.name = "compat_vdso",
+	.vdso_code_start = compat_vdso_start,
+	.vdso_code_end = compat_vdso_end,
+	.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR],
+	.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO],
+};
+#endif
+
 static int __init vdso_init(void)
 {
-	vdso_info.dm = &rv_vdso_maps[RV_VDSO_MAP_VVAR];
-	vdso_info.cm = &rv_vdso_maps[RV_VDSO_MAP_VDSO];
+	int ret;
+
+	ret = __vdso_init(&vdso_info);
+	if (ret)
+		goto out;
 
-	return __vdso_init();
+#ifdef CONFIG_COMPAT
+	ret = __vdso_init(&compat_vdso_info);
+	if (ret)
+		goto out;
+#endif
+out:
+	return ret;
 }
 arch_initcall(vdso_init);
 
 static int __setup_additional_pages(struct mm_struct *mm,
 				    struct linux_binprm *bprm,
-				    int uses_interp)
+				    int uses_interp,
+				    struct __vdso_info *vdso_info)
 {
 	unsigned long vdso_base, vdso_text_len, vdso_mapping_len;
 	void *ret;
 
 	BUILD_BUG_ON(VVAR_NR_PAGES != __VVAR_PAGES);
 
-	vdso_text_len = vdso_info.vdso_pages << PAGE_SHIFT;
+	vdso_text_len = vdso_info->vdso_pages << PAGE_SHIFT;
 	/* Be sure to map the data page */
 	vdso_mapping_len = vdso_text_len + VVAR_SIZE;
 
@@ -232,16 +258,18 @@ static int __setup_additional_pages(struct mm_struct *mm,
 	}
 
 	ret = _install_special_mapping(mm, vdso_base, VVAR_SIZE,
-		(VM_READ | VM_MAYREAD | VM_PFNMAP), vdso_info.dm);
+		(VM_READ | VM_MAYREAD | VM_PFNMAP), vdso_info->dm);
 	if (IS_ERR(ret))
 		goto up_fail;
 
 	vdso_base += VVAR_SIZE;
 	mm->context.vdso = (void *)vdso_base;
+	mm->context.vdso_info = (void *)vdso_info;
+
 	ret =
 	   _install_special_mapping(mm, vdso_base, vdso_text_len,
 		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
-		vdso_info.cm);
+		vdso_info->cm);
 
 	if (IS_ERR(ret))
 		goto up_fail;
@@ -257,7 +285,17 @@ static int __setup_additional_pages(struct mm_struct *mm,
 int compat_arch_setup_additional_pages(struct linux_binprm *bprm,
 				       int uses_interp)
 {
-	return 0;
+	struct mm_struct *mm = current->mm;
+	int ret;
+
+	if (mmap_write_lock_killable(mm))
+		return -EINTR;
+
+	ret = __setup_additional_pages(mm, bprm, uses_interp,
+							&compat_vdso_info);
+	mmap_write_unlock(mm);
+
+	return ret;
 }
 #endif
 
@@ -269,7 +307,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	if (mmap_write_lock_killable(mm))
 		return -EINTR;
 
-	ret = __setup_additional_pages(mm, bprm, uses_interp);
+	ret = __setup_additional_pages(mm, bprm, uses_interp, &vdso_info);
 	mmap_write_unlock(mm);
 
 	return ret;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

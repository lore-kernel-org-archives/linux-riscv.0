Return-Path: <SRS0=l+05=NX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B5EC4320E
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 02:38:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3E116101A
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Sep 2021 02:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3E116101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmqMEj6rQ8YKk788E6qXc5EofrkoZ4fX/j3DDFQ0K2Q=; b=M2PqpmLh7osD7N
	XD/EzWDsGZYc4HoReeeCmZij3+zxGQS5wxsH7J2duuCmtvvVstfI3ErpZd6Ogg6I3AuFN8aw4ZPfw
	ekWyNH2qq3YnDzVqgPCykBdvCc3ela7ixdIssk+dXR+mwFDwr8nQqS2P/nX/Esw0zZmHn26livNOV
	jksf6GTh9F60f5Z1xSwMacd75ePIU/4W1/FnJJovYZcYVuh4kUDesnrKqyBxYgJh1uM6yO0rSh5MP
	qAjvjJg9/zUpLqCk1EI+oHuLL04t3ZVIGz1bpvyZ9mazsAqxqiSZvlevU0yMMihIJ45JMLUCIhxRf
	JW9qLyt1OeL22/XstUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLG8j-003bVY-Az; Wed, 01 Sep 2021 02:38:13 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLG8e-003bUB-2v
 for linux-riscv@lists.infradead.org; Wed, 01 Sep 2021 02:38:12 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gzp9t2S4jzYw2l;
 Wed,  1 Sep 2021 10:37:22 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 1 Sep 2021 10:38:04 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 1 Sep 2021 10:38:03 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <abdulras@google.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next v3 2/3] riscv/vdso: Move vdso data page up front
Date: Wed, 1 Sep 2021 02:46:20 +0000
Message-ID: <20210901024621.2528797-3-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20210901024621.2528797-1-tongtiangen@huawei.com>
References: <20210901024621.2528797-1-tongtiangen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_193808_511227_19BD34CE 
X-CRM114-Status: GOOD (  17.38  )
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

As commit 601255ae3c98 ("arm64: vdso: move data page before code pages"), the
same issue exists on riscv, testcase is shown below, make sure that vdso.so is
bigger than page size,

  struct timespec tp;
  clock_gettime(5, &tp);
  printf("tv_sec: %ld, tv_nsec: %ld\n", tp.tv_sec, tp.tv_nsec);

without this patch, test result : tv_sec: 0, tv_nsec: 0
   with this patch, test result : tv_sec: 1629271537, tv_nsec: 748000000

Move the vdso data page in front of the VDSO area to fix the issue.

Fixes: ad5d1122b82fb ("riscv: use vDSO common flow to reduce the latency of the time-related functions")
Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/riscv/include/asm/vdso.h     |  2 ++
 arch/riscv/kernel/vdso.c          | 44 ++++++++++++++++++-------------
 arch/riscv/kernel/vdso/vdso.lds.S |  3 ++-
 3 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index 8a49f8ecfb52..34210b22ba91 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -14,6 +14,8 @@
  */
 #ifdef CONFIG_MMU
 
+#define __VVAR_PAGES    1
+
 #ifndef __ASSEMBLY__
 
 #include <generated/vdso-offsets.h>
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 72e93d218335..e7bd92d8749b 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -23,6 +23,13 @@ struct vdso_data {
 
 extern char vdso_start[], vdso_end[];
 
+enum vvar_pages {
+	VVAR_DATA_PAGE_OFFSET,
+	VVAR_NR_PAGES,
+};
+
+#define VVAR_SIZE  (VVAR_NR_PAGES << PAGE_SHIFT)
+
 static unsigned int vdso_pages __ro_after_init;
 static struct page **vdso_pagelist __ro_after_init;
 
@@ -41,7 +48,7 @@ static int __init vdso_init(void)
 
 	vdso_pages = (vdso_end - vdso_start) >> PAGE_SHIFT;
 	vdso_pagelist =
-		kcalloc(vdso_pages + 1, sizeof(struct page *), GFP_KERNEL);
+		kcalloc(vdso_pages + VVAR_NR_PAGES, sizeof(struct page *), GFP_KERNEL);
 	if (unlikely(vdso_pagelist == NULL)) {
 		pr_err("vdso: pagelist allocation failed\n");
 		return -ENOMEM;
@@ -66,7 +73,9 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
 	unsigned long vdso_base, vdso_len;
 	int ret;
 
-	vdso_len = (vdso_pages + 1) << PAGE_SHIFT;
+	BUILD_BUG_ON(VVAR_NR_PAGES != __VVAR_PAGES);
+
+	vdso_len = (vdso_pages + VVAR_NR_PAGES) << PAGE_SHIFT;
 
 	mmap_write_lock(mm);
 	vdso_base = get_unmapped_area(NULL, 0, vdso_len, 0, 0);
@@ -75,29 +84,28 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
 		goto end;
 	}
 
-	/*
-	 * Put vDSO base into mm struct. We need to do this before calling
-	 * install_special_mapping or the perf counter mmap tracking code
-	 * will fail to recognise it as a vDSO (since arch_vma_name fails).
-	 */
-	mm->context.vdso = (void *)vdso_base;
+	mm->context.vdso = NULL;
+	ret = install_special_mapping(mm, vdso_base, VVAR_SIZE,
+		(VM_READ | VM_MAYREAD), &vdso_pagelist[vdso_pages]);
+	if (unlikely(ret))
+		goto end;
 
 	ret =
-	   install_special_mapping(mm, vdso_base, vdso_pages << PAGE_SHIFT,
+	   install_special_mapping(mm, vdso_base + VVAR_SIZE,
+		vdso_pages << PAGE_SHIFT,
 		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
 		vdso_pagelist);
 
-	if (unlikely(ret)) {
-		mm->context.vdso = NULL;
+	if (unlikely(ret))
 		goto end;
-	}
 
-	vdso_base += (vdso_pages << PAGE_SHIFT);
-	ret = install_special_mapping(mm, vdso_base, PAGE_SIZE,
-		(VM_READ | VM_MAYREAD), &vdso_pagelist[vdso_pages]);
+	/*
+	 * Put vDSO base into mm struct. We need to do this before calling
+	 * install_special_mapping or the perf counter mmap tracking code
+	 * will fail to recognise it as a vDSO (since arch_vma_name fails).
+	 */
+	mm->context.vdso = (void *)vdso_base + VVAR_SIZE;
 
-	if (unlikely(ret))
-		mm->context.vdso = NULL;
 end:
 	mmap_write_unlock(mm);
 	return ret;
@@ -108,7 +116,7 @@ const char *arch_vma_name(struct vm_area_struct *vma)
 	if (vma->vm_mm && (vma->vm_start == (long)vma->vm_mm->context.vdso))
 		return "[vdso]";
 	if (vma->vm_mm && (vma->vm_start ==
-			   (long)vma->vm_mm->context.vdso + PAGE_SIZE))
+			   (long)vma->vm_mm->context.vdso - VVAR_SIZE))
 		return "[vdso_data]";
 	return NULL;
 }
diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index e6f558bca71b..e9111f700af0 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -3,12 +3,13 @@
  * Copyright (C) 2012 Regents of the University of California
  */
 #include <asm/page.h>
+#include <asm/vdso.h>
 
 OUTPUT_ARCH(riscv)
 
 SECTIONS
 {
-	PROVIDE(_vdso_data = . + PAGE_SIZE);
+	PROVIDE(_vdso_data = . - __VVAR_PAGES * PAGE_SIZE);
 	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A945C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 02:58:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0613610FA
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 02:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0613610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKSnsR1XKMmAmkIETyFPAtH3BTTUulJEFm9Pt3ZmBDQ=; b=W9ogOZAyPe+AIC
	EeODvL02cygnHp5kmC4qwsjUgng1CfslrA703dpyx02adxMI6wNNKWl0KyL9Np6GDYflgJxCIDu7o
	RrCP6+ZhDuJnn1c6Rr4lOsaTJYQ9Ji3trfbJE1c5k0YpTTdpNLw9mov3m9Gxx8mdOo3a3ghLASm41
	sSwJY2OGXfMf1WZw87H8awr4jWLJAAvuQ1mBP9OcjTBYW/Rq0Y0h0X+cRe2c/d0ZezKUH8QrfdPxK
	3Rz9VS31Evh2I0/qWNwcAWXCGg2vcMcPKvV2CGNkA4GP/BvV1fda5+AHZZe+37TvZ+pV8G+Z4HAIa
	nNOpE0X1ABrHkMZJhGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGYFr-0078O8-90; Thu, 19 Aug 2021 02:58:07 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGYFl-0078MM-Sr
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 02:58:06 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GqqFV5XZLz87kF;
 Thu, 19 Aug 2021 10:57:50 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 19 Aug 2021 10:57:48 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 19 Aug 2021 10:57:47 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tong
 Tiangen" <tongtiangen@huawei.com>
Subject: [PATCH -next 1/2] riscv/vdso: Move vdso data page up front
Date: Thu, 19 Aug 2021 03:06:49 +0000
Message-ID: <20210819030650.716478-2-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20210819030650.716478-1-tongtiangen@huawei.com>
References: <20210819030650.716478-1-tongtiangen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_195802_305812_87E65D77 
X-CRM114-Status: GOOD (  18.12  )
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

In this patch, I moved the declaration of sys_riscv_flush_icache from asm/vdso.h
to asm/syscall.h, the reason is asm/vdso.h is included in vdso.lds.S, If the
declaration is placed here, This will introduce syntax error.

Fixes: ad5d1122b82fb ("riscv: use vDSO common flow to reduce the latency of the time-related functions")
Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/riscv/include/asm/syscall.h  |  2 ++
 arch/riscv/include/asm/vdso.h     |  4 +--
 arch/riscv/kernel/vdso.c          | 47 ++++++++++++++++++-------------
 arch/riscv/kernel/vdso/vdso.lds.S |  3 +-
 4 files changed, 33 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index b933b1583c9f..50704bd5ca3e 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -82,4 +82,6 @@ static inline int syscall_get_arch(struct task_struct *task)
 #endif
 }
 
+asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
+
 #endif	/* _ASM_RISCV_SYSCALL_H */
diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index 1453a2f563bc..564741266580 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -10,6 +10,8 @@
 
 #include <linux/types.h>
 
+#define __VVAR_PAGES    1
+
 #ifndef CONFIG_GENERIC_TIME_VSYSCALL
 struct vdso_data {
 };
@@ -29,6 +31,4 @@ struct vdso_data {
 	(void __user *)((unsigned long)(base) + __vdso_##name);			\
 })
 
-asmlinkage long sys_riscv_flush_icache(uintptr_t, uintptr_t, uintptr_t);
-
 #endif /* _ASM_RISCV_VDSO_H */
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 25a3b8849599..5fecd5529eff 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -14,12 +14,18 @@
 #include <asm/page.h>
 #ifdef CONFIG_GENERIC_TIME_VSYSCALL
 #include <vdso/datapage.h>
-#else
-#include <asm/vdso.h>
 #endif
+#include <asm/vdso.h>
 
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
 
@@ -38,7 +44,7 @@ static int __init vdso_init(void)
 
 	vdso_pages = (vdso_end - vdso_start) >> PAGE_SHIFT;
 	vdso_pagelist =
-		kcalloc(vdso_pages + 1, sizeof(struct page *), GFP_KERNEL);
+		kcalloc(vdso_pages + VVAR_NR_PAGES, sizeof(struct page *), GFP_KERNEL);
 	if (unlikely(vdso_pagelist == NULL)) {
 		pr_err("vdso: pagelist allocation failed\n");
 		return -ENOMEM;
@@ -63,7 +69,9 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
 	unsigned long vdso_base, vdso_len;
 	int ret;
 
-	vdso_len = (vdso_pages + 1) << PAGE_SHIFT;
+	BUILD_BUG_ON(VVAR_NR_PAGES != __VVAR_PAGES);
+
+	vdso_len = (vdso_pages + VVAR_NR_PAGES) << PAGE_SHIFT;
 
 	mmap_write_lock(mm);
 	vdso_base = get_unmapped_area(NULL, 0, vdso_len, 0, 0);
@@ -72,29 +80,28 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
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
@@ -105,7 +112,7 @@ const char *arch_vma_name(struct vm_area_struct *vma)
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

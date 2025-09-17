Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAEECAC598
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 09:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:Cc:To:From:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=we94O9BXLvgAeq5k5LL56J5NMTmhOlqePDMeeoOBxk0=; b=16f
	L+QvF3jTHN7Vi0gLSiYnjHDSwSONsWBnUHI8ijWu+DnNw+j0ivQfTIuq8+jlOFwssHHaAn6X6CFBc
	SBmw5csjSPwTU7jh/uRdtqLjQt+6Vk6U11tAWvr/JyqaY0RJd6OwarZOYgM/6N4d6w6+bQbo4zog7
	bZI+KmYnaz8NHYK6mVfkgTO1HfqBewSF6ANFXOlh9AoYMm1Z0hI7OfOWxDDwVF4wdd7VyrKvNLOj/
	I+5FNn8pPdFF8RfHAuqX43XabH+1WWgjxknibqfqbe23TQPMQy1i9ZNF8yqgKNC1sujxnZTdRO+ou
	KX0Ak8lr+z8ByOPNxrKp1yklntYRECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoMF-0000000Alwa-3Jf8;
	Wed, 17 Sep 2025 09:21:47 +0000
Received: from sg-1-37.ptr.blmpb.com ([118.26.132.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoMA-0000000Alvj-3JnB
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 09:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1758100896;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=h7Z/HOQPJW5/DLBofPfWPAnGx2zrqJmmsBycrRC0XrQ=;
 b=NmzJzi+5dC1jNwnlTfv0MMrEgsgafWBP5DY+wKoE2n2eVX01ckZXBqj4iMA+TN9FiLQfJW
 sFinwTjXbZG0SntkVuiSDA0gE/3hYbQWOeKARmxSGYur+4BeGrDOcd4tXYV/GnG7U+N4OY
 0N5UYzJnzpvJgXbgBQYtvQvJhOmPY4+ZiCSIw/ZG2jIon1DJizPHLajE6/QohUmbKcskp8
 pft3fcTkVwEvBdNW4CaYhj1st3N3mDZqBjs1MvuOn/0z1mFbvm/566bMGEjo50eKuAyHiB
 Mvx6qi1s5IQLnQfL4ZjcaqCh5z6fRSOSdNZ6n6P4l2NBif49+rHhfKw62uF9zQ==
Date: Wed, 17 Sep 2025 17:21:29 +0800
Message-Id: <20250917092129.1450686-1-xiangwencheng@lanxincomputing.com>
X-Lms-Return-Path: <lba+268ca7d9e+022c5b+lists.infradead.org+xiangwencheng@lanxincomputing.com>
X-Mailer: git-send-email 2.43.0
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Received: from Bill.localdomain ([222.128.9.250]) by smtp.feishu.cn with ESMTP; Wed, 17 Sep 2025 17:21:33 +0800
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
To: <linux-riscv@lists.infradead.org>
Cc: "BillXiang" <xiangwencheng@lanxincomputing.com>
Subject: [PATCH] riscv: Move user-visible sbi ext ids to uapi
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_022143_215725_4F07B0F9 
X-CRM114-Status: GOOD (  12.49  )
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

Move those sbi ext ids to uapi because they will be forwarded
to user space by kvm.

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
 arch/riscv/include/asm/sbi.h      | 16 +-----------
 arch/riscv/include/uapi/asm/sbi.h | 43 +++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 15 deletions(-)
 create mode 100644 arch/riscv/include/uapi/asm/sbi.h

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 341e74238aa0..e196feaabb2e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -10,13 +10,12 @@
 #include <linux/types.h>
 #include <linux/cpumask.h>
 #include <linux/jump_label.h>
+#include <uapi/asm/sbi.h>
 
 #ifdef CONFIG_RISCV_SBI
 enum sbi_ext_id {
 #ifdef CONFIG_RISCV_SBI_V01
 	SBI_EXT_0_1_SET_TIMER = 0x0,
-	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
-	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
 	SBI_EXT_0_1_CLEAR_IPI = 0x3,
 	SBI_EXT_0_1_SEND_IPI = 0x4,
 	SBI_EXT_0_1_REMOTE_FENCE_I = 0x5,
@@ -37,13 +36,6 @@ enum sbi_ext_id {
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_FWFT = 0x46574654,
 
-	/* Experimentals extensions must lie within this range */
-	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
-	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
-
-	/* Vendor extensions must lie within this range */
-	SBI_EXT_VENDOR_START = 0x09000000,
-	SBI_EXT_VENDOR_END = 0x09FFFFFF,
 };
 
 enum sbi_ext_base_fid {
@@ -263,12 +255,6 @@ enum sbi_pmu_ctr_type {
 #define SBI_PMU_STOP_FLAG_RESET BIT(0)
 #define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
 
-enum sbi_ext_dbcn_fid {
-	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
-	SBI_EXT_DBCN_CONSOLE_READ = 1,
-	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
-};
-
 /* SBI STA (steal-time accounting) extension */
 enum sbi_ext_sta_fid {
 	SBI_EXT_STA_STEAL_TIME_SET_SHMEM = 0,
diff --git a/arch/riscv/include/uapi/asm/sbi.h b/arch/riscv/include/uapi/asm/sbi.h
new file mode 100644
index 000000000000..d29ac0abeefe
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/sbi.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2025 Lanxincomputing Corporation or its affiliates.
+ *
+ * Authors:
+ *     BillXiang <xiangwencheng@lanxincomputing.com>
+ */
+
+#ifndef _UAPI_ASM_RISCV_SBI_H
+#define _UAPI_ASM_RISCV_SBI_H
+
+
+enum SBI_EXT_ID {
+	/*
+	* The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
+	* handled in kernel so they will be forwarded to userspace by kvm.
+	*/
+	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
+	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
+	/*
+	* Both SBI experimental and vendor extensions are
+	* unconditionally forwarded to userspace by kvm.
+	*/
+	/* Experimentals extensions must lie within this range */
+	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
+	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
+
+	/* Vendor extensions must lie within this range */
+	SBI_EXT_VENDOR_START = 0x09000000,
+	SBI_EXT_VENDOR_END = 0x09FFFFFF,
+};
+
+/*
+* The SBI debug console functions are unconditionally
+* forwarded to the userspace by kvm.
+*/
+enum sbi_ext_dbcn_fid {
+	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
+	SBI_EXT_DBCN_CONSOLE_READ = 1,
+	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
+};
+
+#endif /* _UAPI_ASM_RISCV_SBI_H */
\ No newline at end of file
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

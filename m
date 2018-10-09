Return-Path: <SRS0=n4Ll=MV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20891C64EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 02:19:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5F502145D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 02:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rF4plV4+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5F502145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UewjHSnhquPe4FaSGIzmDjUE24LnIsx9aT31sry1LiI=; b=rF4plV4+0gAVZL
	TN9wyvsHQdO4jR6oUSfgXMkzx7ALnzopXWD2lr3J9YGcYLcRgYfk0KxgPNQiJmS3PkQ+MqF74y155
	LA1lPVGRxN9hDsobCDJckeqa264+SL6TE3f+JVKgEgaIOUBlz3dTvZy4BBDaVAlKYw5IniSX0FeMH
	TVtj1+zbMFKv/16freArbyMbsELs8JdTgli9d+avk/0MjxNPssk4n4CbVU8cjAKdGvcjpOpie3wto
	oZVFDEm1BasDH5qlUaSYUtnYRunvNljyJa7F48eD71O2qc5CIKkXeqqEyA6BaWd8cS8V4I83KJgGX
	PhhGJZN0m169TJ3DCU8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g9hcg-00047B-Po; Tue, 09 Oct 2018 02:19:46 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9hcZ-00042e-A6
 for linux-riscv@lists.infradead.org; Tue, 09 Oct 2018 02:19:41 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id w992LmT6032585;
 Tue, 9 Oct 2018 10:21:48 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Tue, 9 Oct 2018
 10:19:07 +0800
From: Alan Kao <alankao@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v8 1/5] Extract FPU context operations from entry.S
Date: Tue, 9 Oct 2018 10:18:30 +0800
Message-ID: <1539051514-3658-2-git-send-email-alankao@andestech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539051514-3658-1-git-send-email-alankao@andestech.com>
References: <1539051514-3658-1-git-send-email-alankao@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com w992LmT6032585
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181008_191939_724572_14A2C603 
X-CRM114-Status: GOOD (  11.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Vincent Chen <vincentc@andestech.com>, Zong Li <zong@andestech.com>,
 Alan Kao <alankao@andestech.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <greentime@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181009021830.b_EYP_Fkhg-_4F_JG7Dj4EXsPiPZEpaEyu0jcplrX8I@z>

We move __fstate_save and __fstate_restore to a new source
file, fpu.S.

Signed-off-by: Alan Kao <alankao@andestech.com>
Cc: Greentime Hu <greentime@andestech.com>
Cc: Vincent Chen <vincentc@andestech.com>
Cc: Zong Li <zong@andestech.com>
Cc: Nick Hu <nickhu@andestech.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/Makefile |   1 +
 arch/riscv/kernel/entry.S  |  87 -------------------------------------
 arch/riscv/kernel/fpu.S    | 106 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 107 insertions(+), 87 deletions(-)
 create mode 100644 arch/riscv/kernel/fpu.S

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index e1274fc..bd433efd 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -13,6 +13,7 @@ extra-y += vmlinux.lds
 obj-y	+= cpu.o
 obj-y	+= cpufeature.o
 obj-y	+= entry.o
+obj-y	+= fpu.o
 obj-y	+= irq.o
 obj-y	+= process.o
 obj-y	+= ptrace.o
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index fa2c08e..59c02e2 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -357,93 +357,6 @@ ENTRY(__switch_to)
 	ret
 ENDPROC(__switch_to)
 
-ENTRY(__fstate_save)
-	li  a2,  TASK_THREAD_F0
-	add a0, a0, a2
-	li t1, SR_FS
-	csrs sstatus, t1
-	frcsr t0
-	fsd f0,  TASK_THREAD_F0_F0(a0)
-	fsd f1,  TASK_THREAD_F1_F0(a0)
-	fsd f2,  TASK_THREAD_F2_F0(a0)
-	fsd f3,  TASK_THREAD_F3_F0(a0)
-	fsd f4,  TASK_THREAD_F4_F0(a0)
-	fsd f5,  TASK_THREAD_F5_F0(a0)
-	fsd f6,  TASK_THREAD_F6_F0(a0)
-	fsd f7,  TASK_THREAD_F7_F0(a0)
-	fsd f8,  TASK_THREAD_F8_F0(a0)
-	fsd f9,  TASK_THREAD_F9_F0(a0)
-	fsd f10, TASK_THREAD_F10_F0(a0)
-	fsd f11, TASK_THREAD_F11_F0(a0)
-	fsd f12, TASK_THREAD_F12_F0(a0)
-	fsd f13, TASK_THREAD_F13_F0(a0)
-	fsd f14, TASK_THREAD_F14_F0(a0)
-	fsd f15, TASK_THREAD_F15_F0(a0)
-	fsd f16, TASK_THREAD_F16_F0(a0)
-	fsd f17, TASK_THREAD_F17_F0(a0)
-	fsd f18, TASK_THREAD_F18_F0(a0)
-	fsd f19, TASK_THREAD_F19_F0(a0)
-	fsd f20, TASK_THREAD_F20_F0(a0)
-	fsd f21, TASK_THREAD_F21_F0(a0)
-	fsd f22, TASK_THREAD_F22_F0(a0)
-	fsd f23, TASK_THREAD_F23_F0(a0)
-	fsd f24, TASK_THREAD_F24_F0(a0)
-	fsd f25, TASK_THREAD_F25_F0(a0)
-	fsd f26, TASK_THREAD_F26_F0(a0)
-	fsd f27, TASK_THREAD_F27_F0(a0)
-	fsd f28, TASK_THREAD_F28_F0(a0)
-	fsd f29, TASK_THREAD_F29_F0(a0)
-	fsd f30, TASK_THREAD_F30_F0(a0)
-	fsd f31, TASK_THREAD_F31_F0(a0)
-	sw t0, TASK_THREAD_FCSR_F0(a0)
-	csrc sstatus, t1
-	ret
-ENDPROC(__fstate_save)
-
-ENTRY(__fstate_restore)
-	li  a2,  TASK_THREAD_F0
-	add a0, a0, a2
-	li t1, SR_FS
-	lw t0, TASK_THREAD_FCSR_F0(a0)
-	csrs sstatus, t1
-	fld f0,  TASK_THREAD_F0_F0(a0)
-	fld f1,  TASK_THREAD_F1_F0(a0)
-	fld f2,  TASK_THREAD_F2_F0(a0)
-	fld f3,  TASK_THREAD_F3_F0(a0)
-	fld f4,  TASK_THREAD_F4_F0(a0)
-	fld f5,  TASK_THREAD_F5_F0(a0)
-	fld f6,  TASK_THREAD_F6_F0(a0)
-	fld f7,  TASK_THREAD_F7_F0(a0)
-	fld f8,  TASK_THREAD_F8_F0(a0)
-	fld f9,  TASK_THREAD_F9_F0(a0)
-	fld f10, TASK_THREAD_F10_F0(a0)
-	fld f11, TASK_THREAD_F11_F0(a0)
-	fld f12, TASK_THREAD_F12_F0(a0)
-	fld f13, TASK_THREAD_F13_F0(a0)
-	fld f14, TASK_THREAD_F14_F0(a0)
-	fld f15, TASK_THREAD_F15_F0(a0)
-	fld f16, TASK_THREAD_F16_F0(a0)
-	fld f17, TASK_THREAD_F17_F0(a0)
-	fld f18, TASK_THREAD_F18_F0(a0)
-	fld f19, TASK_THREAD_F19_F0(a0)
-	fld f20, TASK_THREAD_F20_F0(a0)
-	fld f21, TASK_THREAD_F21_F0(a0)
-	fld f22, TASK_THREAD_F22_F0(a0)
-	fld f23, TASK_THREAD_F23_F0(a0)
-	fld f24, TASK_THREAD_F24_F0(a0)
-	fld f25, TASK_THREAD_F25_F0(a0)
-	fld f26, TASK_THREAD_F26_F0(a0)
-	fld f27, TASK_THREAD_F27_F0(a0)
-	fld f28, TASK_THREAD_F28_F0(a0)
-	fld f29, TASK_THREAD_F29_F0(a0)
-	fld f30, TASK_THREAD_F30_F0(a0)
-	fld f31, TASK_THREAD_F31_F0(a0)
-	fscsr t0
-	csrc sstatus, t1
-	ret
-ENDPROC(__fstate_restore)
-
-
 	.section ".rodata"
 	/* Exception vector table */
 ENTRY(excp_vect_table)
diff --git a/arch/riscv/kernel/fpu.S b/arch/riscv/kernel/fpu.S
new file mode 100644
index 0000000..1defb06
--- /dev/null
+++ b/arch/riscv/kernel/fpu.S
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
+
+#include <linux/linkage.h>
+
+#include <asm/asm.h>
+#include <asm/csr.h>
+#include <asm/asm-offsets.h>
+
+ENTRY(__fstate_save)
+	li  a2,  TASK_THREAD_F0
+	add a0, a0, a2
+	li t1, SR_FS
+	csrs sstatus, t1
+	frcsr t0
+	fsd f0,  TASK_THREAD_F0_F0(a0)
+	fsd f1,  TASK_THREAD_F1_F0(a0)
+	fsd f2,  TASK_THREAD_F2_F0(a0)
+	fsd f3,  TASK_THREAD_F3_F0(a0)
+	fsd f4,  TASK_THREAD_F4_F0(a0)
+	fsd f5,  TASK_THREAD_F5_F0(a0)
+	fsd f6,  TASK_THREAD_F6_F0(a0)
+	fsd f7,  TASK_THREAD_F7_F0(a0)
+	fsd f8,  TASK_THREAD_F8_F0(a0)
+	fsd f9,  TASK_THREAD_F9_F0(a0)
+	fsd f10, TASK_THREAD_F10_F0(a0)
+	fsd f11, TASK_THREAD_F11_F0(a0)
+	fsd f12, TASK_THREAD_F12_F0(a0)
+	fsd f13, TASK_THREAD_F13_F0(a0)
+	fsd f14, TASK_THREAD_F14_F0(a0)
+	fsd f15, TASK_THREAD_F15_F0(a0)
+	fsd f16, TASK_THREAD_F16_F0(a0)
+	fsd f17, TASK_THREAD_F17_F0(a0)
+	fsd f18, TASK_THREAD_F18_F0(a0)
+	fsd f19, TASK_THREAD_F19_F0(a0)
+	fsd f20, TASK_THREAD_F20_F0(a0)
+	fsd f21, TASK_THREAD_F21_F0(a0)
+	fsd f22, TASK_THREAD_F22_F0(a0)
+	fsd f23, TASK_THREAD_F23_F0(a0)
+	fsd f24, TASK_THREAD_F24_F0(a0)
+	fsd f25, TASK_THREAD_F25_F0(a0)
+	fsd f26, TASK_THREAD_F26_F0(a0)
+	fsd f27, TASK_THREAD_F27_F0(a0)
+	fsd f28, TASK_THREAD_F28_F0(a0)
+	fsd f29, TASK_THREAD_F29_F0(a0)
+	fsd f30, TASK_THREAD_F30_F0(a0)
+	fsd f31, TASK_THREAD_F31_F0(a0)
+	sw t0, TASK_THREAD_FCSR_F0(a0)
+	csrc sstatus, t1
+	ret
+ENDPROC(__fstate_save)
+
+ENTRY(__fstate_restore)
+	li  a2,  TASK_THREAD_F0
+	add a0, a0, a2
+	li t1, SR_FS
+	lw t0, TASK_THREAD_FCSR_F0(a0)
+	csrs sstatus, t1
+	fld f0,  TASK_THREAD_F0_F0(a0)
+	fld f1,  TASK_THREAD_F1_F0(a0)
+	fld f2,  TASK_THREAD_F2_F0(a0)
+	fld f3,  TASK_THREAD_F3_F0(a0)
+	fld f4,  TASK_THREAD_F4_F0(a0)
+	fld f5,  TASK_THREAD_F5_F0(a0)
+	fld f6,  TASK_THREAD_F6_F0(a0)
+	fld f7,  TASK_THREAD_F7_F0(a0)
+	fld f8,  TASK_THREAD_F8_F0(a0)
+	fld f9,  TASK_THREAD_F9_F0(a0)
+	fld f10, TASK_THREAD_F10_F0(a0)
+	fld f11, TASK_THREAD_F11_F0(a0)
+	fld f12, TASK_THREAD_F12_F0(a0)
+	fld f13, TASK_THREAD_F13_F0(a0)
+	fld f14, TASK_THREAD_F14_F0(a0)
+	fld f15, TASK_THREAD_F15_F0(a0)
+	fld f16, TASK_THREAD_F16_F0(a0)
+	fld f17, TASK_THREAD_F17_F0(a0)
+	fld f18, TASK_THREAD_F18_F0(a0)
+	fld f19, TASK_THREAD_F19_F0(a0)
+	fld f20, TASK_THREAD_F20_F0(a0)
+	fld f21, TASK_THREAD_F21_F0(a0)
+	fld f22, TASK_THREAD_F22_F0(a0)
+	fld f23, TASK_THREAD_F23_F0(a0)
+	fld f24, TASK_THREAD_F24_F0(a0)
+	fld f25, TASK_THREAD_F25_F0(a0)
+	fld f26, TASK_THREAD_F26_F0(a0)
+	fld f27, TASK_THREAD_F27_F0(a0)
+	fld f28, TASK_THREAD_F28_F0(a0)
+	fld f29, TASK_THREAD_F29_F0(a0)
+	fld f30, TASK_THREAD_F30_F0(a0)
+	fld f31, TASK_THREAD_F31_F0(a0)
+	fscsr t0
+	csrc sstatus, t1
+	ret
+ENDPROC(__fstate_restore)
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

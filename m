Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB122C282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:57:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB2D620883
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:57:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mUbi6rm6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB2D620883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-sky.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kGHm1fJpESFQ2o1QbWx3YKmiwWkfuLYT6ecW0n5JpBE=; b=mUbi6rm6C/FZRoM1lc+TvcKoct
	5hlRgfO+LJW74phgNIgIPKV4hmn01ykmMXbXvvFpkgLroFd0UKNYNjAnQ8ovWGCW6XO/nS3SaJfoC
	BzjZf8TLD7DNJvm41BCY9Z5UPJq0HoswsUcP52GriAiyEiuSNKy0qNWcYsHYBWFjkmmvYc4XG7Uug
	yeKpeHRP6i1qHo8yyl2WE5x96M0W7expmT5eVwHzX7Zk2H4M05oCHXelJfUkm3Kw6H5ByoPYpg5Np
	9pBCcszqIwYkywaeNGOdd74a+4rTO3f9TtA/d75zPLj0oENOExSCSX55udRLbCbS68L+L5/N2jsSU
	tMoCtKkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFyMu-0007hf-Jz; Mon, 15 Apr 2019 09:57:40 +0000
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFyMn-0007VW-Jz
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 09:57:37 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07442588|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.365205-0.0142482-0.620547; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03310; MF=han_mao@c-sky.com; NM=1; PH=DS; RN=6; RT=6; SR=0;
 TI=SMTPD_---.ELcAdAb_1555322249; 
Received: from localhost(mailfrom:han_mao@c-sky.com
 fp:SMTPD_---.ELcAdAb_1555322249)
 by smtp.aliyun-inc.com(10.147.44.129);
 Mon, 15 Apr 2019 17:57:29 +0800
From: Mao Han <han_mao@c-sky.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] riscv: Add support for perf registers sampling
Date: Mon, 15 Apr 2019 17:52:12 +0800
Message-Id: <5c198c932960666df1d145e777e42333cb6e377d.1555320740.git.han_mao@c-sky.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1555320740.git.han_mao@c-sky.com>
References: <cover.1555320740.git.han_mao@c-sky.com>
In-Reply-To: <cover.1555320740.git.han_mao@c-sky.com>
References: <cover.1555320740.git.han_mao@c-sky.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_025733_983895_BFB41EDE 
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>, Guo Ren <guoren@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Mao Han <han_mao@c-sky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch implements the perf registers sampling and validation API
for riscv arch. The valid registers and their register ID are defined in
perf_regs.h. Perf tool can backtrace in userspace with unwind library
and the registers/user stack dump support.

Signed-off-by: Mao Han <han_mao@c-sky.com>
CC: Palmer Dabbelt <palmer@sifive.com>
CC: linux-riscv<linux-riscv@lists.infradead.org>
CC: Christoph Hellwig <hch@lst.de>
CC: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig                      |  2 ++
 arch/riscv/include/uapi/asm/perf_regs.h | 42 +++++++++++++++++++++++++++++++
 arch/riscv/kernel/Makefile              |  1 +
 arch/riscv/kernel/perf_regs.c           | 44 +++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 arch/riscv/include/uapi/asm/perf_regs.h
 create mode 100644 arch/riscv/kernel/perf_regs.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eb56c82..effd157 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -33,6 +33,8 @@ config RISCV
 	select HAVE_DMA_CONTIGUOUS
 	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_REGS
+	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_SYSCALL_TRACEPOINTS
 	select IRQ_DOMAIN
 	select RISCV_ISA_A if SMP
diff --git a/arch/riscv/include/uapi/asm/perf_regs.h b/arch/riscv/include/uapi/asm/perf_regs.h
new file mode 100644
index 0000000..df1a581
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/perf_regs.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
+
+#ifndef _ASM_RISCV_PERF_REGS_H
+#define _ASM_RISCV_PERF_REGS_H
+
+enum perf_event_riscv_regs {
+	PERF_REG_RISCV_PC,
+	PERF_REG_RISCV_RA,
+	PERF_REG_RISCV_SP,
+	PERF_REG_RISCV_GP,
+	PERF_REG_RISCV_TP,
+	PERF_REG_RISCV_T0,
+	PERF_REG_RISCV_T1,
+	PERF_REG_RISCV_T2,
+	PERF_REG_RISCV_S0,
+	PERF_REG_RISCV_S1,
+	PERF_REG_RISCV_A0,
+	PERF_REG_RISCV_A1,
+	PERF_REG_RISCV_A2,
+	PERF_REG_RISCV_A3,
+	PERF_REG_RISCV_A4,
+	PERF_REG_RISCV_A5,
+	PERF_REG_RISCV_A6,
+	PERF_REG_RISCV_A7,
+	PERF_REG_RISCV_S2,
+	PERF_REG_RISCV_S3,
+	PERF_REG_RISCV_S4,
+	PERF_REG_RISCV_S5,
+	PERF_REG_RISCV_S6,
+	PERF_REG_RISCV_S7,
+	PERF_REG_RISCV_S8,
+	PERF_REG_RISCV_S9,
+	PERF_REG_RISCV_S10,
+	PERF_REG_RISCV_S11,
+	PERF_REG_RISCV_T3,
+	PERF_REG_RISCV_T4,
+	PERF_REG_RISCV_T5,
+	PERF_REG_RISCV_T6,
+	PERF_REG_RISCV_MAX,
+};
+#endif /* _ASM_RISCV_PERF_REGS_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index dd2ba44..024badc 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -39,5 +39,6 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 
 obj-$(CONFIG_PERF_EVENTS)	+= perf_event.o
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
+obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
 
 clean:
diff --git a/arch/riscv/kernel/perf_regs.c b/arch/riscv/kernel/perf_regs.c
new file mode 100644
index 0000000..04a38fb
--- /dev/null
+++ b/arch/riscv/kernel/perf_regs.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
+
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/perf_event.h>
+#include <linux/bug.h>
+#include <asm/perf_regs.h>
+#include <asm/ptrace.h>
+
+u64 perf_reg_value(struct pt_regs *regs, int idx)
+{
+	if (WARN_ON_ONCE((u32)idx >= PERF_REG_RISCV_MAX))
+		return 0;
+
+	return ((unsigned long *)regs)[idx];
+}
+
+#define REG_RESERVED (~((1ULL << PERF_REG_RISCV_MAX) - 1))
+
+int perf_reg_validate(u64 mask)
+{
+	if (!mask || mask & REG_RESERVED)
+		return -EINVAL;
+
+	return 0;
+}
+
+u64 perf_reg_abi(struct task_struct *task)
+{
+#if __riscv_xlen == 64
+	return PERF_SAMPLE_REGS_ABI_64;
+#else
+	return PERF_SAMPLE_REGS_ABI_32;
+#endif
+}
+
+void perf_get_regs_user(struct perf_regs *regs_user,
+			struct pt_regs *regs,
+			struct pt_regs *regs_user_copy)
+{
+	regs_user->regs = task_pt_regs(current);
+	regs_user->abi = perf_reg_abi(current);
+}
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B36D58CB1
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 06:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qVcz1vJap3dtZ2ETETyBvUXNWeCWcYHdDtLw4IHngbk=; b=pXIQ40JNLp3LYc
	HQnLJv79zdAwtJXROL16dFYINxkwRJzbl2eArQgKLltfCuRrXFdRpqR1h4Imd1HvKn1Ni5Ku1Pp1y
	wwJZ0vN6F1P5+Jkbcehe2CZxedL+jLPIMkQlGaq9rA7cR3gaIbovZqXNuwRWKSjT/bgG7IPVKJVcN
	C59KEe3Jv4Pr+YdG3dIh5c8BNdHAw8P1QIf5HborL1Ra4htQIak0BdcmncXf5I6Y8Z0DGMNRmLllH
	UFiArototUI9VF1zRCvkpbV3/a3lMduTH7TwsAwrQOTnTatkFDt3Zwvh7h89yTDh7Of0vquHEkANT
	h4TNL8gN++z4+sIa1nkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Ypv-0000000G8E3-1qw3;
	Mon, 23 Mar 2026 06:32:27 +0000
Received: from [218.30.115.80] (helo=mail115-80.sinamail.sina.com.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Ypq-0000000G8AS-3euJ
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 06:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.cn; s=201208; t=1774247543;
	bh=w/6QTn2RrWbgNuU6QaGGcFWM01G6XO+tMUvHhd4TYjY=;
	h=From:Subject:Date:Message-Id;
	b=puzK6tzY07icD22ddXeQyRX1x/Jx35ozbZdbc6dc3o77W+ubHf0GsPik79WCwOeDS
	 L8+8LhPH9xehjyRUbM8Kz0pQTZCvE1cGGyvrvrFiRUKIMKJsDMXUB+QvfQr1fwOzPK
	 ooL0mysds5d7+/3q5rcnC9Tcijhaek0qpdYJ0U10=
X-SMAIL-HELO: NTT-kernel-dev
Received: from unknown (HELO NTT-kernel-dev)([60.247.85.88])
	by sina.cn (10.185.250.23) with ESMTP
	id 69C0DE330000165C; Mon, 23 Mar 2026 14:31:19 +0800 (CST)
X-Sender: jianqkang@sina.cn
X-Auth-ID: jianqkang@sina.cn
Authentication-Results: sina.cn;
	 spf=none smtp.mailfrom=jianqkang@sina.cn;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=jianqkang@sina.cn
X-SMAIL-MID: 6027208913430
X-SMAIL-UIID: F608F980582B4633BEBF41786CA6AB3D-20260323-143119-1
From: Jianqiang kang <jianqkang@sina.cn>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	zhangchunyan@iscas.ac.cn
Cc: patches@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	xujiakai2025@iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	pjw@kernel.org
Subject: [PATCH 6.1.y] riscv: stacktrace: Disable KASAN checks for non-current tasks
Date: Mon, 23 Mar 2026 14:31:14 +0800
Message-Id: <20260323063115.3555043-1-jianqkang@sina.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_233223_816718_3CB3C893 
X-CRM114-Status: GOOD (  11.54  )
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

From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>

[ Upstream commit 060ea84a484e852b52b938f234bf9b5503a6c910 ]

Unwinding the stack of a task other than current, KASAN would report
"BUG: KASAN: out-of-bounds in walk_stackframe+0x41c/0x460"

There is a same issue on x86 and has been resolved by the commit
84936118bdf3 ("x86/unwind: Disable KASAN checks for non-current tasks")
The solution could be applied to RISC-V too.

This patch also can solve the issue:
https://seclists.org/oss-sec/2025/q4/23

Fixes: 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
Co-developed-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Link: https://lore.kernel.org/r/20251022072608.743484-1-zhangchunyan@iscas.ac.cn
[pjw@kernel.org: clean up checkpatch issues]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
[ Minor conflict resolved. ]
Signed-off-by: Jianqiang kang <jianqkang@sina.cn>
---
 arch/riscv/kernel/stacktrace.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 10e311b2759d..4f78b7962651 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -16,6 +16,22 @@
 
 #ifdef CONFIG_FRAME_POINTER
 
+/*
+ * This disables KASAN checking when reading a value from another task's stack,
+ * since the other task could be running on another CPU and could have poisoned
+ * the stack in the meantime.
+ */
+#define READ_ONCE_TASK_STACK(task, x)			\
+({							\
+	unsigned long val;				\
+	unsigned long addr = x;				\
+	if ((task) == current)				\
+		val = READ_ONCE(addr);			\
+	else						\
+		val = READ_ONCE_NOCHECK(addr);		\
+	val;						\
+})
+
 extern asmlinkage void ret_from_exception(void);
 
 static inline int fp_is_valid(unsigned long fp, unsigned long sp)
@@ -68,8 +84,9 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			fp = frame->ra;
 			pc = regs->ra;
 		} else {
-			fp = frame->fp;
-			pc = ftrace_graph_ret_addr(current, &graph_idx, frame->ra,
+			fp = READ_ONCE_TASK_STACK(task, frame->fp);
+			pc = READ_ONCE_TASK_STACK(task, frame->ra);
+			pc = ftrace_graph_ret_addr(current, &graph_idx, pc,
 						   &frame->ra);
 			if (pc == (unsigned long)ret_from_exception) {
 				if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881A6C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:57:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54485217D4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:57:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r6lqmOY4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54485217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mSEHPg570dmK57ax4NbxyDF3sBuT/M1BzOrDZuCEfpk=; b=r6lqmOY4UNUjh4
	T05NOKkTnHQIvcL8GwJ0q/XkU9Y6zXjpwzVYp00A1s7c3EvYFNUZ+QgVosrxT6VFJ0fsgkE9KPKQi
	NNIyVW+/2yx6CEalC3BNA6x2INr9kP/oKjeMLAFgsIZBpmWWKLQxBiC6XWmqE0LuGabQ21LP2yIUR
	nM5MmauBH7HGUMKE0cThSidIZoqzf1FpEZiiBa83gCdnw3w7pxN2RsfJBlApeC/FNo5dxM8YSCkJa
	h+nUTQtNxgD7BnLf60pCwfglsAp/SkbLkhY8PKRXCGY+EKcc78RDXBboZHm+JrydEtRHK2+cKsrHF
	8ryfUM7ZAfAAHJOXSniA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEYKJ-00019p-4x; Thu, 11 Apr 2019 11:57:07 +0000
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEYKG-000164-E7; Thu, 11 Apr 2019 11:57:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 7/9] riscv: remove duplicate macros from ptrace.h
Date: Thu, 11 Apr 2019 13:56:21 +0200
Message-Id: <20190411115623.5749-8-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411115623.5749-1-hch@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

No need to have two names for the same thing.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/ptrace.h | 21 ++++++---------------
 arch/riscv/kernel/stacktrace.c  |  8 ++++----
 arch/riscv/kernel/traps.c       |  2 +-
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index d35ec2f41381..9c867a4bac83 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -70,47 +70,38 @@ struct pt_regs {
 
 
 /* Helpers for working with the instruction pointer */
-#define GET_IP(regs) ((regs)->sepc)
-#define SET_IP(regs, val) (GET_IP(regs) = (val))
-
 static inline unsigned long instruction_pointer(struct pt_regs *regs)
 {
-	return GET_IP(regs);
+	return regs->sepc;
 }
 static inline void instruction_pointer_set(struct pt_regs *regs,
 					   unsigned long val)
 {
-	SET_IP(regs, val);
+	regs->sepc = val;
 }
 
 #define profile_pc(regs) instruction_pointer(regs)
 
 /* Helpers for working with the user stack pointer */
-#define GET_USP(regs) ((regs)->sp)
-#define SET_USP(regs, val) (GET_USP(regs) = (val))
-
 static inline unsigned long user_stack_pointer(struct pt_regs *regs)
 {
-	return GET_USP(regs);
+	return regs->sp;
 }
 static inline void user_stack_pointer_set(struct pt_regs *regs,
 					  unsigned long val)
 {
-	SET_USP(regs, val);
+	regs->sp =  val;
 }
 
 /* Helpers for working with the frame pointer */
-#define GET_FP(regs) ((regs)->s0)
-#define SET_FP(regs, val) (GET_FP(regs) = (val))
-
 static inline unsigned long frame_pointer(struct pt_regs *regs)
 {
-	return GET_FP(regs);
+	return regs->s0;
 }
 static inline void frame_pointer_set(struct pt_regs *regs,
 				     unsigned long val)
 {
-	SET_FP(regs, val);
+	regs->s0 = val;
 }
 
 static inline unsigned long regs_return_value(struct pt_regs *regs)
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index a4b1d94371a0..25fe0ff81f9e 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -33,9 +33,9 @@ static void notrace walk_stackframe(struct task_struct *task,
 	unsigned long fp, sp, pc;
 
 	if (regs) {
-		fp = GET_FP(regs);
-		sp = GET_USP(regs);
-		pc = GET_IP(regs);
+		fp = frame_pointer(regs);
+		sp = user_stack_pointer(regs);
+		pc = instruction_pointer(regs);
 	} else if (task == NULL || task == current) {
 		const register unsigned long current_sp __asm__ ("sp");
 		fp = (unsigned long)__builtin_frame_address(0);
@@ -83,7 +83,7 @@ static void notrace walk_stackframe(struct task_struct *task,
 
 	if (regs) {
 		sp = GET_USP(regs);
-		pc = GET_IP(regs);
+		pc = instruction_pointer(regs);
 	} else if (task == NULL || task == current) {
 		const register unsigned long current_sp __asm__ ("sp");
 		sp = current_sp;
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 24a9333dda2c..86731a2fa218 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -70,7 +70,7 @@ void do_trap(struct pt_regs *regs, int signo, int code,
 	    && printk_ratelimit()) {
 		pr_info("%s[%d]: unhandled signal %d code 0x%x at 0x" REG_FMT,
 			tsk->comm, task_pid_nr(tsk), signo, code, addr);
-		print_vma_addr(KERN_CONT " in ", GET_IP(regs));
+		print_vma_addr(KERN_CONT " in ", instruction_pointer(regs));
 		pr_cont("\n");
 		show_regs(regs);
 	}
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

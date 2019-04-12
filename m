Return-Path: <SRS0=NTR9=SO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76524C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 471A02084D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hc9+erGG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 471A02084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZB/cskwuKaLQPMcaDYAVnRXGhekvbxkbwKJPmLc60Eo=; b=hc9+erGGrjaxXX
	PTGJbIGngY3hLu5Lxwt+vBeJ8xCE47bsmFz2oupR4S18X9YM/0o4GoFo2ZAwu//R1583OJOibJYFt
	rC14uydnfs7XMigUk+O2I7PZnEqUNgyiqT4PxMgNkB5rZRZK6eLX4pMVco7vS44CD8icpaGsO0HPj
	WUNcsxuXdVc+alDkrzYtHSUupYSZlDc+aMCGJoExNQ6LxdRCDEihGafBcpbRU4F7IeKEYjnEtmQpj
	MPo6uq1B2teXjq1VlR5dsN3GJ34JvYJOhtIOReyo1SxhAsixRGVTatEgwYUZDOjFVEp/dD5p4SYeG
	VPSrm2N/Wf0bLqgGJapA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hExMB-0001Ui-LT; Fri, 12 Apr 2019 14:40:43 +0000
Received: from 089144214194.atnat0023.highway.a1.net ([89.144.214.194]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hExM8-0001PY-FW; Fri, 12 Apr 2019 14:40:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 10/12] riscv: remove duplicate macros from ptrace.h
Date: Fri, 12 Apr 2019 16:39:46 +0200
Message-Id: <20190412143948.12478-11-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190412143948.12478-1-hch@lst.de>
References: <20190412143948.12478-1-hch@lst.de>
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

No need to have two names for the same thing.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/ptrace.h | 21 ++++++---------------
 arch/riscv/kernel/stacktrace.c  |  6 +++---
 arch/riscv/kernel/traps.c       |  2 +-
 3 files changed, 10 insertions(+), 19 deletions(-)

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
index da9f796ec4d2..523735188abb 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -31,9 +31,9 @@ static void notrace walk_stackframe(struct task_struct *task,
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
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 0d5dac0eaddb..d9b2fd39c8bb 100644
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

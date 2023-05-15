Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3518C7EE22
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 03:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzMF4z83A2vZc8/Iurkv9PhlCVquHdi1V3pVTgkHHSg=; b=Zc8GlvpOizsrVA
	mlKolAa0tTeAeJioykH+tVdBw8SEXK5yfZuu2L+0pWcxda5sGakZoEU6uwVMlXoUQ+jtVQPSf8ivi
	7NQgPnz/+0/P6qbAkM5SA15P3bzk59vRusxG675Svy4ZYjGVIXpAF1U73rWojOajJgFiy6a4/9SAe
	anZ1ZgNckbAX6iNivNRLyTaBHbsRQzDUXKJMKCsALXxAzNGJhUGK4DdeVenh9QvZspYBbnwdSrqtU
	i9AQ/taDEZedl2QGJjhDXhTYRLi779BxD83i9myby4KJ5h+PBeRtSVx3jLMHJAwz2mHVhxHEBCbTC
	NHMw2GRlcqVC5Xe85BhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyOro-000jZV-2I;
	Mon, 15 May 2023 03:27:20 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyOrm-000jXb-1o
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 03:27:20 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-64a9335a8e7so17450451b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 20:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684121235; x=1686713235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Misk8RzcAuhujPj5CN4/zB0H7gvh8yXqb60mLrr5oOQ=;
        b=SUTYpi9m7sfB03krQSEVvZC8BAKoBAFKxMDYCydpITO/I8zUiiyk5Kzo+jNSg95b6v
         RhIw64DX8qMnXWvKy9BNDKbpwJyFCs1eZwm3295yCaUvKJgzf+2aYHJ8skA18ZY7Y9NG
         mvxd5TH9uewZGkdyp6C+yQy21hckWwkYwB+4u3eU94xPVquK6qutXALcwB/fmAZ6sIPJ
         KecxVHrKXwVRQjtpPenLWz035ZHCciWD97jD3PVH2NdwOESiJDOUOtONJGRC4osglUR1
         0+ZJgF8NZxTf74J2fP3+p4HBsS5RTDF7qMqjhz6gE6p19cjT7K+BAyvT1rMEnas+TqeB
         bdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684121235; x=1686713235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Misk8RzcAuhujPj5CN4/zB0H7gvh8yXqb60mLrr5oOQ=;
        b=ikcD3Y72XCJIG+a59jno4KIgy/vyHhOQuSTcpImvA7kDpAJ6RW0qibIlmSLu5DdPMm
         6jwMyS0VgW6YGDqo5mpsdAg2TlbVymm4Lo6VXs6o3MYf4TL0xLurQi4Lqpjf1/j6U7F/
         H1ujCGQ6bpZFjAu/qnwYmlvwTTyYOjIuZAP8ecFaRevP+q0zwxRAJDYNMgu+FwNkvPCz
         WePs9Lg8QYHfB7mqIovdpcsAiQz1pK2Fhoo/XnSsY+scCaBdxKybc4Q89qZAQ72RyVMk
         ARscoW/d5q7dhlFoT9W+m6L5xDaudfV0htykHAwelGNkfn0bR8Sf9HNTPGjZsp4zILA+
         7tuA==
X-Gm-Message-State: AC+VfDwVCbYj040OSjNLY1REVLJCD/JfeJmhMnMV46+ZU6xV/Atq9dg8
	1/NKBE6BeQLx26Fp/DW+/7w=
X-Google-Smtp-Source: ACHHUZ6Cgz27fn+/f04F6U/99cc0elHZFIBQRg512B0TLAkvbrJvxvIfy4wf8ER547TSO8rTWSCjpA==
X-Received: by 2002:a17:90a:ad09:b0:244:d441:8f68 with SMTP id r9-20020a17090aad0900b00244d4418f68mr44442897pjq.16.1684121235252;
        Sun, 14 May 2023 20:27:15 -0700 (PDT)
Received: from localhost.localdomain ([43.132.98.42])
        by smtp.googlemail.com with ESMTPSA id s6-20020a632146000000b0051416609fb7sm10363825pgm.61.2023.05.14.20.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 20:27:14 -0700 (PDT)
From: Ze Gao <zegao2021@gmail.com>
X-Google-Original-From: Ze Gao <zegao@tencent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Ze Gao <zegao@tencent.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH 4/4] rehook, fprobe: mark rethook related functions notrace
Date: Mon, 15 May 2023 11:26:41 +0800
Message-Id: <238bad4335d029072ca6000fb404f47376197f39.1684120990.git.zegao@tencent.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1684120990.git.zegao@tencent.com>
References: <cover.1684120990.git.zegao@tencent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_202718_608242_1EC28291 
X-CRM114-Status: GOOD (  15.66  )
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

These functions are already marked as NOKPROBE to prevent recusion and
we have the same reason to blacklist them if rethook is used with fprobe,
since they are beyond the recursion-free region ftrace can guard.

Signed-off-by: Ze Gao <zegao@tencent.com>
---
 arch/riscv/kernel/probes/rethook.c | 4 ++--
 arch/s390/kernel/rethook.c         | 6 +++---
 arch/x86/kernel/rethook.c          | 8 +++++---
 kernel/trace/rethook.c             | 8 ++++----
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/probes/rethook.c b/arch/riscv/kernel/probes/rethook.c
index 5c27c1f50989..803c412a1bea 100644
--- a/arch/riscv/kernel/probes/rethook.c
+++ b/arch/riscv/kernel/probes/rethook.c
@@ -8,14 +8,14 @@
 #include "rethook.h"
 
 /* This is called from arch_rethook_trampoline() */
-unsigned long __used arch_rethook_trampoline_callback(struct pt_regs *regs)
+unsigned long __used notrace arch_rethook_trampoline_callback(struct pt_regs *regs)
 {
 	return rethook_trampoline_handler(regs, regs->s0);
 }
 
 NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
 
-void arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
+void notrace arch_rethook_prepare(struct rethook_node *rhn, struct pt_regs *regs, bool mcount)
 {
 	rhn->ret_addr = regs->ra;
 	rhn->frame = regs->s0;
diff --git a/arch/s390/kernel/rethook.c b/arch/s390/kernel/rethook.c
index af10e6bdd34e..ad52119826c1 100644
--- a/arch/s390/kernel/rethook.c
+++ b/arch/s390/kernel/rethook.c
@@ -3,7 +3,7 @@
 #include <linux/kprobes.h>
 #include "rethook.h"
 
-void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
+void notrace arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
 {
 	rh->ret_addr = regs->gprs[14];
 	rh->frame = regs->gprs[15];
@@ -13,7 +13,7 @@ void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mc
 }
 NOKPROBE_SYMBOL(arch_rethook_prepare);
 
-void arch_rethook_fixup_return(struct pt_regs *regs,
+void notrace arch_rethook_fixup_return(struct pt_regs *regs,
 			       unsigned long correct_ret_addr)
 {
 	/* Replace fake return address with real one. */
@@ -24,7 +24,7 @@ NOKPROBE_SYMBOL(arch_rethook_fixup_return);
 /*
  * Called from arch_rethook_trampoline
  */
-unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs)
+unsigned long notrace arch_rethook_trampoline_callback(struct pt_regs *regs)
 {
 	return rethook_trampoline_handler(regs, regs->gprs[15]);
 }
diff --git a/arch/x86/kernel/rethook.c b/arch/x86/kernel/rethook.c
index 8a1c0111ae79..1f7cef86f73d 100644
--- a/arch/x86/kernel/rethook.c
+++ b/arch/x86/kernel/rethook.c
@@ -64,7 +64,8 @@ NOKPROBE_SYMBOL(arch_rethook_trampoline);
 /*
  * Called from arch_rethook_trampoline
  */
-__used __visible void arch_rethook_trampoline_callback(struct pt_regs *regs)
+__used __visible void notrace arch_rethook_trampoline_callback(struct pt_regs
+		*regs)
 {
 	unsigned long *frame_pointer;
 
@@ -104,7 +105,7 @@ NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
 STACK_FRAME_NON_STANDARD_FP(arch_rethook_trampoline);
 
 /* This is called from rethook_trampoline_handler(). */
-void arch_rethook_fixup_return(struct pt_regs *regs,
+void notrace arch_rethook_fixup_return(struct pt_regs *regs,
 			       unsigned long correct_ret_addr)
 {
 	unsigned long *frame_pointer = (void *)(regs + 1);
@@ -114,7 +115,8 @@ void arch_rethook_fixup_return(struct pt_regs *regs,
 }
 NOKPROBE_SYMBOL(arch_rethook_fixup_return);
 
-void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
+void notrace arch_rethook_prepare(struct rethook_node *rh, struct pt_regs
+		*regs, bool mcount)
 {
 	unsigned long *stack = (unsigned long *)regs->sp;
 
diff --git a/kernel/trace/rethook.c b/kernel/trace/rethook.c
index 60f6cb2b486b..e551e86d3927 100644
--- a/kernel/trace/rethook.c
+++ b/kernel/trace/rethook.c
@@ -127,7 +127,7 @@ static void free_rethook_node_rcu(struct rcu_head *head)
  * Return back the @node to @node::rethook. If the @node::rethook is already
  * marked as freed, this will free the @node.
  */
-void rethook_recycle(struct rethook_node *node)
+void notrace rethook_recycle(struct rethook_node *node)
 {
 	lockdep_assert_preemption_disabled();
 
@@ -194,7 +194,7 @@ void rethook_hook(struct rethook_node *node, struct pt_regs *regs, bool mcount)
 NOKPROBE_SYMBOL(rethook_hook);
 
 /* This assumes the 'tsk' is the current task or is not running. */
-static unsigned long __rethook_find_ret_addr(struct task_struct *tsk,
+static unsigned long notrace __rethook_find_ret_addr(struct task_struct *tsk,
 					     struct llist_node **cur)
 {
 	struct rethook_node *rh = NULL;
@@ -256,7 +256,7 @@ unsigned long rethook_find_ret_addr(struct task_struct *tsk, unsigned long frame
 }
 NOKPROBE_SYMBOL(rethook_find_ret_addr);
 
-void __weak arch_rethook_fixup_return(struct pt_regs *regs,
+void __weak notrace arch_rethook_fixup_return(struct pt_regs *regs,
 				      unsigned long correct_ret_addr)
 {
 	/*
@@ -268,7 +268,7 @@ void __weak arch_rethook_fixup_return(struct pt_regs *regs,
 }
 
 /* This function will be called from each arch-defined trampoline. */
-unsigned long rethook_trampoline_handler(struct pt_regs *regs,
+unsigned long notrace rethook_trampoline_handler(struct pt_regs *regs,
 					 unsigned long frame)
 {
 	struct llist_node *first, *node = NULL;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

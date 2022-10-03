Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7069CC433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Oct 2022 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=952vVVcCBGkyxp1KTWZWO/Y5N8wnPMra9MRQc79FOms=; b=R91+ehNzuS14Di
	MAKSabr3qTcCuUH/9CkqjV76pvTXDDvy8QtIPwQ4bL4z8obps+nxQVwvGZO7OKMAMSjur2Pgipc14
	8LfPm7xJj9qxHont/ILqo3H3rIpitKtONURNvbL3tFGS1mZ/Aet7uN1NC1vbHS4kK8u6dQu3wrXY6
	sSexqCF8Dkk6iWhOHAYny/1a0ef/l7rRkew+xNpB8/IQkGnch+QtqNdzQB8oCZBEXTgoC9pSMg2XD
	KUFZ17yALBIn1ZQP0s6RUPm3qqkTJDQ1VtTxvkU6ZZASwYCCAutrNc1FmrFYzEa4rMMKHvB7XkA0/
	IYMfFx05JPhDIrEv9xgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIqk-005Kpm-01; Mon, 03 Oct 2022 10:39:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofIqg-005KnY-K3
	for linux-riscv@lists.infradead.org; Mon, 03 Oct 2022 10:39:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 48F39B8104F;
	Mon,  3 Oct 2022 10:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DD4C433D6;
	Mon,  3 Oct 2022 10:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664793536;
	bh=Ge/o7Rp8DcY2sG0HuCr9FZPeFSgyQgALAhESbZPndRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZaefyPbry2+/5DcwEpVZlyTQfffy/QXFw2DUFzzbsDvxRnGR21S2t/KwZT3ATBXha
	 lxrD1qzQiZoBI8aJJgbfoR6TWckp/KrqnWTZlgRsmWc63P3LmfF2r82uQVcs32F1US
	 tsJk6YBDilccAjDtZeNTwMWavvXFSzcCCEcLTHKkjNzZHetyonpT8rHBoaioUOqUSy
	 rtFQD76heyFpj5nTk8zSGPzKy+eofdjRsaHa0V0du7cBFr8UT+JeaXZ9Dqce6BRNTL
	 tqDJBW1LPZ/ebb9/8wbE3hB1EzyfR4cpUv1iKkuNtCmZ5gF5B/KAsutiYHiZcezC4c
	 rklcZlV5+fvVQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] riscv: consolidate ret_from_kernel_thread into ret_from_fork
Date: Mon,  3 Oct 2022 18:29:19 +0800
Message-Id: <20221003102921.3973-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221003102921.3973-1-jszhang@kernel.org>
References: <20221003102921.3973-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_033858_827314_3B4747C9 
X-CRM114-Status: GOOD (  12.57  )
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

The ret_from_kernel_thread() behaves similarly with ret_from_fork(),
the only difference is whether call the fn(arg) or not, this can be
acchieved by testing fn is NULL or not, I.E s0 is 0 or not.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/entry.S   | 11 +++--------
 arch/riscv/kernel/process.c |  5 ++---
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 39097c1474a0..d227aca7f9d4 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -323,20 +323,15 @@ END(handle_kernel_stack_overflow)
 
 ENTRY(ret_from_fork)
 	call schedule_tail
-	move a0, sp /* pt_regs */
-	la ra, ret_from_exception
-	tail syscall_exit_to_user_mode
-ENDPROC(ret_from_fork)
-
-ENTRY(ret_from_kernel_thread)
-	call schedule_tail
+	beqz s0, 1f	/* not from kernel thread */
 	/* Call fn(arg) */
 	move a0, s1
 	jalr s0
+1:
 	move a0, sp /* pt_regs */
 	la ra, ret_from_exception
 	tail syscall_exit_to_user_mode
-ENDPROC(ret_from_kernel_thread)
+ENDPROC(ret_from_fork)
 
 
 /*
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 52002d54b163..fdafed185e21 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -34,7 +34,6 @@ EXPORT_SYMBOL(__stack_chk_guard);
 #endif
 
 extern asmlinkage void ret_from_fork(void);
-extern asmlinkage void ret_from_kernel_thread(void);
 
 void arch_cpu_idle(void)
 {
@@ -174,7 +173,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		/* Supervisor/Machine, irqs on: */
 		childregs->status = SR_PP | SR_PIE;
 
-		p->thread.ra = (unsigned long)ret_from_kernel_thread;
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 	} else {
@@ -184,8 +182,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		if (clone_flags & CLONE_SETTLS)
 			childregs->tp = tls;
 		childregs->a0 = 0; /* Return value of fork() */
-		p->thread.ra = (unsigned long)ret_from_fork;
+		p->thread.s[0] = 0;
 	}
+	p->thread.ra = (unsigned long)ret_from_fork;
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

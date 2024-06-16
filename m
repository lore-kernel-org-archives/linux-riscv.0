Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B23CC27C6E
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KpNgiNP1Qolw3vkfePiaCgGvOIKTMIGC/jMs1xkVAjA=; b=KgD47LTdKJWoRg
	y3qu+HGY1/naoUpInYX7IjKyt2YKPmrqZGMDo2h2kL7JW8+OJ0MmXb3i8+jFRz9yBH/H+gwnx6cqZ
	fHY3phP4OcAuEFtGI+5dnkHZAieWJdfdwPeffEq4lZdQKw9Zwkse7kZirBDQAWekwI9gYAiEj+05G
	i8hUf6JRD1h/XWKDAZE5qMJMdConLHqPzWaujn8z970oZLv5U5NZwwhlaIbVmRbphpR+djKM5voFm
	pWuI/bSI+3wRqT8xzPnoMmY4tMiArOMaLDyAN97MUbGvhSDLTxR8nd0bkFLhvSSl2PwFb8HL/9byr
	ek15CsmkGgPwzQrMpqQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItXx-00000007xL7-1MZb;
	Sun, 16 Jun 2024 17:20:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItXq-00000007xFa-31ow
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:20:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 065CF60EAA;
	Sun, 16 Jun 2024 17:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81587C4AF4D;
	Sun, 16 Jun 2024 17:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718558397;
	bh=E3GXEIZD9yn8wjrqGOzrCdvgMio8fL8UM/D6vQXKlWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qMToKE0fdCNS9u9oH3qr8ZrWlxfAlYo0h0NIawg2WKdqHq7P0ptMQCHq4PMX0+qnR
	 A6hc2daFhj2lvMPafkx6EfsLRX6X4ycBeMofZ0Xyohq4lMTJp9T8yhT6JNN9b2Crlo
	 0xcn7yW8+ApwXbnC42MxyfrXPbi9KZQ8e5T5sTotRSH9bnI6+8y1Sc4XsJZU9wZVed
	 qLFJTr+mkMm9B1hYHu/eCZ5yEaS+msrYvc1XR3+TRaofVH7adIPR/+PxOIEO3xt1oL
	 W3okdmcySYO/JjHSzgiit1EjiVBV5gyUwm711EXhnl040rKgqi26+Zzy9kf2Jf22s1
	 Xqo0an8m8DQHw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] riscv: remove asmlinkage from updated functions
Date: Mon, 17 Jun 2024 01:05:53 +0800
Message-ID: <20240616170553.2832-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240616170553.2832-1-jszhang@kernel.org>
References: <20240616170553.2832-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_101958_967710_88275319 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Now that the callers of these functions have moved into C, they no longer
need the asmlinkage annotation. Remove it

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/asm-prototypes.h |  6 +++---
 arch/riscv/kernel/traps.c               | 16 ++++++++--------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index 81a1f27fa54f..70b86a825922 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -37,7 +37,7 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs);
 
 #endif /* CONFIG_RISCV_ISA_V */
 
-#define DECLARE_DO_ERROR_INFO(name)	asmlinkage void name(struct pt_regs *regs)
+#define DECLARE_DO_ERROR_INFO(name)	void name(struct pt_regs *regs)
 
 DECLARE_DO_ERROR_INFO(do_trap_unknown);
 DECLARE_DO_ERROR_INFO(do_trap_insn_misaligned);
@@ -53,8 +53,8 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
 
 asmlinkage void handle_bad_stack(struct pt_regs *regs);
-asmlinkage void do_page_fault(struct pt_regs *regs);
-asmlinkage void do_irq(struct pt_regs *regs);
+void do_page_fault(struct pt_regs *regs);
+void do_irq(struct pt_regs *regs);
 asmlinkage void do_traps(struct pt_regs *regs);
 
 #endif /* _ASM_RISCV_PROTOTYPES_H */
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index b44d4a8d4083..ddca8e74fb72 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -147,7 +147,7 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
 #define __trap_section noinstr
 #endif
 #define DO_ERROR_INFO(name, signo, code, str)					\
-asmlinkage __visible __trap_section void name(struct pt_regs *regs)		\
+__visible __trap_section void name(struct pt_regs *regs)			\
 {										\
 	if (user_mode(regs)) {							\
 		irqentry_enter_from_user_mode(regs);				\
@@ -167,7 +167,7 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
 DO_ERROR_INFO(do_trap_insn_fault,
 	SIGSEGV, SEGV_ACCERR, "instruction access fault");
 
-asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
+__visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
 {
 	bool handled;
 
@@ -198,7 +198,7 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
 DO_ERROR_INFO(do_trap_load_fault,
 	SIGSEGV, SEGV_ACCERR, "load access fault");
 
-asmlinkage __visible __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
+__visible __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
@@ -219,7 +219,7 @@ asmlinkage __visible __trap_section void do_trap_load_misaligned(struct pt_regs
 	}
 }
 
-asmlinkage __visible __trap_section void do_trap_store_misaligned(struct pt_regs *regs)
+__visible __trap_section void do_trap_store_misaligned(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
@@ -294,7 +294,7 @@ void handle_break(struct pt_regs *regs)
 		die(regs, "Kernel BUG");
 }
 
-asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
+__visible __trap_section void do_trap_break(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
@@ -311,7 +311,7 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
 	}
 }
 
-asmlinkage __visible __trap_section  __no_stack_protector
+__visible __trap_section  __no_stack_protector
 void do_trap_ecall_u(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
@@ -355,7 +355,7 @@ void do_trap_ecall_u(struct pt_regs *regs)
 }
 
 #ifdef CONFIG_MMU
-asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
+__visible noinstr void do_page_fault(struct pt_regs *regs)
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
@@ -378,7 +378,7 @@ static void noinstr handle_riscv_irq(struct pt_regs *regs)
 	irq_exit_rcu();
 }
 
-asmlinkage void noinstr do_irq(struct pt_regs *regs)
+void noinstr do_irq(struct pt_regs *regs)
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

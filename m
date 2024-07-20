Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F57C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 17:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkoSmKoHZEi3GHqoZ3KOzM9W97G8M7B4U6mhYNlmQbk=; b=kvmTixTasXD1nT
	nk2u7JIIq7vl8HRGruNDhwRY7YWI1oHU+SnpnX3KhfZ0saxBM4H/u8yItttEmiyLG8xhWXJyYmluu
	RVDBlZJ/9A34fb+ajjcojhrDmyomJSGJY2T30yi1dDLrOJm8ocgOU/+aJUwhwYx2ACztj1BG4k0OZ
	7y0SEMRh/2fPDOUqeLPt8sXOlFzNSI7sDtCAJKqbrEEhy6BSeGOF7S9FrugrCEngFfU38511pkF8N
	t9ZojEJGLhmK4aOlKE0HPzbRqcWbzkPB1GhAaomZ4LtwaYMPLC0gJWnvz+GelqP+cQGv0FQm9X4bh
	Cq0HRKxO6BDG5kksEW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrH-00000005QaF-0lOV;
	Sat, 20 Jul 2024 17:26:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrC-00000005QY2-1no3
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jul 2024 17:26:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DD9560FDB;
	Sat, 20 Jul 2024 17:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCCC0C4AF0E;
	Sat, 20 Jul 2024 17:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721496413;
	bh=98NBtrS/SMiq12hZfID75Yi7wQQ0UoZjx4bDe8JfM7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N4ztOcRFtt/L8y27kj71vaMp/hVPX2rJ4XGAvHs2lK82jNMi7tHf63+X4gZ6ikrOL
	 5NCdG91/FjCSWTnPZu0DN4v81Pr99PSPEt+JF4DRdNQlGLiu3drOFFWs/9qycQOl09
	 9S9DDIlttmYex+ufURu9cwx76Gvu24azkKA5HYf1gCU4spDsZIOu9s9gPYIR9j2uC0
	 xdJEajhAV4WWiKPviJXA/F4ibDbR3WgZbCf/uHvyP34sUPLkD+DPo6wvU01GaZUIlr
	 mDcqR/ITjGxO1s+H2Ms9xAScH0925ep10jddLPR8UESmKdZSnh2QJbMouFH8zx5gfH
	 p0Ijsu6L28aJg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Clement Leger <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] riscv: traps: remove __visible annotation
Date: Sun, 21 Jul 2024 01:12:27 +0800
Message-ID: <20240720171232.1753-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720171232.1753-1-jszhang@kernel.org>
References: <20240720171232.1753-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_102654_589318_12F84A55 
X-CRM114-Status: UNSURE (   8.07  )
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

Commit f307307992bf ("riscv: for C functions called only from assembly,
mark with __visible") resolve sparse warnings for C functions called
only by assembly code by adding __visible annotations instead of
adding prototypes. But after commit 030f1dfa8550 ("riscv: traps: Fix no
prototype warnings"), prototypes were added. So the __visible
annotations are not needed any more, remove them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/traps.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 84dff89f435d..3d1f84cb6eac 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -147,7 +147,7 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
 #define __trap_section noinstr
 #endif
 #define DO_ERROR_INFO(name, signo, code, str)					\
-asmlinkage __visible __trap_section void name(struct pt_regs *regs)		\
+asmlinkage __trap_section void name(struct pt_regs *regs)			\
 {										\
 	if (user_mode(regs)) {							\
 		irqentry_enter_from_user_mode(regs);				\
@@ -167,7 +167,7 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
 DO_ERROR_INFO(do_trap_insn_fault,
 	SIGSEGV, SEGV_ACCERR, "instruction access fault");
 
-asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
+asmlinkage __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
 {
 	bool handled;
 
@@ -198,7 +198,7 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
 DO_ERROR_INFO(do_trap_load_fault,
 	SIGSEGV, SEGV_ACCERR, "load access fault");
 
-asmlinkage __visible __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
+asmlinkage __trap_section void do_trap_load_misaligned(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
@@ -219,7 +219,7 @@ asmlinkage __visible __trap_section void do_trap_load_misaligned(struct pt_regs
 	}
 }
 
-asmlinkage __visible __trap_section void do_trap_store_misaligned(struct pt_regs *regs)
+asmlinkage __trap_section void do_trap_store_misaligned(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
@@ -294,7 +294,7 @@ static void handle_break(struct pt_regs *regs)
 		die(regs, "Kernel BUG");
 }
 
-asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
+asmlinkage __trap_section void do_trap_break(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
@@ -311,7 +311,7 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
 	}
 }
 
-asmlinkage __visible __trap_section  __no_stack_protector
+asmlinkage __trap_section  __no_stack_protector
 void do_trap_ecall_u(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
@@ -355,7 +355,7 @@ void do_trap_ecall_u(struct pt_regs *regs)
 }
 
 #ifdef CONFIG_MMU
-asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
+asmlinkage noinstr void do_page_fault(struct pt_regs *regs)
 {
 	irqentry_state_t state = irqentry_enter(regs);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

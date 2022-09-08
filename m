Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE662C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 02:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ez/NOuufdtjF0H1y+IulEVbAKeBeJ9VNXF/h4Ft/qUQ=; b=BRp7XKjoGWMI67
	hDuYlUef9EiMHkA8i5Nbz79R4koOdv0T4AT5JVymbWwS1FEy3Ujiq4JjJ2rlnQoeQpGEGnn3EusEf
	5YrD4cPdzlRrPbuhLavS1nFUWZKy8dzKlAMlLGZAjgNSa7BhXt2jIZnVrNrENjRcuWP5otlZQvTOL
	S+x0/eEWa9lyZnkOz1yA3P6JV7b6CNd7wXpV0BSY8OWUHFrpvyGbWKe/FUFSZC1dg53xrnM/9Lngf
	7Gg8qlUHBsV/C2lIyyrKowFlugyVF8kthk7nztWahONV5TnnjmcRX8zGpDMnx4AXX9qsLgnjYlMFh
	9D9RhO/S/JJUn3MwL0bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7Ek-00EfQ3-UA; Thu, 08 Sep 2022 02:25:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7Eh-00EfLX-8W
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 02:25:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE211618C5;
	Thu,  8 Sep 2022 02:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F4BC43140;
	Thu,  8 Sep 2022 02:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662603946;
	bh=Zb4Hmj1kW5/CGOJFKVCs2eG+dRN6j+fP3pwPcfq9g0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c8r0hlT8FWO5Nzf8Ijp2K2cTeilQoFMTldBS5lav+XQSaLfxad35Fsk0x9ZLWKHEN
	 fudyy9O45Z3xyvNmIwT41rM0HnK88WfiAsf1hWI7j1lESkcXJJQPaU7xpoBj4Y2iGh
	 0ilK188HSkvCU0Wsx5VJqYnTrv0NSKCIJPor4mTOwl/ZFLP5q5kouw0KIn62qZdfki
	 FYCsMi5LHl+iDotRAufAIm0phsu5owUzMsnNjXo4KZ50NbgoLRR1KGhUZlgCbuQoza
	 M+Z2/eDeT2fAgKhwHcORss7aAczA/5lkLWiXJSiRG/2XV4UqXkbNVTo1XMImCV+W0f
	 cD/gv0WLWFaIA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	bigeasy@linutronix.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 4/8] riscv: traps: Add noinstr to prevent instrumentation inserted
Date: Wed,  7 Sep 2022 22:25:02 -0400
Message-Id: <20220908022506.1275799-5-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220908022506.1275799-1-guoren@kernel.org>
References: <20220908022506.1275799-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_192547_411420_F76F4419 
X-CRM114-Status: GOOD (  14.59  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Without noinstr the compiler is free to insert instrumentation (think
all the k*SAN, KCov, GCov, ftrace etc..) which can call code we're not
yet ready to run this early in the entry path, for instance it could
rely on RCU which isn't on yet, or expect lockdep state. (by peterz)

Link: https://lore.kernel.org/linux-riscv/YxcQ6NoPf3AH0EXe@hirez.programming.kicks-ass.net/raw
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/traps.c | 8 ++++----
 arch/riscv/mm/fault.c     | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 635e6ec26938..3ed3dbec250d 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -97,7 +97,7 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
 #define __trap_section
 #endif
 #define DO_ERROR_INFO(name, signo, code, str)				\
-asmlinkage __visible __trap_section void name(struct pt_regs *regs)	\
+asmlinkage __visible __trap_section void noinstr name(struct pt_regs *regs)	\
 {									\
 	do_trap_error(regs, signo, code, regs->epc, "Oops - " str);	\
 }
@@ -121,7 +121,7 @@ DO_ERROR_INFO(do_trap_store_misaligned,
 int handle_misaligned_load(struct pt_regs *regs);
 int handle_misaligned_store(struct pt_regs *regs);
 
-asmlinkage void __trap_section do_trap_load_misaligned(struct pt_regs *regs)
+asmlinkage __trap_section void noinstr do_trap_load_misaligned(struct pt_regs *regs)
 {
 	if (!handle_misaligned_load(regs))
 		return;
@@ -129,7 +129,7 @@ asmlinkage void __trap_section do_trap_load_misaligned(struct pt_regs *regs)
 		      "Oops - load address misaligned");
 }
 
-asmlinkage void __trap_section do_trap_store_misaligned(struct pt_regs *regs)
+asmlinkage __trap_section void noinstr do_trap_store_misaligned(struct pt_regs *regs)
 {
 	if (!handle_misaligned_store(regs))
 		return;
@@ -156,7 +156,7 @@ static inline unsigned long get_break_insn_length(unsigned long pc)
 	return GET_INSN_LENGTH(insn);
 }
 
-asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
+asmlinkage __visible __trap_section void noinstr do_trap_break(struct pt_regs *regs)
 {
 #ifdef CONFIG_KPROBES
 	if (kprobe_single_step_handler(regs))
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index f2fbd1400b7c..c7829289e806 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -203,7 +203,7 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
  * This routine handles page faults.  It determines the address and the
  * problem, and then passes it off to one of the appropriate routines.
  */
-asmlinkage void do_page_fault(struct pt_regs *regs)
+asmlinkage void noinstr do_page_fault(struct pt_regs *regs)
 {
 	struct task_struct *tsk;
 	struct vm_area_struct *vma;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

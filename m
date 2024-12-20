Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACA8E7718D
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tC+gvlqcOS3vQ6loD/PzlMf4tyw++GCZPF9Qs/IDVAQ=; b=KKCT/nA2Fiv8Bx
	+VvV4eWpeOUjHGFm2Ol1BA+vfLpgteXyxXkdPbx7MQOzuz+kfvCMQTK7YpufGziOi6KOhbEryKTmd
	V6A8FgG0Ilo1LJnUt0hSQt+kok9mFXDYwtFDFis1gl7ihz/4BB7z3PxuwwRDxl5fRP+ZHaz65EXGR
	YL6gJr+0Po/RoPrgf1fzzKtZ5j+UlkMH8b58GGX6CpkI3iFhl3lyFrhr75CK3eHlR4cLaNE10BCHI
	o18UXAZgZXgZcDc3KLBHFwDoxSL2UkObzgRvksfGdAS1FLPbsdOBddqjYSkvrpDCiOwA8EDHI/9LE
	GKDA5Zl/6qqJnT9JAVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOP-00000005O0d-3jVq;
	Fri, 20 Dec 2024 15:58:21 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOH-00000005NtN-2DIj
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E6Cvl+CmVX6/psQST7J+RL1e1pZwMBpeyyec77Ez6rM=; b=nBafdhbLpa+Ca5tWntqfRP28qr
	6h5N0lBoh+ObPrK4AAyld/80dz8Kxkt5VOWsc9qY7N6pizkq9K/nGpF6QoGm/dKr64t+bdA9roqMw
	IsIvQe+Ol416AQFNuym9TomijNdLdTqxtuZbSUgW9cdlHxaVaawvhuul2nPnVxjGwbKe++C/gVDJ5
	03rtu0ulFN8zZnXIWzhXZO5Eq+qZcYuvOxf6JLQib1L5C1YcWW3/6w7YFDQ+mAQrW2f2g8VlfH2ew
	nSmUrpssaZPNydsMQplIzRFIy9LYhbEw0BNSvjFlSb8zLqMMo/rJmWSAXNidDjy/IaQohbpHDMzu1
	YHZARb6g==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfOA-00ADAT-5F; Fri, 20 Dec 2024 15:58:06 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LTS-3zRi;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 15/15] riscv: traps: make insn fetch common in unknown instruction
Date: Fri, 20 Dec 2024 15:58:01 +0000
Message-Id: <20241220155801.1988785-16-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_075813_634065_91CD36F1 
X-CRM114-Status: GOOD (  12.37  )
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

Add the trapped instruction (insn) as the second argument to
riscv_v_first_use_handler() from the trap handler so when we
add more handlers we can do the fetch of the instruction just
once.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
- fixed wording of patch from rfc
v2:
  - fixed todo by going to illegal instruction error if get_user fails
  - added pointer print for failed read
  - fixed issues with rebasing onto main branch
v3:
  - removed print from v2
---
 arch/riscv/include/asm/vector.h |  5 +++--
 arch/riscv/kernel/traps.c       | 13 +++++++++++--
 arch/riscv/kernel/vector.c      | 11 +----------
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index be7d309cca8a..24f77a56ac57 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -21,7 +21,7 @@
 
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
-bool riscv_v_first_use_handler(struct pt_regs *regs);
+bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn);
 void kernel_vector_begin(void);
 void kernel_vector_end(void);
 void get_cpu_vector_context(void);
@@ -268,7 +268,8 @@ struct pt_regs;
 
 static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
 static __always_inline bool has_vector(void) { return false; }
-static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
+static __always_inline bool insn_is_vector(u32 insn_buf) { return false; }
+static inline bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn) { return false; }
 static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vsize (0)
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index a475fd9310fd..5ef418b0b7b2 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -169,17 +169,26 @@ DO_ERROR_INFO(do_trap_insn_fault,
 
 asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
 {
-	bool handled;
+	bool handled = false;
 
 	if (user_mode(regs)) {
+		u32 __user *epc = (u32 __user *)regs->epc;
+		u32 insn = (u32)regs->badaddr;
+
 		irqentry_enter_from_user_mode(regs);
 
 		local_irq_enable();
 
-		handled = riscv_v_first_use_handler(regs);
+		if (!insn) {
+			if (__get_user(insn, epc))
+				goto no_insn;
+		}
+
+		handled = riscv_v_first_use_handler(regs, insn);
 
 		local_irq_disable();
 
+	no_insn:
 		if (!handled)
 			do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
 				      "Oops - illegal instruction");
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 682b3feee451..b852648cb8d5 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -168,11 +168,8 @@ bool riscv_v_vstate_ctrl_user_allowed(void)
 }
 EXPORT_SYMBOL_GPL(riscv_v_vstate_ctrl_user_allowed);
 
-bool riscv_v_first_use_handler(struct pt_regs *regs)
+bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn)
 {
-	u32 __user *epc = (u32 __user *)regs->epc;
-	u32 insn = (u32)regs->badaddr;
-
 	if (!has_vector())
 		return false;
 
@@ -184,12 +181,6 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 	if (riscv_v_vstate_query(regs))
 		return false;
 
-	/* Get the instruction */
-	if (!insn) {
-		if (__get_user(insn, epc))
-			return false;
-	}
-
 	/* Filter out non-V instructions */
 	if (!insn_is_vector(insn))
 		return false;
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

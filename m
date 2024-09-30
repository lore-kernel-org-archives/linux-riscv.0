Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0506CE835D
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 17:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Od87KDvEGVzzQi077duqoV8Q04u7ElAxznhhYa4pQm8=; b=12l7bfsYj4cy3S
	nQ72a1lAmvFQ8W1oGMTXDcGhm50N8L22jmaMPk8758ngHwGZsZuUQ5bImvQ4x22h9AUX/pNGIcoLX
	59FbJeRIr+3Eam8VKjDx1y92umEcV+O4TR4WTZZOcEGqvxjZb0LBfn/HjyCWVpICYc5Qun5Qrgujg
	RrgwlkRVw7GYvnNljqBWXBTR9QpSJEyaCiVO3pxsfEVvxktpYJs+NERp3N4c5AeSF12l4/4ZBwoWI
	/KBkTOVPpfSLVyGn+0k/zq8F7hULmRt6fEyOL76pgP6JBzpvbbMsK0v5GY7KiGBKFd1usm+Xmq6sW
	h7yj59Td4KN3zVYDzmCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svK2o-00000000Mr1-2V4u;
	Mon, 30 Sep 2024 17:18:46 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svJzS-00000000MTF-3FNM
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 17:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gtRmv9BrhSGoV+dH/R03FLbWHG3jzP2Ra9nhvo2NjUU=; b=NL7rltQk48pByyUcIuaM8S3GMN
	w0YaCi+K++zKuwgRWX13R/ELJRIk1nX94Z9C9utKc2nA0BkEsYi+IpO47kJyu44u5eAXZ413XpuoA
	gWs4KdYHdm3AMG0+C+H9ERtH7FPMSHnxsqTfa1Or4AutU2K0zIkfwbQ+88iEjwHii8TLgWJw4T1D8
	EMSpuvmSaME3bBY5JpX+SdZ0eCCtRdiOhuQ3tdQjJr/ubY3IkJnFaRSUcbWGKVfF9rSFtRNLfBN8j
	5SctQRprSTOZxLuT5SGn0YU+CQ1KvFwTVmD4Bpc8ZotX90GCRWyy+JJ2gKboydtSsHFwkASjQ8DeP
	XYIMX5xw==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1svJzL-006Txm-Ho; Mon, 30 Sep 2024 18:15:12 +0100
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1svJzL-00000002PwP-3GP1;
	Mon, 30 Sep 2024 18:15:11 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: ben.dooks@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: [PATCH] riscv: traps: make insn fetch common in unknown instruction
Date: Mon, 30 Sep 2024 18:15:10 +0100
Message-Id: <20240930171510.576364-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_101518_924582_90767DE4 
X-CRM114-Status: GOOD (  12.31  )
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

Add the insn as the second argument to riscv_v_first_use_handler() form
the trap handler so when we add more handlers we can do the fetch of the
instruction just once.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/vector.h |  4 ++--
 arch/riscv/kernel/traps.c       | 11 ++++++++++-
 arch/riscv/kernel/vector.c      | 11 +----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index be7d309cca8a..c9f0b02cd975 100644
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
@@ -268,7 +268,7 @@ struct pt_regs;
 
 static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
 static __always_inline bool has_vector(void) { return false; }
-static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
+static inline bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn) { return false; }
 static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vsize (0)
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 51ebfd23e007..1c3fab272fd1 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -172,11 +172,20 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
 	bool handled;
 
 	if (user_mode(regs)) {
+		u32 __user *epc = (u32 __user *)regs->epc;
+		u32 insn = (u32)regs->badaddr;
+
 		irqentry_enter_from_user_mode(regs);
 
 		local_irq_enable();
 
-		handled = riscv_v_first_use_handler(regs);
+		if (!insn) {
+			if (__get_user(insn, epc)) {
+				/* todo */
+			}
+		}
+
+		handled = riscv_v_first_use_handler(regs, insn);
 
 		local_irq_disable();
 
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

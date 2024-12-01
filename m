Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD28FD49761
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Dec 2024 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IqgdooJS5CpVfu/nBKwlsEQXMDlLJXlaCPq1uIfTXM=; b=o4yKkx1a46zLJb
	q0rj+LGTy5LhtZdXWI+iAcOzxE3NfqoXZ9Xj0swWftTQx6yxTAgO/UI8d85DslrBbi4q+HXKxPYxy
	QGa7pz8vf7KPWyoDYb+hTH9ZUTThWcmvZzqoA/LTCp1gq7tI3FO471sGkZHmu94M2J28974vNxmP6
	x0r4tPGoP4XffzlV41c8oZglFGmFnyGTbscUhNgvEIpk9wxXPCGOstElx5N4ZlF2u+Drdrx9guPp3
	kmJbN8vj3Yind+C6xMF9/MRICCkYC+OVfg9ZcDyiVGJz10JKwaf1xojHuZDqV1juf+tRAU70M5ifz
	TsOpBtprEw4yZcBteYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHhBV-00000003IO1-1CdG;
	Sun, 01 Dec 2024 10:28:13 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHhBQ-00000003IMU-3yAu
	for linux-riscv@lists.infradead.org;
	Sun, 01 Dec 2024 10:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rziJ/igp4rrah2Qo06FBEcCbvzrdQxCbCn2xe/IEfkc=; b=Ifn5RY8KywWfjv2DYpfT/Xte/K
	vlBSHKlM/5sjIYSZ3FC4lWKvwBdL2rJra09WlE43AR2iQsPscyELQXzzvJyKmM5FjdidYdctSQ5Kc
	p7Z82ZLmmk16R4LfFe9PjmKjE4SuqnvSBZ5vPBF8CfGCbGooUB2vaBCzHT1QbHWAAb38QcdsPYjno
	77Rnm5oM2fxBHIuLUzMs9bgJD7y/pbXqWl9qm0x25UDBmsSwjTMECfQ6cE+rORxphBYpFaoPxoiMg
	czIizL5w60WJ+2z/ksP5Lr/16G3yCn4aAZrLB8PGxheLiKGA2Xx5kLdIEQnr29PK0n+J9xMAe70mT
	Hl/AjJnA==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tHhBJ-00DpKm-BM; Sun, 01 Dec 2024 10:28:03 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tHhBJ-00000000vYr-3Ctu;
	Sun, 01 Dec 2024 10:28:01 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: ajones@ventanamicro.com,
	palmer@dabbelt.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v2 2/3] riscv: traps: make insn fetch common in unknown instruction
Date: Sun,  1 Dec 2024 10:27:58 +0000
Message-Id: <20241201102759.221176-3-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241201102759.221176-1-ben.dooks@codethink.co.uk>
References: <20241201102759.221176-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_022809_165604_3AE5C679 
X-CRM114-Status: GOOD (  13.30  )
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
---
 arch/riscv/include/asm/vector.h |  4 ++--
 arch/riscv/kernel/traps.c       | 14 +++++++++++++-
 arch/riscv/kernel/vector.c      | 11 +----------
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index c7c023afbacd..9ec2473c1b73 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -22,7 +22,7 @@
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool insn_is_vector(u32 insn_buf);
-bool riscv_v_first_use_handler(struct pt_regs *regs);
+bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn);
 void kernel_vector_begin(void);
 void kernel_vector_end(void);
 void get_cpu_vector_context(void);
@@ -270,7 +270,7 @@ struct pt_regs;
 static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
 static __always_inline bool has_vector(void) { return false; }
 static __always_inline bool insn_is_vector(u32 insn_buf) { return false; }
-static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
+static inline bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn) { return false; }
 static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vsize (0)
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 51ebfd23e007..9662138ba45c 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -172,11 +172,23 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
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
+				printk_ratelimited(KERN_ERR "traps: failed to read instruction at user %px\n", epc);
+				handled = false;
+				insn = 0;
+			}
+		}
+
+		if (insn)
+			handled = riscv_v_first_use_handler(regs, insn);
 
 		local_irq_disable();
 
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 821818886fab..08164a9121fe 100644
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

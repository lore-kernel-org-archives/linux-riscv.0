Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273DFD41C20
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 09:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnPE2Md47wD+3jwS38xDiZMC6G+uhOFQSoYGPRgus/U=; b=i78VKypu9+ivKB
	VWCgdHdrrjWJjGoYZ/oWI2wryzDzqnO+KrY/Q/DkjkScmwUeXU4Wd9EXq8s+dppPciafEKnZL/GDO
	EZJwEy+yXNijpA0uPmy8GutnAO0nvjIS6AeJ8SuyIu6EXmbY5xgtLklXPR5CH48wveY/poPdR7xAL
	zTvMhTYmm3E8A3jq0wLP71AWnHIbSwHW9N7AzPhSJEMlEiSAmvueWPqMlaViujvLtTUCE3QKicQEe
	bnXyQjrodx2hydRmYGjsEqKIu9grkIaOMdj1ARCAzpWT/bK7qvb+wMiAS0PiWAfisU2qGd/CdRaLl
	Yjt9/yDm7a3KL3wqp0VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9Z0-00000006E2S-3mqh;
	Wed, 13 Nov 2024 09:21:26 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9Up-00000006DUL-35pO
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 09:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sPFqAIYDy/tE51Vy+5d3jCKjCYegv4kJbtmLrKVG1Us=; b=k595sKahp6pWaDuOhyopiptwTe
	nIEc67CsPODkxUYkWWXDWY8TBauLN8ibWSxNgnmYmSUJk6ECIAfC2TRLtm+0A7c9z8PHQZpaSbihw
	ms8RKvUCCOW9Wm/VafxsgpxNcq+D0IBPvWlE8n1HrW4zkSVQrPu4Q4O18YztFNZQPMQtoQ96BwGW7
	1hVIu2mhllnX9qT8G4thyb+1HCiGU6ivwUOOeKIz2r/QfwHOjPhFARj6zjMR4zNvUSjd+kP6NNW4r
	8Kz2jTvnrhqYjj8Mb1CU3KCwzaEacozo+dCdQkH0bQhDg71T4eQ0Kr5n2Gg4lyv9TQ3wu7aNQQgaE
	bJrMmbBg==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tB9Um-003uon-0L; Wed, 13 Nov 2024 09:17:04 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tB9Ul-0000000D93C-3yyt;
	Wed, 13 Nov 2024 09:17:03 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	ajones@ventanamicro.com,
	alex@ghiti.fr,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 2/3] riscv: traps: make insn fetch common in unknown instruction
Date: Wed, 13 Nov 2024 09:17:02 +0000
Message-Id: <20241113091703.3133017-3-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241113091703.3133017-1-ben.dooks@codethink.co.uk>
References: <20241113091703.3133017-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_011707_810292_74C66B46 
X-CRM114-Status: GOOD (  12.29  )
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

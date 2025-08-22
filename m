Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BABDCA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0KIE4VN8jxcDxiE3TUoHrPcDEYn8FrraD/IvG51r/xw=; b=TjlJz1RWZ+xDeh
	aEkjiJ/EvuS9/ePb39SDBQKmsK0ZsmZYmfBWraObuYasGYqf4nIXCcilGA1OpSd16ITe7B8KttKs3
	cIqOT15RJhpcvu7YJJ7Ht67NmhODhhqdT9lE6Jxpb3HFAW+bfguqMZDUXlmoj0oNIHw5DDrks31pT
	FHJCiQQztg3awxhGC+6FZNgiiySungO+BttoOoPpDNSQvshQ1WBUQ38MsK2NBR2YO0ulg9k7zGsXP
	VWngwlLyz6CHwCJW0Fef91XVwa3IYzd4ZoA1EwXeb3EgqNzs6RKojOhgNZs7g8sSRGIdwxD/Cez9h
	U808RgBU2mmVMVyfGQ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphvX-00000004C3l-3kCS;
	Sat, 23 Aug 2025 06:40:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0h-00000003CZQ-1JaQ
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 16:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=c+gnVGLGuWbdOxF4pE8EeLQCs3NjTW9ew011ArwIA3w=; b=pIVCyxcn1+3lq+16A7dnoXZuOO
	0G37BmKwysbbPw3+3G6Z9C/dT5mVO0mWDY5EVrXE5k/T77xfhnS7hd5ZD1RMYjwD7pELHPQUfPU4b
	9AphYQWON/j6OhBL5oDI9a5NIGftaNvONvPDTn18e53hkPPt/UO3ytOCZ3SqEBJWYGNdHeLA//gsX
	I5vsR2bhxSojjWT43XNuoQ4+H8fVBt4bfEKUnibQ9ne7L57qn9y7qhHAKuXPQj1iSViQHZ1HCQjou
	ERSALfKm4Kc+Rtkr8e6XzujraKTeZWDl7EaWka6ndKVWCWM6AkzZSDjmG4+H+8vJVpnceIib9iVKM
	0Pu46CcA==;
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0d-000000011s8-02O5
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c+gnVGLGuWbdOxF4pE8EeLQCs3NjTW9ew011ArwIA3w=; b=EEsKJyjhfoxUhoLP1M0Qs04GHj
	xSnZSWL7TVIubfCP+ezqN0nGwF9hnp41DkkZGs2ABqomtFFYLVAjq/JChqhEs9mnjU9NyId1YZzAV
	w4P0Fc7/gz4GKXVbbY0GAtE7YKD585G2ZvjuvKG2zexRuSGOlSCLNbJ2yBDJfH47nWL/UrdV6wlSw
	95nzFGOHCFuN4It9DLCnIfvDf4zyIZZAahuEINVDP1eDL9nKLsoGpeWuPfazhoUDuVSTxgR8OdaVZ
	pp/sV0rGoQBCoYTNVfZGSd9ep5yXS7H95+xwsxvoCqnhHI1QgpeGrfXojtidM7ewW+vAgvdzEgCbB
	Ln5ciHwg==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-0015cn-0c; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DPa-2mW0;
	Fri, 22 Aug 2025 17:52:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: -linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Javier Jardon <javier.jardon@codethink.co.uk>,
	Ben Dooks <bjdooks@gmail.com>,
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
	Roan Richmod <roan.richmond@codethink.co.uk>,
	Sam Grove <sgrove@mips.com>,
	Chao-ying Fu <cfu@mips.com>,
	Mukunda Aprameya <maprameya@mips.com>,
	Umesh Kalappa <ukalappa@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Kurt Martin <kmartin@mips.com>,
	allikarjuna Gouda <mgouda@mips.com>,
	Vaibhav Chauthmal <vchauthmal@mips.com>,
	wapnil Agrawal <sagrawal@mips.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 11/18] riscv: traps: make insn fetch common in unknown instruction
Date: Fri, 22 Aug 2025 17:52:41 +0100
Message-Id: <20250822165248.289802-12-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_175259_211436_47E3C440 
X-CRM114-Status: GOOD (  13.61  )
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
  - rebased onto latest kernel
---
 arch/riscv/include/asm/vector.h |  4 ++--
 arch/riscv/kernel/traps.c       |  7 +++++--
 arch/riscv/kernel/vector.c      | 11 +----------
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index b61786d43c20..7b53aa66d5d4 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -43,7 +43,7 @@
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool insn_is_vector(u32 insn_buf);
-bool riscv_v_first_use_handler(struct pt_regs *regs);
+bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn);
 void kernel_vector_begin(void);
 void kernel_vector_end(void);
 void get_cpu_vector_context(void);
@@ -410,7 +410,7 @@ static __always_inline bool has_vector(void) { return false; }
 static __always_inline bool insn_is_vector(u32 insn_buf) { return false; }
 static __always_inline bool has_xtheadvector_no_alternatives(void) { return false; }
 static __always_inline bool has_xtheadvector(void) { return false; }
-static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
+static inline bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn) { return false; }
 static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vsize (0)
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index b8b3b6073cf7..040cb2e7c511 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -172,13 +172,16 @@ DO_ERROR_INFO(do_trap_insn_fault,
 
 asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
 {
-	bool handled;
+	bool handled = false;
 
 	if (user_mode(regs)) {
+		u32 insn = (u32)regs->badaddr;
+
 		irqentry_enter_from_user_mode(regs);
 		local_irq_enable();
 
-		handled = riscv_v_first_use_handler(regs);
+		handled = riscv_v_first_use_handler(regs, insn);
+
 		if (!handled)
 			do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
 				      "Oops - illegal instruction");
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 184f780c932d..6cd95326bc16 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -178,11 +178,8 @@ bool riscv_v_vstate_ctrl_user_allowed(void)
 }
 EXPORT_SYMBOL_GPL(riscv_v_vstate_ctrl_user_allowed);
 
-bool riscv_v_first_use_handler(struct pt_regs *regs)
+bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn)
 {
-	u32 __user *epc = (u32 __user *)regs->epc;
-	u32 insn = (u32)regs->badaddr;
-
 	if (!(has_vector() || has_xtheadvector()))
 		return false;
 
@@ -194,12 +191,6 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95A9C64EC7
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ebUDzgdtDve5sAUG96J5Ua4555U+cNCyu/aTSVa0XM=; b=vllEMGp/YG+cjD
	XZV+YAl+4oNBcEsoopWob/Qw1abmhsb37ObgvfYKdvdTUBYsoxT+VulVI7KJyrI6sRJXshA8Q8Zy5
	InrP0tYVc3U8oUu/X8swE3vDrDQYcfrGxNX0uJ0DG6Ru35UofYbeaDTZb0oRpiQ9OOqyD5d2LM890
	VTTDxOUP6QAoiAH53Vt2ixUH3jnC9haSs8QvuVS9MIX0z2D7pjSujc4CzFE9aLgwh7DKwgXpI4Lbj
	ZvP/GktlCWsifIVcm+mHl9VtxTuXEU+U/01CJbeRpHh7vAE7lYsPNRVxCMY+tlpcULl8S82xA7syN
	5A1s3wBc75IlCgiiazkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQrP-00D9e8-7W; Mon, 13 Feb 2023 04:54:39 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQr8-00D9RG-Gk
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:24 +0000
Received: by mail-pj1-x1035.google.com with SMTP id mg23so4213015pjb.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jzh1F9dWgL9z5qWHfkyPDeO9BiBZZOuMNa7E/NQMYRA=;
        b=hBAMguZTqz8mBO0i9eURw5EVnyTRjZI/TA0b+TvPmhimWAwoztTflfei++MGWOOhhp
         y9UQAG+6WEpmcozlhgFWPCfcNQEzazPzUc/BX/nwlV3/TfGY4oELgmwTzmcXbl8+8cLl
         YEyUj++v3tAMb1ug4pKO06rWe166GtjQy4/L6hNDTIxwdYO6Ph9pApQUVXelympLBY5P
         P2ApcmLSjc979qayu5Jclp/xPesWV0Ux6A2gskrj7yI7PMJAnA8Rupt6ysIl/wy30dGv
         MavO85rbflXHbv+JQi0NDSiLwIMFGmpAvYbubygtTeUtBxtynv9lE2AP/U0geTFdg9Iz
         T4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jzh1F9dWgL9z5qWHfkyPDeO9BiBZZOuMNa7E/NQMYRA=;
        b=ZvCdo+mxIysO24LAIuv6Q8lUy89KKrcbgudJsang1gvN3vGudPaf3LlzkN0ubea7G7
         4kcz552T5hk4BEC4jmr/brDUrXLYiirnhrMpyHs413NXQqXmi5gOD3fbZ+uj6mPA+sgV
         3vDVxQ7mnMot29hlO3EiAC2tMVhgRWtMFQ+WXgOpVQpQlyW/qXrwZjVHh3AvJTuwaa96
         kiUxswIsp9BfEwMZ/tD9mOwxa0Vy4C/cnqfcb4rk1yULCvLbUpAxtXsS126VTmTmgOuU
         nydfWmeXAvzpEblFGjPT/lo93jKs0qDTHEHTwVuDYFVC4J7rnT/tsFX+VW8hRL89nyuF
         TxWg==
X-Gm-Message-State: AO0yUKUifiGmNKsUeAEOIINViuNSmf/F+XQGs0DLtEBbKucYUGegaA5Q
	4MfEOlR65FyeAgIUOnSfDNmS4g==
X-Google-Smtp-Source: AK7set/ieVh7qhs04S/uXJn79ItEgAaNBhP4tICRnJOHZZuCn+oguG49FVAuZKnOk1MHnr6vz9IICA==
X-Received: by 2002:a17:902:e40d:b0:19a:a2f3:e41c with SMTP id m13-20020a170902e40d00b0019aa2f3e41cmr1350325ple.35.1676264061243;
        Sun, 12 Feb 2023 20:54:21 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:20 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 13/20] riscv: illegal instruction handler for cfi violations
Date: Sun, 12 Feb 2023 20:53:42 -0800
Message-Id: <20230213045351.3945824-14-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205423_199607_51BE2671 
X-CRM114-Status: GOOD (  15.01  )
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

Zisslpcfi spec proposes that cfi violations are reported as illegal
instruction exception. Following are the cases

- elp missing: An indirect jmp/call landed on instruction which is
  not `lpcll`
- label mismatch: Static label embedded in instr `lpcll/lpcml/lpcul`
  doesn't match with repsective label in CSR_LPLR
- sscheckra: x1 and x5 don't match.

Current changes run user code in audit mode. That means that any cfi
violation is suppressed and app is allowed to continue.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/traps.c | 79 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 5553b8d48ba5..a292699f4f25 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -97,6 +97,10 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
 /* Zisslpcfi instructions encodings */
 #define SS_PUSH_POP 0x81C04073
 #define SS_AMOSWAP  0x82004073
+#define SS_CHECKRA  0x8A12C073
+#define LP_C_LL     0x83004073
+#define LP_C_ML     0x86804073
+#define LP_C_UL     0x8B804073
 
 bool is_ss_load_store_insn(unsigned long insn)
 {
@@ -112,6 +116,71 @@ bool is_ss_load_store_insn(unsigned long insn)
 	return false;
 }
 
+bool is_cfi_violation_insn(unsigned long insn)
+{
+	struct task_struct *task = current;
+	bool ss_exist = false, lp_exist = false;
+
+	ss_exist = arch_supports_shadow_stack();
+	lp_exist = arch_supports_indirect_br_lp_instr();
+
+	if (ss_exist && (insn == SS_CHECKRA)) {
+		pr_warn("cfi violation (sschkra): comm = %s, task = %p\n", task->comm, task);
+		return true;
+	}
+	if (lp_exist && ((insn & LP_C_LL) == LP_C_LL)) {
+		pr_warn("cfi violation (lpcll): comm = %s, task = %p\n", task->comm, task);
+		return true;
+	}
+	if (lp_exist && ((insn & LP_C_ML) == LP_C_ML)) {
+		pr_warn("cfi violation (lpcml): comm = %s, task = %p\n", task->comm, task);
+		return true;
+	}
+	if (lp_exist && ((insn & LP_C_UL) == LP_C_UL)) {
+		pr_warn("cfi violation (lpcul): comm = %s, task = %p\n", task->comm, task);
+		return true;
+	}
+
+	return false;
+}
+
+int handle_illegal_instruction(struct pt_regs *regs)
+{
+	/* stval should hold faulting opcode */
+	unsigned long insn = csr_read(stval);
+	struct thread_info *info = NULL;
+	struct task_struct *task = current;
+
+	info = current_thread_info();
+	/*
+	 * If CFI enabled then following instructions leads to illegal instruction fault
+	 * -- sscheckra: x1 and x5 mismatch
+	 * -- ELP = 1, Any instruction other than lpcll will fault
+	 * -- lpcll will fault if lower label don't match with LPLR.LL
+	 * -- lpcml will fault if lower label don't match with LPLR.ML
+	 * -- lpcul will fault if lower label don't match with LPLR.UL
+	 */
+
+	/* If fcfi enabled and  ELP = 1, suppress ELP (audit mode)  and resume */
+	if (arch_supports_indirect_br_lp_instr() &&
+#ifdef CONFIG_USER_INDIRECT_BR_LP
+	    info->user_cfi_state.ufcfi_en &&
+#endif
+	    (regs->status & SR_ELP)) {
+		pr_warn("cfi violation (elp): comm = %s, task = %p\n", task->comm, task);
+		regs->status &= ~(SR_ELP);
+		return 0;
+	}
+	/* if faulting opcode is sscheckra/lpcll/lpcml/lpcll, advance PC and resume */
+	if (is_cfi_violation_insn(insn)) {
+		/* no compressed form for zisslpcfi instructions */
+		regs->epc += 4;
+		return 0;
+	}
+
+	return 1;
+}
+
 ulong get_instruction(ulong epc)
 {
 	ulong *epc_ptr = (ulong *) epc;
@@ -190,8 +259,14 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
 	SIGBUS, BUS_ADRALN, "instruction address misaligned");
 DO_ERROR_INFO(do_trap_insn_fault,
 	SIGSEGV, SEGV_ACCERR, "instruction access fault");
-DO_ERROR_INFO(do_trap_insn_illegal,
-	SIGILL, ILL_ILLOPC, "illegal instruction");
+
+asmlinkage void __trap_section do_trap_insn_illegal(struct pt_regs *regs)
+{
+	if (!handle_illegal_instruction(regs))
+		return;
+	do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
+		      "illegal instruction");
+}
 #ifdef CONFIG_USER_SHADOW_STACK
 asmlinkage void __trap_section do_trap_load_fault(struct pt_regs *regs)
 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

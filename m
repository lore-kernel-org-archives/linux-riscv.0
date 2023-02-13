Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4021AC6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QlCxHn6177rlstXzNOrSxzxV5JypmJM/BK0D9iuIDeY=; b=oUvsw9hdpv6yx2
	KMuXwFsZZJdvXaGB8JxmJdIpVLfj2GcuToWlwAipjeb64pxUr//+bcOp3fhNy1Nn1aJLAT2gf2Rv5
	YFbUwJsoOlQzmQs922jtlNkxH31vwEoUGhrFRzmLxDvC3lFBa6zIFN3GhuHDFC/oVQTdXB+QYuN9B
	LkypIOmEXYPM/dFMNQCqGrRrfY/5LkV8KHZL+ee/DNlGVPhsp+HQ27iH8IHc6VWyierk6fik/Lc6i
	JxgnDEqJlCBIyU+aIo75MZKKRtjB064psJ+N1RGbJk6EPTXxcz6EmgbxIlz9TgJ8SEP9OgK6Miwlv
	qsfRg/PdhfXC4sdy1P8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQrR-00D9gQ-VZ; Mon, 13 Feb 2023 04:54:42 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQr9-00D9HC-38
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:24 +0000
Received: by mail-pl1-x633.google.com with SMTP id o8so9930231pls.11
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+FPHf6hRIJPFXwDXSpkdTEJ33J583V063C2UTppgJs=;
        b=PIc3jlcyk7tBVDiMhDV7vQZElpm10o3G2cwhqlaW4z2UIEx5lX08doq/7HmwkcA5/B
         mXA4mD3Qibw1ZZXxBKWGnAHzkaBgpiPxYs3SSCxrss438iFkUzY+I1LbmCO0Wy7Qv4zy
         OaGCmO23kCrbduaQZBVgTYiLM/xSzD/oJvobRKtEDu6wJbbzlkleuglQwO3UeTxWhlgA
         fAtMy+u3iW8kehvHhqtC3eqchwEPIk5+4Fgy7oyU8w/+z6lfr5E2IZ2FvGNy0muTuG8G
         kF9cuzHt65MD3IYO5Qezafy2tL+DHy52TBkbL+mYMz2pP3AJNcMSZFeiBzRu8l1mioSD
         7LlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+FPHf6hRIJPFXwDXSpkdTEJ33J583V063C2UTppgJs=;
        b=hlt6IJEMzOH3ZxFoNz7Hw41dDHX2L/aMRy1GGkMHOU5ebclWXb2aFbca5RHaUR7vxF
         VCVZwEvvrh4gLkrCmiLY3liJ+3AlXUHvNY69ZhHKW/nU2JOXrQFYNBPHwN4pcH9+MN6I
         IVhDldHcZQt9HCOXXA4a5wbvV50EqignNBxsUdEjS+SCs0xO4Pxm+PIZaqJX7LvzMvax
         V/vjRfeC8fk0q2QSxwblNnma7tDdH1JF1jJjyqnUVwiFnG+5JQdZAwtK03LS2O2mhR/n
         moLuq7kJ6RV7t7fBMRFEqoNbLYHf4BEr7qXTKYGj49yIU2O/W7j7QLtCLQgK6Ljw6OxJ
         vEzQ==
X-Gm-Message-State: AO0yUKXF4e6WaAwgXrm0uPHLV7gFKIeeY0jvVaoPopQk10d7b1XG/oVZ
	AFeH7wB+0B5MtBSZKKvsojBmtQ==
X-Google-Smtp-Source: AK7set+VN154o5HYEXLyYzceYsxMjWF7xqCTBzBvD1DF80PZB4FAd3bVA3SAcm+ftMrJgNi5gBcRcA==
X-Received: by 2002:a17:902:dad0:b0:199:1f42:8bed with SMTP id q16-20020a170902dad000b001991f428bedmr14338448plx.12.1676264062760;
        Sun, 12 Feb 2023 20:54:22 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:22 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 14/20] riscv: audit mode for cfi violations
Date: Sun, 12 Feb 2023 20:53:43 -0800
Message-Id: <20230213045351.3945824-15-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205423_197536_28E2FFBB 
X-CRM114-Status: GOOD (  12.06  )
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

Adding an audit mode per task which suppresses cfi violations reported
as illegal instruction exception.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/processor.h | 3 ++-
 arch/riscv/kernel/process.c        | 2 ++
 arch/riscv/kernel/traps.c          | 7 ++++++-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f065309927b1..39c36f739ebb 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -45,7 +45,8 @@ struct thread_struct {
 struct cfi_status {
 	unsigned int ufcfi_en : 1; /* Enable for forward cfi. Note that ELP goes in sstatus */
 	unsigned int ubcfi_en : 1; /* Enable for backward cfi. */
-	unsigned int rsvd1 : 30;
+	unsigned int audit_mode : 1;
+	unsigned int rsvd1 : 29;
 	unsigned int lp_label; /* saved label value (25bit) */
 	long user_shdw_stk; /* Current user shadow stack pointer */
 	long shdw_stk_base; /* Base address of shadow stack */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index db676262e61e..bfd8511914d9 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -246,11 +246,13 @@ int arch_elf_setup_cfi_state(const struct arch_elf_state *state)
 
 		info->user_cfi_state.user_shdw_stk = (shadow_stack_base + shadow_stk_size);
 		info->user_cfi_state.shdw_stk_base = shadow_stack_base;
+		info->user_cfi_state.audit_mode = 1;
 	}
 	/* setup forward cfi state */
 	if (arch_supports_indirect_br_lp_instr() && (state->flags & RISCV_ELF_FCFI)) {
 		info->user_cfi_state.ufcfi_en = 1;
 		info->user_cfi_state.lp_label = 0;
+		info->user_cfi_state.audit_mode = 1;
 	}
 
 	return ret;
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index a292699f4f25..1901a8b73de5 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -165,6 +165,7 @@ int handle_illegal_instruction(struct pt_regs *regs)
 	if (arch_supports_indirect_br_lp_instr() &&
 #ifdef CONFIG_USER_INDIRECT_BR_LP
 	    info->user_cfi_state.ufcfi_en &&
+	    info->user_cfi_state.audit_mode &&
 #endif
 	    (regs->status & SR_ELP)) {
 		pr_warn("cfi violation (elp): comm = %s, task = %p\n", task->comm, task);
@@ -172,7 +173,11 @@ int handle_illegal_instruction(struct pt_regs *regs)
 		return 0;
 	}
 	/* if faulting opcode is sscheckra/lpcll/lpcml/lpcll, advance PC and resume */
-	if (is_cfi_violation_insn(insn)) {
+	if (is_cfi_violation_insn(insn)
+#if defined(CONFIG_USER_SHADOW_STACK) || defined(CONFIG_USER_INDIRECT_BR_LP)
+	    && info->user_cfi_state.audit_mode
+#endif
+	) {
 		/* no compressed form for zisslpcfi instructions */
 		regs->epc += 4;
 		return 0;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

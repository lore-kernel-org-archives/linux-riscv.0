Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D56C6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90ZuH4zWYjqSGNCc/+HKPjcLb4MscAS2ltSkLA8jj9g=; b=L7Dw1aWl2kJDGE
	dU4Uz7WUPQ5k3zonCBSdmm7W/fEq94OMGup1rOqsSiKd5/QMyDqOVan+LNS2HQK0DhTpBNemyVnMz
	Z+bXrGEDaFxyWd00/R2tyV9G7kcvD8r0SdYRC8XTNLagkZ8fWgF/QvLJNh1GmBiDjulsM/aWxeNNm
	vRXiNU2nlbfau4AzrAMfxY5D/mlJpcD59ItoscTMUElwtjNQ3NL5YVZlyJVTe5KM8umcu4NsSEA/S
	MhM7iHNoU5wBED3GF3uA3IaCCBoGqn3xcj0vt7bqqFI7rmrLbq/U+tGzSNsr02cl6+IOu43FSydj+
	vUAcuVqdBvbiJSxWiIFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQrb-00D9nr-Ma; Mon, 13 Feb 2023 04:54:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQrC-00D9VM-JQ
	for linux-riscv@bombadil.infradead.org; Mon, 13 Feb 2023 04:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PWWHkk0uRmCoQD1IDjmpM1K4crsMB3GryXLB1Ck58mM=; b=jI9FUlfDJilWmefUMl1t1LT/c2
	5Rx8jV+Jd4h1uAx9PGqGPhVzOYkp3+q0adXIAn6ObnehQrWAibGn7RhrkinX6mOIBkhK0c+WFVA0Q
	eYVoDbCC5/H4QpmO5T4fpnGxOFdZ1W5SNHx+Qdizx1263RmcU1lSSv03d82aicswvSFg2/3xDJyWF
	vgV+r/O0jIZFTDehAcPC1K1wpNieuSnrCpCN1jY5moBGJyBediIzKAOL38K66864TlZslDtCyktSn
	QFPKYsEW4whjnQOerii77JO3xpwhv+GbwAgxGzUJVx/WQ3Uc6gDZj9l5YGFWptSwCIbWzMtHv2X6O
	Q1dYda6w==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pRQqP-009BQe-18
	for linux-riscv@lists.infradead.org;
	Mon, 13 Feb 2023 04:53:43 +0000
Received: by mail-pj1-x1034.google.com with SMTP id bx22so10759638pjb.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWWHkk0uRmCoQD1IDjmpM1K4crsMB3GryXLB1Ck58mM=;
        b=FGjJdoMrQlppTBz+ObqT8luvhuIMwvfjvmkBZprc9HlYpoiSS1sA85FZnlrmeoeEgh
         SlSW2oU2EYk9KtAhXRm18M+PupNhB7PJwPtUNGXJcECNEGsnVdHApGyWg64SViYKipvg
         76A+vJJvWrYRsBqZ5NpIAB/yexvjeXKgZYZluduj2LNgSueMGYFoy6UM6NpAbW54+uJv
         n80E0ec86qo5fTn+m5TpVEbZlOl8oMoq1dQ3t1CAp93yrTxg3gz0bUQfZSAdBr3s/OIu
         sMljApBWJCh4QonvYNxSCj45B5bFELOws2WJg2kb2PQukm27+t6Rb1njgf4IzZonV0W+
         2nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWWHkk0uRmCoQD1IDjmpM1K4crsMB3GryXLB1Ck58mM=;
        b=7o95A2LgJ37eSBVQ5JKEXx4QDV6BSe1MzsKsgdy+gZjeuoRDKIGjcXuvQjAR0Yd7Yk
         09xX/oDQmPXOMmagQM5JKz1Q9L+clX3OC4VYSQkghAbFblS5FLw8M8dkn/qqChmVw3fc
         Kw4kqffvxZQ1jfFtTvJgSALDxGTQOhs9DMQNEL6ngFmJbX6wx8deeBATMjg4D0JNicLe
         nYXp7xg2zU4bHXSAAc7cfn5olTtlxvDN12z9R6tn3sQnvjqO6xm6kwwaDvrDdopjK1U4
         ZKLtsCEZk3HF+3VEMtW70OxFONYerNixI3HsXXNqvqniQh0HzsbMMw5I1NI7JNF+hF2o
         RpWA==
X-Gm-Message-State: AO0yUKVGAqZGZOlFdXSVE9Os6X0pb3Q1ei3h7gT+P8rBI00+OL/MJwAm
	TonKVWJQD2mlo0l8QfFi8sNm8g==
X-Google-Smtp-Source: AK7set9406LLxtGzTMJ9GgnStCTat5aRGFN2npHB9cBHONwfu4URf5ZDmziYqqSaME7wnrSw88O6bA==
X-Received: by 2002:a17:903:2448:b0:198:f027:5925 with SMTP id l8-20020a170903244800b00198f0275925mr25005204pls.64.1676264055395;
        Sun, 12 Feb 2023 20:54:15 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:14 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 09/20] riscv mmu: riscv shadow stack page fault handling
Date: Sun, 12 Feb 2023 20:53:38 -0800
Message-Id: <20230213045351.3945824-10-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_045339_976246_FB429374 
X-CRM114-Status: GOOD (  20.91  )
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

Shadow stack load/stores to valid non-shadow memory raise access faults.
Regular store to shadow stack memory raise access fault as well.

This patch implements load and store access handler. Load access handler
reads faulting instruction and if it was an instruction issuing ss load,
it'll invoke page fault handler with a synthetic cause (marked reserved
in priv spec).
Similarly store access hanlder reads faulting instruction and if it was
an instruction issuing ss store, it'll invoke page fault handler with a
synthetic cause (reserved in spec).

All other cases in load/store access handler will lead to SIGSEV.

There might be concerns that using a reserved exception code may create
an issue because some riscv implementation might already using this code.
However counter argument would be, linux kernel is not using this code
and thus linux kernel should be able to use this exception code on such
a hardware.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/csr.h |  3 ++
 arch/riscv/kernel/traps.c    | 99 ++++++++++++++++++++++++++++++++++++
 arch/riscv/mm/fault.c        | 23 ++++++++-
 3 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 243031d1d305..828b1c2a74c2 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -104,6 +104,9 @@
 #define EXC_SUPERVISOR_SYSCALL	10
 #define EXC_INST_PAGE_FAULT	12
 #define EXC_LOAD_PAGE_FAULT	13
+#ifdef CONFIG_USER_SHADOW_STACK
+#define EXC_SS_ACCESS_PAGE_FAULT	14
+#endif
 #define EXC_STORE_PAGE_FAULT	15
 #define EXC_INST_GUEST_PAGE_FAULT	20
 #define EXC_LOAD_GUEST_PAGE_FAULT	21
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 549bde5c970a..5553b8d48ba5 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -94,6 +94,85 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
 	}
 }
 
+/* Zisslpcfi instructions encodings */
+#define SS_PUSH_POP 0x81C04073
+#define SS_AMOSWAP  0x82004073
+
+bool is_ss_load_store_insn(unsigned long insn)
+{
+	if ((insn & SS_PUSH_POP) == SS_PUSH_POP)
+		return true;
+	/*
+	 * SS_AMOSWAP overlaps with LP_S_LL.
+	 * But LP_S_LL can never raise access fault
+	 */
+	if ((insn & SS_AMOSWAP) == SS_AMOSWAP)
+		return true;
+
+	return false;
+}
+
+ulong get_instruction(ulong epc)
+{
+	ulong *epc_ptr = (ulong *) epc;
+	ulong insn = 0;
+
+	__enable_user_access();
+	insn = *epc_ptr;
+	__disable_user_access();
+	return insn;
+}
+
+#ifdef CONFIG_USER_SHADOW_STACK
+extern asmlinkage void do_page_fault(struct pt_regs *regs);
+
+/*
+ * If CFI enabled then following then load access fault can occur if
+ * ssload (sspop/ssamoswap) happens on non-shadow stack memory.
+ * This is a valid case when we want to do COW on SS memory on `fork` or memory is swapped out.
+ * SS memory is marked as readonly and subsequent sspop or sspush will lead to
+ * load/store access fault. We need to decode instruction. If it's sspop or sspush
+ * Page fault handler is invoked.
+ */
+int handle_load_access_fault(struct pt_regs *regs)
+{
+	ulong insn = get_instruction(regs->epc);
+
+	if (is_ss_load_store_insn(insn)) {
+		regs->cause = EXC_SS_ACCESS_PAGE_FAULT;
+		do_page_fault(regs);
+		return 0;
+	}
+
+	return 1;
+}
+/*
+ * If CFI enabled then following then store access fault can occur if
+ * -- ssstore (sspush/ssamoswap) happens on non-shadow stack memory
+ * -- regular store happens on shadow stack memory
+ */
+int handle_store_access_fault(struct pt_regs *regs)
+{
+	ulong insn = get_instruction(regs->epc);
+
+	/*
+	* if a shadow stack store insn, change cause to
+	* synthetic SS_ACCESS_PAGE_FAULT
+	*/
+	if (is_ss_load_store_insn(insn)) {
+	        regs->cause = EXC_SS_ACCESS_PAGE_FAULT;
+	        do_page_fault(regs);
+	        return 0;
+	}
+	/*
+	 * Reaching here means it was a regular store.
+	 * A regular access fault anyways had been delivering SIGSEV
+	 * A regular store to shadow stack anyways is also a SIGSEV
+	 */
+	return 1;
+}
+#endif
+
 #if defined(CONFIG_XIP_KERNEL) && defined(CONFIG_RISCV_ALTERNATIVE)
 #define __trap_section		__section(".xip.traps")
 #else
@@ -113,8 +192,18 @@ DO_ERROR_INFO(do_trap_insn_fault,
 	SIGSEGV, SEGV_ACCERR, "instruction access fault");
 DO_ERROR_INFO(do_trap_insn_illegal,
 	SIGILL, ILL_ILLOPC, "illegal instruction");
+#ifdef CONFIG_USER_SHADOW_STACK
+asmlinkage void __trap_section do_trap_load_fault(struct pt_regs *regs)
+{
+	if (!handle_load_access_fault(regs))
+		return;
+	do_trap_error(regs, SIGSEGV, SEGV_ACCERR, regs->epc,
+		"load access fault");
+}
+#else
 DO_ERROR_INFO(do_trap_load_fault,
 	SIGSEGV, SEGV_ACCERR, "load access fault");
+#endif
 #ifndef CONFIG_RISCV_M_MODE
 DO_ERROR_INFO(do_trap_load_misaligned,
 	SIGBUS, BUS_ADRALN, "Oops - load address misaligned");
@@ -140,8 +229,18 @@ asmlinkage void __trap_section do_trap_store_misaligned(struct pt_regs *regs)
 		      "Oops - store (or AMO) address misaligned");
 }
 #endif
+#ifdef CONFIG_USER_SHADOW_STACK
+asmlinkage void __trap_section do_trap_store_fault(struct pt_regs *regs)
+{
+	if (!handle_store_access_fault(regs))
+		return;
+	do_trap_error(regs, SIGSEGV, SEGV_ACCERR, regs->epc,
+		"store (or AMO) access fault");
+}
+#else
 DO_ERROR_INFO(do_trap_store_fault,
 	SIGSEGV, SEGV_ACCERR, "store (or AMO) access fault");
+#endif
 DO_ERROR_INFO(do_trap_ecall_u,
 	SIGILL, ILL_ILLTRP, "environment call from U-mode");
 DO_ERROR_INFO(do_trap_ecall_s,
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index d86f7cebd4a7..b5ecf36eba3d 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -18,6 +18,7 @@
 
 #include <asm/ptrace.h>
 #include <asm/tlbflush.h>
+#include <asm/pgtable.h>
 
 #include "../kernel/head.h"
 
@@ -177,6 +178,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 
 static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 {
+	unsigned long prot = 0, shdw_stk_mask = 0;
 	switch (cause) {
 	case EXC_INST_PAGE_FAULT:
 		if (!(vma->vm_flags & VM_EXEC)) {
@@ -194,6 +196,20 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
 			return true;
 		}
 		break;
+#ifdef CONFIG_USER_SHADOW_STACK
+	/*
+	 * If a ss access page fault. vma must have only VM_WRITE.
+	 * and page prot much match to PAGE_SHADOWSTACK.
+	 */
+	case EXC_SS_ACCESS_PAGE_FAULT:
+		prot = pgprot_val(vma->vm_page_prot);
+		shdw_stk_mask = pgprot_val(PAGE_SHADOWSTACK);
+		if (((vma->vm_flags & (VM_WRITE | VM_READ | VM_EXEC)) != VM_WRITE) ||
+		   ((prot & shdw_stk_mask) != shdw_stk_mask)) {
+			return true;
+		}
+		break;
+#endif
 	default:
 		panic("%s: unhandled cause %lu", __func__, cause);
 	}
@@ -274,7 +290,12 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
 
-	if (cause == EXC_STORE_PAGE_FAULT)
+	if (cause == EXC_STORE_PAGE_FAULT
+#ifdef CONFIG_USER_SHADOW_STACK
+	   || cause == EXC_SS_ACCESS_PAGE_FAULT
+	   /* if config says shadow stack and cause is ss access then indicate a write */
+#endif
+	   )
 		flags |= FAULT_FLAG_WRITE;
 	else if (cause == EXC_INST_PAGE_FAULT)
 		flags |= FAULT_FLAG_INSTRUCTION;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

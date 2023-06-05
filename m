Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2644EC7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 15:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oU8rZG2DDyiA6UF11JlUH3tEyL46TwcfyNxaJkR+8nY=; b=iMoH5hIPwyMs+n
	LbHkBat3S6UvzY6Ca2WL/3pqGMqkRGWcm0qbSy5GpMZRTEwt4U0sZgC8KUU5DpNTqugOry7mwC9gR
	M9MxHNNqk1FNKWUOnTD+mSFnoPAUS/+zQi7bjKUoPKwXA7owpvVPN99A1HlA5KKN22AFM4VwjpoMJ
	bSjx2mtCFlKgzdK9cRhu2g8iiWTL2S4xJTtm5yV4+EzYfTny3aApBOLzxNO2tfZ7vXFLXzzfV5CoL
	+Cs1cUfjySp9KT7SsnTheUNYF68GuxgiBfs095og43yh2h4t8D3BrU+SyWDiSn+/oXV4QSi7VtWnc
	bILzCNbx7gugG5kFPS/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CKH-00FzH8-0p;
	Mon, 05 Jun 2023 15:40:57 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CKD-00FzFP-2y
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 15:40:55 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b0236ee816so35858615ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 08:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1685979653; x=1688571653;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gf/IwQV6P+rJliEO2LEjL1VDxZs9ZYpyuR4dzzlhnB4=;
        b=cRXbLGvZCiDnMTxvH+NroGCOc2xoFHAMG20dgJoArjc/fTRVBirOvWmlofitd1kg3H
         yh3N1yaYLtFFGYrTI5DyuE9iRD2TGfxsm2fuFkkMm5kfbpGyR73fzQKHj5ujf4g0qPZh
         yJaefM+StMKe3xxZZhq00Sv9xX8Cqs7yjNn5O3zDjkRMAFptfSP0Rlg5VPGhVlc+c8zN
         3yfaoJmX/Q3mI9NNKYMrNy3WzW7iEp15W6t107qlK8tDx0j8mDNoUJbIs65K3K3yKsYc
         LkRllgU3y1f4xe/oVikkA81QEnty4UpkRLhyeAPry5AiO163kMWTV4zbbUWf86CyHNg+
         4nDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979653; x=1688571653;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gf/IwQV6P+rJliEO2LEjL1VDxZs9ZYpyuR4dzzlhnB4=;
        b=aTZjl9eYOsAbTk75OWcYUaF8paN7SeIio8i+ybY0SeuYyHHuLQZ08f6/Y8CEWlBHyX
         2cxYmZHRn9LB9J+zm751ShG5KCnTmPDPDIdETWC0Q5IFqtbZ+5MsIL5A2ZO0pssoEg7H
         mRvKu5FfhvqkZ/2vzTBr64JJFHFLPSFyQIttFezN7dzti+g6dQPHPnKOrs2JoVg9ShX2
         P45js5Nx7nSD+rVAT3cZhlgv7BwToKvwhdy6UGWoWunjZPd/qws0rK838Rzx5xlCxnDM
         dZ7R1CMKG1mOuU3D5FJS8nsoeYnUwiRHe6HPOdwzm7XGk1emMhNu+42F3AXZl98oAHJY
         3gmw==
X-Gm-Message-State: AC+VfDxZkjPSWQ4sYQ+Hld1KmPqSU9DqfyhZhf/Ic6S6HryInEGApZxL
	h6q0WDQrKEGrb0VO2IR41lPTPrzMpuye3Ioh8n5dduzmQN1silAN6eYmnOSHoQMoKrp0udOOR9M
	uq3avFY/cII1DRl6ViQA3i6DLrV0eCnFtH/W06FszPTRNieBUK4+ICF3NX+dUTOx6YkkGGN1bnB
	Jb4K0N8eb3CHP3tB4=
X-Google-Smtp-Source: ACHHUZ7r0oPs6EQXXzKZXuaUKlCPs/4xk82Y5oTkRXi/eyrOAJwet+3eb03JQP6d5qoYQEfLFSR0rA==
X-Received: by 2002:a17:902:d50c:b0:1b0:10a1:3da9 with SMTP id b12-20020a170902d50c00b001b010a13da9mr8821833plg.32.1685979652597;
        Mon, 05 Jun 2023 08:40:52 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b001b0aec3ed59sm6725962plb.256.2023.06.05.08.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 08:40:51 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liao Chang <liaochang1@huawei.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Mattias Nissler <mnissler@rivosinc.com>
Subject: [PATCH -next v21 11/27] riscv: Allocate user's vector context in the first-use trap
Date: Mon,  5 Jun 2023 11:07:08 +0000
Message-Id: <20230605110724.21391-12-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230605110724.21391-1-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_084053_957872_1876F988 
X-CRM114-Status: GOOD (  21.92  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Vector unit is disabled by default for all user processes. Thus, a
process will take a trap (illegal instruction) into kernel at the first
time when it uses Vector. Only after then, the kernel allocates V
context and starts take care of the context for that user process.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d@linaro.org
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v21:
 - Remove has_vector() and use ELF_HWCAP instead. The V bit in the hwcap,
   if preesents, implies has_vector() returning true. So we can drop
   has_vector() test here safely, because we also don't handle !V but
   has_vector() cases.
 - Change SIGKILL to SIGBUS when allocation of V-context fails. (Darius)

Changelog v20:
 - move has_vector() into vector.c for better code readibility
 - check elf_hwcap in the first-use trap because it might get turned off
   if cores have different VLENs.

Changelog v18:
 - Add blank lines (Heiko)
 - Return immediately in insn_is_vector() if an insn matches (Heiko)
---
 arch/riscv/include/asm/insn.h   | 29 ++++++++++
 arch/riscv/include/asm/vector.h |  2 +
 arch/riscv/kernel/traps.c       | 26 ++++++++-
 arch/riscv/kernel/vector.c      | 95 +++++++++++++++++++++++++++++++++
 4 files changed, 150 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 8d5c84f2d5ef..4e1505cef8aa 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -137,6 +137,26 @@
 #define RVG_OPCODE_JALR		0x67
 #define RVG_OPCODE_JAL		0x6f
 #define RVG_OPCODE_SYSTEM	0x73
+#define RVG_SYSTEM_CSR_OFF	20
+#define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)
+
+/* parts of opcode for RVF, RVD and RVQ */
+#define RVFDQ_FL_FS_WIDTH_OFF	12
+#define RVFDQ_FL_FS_WIDTH_MASK	GENMASK(3, 0)
+#define RVFDQ_FL_FS_WIDTH_W	2
+#define RVFDQ_FL_FS_WIDTH_D	3
+#define RVFDQ_LS_FS_WIDTH_Q	4
+#define RVFDQ_OPCODE_FL		0x07
+#define RVFDQ_OPCODE_FS		0x27
+
+/* parts of opcode for RVV */
+#define RVV_OPCODE_VECTOR	0x57
+#define RVV_VL_VS_WIDTH_8	0
+#define RVV_VL_VS_WIDTH_16	5
+#define RVV_VL_VS_WIDTH_32	6
+#define RVV_VL_VS_WIDTH_64	7
+#define RVV_OPCODE_VL		RVFDQ_OPCODE_FL
+#define RVV_OPCODE_VS		RVFDQ_OPCODE_FS
 
 /* parts of opcode for RVC*/
 #define RVC_OPCODE_C0		0x0
@@ -304,6 +324,15 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
 	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
 
+#define RVG_EXTRACT_SYSTEM_CSR(x) \
+	({typeof(x) x_ = (x); RV_X(x_, RVG_SYSTEM_CSR_OFF, RVG_SYSTEM_CSR_MASK); })
+
+#define RVFDQ_EXTRACT_FL_FS_WIDTH(x) \
+	({typeof(x) x_ = (x); RV_X(x_, RVFDQ_FL_FS_WIDTH_OFF, \
+				   RVFDQ_FL_FS_WIDTH_MASK); })
+
+#define RVV_EXRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
+
 /*
  * Get the immediate from a J-type instruction.
  *
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index ce6a75e9cf62..8e56da67b5cf 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -21,6 +21,7 @@
 
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
+bool riscv_v_first_use_handler(struct pt_regs *regs);
 
 static __always_inline bool has_vector(void)
 {
@@ -165,6 +166,7 @@ struct pt_regs;
 
 static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
 static __always_inline bool has_vector(void) { return false; }
+static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
 #define riscv_v_vsize (0)
 #define riscv_v_vstate_save(task, regs)		do {} while (0)
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 8c258b78c925..05ffdcd1424e 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -26,6 +26,7 @@
 #include <asm/ptrace.h>
 #include <asm/syscall.h>
 #include <asm/thread_info.h>
+#include <asm/vector.h>
 
 int show_unhandled_signals = 1;
 
@@ -145,8 +146,29 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
 	SIGBUS, BUS_ADRALN, "instruction address misaligned");
 DO_ERROR_INFO(do_trap_insn_fault,
 	SIGSEGV, SEGV_ACCERR, "instruction access fault");
-DO_ERROR_INFO(do_trap_insn_illegal,
-	SIGILL, ILL_ILLOPC, "illegal instruction");
+
+asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
+{
+	if (user_mode(regs)) {
+		irqentry_enter_from_user_mode(regs);
+
+		local_irq_enable();
+
+		if (!riscv_v_first_use_handler(regs))
+			do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
+				      "Oops - illegal instruction");
+
+		irqentry_exit_to_user_mode(regs);
+	} else {
+		irqentry_state_t state = irqentry_nmi_enter(regs);
+
+		do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
+			      "Oops - illegal instruction");
+
+		irqentry_nmi_exit(regs, state);
+	}
+}
+
 DO_ERROR_INFO(do_trap_load_fault,
 	SIGSEGV, SEGV_ACCERR, "load access fault");
 #ifndef CONFIG_RISCV_M_MODE
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 120f1ce9abf9..9d81d1b2a7f3 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -4,10 +4,19 @@
  * Author: Andy Chiu <andy.chiu@sifive.com>
  */
 #include <linux/export.h>
+#include <linux/sched/signal.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/sched.h>
+#include <linux/uaccess.h>
 
+#include <asm/thread_info.h>
+#include <asm/processor.h>
+#include <asm/insn.h>
 #include <asm/vector.h>
 #include <asm/csr.h>
 #include <asm/elf.h>
+#include <asm/ptrace.h>
 #include <asm/bug.h>
 
 unsigned long riscv_v_vsize __read_mostly;
@@ -34,3 +43,89 @@ int riscv_v_setup_vsize(void)
 
 	return 0;
 }
+
+static bool insn_is_vector(u32 insn_buf)
+{
+	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
+	u32 width, csr;
+
+	/*
+	 * All V-related instructions, including CSR operations are 4-Byte. So,
+	 * do not handle if the instruction length is not 4-Byte.
+	 */
+	if (unlikely(GET_INSN_LENGTH(insn_buf) != 4))
+		return false;
+
+	switch (opcode) {
+	case RVV_OPCODE_VECTOR:
+		return true;
+	case RVV_OPCODE_VL:
+	case RVV_OPCODE_VS:
+		width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
+		if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
+		    width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
+			return true;
+
+		break;
+	case RVG_OPCODE_SYSTEM:
+		csr = RVG_EXTRACT_SYSTEM_CSR(insn_buf);
+		if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
+		    (csr >= CSR_VL && csr <= CSR_VLENB))
+			return true;
+	}
+
+	return false;
+}
+
+static int riscv_v_thread_zalloc(void)
+{
+	void *datap;
+
+	datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
+	if (!datap)
+		return -ENOMEM;
+
+	current->thread.vstate.datap = datap;
+	memset(&current->thread.vstate, 0, offsetof(struct __riscv_v_ext_state,
+						    datap));
+	return 0;
+}
+
+bool riscv_v_first_use_handler(struct pt_regs *regs)
+{
+	u32 __user *epc = (u32 __user *)regs->epc;
+	u32 insn = (u32)regs->badaddr;
+
+	/* Do not handle if V is not supported, or disabled */
+	if (!(ELF_HWCAP & COMPAT_HWCAP_ISA_V))
+		return false;
+
+	/* If V has been enabled then it is not the first-use trap */
+	if (riscv_v_vstate_query(regs))
+		return false;
+
+	/* Get the instruction */
+	if (!insn) {
+		if (__get_user(insn, epc))
+			return false;
+	}
+
+	/* Filter out non-V instructions */
+	if (!insn_is_vector(insn))
+		return false;
+
+	/* Sanity check. datap should be null by the time of the first-use trap */
+	WARN_ON(current->thread.vstate.datap);
+
+	/*
+	 * Now we sure that this is a V instruction. And it executes in the
+	 * context where VS has been off. So, try to allocate the user's V
+	 * context and resume execution.
+	 */
+	if (riscv_v_thread_zalloc()) {
+		force_sig(SIGBUS);
+		return true;
+	}
+	riscv_v_vstate_on(regs);
+	return true;
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

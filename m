Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EAFC6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMrVKBjDbR6NQ1Lxk22DR5gamDQ7j19nJUeuEPUx0uY=; b=UKLnobBjA+MoBT
	Cfbg4VVg7tlwZ1exGEg69kpdviLzhRIAk+oloLrDGf0WUPhR3FjRB5Y9QXFX2IqGQNjvTHxU2WYC3
	uNqjtl8jFrVOQ4DVNbulEpakXgUH5aRVNVPn+4NSItqHt4PEMAftR/SMRQJlsj2dUSmLMTlACfUmJ
	G/nbtRdR1/JOiHQydQ/KyYDH+7FnAV/atT0DbR1bzdBijU3nuInUuEbz/3VOw/TNa8PLJQS3d/Kgp
	8GecPRiLXY74+u8NnSNwKtx6eoJ2L4oL74e3KCCbTIjYtA6/1fZguNDtzoLIxGiVnD9zBhMwGPnqL
	inlJK7srX8J3c8xEWU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8On-0025P0-21;
	Fri, 17 Mar 2023 11:37:29 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Ok-0025LB-1u
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:37:28 +0000
Received: by mail-pl1-x62d.google.com with SMTP id h8so4970753plf.10
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679053043;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SzDj22VZq4DuUmdGqxaRJpqCPr36IFzM6hXF/DUz2kc=;
        b=g343i0PNAGUsu9Yp3it24c/WsvNVXZZ1yDzDKRvpI7H7ITMyu1tk5GU8DRzP+SPk5a
         pMXLEbG5a2Z228EjTWd5/DUA4VX+z2c3+auq36WWSQ68lKv+swgii4E4q0ZHylQE8o32
         IWrWgtBDFEzxFZH3llDp3Qadaq75omd11/FIUrTfTISqup/1ZrKzSx44HbQsNHoZN4Ae
         sUnkAk12uVSu2SXZG0FytlXv6jGvb+ZkvuU4BFa2frK2ipqxRYuDLq6ndoOWsddO+WMO
         g+b6xsEU6L8nsOR8z3Jwkwu8yJPenhTtW58xH9euaP3hMdYipSe45ccQRBsolqTQBKrg
         da4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679053043;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzDj22VZq4DuUmdGqxaRJpqCPr36IFzM6hXF/DUz2kc=;
        b=ajDMeCTF2eMK1XzFS/jyL7NI3SOi4tooV7T7voQsEGDOL1/1HKJ8MrwL7dxjgdM2MZ
         XlmDXj72z56xGzsCcfiQZFSUwm7wppUV64hyODI/7e/XY3IsCiRglgx4j49nYjZAvNm5
         HvRZ4CXItob6tbNV79hodQ07r0rmQiZur5N4G3URMndk1srBPeMINR8xmBdbCvhO6/y8
         hQlITGeEXowRv8noWS0+ZCLnBfZQP58zZcNZ+cl+edHjPjhd7P7Bv8T/C74Vo4LiZxSC
         M5STblupHho3j0KgjlFi9zEnan0B8o87/HcQ9Kq4B7yVMp6b/XhoMvMytgZn2uxwXZ8m
         8hUg==
X-Gm-Message-State: AO0yUKWX64bfu0txLzMQiEh+ZtKvUJqzoIpwaKKDUXoI4t9f7b6SDJzF
	Vl7msO8TkUD1L4lQIOujqQDwuOj1pNn8FF4L7Q1bpssjf/E8Y7g/MlFWR3L+Osc4bOjPM0WGRPh
	r/3YuXI4WNGQFhdhczmVNOULhObyxTmpMZcFf6TjXryN/Vk44jmkFdyYn0Fbywjai6933YBtawf
	/biz0ENkwS+d4i
X-Google-Smtp-Source: AK7set9YWMlcdG/lepnLF+FCviLNVJL9YgfBHFcT+J+Nu4Ldg+1gS1wYeMCC0ehXiwFxD+56/bje6w==
X-Received: by 2002:a17:90b:4f8c:b0:233:c301:32b3 with SMTP id qe12-20020a17090b4f8c00b00233c30132b3mr7939735pjb.3.1679053042886;
        Fri, 17 Mar 2023 04:37:22 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:37:22 -0700 (PDT)
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
	Liao Chang <liaochang1@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Mattias Nissler <mnissler@rivosinc.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH -next v15 10/19] riscv: Allocate user's vector context in the first-use trap
Date: Fri, 17 Mar 2023 11:35:29 +0000
Message-Id: <20230317113538.10878-11-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043726_631275_8EC446FE 
X-CRM114-Status: GOOD (  18.92  )
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
 arch/riscv/include/asm/insn.h   | 29 +++++++++++
 arch/riscv/include/asm/vector.h |  2 +
 arch/riscv/kernel/traps.c       | 14 ++++-
 arch/riscv/kernel/vector.c      | 90 +++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+), 2 deletions(-)

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
index 3bfa223facd0..09f8dbad3dee 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -20,6 +20,7 @@
 
 extern unsigned long riscv_v_vsize;
 void riscv_v_setup_vsize(void);
+bool riscv_v_first_use_handler(struct pt_regs *regs);
 
 static __always_inline bool has_vector(void)
 {
@@ -163,6 +164,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 struct pt_regs;
 
 static __always_inline bool has_vector(void) { return false; }
+static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
 #define riscv_v_vsize (0)
 #define riscv_v_setup_vsize()	 		do {} while (0)
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f6fda94e8e59..2a98fe74274e 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -24,6 +24,7 @@
 #include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/thread_info.h>
+#include <asm/vector.h>
 
 int show_unhandled_signals = 1;
 
@@ -135,8 +136,17 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
 	SIGBUS, BUS_ADRALN, "instruction address misaligned");
 DO_ERROR_INFO(do_trap_insn_fault,
 	SIGSEGV, SEGV_ACCERR, "instruction access fault");
-DO_ERROR_INFO(do_trap_insn_illegal,
-	SIGILL, ILL_ILLOPC, "illegal instruction");
+
+asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
+{
+	if (has_vector() && user_mode(regs)) {
+		if (riscv_v_first_use_handler(regs))
+			return;
+	}
+	do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
+		      "Oops - illegal instruction");
+}
+
 DO_ERROR_INFO(do_trap_load_fault,
 	SIGSEGV, SEGV_ACCERR, "load access fault");
 #ifndef CONFIG_RISCV_M_MODE
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 082baf2a061f..f13d2f3d77fb 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -4,9 +4,19 @@
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
+#include <asm/ptrace.h>
+#include <asm/bug.h>
 
 unsigned long riscv_v_vsize __read_mostly;
 EXPORT_SYMBOL_GPL(riscv_v_vsize);
@@ -19,3 +29,83 @@ void riscv_v_setup_vsize(void)
 	riscv_v_disable();
 }
 
+static bool insn_is_vector(u32 insn_buf)
+{
+	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
+	bool is_vector = false;
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
+		is_vector = true;
+		break;
+	case RVV_OPCODE_VL:
+	case RVV_OPCODE_VS:
+		width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
+		if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
+		    width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
+			is_vector = true;
+		break;
+	case RVG_OPCODE_SYSTEM:
+		csr = RVG_EXTRACT_SYSTEM_CSR(insn_buf);
+		if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
+		    (csr >= CSR_VL && csr <= CSR_VLENB))
+			is_vector = true;
+		break;
+	}
+	return is_vector;
+}
+
+static int riscv_v_thread_zalloc(void)
+{
+	void *datap;
+
+	datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
+	if (!datap)
+		return -ENOMEM;
+	current->thread.vstate.datap = datap;
+	memset(&current->thread.vstate, 0, offsetof(struct __riscv_v_ext_state,
+						    datap));
+	return 0;
+}
+
+bool riscv_v_first_use_handler(struct pt_regs *regs)
+{
+	__user u32 *epc = (u32 *)regs->epc;
+	u32 insn = (u32)regs->badaddr;
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
+	/* Filter out non-V instructions */
+	if (!insn_is_vector(insn))
+		return false;
+
+	/* Sanity check. datap should be null by the time of the first-use trap */
+	WARN_ON(current->thread.vstate.datap);
+	/*
+	 * Now we sure that this is a V instruction. And it executes in the
+	 * context where VS has been off. So, try to allocate the user's V
+	 * context and resume execution.
+	 */
+	if (riscv_v_thread_zalloc()) {
+		force_sig(SIGKILL);
+		return true;
+	}
+	riscv_v_vstate_on(regs);
+	return true;
+}
+
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

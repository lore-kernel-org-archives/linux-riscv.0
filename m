Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBC8C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UKCKxi4Fs8bliLgQRxy2FCfVuDS36d7AfY/yf5u4lI=; b=X2P5NOG/qZ2hE0
	iB6p4Ykk1mjdRSwAJ0mx+SBzP3Xrtl130IftVIv9MsMu0cFywmfxktK//qSuS0nz80JrgJJMhbEI3
	D9pE7hoEQJbW4MSY5hOkKPVTe88Tgj+mpA3Sdc8Cc+o4c4TOcX2ixSdxtH5pVUF/i241tyljpSSs2
	DRyuacXWaIeayCeFzQrU8DcgbF3yi+qbaaQqqy0JGqcd+SuethraWuIBtKFXrnfm1imAgq3sWcytq
	WnVfWwbCuoITRXMLr15A1bs6onL/BRSWN+x5ZuwE9JFUBaBXvfeBzhPAzjK5LWySTwuhSDrImyiR2
	J5yI9ltTfWOkKEil2TpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdv-002tbV-1H;
	Tue, 09 May 2023 10:32:27 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKds-002tYG-1B
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:32:26 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64115eef620so41331285b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628343; x=1686220343;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5EhZPsG4fUMbyzD4ZH3jWmG6kJzEmCE9DjIQkN59Cig=;
        b=iU8/xeO4UBiYFA4jRzrLnD1X0x/XfmL3CLbRO6hlBAjCPzh/Y/dANVDNgbMN6umhOe
         Jq3AR8Ump/y7zXnZF0gFGpZ6eGZ2epC2OZIiNhlHRToa20qCUOk4V/9kTUfdg1kR9h5L
         rNiMNLeDY2fS7eGReto6ek8gDlSDsa1eTC/2d4Fo+Uf5WLedvs2xVcezeR4LRDdMp4gA
         SPov0R9qmhElXANHyEC9x8SDkPyecskLsruB1YiBGzYH4coNKQKUPTebgkG6zTmtvp7r
         cUAMVNRq6hzTzAZ/sm9BanMXXh8mAyu4pkFSHV9C9toAgIAf2hS+19xerjuZ9CnxUFvp
         Omcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628343; x=1686220343;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5EhZPsG4fUMbyzD4ZH3jWmG6kJzEmCE9DjIQkN59Cig=;
        b=gTw+R1Ct+If85GZvkQedCi/HEczValuYIPbq1p8yUsP9sTUzLL0gTAfpoWh+ZU3ggo
         P09XrBWd4aFihYXRE0iNxaMqJrYjHm7z1xi81wfDg9fgROIUfQLJv/3LqUYNDC5GE+hI
         V02ir/zBHXk50jbh1FGjZhv2VhzVJQ2DTk+4Oygz6QVxRBZ90paMNHw1WxETzgy+huOV
         7rwsS5pR2HGJKd1bhZA53kgyVTe+47x35o0iCdiuB/VDzIqud9X9rbMDRghN1HG1WOou
         AsJJJtb5eOuD5OqWYSX1Z7/Oa+snGf31kMdwyEBsu6nUD7NbelaI5hAMVwjK0TgThYtr
         7Aew==
X-Gm-Message-State: AC+VfDxJaChWZVCosJtRYw3sdTz4hAt58x7yAoudwYPLHN1zRnludJA1
	JPQ2zdlhLNxAKKQmqnEDPB0mUEsZ24GbzjNdUQN1ZOc2WRYo2bBBXtirF8AmqxVCttoB7Zgajnl
	a2O3BcXcNNitcK/tK+FMoMmrYztcCHpAGyv1oYPaMk6jnduWJXXohDavba4uUX5ofyyvf/cJbFv
	kCKQa0tsM2XGLu
X-Google-Smtp-Source: ACHHUZ5qU9+zuapc71KpOuENn7lVNsrngsp86g4fPmCcN3LKYVPuVF2fNbM7L9T6PPNt4nnvXmuZkg==
X-Received: by 2002:a17:902:f54c:b0:1ac:3b69:bb9c with SMTP id h12-20020a170902f54c00b001ac3b69bb9cmr17918311plf.28.1683628343159;
        Tue, 09 May 2023 03:32:23 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:32:22 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liao Chang <liaochang1@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Mattias Nissler <mnissler@rivosinc.com>
Subject: [PATCH -next v19 11/24] riscv: Allocate user's vector context in the first-use trap
Date: Tue,  9 May 2023 10:30:20 +0000
Message-Id: <20230509103033.11285-12-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033224_428344_31FCAFAF 
X-CRM114-Status: GOOD (  20.61  )
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
Acked-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changelog V18:
 - Add blank lines (Heiko)
 - Return immediately in insn_is_vector() if an insn matches (Heiko)

 arch/riscv/include/asm/insn.h   | 29 +++++++++++
 arch/riscv/include/asm/vector.h |  2 +
 arch/riscv/kernel/traps.c       | 26 +++++++++-
 arch/riscv/kernel/vector.c      | 91 +++++++++++++++++++++++++++++++++
 4 files changed, 146 insertions(+), 2 deletions(-)

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
index 121d700c6ada..a8881af83ce4 100644
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
index 8c258b78c925..24d309c6ab8d 100644
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
+		if (!has_vector() || !riscv_v_first_use_handler(regs))
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
index 120f1ce9abf9..960a343799c6 100644
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
@@ -34,3 +43,85 @@ int riscv_v_setup_vsize(void)
 
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
+		force_sig(SIGKILL);
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

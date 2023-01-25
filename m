Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCD2C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PpG7o/uicb+vPIwIr3oxKLMjW8CymQjCEOAprPNSJY=; b=LgOeMBe/pEfkNb
	MLKhf0JzyYXvah9voDXakO+3jhU8jNWDPHqjMQv3fU29R4zn+6ja8Sc56+0mnmixUg3XzZAXmhcSt
	qfGce6YNeyeLz+D/zJeOkewdf6wgmlEyl1pA6H3rM/J57tjuSiQS3cymlp6g+lewRr1P4tuRb54aL
	p8WbZsDSs88dhdRLCUdtuhYTNwSaAvO3/mtpXU9HIG/nxfAAp/SP8AhIG656lUcE+Mj4Z1DtpCRzy
	DHY3NAO/eRi7l0NdUYt2Mb2qRmmEaCqXewrxLB6x7MsoK5YAIaqRVToSMtTaPCa424qm3aD47R4gC
	HS0StbmErJ7g678KfrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgfE-007Vih-A3; Wed, 25 Jan 2023 14:22:12 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgfA-007VcI-QF
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 14:22:10 +0000
Received: by mail-pj1-x1031.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso2144389pjf.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P7edCeAwjfiwkkKg0W4tIhLAZjBnv1bdBFUA+mBx+50=;
        b=EwaZnhUa+ekhcI4IQm40kDpmqQ91VW57Kg2SGqKJUBq+BXQ4XFzQwgtpna5MYFWjXk
         m8KS2maRHs4iKz+NOF7lhgcsSHaDNWzuP0c01A8zD2VH0S8PpozRaru+EVokxZBVdEuQ
         0ZrBwcJ2ixaPI9EjgjVvSQjNhoJOovxiBN5VHOxemhhasziBW3F5+S/EfrjlbSrCvFji
         4WUHa7OhyFYvSRnmZr9PRtqYR6OjPqL+H883VvRa6tsHv7aImWELVe67liCJHJ6/riyj
         T7dC+WGWz70aTYBOOnVio113pdh8ADdZo2Epci9YgnYgfT86m8lr0iQqoTZHTddY/Yaj
         cq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7edCeAwjfiwkkKg0W4tIhLAZjBnv1bdBFUA+mBx+50=;
        b=hS86wz/T9kkKKYwJaxi3HnA/UVuapqW0ukejvWpXZzHkEXuh0QVJAV/8JWpVX5urI8
         as7uLEzqsdz/gnf5GgvfOq7MAuE134ifu5qOY4VSp7PMEoovQ70P37ULPOC7V4CmX93U
         0vPuJgrzF1QPQncHSdiK5aB8fK44kHcIOSKkiRYqGH39Vy8xCG/oiu7iuSXKX28npXLw
         2SJRCI7GEETexmxbvgoPuRshgAc4Izck+MsDwD3VEEGqeObWHlQbmdkNwBdlL/vTLJS5
         jUAVplGPaZo3uJPQbC2w9y6oxN6Me0tVFS+Ykmw0vpkf87E55AKKtB/VOSyzXyLua4+N
         862w==
X-Gm-Message-State: AFqh2kpwl7gtvkS/kCeUC3IygpJuzY0mJ3lGOUuFxPKJar9iizeoXB8x
	P47c+zcfujOT9HCLk5ID53nVKosao3WltvsclvlM14unLMtZPJMt1iQz65Wu/sS+SY+QJYKdwJF
	2Pu9csm5L/on1oXkhmMxtottnBXuIQZw6WyenpZw5HQqBgjDRmSeW0zlCUss0gLCP7k7yCUcXFB
	cj98xx9B3V1Q==
X-Google-Smtp-Source: AMrXdXtG1sIOVUuMs9I/wo6VgU4VFoE992ZnxdCDUMdsDubVbCL/9Smu69AiCEMOx3G13m1aOuX3/w==
X-Received: by 2002:a17:90b:4b92:b0:229:f4e1:d4b1 with SMTP id lr18-20020a17090b4b9200b00229f4e1d4b1mr23173072pjb.22.1674656521831;
        Wed, 25 Jan 2023 06:22:01 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:22:01 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Changbin Du <changbin.du@intel.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH -next v13 10/19] riscv: Allocate user's vector context in the first-use trap
Date: Wed, 25 Jan 2023 14:20:47 +0000
Message-Id: <20230125142056.18356-11-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062208_873395_1D49F40E 
X-CRM114-Status: GOOD (  21.13  )
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
 arch/riscv/include/asm/insn.h   | 24 +++++++++
 arch/riscv/include/asm/vector.h |  2 +
 arch/riscv/kernel/Makefile      |  1 +
 arch/riscv/kernel/vector.c      | 89 +++++++++++++++++++++++++++++++++
 4 files changed, 116 insertions(+)
 create mode 100644 arch/riscv/kernel/vector.c

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 25ef9c0b19e7..b1ef3617881f 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -133,6 +133,24 @@
 #define RVG_OPCODE_JALR		0x67
 #define RVG_OPCODE_JAL		0x6f
 #define RVG_OPCODE_SYSTEM	0x73
+#define RVG_SYSTEM_CSR_OFF	20
+#define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)
+
+/* parts of opcode for RVV */
+#define OPCODE_VECTOR		0x57
+#define LSFP_WIDTH_RVV_8	0
+#define LSFP_WIDTH_RVV_16	5
+#define LSFP_WIDTH_RVV_32	6
+#define LSFP_WIDTH_RVV_64	7
+
+/* parts of opcode for RVF, RVD and RVQ */
+#define LSFP_WIDTH_OFF		12
+#define LSFP_WIDTH_MASK		GENMASK(3, 0)
+#define LSFP_WIDTH_FP_W		2
+#define LSFP_WIDTH_FP_D		3
+#define LSFP_WIDTH_FP_Q		4
+#define OPCODE_LOADFP		0x07
+#define OPCODE_STOREFP		0x27
 
 /* parts of opcode for RVC*/
 #define RVC_OPCODE_C0		0x0
@@ -291,6 +309,12 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
 	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
 
+#define EXTRACT_LOAD_STORE_FP_WIDTH(x) \
+	({typeof(x) x_ = (x); RV_X(x_, LSFP_WIDTH_OFF, LSFP_WIDTH_MASK); })
+
+#define EXTRACT_SYSTEM_CSR(x) \
+	({typeof(x) x_ = (x); RV_X(x_, RVG_SYSTEM_CSR_OFF, RVG_SYSTEM_CSR_MASK); })
+
 /*
  * Get the immediate from a J-type instruction.
  *
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index f8a9e37c4374..7c77696d704a 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -19,6 +19,7 @@
 #define CSR_STR(x) __ASM_STR(x)
 
 extern unsigned long riscv_vsize;
+bool rvv_first_use_handler(struct pt_regs *regs);
 
 static __always_inline bool has_vector(void)
 {
@@ -138,6 +139,7 @@ static inline void vstate_restore(struct task_struct *task,
 struct pt_regs;
 
 static __always_inline bool has_vector(void) { return false; }
+static inline bool rvv_first_use_handler(struct pt_regs *regs) { return false; }
 static inline bool vstate_query(struct pt_regs *regs) { return false; }
 #define riscv_vsize (0)
 #define vstate_save(task, regs)		do {} while (0)
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 4cf303a779ab..48d345a5f326 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
+obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
new file mode 100644
index 000000000000..cdd58d1c8b3c
--- /dev/null
+++ b/arch/riscv/kernel/vector.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SiFive
+ * Author: Andy Chiu <andy.chiu@sifive.com>
+ */
+#include <linux/sched/signal.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/sched.h>
+#include <linux/uaccess.h>
+
+#include <asm/thread_info.h>
+#include <asm/processor.h>
+#include <asm/insn.h>
+#include <asm/vector.h>
+#include <asm/ptrace.h>
+#include <asm/bug.h>
+
+static bool insn_is_vector(u32 insn_buf)
+{
+	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
+	/*
+	 * All V-related instructions, including CSR operations are 4-Byte. So,
+	 * do not handle if the instruction length is not 4-Byte.
+	 */
+	if (unlikely(GET_INSN_LENGTH(insn_buf) != 4))
+		return false;
+	if (opcode == OPCODE_VECTOR) {
+		return true;
+	} else if (opcode == OPCODE_LOADFP || opcode == OPCODE_STOREFP) {
+		u32 width = EXTRACT_LOAD_STORE_FP_WIDTH(insn_buf);
+
+		if (width == LSFP_WIDTH_RVV_8 || width == LSFP_WIDTH_RVV_16 ||
+		    width == LSFP_WIDTH_RVV_32 || width == LSFP_WIDTH_RVV_64)
+			return true;
+	} else if (opcode == RVG_OPCODE_SYSTEM) {
+		u32 csr = EXTRACT_SYSTEM_CSR(insn_buf);
+
+		if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
+		    (csr >= CSR_VL && csr <= CSR_VLENB))
+			return true;
+	}
+	return false;
+}
+
+int rvv_thread_zalloc(void)
+{
+	void *datap;
+
+	datap = kzalloc(riscv_vsize, GFP_KERNEL);
+	if (!datap)
+		return -ENOMEM;
+	current->thread.vstate.datap = datap;
+	memset(&current->thread.vstate, 0, offsetof(struct __riscv_v_state,
+						    datap));
+	return 0;
+}
+
+bool rvv_first_use_handler(struct pt_regs *regs)
+{
+	__user u32 *epc = (u32 *)regs->epc;
+	u32 tval = (u32)regs->badaddr;
+
+	/* If V has been enabled then it is not the first-use trap */
+	if (vstate_query(regs))
+		return false;
+	/* Get the instruction */
+	if (!tval) {
+		if (__get_user(tval, epc))
+			return false;
+	}
+	/* Filter out non-V instructions */
+	if (!insn_is_vector(tval))
+		return false;
+	/* Sanity check. datap should be null by the time of the first-use trap */
+	WARN_ON(current->thread.vstate.datap);
+	/*
+	 * Now we sure that this is a V instruction. And it executes in the
+	 * context where VS has been off. So, try to allocate the user's V
+	 * context and resume execution.
+	 */
+	if (rvv_thread_zalloc()) {
+		force_sig(SIGKILL);
+		return true;
+	}
+	vstate_on(regs);
+	return true;
+}
+
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

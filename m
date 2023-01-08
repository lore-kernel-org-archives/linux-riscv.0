Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8005C54EBE
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jan 2023 16:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BAsxwiWV/kUI/bnBdOuBHesxeUyA/Kx29L9Q/v1X1Q=; b=VFXK+CcKRvg5N9
	WPVCS70DJ7MzdSiRB+P6tHC2h1pZmLCR2BlPgqwQ0xsBRhK1vIx1UiRXiQUD7pt3E9vONfSYYXRJd
	pcvuwAQTKeB0AUMgrtlkEHTisSpH+dsOP0P2feO+WZCEbNzEjzLqKtDctKrtjH+ggBPJAQM+72ckK
	Ed09obCXcQDvB2uU5re0w4u3SX2KAx+ErzgRNJVezwAD4N39onnhOY0MjVRIVTSWd3Su7szZR8WD+
	8JGpGFlnnDrAOaSwuLX0LEpDzp3aBgwyV1JXzf13ynbmJM6O5IYopQ+Xt2HovUAqd9KGvPua45xEm
	CTu5BCooFcn5mCFegCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEYd0-00EMXR-HD; Sun, 08 Jan 2023 16:34:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEYcv-00EMUs-F3
	for linux-riscv@lists.infradead.org; Sun, 08 Jan 2023 16:34:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9248560CF3;
	Sun,  8 Jan 2023 16:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B35C433F0;
	Sun,  8 Jan 2023 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673195666;
	bh=8gJDKBTPzJX7C8zEPZhhqs6jKtq7Uv6sX1w3sRKaFw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nJu7f0fHjafT4FdRdYLxr1dWfADQQeW76oKEWA0QxYGqcF71Bt1E3yHI63NrxfePX
	 WlKPcqIalJi8+qFiR9Epe50KaqwtQsvtVYOh7XRrl8SjbUvCQxsBfBJSeO7Dikx7kk
	 g7u3QNJV0DHoBsspoZWSqpywqyLpDHkUh0bytLuUBT51OgYy2U19tex5irAZEi0/KA
	 SNTWOPdMgTlchLT0amjE1gfbLc1p6UD6FhQ43EOmKgg/rUpb0idKtznXJFCYtgBEDH
	 Psa4WbfBuSYB1dQMYBrBSRT5coc4x3ZTd/J2gW/NoNKtmEh/4mRO0V/qAJw7s5QWAk
	 0Xl3oqlL1+mVg==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/3] RISC-V: insn-def: Add I-type insn-def
Date: Sun,  8 Jan 2023 16:33:54 +0000
Message-Id: <20230108163356.3063839-2-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108163356.3063839-1-conor@kernel.org>
References: <20230108163356.3063839-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_083429_608296_795AC29F 
X-CRM114-Status: GOOD (  10.57  )
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

From: Andrew Jones <ajones@ventanamicro.com>

CBO instructions use the I-type of instruction format where
the immediate is used to identify the CBO instruction type.
Add I-type instruction encoding support to insn-def.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/insn-def.h | 46 +++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 16044affa57c..39f9e0893564 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -12,6 +12,12 @@
 #define INSN_R_RD_SHIFT			 7
 #define INSN_R_OPCODE_SHIFT		 0
 
+#define INSN_I_SIMM12_SHIFT		20
+#define INSN_I_RS1_SHIFT		15
+#define INSN_I_FUNC3_SHIFT		12
+#define INSN_I_RD_SHIFT			 7
+#define INSN_I_OPCODE_SHIFT		 0
+
 #ifdef __ASSEMBLY__
 
 #ifdef CONFIG_AS_HAS_INSN
@@ -20,6 +26,10 @@
 	.insn	r \opcode, \func3, \func7, \rd, \rs1, \rs2
 	.endm
 
+	.macro insn_i, opcode, func3, rd, rs1, simm12
+	.insn	i \opcode, \func3, \rd, \rs1, \simm12
+	.endm
+
 #else
 
 #include <asm/gpr-num.h>
@@ -33,9 +43,18 @@
 		 (.L__gpr_num_\rs2 << INSN_R_RS2_SHIFT))
 	.endm
 
+	.macro insn_i, opcode, func3, rd, rs1, simm12
+	.4byte	((\opcode << INSN_I_OPCODE_SHIFT) |		\
+		 (\func3 << INSN_I_FUNC3_SHIFT) |		\
+		 (.L__gpr_num_\rd << INSN_I_RD_SHIFT) |		\
+		 (.L__gpr_num_\rs1 << INSN_I_RS1_SHIFT) |	\
+		 (\simm12 << INSN_I_SIMM12_SHIFT))
+	.endm
+
 #endif
 
 #define __INSN_R(...)	insn_r __VA_ARGS__
+#define __INSN_I(...)	insn_i __VA_ARGS__
 
 #else /* ! __ASSEMBLY__ */
 
@@ -44,6 +63,9 @@
 #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)	\
 	".insn	r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n"
 
+#define __INSN_I(opcode, func3, rd, rs1, simm12)	\
+	".insn	i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n"
+
 #else
 
 #include <linux/stringify.h>
@@ -60,14 +82,32 @@
 "		 (.L__gpr_num_\\rs2 << " __stringify(INSN_R_RS2_SHIFT) "))\n" \
 "	.endm\n"
 
+#define DEFINE_INSN_I							\
+	__DEFINE_ASM_GPR_NUMS						\
+"	.macro insn_i, opcode, func3, rd, rs1, simm12\n"		\
+"	.4byte	((\\opcode << " __stringify(INSN_I_OPCODE_SHIFT) ") |"	\
+"		 (\\func3 << " __stringify(INSN_I_FUNC3_SHIFT) ") |"	\
+"		 (.L__gpr_num_\\rd << " __stringify(INSN_I_RD_SHIFT) ") |"   \
+"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_I_RS1_SHIFT) ") |" \
+"		 (\\simm12 << " __stringify(INSN_I_SIMM12_SHIFT) "))\n"	\
+"	.endm\n"
+
 #define UNDEFINE_INSN_R							\
 "	.purgem insn_r\n"
 
+#define UNDEFINE_INSN_I							\
+"	.purgem insn_i\n"
+
 #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
 	DEFINE_INSN_R							\
 	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
 	UNDEFINE_INSN_R
 
+#define __INSN_I(opcode, func3, rd, rs1, simm12)			\
+	DEFINE_INSN_I							\
+	"insn_i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n" \
+	UNDEFINE_INSN_I
+
 #endif
 
 #endif /* ! __ASSEMBLY__ */
@@ -76,9 +116,14 @@
 	__INSN_R(RV_##opcode, RV_##func3, RV_##func7,		\
 		 RV_##rd, RV_##rs1, RV_##rs2)
 
+#define INSN_I(opcode, func3, rd, rs1, simm12)			\
+	__INSN_I(RV_##opcode, RV_##func3, RV_##rd,		\
+		 RV_##rs1, RV_##simm12)
+
 #define RV_OPCODE(v)		__ASM_STR(v)
 #define RV_FUNC3(v)		__ASM_STR(v)
 #define RV_FUNC7(v)		__ASM_STR(v)
+#define RV_SIMM12(v)		__ASM_STR(v)
 #define RV_RD(v)		__ASM_STR(v)
 #define RV_RS1(v)		__ASM_STR(v)
 #define RV_RS2(v)		__ASM_STR(v)
@@ -87,6 +132,7 @@
 #define RV___RS1(v)		__RV_REG(v)
 #define RV___RS2(v)		__RV_REG(v)
 
+#define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
 #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
 
 #define HFENCE_VVMA(vaddr, asid)				\
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

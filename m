Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1ECC43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nc9XNG2iOnCTKrugtb8kQVycepw9Moqs4cRq3MWPkRs=; b=Bil0nDdTkawlec
	sUALADsW9b109GpoYtAVBOC93wufG4DhBTD+invj7lT1dysP+vbVkiFnM4N82prwLxUg1zhpvtfhl
	JrHnA2dd5qMMmvezx8n80Mh09/klqJdioQrl10iqk71ZqW9a4WKK+rGPzLdCE4dRPpGtVMwS7dHTv
	m5Bs9LwZGZk7xIDfCVBOm1GR5XE3gaAWFnARAq7Wz4ZsgQfYmFl+Td+g4xMdHIVVvOsggfRgYSiF9
	dyvm+ppeZIVo9a81SHSuoMKx3Uh2R5k+nQY0hxQwnqj7iYcSetOD6LkFld8C9wM+BIOe7zevGro3M
	ZK+P6xf0SGMrbhnpiotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLr-0011fU-CV; Mon, 28 Nov 2022 10:27:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLp-0011dR-M0
	for linux-riscv@bombadil.infradead.org; Mon, 28 Nov 2022 10:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Uzthm3Dlb37C6iIAoRJi3Vj/PYpcYMF8I0V61hscMcA=; b=QoHOY8e68Crv9NXJG2Gg/oNv+w
	c63eYP/bxMZca1hicc+PddGuCe91/IgJJsqc+iDHOFuMEJ6WYsiSUEYK8qJ7dAgx2eMVsgKpjH2Sy
	7OVwZ193+YSxIjCDOOpSS1iQv8YrJqqy3XcPZlJumrPkLZ4uvm6OxgB5YS579dc+HNTfz1fG/3Rul
	+Ytt3NUpjlnxlFuZuodEX28EAirXYQm/HdJPYGGsnn17Mct9HOyg43Z7efpd5aqJh790n+8JFxlYj
	H9i23PBy02mBd/lsE9utQn86+Pneg3sznI9GDmWiALs78+FvMK7AibGC4WRmtQ95CDNmDKIqxKCD6
	rDnogHGQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLZ-005VXl-PB
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 10:26:55 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ozbLT-0004Xi-BX; Mon, 28 Nov 2022 11:26:39 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v2 04/13] RISC-V: Move riscv_insn_is_* macros into a common header
Date: Mon, 28 Nov 2022 11:26:23 +0100
Message-Id: <20221128102632.435174-5-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128102632.435174-1-heiko@sntech.de>
References: <20221128102632.435174-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_102653_072960_74B5D40A 
X-CRM114-Status: GOOD (  17.73  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Right now the riscv kernel has (at least) two independent sets
of functions to check if an encoded instruction is of a specific
type. One in kgdb and one kprobes simulate-insn code.

More parts of the kernel will probably need this in the future,
so instead of allowing this duplication to go on further,
move macros that do the function declaration in a common header,
similar to at least aarch64.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/parse_asm.h       | 41 ++++++++++++++++----
 arch/riscv/kernel/kgdb.c                 | 49 ++++++++----------------
 arch/riscv/kernel/probes/simulate-insn.h | 26 +++----------
 3 files changed, 54 insertions(+), 62 deletions(-)

diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
index e8303250f598..bfd306f85ec7 100644
--- a/arch/riscv/include/asm/parse_asm.h
+++ b/arch/riscv/include/asm/parse_asm.h
@@ -190,13 +190,40 @@
 #define __INSN_OPCODE_MASK	_UL(0x7F)
 #define __INSN_BRANCH_OPCODE	_UL(RVG_OPCODE_BRANCH)
 
-/* Define a series of is_XXX_insn functions to check if the value INSN
- * is an instance of instruction XXX.
- */
-#define DECLARE_INSN(INSN_NAME, INSN_MATCH, INSN_MASK) \
-static inline bool is_ ## INSN_NAME ## _insn(long insn) \
-{ \
-	return (insn & (INSN_MASK)) == (INSN_MATCH); \
+#define __RISCV_INSN_FUNCS(name, mask, val)				\
+static __always_inline bool riscv_insn_is_##name(u32 code)		\
+{									\
+	BUILD_BUG_ON(~(mask) & (val));					\
+	return (code & (mask)) == (val);				\
+}									\
+
+#if __riscv_xlen == 32
+/* C.JAL is an RV32C-only instruction */
+__RISCV_INSN_FUNCS(c_jal, RVC_MASK_C_JAL, RVC_MATCH_C_JAL)
+#else
+#define riscv_insn_is_c_jal(opcode) 0
+#endif
+__RISCV_INSN_FUNCS(jalr, RVG_MASK_JALR, RVG_MATCH_JALR)
+__RISCV_INSN_FUNCS(jal, RVG_MASK_JAL, RVG_MATCH_JAL)
+__RISCV_INSN_FUNCS(c_jr, RVC_MASK_C_JR, RVC_MATCH_C_JR)
+__RISCV_INSN_FUNCS(c_jalr, RVC_MASK_C_JALR, RVC_MATCH_C_JALR)
+__RISCV_INSN_FUNCS(c_j, RVC_MASK_C_J, RVC_MATCH_C_J)
+__RISCV_INSN_FUNCS(beq, RVG_MASK_BEQ, RVG_MATCH_BEQ)
+__RISCV_INSN_FUNCS(bne, RVG_MASK_BNE, RVG_MATCH_BNE)
+__RISCV_INSN_FUNCS(blt, RVG_MASK_BLT, RVG_MATCH_BLT)
+__RISCV_INSN_FUNCS(bge, RVG_MASK_BGE, RVG_MATCH_BGE)
+__RISCV_INSN_FUNCS(bltu, RVG_MASK_BLTU, RVG_MATCH_BLTU)
+__RISCV_INSN_FUNCS(bgeu, RVG_MASK_BGEU, RVG_MATCH_BGEU)
+__RISCV_INSN_FUNCS(c_beqz, RVC_MASK_C_BEQZ, RVC_MATCH_C_BEQZ)
+__RISCV_INSN_FUNCS(c_bnez, RVC_MASK_C_BNEZ, RVC_MATCH_C_BNEZ)
+__RISCV_INSN_FUNCS(c_ebreak, RVC_MASK_C_EBREAK, RVC_MATCH_C_EBREAK)
+__RISCV_INSN_FUNCS(ebreak, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
+__RISCV_INSN_FUNCS(sret, RVG_MASK_SRET, RVG_MATCH_SRET)
+
+/* special case to catch _any_ branch instruction */
+static __always_inline bool riscv_insn_is_branch(u32 code)
+{
+	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_BRANCH;
 }
 
 #define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 030a129900db..61237aeb493c 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -23,27 +23,6 @@ enum {
 static unsigned long stepped_address;
 static unsigned int stepped_opcode;
 
-#if __riscv_xlen == 32
-/* C.JAL is an RV32C-only instruction */
-DECLARE_INSN(c_jal, MATCH_C_JAL, MASK_C_JAL)
-#else
-#define is_c_jal_insn(opcode) 0
-#endif
-DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
-DECLARE_INSN(jal, MATCH_JAL, MASK_JAL)
-DECLARE_INSN(c_jr, MATCH_C_JR, MASK_C_JR)
-DECLARE_INSN(c_jalr, MATCH_C_JALR, MASK_C_JALR)
-DECLARE_INSN(c_j, MATCH_C_J, MASK_C_J)
-DECLARE_INSN(beq, MATCH_BEQ, MASK_BEQ)
-DECLARE_INSN(bne, MATCH_BNE, MASK_BNE)
-DECLARE_INSN(blt, MATCH_BLT, MASK_BLT)
-DECLARE_INSN(bge, MATCH_BGE, MASK_BGE)
-DECLARE_INSN(bltu, MATCH_BLTU, MASK_BLTU)
-DECLARE_INSN(bgeu, MATCH_BGEU, MASK_BGEU)
-DECLARE_INSN(c_beqz, MATCH_C_BEQZ, MASK_C_BEQZ)
-DECLARE_INSN(c_bnez, MATCH_C_BNEZ, MASK_C_BNEZ)
-DECLARE_INSN(sret, MATCH_SRET, MASK_SRET)
-
 static int decode_register_index(unsigned long opcode, int offset)
 {
 	return (opcode >> offset) & 0x1F;
@@ -65,19 +44,21 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
 	if (get_kernel_nofault(op_code, (void *)pc))
 		return -EINVAL;
 	if ((op_code & __INSN_LENGTH_MASK) != __INSN_LENGTH_GE_32) {
-		if (is_c_jalr_insn(op_code) || is_c_jr_insn(op_code)) {
+		if (riscv_insn_is_c_jalr(op_code) ||
+		    riscv_insn_is_c_jr(op_code)) {
 			rs1_num = decode_register_index(op_code, RVC_C2_RS1_OPOFF);
 			*next_addr = regs_ptr[rs1_num];
-		} else if (is_c_j_insn(op_code) || is_c_jal_insn(op_code)) {
+		} else if (riscv_insn_is_c_j(op_code) ||
+			   riscv_insn_is_c_jal(op_code)) {
 			*next_addr = RVC_EXTRACT_JTYPE_IMM(op_code) + pc;
-		} else if (is_c_beqz_insn(op_code)) {
+		} else if (riscv_insn_is_c_beqz(op_code)) {
 			rs1_num = decode_register_index_short(op_code,
 							      RVC_C1_RS1_OPOFF);
 			if (!rs1_num || regs_ptr[rs1_num] == 0)
 				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
 			else
 				*next_addr = pc + 2;
-		} else if (is_c_bnez_insn(op_code)) {
+		} else if (riscv_insn_is_c_bnez(op_code)) {
 			rs1_num =
 			    decode_register_index_short(op_code, RVC_C1_RS1_OPOFF);
 			if (rs1_num && regs_ptr[rs1_num] != 0)
@@ -100,34 +81,34 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
 			if (rs2_num)
 				rs2_val = regs_ptr[rs2_num];
 
-			if (is_beq_insn(op_code))
+			if (riscv_insn_is_beq(op_code))
 				result = (rs1_val == rs2_val) ? true : false;
-			else if (is_bne_insn(op_code))
+			else if (riscv_insn_is_bne(op_code))
 				result = (rs1_val != rs2_val) ? true : false;
-			else if (is_blt_insn(op_code))
+			else if (riscv_insn_is_blt(op_code))
 				result =
 				    ((long)rs1_val <
 				     (long)rs2_val) ? true : false;
-			else if (is_bge_insn(op_code))
+			else if (riscv_insn_is_bge(op_code))
 				result =
 				    ((long)rs1_val >=
 				     (long)rs2_val) ? true : false;
-			else if (is_bltu_insn(op_code))
+			else if (riscv_insn_is_bltu(op_code))
 				result = (rs1_val < rs2_val) ? true : false;
-			else if (is_bgeu_insn(op_code))
+			else if (riscv_insn_is_bgeu(op_code))
 				result = (rs1_val >= rs2_val) ? true : false;
 			if (result)
 				*next_addr = imm + pc;
 			else
 				*next_addr = pc + 4;
-		} else if (is_jal_insn(op_code)) {
+		} else if (riscv_insn_is_jal(op_code)) {
 			*next_addr = RV_EXTRACT_JTYPE_IMM(op_code) + pc;
-		} else if (is_jalr_insn(op_code)) {
+		} else if (riscv_insn_is_jalr(op_code)) {
 			rs1_num = decode_register_index(op_code, RVG_RS1_OPOFF);
 			if (rs1_num)
 				*next_addr = ((unsigned long *)regs)[rs1_num];
 			*next_addr += RV_EXTRACT_ITYPE_IMM(op_code);
-		} else if (is_sret_insn(op_code)) {
+		} else if (riscv_insn_is_sret(op_code)) {
 			*next_addr = pc;
 		} else {
 			*next_addr = pc + 4;
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index cb6ff7dccb92..29fb16cd335c 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -3,14 +3,7 @@
 #ifndef _RISCV_KERNEL_PROBES_SIMULATE_INSN_H
 #define _RISCV_KERNEL_PROBES_SIMULATE_INSN_H
 
-#define __RISCV_INSN_FUNCS(name, mask, val)				\
-static __always_inline bool riscv_insn_is_##name(probe_opcode_t code)	\
-{									\
-	BUILD_BUG_ON(~(mask) & (val));					\
-	return (code & (mask)) == (val);				\
-}									\
-bool simulate_##name(u32 opcode, unsigned long addr,			\
-		     struct pt_regs *regs)
+#include <asm/parse_asm.h>
 
 #define RISCV_INSN_REJECTED(name, code)					\
 	do {								\
@@ -30,18 +23,9 @@ __RISCV_INSN_FUNCS(fence,	0x7f, 0x0f);
 		}							\
 	} while (0)
 
-__RISCV_INSN_FUNCS(c_j,		0xe003, 0xa001);
-__RISCV_INSN_FUNCS(c_jr,	0xf007, 0x8002);
-__RISCV_INSN_FUNCS(c_jal,	0xe003, 0x2001);
-__RISCV_INSN_FUNCS(c_jalr,	0xf007, 0x9002);
-__RISCV_INSN_FUNCS(c_beqz,	0xe003, 0xc001);
-__RISCV_INSN_FUNCS(c_bnez,	0xe003, 0xe001);
-__RISCV_INSN_FUNCS(c_ebreak,	0xffff, 0x9002);
-
-__RISCV_INSN_FUNCS(auipc,	0x7f, 0x17);
-__RISCV_INSN_FUNCS(branch,	0x7f, 0x63);
-
-__RISCV_INSN_FUNCS(jal,		0x7f, 0x6f);
-__RISCV_INSN_FUNCS(jalr,	0x707f, 0x67);
+bool simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 
 #endif /* _RISCV_KERNEL_PROBES_SIMULATE_INSN_H */
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

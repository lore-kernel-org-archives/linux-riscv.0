Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7789CC677F1
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 21:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2/579tD+bNx/B2ESoNNnOFG1fqCEq1Ik66aH0hLdo1o=; b=T0scaLIjvYIEAb
	A7yGcwZgd5Dt0MplcC4c8mMuUh2J+UcML7DdrfGeG01f4N5ivLtu6Kq3yvqN92SR3wlOSM3JlS2fL
	KQwdjkuGIs6QBhL8BFuvdw4dtsWWXhY1Gh29YYFsrricqA9tdvdIRJpdqO94ZH17SQ1+vQFItwOwv
	JsIx+IkBWAPorEji5RLUc2C0PzagOy1g7Zgs9bdWpM6gOp1EK3dUXJq6PBCEkrSNXhf9Po0/otV2m
	WItuF8CYhs3aool/q7bPASGkBIJu+0M7tMu7HIXGB0wuRlxgt7+5AqeC0cfvYZur6SC0HwMd43c9y
	0jRkRY80GzzmHVkGrCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRT9-004ZAK-OR; Fri, 13 Jan 2023 21:20:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRT1-004Z6Y-TS
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 21:20:05 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pGRSw-0003TD-FA; Fri, 13 Jan 2023 22:19:58 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] RISC-V: move some stray __RISCV_INSN_FUNCS definitions from kprobes
Date: Fri, 13 Jan 2023 22:19:55 +0100
Message-Id: <20230113211955.3534431-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_132003_995239_B7D6D1C2 
X-CRM114-Status: GOOD (  12.66  )
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

The __RISCV_INSN_FUNCS originally declared riscv_insn_is_* functions inside
the kprobes implementation. This got moved into a central header in
commit ec5f90877516 ("RISC-V: Move riscv_insn_is_* macros into a common header").

Though it looks like I overlooked two of them, so fix that. FENCE itself is
an instruction defined directly by its own opcode, while the created
riscv_isn_is_system function covers all instructions defined under the SYSTEM
opcode.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
Patch is unchanged from my zbb series, just split out as it is not really
part of that series target.

 arch/riscv/include/asm/insn.h            | 10 ++++++++++
 arch/riscv/kernel/probes/simulate-insn.h |  3 ---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 98453535324a..0455b4dcb0a7 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -128,6 +128,7 @@
 #define RVC_C2_RD_OPOFF		7
 
 /* parts of opcode for RVG*/
+#define RVG_OPCODE_FENCE	0x0f
 #define RVG_OPCODE_AUIPC	0x17
 #define RVG_OPCODE_BRANCH	0x63
 #define RVG_OPCODE_JALR		0x67
@@ -163,6 +164,7 @@
 #define RVG_MATCH_AUIPC		(RVG_OPCODE_AUIPC)
 #define RVG_MATCH_JALR		(RV_ENCODE_FUNCT3(JALR) | RVG_OPCODE_JALR)
 #define RVG_MATCH_JAL		(RVG_OPCODE_JAL)
+#define RVG_MATCH_FENCE		(RVG_OPCODE_FENCE)
 #define RVG_MATCH_BEQ		(RV_ENCODE_FUNCT3(BEQ) | RVG_OPCODE_BRANCH)
 #define RVG_MATCH_BNE		(RV_ENCODE_FUNCT3(BNE) | RVG_OPCODE_BRANCH)
 #define RVG_MATCH_BLT		(RV_ENCODE_FUNCT3(BLT) | RVG_OPCODE_BRANCH)
@@ -182,6 +184,7 @@
 #define RVG_MASK_AUIPC		(RV_INSN_OPCODE_MASK)
 #define RVG_MASK_JALR		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
 #define RVG_MASK_JAL		(RV_INSN_OPCODE_MASK)
+#define RVG_MASK_FENCE		(RV_INSN_OPCODE_MASK)
 #define RVC_MASK_C_JALR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
 #define RVC_MASK_C_JR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
 #define RVC_MASK_C_JAL		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
@@ -233,6 +236,13 @@ __RISCV_INSN_FUNCS(c_bnez, RVC_MASK_C_BNEZ, RVC_MATCH_C_BNEZ)
 __RISCV_INSN_FUNCS(c_ebreak, RVC_MASK_C_EBREAK, RVC_MATCH_C_EBREAK)
 __RISCV_INSN_FUNCS(ebreak, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
 __RISCV_INSN_FUNCS(sret, RVG_MASK_SRET, RVG_MATCH_SRET)
+__RISCV_INSN_FUNCS(fence, RVG_MASK_FENCE, RVG_MATCH_FENCE);
+
+/* special case to catch _any_ system instruction */
+static __always_inline bool riscv_insn_is_system(u32 code)
+{
+	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_SYSTEM;
+}
 
 /* special case to catch _any_ branch instruction */
 static __always_inline bool riscv_insn_is_branch(u32 code)
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index a19aaa0feb44..61e35db31001 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -12,9 +12,6 @@
 		}							\
 	} while (0)
 
-__RISCV_INSN_FUNCS(system,	0x7f, 0x73);
-__RISCV_INSN_FUNCS(fence,	0x7f, 0x0f);
-
 #define RISCV_INSN_SET_SIMULATE(name, code)				\
 	do {								\
 		if (riscv_insn_is_##name(code)) {			\
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

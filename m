Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493E9C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 22:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6l6v36v2TqlQqhrAnMDVnHlTKsmCSO0VG1Tf3SP+37U=; b=P31AkYuzBwkdHh
	iKb9qB+Hro0WSiBh6doNpvfMT70edzOrEzbNlnv1r/BTDoFn1fSF8tPYzuryCA1nWZvBOKn5C06MD
	fR7wk2+G0YmkRFWrA+Ee0Zfw3A/81jPFIQ8wKGqLDG6bVbTGBp7/A7UeTauEOWiolGEgyIUqxfn46
	9uIo/7pxUM4eVycWULlOcSRqVt9gR4aDC5yj6bxWujPgAQmQGYRsYi4pRpTb47gQBgHLSU+vudEaX
	FUGKTjcx1+gk/WWY7QJo4daUfXZW2weJ0FFtrtxYtih9bYuqbGdwAa4uvwN7kOl/DyI5pr6tFqHBe
	KWIw6+AV7FWJiHxIp04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qRO-00CiJ4-9j; Fri, 23 Dec 2022 22:22:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qR7-00Ci5Y-V3
	for linux-riscv@bombadil.infradead.org; Fri, 23 Dec 2022 22:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ffp6rRJ/e/gZUbiIalRGbiwuuLPuZgQPvHI4lYY5V6k=; b=I9vLs2PQyahxrNOqGnK2akS0mm
	4bH4MIvNdCpECQj1rYwpScrbSjHMaAoYoa6BZxRn8j82dYABTO9OphKIILi6GHpVv2yUDA1Z2LTsD
	vAmO/9hhYaC586maTC0BCq5GPveMoeFDHu7/enJplYT6Ta6yCQvcZfXvPmHCkQoO0MfJFcU6n6NwV
	rQrfLSa8pi7AJwCjvc+7TH/noPFCb/0Zj1MvYWuIulAz0n7pv5FFk7gR3dw5nSIhogl5MEZ70ZaqF
	UiKsLzchCXSxxlznc+dc/jFfowMw9ipC1YArTcx0mU0jVkhtVNa+T0I/csQMw8/Se1ytC7Feba19/
	n96irBpw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qIp-004osg-LX
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 22:14:10 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p8qIY-0002Hc-Ib; Fri, 23 Dec 2022 23:13:50 +0100
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
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 03/12] RISC-V: detach funct-values from their offset
Date: Fri, 23 Dec 2022 23:13:23 +0100
Message-Id: <20221223221332.4127602-4-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221223221332.4127602-1-heiko@sntech.de>
References: <20221223221332.4127602-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_221407_797472_998B80F9 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

Rather than defining funct3, funct4, etc values pre-shifted to their
target-position in an instruction, define the values themselves and
only shift them where needed.

This allows using these funct-values in other places as well, for example
when decoding functions.

At the same time also reduces the use of magic numbers, one would need
a spec manual to understand.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/parse_asm.h | 100 +++++++++++++++++------------
 1 file changed, 59 insertions(+), 41 deletions(-)

diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
index ea51542e0c65..e3f87da108f4 100644
--- a/arch/riscv/include/asm/parse_asm.h
+++ b/arch/riscv/include/asm/parse_asm.h
@@ -5,6 +5,15 @@
 
 #include <linux/bits.h>
 
+#define RV_INSN_FUNCT3_MASK	GENMASK(14, 12)
+#define RV_INSN_FUNCT3_OPOFF	12
+#define RV_INSN_OPCODE_MASK	GENMASK(6, 0)
+#define RV_INSN_OPCODE_OPOFF	0
+#define RV_INSN_FUNCT12_OPOFF	20
+
+#define RV_ENCODE_FUNCT3(f_)	(RVG_FUNCT3_##f_ << RV_INSN_FUNCT3_OPOFF)
+#define RV_ENCODE_FUNCT12(f_)	(RVG_FUNCT12_##f_ << RV_INSN_FUNCT12_OPOFF)
+
 /* The bit field of immediate value in I-type instruction */
 #define RV_I_IMM_SIGN_OPOFF	31
 #define RV_I_IMM_11_0_OPOFF	20
@@ -84,6 +93,15 @@
 #define RVC_B_IMM_2_1_MASK	GENMASK(1, 0)
 #define RVC_B_IMM_5_MASK	GENMASK(0, 0)
 
+#define RVC_INSN_FUNCT4_MASK	GENMASK(15, 12)
+#define RVC_INSN_FUNCT4_OPOFF	12
+#define RVC_INSN_FUNCT3_MASK	GENMASK(15, 13)
+#define RVC_INSN_FUNCT3_OPOFF	13
+#define RVC_INSN_J_RS2_MASK	GENMASK(6, 2)
+#define RVC_INSN_OPCODE_MASK	GENMASK(1, 0)
+#define RVC_ENCODE_FUNCT3(f_)	(RVC_FUNCT3_##f_ << RVC_INSN_FUNCT3_OPOFF)
+#define RVC_ENCODE_FUNCT4(f_)	(RVC_FUNCT4_##f_ << RVC_INSN_FUNCT4_OPOFF)
+
 /* The register offset in RVC op=C0 instruction */
 #define RVC_C0_RS1_OPOFF	7
 #define RVC_C0_RS2_OPOFF	2
@@ -113,52 +131,52 @@
 /* parts of funct3 code for I, M, A extension*/
 #define RVG_FUNCT3_JALR		0x0
 #define RVG_FUNCT3_BEQ		0x0
-#define RVG_FUNCT3_BNE		0x1000
-#define RVG_FUNCT3_BLT		0x4000
-#define RVG_FUNCT3_BGE		0x5000
-#define RVG_FUNCT3_BLTU		0x6000
-#define RVG_FUNCT3_BGEU		0x7000
+#define RVG_FUNCT3_BNE		0x1
+#define RVG_FUNCT3_BLT		0x4
+#define RVG_FUNCT3_BGE		0x5
+#define RVG_FUNCT3_BLTU		0x6
+#define RVG_FUNCT3_BGEU		0x7
 
 /* parts of funct3 code for C extension*/
-#define RVC_FUNCT3_C_BEQZ	0xc000
-#define RVC_FUNCT3_C_BNEZ	0xe000
-#define RVC_FUNCT3_C_J		0xa000
-#define RVC_FUNCT3_C_JAL	0x2000
-#define RVC_FUNCT4_C_JR		0x8000
-#define RVC_FUNCT4_C_JALR	0x9000
+#define RVC_FUNCT3_C_BEQZ	0x6
+#define RVC_FUNCT3_C_BNEZ	0x7
+#define RVC_FUNCT3_C_J		0x5
+#define RVC_FUNCT3_C_JAL	0x1
+#define RVC_FUNCT4_C_JR		0x8
+#define RVC_FUNCT4_C_JALR	0x9
 
-#define RVG_FUNCT12_SRET	0x10200000
+#define RVG_FUNCT12_SRET	0x102
 
-#define RVG_MATCH_JALR		(RVG_FUNCT3_JALR | RVG_OPCODE_JALR)
+#define RVG_MATCH_JALR		(RV_ENCODE_FUNCT3(JALR) | RVG_OPCODE_JALR)
 #define RVG_MATCH_JAL		(RVG_OPCODE_JAL)
-#define RVG_MATCH_BEQ		(RVG_FUNCT3_BEQ | RVG_OPCODE_BRANCH)
-#define RVG_MATCH_BNE		(RVG_FUNCT3_BNE | RVG_OPCODE_BRANCH)
-#define RVG_MATCH_BLT		(RVG_FUNCT3_BLT | RVG_OPCODE_BRANCH)
-#define RVG_MATCH_BGE		(RVG_FUNCT3_BGE | RVG_OPCODE_BRANCH)
-#define RVG_MATCH_BLTU		(RVG_FUNCT3_BLTU | RVG_OPCODE_BRANCH)
-#define RVG_MATCH_BGEU		(RVG_FUNCT3_BGEU | RVG_OPCODE_BRANCH)
-#define RVG_MATCH_SRET		(RVG_FUNCT12_SRET | RVG_OPCODE_SYSTEM)
-#define RVC_MATCH_C_BEQZ	(RVC_FUNCT3_C_BEQZ | RVC_OPCODE_C1)
-#define RVC_MATCH_C_BNEZ	(RVC_FUNCT3_C_BNEZ | RVC_OPCODE_C1)
-#define RVC_MATCH_C_J		(RVC_FUNCT3_C_J | RVC_OPCODE_C1)
-#define RVC_MATCH_C_JAL		(RVC_FUNCT3_C_JAL | RVC_OPCODE_C1)
-#define RVC_MATCH_C_JR		(RVC_FUNCT4_C_JR | RVC_OPCODE_C2)
-#define RVC_MATCH_C_JALR	(RVC_FUNCT4_C_JALR | RVC_OPCODE_C2)
-
-#define RVG_MASK_JALR		0x707f
-#define RVG_MASK_JAL		0x7f
-#define RVC_MASK_C_JALR		0xf07f
-#define RVC_MASK_C_JR		0xf07f
-#define RVC_MASK_C_JAL		0xe003
-#define RVC_MASK_C_J		0xe003
-#define RVG_MASK_BEQ		0x707f
-#define RVG_MASK_BNE		0x707f
-#define RVG_MASK_BLT		0x707f
-#define RVG_MASK_BGE		0x707f
-#define RVG_MASK_BLTU		0x707f
-#define RVG_MASK_BGEU		0x707f
-#define RVC_MASK_C_BEQZ		0xe003
-#define RVC_MASK_C_BNEZ		0xe003
+#define RVG_MATCH_BEQ		(RV_ENCODE_FUNCT3(BEQ) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BNE		(RV_ENCODE_FUNCT3(BNE) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BLT		(RV_ENCODE_FUNCT3(BLT) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BGE		(RV_ENCODE_FUNCT3(BGE) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BLTU		(RV_ENCODE_FUNCT3(BLTU) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_BGEU		(RV_ENCODE_FUNCT3(BGEU) | RVG_OPCODE_BRANCH)
+#define RVG_MATCH_SRET		(RV_ENCODE_FUNCT12(SRET) | RVG_OPCODE_SYSTEM)
+#define RVC_MATCH_C_BEQZ	(RVC_ENCODE_FUNCT3(C_BEQZ) | RVC_OPCODE_C1)
+#define RVC_MATCH_C_BNEZ	(RVC_ENCODE_FUNCT3(C_BNEZ) | RVC_OPCODE_C1)
+#define RVC_MATCH_C_J		(RVC_ENCODE_FUNCT3(C_J) | RVC_OPCODE_C1)
+#define RVC_MATCH_C_JAL		(RVC_ENCODE_FUNCT3(C_JAL) | RVC_OPCODE_C1)
+#define RVC_MATCH_C_JR		(RVC_ENCODE_FUNCT4(C_JR) | RVC_OPCODE_C2)
+#define RVC_MATCH_C_JALR	(RVC_ENCODE_FUNCT4(C_JALR) | RVC_OPCODE_C2)
+
+#define RVG_MASK_JALR		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_JAL		(RV_INSN_OPCODE_MASK)
+#define RVC_MASK_C_JALR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_JR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_JAL		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_J		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
+#define RVG_MASK_BEQ		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BNE		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BLT		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BGE		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BLTU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_BGEU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
+#define RVC_MASK_C_BEQZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
+#define RVC_MASK_C_BNEZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
 #define RVG_MASK_SRET		0xffffffff
 
 #define __INSN_LENGTH_MASK	_UL(0x3)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

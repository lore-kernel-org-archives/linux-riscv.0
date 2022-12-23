Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46639C3DA79
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 22:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/RmWEy3ZrOYsFS9IQbjD7hvcOIpkw75ipzGPL/xn2OY=; b=e6YFJ280ppYnQU
	XQj/T0vmM2bk5GmCBkHeJwVHxecXCwgqjnLGek+gFbjpySCqf8k6hSDtfpmUCJ+BfReJi9HuItOLq
	3FQ9UAMSIDmJScgKrp2H5RztuqYc59Ix/5EZ8JaS7RYcANlZXjZiyXPBrf9lKKCsoYQmp8afaTCoB
	nJQvZT3B2UohIQ3am1mRUwx8TlS+yf4uayFtaecPFq2McCAZIUHv2BUBPijRj540By/lI0JAF5FUK
	4zllFbr3LzrUdv3skZ5hcoTz4lIdCZtADTKKzJWVD7f0Wm6mwx/Qr7QWTfTmaoV++lGTChIjLkxZk
	7dqLJV+7TKa84TUnTa4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qLZ-00CfaO-R3; Fri, 23 Dec 2022 22:16:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qLM-00CfW7-Sz
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 22:16:46 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p8qIb-0002Hc-Ly; Fri, 23 Dec 2022 23:13:53 +0100
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
Subject: [PATCH v5 09/12] RISC-V: add U-type imm parsing to insn.h header
Date: Fri, 23 Dec 2022 23:13:29 +0100
Message-Id: <20221223221332.4127602-10-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221223221332.4127602-1-heiko@sntech.de>
References: <20221223221332.4127602-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_141644_977125_88254322 
X-CRM114-Status: GOOD (  12.32  )
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

Similar to other existing types, allow extracting the immediate
for a U-type instruction.

U-type immediates are special in that regard, that the value
in the instruction in bits [31:12] already represents the same
bits of the immediate, so no shifting is required.

U-type immediates are for example used in the auipc instruction,
so these constants make it easier to parse such instructions.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/insn.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 50c899cf4de5..21ec817abec1 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -34,6 +34,15 @@
 #define RV_J_IMM_11_MASK	GENMASK(0, 0)
 #define RV_J_IMM_19_12_MASK	GENMASK(7, 0)
 
+/*
+ * U-type IMMs contain the upper 20bits [31:20] of an immediate with
+ * the rest filled in by zeros, so no shifting required. Similarly,
+ * bit31 contains the signed state, so no sign extension necessary.
+ */
+#define RV_U_IMM_SIGN_OPOFF	31
+#define RV_U_IMM_31_12_OPOFF	0
+#define RV_U_IMM_31_12_MASK	GENMASK(31, 12)
+
 /* The bit field of immediate value in B-type instruction */
 #define RV_B_IMM_SIGN_OPOFF	31
 #define RV_B_IMM_10_5_OPOFF	25
@@ -235,6 +244,10 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
 #define RVC_X(X, s, mask) RV_X(X, s, mask)
 
+#define RV_EXTRACT_UTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
+
 #define RV_EXTRACT_JTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
 	(RV_X(x_, RV_J_IMM_10_1_OPOFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OFF) | \
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

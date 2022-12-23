Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275B3C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 22:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09tDZaWRgNmNADRdlIMGp+5nKRm4P1qNPHdA5t4yFvE=; b=zzaBboaomIyjXz
	tkC2gV+zvp06qO0N2qHTFEMsPnbNlrPVP/DIMrBOW/peV6Z0rnL6n40WhhanJKW/U2ov0Mok048Ib
	oFcd9iyMWPJvzISgOMN0cuFcDoccMH3m+bE7i0ja2jqYQGWTmiy3eP+SBvMCK/l947CXET/+4cAYx
	oj16tDVROYMDDziN9NHL0bHyPPFIgLgGrb9x4GpaHI3dGW4GKHxlqbxwKXo4gIq7+ele7KbpPuigL
	T8IcHFj0s+q6N7SkD3jjfqqCuk9oRrZIAVujrEmMlJJ2JEXBcXVqEMfFAQjxXpEMj2bjRIYpI6Rld
	f/H+s0XUYfydFp/QgxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qLX-00CfZe-O8; Fri, 23 Dec 2022 22:16:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qL9-00CfSE-2G
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 22:16:40 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p8qIc-0002Hc-Kq; Fri, 23 Dec 2022 23:13:54 +0100
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
Subject: [PATCH v5 11/12] RISC-V: add helpers for handling immediates in U-type and I-type pairs
Date: Fri, 23 Dec 2022 23:13:31 +0100
Message-Id: <20221223221332.4127602-12-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221223221332.4127602-1-heiko@sntech.de>
References: <20221223221332.4127602-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_141631_218536_DAA8FAD5 
X-CRM114-Status: GOOD (  13.28  )
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

Used together U-type and I-type instructions can for example be used to
generate bigger jumps (i.e. in auipc+jalr pairs) by splitting the value
into an upper immediate (i.e. auipc) and a 12bit immediate (i.e. jalr).

Due to both immediates being considered signed this creates some corner
cases, so add some helper to prevent this from getting duplicated in
different places.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/insn.h | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 2a23890b4577..98453535324a 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -290,3 +290,51 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 	(RVC_X(x_, RVC_B_IMM_5_OPOFF, RVC_B_IMM_5_MASK) << RVC_B_IMM_5_OFF) | \
 	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
 	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
+
+/*
+ * Put together one immediate from a U-type and I-type instruction pair.
+ *
+ * The U-type contains an upper immediate, meaning bits[31:12] with [11:0]
+ * being zero, while the I-type contains a 12bit immediate.
+ * Combined these can encode larger 32bit values and are used for example
+ * in auipc + jalr pairs to allow larger jumps.
+ *
+ * @utype_insn: instruction containing the upper immediate
+ * @itype_insn: instruction
+ * Return: combined immediate
+ */
+static inline s32 riscv_insn_extract_utype_itype_imm(u32 utype_insn, u32 itype_insn)
+{
+	s32 imm;
+
+	imm = RV_EXTRACT_UTYPE_IMM(utype_insn);
+	imm += RV_EXTRACT_ITYPE_IMM(itype_insn);
+
+	return imm;
+}
+
+/*
+ * Update a set of two instructions (U-type + I-type) with an immediate value.
+ *
+ * Used for example in auipc+jalrs pairs the U-type instructions contains
+ * a 20bit upper immediate representing bits[31:12], while the I-type
+ * instruction contains a 12bit immediate representing bits[11:0].
+ *
+ * This also takes into account that both separate immediates are
+ * considered as signed values, so if the I-type immediate becomes
+ * negative (BIT(11) set) the U-type part gets adjusted.
+ *
+ * @utype_insn: pointer to the utype instruction of the pair
+ * @itype_insn: pointer to the itype instruction of the pair
+ * @imm: the immediate to insert into the two instructions
+ */
+static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype_insn, s32 imm)
+{
+	/* drop possible old IMM values */
+	*utype_insn &= ~(RV_U_IMM_31_12_MASK);
+	*itype_insn &= ~(RV_I_IMM_11_0_MASK << RV_I_IMM_11_0_OPOFF);
+
+	/* add the adapted IMMs */
+	*utype_insn |= (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);
+	*itype_insn |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
+}
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

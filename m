Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151FAC352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 18:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lh5rYlW+ba9U4f3KwtvJD487fxYFk5SCH3vXkrwoiRA=; b=wZmttt4lipoMEC
	ZBfe1ESHYbKBBIc+nvYN/jKUn2JnoQoTl0gAGICTzYOFCz2pdtM9GRYzw//hxygi20ZgnKJYAoYL0
	NaejZV+ms6a3tcKAE1RmoX8+RZc5NoM0Xri7ClymNjmjnR7d8y6FfPnqr3vgIWk+uPxOnAx3n+GUl
	/ECxND5LR802GxxpBD5S37R5v9CvgW+RWkoVm2IfQxf+CEH2IRVoBnax6+PO/+3OcuuitkrdLT94k
	UId0rknJcQQ6+SFeCP6Zh5syCKrc+IN2kf/fExD25h/KhXJjM0dVs7tw+xIF4MVn9FWTAroug/8wa
	UXnEsYF/i83Q9Xbh4Rnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yr2-0081CH-73; Wed, 07 Dec 2022 18:09:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yqv-0080z2-QD
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 18:09:07 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p2yqK-0004lz-4I; Wed, 07 Dec 2022 19:08:28 +0100
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v4 11/12] RISC-V: add helpers for handling immediates in U-type and I-type pairs
Date: Wed,  7 Dec 2022 19:08:20 +0100
Message-Id: <20221207180821.2479987-12-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207180821.2479987-1-heiko@sntech.de>
References: <20221207180821.2479987-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_100905_962113_9015EE6B 
X-CRM114-Status: GOOD (  13.33  )
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

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/insn.h | 47 +++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 2a23890b4577..bb1e6120a560 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -290,3 +290,50 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
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
+ * @insn: pointer to a set of two instructions
+ * @imm: the immediate to insert into the two instructions
+ */
+static inline void riscv_insn_insert_utype_itype_imm(u32 *insn, s32 imm)
+{
+	/* drop possible old IMM values */
+	insn[0] &= ~(RV_U_IMM_31_12_MASK);
+	insn[1] &= ~(RV_I_IMM_11_0_MASK << RV_I_IMM_11_0_OPOFF);
+
+	/* add the adapted IMMs */
+	insn[0] |= ((imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1));
+	insn[1] |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
+}
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

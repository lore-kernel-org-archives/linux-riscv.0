Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D60C43217
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 10:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9PESpykwZ52+TyK4xXAd/y4t1DXUN4vaQiaLFtu5/4o=; b=AWcTVbdJq5tEwR
	dDKrgKn7hh26xxl80LclisAce+JaSPTIrxjLfYXXs9nG87OG32GanyVuu5Tj81Q+T5KWckLxEgY6j
	lUfBMVxwy3auWJ4ekKE+JpptLmuiHV/K/uveIKggZJS3dzBI8RqguuRRfV2k2iLZVMHByC3+5159i
	kvREZ0Y9lDUtxNCA4Et+Jz8X1KEyVGyuoSvVkIkHjtHEEPhTObKjzQy9cUl5batq5mmxjmQVAYsDG
	3txO0XV7rkqrHzIsLNod+gmQbmtFgsFFqZiO+XB9/pQrQVLkyBefTlaIqd7rgmuRnxXXOHlMp9Ifm
	B5b0wpG0DHTOz6/Z94SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLj-0011Ze-0x; Mon, 28 Nov 2022 10:26:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLf-0011XH-Ut
	for linux-riscv@bombadil.infradead.org; Mon, 28 Nov 2022 10:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5taDy3uWDbO+trhWE3+S+4t2NtNEFIJn7+vFRzFGQr4=; b=EbnAqP02K/n7cc5vVvLl3CQgWN
	53TRPl0PR7htz48p0XWC3YCN2GJjWX2FG+j4Q0esAV/2CcTLE5iE8Lpb1Ub2OQZsP/gmVM7JOdFe2
	/v4Den1oDksdR3R2ziLRvMHIOLh/Puiu2MenPYcmVSWl4Ex2jpaevNYe3PUke9X+Qr51kTU5tzgC0
	N+PdTl8l6OG7bWq64W5gs4mTIiHgpUG37f03v6wTBTCi4WUY7HtXWaKpY8Uer1fVcQ8b4IMWFuaoi
	9wXkSdDbF2be5veFaEmWSJDa6+FdQTljsOnPRHRzpL5Ie4bvh8Ww4a5Sz2ZROUz8MO4YhhT5qZyr5
	jnbotkxA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozbLZ-005VXo-M7
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 10:26:50 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ozbLU-0004Xi-UI; Mon, 28 Nov 2022 11:26:40 +0100
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
Subject: [PATCH v2 08/13] RISC-V: add U-type imm parsing to parse_asm header
Date: Mon, 28 Nov 2022 11:26:27 +0100
Message-Id: <20221128102632.435174-9-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128102632.435174-1-heiko@sntech.de>
References: <20221128102632.435174-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_102646_344035_7AC8E90C 
X-CRM114-Status: GOOD (  11.72  )
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

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/insn.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index f10cb0fdfa96..1caed8fe5204 100644
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

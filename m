Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56048C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 22:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jG3zLHe0kgnJWSJIQnnI0LceWJyfX0aMT7/YgmY57LI=; b=Va+T+dTjjPAlOL
	ZgeyOGpQQfwDkozYgDHc3OLOybQO61plGNN1T69S8mKIVKidOxXoHcpHIfvrquPn7dBmSZluD59lR
	j2yNqV19jsIFYshRIUq5Jz/OaeLc3stepWYMNFOyUZluEGf1D63g8w4hcMZSBote71zzphl3LNXPu
	DEEHMHDwgOLDUkLupP5hsASa7sSFcpa+2HmrXhavCX3/A9rtoS1scIXN/G4xhgB8vP7j7iXvelvcv
	GSuuWV37AaBbxl6ZqYz9lM113UxSWfdnSqxwPG6V6SHzb5uftrhm6Oe/8hfzBVGyLgKDBF0862g4R
	nEHvZmkB+qOAckVOzcGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Y0-005QJR-By; Fri, 04 Nov 2022 22:52:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Xr-005QAu-4j
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 22:52:16 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1or5Xg-0001sc-WC; Fri, 04 Nov 2022 23:52:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH RFC 4/9] RISC-V: add U-type imm parsing to parse_asm header
Date: Fri,  4 Nov 2022 23:51:48 +0100
Message-Id: <20221104225153.2710873-5-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104225153.2710873-1-heiko@sntech.de>
References: <20221104225153.2710873-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_155215_207628_4AB14F16 
X-CRM114-Status: GOOD (  12.25  )
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

Similar to other existing types, allow extracting the immediate
for a U-type instruction.

U-type immediates are special in that regard, that the value
in the instruction in bits [31:12] already represents the same
bits of the immediate, so no shifting is required.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/parse_asm.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
index c287c1426aa7..939ede0ee527 100644
--- a/arch/riscv/include/asm/parse_asm.h
+++ b/arch/riscv/include/asm/parse_asm.h
@@ -25,6 +25,15 @@
 #define J_IMM_11_MASK		GENMASK(0, 0)
 #define J_IMM_19_12_MASK	GENMASK(7, 0)
 
+/*
+ * U-type IMMs contain the upper 20bits [31:20] of an immediate with
+ * the rest filled in by zeros, so no shifting required. Similarly,
+ * bit31 contains the signed state, so no sign extension necessary.
+ */
+#define U_IMM_SIGN_OPOFF	31
+#define U_IMM_31_12_OPOFF	0
+#define U_IMM_31_12_MASK	GENMASK(31, 12)
+
 /* The bit field of immediate value in B-type instruction */
 #define B_IMM_SIGN_OPOFF	31
 #define B_IMM_10_5_OPOFF	25
@@ -183,6 +192,10 @@ static inline bool is_ ## INSN_NAME ## _insn(long insn) \
 #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
 #define RVC_X(X, s, mask) RV_X(X, s, mask)
 
+#define EXTRACT_UTYPE_IMM(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X(x_, U_IMM_31_12_OPOFF, U_IMM_31_12_MASK)); })
+
 #define EXTRACT_JTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
 	(RV_X(x_, J_IMM_10_1_OPOFF, J_IMM_10_1_MASK) << J_IMM_10_1_OFF) | \
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

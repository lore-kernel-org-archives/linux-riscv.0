Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B7BC4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 22:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1xQ7Of/crEPxlfvtM+28FkRXZVh2yzRouorsJIqRF0=; b=fAkLWr8cJnA6Hb
	CCaMIaA94E9/t7/QJDfmtk2sYtz53xDK99LZTTf1o06Nh7H0p99VV7t5tfPb2zp331D2W/EC/Yy7S
	AkEyPKSG0isABuVJ0OL+tGbRemQ+gCKsKhIQYVp+EsZPNPYhRZmqB8tr+2EgB7cZCoA+VxdPHXnHn
	3URWlQIvLP//viKScuX2w/ZWGRwlGJbt9xUSYmVVbh2ggAGhFkJpN0iB+09IGMVo7x7EwBBIanJdi
	CG9NhFiiKabjuY+SM1o3oiWj+vpvTd1eX9zsNbvHPjddA+nzhhU0EhxnbxKJIharWQKzSpHg2YA48
	M+DI0nU+35CaYxDCd9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0W1B-00332K-FW; Wed, 30 Nov 2022 22:57:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0W18-0032wn-4q
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 22:57:27 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0W0M-0005PW-TQ; Wed, 30 Nov 2022 23:56:38 +0100
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
	ardb@kernel.org,
	linux-efi@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 10/14] RISC-V: add rd reg parsing to insn.h header
Date: Wed, 30 Nov 2022 23:56:10 +0100
Message-Id: <20221130225614.1594256-11-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221130225614.1594256-1-heiko@sntech.de>
References: <20221130225614.1594256-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_145726_213797_0B0F3ACB 
X-CRM114-Status: UNSURE (   9.95  )
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

Add a macro to allow parsing of the rd register from an instruction.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/insn.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 21ec817abec1..2a23890b4577 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -60,6 +60,7 @@
 #define RVG_RS1_OPOFF		15
 #define RVG_RS2_OPOFF		20
 #define RVG_RD_OPOFF		7
+#define RVG_RD_MASK		GENMASK(4, 0)
 
 /* The bit field of immediate value in RVC J instruction */
 #define RVC_J_IMM_SIGN_OPOFF	12
@@ -244,6 +245,10 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
 #define RVC_X(X, s, mask) RV_X(X, s, mask)
 
+#define RV_EXTRACT_RD_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
+
 #define RV_EXTRACT_UTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
 	(RV_X(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

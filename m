Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7FAC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMiVvRwu+cYHHdL4agvwyheL4noiLLT8QgzhEN5CcTI=; b=OoUHgX6EfpswTX
	y4BhY29Q2LUKToONcy6KZgbOEIXGWD97goEiAEozcbiQBHUzNUxE4DJcq+/AhVS4wEA2Uq4oD9Swa
	pjODK+FaRTE/DmujxzuvNo4NdY2OkEd1jB34dd37W95MZ0VL+jKyvVVIyW4dKZ9XOvNdAOxckMiEH
	UQwlw7S5Cu3hz/C1ec8zGk51XtqhLPyc8qUeNli9DK9vN9Il5+bs2U9B0du8Vb/uOsmE20b260Umd
	9zC2f6Zs4zQegni3uZ7aJTv2W7VBwiyfrujO1KCVMdxB81ze7+8TfTLyktVDmqYWEE8RtlvXTav3L
	VBm/KdpKNr5Ot5pshcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAku-007KQY-4Y; Thu, 10 Nov 2022 16:50:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAko-007KHl-6u
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 16:50:15 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1otAkk-0001xU-EO; Thu, 10 Nov 2022 17:50:10 +0100
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
Subject: [PATCH 2/7] RISC-V: add auipc elements to parse_asm header
Date: Thu, 10 Nov 2022 17:49:19 +0100
Message-Id: <20221110164924.529386-3-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110164924.529386-1-heiko@sntech.de>
References: <20221110164924.529386-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_085014_276505_EE48A81F 
X-CRM114-Status: UNSURE (   9.56  )
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

We will want to use the opcode parsing outside kdb as well and need
at least the auipc element there.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/parse_asm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
index f36368de839f..c287c1426aa7 100644
--- a/arch/riscv/include/asm/parse_asm.h
+++ b/arch/riscv/include/asm/parse_asm.h
@@ -100,6 +100,7 @@
 #define RVC_C2_RD_OPOFF		7
 
 /* parts of opcode for RVG*/
+#define OPCODE_AUIPC		0x17
 #define OPCODE_BRANCH		0x63
 #define OPCODE_JALR		0x67
 #define OPCODE_JAL		0x6f
@@ -129,6 +130,7 @@
 
 #define FUNCT12_SRET		0x10200000
 
+#define MATCH_AUIPC		(OPCODE_AUIPC)
 #define MATCH_JALR		(FUNCT3_JALR | OPCODE_JALR)
 #define MATCH_JAL		(OPCODE_JAL)
 #define MATCH_BEQ		(FUNCT3_BEQ | OPCODE_BRANCH)
@@ -145,6 +147,7 @@
 #define MATCH_C_JR		(FUNCT4_C_JR | OPCODE_C_2)
 #define MATCH_C_JALR		(FUNCT4_C_JALR | OPCODE_C_2)
 
+#define MASK_AUIPC		0x7f
 #define MASK_JALR		0x707f
 #define MASK_JAL		0x7f
 #define MASK_C_JALR		0xf07f
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

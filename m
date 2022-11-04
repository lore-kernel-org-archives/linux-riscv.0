Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06FCC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 22:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ucxf9stpp+ZKf8VcY4AxmMngMybkZlMc6FxLnGu4KVc=; b=5CahAuG8bshYf9
	HOd6QL8XN4bFN7fJcvFDxU3RRO2Q+Wlg/m5GJKy/k2eek1ktyeercrc4THdl/PVK0TNdkOqCRPPip
	ZJOVKPXJyIT16IUBotvS6tPONe3vx3XDzprjVG/l6QeORBXLXNiZZdQoQ5oxFuOsy127Gq71X7k9D
	8+26Qj/faz9jDtY7x3uzb2ke2luW4bg0Wy/Gf5Mjt9dJ2OJs1XVRuahjth6QE1+mVKSCRDumGnWXQ
	hPN0BsUB2yVejQW46HoVJAX29x1ZxtZVlDjdvyDbdPBeimgvShwMocQWQKTjtFUm4KzreZhYwx4s0
	CkQVPWkXFkNs0x1tI/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Xp-005QDb-HG; Fri, 04 Nov 2022 22:52:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Xl-005QAr-6S
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 22:52:10 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1or5Xg-0001sc-Lz; Fri, 04 Nov 2022 23:52:04 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH RFC 3/9] RISC-V: add auipc elements to parse_asm header
Date: Fri,  4 Nov 2022 23:51:47 +0100
Message-Id: <20221104225153.2710873-4-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104225153.2710873-1-heiko@sntech.de>
References: <20221104225153.2710873-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_155209_247297_B675795A 
X-CRM114-Status: UNSURE (   9.37  )
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

We will want to use the opcode parsing outside kdb as well and need
at least the auipc element there.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
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

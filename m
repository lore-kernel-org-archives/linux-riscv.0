Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF38C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 22:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewVboRiB3O+tKaXG3h8WvTzo5e/O0v+G2ah2VZMXwS8=; b=Z2PDoO3ixw0lkX
	dy6qqXQBSjBEQ1FVCJuV1NRRPmbiUFAIZtQKBr8tQNVesQtqaCTHTBmmLiOKwI0NmxXg8EBzu4WRh
	e+zAM74n2OiAREdxb4XhLbtk21gAWCrprOHlcs3gQevrJ7VhML38Hct2AS4AoKxbS/MWT9DQOYrwj
	tdJHPTXJlp6EKDsevpEWeahM3sUYb9sKrqozZnE91HI8JKTHNVRsPchffeamGZbnbmc9ZrkxX/4dq
	iWi6peLkFhgw1Few7JL1iOAsD3hpdcqZ7kinGZ/jTpRWs3pCaIGEESdLdEHQcsNdepIeeGw8MnvF1
	8IETgxJOn+KFuBk9w/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qRJ-00CiH3-Pp; Fri, 23 Dec 2022 22:22:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qR7-00Ci8F-UJ
	for linux-riscv@bombadil.infradead.org; Fri, 23 Dec 2022 22:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YK/xBOFtKQ6CneUV6bLZNAryRlSRd/yNXZZPQowbg7U=; b=AYj5x/ZZOJqK50XygAJDag2ciF
	S0oQEt8duRzEUCScfZUNyZRvA+OaKb+o/UkvtHFutvRSSgvwGiKQyBC7XhMQgWdJ6youUlngaK3TX
	ja/x0FKH7UdKirnVvaTfGtrdWenrNa+LMduLciLxlrFHC4v5GOY/K9pW1hP4MET+/YD3LM3W2H9yQ
	2euDBauz44p5rIpGyK6QU6Yz0uw4VFrr68jYpGHgOOO9quYzlKkTclIod65bY2g/8vXEVfQl2gloO
	xkfDCNuvND2BqD7yGTlEXk9NUA97VBF21juvjXY0RwfosWkxd+kPPiCF4dmK8sKGQlrcbDgMuAwoS
	wGEMk1Cw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qIp-004osb-Q8
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 22:14:12 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p8qIX-0002Hc-JW; Fri, 23 Dec 2022 23:13:49 +0100
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 01/12] RISC-V: fix funct4 definition for c.jalr in parse_asm.h
Date: Fri, 23 Dec 2022 23:13:21 +0100
Message-Id: <20221223221332.4127602-2-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221223221332.4127602-1-heiko@sntech.de>
References: <20221223221332.4127602-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_221407_954909_C9E10EF4 
X-CRM114-Status: UNSURE (   9.72  )
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

The opcode definition for c.jalr is
    c.jalr c_rs1_n0  1..0=2 15..13=4 12=1 6..2=0

This means funct4 consisting of bit [15:12] is 1001b, so the value is 0x9.

Fixes: edde5584c7ab ("riscv: Add SW single-step support for KDB")
Reported-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/include/asm/parse_asm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
index f36368de839f..7fee806805c1 100644
--- a/arch/riscv/include/asm/parse_asm.h
+++ b/arch/riscv/include/asm/parse_asm.h
@@ -125,7 +125,7 @@
 #define FUNCT3_C_J		0xa000
 #define FUNCT3_C_JAL		0x2000
 #define FUNCT4_C_JR		0x8000
-#define FUNCT4_C_JALR		0xf000
+#define FUNCT4_C_JALR		0x9000
 
 #define FUNCT12_SRET		0x10200000
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

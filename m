Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7236FC47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 15:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uuJDKISTFFdLNHzUh8jmGja7QNd6BsmP6fPwNiZx36c=; b=N0seKWr7X/UD7s
	FrCWPpUtxmk4VMcgFDLOL3OwgGhUGN5PWMJx3y5m6bx4NCjEsgNBJXU6cyz+AAd+yJ46beEp8IXUZ
	oyNYGbtxTlxvFtd3D3jBfK/H9nLxUNlCM+ISjZmND5xf4++qk9hEot3JQy8g1vJnF60ZRF1WmL31M
	qdW1FuEwlN4Yd4asywnbVgOo/kCWAx1MYc3tTN/fOn92JCVeM7Vv6p1vzx5YpcMXQZBuqw1N+JRYV
	atZZ/th8eL38+9dOxu4VlfdgxNS+W4gzhD/Ip5NOX3YzAL8anjJtlY2g8yC2yeFpj01vUcjRzLcWC
	C9MCim3oBuQEhz16+x8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvpY-00CZ6V-0b;
	Mon, 22 Jan 2024 15:03:20 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvpU-00CZ4r-0P
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 15:03:19 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:955e:bba5:7ff4:cfb6])
	by albert.telenet-ops.be with bizsmtp
	id dr3B2B0040ZxL6o06r3BKN; Mon, 22 Jan 2024 16:03:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRvob-00GH0P-SX;
	Mon, 22 Jan 2024 16:03:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRvpO-00CFzl-S0;
	Mon, 22 Jan 2024 16:03:10 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] riscv: misaligned: Grammar s/disable/disabled/
Date: Mon, 22 Jan 2024 16:03:09 +0100
Message-Id: <c10ca3e18a783f6fc7ada13782e5f789e9fc2e7b.1705935488.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_070316_318262_8C660152 
X-CRM114-Status: UNSURE (   9.30  )
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

Fix a wrong conjugation of "disabled".

Fixes: 7c83232161f609bb ("riscv: add support for misaligned trap handling in S-mode")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 69d24f51392206bd..f1b22d11e0b63b32 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -693,7 +693,7 @@ config RISCV_MISALIGNED
 	default y
 	help
 	  Say Y here if you want the kernel to embed support for misaligned
-	  load/store for both kernel and userspace. When disable, misaligned
+	  load/store for both kernel and userspace. When disabled, misaligned
 	  accesses will generate SIGBUS in userspace and panic in kernel.
 
 config RISCV_EFFICIENT_UNALIGNED_ACCESS
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

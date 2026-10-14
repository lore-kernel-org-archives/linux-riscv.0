Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149AFCC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gKoGFsPq7q0rTvskIC6oKNBzje2dw+TXs0+IZfLA7GE=; b=i66VRCewwkSC1X
	+Xr4iOIZX+8E9uNDHLOJ80x8U5KnlVC79YDwxNfbv5NRHukr5hNVP6QpynDxUsnmI5BO7f+aWm8Se
	7uF1L5fb5y4f+kJR0YBhGpAtCayNUzuEJBhSxIlvoj4IY+/l5/mubtM6wURbSPhIbK2rVhRLe5HAD
	+Jw24gGfpwueFyo5l0eWYyVRuFo32KqqxwYC7VYks7DKMRLmwgjAs/BdA5XCeQRXnf2ZyftK6WoNA
	Lm8P2ra0DJa2INCU5Sb+2bTHfnyZWAkZ62VqB3trL2cDoUdN3PQ5LyHXT9FpVyvcLBFBFA9NCaoNL
	MdDtjSy2dhFRrSj2VvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGw6l-0000000FCF0-19Up;
	Wed, 14 Oct 2026 10:21:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGw6j-0000000FCEp-44qf
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 10:21:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AB8B6022A;
	Wed, 14 Oct 2026 10:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431141F000FF;
	Wed, 14 Oct 2026 10:21:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend on MMU
Date: Wed, 14 Oct 2026 12:20:39 +0200
Message-ID: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

These options are irreleant for nommu systems.

Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/riscv/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 15f6e67c60410a87..15beeb4690aebcc4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -605,7 +605,7 @@ config RISCV_ISA_SSQOSID
 
 config RISCV_ISA_SV48
 	bool "Page-Based 48-bit Virtual-Memory System"
-	depends on 64BIT
+	depends on 64BIT && MMU
 	default y
 	help
 	  Add support for the Page-Based 48-bit Virtual-Memory System.
@@ -617,7 +617,7 @@ config RISCV_ISA_SV48
 
 config RISCV_ISA_SV57
 	bool "Page-Based 57-bit Virtual-Memory System"
-	depends on 64BIT
+	depends on 64BIT && MMU
 	default y
 	help
 	  Add support for the Page-Based 57-bit Virtual-Memory System.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

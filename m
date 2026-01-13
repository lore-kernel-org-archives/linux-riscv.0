Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A1AD30CDB
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 22:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IL1rcfJm9YJGZDUuMB1vo6gfnCF9IaZ5A4leiTvuiuA=; b=hoqQPf9w9q1NnT
	m/2L4vLPNYPNe6hago87h+HpeWVcetIofwJTDuxCfszy1wfvXV2aIR4rivRKuN7jPQybtSee/mO5w
	674VjAVfH8Bm5soueA+iPK3EeW58pYM5iJZP8eVONl5tUKGGGQ12RILNBc14G2UaMBLNbF2+vQUC8
	UxW+P8uc5n1tp4PQxClWwn6B7DmNLjL3S+qdiKVvb40MolmlvG1nv1sMsrs9KhUCUPJaXLQfXvYL6
	QlfSBLuo/ZBFy9txtJzhzdYQzawqXcf3Tkok/PTc/OTfCRqeBYy63+hW83/qTACV2x4egr74S0hee
	SoXHiV7w5oQXZLLPR+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmcR-00000007nnc-3XUB;
	Tue, 13 Jan 2026 22:12:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfmcP-00000007nmc-2nnT
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 22:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6209944369;
	Tue, 13 Jan 2026 22:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D60C16AAE;
	Tue, 13 Jan 2026 22:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768342325;
	bh=z9Z05zc/VWYsbYT8EM5TL2vypSw4nX+Y7bZcGHAZZrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iLa9WMRa0BI5mFgcBhKgbGqCqCyqiwiJ/6PFb+vhdT0ADLaybSrsgmuXzXWpPEIHO
	 heA+m6ymnnOLn9ve0MBQk+F4gzAhZmf4w1jOmPl6lJ2xl61L2WXVT42ytZemRdHAm1
	 MODsE1aLcKOESSF62wbUyMFPRLvGTQ99RvGXc8cHtrSk+jfRLiSzY3buGGGmfFjVcq
	 C6bsQ86ydXweYz0f1JNZtc97D/ZBHO2QF5aI6FVxfnNYhRUpDNUa0HIYoWSAbDyKzP
	 4llQnjdLBP4xEABt+SUP8gtsbotKPFjCXGgLBlWcPLm+qSPfo1qUrJfC1c/fO6nHBW
	 kdyMR7SN+84xg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] clk: microchip: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
Date: Tue, 13 Jan 2026 22:11:45 +0000
Message-ID: <20260113-doing-surplus-dc45866f71d4@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113-snagged-blemish-52af3d00d88e@spud>
References: <20260113-snagged-blemish-52af3d00d88e@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=853; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=FjTWJC1wwS572Ik3G363c372pfHUYilsmPiBl9AksjM=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlph9UKVaf39veueVPBdfJ7xK4LS37bOJ3V2efFVGIeH LDNq/J0RwkLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYStZHhx1PL3/oqT4KWP9g/ 6/0RH4m5oVHX9nwUOxttmzj1MbOmOiPD/KrzVZG+q5W7HnJ9/Jt5QVpKKH/ZxEvrcrXLZR7p+Mz mBQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_141205_725449_A00419F1 
X-CRM114-Status: GOOD (  10.41  )
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

From: Conor Dooley <conor.dooley@microchip.com>

This driver is used by non-polarfire devices now, and the ARCH_MICROCHIP
symbol has been defined for some time on RISCV so drop it without any
functional change.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
index 1b9e43eb5497..0c03b14699bf 100644
--- a/drivers/clk/microchip/Kconfig
+++ b/drivers/clk/microchip/Kconfig
@@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
 
 config MCHP_CLK_MPFS
 	bool "Clk driver for PolarFire SoC"
-	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
-	default ARCH_MICROCHIP_POLARFIRE
+	depends on ARCH_MICROCHIP || COMPILE_TEST
+	default y
 	depends on MFD_SYSCON
 	select AUXILIARY_BUS
 	select REGMAP_MMIO
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

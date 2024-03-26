Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD38C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4RqdnWdlIT0ahiNv3WOcR1AI723tKjklksaX4WRCb1I=; b=SEXm0BM4KaXUKt
	pAwzwjJGIa+/f2BDsjf4nZWWuSmrPgN62M6zj3qWmD1v5da5uTh5G2T/YSicouK+XyBbFm8qT1v2Y
	hyEvnqgd8oP0aWZ/E1Rdi4arKolI74+pxTBMeVLWjDPbCs5NY5vk02exfDSe80IzE8oL5aV8YZvRQ
	OZv/kfYSAfq8xVRTqnEChn1F/CkN7ODJobXKXRLMHpRjS1MK/BkNY4vMUHfPIXdsPzfX3WR6NmY2j
	kSUfXqq52SQyBruDsZZ8Qi1PJdcRkpFmIehtIAdmPh5xCEPqCclZMrx3BBsU4Dr+l8q7gg3IJzFJR
	tNGC2h27bfIRrlLx4sVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAe4-00000005k9M-3AHq;
	Tue, 26 Mar 2024 17:31:32 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAe0-00000005k7i-2tZY
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 17:31:30 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by baptiste.telenet-ops.be with bizsmtp
	id 3VXD2C00R0SSLxL01VXDi8; Tue, 26 Mar 2024 18:31:18 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rpAdO-0053lJ-Rf;
	Tue, 26 Mar 2024 18:31:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rpAdl-001ZMO-Kd;
	Tue, 26 Mar 2024 18:31:13 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: DRM_WERROR should depend on DRM
Date: Tue, 26 Mar 2024 18:31:11 +0100
Message-Id: <631a1f4c066181b54617bfe2f38b0bd0ac865b68.1711474200.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_103128_887720_9B8EE271 
X-CRM114-Status: UNSURE (   9.71  )
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

There is no point in asking the user about enforcing the DRM compiler
warning policy when configuring a kernel without DRM support.

Fixes: f89632a9e5fa6c47 ("drm: Add CONFIG_DRM_WERROR")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f2bcf5504aa77679..2e1b23ccf30423a9 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -423,7 +423,7 @@ config DRM_PRIVACY_SCREEN
 
 config DRM_WERROR
 	bool "Compile the drm subsystem with warnings as errors"
-	depends on EXPERT
+	depends on DRM && EXPERT
 	default n
 	help
 	  A kernel build should not cause any compiler warnings, and this
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

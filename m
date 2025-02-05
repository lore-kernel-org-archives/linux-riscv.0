Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5AFC02194
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 14:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cRXYhJRxRY3kfnL4mwicepctWK6efivIsVLPWNxJ4hI=; b=vzOaTCOuFcaP6y
	/jW9GNsriU50j3YNkuHlhfTWecHNIGAUr04f/ikhSim/ogKldVn7FXXcuhSzV3HIUATrO48vyTAVP
	zyylmT/C6/YUwXQ52gXc8GE6Tm6NoFIVvts2dnoLZHt5goVlXQlsnlJhi9A0PA92tgvIDMtGOWvYv
	qBlgdLwO7ZDLIFArD+tCEO0AZ2N53S9ojN8JjUjpGwMH5eUxHYMY6lFn4A4yZoChIlC5yo033PG/z
	LYmbTzlFIFkM+iimgaNSdDxMlZunnYe8uk1iE/6ULwZ6G6Q2W3XdY9GYLY8b8Hu6S3cRdZQ7LCGkA
	13r1jd6Yd8OWHawxJcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfg5V-00000003UoZ-4745;
	Wed, 05 Feb 2025 14:09:09 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfg5U-00000003Uo3-0u0b
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 14:09:09 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fa11:c14e:2df5:5273])
	by baptiste.telenet-ops.be with cmsmtp
	id 9q942E00d3f221S01q94ff; Wed, 05 Feb 2025 15:09:04 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfg5E-0000000Fvz4-1vHG;
	Wed, 05 Feb 2025 15:09:04 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfg5Q-00000006VsX-26TE;
	Wed, 05 Feb 2025 15:09:04 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] riscv: Remove duplicate CLINT_TIMER selections
Date: Wed,  5 Feb 2025 15:09:03 +0100
Message-ID: <ce55529a42fa232cacd580e38866c60701f91095.1738764474.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_060908_393408_CDEBDA1A 
X-CRM114-Status: UNSURE (   6.97  )
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

Since commit f862bbf4cdca696e ("riscv: Allow NOMMU kernels to run in
S-mode") in v6.10, CLINT_TIMER is selected by the main RISCV symbol when
RISCV_M_MODE is enabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2:
  - Add Reviewed-by, Acked-by.
---
 arch/riscv/Kconfig.socs | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 1916cf7ba450ec99..3a2de20600bacb49 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -58,7 +58,6 @@ config ARCH_THEAD
 
 config ARCH_VIRT
 	bool "QEMU Virt Machine"
-	select CLINT_TIMER if RISCV_M_MODE
 	select POWER_RESET
 	select POWER_RESET_SYSCON
 	select POWER_RESET_SYSCON_POWEROFF
@@ -78,7 +77,6 @@ config ARCH_CANAAN
 config SOC_CANAAN_K210
 	bool "Canaan Kendryte K210 SoC"
 	depends on !MMU && ARCH_CANAAN
-	select CLINT_TIMER if RISCV_M_MODE
 	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
 	select COMMON_CLK
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

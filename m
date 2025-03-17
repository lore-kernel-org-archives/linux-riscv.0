Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C6AC282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mVu2ca5UeiYXti1lTZVYmSobqJOXrtJcRyqNOW8p/pA=; b=uFB8/7xBh7SSjy
	BNf5XhbLvZz0o0xxks1XeMULDCKeYoDqpJRwLEnw5dAwAgzwK6DSAAR/qLQHP8/jIkQTTohgMGYtn
	TmcYi5WIJIHjrxyQuZyiB9a42LxY+0C2VMIkpP+gyOphFmNNhfcUxxVCNv20PkwbOFhdQk68NdibH
	9I2CAGZrluBnn7w0638A8hkcyBjT9OTp/9pkKy/tQ1rBfboifSSrKM9GMwiStgxQaP9xt0u/AGdDx
	gyvmDaCk5VIrmN7jNjTtg2BA9PO70IA+CerPTlV/Hplgr1o+NqAkMdHZcyirP3d2Q4pGiVwKnHUZQ
	36e/u/DWBcvgHSqPWIFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5Ut-00000001gK4-1fhd;
	Mon, 17 Mar 2025 08:06:55 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5Up-00000001gJf-4AWU
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 08:06:54 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2568:e3d1:1e11:17f3])
	by baptiste.telenet-ops.be with cmsmtp
	id Rk6k2E00D1Mz0fJ01k6kYv; Mon, 17 Mar 2025 09:06:45 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tu5UI-0000000EHrW-1BDw;
	Mon, 17 Mar 2025 09:06:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tu5Ui-00000001oK6-1IBv;
	Mon, 17 Mar 2025 09:06:44 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to y unconditionally
Date: Mon, 17 Mar 2025 09:06:42 +0100
Message-ID: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_010652_170334_7DDE669F 
X-CRM114-Status: UNSURE (   8.33  )
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

Merely enabling compile-testing should not enable additional
functionality.

Fixes: 7ff4faba63571c51 ("pinctrl: spacemit: enable config option")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/spacemit/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/spacemit/Kconfig
index a2f98b3f8a75580d..d6f6017fd097d326 100644
--- a/drivers/pinctrl/spacemit/Kconfig
+++ b/drivers/pinctrl/spacemit/Kconfig
@@ -7,7 +7,7 @@ config PINCTRL_SPACEMIT_K1
 	bool "SpacemiT K1 SoC Pinctrl driver"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on OF
-	default y
+	default ARCH_SPACEMIT
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

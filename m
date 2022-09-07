Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3934FC38145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nx2h2UBEwSEdEUNFifS4d7e06bshqWF9m4s8e9yi23o=; b=ItXRCu5DNbK2A0
	AC37xCZA+q/0toQTebckHfdhSEfhvJYtucBeCsww4GV43BFXAnG6lKSZNZiFPKyEeFhmER6z9lPSk
	H/evVEoeUeOBLCbT3on7Vgkm/L9BfVXm8UckvpC2rUVP4KYeyzlRr6q85q4pHHKEGbZOOkaVWYQOH
	qER4NAcNU+ut6cTmrF7GnUpEX5qxNsLbPA7AW6NBsTu7zFR6cvNBhRuM+wICcEBCiFoeZtlk/WtlO
	Ht0uMbTa3xlevCsqah4/Tz0EBAvrAgY5bzqSl1p7ZoxwwXkwhAaIiTIFW8wxGQFK3A4UU4sahsr1O
	Nz2D2igmgkVOFeI36zog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVxJQ-007TrV-QO; Wed, 07 Sep 2022 15:50:00 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVxJH-007TmD-BY
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 15:49:52 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oVxJ6-0006xE-AF; Wed, 07 Sep 2022 17:49:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: samuel@sholland.org,
	guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: make t-head erratas depend on MMU
Date: Wed,  7 Sep 2022 17:49:32 +0200
Message-Id: <20220907154932.2858518-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_084951_426136_FF962C5B 
X-CRM114-Status: GOOD (  11.31  )
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

Both basic extensions of SVPBMT and ZICBOM depend on CONFIG_MMU.
Make the T-Head errata implementations of the similar functionality
also depend on it to prevent build errors.

Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
Fixes: d20ec7529236 ("riscv: implement cache-management errata for T-Head SoCs")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/Kconfig.erratas | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index 6850e9389930..f3623df23b5f 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -46,7 +46,7 @@ config ERRATA_THEAD
 
 config ERRATA_THEAD_PBMT
 	bool "Apply T-Head memory type errata"
-	depends on ERRATA_THEAD && 64BIT
+	depends on ERRATA_THEAD && 64BIT && MMU
 	select RISCV_ALTERNATIVE_EARLY
 	default y
 	help
@@ -57,7 +57,7 @@ config ERRATA_THEAD_PBMT
 
 config ERRATA_THEAD_CMO
 	bool "Apply T-Head cache management errata"
-	depends on ERRATA_THEAD
+	depends on ERRATA_THEAD && MMU
 	select RISCV_DMA_NONCOHERENT
 	default y
 	help
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

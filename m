Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91191C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4jBJ3HfgTrD3sosPVWT5d3pWwiVI9qnls971pEY7Zs=; b=lO4t0ZzPA1UxqX
	OLRM+mI4CJ/Hfgkcoocpy8OSgtbKStNW3jfjq2nExY2/mgUacbGQ9lQfLngDt+BRH+ukOOErTo9XE
	wrejgxIlCHKUdoC61LjnByudhMJZb/hrOMtmE7GO0/4iroQWSvvAr95DRgbodpEVPYgW5LRhXe8Rj
	I9ePtiFAyjBaBamq7DC2DsaCoJ6EzrE7L/fxhNz62Hndzi40qheloBEMl/gdIDgTNncjq+A/yeRpI
	wmfRvuNgWc6iyi8//KrpNunNzCP8igbG7i9wHmj2xQg/fMAe4S0nFeV84FRRimbDhXAUxCbWF9/BS
	Fswj1JcOfELxbpt5uLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrW-005QMK-LR; Fri, 23 Sep 2022 18:57:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrT-005QKW-L1
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1CA7AB831E5;
	Fri, 23 Sep 2022 18:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5E1C433D7;
	Fri, 23 Sep 2022 18:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959436;
	bh=CSy4seyGndCnxUkCWwQOal0GKjMs5bbtF1y4jomV8lA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=St+R4jsmfidA1q431W9FERcTQkcJ5lp/gf9/bIHpNqKdhW4c5EWugItLJyFRdT6Vu
	 UYOZcKhJ+DE/fH4ec8/j+S0a08avobrZtB2xNDF3mtfjjDgbaXRuyOTaB53rKIVt0K
	 53igL+6J+DDGkZaoQO4aPBmjbcA3MvQH38KVYX8ohzJCprLUnWeEBeMBpoQrwOP0Zd
	 dJcGNO2ku3iVqeCByBPfC9/NQzfxAby7QfqnX1uf5R2nHG/PLhkQVofzPNXEvYSYR5
	 HB/eKiwJHMPEIXhNuP3nybSfLqKaKxBHmOSDxMCY8IEPQlpY8z2QbyO3/s8r3cypsH
	 mbieWKeTG97+g==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 03/27] mailbox: mpfs: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
Date: Fri, 23 Sep 2022 19:55:42 +0100
Message-Id: <20220923185605.1900083-4-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115719_880015_0733AF04 
X-CRM114-Status: GOOD (  12.62  )
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

At LPC, we decided that for the sake of consistency the SOC_FOO symbols
in arch/riscv should be replaced with ARCH_FOO so that we could have a
consistent policy regardless of whether a vendor had ARM legacy or was
a RISC-V "incumbent".

The PolarFire SoC mailbox depends on the SOC version of the symbol, so
convert it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 05d6fae800e3..ba4700f69a5a 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -175,7 +175,7 @@ config MAILBOX_TEST
 config POLARFIRE_SOC_MAILBOX
 	tristate "PolarFire SoC (MPFS) Mailbox"
 	depends on HAS_IOMEM
-	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	help
 	  This driver adds support for the PolarFire SoC (MPFS) mailbox controller.
 
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

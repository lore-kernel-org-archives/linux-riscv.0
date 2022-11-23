Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD06C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 16:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f5jGwnikTz23gXEqV/Omp5LljLBQw2b3uY+F8BhNjxY=; b=wzsjhPESGVHDrx
	hPuOJlqcq2v+QhvqHMjiE8XgJYAjRnyMvsP7A/UeIWzt9wbVg8UahpHIB6RRI8r7GxUqa3vW0zB94
	OKQg/3yE8nfI+mid5WiAHQbRycU+4NBLhzvqLEEQNbnyEwCVBAgrmBEiBDXm4J226nKfXhzUjea1m
	EPn2HegvG9x3+N4rH/Mgh042kb1plnScApNEu+7V64r5Xse+HaPPzrH2VYsxKiUz5qgKEPhuFU66N
	8Pe4RJXPXT3B2NbIiUvprzIgnjjWbEFknavthYYYlu4ALErjxYWIItlE8J0QDHkG5kNinBPbf6q3o
	bz/Mhavf7koF+gLzA7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsUE-000oUZ-24; Wed, 23 Nov 2022 16:20:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsUA-000oSw-Oa
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 16:20:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 71FCFB82102;
	Wed, 23 Nov 2022 16:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6A3C433B5;
	Wed, 23 Nov 2022 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669220427;
	bh=mOSyGYRUF4lmG8EN95GXAb+yeeVqCi5QVicqdZ3b/6o=;
	h=From:To:Cc:Subject:Date:From;
	b=XkfGBr+eqCNc/F+e54oPBY1i5IgnC8B1DMZRW20YCs5JEo3y4iGgm+iIo0eoGJPxG
	 9YV07cdR+IwTVo9YlQOpTtcmVLj2+oeL9gvaJSFp63cADY+fIvHIW7RNen1mrbTz66
	 YzKYhxtyfERSzT/QNtPEHT6z/PQuignwaDA0pmJtC4qVehbA0WRSbWkCy3Aj8Pdeiv
	 Q5QAy7cNxP2INyDgaLF+gjny1KvHEtwYQCbdUiZGGceWTIHITH2ZUg7ZB9FuTWtTZD
	 dT4Qxa/ll19h15DrpNJJojXG51RS5vxyC1wNcDObJCyAVGp8zQHgc63/sPjBOU/64/
	 CQ1JZsGEvY+Cw==
From: Conor Dooley <conor@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: microchip: enable the MPFS clk driver by default if SOC_MICROCHIP_POLARFIRE
Date: Wed, 23 Nov 2022 16:19:22 +0000
Message-Id: <20221123161921.81195-1-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_082030_967167_559CE617 
X-CRM114-Status: GOOD (  11.89  )
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

With the intent of removing driver selects from Kconfig.socs in
arch/riscv, essential drivers that were being selected there could
instead by enabled by defaulting them to the value of the SoC's Kconfig
symbol.

Do so here & drop the depend on RISC-V - the SOC_ symbols are only
defined there anyway.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I thought I sent this with the SiFive stuff a few weeks ago - but
obviously not!

CC: Claudiu Beznea <claudiu.beznea@microchip.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/clk/microchip/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
index b46e864b3bd8..e33e51978938 100644
--- a/drivers/clk/microchip/Kconfig
+++ b/drivers/clk/microchip/Kconfig
@@ -5,7 +5,8 @@ config COMMON_CLK_PIC32
 
 config MCHP_CLK_MPFS
 	bool "Clk driver for PolarFire SoC"
-	depends on (RISCV && SOC_MICROCHIP_POLARFIRE) || COMPILE_TEST
+	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	default SOC_MICROCHIP_POLARFIRE
 	select AUXILIARY_BUS
 	help
 	  Supports Clock Configuration for PolarFire SoC
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

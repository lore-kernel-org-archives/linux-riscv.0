Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F70BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uiNHWe7wNjgYoV7HrAATO7DR1hqYLL4zXf7qxH3NYlg=; b=mXQsCazWFt/a6T
	MT5+UiZyFlTDh53MaQ/8nk2AVTQ8OwGyXX+BmVknjKgs6gd3Wycbe9q7P9wyMRr9VwbPZpEn4hzoW
	ied2/b6iWPljapV0IbtbsCcfXhk3oQL6RansilugtuFuXUetoRcifBCwvLDVO0QpHJHWqOQR25DXg
	yiNPZ1TBc/24LZknTWnv8aTvkjbcPAujRR9ZBVG0MDbbLrV2tuqfKA3hDpVlO9eTXY0AczDEHxHNh
	viuw4whWA/etiqMl58OFkUc+8zpwMfbEnJcjkwiMELEJoeDOem+N1kpVgAKHJJaXcd5dyuK6zQW5+
	45MG03cAzBwUUDXp7tMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncoS3-00HJKj-LW; Fri, 08 Apr 2022 13:14:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncoS0-00HJId-Av
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 13:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649423695; x=1680959695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FePuzuKtXWC9ClkTIEjnana6zB8ROeqVYJMIfvz4VFY=;
 b=lPiuDTHgK0Yy+xu7KT4oHXTgZ9giRjLGkGlUPWYDO1QxqSQ3gRXR5Pal
 wQ6YLL+kdB7NBazetjaLhSST/dobrPIJqrjWD3xg6ISm/rKwfdAepUm5y
 wB97ydegqGd/hdbT+WDbDkb66h4xLOeNe3PRqommrTccEYMHFnN4CU9g/
 iKvo/I5ULbKDdWgmvusdhYyWmgC19gzU2R1caTAG6odNWwn5vu9AGO/h7
 k4UT2KzuV6eWIJDK4yDkZh52K7RfeC1+nVUJzcixo1eKV7bKUFklw6mVt
 +zLiPKwRlI3oTaDzKBy48uk2XCYykDmP+qRE55rhyOencxmfftoUzemye A==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; d="scan'208";a="154917200"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2022 06:14:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 06:14:46 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 8 Apr 2022 06:14:44 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <linux-clk@vger.kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
 <palmer@rivosinc.com>, <andrew@lunn.ch>, <linux@armlinux.org.uk>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [PATCH v1] clk: microchip: mpfs: don't reset disabled peripherals
Date: Fri, 8 Apr 2022 13:13:53 +0000
Message-ID: <20220408131352.3421559-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_061456_521663_A1FA86E6 
X-CRM114-Status: GOOD (  10.17  )
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

The current clock driver for PolarFire SoC puts the hardware behind
"periph" clocks into reset if their clock is disabled. CONFIG_PM was
recently added to the riscv defconfig and exposed issues caused by this
behaviour, where the Cadence GEM was being put into reset between its
bringup & the PHY bringup:

https://lore.kernel.org/linux-riscv/9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com/

Fix this by removing the reset enable/disable code from the driver &
rely (for now) on the bootloader bringing peripherals out of reset
during boot.

Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index aa1561b773d6..4ddc7e7c9766 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -13,7 +13,6 @@
 /* address offset of control registers */
 #define REG_CLOCK_CONFIG_CR	0x08u
 #define REG_SUBBLK_CLOCK_CR	0x84u
-#define REG_SUBBLK_RESET_CR	0x88u
 
 struct mpfs_clock_data {
 	void __iomem *base;
@@ -177,10 +176,6 @@ static int mpfs_periph_clk_enable(struct clk_hw *hw)
 
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
-	val = reg & ~(1u << periph->shift);
-	writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
-
 	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
 	val = reg | (1u << periph->shift);
 	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
@@ -200,10 +195,6 @@ static void mpfs_periph_clk_disable(struct clk_hw *hw)
 
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
-	val = reg | (1u << periph->shift);
-	writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
-
 	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
 	val = reg & ~(1u << periph->shift);
 	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
@@ -218,12 +209,9 @@ static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
 	void __iomem *base_addr = periph_hw->sys_base;
 	u32 reg;
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
-	if ((reg & (1u << periph->shift)) == 0u) {
-		reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
-		if (reg & (1u << periph->shift))
-			return 1;
-	}
+	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
+	if (reg & (1u << periph->shift))
+		return 1;
 
 	return 0;
 }
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

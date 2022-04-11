Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C81C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 07:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XV1Bv3RSK14UWLOmuV40BUk7oTBTg5MJqjcFb2G+pHE=; b=fJ6J5uwc5y+TI7
	BvrJP2Bu9iAyLFURS4C/F9zhfnKhilsL8GnR53pPaSqwGcz6d+NS+Oz3QdjYMKRDZve+1jmQw2PsB
	iWmpg85XorpMwmYmkHqSvCz8PM14WOe8QWzgyZyFgjv7EV9cfJpmiNSGfE/baxhe8rdjXeOCyg5Sl
	c1MWO7WKrGMwchq5+LCAM+ll8FfcAK7RCE0bCb8gm7EjR9tXWB4ubroqQ+mpM+Ju6An7SyexgmuCH
	modDsfYa0FXxSwo4ZR6woWQBlJlyI4byscMs2bApvv0RwbxxOq510AkZ/6BtOm1zsKQqFfpOf3PYS
	rzvmNNwtbmyiSXVTds+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndoRr-007DLV-Ar; Mon, 11 Apr 2022 07:26:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndoPQ-007BhN-TT
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 07:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649661865; x=1681197865;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SNoeLigDyTw1Cancdccozb6dxDfUAxB0MNSrsNTLnEg=;
 b=JtNTGJoHyuqzYg9IkgZiIw0QMjauZ483lqFwaUUR10qnBLMezn+fytBe
 jItw/JGByoCyNrnbhdNAk2ocFzGfD6x6IKG2MJ9fhIha2ecdGCkDaG1fp
 un1+NofMmLXoHHI01rRZ02Z4TXg66zeEUDFlWT2G8cMv1cKZRQBCN7Kvz
 FmDvYuVo03iulyLDO15/YHQcnLIh+r5ZgRVeGEBQB5SSbwePU0l/Y7OL+
 38UgQ84X7rJv37asMCek2nQWesZayJJepXofJtGrkj2SEoGBu8L5cryLZ
 KZ+OJW1M7/Pmwv5cVjLn5WGcaSaphJjuTtMzWGKFyHKGGZnbcqMe07w7/ Q==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643698800"; d="scan'208";a="159613695"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Apr 2022 00:24:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 11 Apr 2022 00:24:16 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 11 Apr 2022 00:24:14 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <linux-clk@vger.kernel.org>
CC: <daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
 <palmer@rivosinc.com>, <andrew@lunn.ch>, <linux@armlinux.org.uk>, "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [PATCH v2] clk: microchip: mpfs: don't reset disabled peripherals
Date: Mon, 11 Apr 2022 08:23:41 +0100
Message-ID: <20220411072340.740981-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_002425_137607_6C97C3AD 
X-CRM114-Status: UNSURE (   8.06  )
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

The current clock driver for PolarFire SoC puts the hardware behind
"periph" clocks into reset if their clock is disabled. CONFIG_PM was
recently added to the riscv defconfig and exposed issues caused by this
behaviour, where the Cadence GEM was being put into reset between its
bringup & the PHY bringup:

https://lore.kernel.org/linux-riscv/9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com/

Fix this (for now) by removing the reset from mpfs_periph_clk_disable.

Fixes: 635e5e73370e ("clk: microchip: Add driver for Microchip PolarFire SoC")
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Changes since v1:
  The first stage bootloader takes most, but not all, of the peripherals
  out of reset. In v1 all code touching the reset reg was removed, but in
  v2 the code taking peripherals out of reset is kept to cover the edge
  case peripherals.
  The permanent fix will be to move the reset stuff its own driver.

 drivers/clk/microchip/clk-mpfs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index aa1561b773d6..744ef2ba2a0c 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -200,10 +200,6 @@ static void mpfs_periph_clk_disable(struct clk_hw *hw)
 
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
-	val = reg | (1u << periph->shift);
-	writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
-
 	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
 	val = reg & ~(1u << periph->shift);
 	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

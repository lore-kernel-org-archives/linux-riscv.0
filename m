Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CA6109C036
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+g95fG4WhKEmZump3GAMh8OaIgdSTz+ptw8KeMp5wOM=; b=OqDyS/g3GhHJX6
	YLesQqqthtWQUhgG37tU8uNXcCoCRTcVSH/aQ2ooIZQtPkmWO6sF9hX8VGBJ2FA9opWpRkDeqRuff
	fnWXpJkIs46IbogVJp0RaYkMmRa3kHR/dUJXb5tIeJP3vvb3pMsaskQnR7U9m/SekhWApEePOZOpa
	0xUjFrYt0vVbJCXnlH0riS3r9hdJDUJxY8dRtkLd9cUBBH0E23JpnZFitc8DL3QHWsVmJBOcEAiDe
	nsJndh4GobQ/ApSh5YNtAIwgs+NX+SD5fYPxSzS+ADkFuevjrCVswwDtCEOoiCUUzEBZG3bBtPNMH
	6W5O+7uoU7KWStSW/14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6r-00000003tER-2Olb;
	Wed, 25 Mar 2026 16:29:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6p-00000003tDH-3Gcq
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:29:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7421C407A1;
	Wed, 25 Mar 2026 16:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF43C19423;
	Wed, 25 Mar 2026 16:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456171;
	bh=MCaDxoDiVDGdtO65h0jv11dtwY7d5m9e6N7qyqE+O5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sw3YZeNRAlld5uS8I1piZg3WRSBgcQg+Hj5TzOdmBqklhlTgd0Z8WxcaRcctPNR4T
	 YtgWw9WeQVKjptA/Pw5dt7LW68xH9Npol2pIXqbazM8498WyHZSpzu1Rb4ebSmUV5b
	 yoXfOzJ1hAkNpeF00MtW9osNv6yWMigBvez09IrVlRk+MgkqcrsCSFAx+K5qL9ZsKm
	 XgZNgbWq28IifnjluiW2wqX+UfORUtaSonvokMGWso6NUcEOSlumL2UrUxSwcOJ5dg
	 tfccuLqhCBe6mcQxqpb+kWtSPLMeP832t9LkDdCefPg/yu6HDwsWKfwKst6YFsXeMr
	 KHkNbH47VoSkw==
From: Conor Dooley <conor@kernel.org>
To: netdev@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Ryan.Wanner@microchip.com,
	Kevin Hao <haokexin@gmail.com>
Subject: [PATCH net-next v5 07/14] net: macb: add mpfs specific usrio configuration
Date: Wed, 25 Mar 2026 16:28:11 +0000
Message-ID: <20260325-excavate-jester-798e7cfe02b5@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-unsterile-flail-4c7729750dc4@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2732; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Szw1FnKs8om3BmObDQ4lrRqwtQtqKNPlW7gKJuQIDEo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlHeM1ar3yeudJx0t3wogYZTYN76RGRDNL5yTyv1jdNk l8l/smlo5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNJ2cPIsJjrt6rrA/Yb1QKJ 3xISmVcvfq2/Mj1+a8KC2B+njV1X2DH8Dy7OP/XBZ9PLWkV7jw+nXk66aNZ4bv/fx3opt74fE3c 24QUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_092931_858283_B32279CE 
X-CRM114-Status: GOOD (  16.98  )
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

On mpfs the driver needs to make sure the tsu clock source is not the
fabric, as this requires that the hardware is in Timer Adjust mode,
which is not compatible with the linux driver trying to control the
hardware. It is unlikely that this will be set, as the peripheral is
reset during probe, but if the resets are not provided in devicetree
it's probable that this bit is set incorrectly, as U-Boot's macb driver
has the same issue with using usrio settings for at91 platforms as the
default.

Fixes: 8aad66aa59be5 ("net: macb: add polarfire soc reset support")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb.h      |  2 ++
 drivers/net/ethernet/cadence/macb_main.c | 12 ++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 1bdbe66b05590..8e5305f9a7545 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -788,6 +788,7 @@
 #define MACB_CAPS_EEE				BIT(25)
 #define MACB_CAPS_USRIO_HAS_MII			BIT(26)
 #define MACB_CAPS_USRIO_HAS_REFCLK_SOURCE	BIT(27)
+#define MACB_CAPS_USRIO_HAS_TSUCLK_SOURCE	BIT(28)
 
 /* LSO settings */
 #define MACB_LSO_UFO_ENABLE			0x01
@@ -1229,6 +1230,7 @@ struct macb_usrio_config {
 	u32 refclk;
 	u32 clken;
 	u32 hdfctlen;
+	u32 tsu_source;
 	bool refclk_default_external;
 };
 
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index a1f8a6d9554fb..4e5967e6ffbe5 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4921,6 +4921,9 @@ static int macb_init_dflt(struct platform_device *pdev)
 				val |= bp->usrio->refclk;
 		}
 
+		if (bp->caps & MACB_CAPS_USRIO_HAS_TSUCLK_SOURCE)
+			val |= bp->usrio->tsu_source;
+
 		macb_or_gem_writel(bp, USRIO, val);
 	}
 
@@ -5524,6 +5527,10 @@ static const struct macb_usrio_config at91_default_usrio = {
 	.clken = MACB_BIT(CLKEN),
 };
 
+static const struct macb_usrio_config mpfs_usrio = {
+	.tsu_source = 0,
+};
+
 static const struct macb_usrio_config sama7g5_gem_usrio = {
 	.mii = 0,
 	.rmii = 1,
@@ -5637,10 +5644,11 @@ static const struct macb_config zynq_config = {
 static const struct macb_config mpfs_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
 		MACB_CAPS_JUMBO |
-		MACB_CAPS_GEM_HAS_PTP,
+		MACB_CAPS_GEM_HAS_PTP |
+		MACB_CAPS_USRIO_HAS_TSUCLK_SOURCE,
 	.dma_burst_length = 16,
 	.init = init_reset_optional,
-	.usrio = &at91_default_usrio,
+	.usrio = &mpfs_usrio,
 	.max_tx_length = 4040, /* Cadence Erratum 1686 */
 	.jumbo_max_len = 4040,
 };
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

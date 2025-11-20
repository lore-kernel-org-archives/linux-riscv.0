Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BADCF9C46
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 16:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ea9pfbN5zMOQk09NKFI6cWkL45Yu6BmPVeu8Q9OfuiE=; b=JrwAKMI7l9cDK7
	6vGpi5sCdp6T5LLizvsCqeBNUWe0VBFAR44OCx6z2fScJAFsZZCWQyNkO6U1f2OurQsxROGVXlhCT
	6ln7xCpzAdmg4HOxa68zEMAFAQErgPsdry6NXdTXrDGWIwCS0tCoM7O9zn/5eXB/CvYpQHn0EIgI+
	JwhrbEJ/fd6IppsCUurtDfww6Y5dzJGK6VS0TKAMa41KiGYnptQGyN6ey87Y35zEBx44oP6q56IFq
	G8edRjsyYps8yIvEiomjRQ6lQvITCJC6JU08ZGZfnS5/xJXJqP6pr2Pf4b7UAwDVjXMhflfMPDFnl
	vRL0HJ7hxnDIT+R3Wx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7Ux-000000070ht-0U1Z;
	Thu, 20 Nov 2025 16:27:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7Uu-000000070fk-1kon
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 16:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19A2043F01;
	Thu, 20 Nov 2025 16:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE44CC4CEF1;
	Thu, 20 Nov 2025 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763656024;
	bh=OweOwTJ7iRHriV/3fFMI8DxPPwMu/XvNOTvcHJ/FBOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fdETgA+g3R0EW6aeW24bHZPgm6m62uRkdrkMSCVi0kiUZewS7iAJ97yY89ZtTQuSk
	 DO0hsLOu/n557vc1K7hsKouuh9xfSsZCAiBQt043xMJR5x2ESkQPcilKWCXMSI1wS9
	 FU3v07driVnBcdVUJ+Zw8acieRE7aNLP81fjfaILvO1S3ru4mGR8oIhNrupORw5boJ
	 bjAd3+dpbKdMkoZpfuCKYCWGMHrzNlsm8S+A/AuLY2kQLzfPGDJl7a4/F3A6FmvEul
	 kByIz41Rw460euta3a8d9P/W3isykL/Gu9mJGhpi0TE04S4A4fYEuMRL3oX8onHZ99
	 ZALHhLjG8v1ew==
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
	Neil Armstrong <narmstrong@baylibre.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Abin Joseph <abin.joseph@amd.com>
Subject: [RFC net-next v1 7/7] net: macb: add mpfs specific usrio configuration
Date: Thu, 20 Nov 2025 16:26:09 +0000
Message-ID: <20251120-unspoken-licking-5c9263746766@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120-jubilant-purposely-67ec45ce4e2f@spud>
References: <20251120-jubilant-purposely-67ec45ce4e2f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2990; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=G93/q3yEc1yTjdzyW1V6PNGqUts7lOELWRE7rxMzpvM=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnyjtK7S6/pLjiezpBr8WV9wQf+7r47SanNTzT8PGVWa 0tqL+brKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwEQ+T2b4K5iq3y1x2dJuTlFo c8iavutfrm/+N1/V6I3ahnnP8md+TWL476iluaLKWCL5l4i+fVUT60MHFsPnszPvnfdyTRRc8P8 eNwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_082704_502892_A1688175 
X-CRM114-Status: GOOD (  18.89  )
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
hardware AFAICT.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
This may actually be a waste of time, since a) the peripheral is reset
by the driver during probe which zeroes it, b) the timer-adjust mode is not
permitted, so setting a 1 here is not ever done and c) the value written
by the driver to the usrio register starts as zero, so would clear this
bit anyway, were it to be set somehow.
The alternative would be just setting the usrio struct pointer to NULL
since none of the caps that would cause it to be accessed are set on
this platform.
---
 drivers/net/ethernet/cadence/macb.h      |  2 ++
 drivers/net/ethernet/cadence/macb_main.c | 12 ++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 59881c48485b..d30682db410a 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -770,6 +770,7 @@
 #define MACB_CAPS_QUEUE_DISABLE			0x00000800
 #define MACB_CAPS_QBV				0x00001000
 #define MACB_CAPS_USRIO_HAS_MII			0x00002000
+#define MACB_CAPS_USRIO_TSUCLK_SOURCE		0x00004000
 #define MACB_CAPS_PCS				0x01000000
 #define MACB_CAPS_HIGH_SPEED			0x02000000
 #define MACB_CAPS_CLK_HW_CHG			0x04000000
@@ -1217,6 +1218,7 @@ struct macb_usrio_config {
 	u32 rgmii;
 	u32 refclk;
 	u32 hdfctlen;
+	u32 tsu_source;
 };
 
 struct macb_config {
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 4ad1409dab63..dd14bb4c9e26 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4649,6 +4649,9 @@ static int macb_init(struct platform_device *pdev)
 		if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
 			val |= bp->usrio->refclk;
 
+		if (bp->caps & MACB_CAPS_USRIO_TSUCLK_SOURCE)
+			val |= bp->usrio->tsu_source;
+
 		macb_or_gem_writel(bp, USRIO, val);
 	}
 
@@ -5219,6 +5222,10 @@ static const struct macb_usrio_config at91_default_usrio = {
 	.refclk = MACB_BIT(CLKEN),
 };
 
+static const struct macb_usrio_config mpfs_usrio = {
+	.tsu_source = 0,
+};
+
 static const struct macb_usrio_config sama7g5_usrio = {
 	.mii = 0,
 	.rmii = 1,
@@ -5342,11 +5349,12 @@ static const struct macb_config zynq_config = {
 static const struct macb_config mpfs_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
 		MACB_CAPS_JUMBO |
-		MACB_CAPS_GEM_HAS_PTP,
+		MACB_CAPS_GEM_HAS_PTP |
+		MACB_CAPS_USRIO_TSUCLK_SOURCE,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = init_reset_optional,
-	.usrio = &at91_default_usrio,
+	.usrio = &mpfs_usrio,
 	.max_tx_length = 4040, /* Cadence Erratum 1686 */
 	.jumbo_max_len = 4040,
 };
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

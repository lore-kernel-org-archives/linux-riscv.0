Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4A3FD4F08
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 17:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MzSSWYTQqE9/wbFuPE3XVV6jP7qUUxX7tCWhLduabQ=; b=cXfeI0WI1/TeA0
	xCjaG+iGEbKSPbi4TJfzF4NHyzFHC+CKvQr3cnuE2xpo0GvzqRKXfEN3Tu414/KTBLNN3iL0qNAmt
	ooFifKchQfF6ieX8Qwp26Ya5UbbwyMYoum+Q/QMDaoP2/kzWnREFa1EQD4yR3I9yH4rnu1IL9L6e3
	ULZoXpukyLo7LZ0mZmZqi67dYcQPTDWm+/6r0wgxNupe6WKkOvoWwmS/+j8yOW+ITTyqARLVptybx
	do9K/Vub7g0nkDi0a2iw1Rzk1b+PIO6KqkaLGSEfnQs2auAz06DfOaELBXGZ7kr4pgxwhsd7tx7c4
	yol9j9VupI2CqisbI6NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00jp-00000009xv2-1QXW;
	Tue, 10 Mar 2026 17:19:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00jo-00000009xuR-154w
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 17:19:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90BE5600C4;
	Tue, 10 Mar 2026 17:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E71C2BCAF;
	Tue, 10 Mar 2026 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773163159;
	bh=ljysWJaHe8TEOROZCjjrq6HOXubs9dLzcABTz31qQqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sFJsCBlfOp/+RVCBRcXXRDAX0DDEVTZ54xZU3HKWcvbEWBHtH8oQod1FI6ylRq+5L
	 tbLNkweb2IOj0ypPoDiJP79RgVEvGqdMq6a6udNg3SHcE632oaAtQr5pkkIZwmYnZh
	 kcr0aXdW75xqNnJtj6TTz0spk7EBHBDiHJ55nW3n7zQ1EgipthDYJZyncVQSben4xb
	 k9GAftYqmcWWC9DLNt9IeuCugHkGWTSQ1r/6ZsGtzc+O2QVsahG5W7chZQ/sp2Y/4R
	 BhQEe9Eyq4r8A8FcxAHY+nruyrhEeZhpL4boNhVnwY3xOoMgrfwMmTscEbQuDBUkZo
	 YmpiMFlaVtujw==
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
	Ryan.Wanner@microchip.com
Subject: [PATCH net-next v3 06/10] net: macb: add mpfs specific usrio configuration
Date: Tue, 10 Mar 2026 17:17:13 +0000
Message-ID: <20260310-diaphragm-bagginess-7879e62495e5@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260310-moneyless-dispense-7bce14b16388@spud>
References: <20260310-moneyless-dispense-7bce14b16388@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2759; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=RSFyKfnVzDv/pOh5f8+B27Gurr5waqnAxeJRhx9T438=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkbgvR+unE+4/fsbd68etee3lcnOVe8vnFV4yyPyRo5E cu+8NofHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIigkM/wOzHse2i+d5Zto9 jFFZEVbsOkW1jPWGw6TTjyapKkzaasDI0JRS/CoxNLfjxZ6uTTbP16Rvdd/M6GwqWeVb/9nsacR LJgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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
index 9cd565cb87e4c..cdb9fb2218c6f 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -781,6 +781,7 @@
 #define MACB_CAPS_NO_LSO			BIT(24)
 #define MACB_CAPS_USRIO_HAS_MII			BIT(25)
 #define MACB_CAPS_USRIO_HAS_REFCLK_SOURCE	BIT(26)
+#define MACB_CAPS_USRIO_HAS_TSUCLK_SOURCE	BIT(27)
 
 /* LSO settings */
 #define MACB_LSO_UFO_ENABLE			0x01
@@ -1214,6 +1215,7 @@ struct macb_usrio_config {
 	u32 refclk;
 	u32 clken;
 	u32 hdfctlen;
+	u32 tsu_source;
 	bool refclk_default_external;
 };
 
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 414a8fa3f99d9..b476bc9663ecd 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4650,6 +4650,9 @@ static int macb_init(struct platform_device *pdev)
 				val |= bp->usrio->refclk;
 		}
 
+		if (bp->caps & MACB_CAPS_USRIO_HAS_TSUCLK_SOURCE)
+			val |= bp->usrio->tsu_source;
+
 		macb_or_gem_writel(bp, USRIO, val);
 	}
 
@@ -5244,6 +5247,10 @@ static const struct macb_usrio_config at91_default_usrio = {
 	.clken = MACB_BIT(CLKEN),
 };
 
+static const struct macb_usrio_config mpfs_usrio = {
+	.tsu_source = 0,
+};
+
 static const struct macb_usrio_config sama7g5_gem_usrio = {
 	.mii = 0,
 	.rmii = 1,
@@ -5376,11 +5383,12 @@ static const struct macb_config zynq_config = {
 static const struct macb_config mpfs_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
 		MACB_CAPS_JUMBO |
-		MACB_CAPS_GEM_HAS_PTP,
+		MACB_CAPS_GEM_HAS_PTP |
+		MACB_CAPS_USRIO_HAS_TSUCLK_SOURCE,
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

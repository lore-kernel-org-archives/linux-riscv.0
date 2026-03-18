Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F8410775E4
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 16:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pbyjB/0P7CyDt8s6v6814bucU5zPYvXh26nSjEQg9no=; b=i/qxJSawjRZXNt
	ew3+K0vJvm0Wp0g1XmkGQbVFqKTtgxsdRCW7QhSCkxCH7UYfAhOVFkyt4SQQwQ3IoR2Op1V8B2mVu
	AZ0z18dmd+keJinPRRsv7TykMFIgfRlP2D0rgRObYhQEOJtT4RA2oCSQg0rPp/Sm/pnxdjwzQjig6
	l9L5y1yQyMdPvDzSPo8dKEwRXo83CkfEahRw9vx9ItjYSJVprHe0dnmDhaEU1Ghn+bBRdB0/K8npF
	kUa1w5l+6aHBL8CGmb+BkmB5mIzD7wnNzx04C+WRAWHPFgLBsTzw9oDClkto24iF0esed4HxrFTtL
	2knShIYUeRwO3B01LLMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tuP-00000008xql-0KzV;
	Wed, 18 Mar 2026 16:38:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tuM-00000008xpK-1RVm
	for linux-riscv@bombadil.infradead.org;
	Wed, 18 Mar 2026 16:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cmKwRDMSDdAaRjWVifr6CcNcFltWJNHrCHWwfbjyUIk=; b=B1boQwX1zbzLJuvbPUSfMILGX9
	4Dl03BGMEe7UFGNx6aObMYA1vzSRHquxrKDhdhT8nESeJsl8ydJK54zuMoL3JC1lo/42eHqCyggb2
	/JzFOTkt/dOgnDqY1gG3EP3PY4EpSChFx9s2p1LXl8T7ETC0ARQxqObYVdc4SrlIYPIdJ3FCVaZzI
	tFP/to+JR/Hd3Xwh2I6YbTAfPjK+fjhODrbSAPIpo0P/fktOtPGSh8HUGpA45Rm3SCFIOWkoLFVkA
	Low+d0xywMiZRyQLImmxbi/CKoxkdbzEGAKqMgOmaDtqROLlqAGUxYb2AZ3aV1o55gTzOzVu1J+TQ
	fHc3fRbQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tuI-0000000Bk0L-3Il2
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 16:38:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23D4840428;
	Wed, 18 Mar 2026 16:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F06C19421;
	Wed, 18 Mar 2026 16:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773851882;
	bh=5Jkuep/vLlDigVeWmTs/DhOngIlPtkb5pESGRVTgEIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R11D7cUGj838U+xpeXLlsCxJr/XekmKgJJk7HqS7714JcjbIuT2usuSxRrk1l43BI
	 Su39Mbs0abv0vo87tP+pPSCKBO/h1SmhQfaRKiqf6DHT9vv+QVtS1a3ll36TMh7L3D
	 zrUJg7H1VyI21u5VvZBL4Diuwf5B6jrehPFq/zfkRd85mJwddWeUowGXwDCjvafU+7
	 JGJgjHqitfv0OqBuhp4C3DpRaRvaLlUteUC0KuYctOfOYOZxJoRc/gg5Clc/tCuOFK
	 JiNfpJ3v1IJdY/nT/Ur8jratU0RDcFq8XpN0pYT2FReNy9Bk9Ao6nIL/N1Dzxc5RbM
	 R00vY3LUFE11A==
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
Subject: [PATCH net-next v4 02/13] net: macb: split USRIO_HAS_CLKEN capability in two
Date: Wed, 18 Mar 2026 16:37:33 +0000
Message-ID: <20260318-produce-canopener-0b61c538fabf@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318-surpass-puzzle-f94b46aa8808@spud>
References: <20260318-surpass-puzzle-f94b46aa8808@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3502; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=TDcEt4gO7nw+FrU/aV4qA0N2hA+cJ3rWCHECrYVPXVw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm7rlwIcI4IO3397/mXHPze10UbH99d8XL9m10NeR8lE u6k7np0rKOUhUGMi0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQATWevCyLChjFklz2BpwMkL 8coc2Z55HPpiUilXS6Kfrvea9+d2UhUjw+PQ34euWJZ399xSa2IrN77x7/DGg6ICrkefNT+Tjw8 +wA0A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_163807_190227_40D38EA9 
X-CRM114-Status: GOOD (  17.34  )
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

While trying to rework the internal/external refclk selection on
sama7g5, Ryan and I noticed that the sama7g5 was "overloading" the
meaning of MACB_CAPS_USRIO_HAS_CLKEN, using it differently to how it was
originally intended.
Originally, on the macb hardware on sam9620 et al,
MACB_CAPS_USRIO_HAS_CLKEN represented the hardware having a bit that
needed to be set to turn on the input clock to the transceivers. The
sama7g5 doesn't have this bit, so for some reason the decision was made
to reuse this capability flag to control selection of internal/external
references.

Split the caps in two, so that capabilities do what they say on the tin,
and allow reworking the refclk selection handling without impacting the
older devices that use MACB_CAPS_USRIO_CLKEN for its original purpose.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb.h      |  2 ++
 drivers/net/ethernet/cadence/macb_main.c | 11 ++++++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 8cb0b3778ee9e..baf48f02d7e27 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -780,6 +780,7 @@
 #define MACB_CAPS_RSC				BIT(23)
 #define MACB_CAPS_NO_LSO			BIT(24)
 #define MACB_CAPS_USRIO_HAS_MII			BIT(25)
+#define MACB_CAPS_USRIO_HAS_REFCLK_SOURCE	BIT(26)
 
 /* LSO settings */
 #define MACB_LSO_UFO_ENABLE			0x01
@@ -1211,6 +1212,7 @@ struct macb_usrio_config {
 	u32 rmii;
 	u32 rgmii;
 	u32 refclk;
+	u32 clken;
 	u32 hdfctlen;
 };
 
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 778d2115f66fc..d908850c59498 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4357,7 +4357,7 @@ static void macb_configure_caps(struct macb *bp,
 	}
 
 	if (refclk_ext)
-		bp->caps |= MACB_CAPS_USRIO_HAS_CLKEN;
+		bp->caps |= MACB_CAPS_USRIO_HAS_REFCLK_SOURCE;
 
 	dev_dbg(&bp->pdev->dev, "Cadence caps 0x%08x\n", bp->caps);
 }
@@ -4624,6 +4624,9 @@ static int macb_init(struct platform_device *pdev)
 		}
 
 		if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
+			val |= bp->usrio->clken;
+
+		if (bp->caps & MACB_CAPS_USRIO_HAS_REFCLK_SOURCE)
 			val |= bp->usrio->refclk;
 
 		macb_or_gem_writel(bp, USRIO, val);
@@ -5217,7 +5220,7 @@ static const struct macb_usrio_config at91_default_usrio = {
 	.mii = MACB_BIT(MII),
 	.rmii = MACB_BIT(RMII),
 	.rgmii = GEM_BIT(RGMII),
-	.refclk = MACB_BIT(CLKEN),
+	.clken = MACB_BIT(CLKEN),
 };
 
 static const struct macb_usrio_config sama7g5_usrio = {
@@ -5355,6 +5358,7 @@ static const struct macb_config mpfs_config = {
 static const struct macb_config sama7g5_gem_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
 		MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
+		MACB_CAPS_USRIO_HAS_REFCLK_SOURCE |
 		MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP |
 		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
@@ -5365,7 +5369,8 @@ static const struct macb_config sama7g5_gem_config = {
 
 static const struct macb_config sama7g5_emac_config = {
 	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
-		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_MIIONRGMII |
+		MACB_CAPS_MIIONRGMII |
+		MACB_CAPS_USRIO_HAS_REFCLK_SOURCE |
 		MACB_CAPS_GEM_HAS_PTP |
 		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74FA109C036
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEKgWPlJjOwTJXFpO+rA6xtqUtVSIBXl8xYPNEZQdPc=; b=NgxJ/MGWFPpusf
	KOfEs/sMBseEgIrijNtQUon2RXpQuS4lWs9d40VNn03aQVo7bL2G1oL6KcQzHiyBSprcd4m/pxkur
	uqimuRTIRnj4QHYbmvPLodv62KekDGZbpQo6X/27XO/jFNDmK7TazB7zlRUuNCgxO/8tKUa9I1dLZ
	k4VDNzNFME1r0TMFwdbFocUmxj5+O5kGCcSPrad/4I6PgyB2fUv091JS6vktxX3DyDiM6cAfP80VV
	H0VGZmABTlXoHTjFBwRrAuv4mZf29qdzrJ/EJiM+hnybqzogr8YTl8rlU+SaOlYLGG1fu8w/bWj9R
	pBG1QT2oZZrEY7LTO4uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6I-00000003sxH-2fWX;
	Wed, 25 Mar 2026 16:28:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R6H-00000003swh-2ITm
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:28:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7164A600AC;
	Wed, 25 Mar 2026 16:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B359EC19423;
	Wed, 25 Mar 2026 16:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456136;
	bh=/GOCQoMgSCnMdAsfootrNAXNB36Qw+5kApOdsouWTrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mhjsYCkmXPLXlS5hIkSmVNAP9VL07zgHD3Zvx6um6gLb2T2EbGKWBzhhpiCdDkwVH
	 CNs2Ur2EP9voDypZrBSYCRQ6CFQQAdpJvPSVxamUi/yL5mcEI0BFoHdmdRXwdSB+cs
	 KuZu840UFgZhQqrjUl/EKSqeUYRVNYCiyg7LdYmIDmeEqhA/WJ5xlx8l/v62l73tad
	 Hka8/Ac9LcvCV7kEKxQ8H02tV1euEgPYX451LKp9Uu2syurqtOLP0OVoOuiLvk3DjA
	 56mhXsAm+NYKqfnYtDZnOCJDa72GqgVIOaQOYQHcbAnqIcrQHxJRcuH1+CbQHITQ7p
	 RG+WSwXdWHw8A==
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
Subject: [PATCH net-next v5 01/14] Revert "net: macb: Clean up the .usrio settings in macb_config instances"
Date: Wed, 25 Mar 2026 16:28:05 +0000
Message-ID: <20260325-rundown-unrushed-dd82c9f5c56c@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-unsterile-flail-4c7729750dc4@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5036; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=wNAu33LueieiL9BYBWizySOKUamk9hJkFHlIq4AwGik=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlHeE0M1P3X3Lq4yPVBftIztQarf4oTjyQv+SL0ovecz eJJfG+dO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARPmVGhuvZOTemRWg/+3KW y/zZ35tNDjWPLmVvfDbhlaBPiezMpwmMDB2zt82KDGoImPDn8fx3/Kn9ixYdb9Z+EzRNpX1HgYP GRC4A
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

Commit 0ae998c4efd69 ("net: macb: Clean up the .usrio settings in
macb_config instances") was a misguided attempt to clean up the driver
that actually just propagated problematic code. The default for usrio is
actually no usrio, and already there are issues with people using the
problematically named "macb_default_usrio" on platforms where the usrio
does not have this so-called default behaviour. usrio is platform
specific and using the default at91 usrio settings should be opt-in
only. Revert the "cleanup" patch.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 1cb49252abf5a..a48160da6e672 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5513,31 +5513,37 @@ static const struct macb_config fu540_c000_config = {
 	.clk_init = fu540_c000_clk_init,
 	.init = fu540_c000_init,
 	.jumbo_max_len = 10240,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config at91sam9260_config = {
 	.caps = MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config sama5d3macb_config = {
 	.caps = MACB_CAPS_SG_DISABLED |
 		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config pc302gem_config = {
 	.caps = MACB_CAPS_SG_DISABLED | MACB_CAPS_GIGABIT_MODE_AVAILABLE,
 	.dma_burst_length = 16,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config sama5d2_config = {
 	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_JUMBO,
 	.dma_burst_length = 16,
 	.jumbo_max_len = 10240,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config sama5d29_config = {
 	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_GEM_HAS_PTP,
 	.dma_burst_length = 16,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config sama5d3_config = {
@@ -5545,21 +5551,25 @@ static const struct macb_config sama5d3_config = {
 		MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII | MACB_CAPS_JUMBO,
 	.dma_burst_length = 16,
 	.jumbo_max_len = 10240,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config sama5d4_config = {
 	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
 	.dma_burst_length = 4,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config emac_config = {
 	.caps = MACB_CAPS_NEEDS_RSTONUBR | MACB_CAPS_MACB_IS_EMAC,
 	.clk_init = at91ether_clk_init,
 	.init = at91ether_init,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config np4_config = {
 	.caps = MACB_CAPS_USRIO_DISABLED,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config zynqmp_config = {
@@ -5569,12 +5579,14 @@ static const struct macb_config zynqmp_config = {
 	.dma_burst_length = 16,
 	.init = init_reset_optional,
 	.jumbo_max_len = 10240,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config zynq_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_NO_GIGABIT_HALF |
 		MACB_CAPS_NEEDS_RSTONUBR,
 	.dma_burst_length = 16,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config mpfs_config = {
@@ -5583,6 +5595,7 @@ static const struct macb_config mpfs_config = {
 		MACB_CAPS_GEM_HAS_PTP,
 	.dma_burst_length = 16,
 	.init = init_reset_optional,
+	.usrio = &macb_default_usrio,
 	.max_tx_length = 4040, /* Cadence Erratum 1686 */
 	.jumbo_max_len = 4040,
 };
@@ -5611,6 +5624,7 @@ static const struct macb_config versal_config = {
 	.dma_burst_length = 16,
 	.init = init_reset_optional,
 	.jumbo_max_len = 10240,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config eyeq5_config = {
@@ -5620,6 +5634,7 @@ static const struct macb_config eyeq5_config = {
 	.dma_burst_length = 16,
 	.init = eyeq5_init,
 	.jumbo_max_len = 10240,
+	.usrio = &macb_default_usrio,
 };
 
 static const struct macb_config raspberrypi_rp1_config = {
@@ -5628,6 +5643,7 @@ static const struct macb_config raspberrypi_rp1_config = {
 		MACB_CAPS_GEM_HAS_PTP |
 		MACB_CAPS_EEE,
 	.dma_burst_length = 16,
+	.usrio = &macb_default_usrio,
 	.jumbo_max_len = 10240,
 };
 
@@ -5675,6 +5691,7 @@ static const struct macb_config default_gem_config = {
 		MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP,
 	.dma_burst_length = 16,
+	.usrio = &macb_default_usrio,
 	.jumbo_max_len = 10240,
 };
 
@@ -5761,7 +5778,7 @@ static int macb_probe(struct platform_device *pdev)
 	bp->wol = 0;
 	device_set_wakeup_capable(&pdev->dev, 1);
 
-	bp->usrio = macb_config->usrio ? : &macb_default_usrio;
+	bp->usrio = macb_config->usrio;
 
 	/* By default we set to partial store and forward mode for zynqmp.
 	 * Disable if not set in devicetree.
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

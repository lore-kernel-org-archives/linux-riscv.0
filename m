Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A11C79F80
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 17:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=02HPxYO+jFkfSXHOv7ukuAHM3nod2sBW0KM8P9ZIwDg=; b=JhCxRC5aADGXMu
	KWpQGt+lf3Z3l6VPEINRCXb0mvhPOKVnThcjvAgPK6E6Rv65dCUTI+VRDsdILQRcKWTkEa1RbRs2F
	JyzPWbh2t6X7Cmc9n7snqLQLaHa+Frr0wA9jagSRJpxt1c/NXvsiZhCohC9y3g5novTYOS2jDFCsO
	pSV9P5LGTTVlvS7hbrUtAelSJ3ZiQ+Kzq+iVcrq91XpGZXxyKBONJ9r6wsIpYN7xy4cyzqJ7jyYnm
	a6vqiKBCs61vyl9XzDuLsEL3/wv+DnE9TF5oX1l3KgQ6WSn32fk7WKbAqOHhLG+NeObIBikwLrhcg
	LZtxTFwwPfFEzyY7H9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XdL-00000002sMf-2WVY;
	Fri, 04 Sep 2026 17:23:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XdI-00000002sMY-1T3A
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 17:23:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F6F3600D4;
	Fri,  4 Sep 2026 17:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA3F1F00A3D;
	Fri,  4 Sep 2026 17:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788542599;
	bh=Qe/SR/azOYN4FcYL3Zi0mhaXWiftLHOPJv3t4uJcphc=;
	h=From:To:Cc:Subject:Date;
	b=EJ3qV0/vmlS5DC4Ju+pgBKtyfO9cpsen5fo6kR4PoUfqdtTer1NSeBOZNUpKnCdYt
	 Ou0SNCLu0alpia5AHSY9mVSPodQ0mSwNaIKbcYJOpzc15gme3j/dHtyJFcWPHakJNY
	 M+RgFXVP8l+bvVR2VUur6Xyr8xX6mp3UWIUDG2lhbewtoWP440wZAJGaD30cTiyRu0
	 y6LXpqXl13Z9B89VIc9paGBLk0PGovB/GB5QNaf7ez8PtpvI51rWgzvociUoU0N0EL
	 lCvIZNzOCnFop3fQoxzdmnl7BMWzj0IC8DpVtE1k+x1paCv8KQIEOdh062iFm4iWQh
	 GZ5DPM1J6moRQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	stable@vger.kernel.org
Subject: [PATCH] riscv: dts: microchip: beaglev-fire: remove double definition of gpio interrupts
Date: Fri,  4 Sep 2026 18:22:55 +0100
Message-ID: <20260904172253.2274751-3-conor@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2720; i=conor.dooley@microchip.com; h=from:subject; bh=g+2NEGXgnzSlaVh9vBHDs5IpNqnrxlZ37dU6ImCHIP4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFmz/uVN2VEnyLksbdMylX2/5kis542YuNw4ocR7o/xmS 12xqPT/HaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIQSbD/5CNiZ5cDdzPfSwj vdcwJDzPdM/b8Sf5xf3go24N62yXGzMyzO2Qurvo+G+VOQFXTnZy/72zguPFGlOFO0bbP9RFf72 4mQUA
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

When the irq-mux and its interrupt-map were added to the mpfs
devicetree, the gpio interrupts became fixed at the SoC level rather
than dependant on the design - the interrupt-map is now what varies.
The beaglev-fire should have had its dts copy of the interrupts removed
but did not. As a result, the mcp3564 driver does not probe, because
even though it doesn't use the interrupt at present, the SPI core still
looks it up. This lookup fails because the second copy of the interrupts
property doesn't resolve to something valid when passed via the
interrupt-map. Remove the second/incorrect set of interrupts properties.

Fixes: b0258f69f1e0 ("riscv: dts: microchip: update mpfs gpio interrupts to better match the SoC")
CC: stable@vger.kernel.org
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Valentina.FernandezAlanis@microchip.com

 .../boot/dts/microchip/mpfs-beaglev-fire.dts   | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
index 6d7037c9528d..a09371d9d064 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
@@ -90,10 +90,6 @@ regulator-1v8-syzygy {
 };
 
 &gpio0 {
-	interrupts = <13>, <14>, <15>, <16>,
-		     <17>, <18>, <19>, <20>,
-		     <21>, <22>, <23>, <24>,
-		     <25>, <26>;
 	ngpios = <14>;
 	gpio-line-names = "", "", "", "", "", "", "",
 			  "", "", "", "", "", "SD_CARD_CS", "USER_BUTTON";
@@ -101,12 +97,6 @@ &gpio0 {
 };
 
 &gpio1 {
-	interrupts = <27>, <28>, <29>, <30>,
-		     <31>, <32>, <33>, <34>,
-		     <35>, <36>, <37>, <38>,
-		     <39>, <40>, <41>, <42>,
-		     <43>, <44>, <45>, <46>,
-		     <47>, <48>, <49>, <50>;
 	ngpios = <24>;
 	gpio-line-names = "", "", "", "", "", "", "", "", "", "",
 			  "", "", "", "", "", "", "", "", "", "",
@@ -115,14 +105,6 @@ &gpio1 {
 };
 
 &gpio2 {
-	interrupts = <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>;
 	ngpios = <32>;
 	gpio-line-names = "P8_PIN3_USER_LED_0", "P8_PIN4_USER_LED_1", "P8_PIN5_USER_LED_2",
 			  "P8_PIN6_USER_LED_3", "P8_PIN7_USER_LED_4", "P8_PIN8_USER_LED_5",
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

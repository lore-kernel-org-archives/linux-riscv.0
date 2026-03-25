Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBD3109C036
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 16:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s355UqqAaZYN9Cg5H+JIV5XTkt4sjQV5YlK7oJkOjc4=; b=efNNdyFpqZ659F
	NkN5yPtCAh7kLsVRbWRYF2gMalx1pJZymXs8xtIDc3BsW8tHUOehCCGkUgK8ktW40uHpm1piYiQeT
	8Gb1mYqfegVJkILpgyZJGxndFgabkHeC6mdlYZva6AvlZjVf2SZWiGcTK8edH3etfhu+qP7ESZ2uY
	8lLwDKU9SkKaP0Zc4hdff4CaXW0Q3i8X8kkZCdWKmpdHuAuURSjYe68rL2dbCBiSTyGwb0qUcKwHx
	aY22PeOIy470ikmVHD/wXQBnnu/6I9LfAXHg0Fp7hEN6KZvqEgX/DBH+C5As4ao1rELs91PyRQebB
	KXP+kdNl6tZgvVKHkykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R74-00000003tMF-0vtE;
	Wed, 25 Mar 2026 16:29:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R71-00000003tJr-3LVC
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 16:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6033E43E3D;
	Wed, 25 Mar 2026 16:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97043C19423;
	Wed, 25 Mar 2026 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774456183;
	bh=ZcOLtYKae+2Rnp55wBNFsnZiamfl2XYukwL2390q/wM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WFWY9/5dsndrjfbk/fjs64LRLg1pisMxM7P7TPkrZ+U4y41CIYPTq6+488nZZ2fTn
	 ApzzTvu3A20vz2lnxJN74G9IlOF2tsDDUqZeWcspwDEVKnATakD+nKFXXe1EdaTOQs
	 RESmmkhtNz01CaG7ybFWrK+yxc2mb3eE8R7XfG69uCtUnPiUUlPZoeFcvIcXbLSAqI
	 XjmoyuFixhIi+SMqpp8pZCfWehlBirF+5xl6B5Flx0kbxhl/kTSHASZ3igtP8eZSD3
	 jQDFxmGlEQvDLc2IJR5hXjlCf5FBRpUPcIHXD7jiA4gZEovnsPmjj5kid+4g74wkWP
	 Gm4FbttoWS3Yg==
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
Subject: [PATCH net-next v5 09/14] net: macb: clean up tsu clk rate acquisition
Date: Wed, 25 Mar 2026 16:28:13 +0000
Message-ID: <20260325-hazing-penniless-14ba803efbb6@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-unsterile-flail-4c7729750dc4@spud>
References: <20260325-unsterile-flail-4c7729750dc4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=1kpPbARU/zhfeCpg9eoWhZjN9mLcjx7s+d9CyHanEvo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlHeM3uVv9uXzfDNupG+jIH79Oz3R8ezfWZ2vlPSLF0n 3b1xtYdHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhI/FdGhtZrJ7nDI9ymXrHf Ux629OeJP1veJeS90AgvF3w2qVGfTYLhf/Q9DoaXU99P/Meq9ot3n9lOs1D2b9s0vx4LFeO5NG9 lJisA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_092943_877319_093EFC83 
X-CRM114-Status: GOOD (  12.36  )
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

tsu_clk is grabbed during probe, so doesn't need to be re-grabbed here.
pclk is mandatory, probe will fail if it is err/NULL, so there's no need
to check it here or have a !pclk 3rd arm. Simplify gem_get_tsu_rate() to
account for these facts.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 492abe1e33b3a..b28fb771e03ba 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3765,16 +3765,14 @@ static unsigned int gem_get_tsu_rate(struct macb *bp)
 	struct clk *tsu_clk;
 	unsigned int tsu_rate;
 
-	tsu_clk = devm_clk_get(&bp->pdev->dev, "tsu_clk");
-	if (!IS_ERR(tsu_clk))
-		tsu_rate = clk_get_rate(tsu_clk);
-	/* try pclk instead */
-	else if (!IS_ERR(bp->pclk)) {
+	if (!IS_ERR_OR_NULL(bp->tsu_clk)) {
+		tsu_rate = clk_get_rate(bp->tsu_clk);
+	} else {
 		tsu_clk = bp->pclk;
 		tsu_rate = clk_get_rate(tsu_clk);
 		dev_warn(&bp->pdev->dev, "devicetree missing tsu_clk, using pclk as fallback\n");
-	} else
-		return -ENOTSUPP;
+	}
+
 	return tsu_rate;
 }
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

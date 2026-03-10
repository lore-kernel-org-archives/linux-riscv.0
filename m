Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B15FD4F07
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 17:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCQ6T5AeHMYIV34j0nYhFcH4KnT8mRKpU4AJFk8rbSU=; b=mmZixqxHvIi7t5
	sxh3uoom16Cdb1tVfZu5mCsfxf2A8fzEwH4yPhgVQZAdsBX4zXLuFdk23CpN1NXaGud9Z3Q6TeLwg
	91/sbu3mmV8lYETKcp9M6FU3oii0Yp9V87sGb/AYiY2TgaZsvmohanQ8pQdxuqpO82sfVYWk74yuX
	46mGG2Oe0bM0LKxpfdvgdmIFQo1qpmLdpY80V/cT89z2YVRdni4UysIHR+d7FG7bxCmwjSLtIAqAD
	EcU8o7rI1ZJO4sxgzAayLBc0Nz6lGy/5+EV96xs6zOqZS+RktdADRXd26uFUTDDu2sgjvqi88NStY
	/OJPjt5DU1I/AXazqtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00k1-00000009y3C-19mq;
	Tue, 10 Mar 2026 17:19:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00jz-00000009y1j-2LsI
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 17:19:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3A3B600C4;
	Tue, 10 Mar 2026 17:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D81C2BCAF;
	Tue, 10 Mar 2026 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773163170;
	bh=l0HWcNcVkVo9YLSrRqspDdP84/kdc2LHA5rpvVoVGqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UZOu3jbwCJQybbw9ITXnq/6jm5sdEpvaO+pzakWGIN+iyNSYTLLBQrrVJbrd1idVB
	 DybwhA0D4ougEcRqKzQY3N4YRh37XIXm03vtPrUhecWaT6kICBhAOSfcPQu6zKE0zK
	 BbLFZDPLFdD9iHsUglpz5krTCzo8mskSRB367Xkmbx91gFSLrobe3B4okgNBfdqIR3
	 jjom2dj3pT88Xcnvdb4uEKRdZ2N6kYYIBCP0qYrODBczDflStGNgQaJyhb0uC4J3df
	 wV8Ojw8QDjkE2u3Avb3ERM6xrUmPVREwxR2jkYto+Hozb+H72DReSd8/Vzeg1Ra29F
	 zVeznfyxV7fEA==
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
Subject: [PATCH net-next v3 08/10] net: macb: clean up tsu clk rate acquisition
Date: Tue, 10 Mar 2026 17:17:15 +0000
Message-ID: <20260310-undefined-unfocused-805b5f2d3b37@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260310-moneyless-dispense-7bce14b16388@spud>
References: <20260310-moneyless-dispense-7bce14b16388@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=pBzsAzv0f5XjXC1axq0Olq90oNiYo0A1zmrCQdWDjrw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkbgvRMZz1RyXH1WvCHJZxzkUWcxREP8bC0lU/neAeYM hRfYb7SUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgInEzGT4Z5Ta9aBIhzcmk3Ph vnTjuc1xro67WCsSdZ7HCfTq7n5wlpHhf6Jd9lSnx3qf/E61ss7fvejji/+v+B+t3DhX1VmLV0q FAQA=
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

tsu_clk is grabbed during probe, so doesn't need to be re-grabbed here.
pclk is mandatory, probe will fail if it is err/NULL, so there's no need
to check it here or have a !pclk 3rd arm. Simplify gem_get_tsu_rate() to
account for these facts.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 6b37598ac57cd..38e75c2e097bf 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -3527,16 +3527,14 @@ static unsigned int gem_get_tsu_rate(struct macb *bp)
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

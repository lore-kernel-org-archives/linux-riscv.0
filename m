Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1AAFC5927
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 11:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TWbLM8MGMIRlemplOQT4KWtGIkVF8GP+ZBNNJSGZHE=; b=dChn72VqyV60YI
	c91X6BgyxYScGE3pCL0lI1ear8W2vu6WznFpHvuG45Pysun/lNcdZUD6V+t/4VcyRhJ9JWqBz6D7d
	N1jWtsyuha2wS9O+/vwTxoIKd2ksL6TfcEjKvkIn4rioLhnqzqNHcKf/EOwi0Y8Dt8FqFhb3Btbaw
	al9WuVxiCDbkZp8r8KXxvV/VnZ+VxRQTU5hgug+RxYxX/DlzYvPQ00HLOoROydgXYeUVBvqIk8AX0
	hSw6Mkr9AQukLECG1jafAHUmx0dhJKfj3c1ZxqY5Yi6J2OeDQj61UhDDx2jl4iR4XpQbIVt7zi2HX
	cYtsRwUaYpdfbyl2BX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZAT-00000005z57-0xb6;
	Thu, 26 Feb 2026 11:04:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZAQ-00000005z3V-2dC4
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 11:04:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 442CB42DDF;
	Thu, 26 Feb 2026 11:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38D5C116C6;
	Thu, 26 Feb 2026 11:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772103866;
	bh=2jj3tlUPwNJyQbcAlJb/OigLgav3z1nU51BP4RvIQIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GckSiqhb0AxxsgsyCythZCvx+sJjErEC+mAIzuC/u+lef3vKn3Vtu/nRBzGxCv7VF
	 e91X1p0Ym8p6+kVuwLdrZwO0vu6ADhv/ZbYJyKsyu0N0tuyNSHUBZ28ElCrPMCdtRD
	 XKvcAkdervGCuLf9svjgDwJ7ATR87loTVGyQ212Qivs/0SfmoNINYD+A3FBW+gQaPF
	 e84QK7c5Ww6RwPbm3C+e3aUkwfqlaJbTdshkq6ybWIxkobxVH3hhwFIKrWKOXfpV5V
	 +uae31yqWuhal4LJs877VDNkN4qJNiZIdjGaJO7I6p/cpTBIjH+SYQBtTaujv5cQsb
	 sdIg6EIEF2v3A==
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
	Abin Joseph <abin.joseph@amd.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH net-next v2 8/8] net: macb: clean up tsu clk rate acquisition
Date: Thu, 26 Feb 2026 11:03:23 +0000
Message-ID: <20260226-mammary-relearn-bab7519111c0@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260226-snowshoe-amusable-6716d4ddea11@spud>
References: <20260226-snowshoe-amusable-6716d4ddea11@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=apFAb9W0Y5znFJfOtey/gSV/AiSmELU+MiBfWgmgUMI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkLNCoMcy6v374hpsdCOEh8VmxBX0T3hknf5+WmVgrti /59T3NTRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbC5MjwzyavVtNw0eIYg4Kp smejfnH965skt67qziItoQxBq2ub3Bj+53PZVMzbt2rKx4+XjuwQM5B+Wiso0PZi+d213z1l47L ruQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_030426_708377_495B405C 
X-CRM114-Status: GOOD (  12.03  )
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
index 5c24ea146d63d..f5ec283ddb497 100644
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

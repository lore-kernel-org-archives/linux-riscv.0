Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A92EFC5927
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 11:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zDmWBtUG6dM8wrdxQMBA8hLsVh+clNgFZfqnyIIxnUs=; b=Xt7TSIVOSDse3K
	UNXAHtmaJOEmjpyPuUCCoT4rWD5GSbladZZ1zPDmD7PyN03RUElA5DLJVHgLS3h4GucnY/TaCMrch
	fzGFi9DgaR107u2w+H03dHNhxmvqazvqDFRvfzc+VBpXkZc2kihS/JElehzlEgSINC/i3j5nGWPWp
	58RrVnHp5rSenQ0GZzh5R6peFjOp6MA96KYiYzQ1yenh2zw7Fx+mFoTxnAJEupV2WK5R3vcjYNQOf
	PCM2j8sKKd0s8Sg18VR7egRqJS3RqtIDOsUnT4ZulDnXitvNOdBT/YQrn8YkgNRM1A+Z+KUDsFnCb
	fR9sGQ8tSSaqkwi0bkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZAH-00000005yy6-2EwJ;
	Thu, 26 Feb 2026 11:04:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZAG-00000005yxd-1cqn
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 11:04:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C1F8600AA;
	Thu, 26 Feb 2026 11:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72316C116C6;
	Thu, 26 Feb 2026 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772103854;
	bh=i7L/N76H8SB0KejhBMqYjBa0HiXaFQo6XPzbFFF6+Jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QlfX5CKcvedHtyZUcXQLbYGcbh4Rf+Os8zmh368uAo0M/wtRV8FRZyM90hSKvWFFR
	 zmf7U245riwqe3Tp1jWRR+0wIpKTocJkDse9WjCdDjdaxUIse1VK909/nawqFtFJvz
	 pF88dKuKoBPeawBscU5pV9xSzrw0zE5Be/kZfog4k5DlLfsDlvRrMv3TsrXR9qb9Rb
	 iV6efiqsdYGSnI5zwkiJ+Hl723Wai8eC9gtQfY9HvfwLOx5LXvDng+Kaqngs4M2Ln2
	 GvltaQzcmZRIBsLrs8I18HJAFzNuaLKd03PqT1/p5tb2zzWj7J56Wizg+Shsc4wl8e
	 8X7XZCgHvGi9g==
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
Subject: [PATCH net-next v2 6/8] net: macb: add mpfs specific usrio configuration
Date: Thu, 26 Feb 2026 11:03:21 +0000
Message-ID: <20260226-undergo-aim-acae5e1ce48c@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260226-snowshoe-amusable-6716d4ddea11@spud>
References: <20260226-snowshoe-amusable-6716d4ddea11@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2699; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=y91dFQ2ZoMKWlp5ZpGzJrrZ9hbr9du1y0KV8vMwT6Rg=; b=kA0DAAoWeLQxh6CCYtIByyZiAGmgKHijYtkcyQ1V8ITW/d/e2iNn8sIMpKNOvHc9RmD+w+r05 Yh1BAAWCgAdFiEEYduOhBqv/ES4Q4zteLQxh6CCYtIFAmmgKHgACgkQeLQxh6CCYtLmGQD/ch58 9M29LIDrXKybkOm8p34mRdO86b1FvCtbIpjX+a0BALqqJgAbgptyFPM3NL4rQVEjgVxqBOdTrkz ftJgIhYkC
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

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb.h      |  2 ++
 drivers/net/ethernet/cadence/macb_main.c | 12 ++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 8cb0b3778ee9e..04961658a21c2 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -780,6 +780,7 @@
 #define MACB_CAPS_RSC				BIT(23)
 #define MACB_CAPS_NO_LSO			BIT(24)
 #define MACB_CAPS_USRIO_HAS_MII			BIT(25)
+#define MACB_CAPS_USRIO_HAS_TSUCLK_SOURCE	BIT(25)
 
 /* LSO settings */
 #define MACB_LSO_UFO_ENABLE			0x01
@@ -1212,6 +1213,7 @@ struct macb_usrio_config {
 	u32 rgmii;
 	u32 refclk;
 	u32 hdfctlen;
+	u32 tsu_source;
 };
 
 struct macb_config {
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index fa55e6e7036f2..ca141f8935d48 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4626,6 +4626,9 @@ static int macb_init(struct platform_device *pdev)
 		if (bp->caps & MACB_CAPS_USRIO_HAS_CLKEN)
 			val |= bp->usrio->refclk;
 
+		if (bp->caps & MACB_CAPS_USRIO_HAS_TSUCLK_SOURCE)
+			val |= bp->usrio->tsu_source;
+
 		macb_or_gem_writel(bp, USRIO, val);
 	}
 
@@ -5220,6 +5223,10 @@ static const struct macb_usrio_config at91_default_usrio = {
 	.refclk = MACB_BIT(CLKEN),
 };
 
+static const struct macb_usrio_config mpfs_usrio = {
+	.tsu_source = 0,
+};
+
 static const struct macb_usrio_config sama7g5_usrio = {
 	.mii = 0,
 	.rmii = 1,
@@ -5343,11 +5350,12 @@ static const struct macb_config zynq_config = {
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720E0FC5927
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++RXSEXpFoPPtngVEYz6bsmqDPLHlU120ffuhlKyctk=; b=FiVaKTJlqSR1zM
	M+FDl2gasvvyCEC0qaS5YOm7WCeO5QO30FxdX6TuBMJCw3KGGaKxF/N1aKD0jI8MAjZ6BIwAn8e/W
	vyr7PlZhlSwuqXFo8aqPka1h7iRW68jTgB7diEosWHPKn7bOH2dIQCf+MhI0gTBBlk1skR01mdlq1
	Fc8yKqWXQ06i5M4lJYdmDahL2lSAsRuyZ4bQLcRXlg7mVziEX15k/yYDG0t3XLHXfry6mp/oGtygQ
	9wjPxmGhvU8tb1r3IK+0C2yYxq+vBeJThcEKYz1CKXRcsTAXOEINaqCFzOsF/fBudg5/gbxCpjtxi
	Dvxd3rAwgyOQR8cxrPPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZA0-00000005ysk-2YGA;
	Thu, 26 Feb 2026 11:04:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZ9y-00000005yrQ-1vWs
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 11:03:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0B3E417AB;
	Thu, 26 Feb 2026 11:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A557C19423;
	Thu, 26 Feb 2026 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772103837;
	bh=gCnpueCUTyu07waHpq7nu6PTRZfJXR3EGhkw9ZM+/bw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HsouwWvobVKDxezQCD+XbTxcM+ndewpB+KFiy78v15I9+SCwrRXK+3nDJ1JcFXsdn
	 gda+mhuyzdEta0JkEl47xVy5nII0q4LeF0yxIVzfT/MkxLwV9QDUGRlVeNQs1Efrok
	 QPkxW5XhkCiHDvQ5sZ5Tz7ErecxmP1M64nPOuKhMqeeuIyF2RD/dqO6XgUamgGfB2/
	 mmFFSusZ6awJhrXAONd7HpV5crDNzg/Pdzbx8rtaEUacDZWYlv9BldaL40ngskDk3N
	 V3rkMu46GQx60ut+9GynTCeMxDUToKi5nCvT4irRGYUSLMe5tzfJ/iRvrUuREHz7pV
	 k+7IC11hUM/JQ==
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
Subject: [PATCH net-next v2 3/8] net: macb: np4 doesn't need a usrio pointer
Date: Thu, 26 Feb 2026 11:03:18 +0000
Message-ID: <20260226-penny-steersman-639cb0817c7c@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260226-snowshoe-amusable-6716d4ddea11@spud>
References: <20260226-snowshoe-amusable-6716d4ddea11@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=820; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=4mwnK4Cru/aMA40im7P98cvEdQM5//cBujdDVwQ8uN0=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkLNMrfHPrcabRzr2xCx87Vyp5a6SVrumXj/2na1Imeb phmV320o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABN5/ZThn2Gh0rzsEuavHqfU VRN9pu1/EG/nWueS1/7n+Fw7ZkPFfob//ikyS5ieXDmu2KDwJXfTb/+ZARaiYneXqqYXn38hzOT GDgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_030358_521920_90E8D151 
X-CRM114-Status: GOOD (  10.81  )
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

USRIO is disabled on this platform, having a pointer to a usrio config
structure doesn't actually do anything other than look weird.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 778d2115f66fc..ddbb0c327b303 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5315,7 +5315,7 @@ static const struct macb_config np4_config = {
 	.caps = MACB_CAPS_USRIO_DISABLED,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-	.usrio = &at91_default_usrio,
+	.usrio = NULL,
 };
 
 static const struct macb_config zynqmp_config = {
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

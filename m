Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E87FD4F08
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 17:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQGYMmVBeGCgVVOl1MOnNuTXMY4CKDc3Z2PWWDjNRX8=; b=pE5TF41a+IzFd0
	HPpB8RUPb0jcRgojczIzWkDNsqZGalYAdwIXCJQ8BK5kqNsi1D/6f83qYTKU7u9bMDhTN15keHA3R
	XtaNQQMsgD7Uf8uUs9sVXQWwlVRePgiMxWmpmxAMEqPTqGjMhsuzS2SVk/8QUNXf6+p4+mBLckhfz
	CaOFnac2BtW9nIm1BLLYjVrvPHo1DEVhXG+IhZcKUiK0XaJcQBQY/xhW1oEGQwDc7hUfeYaW2p1gU
	TLvC1FcY3g9YdmmXXTgDghpoYuUZdCgwfocfVl7v+co2g2nO2YyC+LXEh5t01O1xHD51wHVhDzt09
	S8Zr0GXC/72b2G8UR1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00kC-00000009yDA-3mLa;
	Tue, 10 Mar 2026 17:19:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00kA-00000009yAc-2eQJ
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 17:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3668740C4F;
	Tue, 10 Mar 2026 17:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C550FC19425;
	Tue, 10 Mar 2026 17:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773163182;
	bh=9DLc73kRovjX7PmKOfMC6v7DvLF8VkwF6ivlc5RlT3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LtNAAwQZEWoDaAVsZHl1xlcSy7lWlO+9QwLPUxI/j1WH8mjZNBBiXqbvRWc+1cTl0
	 yf65f6i5wm4OoeL6y/p7qP4wgiXmpU++qxFmuroYpxz092UuB4XGlAwW5KM3rKiFJ4
	 1wnQugkZyQkkK5FWVkpLlQiGsdtX8pgqRw2qwH7SjuevLgVdgKfTwNlw5jATGRqL7b
	 UQAe/oUSFq51MMTusYKQem69YHjxqI7CAWL4y7n4b3VhCdPVRIpndKratErDEhT8C0
	 ibf6dXW320EKvo/40yN6YK3lOxWzCuuxhdaTHHPC4jEbfxeclrF1tkokWvTVUshSWJ
	 6LDCnONlQA/3Q==
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
Subject: [PATCH net-next v3 10/10] net: macb: timer adjust mode is not supported
Date: Tue, 10 Mar 2026 17:17:17 +0000
Message-ID: <20260310-faceplate-ashy-ca696dd4433d@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260310-moneyless-dispense-7bce14b16388@spud>
References: <20260310-moneyless-dispense-7bce14b16388@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=OqQujPb90kYRx/KgLbRe0CGbTbZ7JG8YWaMugKJ3peY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkbgvSn2dU3zSp7xibx5n+F55T0t6LBly+n+V/a6rj7U lmTilJERykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZyfC8jw2O2H3Vyrcb5uad6 n3RGHli0cf8a9U3LEm57c8XU/td7FcrIsCJOWXFGy4Ub+RpM+n//zbhYe6LqV3jzjIUrZN/d01q mwQ4A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_101942_718467_C660C0CB 
X-CRM114-Status: GOOD (  11.90  )
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

The ptp portion of this driver controls the tsu's timer using the
controls for "increment mode", which is not compatible with the hardware
trying to control it via the gem_tsu_inc_ctrl and gem_tsu_ms inputs in
"timer adjust mode". Abort probe if the property signalling that the
relevant signals have been wired up is present.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 38e75c2e097bf..3e0ab23e9b9b0 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5577,6 +5577,13 @@ static int macb_probe(struct platform_device *pdev)
 
 	bp->usrio = macb_config->usrio;
 
+	if (of_property_read_bool(bp->pdev->dev.of_node, "cdns,timer-adjust") &&
+			IS_ENABLED(CONFIG_MACB_USE_HWSTAMP)) {
+		dev_err(&pdev->dev, "Timer adjust mode is not supported\n");
+		err = -EINVAL;
+		goto err_out_free_netdev;
+	}
+
 	/* By default we set to partial store and forward mode for zynqmp.
 	 * Disable if not set in devicetree.
 	 */
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

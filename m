Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17DAE81A36
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Feb 2026 15:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UnWBm4pF2C6wnoU4+Vm3FCMrj9sil9QIZnljd/9riRo=; b=G7fQtkHnpVeZfM
	kSt757igo6oDxjGbLlrDxJizMyBco9A8PW71XQ+xRjAKnvpPy4Mc9kMfkMKvWvts8LdlgZKfGJHem
	jyLhEGI1e8/R1GewhxYxU0epnjpZYYrWnYWWsjIzcSRJLymKpNhbocayjjjp0du3zLNs14YeRZ33G
	7ySaZMqJlmAePQVTvCo/lFD2PvxpM4EFg+RQU9oFytQjReGyB/FRmV8JWIQaitHFrxgk/reMZ7ozV
	nC14Zl5g7tBIP8csSUCIP7ZE36Z8QmrngrZFuomtTA/lykp5fBchG1XT9/nuU7iyzOPeWMzyFeNu7
	ke+F/2M8qVo4DYAeG8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0VR-00000006tVL-3lVG;
	Mon, 16 Feb 2026 15:27:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0VP-00000006tUs-3DHR;
	Mon, 16 Feb 2026 15:27:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 955E161118;
	Mon, 16 Feb 2026 15:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B71DC116C6;
	Mon, 16 Feb 2026 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771255642;
	bh=X/o7kKrycyJfueFLIcDFGwo8oG/j/XDcQ+Ni+9bU7j0=;
	h=From:To:Cc:Subject:Date:From;
	b=SnetH2sUG0YxWO7tIfyYOK82VUo2EX0zdjXSSTQwAaX0E08C2sIH7RXfkkN9RIiZU
	 rnX972LJIZ1/7iixrUEiL9mve+TtmxHoMDps6OfNwchcThfT5Wg0jydb/lAuDD527s
	 C75k0qbBB6sVH4eH1e6e9OPnygAGybOLumrzk8PzGJs+zepcsqXrauAxKvSGpf4qoA
	 R7S6CV46E5opJv9L+WA2xNTuIwifHHxl1BIV1P1822wnqrBtunnUIv4RE0sb9VzTbm
	 FdP2oFEJ0XCy+hL61mXuwKZjvIilCtnufx5CDeNszAgFEQztD04ulJSMvbs7cGNp29
	 uyEB/eUygtuGw==
From: Yixun Lan <dlan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ze Huang <huang.ze@linux.dev>
Cc: Yixun Lan <dlan@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Junzhong Pan <panjunzhong@linux.spacemit.com>,
	spacemit@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] phy: k1-usb: add disconnect function support
Date: Mon, 16 Feb 2026 23:26:53 +0800
Message-ID: <20260216152653.25244-1-dlan@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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

A disconnect status BIT of USB2 PHY need to be cleared, otherwise
it will fail to work properly during next connection when devices
connect to roothub directly.

Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Ze Huang <huang.ze@linux.dev>
Cc: Vladimir Oltean <olteanv@gmail.com>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: spacemit@lists.linux.dev
Cc: linux-phy@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Change in v3:
 - split from v2 as bug fix
 - fix alignment to open parenthesis
 - http://lore.kernel.org/r/20260216090112.n5jjpui3luqsybb5@skbuf
 - Link to v2: https://lore.kernel.org/r/20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org
---
 drivers/phy/spacemit/phy-k1-usb2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
index 342061380012..9215d0b223b2 100644
--- a/drivers/phy/spacemit/phy-k1-usb2.c
+++ b/drivers/phy/spacemit/phy-k1-usb2.c
@@ -48,6 +48,9 @@
 #define  PHY_CLK_HSTXP_EN		BIT(3)		/* clock hstxp enable */
 #define  PHY_HSTXP_MODE			BIT(4)		/* 0: force en_txp to be 1; 1: no force */
 
+#define PHY_K1_HS_HOST_DISC		0x40
+#define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
+
 #define PHY_PLL_DIV_CFG			0x98
 #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
 #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
@@ -142,9 +145,20 @@ static int spacemit_usb2phy_exit(struct phy *phy)
 	return 0;
 }
 
+static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
+{
+	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
+
+	regmap_update_bits(sphy->regmap_base, PHY_K1_HS_HOST_DISC,
+			   PHY_K1_HS_HOST_DISC_CLR, PHY_K1_HS_HOST_DISC_CLR);
+
+	return 0;
+}
+
 static const struct phy_ops spacemit_usb2phy_ops = {
 	.init = spacemit_usb2phy_init,
 	.exit = spacemit_usb2phy_exit,
+	.disconnect = spacemit_usb2phy_disconnect,
 	.owner = THIS_MODULE,
 };
 
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

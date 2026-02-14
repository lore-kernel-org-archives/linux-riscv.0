Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E3BEF99FF
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9iNxc+DueQcV9KNTf4Arvk6nQPc6E1NQf2OlJtXl8I=; b=qYNVW5PeqyRnTU
	P6r3/ViIHNb2mvQUKNTyr6aFUsiwO6LTy/bcLWviWr9oqjpn9tuFRS5eRuJIKzf8Yz4Z6MqRBQhZE
	zEaz84ecvLILLiMS6mf7mV1gth42PNMQvPKkXbawS3teoOYrwDODMI6w41wZw7cGI4ECDyj8eGJlO
	6z+7HMdip6FjhTpuS0N4/OfxRaI7bYe9g8bUVTCOFZC4MlNRJQqA3sFQ15ZgGeV/RCL0Z0vBvS17G
	TRI4NPAvlVaCdizY4h75nmR3fxRz/ZL7omlg4EhZoB8RZ52V71cEnwruoaDcCrpPkdirwcVm2DkKW
	vB2+PaxLQXy+6vWAQZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEmT-00000004X0G-3gFT;
	Sat, 14 Feb 2026 12:29:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEmR-00000004WzY-0bZl;
	Sat, 14 Feb 2026 12:29:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1D35412EF;
	Sat, 14 Feb 2026 12:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39AD0C19424;
	Sat, 14 Feb 2026 12:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771072186;
	bh=R/+dzl78ImcyJC3ajMsl4sx1pTb167EmQ3u/ZqNDDqo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TOCosvLOUkpUvSy3Cd6K0bENEMRdr8eqgsnwRfG++apQa4xCbrOYaxOAEQOkmnegl
	 hiFU6jdGKrk1m1yS2mcaN1XFCPVRGZ4ni4B+b2ORa/KNuV3XL0AlnNPoeDTVSiBJMD
	 xhC9kSInq2I+Cf7g6LYE4386PIJKpvGgYsR6FKMc35dFzcVQtN2VaqyjMXUn6nrdTN
	 5VAIrnz7m3DwhTLZygeaSRMGI4UAzTb2PCBgbtVkADLgr5RpttEmrNzHSziWEU+ZTQ
	 OsGXWcvXXWCqS67f5OSWyG0n2oNqrlZ/LswPcYlrsqVTduHFEsm7faDMxmLGHrcd+G
	 XeMynLklz0U2w==
From: Yixun Lan <dlan@kernel.org>
Date: Sat, 14 Feb 2026 20:29:15 +0800
Subject: [PATCH v2 2/3] phy: k1-usb: add disconnect function support
MIME-Version: 1.0
Message-Id: <20260214-11-k3-usb2-phy-v2-2-6ed31e031ab4@kernel.org>
References: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
In-Reply-To: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552; i=dlan@kernel.org;
 h=from:subject:message-id; bh=R/+dzl78ImcyJC3ajMsl4sx1pTb167EmQ3u/ZqNDDqo=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpkGqncnS5ukAYLLDhRo+37cDaebjFw+ClkAS/U
 +HXtIFVj+OJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaZBqpxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2LYw/9GmtDDMqAa3Y1Jed10EBIq4pzQY4v9WhRDJ3j+Ip7ZrWx+RSyemVLO
 sk/PefMncMZU2B5mUQ4JVWzwG3u2RruugSo0H5IYBWz44316Z7zXz8m2S/v1hCu4tTIAIZ3mk+h
 bspF9ZZeuXmWgeWabUcFouHZe7FVd3pDCbyyuwtsVAy9elAtrPGHy5t5E/8STNa1VEQ4WXeDIZ9
 HJqUHqvFqrjtB4hrWof1wgmG0q5UW5v2wMdthSkt3XYN8zxkGC81rKCF6KiHGeFhB4HLQLTObz9
 e6QjNG8Kers/pIbWA1JXZ1y0bZYyO5CE1QTrCeavUwrhdEBOtwuRmGtByQbZ5Wtyu/KgN2WEzSJ
 jT8amA6uDy8BY86D6cJ1pGU1UxuTcKTvGDFs6kRpAEyFMMU2uyBFpT9dHP23iW5aLKrvuytRFLq
 pn06wxWNEDVeTdlwBIdnhRkpLv5ZMCjr7+5daUC2eniz3Ebz4VH/kiq7D7vMz4/YpdFp51pWK/y
 7UvOPWJjUtYIR/78n8L6zs/TeOt1ht+q12qfrXn/cjV7cegrJynZkSj0bJtMWtW93p+v3CBmiAF
 aeZoVG67e8EebdjXKBc/q8GGrM/jCj6a8LYsJeqRm5+Cw9FgQyWJOBX1yOcKk2MAiJt17iLN6x9
 c8eGwaJWOfmMQfdlwsQOycPHEN0Mn0=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_042947_231010_B2852C00 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
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
 drivers/phy/spacemit/phy-k1-usb2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
index 342061380012..959bf79c7a72 100644
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
+					   PHY_K1_HS_HOST_DISC_CLR, PHY_K1_HS_HOST_DISC_CLR);
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

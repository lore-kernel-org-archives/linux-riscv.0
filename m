Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAD3EB2719
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 01:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8R4IXp+bUKs7Fm54aBzugUd7oiDYFHo7Hn5PTf2vYc=; b=Y1m1+1QRR2BFUD
	3Dbpu8Roxg8aGNqMrZqAO4v13pSmlXZppoINQ50Vx6Gouf0Y1rA9kWphRZd2HYf3V9qvLYjkqM8q2
	foNVnpXL3hP/wP1tONyourfyBMVWo1k/mZGTsBRCx47KaaE2SrgxNG2doPws8Pk/znYppFyB7yyvk
	PUxMFz4mPClJHNG5PzHXNXBH24oChr5vhsKG83f+6ysBGG1C9Uu9J1LDEjZhhV4c7tyyi1/c06Yld
	1yI3eKaxiIMKGyuu455OpRzla+C9O43NRrUGdcoxt/BTnhM5qO8mw1xHlW7+xu38RelAST/dRQjoQ
	YlwGczXWBWyVn87ZtlRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLfr-00000001HCM-3cmH;
	Thu, 12 Feb 2026 01:39:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLfq-00000001HAl-1M3H;
	Thu, 12 Feb 2026 01:39:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D8F960122;
	Thu, 12 Feb 2026 01:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E57C16AAE;
	Thu, 12 Feb 2026 01:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770860357;
	bh=VeholSffT/UMyhEACirshDrbCKDpTWyBnxuxVdBUr/w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KJFMkekb/gpw+iVZ4zFpjfyIj40fK9OJOeNklaJeprIum6E+l7NCmbQDu/YGY1YoM
	 oJR2er3OHh82lGnV47jvk+qz+U+z3/rQGpDV03YFemgMkj9fqFu97Y/2EHBRbqC6Fn
	 3j5gri5h6JNrkXJ50wP9mtCPUFVp5vCPDgYpdeN+B2mUzifKctRr0l/MYpEeWt3DGI
	 z2CUJFhDMGYSOIG5r9SirK+lZyIN1Fd3YKF8BqDVG7yOfQCaFzRhrtnR2CpaRizRjY
	 nVO1KAECeXC5NJ50bq5hRiRSEhQQrg618Z8BPLMBXOzswLbEx8yol+LhZmrNMoJUgp
	 3qXgDhndD8eIg==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 12 Feb 2026 09:38:55 +0800
Subject: [PATCH 2/3] phy: k1-usb: add disconnect function support
MIME-Version: 1.0
Message-Id: <20260212-11-k3-usb2-phy-v1-2-43578592405d@kernel.org>
References: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
In-Reply-To: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479; i=dlan@kernel.org;
 h=from:subject:message-id; bh=VeholSffT/UMyhEACirshDrbCKDpTWyBnxuxVdBUr/w=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpjS83l7LIBz5j7b0i1Mn1HREi55NVap0spyWjR
 qFR12iKDH6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaY0vNxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0acA/8DiNihXAyofvNdMrH+2sgLHZcWc0P4+l2zGse7N1DqHhzTMCJQmQz8
 AsQkj/JF96iZ6LsB+ruMJLFuiKyJ7cDoHpsAe2nWMDSp9g2C59c86xu3RbJSimk+vCt7/2gkZLv
 XmloMWH+dUqnKitXxCt+mGSLdtNe/9A4F1RBT3i4TBmbyH5YcPBk8aFCE99HZRA2tUHZxY308iV
 2Ztwjtveq68uF518L3P0IYO36QszZEq+zDl5eriaLTNfQLqcBu9whDbBUxKxBjF+xnn1Rk2t8pZ
 Xcd6/QdmDvRJrt/2xaYGoDHvHMAS0AA7K3fCeRoEhYoLguTc0DtEtnXCLt6E23Hu9SGXbE83CgP
 SdEfj9gfAdATba4vOEg1PXxOMl4mxVBE69E0A4F8OrMVPnOGgv55LAgeaWykGe//2qybaEumu/K
 YhbeZLPrjKs2p+LLQTvL6WbDaYiFK5ktkD8Kg1cFG+RONxfUNYt/j8zJ2LBx1+ixJtktgNX5X9O
 6n26mmRrxc6kNV1OTAL+zZ+WVZsZa7pRRescgml8W6RStIyowZDAQGav8iSHJQFdZmRHkrkmM+U
 eI7+WDAZ11uwMq0RQ+bSaOKRc0LNq5ds/qYOs+8F+iHXkbWxHnlS/8sElOZzTlKelvczzZbtbHO
 TKIPHrl9L1ttmZ5KFDwTITyg+Uuz68=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F483C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8LTYiOLJvNsgt8gdMUUjMnEM8QArx1SJKbmCPMdeBw=; b=hU4Xfk+MGKI0e0
	ngqkBVWLC8DhPWyfMkQm0+szqArg7dlMS1sxI5Dk3kYwLKHVKnoAE8RPGjllmBA7iVd9xLQWFMjV5
	pdY2zeiqHLvduMVR70M6ByEuCctXZw1/vbdWbAfbb28VYApXNyWySpdo01rS8IV8VLKPSvpsiyNJB
	c/s3ikrYQSc/fVKpWQI+I/yajwvj1KTykQpobNeOIE3kraXegjwye1U6J+AclphChKCPM7lMRHjAp
	9ASk/f0kMfdtHp2Yay+m2df1lQS6jOElZ4TirLolUaz6us/MgGr4GLVIkw+GeqiYX14vp+daNrH29
	FJNR9NEN1jJugPUex+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fTm-0068vM-UV; Thu, 01 Dec 2022 09:03:38 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fTA-00687g-3O
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 09:03:03 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0EF8B24E0B4;
	Thu,  1 Dec 2022 17:02:07 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 17:02:06 +0800
Received: from wyh-VirtualBox.starfivetech.com (171.223.208.138) by
 EXMBX173.cuchost.com (172.16.6.93) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 1 Dec 2022 17:02:05 +0800
From: Yanhong Wang <yanhong.wang@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: [PATCH v1 4/7] net: phy: motorcomm: Add YT8531 phy support
Date: Thu, 1 Dec 2022 17:02:39 +0800
Message-ID: <20221201090242.2381-5-yanhong.wang@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_010300_475241_C3A393DA 
X-CRM114-Status: GOOD (  21.61  )
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

This adds basic support for the Motorcomm YT8531
Gigabit Ethernet PHY.

Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
---
 drivers/net/phy/Kconfig     |   3 +-
 drivers/net/phy/motorcomm.c | 185 ++++++++++++++++++++++++++++++++++++
 2 files changed, 187 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index c57a0262fb64..86399254d9ff 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -258,9 +258,10 @@ config MICROSEMI_PHY
 
 config MOTORCOMM_PHY
 	tristate "Motorcomm PHYs"
+	default SOC_STARFIVE
 	help
 	  Enables support for Motorcomm network PHYs.
-	  Currently supports the YT8511 gigabit PHY.
+	  Currently supports the YT8511 and YT8531 gigabit PHYs.
 
 config NATIONAL_PHY
 	tristate "National Semiconductor PHYs"
diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index 7e6ac2c5e27e..7f3e22879399 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -3,13 +3,17 @@
  * Driver for Motorcomm PHYs
  *
  * Author: Peter Geis <pgwipeout@gmail.com>
+ *
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/phy.h>
 
 #define PHY_ID_YT8511		0x0000010a
+#define PHY_ID_YT8531		0x4f51e91b
 
 #define YT8511_PAGE_SELECT	0x1e
 #define YT8511_PAGE		0x1f
@@ -17,6 +21,10 @@
 #define YT8511_EXT_DELAY_DRIVE	0x0d
 #define YT8511_EXT_SLEEP_CTRL	0x27
 
+#define YTPHY_EXT_SMI_SDS_PHY		0xa000
+#define YTPHY_EXT_CHIP_CONFIG		0xa001
+#define YTPHY_EXT_RGMII_CONFIG1	0xa003
+
 /* 2b00 25m from pll
  * 2b01 25m from xtl *default*
  * 2b10 62.m from pll
@@ -38,6 +46,34 @@
 #define YT8511_DELAY_FE_TX_EN	(0xf << 12)
 #define YT8511_DELAY_FE_TX_DIS	(0x2 << 12)
 
+struct ytphy_reg_field {
+	char *name;
+	u32 mask;
+	u8	dflt;	/* Default value */
+};
+
+struct ytphy_priv_t {
+	u32 tx_inverted_1000;
+	u32 tx_inverted_100;
+	u32 tx_inverted_10;
+};
+
+static const struct ytphy_reg_field ytphy_rxtxd_grp[] = {
+	{ "rx_delay_sel", GENMASK(13, 10), 0x0 },
+	{ "tx_delay_sel_fe", GENMASK(7, 4), 0xf },
+	{ "tx_delay_sel", GENMASK(3, 0), 0x1 }
+};
+
+static const struct ytphy_reg_field ytphy_txinver_grp[] = {
+	{ "tx_inverted_1000", BIT(14), 0x0 },
+	{ "tx_inverted_100", BIT(14), 0x0 },
+	{ "tx_inverted_10", BIT(14), 0x0 }
+};
+
+static const struct ytphy_reg_field ytphy_rxden_grp[] = {
+	{ "rxc_dly_en", BIT(8), 0x1 }
+};
+
 static int yt8511_read_page(struct phy_device *phydev)
 {
 	return __phy_read(phydev, YT8511_PAGE_SELECT);
@@ -48,6 +84,33 @@ static int yt8511_write_page(struct phy_device *phydev, int page)
 	return __phy_write(phydev, YT8511_PAGE_SELECT, page);
 };
 
+static int ytphy_read_ext(struct phy_device *phydev, u32 regnum)
+{
+	int ret;
+	int val;
+
+	ret = __phy_write(phydev, YT8511_PAGE_SELECT, regnum);
+	if (ret < 0)
+		return ret;
+
+	val = __phy_read(phydev, YT8511_PAGE);
+
+	return val;
+}
+
+static int ytphy_write_ext(struct phy_device *phydev, u32 regnum, u16 val)
+{
+	int ret;
+
+	ret = __phy_write(phydev, YT8511_PAGE_SELECT, regnum);
+	if (ret < 0)
+		return ret;
+
+	ret = __phy_write(phydev, YT8511_PAGE, val);
+
+	return ret;
+}
+
 static int yt8511_config_init(struct phy_device *phydev)
 {
 	int oldpage, ret = 0;
@@ -111,6 +174,116 @@ static int yt8511_config_init(struct phy_device *phydev)
 	return phy_restore_page(phydev, oldpage, ret);
 }
 
+static int ytphy_config_init(struct phy_device *phydev)
+{
+	struct device_node *of_node;
+	u32 val;
+	u32 mask;
+	u32 cfg;
+	int ret;
+	int i = 0;
+
+	of_node = phydev->mdio.dev.of_node;
+	if (of_node) {
+		ret = of_property_read_u32(of_node, ytphy_rxden_grp[0].name, &cfg);
+		if (!ret) {
+			mask = ytphy_rxden_grp[0].mask;
+			val = ytphy_read_ext(phydev, YTPHY_EXT_CHIP_CONFIG);
+
+			/* check the cfg overflow or not */
+			cfg = cfg > mask >> (ffs(mask) - 1) ? mask : cfg;
+
+			val &= ~mask;
+			val |= FIELD_PREP(mask, cfg);
+			ytphy_write_ext(phydev, YTPHY_EXT_CHIP_CONFIG, val);
+		}
+
+		val = ytphy_read_ext(phydev, YTPHY_EXT_RGMII_CONFIG1);
+		for (i = 0; i < ARRAY_SIZE(ytphy_rxtxd_grp); i++) {
+			ret = of_property_read_u32(of_node, ytphy_rxtxd_grp[i].name, &cfg);
+			if (!ret) {
+				mask = ytphy_rxtxd_grp[i].mask;
+
+				/* check the cfg overflow or not */
+				cfg = cfg > mask >> (ffs(mask) - 1) ? mask : cfg;
+
+				val &= ~mask;
+				val |= cfg << (ffs(mask) - 1);
+			}
+		}
+		return ytphy_write_ext(phydev, YTPHY_EXT_RGMII_CONFIG1, val);
+	}
+
+	phydev_err(phydev, "Get of node fail\n");
+
+	return -EINVAL;
+}
+
+static void ytphy_link_change_notify(struct phy_device *phydev)
+{
+	u32 val;
+	struct ytphy_priv_t *ytphy_priv = phydev->priv;
+
+	if (phydev->speed < 0)
+		return;
+
+	val = ytphy_read_ext(phydev, YTPHY_EXT_RGMII_CONFIG1);
+	switch (phydev->speed) {
+	case SPEED_1000:
+		val  &= ~ytphy_txinver_grp[0].mask;
+		val |= FIELD_PREP(ytphy_txinver_grp[0].mask,
+				ytphy_priv->tx_inverted_1000);
+		break;
+
+	case SPEED_100:
+		val  &= ~ytphy_txinver_grp[1].mask;
+		val |= FIELD_PREP(ytphy_txinver_grp[1].mask,
+				ytphy_priv->tx_inverted_100);
+		break;
+
+	case SPEED_10:
+		val  &= ~ytphy_txinver_grp[2].mask;
+		val |= FIELD_PREP(ytphy_txinver_grp[2].mask,
+				ytphy_priv->tx_inverted_10);
+		break;
+
+	default:
+		break;
+	}
+
+	ytphy_write_ext(phydev, YTPHY_EXT_RGMII_CONFIG1, val);
+}
+
+static int yt8531_probe(struct phy_device *phydev)
+{
+	struct ytphy_priv_t *priv;
+	const struct device_node *of_node;
+	u32 val;
+	int ret;
+
+	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	of_node = phydev->mdio.dev.of_node;
+	if (of_node) {
+		ret = of_property_read_u32(of_node, ytphy_txinver_grp[0].name, &val);
+		if (!ret)
+			priv->tx_inverted_1000 = val;
+
+		ret = of_property_read_u32(of_node, ytphy_txinver_grp[1].name, &val);
+		if (!ret)
+			priv->tx_inverted_100 = val;
+
+		ret = of_property_read_u32(of_node, ytphy_txinver_grp[2].name, &val);
+		if (!ret)
+			priv->tx_inverted_10 = val;
+	}
+	phydev->priv = priv;
+
+	return 0;
+}
+
 static struct phy_driver motorcomm_phy_drvs[] = {
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_YT8511),
@@ -120,6 +293,17 @@ static struct phy_driver motorcomm_phy_drvs[] = {
 		.resume		= genphy_resume,
 		.read_page	= yt8511_read_page,
 		.write_page	= yt8511_write_page,
+	}, {
+		PHY_ID_MATCH_EXACT(PHY_ID_YT8531),
+		.name		= "YT8531 Gigabit Ethernet",
+		.probe		= yt8531_probe,
+		.config_init	= ytphy_config_init,
+		.read_status	= genphy_read_status,
+		.suspend	= genphy_suspend,
+		.resume		= genphy_resume,
+		.read_page	= yt8511_read_page,
+		.write_page	= yt8511_write_page,
+		.link_change_notify = ytphy_link_change_notify,
 	},
 };
 
@@ -131,6 +315,7 @@ MODULE_LICENSE("GPL");
 
 static const struct mdio_device_id __maybe_unused motorcomm_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(PHY_ID_YT8511) },
+	{ PHY_ID_MATCH_EXACT(PHY_ID_YT8531) },
 	{ /* sentinal */ }
 };
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

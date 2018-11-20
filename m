From: schwab@suse.de (Andreas Schwab)
Date: Tue, 20 Nov 2018 14:48:37 +0100
Subject: [PATCH] net: phy: mscc: fix locking in vsc85xx_default_config
In-Reply-To: <mvm8t1pazea.fsf@suse.de> (Andreas Schwab's message of "Mon, 19
 Nov 2018 15:57:17 +0100")
References: <20181008100728.24959-1-quentin.schulz@bootlin.com>
 <20181008100728.24959-2-quentin.schulz@bootlin.com>
 <mvm8t1pazea.fsf@suse.de>
Message-ID: <mvma7m3n9l6.fsf_-_@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Don't use locking phy_read/phy_write functions while inside
phy_select_patch/phy_restore_page region.

Fixes: 6a0bfbbe20 ("net: phy: mscc: migrate to phy_select/restore_page functions")
Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 drivers/net/phy/mscc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mscc.c b/drivers/net/phy/mscc.c
index a2e59f4f6f..a398ab9410 100644
--- a/drivers/net/phy/mscc.c
+++ b/drivers/net/phy/mscc.c
@@ -814,10 +814,10 @@ static int vsc85xx_default_config(struct phy_device *phydev)
 	if (rc < 0)
 		goto out_unlock;
 
-	reg_val = phy_read(phydev, MSCC_PHY_RGMII_CNTL);
+	reg_val = __phy_read(phydev, MSCC_PHY_RGMII_CNTL);
 	reg_val &= ~(RGMII_RX_CLK_DELAY_MASK);
 	reg_val |= (RGMII_RX_CLK_DELAY_1_1_NS << RGMII_RX_CLK_DELAY_POS);
-	phy_write(phydev, MSCC_PHY_RGMII_CNTL, reg_val);
+	__phy_write(phydev, MSCC_PHY_RGMII_CNTL, reg_val);
 
 out_unlock:
 	rc = phy_restore_page(phydev, rc, rc > 0 ? 0 : rc);
-- 
2.19.1


-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

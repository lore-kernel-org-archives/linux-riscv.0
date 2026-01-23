Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDFAD6CFBB
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 03:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=07sLuoGsNzGKur0hyg1qlZCecAROjwAlZDFJzQwKODQ=; b=BLVt6uDwY3NX64
	CugC8jlKzcnnWkhj+4kdEROksaZ4En+lMn6XltAIuyReTLifkfOMOChBkChlrHONRy6N72TBQqy5m
	3QdzNHljfkgmVQEIgnbvGnquib13/z2B15s1O5ztQLRPaAddqVvVnd9FV2NVG262KjBXXPIpN8m8z
	6XzbFWxlakV5lcM2OJFwXT+t9UoTsdPx64enbGEFXal/sHFd77Y8pWOo3Z3aXRbkbjfsSpudB1hho
	xR4LIkliPANsEvhgFfcmWJ8kXIfonR9sraViRasX1MVotW5Q2ZNHXJkLJ7nnSpep3iIbfniVOFm0M
	W7jUDjcU783J5YjEVbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8E8-00000008AWA-1k1y;
	Fri, 23 Jan 2026 03:52:52 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj8E5-00000008AVW-1gp2
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 03:52:51 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowAB3HGh_8HJpaGXcBQ--.18963S2;
	Fri, 23 Jan 2026 11:52:33 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Fri, 23 Jan 2026 11:52:23 +0800
Subject: [PATCH net v3] net: spacemit: Check for netif_carrier_ok() in
 emac_stats_update()
MIME-Version: 1.0
Message-Id: <20260123-k1-ethernet-clarify-stat-timeout-v3-1-93b9df627e87@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAHbwcmkC/43PwW7DMAgA0F+JfJ4rQyKX9LT/mHYgNl6sLUlnu
 1GrKv9eK9thu1WcAPGAu8qSomR1au4qyRpzXOaatC+NciPPH6Kjr7lCg9YAGv0JWsooaZai3Re
 nGG46Fy66xEmWS9EeEYLzLTOTqsw5SYjXfcWbqlPq/aeY5PtS15XfzsBZtFumKZZT03HrB+4Ii
 NCQdMFaQiRjxHRoyR6p89h72K0x5rKk2/7CCjv2/LUr6BqGXOiRPAzta8yO84Hdwc07v+JfEp4
 gsZJHGwIwgCXf/ye3bXsAGSVarXYBAAA=
X-Change-ID: 20260120-k1-ethernet-clarify-stat-timeout-d221fcd3aaa8
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Yixun Lan <dlan@gentoo.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: qwCowAB3HGh_8HJpaGXcBQ--.18963S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF17Xw4rAF1rJw1fZw15CFg_yoWrWFW8p3
	yYvasaqr40kry0vFsIyr4UZrZ8Xa1fJFyUCFyay395WFn0y3WfAry8KayUKF1qvrWkuryY
	qr1UAa1DCF4DArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP0b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67
	AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU892-5UU
	UUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_195249_811962_132B5602 
X-CRM114-Status: GOOD (  17.83  )
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

Some PHYs stop the refclk for power saving, usually while link down.
This causes reading stats to time out.

Therefore, in emac_stats_update(), also don't update and reschedule if
!netif_carrier_ok(). But that means we could be missing later updates if
the link comes back up, so also reschedule when link up is detected in
emac_adjust_link().

While we're at it, improve the comments and error message prints around
this to reflect the better understanding of how this could happen.
Hopefully if this happens again on new hardware, these comments will
direct towards a solution.

Closes: https://lore.kernel.org/r/20260119141620.1318102-1-amadeus@jmu.edu.cn/
Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Co-developed-by: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
Changes in v3:
- Incorporated changes from Chukun to check for netif_carrier_ok().
  Reworded patch message to match. (Jakub)
- Link to v2: https://lore.kernel.org/r/20260121-k1-ethernet-clarify-stat-timeout-v2-1-76ff1a1168d9@iscas.ac.cn

Changes in v2:
- Add "Fixes" and retarget to net (Andrew)
- Link to v1: https://lore.kernel.org/r/20260120-k1-ethernet-clarify-stat-timeout-v1-1-108cf928d1b3@iscas.ac.cn
---
This has a conflict in context lines in emac_adjust_link() with current
net-next, which will show up when pulling that for next rc1. Just remove
"emac_set_fc_autoneg(priv);".
---
 drivers/net/ethernet/spacemit/k1_emac.c | 34 ++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 220eb5ce7583..88e9424d2d51 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -1099,7 +1099,13 @@ static int emac_read_stat_cnt(struct emac_priv *priv, u8 cnt, u32 *res,
 					100, 10000);
 
 	if (ret) {
-		netdev_err(priv->ndev, "Read stat timeout\n");
+		/*
+		 * This could be caused by the PHY stopping its refclk even when
+		 * the link is up, for power saving. See also comments in
+		 * emac_stats_update().
+		 */
+		dev_err_ratelimited(&priv->ndev->dev,
+				    "Read stat timeout. PHY clock stopped?\n");
 		return ret;
 	}
 
@@ -1147,17 +1153,25 @@ static void emac_stats_update(struct emac_priv *priv)
 
 	assert_spin_locked(&priv->stats_lock);
 
-	if (!netif_running(priv->ndev) || !netif_device_present(priv->ndev)) {
-		/* Not up, don't try to update */
+	/*
+	 * We can't read statistics if the interface is not up. Also, some PHYs
+	 * stop their reference clocks for link down power saving, which also
+	 * causes reading statistics to time out. Don't update and don't
+	 * reschedule in these cases.
+	 */
+	if (!netif_running(priv->ndev) ||
+	    !netif_carrier_ok(priv->ndev) ||
+	    !netif_device_present(priv->ndev)) {
 		return;
 	}
 
 	for (i = 0; i < sizeof(priv->tx_stats) / sizeof(*tx_stats); i++) {
 		/*
-		 * If reading stats times out, everything is broken and there's
-		 * nothing we can do. Reading statistics also can't return an
-		 * error, so just return without updating and without
-		 * rescheduling.
+		 * If reading stats times out anyway, the stat registers will be
+		 * stuck, and we can't really recover from that.
+		 *
+		 * Reading statistics also can't return an error, so just return
+		 * without updating and without rescheduling.
 		 */
 		if (emac_tx_read_stat_cnt(priv, i, &res))
 			return;
@@ -1636,6 +1650,12 @@ static void emac_adjust_link(struct net_device *dev)
 		emac_wr(priv, MAC_GLOBAL_CONTROL, ctrl);
 
 		emac_set_fc_autoneg(priv);
+
+		/*
+		 * Reschedule stats updates now that link is up. See comments in
+		 * emac_stats_update().
+		 */
+		mod_timer(&priv->stats_timer, jiffies);
 	}
 
 	phy_print_status(phydev);

---
base-commit: 4a3dba48188208e4f66822800e042686784d29d1
change-id: 20260120-k1-ethernet-clarify-stat-timeout-d221fcd3aaa8

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6902C44536
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 08:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TBkajqy2dtFe/qeyQFDuWILZlGLmksa9hESya+YuAl8=; b=g069fDaepcz2Pi
	nKRFr9Yy8PjWHL8E02lyV8hnNmBnTQ9cbmTovzBz4L+G7mUuzCCw+kYmxvZdk9D/lJL18pLQYi5sG
	WhTy29ktXbWpSBgiaQfwHiOLIrLXjhUHe4YI6tL514Beta6QQo0gDD3bGYttKzKnrslgpopiJGsB8
	CRDaNIRE/55LgvpJoDdJJCP//PDz4OI0Q1DbYlOmysW4gLrtoRGn8pgsZ5T2ayBUD51s9qK/rCxgF
	57nor5PG0RIxeg2ZoA3SFuh0rvqVaGRQ4JbUu911XSGwHufXA/U8/9H5fEzM7rnByLbmsWIJYVF9V
	Kf+SGEImkVpR4A9HeeQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipc4-00000006cXh-2toZ;
	Thu, 22 Jan 2026 08:00:20 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipc1-00000006cXG-21B5
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 08:00:19 +0000
Received: from localhost.localdomain (unknown [116.25.94.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 319205517;
	Thu, 22 Jan 2026 16:00:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>,
	Yixun Lan <dlan@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	netdev@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] net: spacemit: display phy driver information
Date: Thu, 22 Jan 2026 16:00:01 +0800
Message-Id: <20260122080001.73921-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Tid: 0a9be4b7c84003a2kunmc46be4a346813
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTx9IVklMGEMaGk1KTh5JT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_000017_693377_78EDDC64 
X-CRM114-Status: UNSURE (   6.14  )
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

Print the PHY driver used and interrupt status after connection.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/net/ethernet/spacemit/k1_emac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index c85dc742c404..afb5b6a61c2c 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -1568,6 +1568,7 @@ static int emac_phy_connect(struct net_device *ndev)
 	struct device *dev = &priv->pdev->dev;
 	struct phy_device *phydev;
 	struct device_node *np;
+	char *irq_str;
 	int ret;
 
 	ret = of_get_phy_mode(dev->of_node, &priv->phy_interface);
@@ -1610,6 +1611,11 @@ static int emac_phy_connect(struct net_device *ndev)
 		goto err_node_put;
 	}
 
+	irq_str = phy_attached_info_irq(phydev);
+	netdev_info(ndev, "PHY driver [%s] (irq=%s)\n",
+		    phydev->drv->name, irq_str);
+	kfree(irq_str);
+
 	phydev->mac_managed_pm = true;
 
 	emac_update_delay_line(priv);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

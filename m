Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F86E7C70D
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Feb 2026 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iiSxL01HZTqdAy0M3gzdoSH97sjYWJ8qccAJsPOJk5w=; b=HNUVoxoowOgu19
	H6zdnYeaQgtaNf8i/vGCG3sIhTPaUwVlXA9Gsr/joAVilSyrb6DS+iJoguUvRsp945KlmUlzfO9WE
	D2XaufxNoKOR/SRFLDIJQOwcyfccsS/+/wEz1e7muG5Cth2vapBhB81+7A36SAdZoR21iBBQDo3vZ
	sRLjMKNkFueVq5pN9rPQ3E2P4KuZWn+VKI2Nu81oZ5532FioWiQ2KjSVJdI3Enw0vzyhEkhfk30Rv
	XKUTnES8GmSilGF/Vl9I+2ochyuRAukHeyxb/lW9dMPl8p61llmx4qOgccoXFwTvtavZjiJvmBxy7
	wpGDM45TG4xzDGqIrAHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmUGj-00000003PXJ-1Jbr;
	Sun, 01 Feb 2026 10:01:25 +0000
Received: from mail-m82213679.xmail.ntesmail.com ([8.221.36.79])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmUGc-00000003PVt-3okN
	for linux-riscv@lists.infradead.org;
	Sun, 01 Feb 2026 10:01:23 +0000
Received: from localhost.localdomain (unknown [116.25.95.150])
	by smtp.qiye.163.com (Hmail) with ESMTP id 32b14fae9;
	Sun, 1 Feb 2026 18:01:03 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH v2 1/1] net: spacemit: display phy driver information
Date: Sun,  1 Feb 2026 18:00:01 +0800
Message-Id: <20260201100001.33102-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Tid: 0a9c18a6168503a2kunme4974dd01a937e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGkwfVk0fTUhLTBlLTh5MH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSk5LWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_020119_363024_7D07BBF5 
X-CRM114-Status: UNSURE (   6.30  )
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
Changes in v2:
- Simplify using phy_attached_info()
- Link to v1: https://lore.kernel.org/lkml/20260122080001.73921-1-amadeus@jmu.edu.cn/
---
 drivers/net/ethernet/spacemit/k1_emac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index c85dc742c404..b308e97d6bf2 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -1614,6 +1614,8 @@ static int emac_phy_connect(struct net_device *ndev)
 
 	emac_update_delay_line(priv);
 
+	phy_attached_info(phydev);
+
 err_node_put:
 	of_node_put(np);
 	return ret;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

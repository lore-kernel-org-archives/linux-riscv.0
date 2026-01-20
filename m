Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E04FD2ED0F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0UjP7qpgRk4UX7Td91u5zuufNKznQq+FbhOzr6IccKA=; b=ak6Z3r9ePc1TKS
	xACdR0tlSYtLC45Se4cqSsX/UpPwMeRrgO4TXOmy2UMmH1eT7E9gkIVBIM61MFIBb+IRu9c8V5GKw
	Em3tHjvVhdHQ7+v/ol052rewc0oVE05GXVWlRT08/Y1566QP3mo4BQs48VUhy+ezGifGe/AB2P+cL
	QJTHKhi8AdJ8hfMBiOFu8BOHrjtkIPzcpkNae8aviVkT19+t+sk+1NFV7lQj2PVQNGeWHZKh0Zi6k
	jO+Hu8mQmJ2ChxCKF58hqP3xyiIhiwKzTJtLjHxMy0FpUn3BqTaOLfpl31m7nbZnodmwZo2LQaYYX
	rOOwZMkogVk3f4tDUJpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3DX-00000003BUz-2v1c;
	Tue, 20 Jan 2026 04:19:49 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3DK-00000003BRs-3NhN
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:19:45 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowACXKAxPAm9pZCG3BQ--.23154S2;
	Tue, 20 Jan 2026 12:19:28 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 20 Jan 2026 12:19:23 +0800
Subject: [PATCH net-next] net: spacemit: Clarify stat timeout comments and
 messages
MIME-Version: 1.0
Message-Id: <20260120-k1-ethernet-clarify-stat-timeout-v1-1-108cf928d1b3@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAEoCb2kC/y2N3QqCQBBGX0Xmugl3AylfJQqmdcyhXGt2FEN89
 7afy8Ph+84CiVU4QV0soDxJkiFmcJsCQkfxyihNZvClr0rnS7w5ZOtYIxuGO6m0L0xGhiY9D6N
 h471rQ7Mjoj3km4dyK/M3cYTPKvJscPoZ5eeYm/bXF0qMYeh7sbqYqq07oAZ3XlY4resbjlthk
 awAAAA=
X-Change-ID: 20260120-k1-ethernet-clarify-stat-timeout-d221fcd3aaa8
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Yixun Lan <dlan@gentoo.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID: zQCowACXKAxPAm9pZCG3BQ--.23154S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF17KrykAF47AFy7AF4DXFb_yoW5CrWDp3
	yYkasavr1ktF4YvFsrAr4UJw1fZw4vgFyUuFnFy395ZFn8tFy8Xr10kFWj9FyqkrW8WryY
	qr4UCFs8CF4DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gryl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnBTYUUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_201940_920773_A5BA6BEA 
X-CRM114-Status: GOOD (  20.61  )
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

Someone did run into this timeout in the wild [1], and it turns out to
be related to the PHY reference clock stopping.

Improve the comments and error message prints around this to reflect the
better understanding of how this could happen. This patch doesn't fix
the problem, but should direct anyone running into it in the future to
know it is probably a PHY problem, and have a better idea what to do.

Link: https://lore.kernel.org/r/20260119141620.1318102-1-amadeus@jmu.edu.cn/ # [1]
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
* Chukun: If you think changing the DTS for the PHY is appropriate, you
can send the DTS patch separately - that one should go through the
spacemit SoC tree.

FWIW, the same timeout thing also happens on the vendor provided OS
images for the OrangePi RV2, and AFAICT at least the statistics part is
not recoverable.

So until/unless we manage to get more information on how this works
under the hood, I think we just don't bother handling the case where the
PHY can just stop running, since the hardware certainly doesn't seem to
expect it.
---
 drivers/net/ethernet/spacemit/k1_emac.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 220eb5ce7583..387f26ff7714 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -1099,7 +1099,14 @@ static int emac_read_stat_cnt(struct emac_priv *priv, u8 cnt, u32 *res,
 					100, 10000);
 
 	if (ret) {
-		netdev_err(priv->ndev, "Read stat timeout\n");
+		/*
+		 * If you run into this, one possibility is that even though the
+		 * interface is up the PHY may have stopped its clock anyway for
+		 * power saving. This MAC doesn't like that, so configure your
+		 * PHY to not do that.
+		 */
+		dev_err_ratelimited(&priv->ndev->dev,
+				    "Read stat timeout. PHY clock stopped?\n");
 		return ret;
 	}
 
@@ -1148,16 +1155,20 @@ static void emac_stats_update(struct emac_priv *priv)
 	assert_spin_locked(&priv->stats_lock);
 
 	if (!netif_running(priv->ndev) || !netif_device_present(priv->ndev)) {
-		/* Not up, don't try to update */
+		/*
+		 * Not up, don't try to update. If the PHY is stopped, reading
+		 * stats would time out.
+		 */
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

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260120-k1-ethernet-clarify-stat-timeout-d221fcd3aaa8

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D74D262AD
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 02:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+q3wjkfggWdPViig/Zjct4EeHRJ/qeIF5tFgjnR4ATY=; b=ezLD8BzK38pUe8
	78EO68p1PQeD0IajXT9YSgy8BcYKyfrFknNKTdtq4qgi4X7mRwqfyJmwlh08TwzH3ZLxw8IwXZLxX
	9COf1zjs+f1M2jVnQJiHjqYFDwEQCOZZTxyx5vZgACMKhCWvGpM13TZwumdrscrruEZaNMX3vVGd8
	5mUCHEOhpeCYLvoegIG+ujQfaQAmMky7M3YMosJ6EMG47mo5GqxzpeYSYRJ1NeeXWchlHh/9wGGL4
	qXxkmAzMAqsaby9QzxAc5qp7e8yojDVCQeAwl89eulUkvZeJoZD2U7162yyQo5L2pn/3vOHlBUQJq
	y+y9rziP7CgQwCdfbBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNmq-00000004lXM-1eJG;
	Wed, 21 Jan 2026 02:17:36 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNmm-00000004lW6-2Vw7
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 02:17:35 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowADH5NswN3BpnmUNBg--.11234S2;
	Wed, 21 Jan 2026 10:17:21 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 21 Jan 2026 10:17:18 +0800
Subject: [PATCH net v2] net: spacemit: Clarify stat timeout comments and
 messages
MIME-Version: 1.0
Message-Id: <20260121-k1-ethernet-clarify-stat-timeout-v2-1-76ff1a1168d9@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAC03cGkC/42PS27DMAxEr2JoHQWU/ImdVe5RZEFRVE00thNJM
 RoEvnsFtwcouJoh+Gb4VomjcFLn6q0ir5JkmYuwh0rRiPMna/FFKwu2A2NBfxnNeeQ4c9Z0wyj
 hpVPGrLNMvDyz9taaQL5GxF4VzD1ykO894kOVK3X9NSM/niUu/20cJta0TJPkc4VDaE7QDg21g
 M54H2zrrEEAwsbXpuugPYXa7axRUl7ia39hNTvs/21Xo8tAT2GwvTeuvkgiTEekI83qum3bD8q
 D2vUjAQAA
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
X-CM-TRANSID: rQCowADH5NswN3BpnmUNBg--.11234S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF13AFyxKFyDKw4UtFW8JFb_yoW5Wry5p3
	yYyasavry8tr4avFsFvr4UXws5Za1vgFyUuF12y3yrXFn0yF18Ar10kFWY9ryqkrW8WryY
	qr4UAan8CF4DA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_181733_011080_CFF65C4E 
X-CRM114-Status: GOOD (  16.62  )
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
better understanding of how this could happen.

This patch isn't a fix for the problem per se, since it is hardware
behavior. The new message and comments, however, should direct those
running into this on new hardware towards a fix.

Link: https://lore.kernel.org/r/20260119141620.1318102-1-amadeus@jmu.edu.cn/ # [1]
Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
Changes in v2:
- Add "Fixes" and retarget to net (Andrew)
- Link to v1: https://lore.kernel.org/r/20260120-k1-ethernet-clarify-stat-timeout-v1-1-108cf928d1b3@iscas.ac.cn
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
base-commit: a9f470594c50ab1ddf25b21a00ca4d3166057f3b
change-id: 20260120-k1-ethernet-clarify-stat-timeout-d221fcd3aaa8

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

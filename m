Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A887D3566C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 04:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vm/h350qhveSHNrl3KA+Y9a28xx7V5T4oHL53EP7puM=; b=wvUnPFo73suW/m
	uZb+WlhABApJTEc+RT63pnADIgDGs5M0yU8g41D5ZajUIzy2yl/jhscIE4ohT3tUBv1XzL6MyMpkR
	+aNeP7QaJtaJbdpl/iciHNxjvNo9mvvRInjqZBOLQGrdMTiaWKhfmy4PxFQoVK7DT4VvwCUZHqp/h
	qrCPa4N+lqWJzBtWGp0xoANVkVh8EJhjA8qhZoUOrEctz2O95AyPW8rTDQuM4pxtop4oO1N2YteMG
	UW+HCRM6wKBM287IhRNKOqmJbYcJlN45cmqbvfibLEUXYC6SH+SifavtdZPUFtQYwebZoC+BDa9/r
	4yfb6Mw8B5axkF9Jppdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlJeu-0000000HEn5-0w39;
	Thu, 29 Jan 2026 04:29:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlJer-0000000HEmK-2R95
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 04:29:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-480706554beso5149855e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 20:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769660966; x=1770265766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLsfEdXp1ghYI/zV3x1liW6kVNIuPDvLp5lPLO4doYE=;
        b=lsak3BBBl97tRD0raqFzAPmfj3vXirJ03kkHH4UgLjzxvHIqz+z0x9FKud/WO5q0O8
         2TRtQ5k9kahcnEr8GoWRvrUsFoZ98yvqXV3yeSRJHex5qd0Oylf2hytzfXpcrQPmadcc
         6llLPArPceXoUGAzvJxYrd/+vTLm6/2nsuXK4Kqo3w9WR8CFS9u1RVG5rFgrPgJVowH+
         T0aUMxq9lTk7XoHPrtQKaM/M0e2wdmVnUfokzQX8hks+pFKhbCDlGV4q5G68jOHN8fv9
         4eDBaF6tMim+5o3LMSCH63MTbTKH1KksQIiX6zU1EEGI2sei5SL07clXbwAD2/bqifcQ
         HDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769660966; x=1770265766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLsfEdXp1ghYI/zV3x1liW6kVNIuPDvLp5lPLO4doYE=;
        b=TOoBYXcvrOFGiNk1XdaclokB5fTOFsrNciYZMt9kWArXAJPRJ8n6f+cZUdU8BaPZeB
         QLIJ8QtgPfT29ZibTyOFzlK/NcvmTXoqChM8hTApHrymwNn8sSABuR2gAIeLAz2ysQ2o
         49FoiJFS+NAaMkAryNAbFXjusa60USRK65BXOQ10fbNC46Xa799mo4/8o+38KcHyPUq3
         w+6GNHNxc860TQ6T4MS/Iu8nToK8uoUMXvzfhoXb6DMl/pn8PQ4Lp8eKJyLL6GQZx1JN
         QDdiq2u/1x0Li0TiT1LXz/utOL2uksffdOM7NtaneKWJEecD6sGDIdvjhPMXUuyala3v
         MkGA==
X-Gm-Message-State: AOJu0YxlhAlfW8g9+98pRY0q2PgSm1hvhOYufC9W4U+rYboWgZ9o/qaZ
	mr1ORwKuDxjYwWoTo/WbdEYQJOFRovtiTXPFtRKPWHGC6Z1mCVz+ol8=
X-Gm-Gg: AZuq6aJK5/Jc18xiomvlT2uysmtml7HCvJqAE56Q46Z/qDChIRqK1Qd6rE/Iqz6c7Tu
	3xzYJXgiT2n4Owia9MKJnJ3VFn3tun9HUVUfHWTxkWIizmnmCvqNp0QoQi4b3iBhsu0cgYZdEJa
	y9gwPuXvOf+okYiBSqOoIbWb/ch4gB/3rVCBbdy+0xYSmmyaR9zCGaIe5MNdh7uf2qSNqnrhbM5
	TcYC6/qGzJlzbC5YgqTDNv+9N9P96IwDYce+zlxg8bQMsCkVxOgkhfjHRGc5LPEBpjt0vcsRA+Z
	GOAa840zRqkeuZzBODuwtOn4XE9+1/O+JiSF8/f6uq94IrRe0GzmdST4Jb7DkMqQXChDg1iMYGl
	HEC6rwiPI9Ube6S7oFDGlHf+53a0Vtsw/l1+oJjiDNOT9cBXqDUzHwCMb1sloJJwl8rGQoFG36m
	b6f78H
X-Received: by 2002:a05:600c:468c:b0:46e:59bd:f7d3 with SMTP id 5b1f17b1804b1-48069c54167mr87577045e9.20.1769660965693;
        Wed, 28 Jan 2026 20:29:25 -0800 (PST)
Received: from localhost ([2a02:169:c218:1:5130:f7b6:9c17:fb83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e474csm11650096f8f.2.2026.01.28.20.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 20:29:23 -0800 (PST)
From: Tomas Hlavacek <tmshlvck@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	dlan@kernel.org,
	wangruikang@iscas.ac.cn,
	Tomas Hlavacek <tmshlvck@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] net: spacemit: k1-emac: fix jumbo frame support
Date: Thu, 29 Jan 2026 05:29:08 +0100
Message-ID: <20260129042908.410326-1-tmshlvck@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_202929_661970_B20D7E29 
X-CRM114-Status: GOOD (  13.80  )
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

The driver never programs the MAC frame size and jabber registers,
causing the hardware to reject frames larger than the default 1518
bytes even when larger DMA buffers are allocated.

Program MAC_MAXIMUM_FRAME_SIZE, MAC_TRANSMIT_JABBER_SIZE, and
MAC_RECEIVE_JABBER_SIZE based on the configured MTU. Also fix the
maximum buffer size from 4096 to 4095, since the descriptor buffer
size field is only 12 bits. Account for double VLAN tags in frame
size calculations.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Cc: stable@vger.kernel.org
Signed-off-by: Tomas Hlavacek <tmshlvck@gmail.com>
---
v3:
- Set all three frame/jabber registers, fix 12-bit buffer size field
  overflow, use actual frame size with VLAN headroom consistently.

v2: https://lore.kernel.org/netdev/20260126171449.83288-1-tmshlvck@gmail.com/
- Added Fixes tag and Cc stable.

v1: https://lore.kernel.org/netdev/20260126135919.77168-1-tmshlvck@gmail.com/
---
 drivers/net/ethernet/spacemit/k1_emac.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 220eb5ce7583..cd6879d7434c 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -12,6 +12,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/etherdevice.h>
 #include <linux/ethtool.h>
+#include <linux/if_vlan.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -38,7 +39,7 @@
 
 #define EMAC_DEFAULT_BUFSIZE		1536
 #define EMAC_RX_BUF_2K			2048
-#define EMAC_RX_BUF_4K			4096
+#define EMAC_RX_BUF_MAX			FIELD_MAX(RX_DESC_1_BUFFER_SIZE_1_MASK)
 
 /* Tuning parameters from SpacemiT */
 #define EMAC_TX_FRAMES			64
@@ -202,8 +203,7 @@ static void emac_init_hw(struct emac_priv *priv)
 {
 	/* Destination address for 802.3x Ethernet flow control */
 	u8 fc_dest_addr[ETH_ALEN] = { 0x01, 0x80, 0xc2, 0x00, 0x00, 0x01 };
-
-	u32 rxirq = 0, dma = 0;
+	u32 rxirq = 0, dma = 0, frame_sz;
 
 	regmap_set_bits(priv->regmap_apmu,
 			priv->regmap_apmu_offset + APMU_EMAC_CTRL_REG,
@@ -228,6 +228,15 @@ static void emac_init_hw(struct emac_priv *priv)
 		DEFAULT_TX_THRESHOLD);
 	emac_wr(priv, MAC_RECEIVE_PACKET_START_THRESHOLD, DEFAULT_RX_THRESHOLD);
 
+	/* Set maximum frame size and jabber size based on configured MTU,
+	 * accounting for Ethernet header, double VLAN tags, and FCS.
+	 */
+	frame_sz = priv->ndev->mtu + ETH_HLEN + 2 * VLAN_HLEN + ETH_FCS_LEN;
+
+	emac_wr(priv, MAC_MAXIMUM_FRAME_SIZE, frame_sz);
+	emac_wr(priv, MAC_TRANSMIT_JABBER_SIZE, frame_sz);
+	emac_wr(priv, MAC_RECEIVE_JABBER_SIZE, frame_sz);
+
 	/* Configure flow control (enabled in emac_adjust_link() later) */
 	emac_set_mac_addr_reg(priv, fc_dest_addr, MAC_FC_SOURCE_ADDRESS_HIGH);
 	emac_wr(priv, MAC_FC_PAUSE_HIGH_THRESHOLD, DEFAULT_FC_FIFO_HIGH);
@@ -924,14 +933,14 @@ static int emac_change_mtu(struct net_device *ndev, int mtu)
 		return -EBUSY;
 	}
 
-	frame_len = mtu + ETH_HLEN + ETH_FCS_LEN;
+	frame_len = mtu + ETH_HLEN + 2 * VLAN_HLEN + ETH_FCS_LEN;
 
 	if (frame_len <= EMAC_DEFAULT_BUFSIZE)
 		priv->dma_buf_sz = EMAC_DEFAULT_BUFSIZE;
 	else if (frame_len <= EMAC_RX_BUF_2K)
 		priv->dma_buf_sz = EMAC_RX_BUF_2K;
 	else
-		priv->dma_buf_sz = EMAC_RX_BUF_4K;
+		priv->dma_buf_sz = EMAC_RX_BUF_MAX;
 
 	ndev->mtu = mtu;
 
@@ -2005,7 +2014,7 @@ static int emac_probe(struct platform_device *pdev)
 	ndev->hw_features = NETIF_F_SG;
 	ndev->features |= ndev->hw_features;
 
-	ndev->max_mtu = EMAC_RX_BUF_4K - (ETH_HLEN + ETH_FCS_LEN);
+	ndev->max_mtu = EMAC_RX_BUF_MAX - (ETH_HLEN + 2 * VLAN_HLEN + ETH_FCS_LEN);
 	ndev->pcpu_stat_type = NETDEV_PCPU_STAT_DSTATS;
 
 	priv = netdev_priv(ndev);
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

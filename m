Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BD2D49C9A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 10:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vm/h350qhveSHNrl3KA+Y9a28xx7V5T4oHL53EP7puM=; b=YEQCgDyu427px1
	KlE68CWD6rDAVFbc2R9M1XWi0ltQp4pP7rYLO52Tx/njG9pPJZPs9aNuFo1EW8Zg89JOOubrfLZ/u
	inbl508ZziqQVae0vYQaGa9OW3JQ93+irAVdojk+MLZP7OaxYDYeJRaBnC/OgvKk2YKo+3v3FLOVj
	kTTAyjbIL5kIvu255oAk7EaRC85mheLFSirMtYHGFT/cgWlk5ot63BesfU+ata+LHiKFFM17kJOwe
	xi8/16jS7nyatK5D3zgcW3fof0I2a/kxQJVaWaNYX37DNwNrsh+MXRwDPkb0uMJYU6Wlora/Ggl20
	4ms8qJ9ToDKmOMiUqiYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllee-00000001JvR-21zX;
	Fri, 30 Jan 2026 10:23:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllec-00000001Jv1-2FVK
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 10:23:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso17205125e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 02:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769768584; x=1770373384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLsfEdXp1ghYI/zV3x1liW6kVNIuPDvLp5lPLO4doYE=;
        b=L5koEfXk+DHBTfbVeMcq70rcmiskvjWWPjM368e7SYEJx3kLHJQb6mzRJ2OHTQ3zZV
         +9luxSYNXwIHXvzvhVPQQz/adVIP8KfyskZF8CSITrEAI/EQxkkN/ANe/qJ8XrRhWw+n
         kp2QmPa9YAdOYQoB71VGSBaetel3BAOUlckWBZc/Zz9VFWUT67Kwdfd1IIUujoMG/bbX
         RA6488IJMk4lOIxDniUs2aj0N7huH4EoeJUzl6r70xchxy5Ip3KD3dpt6qo9nAG7NSMb
         rQqjH9kxAzjBJup8E2+uPRfT7uKWB3bYeWNRGHDjz1CWi3GoVxihgMTV7N/X43ozJlze
         +tQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769768584; x=1770373384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLsfEdXp1ghYI/zV3x1liW6kVNIuPDvLp5lPLO4doYE=;
        b=mKKYqDbw1qh/N+hddhFEMwX3Rhhbi3esSft78J53B3PVZKrho7D1gWkM84MMtsZ8BJ
         Ne3hAv7DwFYNpOhWGQ36PQrmyyrxed+nRM+jqPSerR9UvnJiEOu9VzIov9j2AWgRXv9Q
         ePDXqnwjfGugKElMRStTe5Orw82IOUWDMvDr1o0L4LdRFtmlrGg5M3Fc02jVNTIOiKgV
         2U09quqklpKDLJSR/2SZ/JWdzu78rbAZUusWuMULPPhGI8+7YDBLFMAUnUultMJifQ2t
         4QP7RnsBEWyEpVIbO5Wlr9WZpDoPoOxFhOQMMaxipVMtSKkeUQkODOGduxWn08uG+Zid
         OeMQ==
X-Gm-Message-State: AOJu0YzaWSp2fYan+nnzunwUS9dym3Hzg2DLAt0KfBtIqf/Odas6fdoG
	CkZLsfHBdTKYiYxtCBO71IuqgJpNh69lkyvrf/kWBJrtMOMf62NElnE=
X-Gm-Gg: AZuq6aIgPFnZGtUuhf9lALeY1y9rcklZj4bGq/kzSAnyK3Hz6TmGcNdIKQ0Gj40zVZV
	Oq7gZknspmSBORlQAL3ekVfqHmVZm5zdR9z5nQSg4kyFW7cH8s4DfNxbqxs+qqdCTZo4jyd2jqa
	nXDLVsWTQlZyzJRwlIu8O3b8O64VrSUX6r1Ur7dqAxQrGilNq6gGbxfk0gxNALap6GcNfDi8ttJ
	WthmModx46Jl925L83mC6lBqRg5QepTqoFtesRMNRRcWlTI8w8VdC2pnazUDOZugxGzBgxUXxKQ
	mcCLhIJBPYzzhrcY8e4WDAhYBLR4Ym4N4YVLim3m94JmDEd48FILAfTKx0pmqxGFHnpIMX00rLu
	ScZLIUOENDyx4aAOOxQ1JnWOxud7S5eAaBcJ1tHMWez9LTnRReJ6Nb8iDpwNUfEwFVYokI3znta
	z/Pf7P
X-Received: by 2002:a05:600c:354c:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-482db493a87mr25887295e9.15.1769768584156;
        Fri, 30 Jan 2026 02:23:04 -0800 (PST)
Received: from localhost ([2a02:169:c219:1:2541:8fc0:4fcf:ba6e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cddffc0sm230093875e9.5.2026.01.30.02.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:23:03 -0800 (PST)
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
	stable@vger.kernel.org,
	Tomas Hlavacek <tmshlvck@gmail.com>
Subject: [PATCH net v3] net: spacemit: k1-emac: fix jumbo frame support
Date: Fri, 30 Jan 2026 11:23:01 +0100
Message-ID: <20260130102301.477514-1-tmshlvck@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_022306_593050_90E40904 
X-CRM114-Status: GOOD (  14.11  )
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

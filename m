Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2E6CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 05:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gu8w68DoJ8caqO32Gqu/0slAOdPWpg72jL8NRv47nDY=; b=cq/+IOMkGTJm3I
	ONbeCCoMvv75j7+KfhfGGecIWO3S1IEsDKsUaAy1xCuuBT3PvPSUxSZ063qeDZY1sbM18nBZnsZdC
	rHsXi9hdu3ar14e+Kfwo5ly2NVBkSUo04W6wTeqzraQYtRor3LC9dCIC+qqdIWcxPjcaq1d01gYFP
	Vt/RKZTbK3ySHa7nWoGqqVOtPJkhqDequIgSio9YuCvL3snKlbO6VUv8x1aO+PLMc4RCRHSEGikIr
	N4iVB9qIo5oyGb5FcFfNnM3jOpRRgxSppkKlRg/Qm26FmRykWQQtrdc0DR942/iFt66hXzq3F8KM1
	0DzHBoTMnfFM/UjR922Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGSn-008Qzq-36;
	Mon, 16 Oct 2023 05:48:25 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGSl-008Qwm-2w;
	Mon, 16 Oct 2023 05:48:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Greg Ungerer <gerg@linux-m68k.org>,
	iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-m68k@lists.linux-m68k.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Jim Quinlan <james.quinlan@broadcom.com>
Subject: [PATCH 10/12] net: fec: use dma_alloc_noncoherent for data cache enabled coldfire
Date: Mon, 16 Oct 2023 07:47:52 +0200
Message-Id: <20231016054755.915155-11-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231016054755.915155-1-hch@lst.de>
References: <20231016054755.915155-1-hch@lst.de>
MIME-Version: 1.0
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

Coldfire platforms with data caches can't properly implement
dma_alloc_coherent and currently just return noncoherent memory from
dma_alloc_coherent.

The fec driver than works around this with a flush of all caches in the
receive path. Make this hack a little less bad by using the explicit
dma_alloc_noncoherent API and documenting the hacky cache flushes so
that the DMA API level hack can be removed.

Also replace the check for CONFIG_M532x for said hack with a check
for COLDFIRE && !COLDFIRE_COHERENT_DMA.  While m532x is the only such
platform with a fec module, this makes the code more consistent and
easier to follow.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/net/ethernet/freescale/fec_main.c | 86 ++++++++++++++++++++---
 1 file changed, 76 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 77c8e9cfb44562..3fc3444402622b 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -406,6 +406,70 @@ static void fec_dump(struct net_device *ndev)
 	} while (bdp != txq->bd.base);
 }
 
+/*
+ * Coldfire does not support DMA coherent allocations, and has historically used
+ * a band-aid with a manual flush in fec_enet_rx_queue.
+ */
+#if defined(CONFIG_COLDFIRE) && !defined(CONFIG_COLDFIRE_COHERENT_DMA)
+static void *fec_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
+		gfp_t gfp)
+{
+	return dma_alloc_noncoherent(dev, size, handle, DMA_BIDIRECTIONAL, gfp);
+}
+
+static void fec_dma_free(struct device *dev, size_t size, void *cpu_addr,
+		dma_addr_t handle)
+{
+	dma_free_noncoherent(dev, size, cpu_addr, handle, DMA_BIDIRECTIONAL);
+}
+#else /* CONFIG_COLDFIRE && !CONFIG_COLDFIRE_COHERENT_DMA */
+static void *fec_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
+		gfp_t gfp)
+{
+	return dma_alloc_coherent(dev, size, handle, gfp);
+}
+
+static void fec_dma_free(struct device *dev, size_t size, void *cpu_addr,
+		dma_addr_t handle)
+{
+	dma_free_coherent(dev, size, cpu_addr, handle);
+}
+#endif /* !CONFIG_COLDFIRE && !CONFIG_COLDFIRE_COHERENT_DMA */
+
+struct fec_dma_devres {
+	size_t		size;
+	void		*vaddr;
+	dma_addr_t	dma_handle;
+};
+
+static void fec_dmam_release(struct device *dev, void *res)
+{
+	struct fec_dma_devres *this = res;
+
+	fec_dma_free(dev, this->size, this->vaddr, this->dma_handle);
+}
+
+static void *fec_dmam_alloc(struct device *dev, size_t size, dma_addr_t *handle,
+		gfp_t gfp)
+{
+	struct fec_dma_devres *dr;
+	void *vaddr;
+
+	dr = devres_alloc(fec_dmam_release, sizeof(*dr), gfp);
+	if (!dr)
+		return NULL;
+	vaddr = fec_dma_alloc(dev, size, handle, gfp);
+	if (!vaddr) {
+		devres_free(dr);
+		return NULL;
+	}
+	dr->vaddr = vaddr;
+	dr->dma_handle = *handle;
+	dr->size = size;
+	devres_add(dev, dr);
+	return vaddr;
+}
+
 static inline bool is_ipv4_pkt(struct sk_buff *skb)
 {
 	return skb->protocol == htons(ETH_P_IP) && ip_hdr(skb)->version == 4;
@@ -1660,7 +1724,11 @@ fec_enet_rx_queue(struct net_device *ndev, int budget, u16 queue_id)
 	}
 #endif
 
-#ifdef CONFIG_M532x
+#if defined(CONFIG_COLDFIRE) && !defined(CONFIG_COLDFIRE_COHERENT_DMA)
+	/*
+	 * Hacky flush of all caches instead of using the DMA API for the TSO
+	 * headers.
+	 */
 	flush_cache_all();
 #endif
 	rxq = fep->rx_queue[queue_id];
@@ -3288,10 +3356,9 @@ static void fec_enet_free_queue(struct net_device *ndev)
 	for (i = 0; i < fep->num_tx_queues; i++)
 		if (fep->tx_queue[i] && fep->tx_queue[i]->tso_hdrs) {
 			txq = fep->tx_queue[i];
-			dma_free_coherent(&fep->pdev->dev,
-					  txq->bd.ring_size * TSO_HEADER_SIZE,
-					  txq->tso_hdrs,
-					  txq->tso_hdrs_dma);
+			fec_dma_free(&fep->pdev->dev,
+				     txq->bd.ring_size * TSO_HEADER_SIZE,
+				     txq->tso_hdrs, txq->tso_hdrs_dma);
 		}
 
 	for (i = 0; i < fep->num_rx_queues; i++)
@@ -3321,10 +3388,9 @@ static int fec_enet_alloc_queue(struct net_device *ndev)
 		txq->tx_stop_threshold = FEC_MAX_SKB_DESCS;
 		txq->tx_wake_threshold = FEC_MAX_SKB_DESCS + 2 * MAX_SKB_FRAGS;
 
-		txq->tso_hdrs = dma_alloc_coherent(&fep->pdev->dev,
+		txq->tso_hdrs = fec_dma_alloc(&fep->pdev->dev,
 					txq->bd.ring_size * TSO_HEADER_SIZE,
-					&txq->tso_hdrs_dma,
-					GFP_KERNEL);
+					&txq->tso_hdrs_dma, GFP_KERNEL);
 		if (!txq->tso_hdrs) {
 			ret = -ENOMEM;
 			goto alloc_failed;
@@ -4043,8 +4109,8 @@ static int fec_enet_init(struct net_device *ndev)
 	bd_size = (fep->total_tx_ring_size + fep->total_rx_ring_size) * dsize;
 
 	/* Allocate memory for buffer descriptors. */
-	cbd_base = dmam_alloc_coherent(&fep->pdev->dev, bd_size, &bd_dma,
-				       GFP_KERNEL);
+	cbd_base = fec_dmam_alloc(&fep->pdev->dev, bd_size, &bd_dma,
+				  GFP_KERNEL);
 	if (!cbd_base) {
 		ret = -ENOMEM;
 		goto free_queue_mem;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

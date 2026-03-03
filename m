Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821CDEC0479
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 09:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yy6/P6kShqLxmG5ru8g1Nn6TAGZFyeiYL/PCeclCWqw=; b=R6eU67RUq3ZzxU
	astDhIXqf32Jy3Kl1FG8Wp6s00/NPJx2UZZ2q/1qh+mNpp5T+KySxbFCP8BPqdfF61Kv3c3py1Rvz
	aNq2m0+7dk1i4FCW5O4XdfKSlDDn7IRr+jKlSQC4Rup7VpYWKbRCnFgXHvU1rLgNhm9WTot0B1KQb
	VmNBMFLuiZ2oNZQCvgGhPdW+jRVEamoPXXaK+x22Rq8iBZR59GaPBYKTBBolwNIw6l23Beh9L2OuL
	n2gMczTtPgXxSoOjx3it7TXRTM8cjTKNHRI/Rx3QQZN4v/MqZzWRZ4XjvOBkE+tG5zCAWpxNTXaIU
	6rRXl+Tsp8wqlUH3GRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLzo-0000000EreR-2YkL;
	Tue, 03 Mar 2026 09:24:52 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLzk-0000000ErbR-0Kww
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 09:24:51 +0000
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowAA34WzPqKZpyU4sCQ--.6573S6;
	Tue, 03 Mar 2026 17:24:33 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 03 Mar 2026 17:24:21 +0800
Subject: [PATCH net-next 4/4] net: spacemit: Free rings of memory after
 unmapping DMA
MIME-Version: 1.0
Message-Id: <20260303-k1-ethernet-more-fixes-v1-4-0ab0122fdd14@iscas.ac.cn>
References: <20260303-k1-ethernet-more-fixes-v1-0-0ab0122fdd14@iscas.ac.cn>
In-Reply-To: <20260303-k1-ethernet-more-fixes-v1-0-0ab0122fdd14@iscas.ac.cn>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CM-TRANSID: qwCowAA34WzPqKZpyU4sCQ--.6573S6
X-Coremail-Antispam: 1UD129KBjvJXoW7AryrZF4Uury7tr48XryUAwb_yoW8XrykpF
	W7ZasrGryUtF45JrsrAF4Iy3W8AayrtFWj93yYvws3XF9IyrZrKFyFyry7Gr1DArWkKryY
	vrWqyw13JF1DAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUj89NPUUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_012448_501084_EC551507 
X-CRM114-Status: UNSURE (   8.06  )
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

In emac_free_{tx,rx}_resources, call dma_free_coherent() to unmap DMA
before calling kfree() to deallocate the memory, instead of the other
way around.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 drivers/net/ethernet/spacemit/k1_emac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index f7f16397a2c2..02a009afc921 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -446,12 +446,12 @@ static void emac_free_tx_resources(struct emac_priv *priv)
 
 	emac_clean_tx_desc_ring(priv);
 
-	kfree(tr->tx_desc_buf);
-	tr->tx_desc_buf = NULL;
-
 	dma_free_coherent(dev, tr->total_size, tr->desc_addr,
 			  tr->desc_dma_addr);
 	tr->desc_addr = NULL;
+
+	kfree(tr->tx_desc_buf);
+	tr->tx_desc_buf = NULL;
 }
 
 static void emac_free_rx_resources(struct emac_priv *priv)
@@ -461,12 +461,12 @@ static void emac_free_rx_resources(struct emac_priv *priv)
 
 	emac_clean_rx_desc_ring(priv);
 
-	kfree(rr->rx_desc_buf);
-	rr->rx_desc_buf = NULL;
-
 	dma_free_coherent(dev, rr->total_size, rr->desc_addr,
 			  rr->desc_dma_addr);
 	rr->desc_addr = NULL;
+
+	kfree(rr->rx_desc_buf);
+	rr->rx_desc_buf = NULL;
 }
 
 static int emac_tx_clean_desc(struct emac_priv *priv)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

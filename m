Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED1FD12D54
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 15:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8bHnxxPe6eKTCzIiuKIrq01qfJg90ISaVXLA0ptU4k=; b=wO5d8WBAPZ6wJU
	xvBjOl6S8puEO8LfLf+GVSpn9c6yy6fhro40HOQ7d6KsRcT/pxzIgGu52oT5CR3BBkqVoAsbnKkhb
	rJb6nN8mnCAOrdss2+kZ6YBGQHyytfksNv05mZ8svQGCh9yeNmIy9BIMFIIZi9wsB8nRzlpOmOyUI
	3k42Wq1X6yuJEq9kMZN4uL4B5QIigGB3ZC2L42IJ3uYwKZjTfq1TqECJcCUJvcsCy5dqNY0GrGiOY
	+0zWxVVVIrn+u63f0s3PkiNl3mTy+vUC6hHQk3pMO/Qf8X2xe1IWExUl6RWaGvwme6c2eCZJ1ni7T
	9uU9wwZ0RopYLQKuuo3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAWKc-00000000SPz-2JSS;
	Mon, 11 Nov 2024 15:27:58 +0000
Received: from mta-03.yadro.com ([89.207.88.253])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAWKZ-00000000SOC-0dMz
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 15:27:56 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 978E9E0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1731338873; bh=WocUvkzoYetonkZ1U60cm3ayMp335OIxYY+sfT5CN7A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=pIxDSoE1uTAxvfm/tAncMUn1hv0n9XqKHOvFcdLhfxiqVoajbTv8Eez2GTtC0CDvo
	 mxNDwqde9xGwpa+o3E7nXKomyjwmjsO0pYWnXus/xPw1PDVJzgiwjN6Kmd7b2Bj3K1
	 1ibcmdBmxz+b32D347orDhdVNXe4XgTVxW7qQRwU+djB3Aoaa3HFOh9DwOIYe99soe
	 Tz9zqrPMbuCK9td2dHjqFJKK1sllIjMDj4ziweIQTYiSozz8wgWctD7hYOWHtLXAVY
	 krkcZO/jS+cwTSq8R67qPlk2mTgcRYzHTKmt5JtPeD0kcAp5SNGzzMl9MK4XfHCcdG
	 00Xkno4gtrh3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1731338873; bh=WocUvkzoYetonkZ1U60cm3ayMp335OIxYY+sfT5CN7A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=tpdpFNlqaQEMVo6jvV66M/rFaNr94N8lm4Vt0NAkOvYVBs0qWj1edhAWBYn6ddq9H
	 +iqtX0JTzci5kILpX2SfFVVbHdbnALqstcgzcGolHeailoenLcBDdzWPS9UVqQs2Nr
	 JFVct7IMg+thpqalKufnBg3Pe2Z8z1ceDtldhfa4x/1j25w1Fbaz472dAHPvoEfeuS
	 yXvWBqKcpYZG4Xzq4Pv3yFVWESt/Ok4XHv3qb7FrUj6NL3EtsCvsz//YUApwOtqJ9A
	 Jr9wvIf5cNPMZL8wSLi4zWXDN9164GLfas2kuQo7PhYHrobQjmOdXTd8pTyATaR1IX
	 x84+nBfUrpZEQ==
From: Nikita Proshkin <n.proshkin@yadro.com>
To: Green Wan <green.wan@sifive.com>, Vinod Koul <vkoul@kernel.org>
CC: <dmaengine@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux@yadro.com>, Nikita Proshkin <n.proshkin@yadro.com>
Subject: [PATCH 2/2] dmaengine: sf-pdma: Fix possible double-free for descriptors
Date: Mon, 11 Nov 2024 18:26:00 +0300
Message-ID: <20241111152600.146912-3-n.proshkin@yadro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111152600.146912-1-n.proshkin@yadro.com>
References: <20241111152600.146912-1-n.proshkin@yadro.com>
MIME-Version: 1.0
X-ClientProxiedBy: T-EXCH-10.corp.yadro.com (172.17.11.60) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_072755_555747_1BA6EF70 
X-CRM114-Status: GOOD (  12.87  )
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

sf_pdma_issue_pending() sets pointer to the currently being processed
dma descriptor in struct sf_pdma_chan, but this descriptor remains a part
of the desc_issued list from the struct virt_dma_chan.

Descriptor is correctly deleted from the list and freed in done tasklet,
but stays in place in case of an error during dma processing, waiting for
sf_pdma_terminate_all() to be called.

If the pointer to the descriptor is valid in struct sf_pdma_chan,
sf_pdma_terminate_all() first frees this descriptor directly, but later
uses it again in the vchan_dma_desc_free_list(), leading to mem management
errors (double-free, use-after-free).

Signed-off-by: Nikita Proshkin <n.proshkin@yadro.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 55b7c57eeec9..8fec11ad4f0b 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -145,7 +145,6 @@ static void sf_pdma_free_chan_resources(struct dma_chan *dchan)
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
 	sf_pdma_disable_request(chan);
-	kfree(chan->desc);
 	chan->desc = NULL;
 	vchan_get_all_descriptors(&chan->vchan, &head);
 	sf_pdma_disclaim_chan(chan);
@@ -192,7 +191,6 @@ static int sf_pdma_terminate_all(struct dma_chan *dchan)
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
 	sf_pdma_disable_request(chan);
-	kfree(chan->desc);
 	chan->desc = NULL;
 	vchan_get_all_descriptors(&chan->vchan, &head);
 	spin_unlock_irqrestore(&chan->vchan.lock, flags);
@@ -279,8 +277,10 @@ static void sf_pdma_donebh_tasklet(struct tasklet_struct *t)
 	spin_lock_irqsave(&chan->vchan.lock, flags);
 	chan->status = DMA_COMPLETE;
 
-	list_del(&chan->desc->vdesc.node);
-	vchan_cookie_complete(&chan->desc->vdesc);
+	if (chan->desc) {
+		list_del(&chan->desc->vdesc.node);
+		vchan_cookie_complete(&chan->desc->vdesc);
+	}
 
 	chan->desc = sf_pdma_get_first_pending_desc(chan);
 	if (chan->desc)
@@ -295,7 +295,8 @@ static void sf_pdma_errbh_tasklet(struct tasklet_struct *t)
 	unsigned long flags;
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
-	dmaengine_desc_get_callback_invoke(chan->desc->async_tx, NULL);
+	if (chan->desc)
+		dmaengine_desc_get_callback_invoke(chan->desc->async_tx, NULL);
 	chan->status = DMA_ERROR;
 	spin_unlock_irqrestore(&chan->vchan.lock, flags);
 }
@@ -310,7 +311,7 @@ static irqreturn_t sf_pdma_done_isr(int irq, void *dev_id)
 	writel((readl(regs->ctrl)) & ~PDMA_DONE_STATUS_MASK, regs->ctrl);
 	residue = readq(regs->residue);
 
-	if (!residue) {
+	if (!residue || !chan->desc) {
 		tasklet_hi_schedule(&chan->done_tasklet);
 	} else {
 		/* submit next trascatioin if possible */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

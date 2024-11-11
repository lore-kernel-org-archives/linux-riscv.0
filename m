Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F078D12D51
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tya6VoEPRRYdxnmJCSShJNJaIRsRRMDcFqJHYMCE+gk=; b=y3u+McH55s4Z8w
	basGPCLmU7Hd5EPm+Z+2kCyo6z+UT39drMP7mwQtolHUoyNmSGfCctW7uQiLwuwkUCNku4BF4SQhm
	xdO6K2Kmfrqh/Gtb8K7qUpwiyux290eQPM24om6erhbqcXepstSpLp0V/V83HWHZGsMxsIRN6YvxR
	1yB12Ps9FCs+mJ8VjGRBWphkyvlc8HvVKeLEQHFpz35ATF8NbvFLNNxtp54FlTVEwPzPnpgerFs1I
	QN6uUaN25V3sMVBohxJZ120M44ZKXINIjSNiH4jYPew9Ba1SEh6wc1p5ekX8PKqREjsE0lb9LdRGS
	256P8WcuEoICMIG5/n7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAWKZ-00000000SOu-3H4B;
	Mon, 11 Nov 2024 15:27:55 +0000
Received: from mta-03.yadro.com ([89.207.88.253])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAWKW-00000000SNF-2IVY
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 15:27:54 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 3F36BE0006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1731338871; bh=LCXqkXukcdFse1RfBXSbBIxcKQSfnp7PUgzb84DNfVY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=TTCGVyKbCuHjg099I211aqwjNVdk+xiVf/7FRpKbaKpKSKfYZh773oMf9woRS2OjE
	 z4xYx4c+CP9/PCL55QYbnxkcJ8G4Qrqa4+3wVyfdABVH/h0Fi57MeGRJAYEyOzFYFk
	 7PNznEn8kbJ4tnZddS0ind2YgsJLXsZ+692KQKNRqmDpwOBlaRL7zsBT/5KjNxsN55
	 cZaUqK62lWjqFpzh5cIj/01+QJE6bKnWVfJMVnocMnELUN4X1m1XHper1pN1Blum1T
	 2Ol1LncKB3DBvkDe6IdejhRJMNPGizEFrFPnSa1JvNwUptixNpfbp+J+7f+g144w47
	 nn+9fLxMRv1kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1731338871; bh=LCXqkXukcdFse1RfBXSbBIxcKQSfnp7PUgzb84DNfVY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=TrmVS1AzGxtxhUPAqexM4X9todI3b6xzFlAwJ6Eo8U8ReUC0KcWy4aaf1TxxP8VGn
	 9cYAmulFgAdfugNJB5edgTSc/44ZsMGSx55JsvLHCFtqZD4fOKYssvtE8FKjVGXZ+Q
	 iFDkW7Jc0PE3ZsJkq0HinO80IdrHATPQTdecP+rJye2jMzJjehSNEIVoFZVY5vnYDM
	 zxP+Wf+iYwK0DKYR8zMHliFWgRjlSKCzzyZCzjDiKYkWHOP20ybgQcjkckH4dyKSyI
	 PaPiC9Rtsq1xYZMJcP27o+IPfjRKtcwDr/bCjLjZtDMwf/4Vf55F99bAS1cEfuytzh
	 89jwD12uXyLqQ==
From: Nikita Proshkin <n.proshkin@yadro.com>
To: Green Wan <green.wan@sifive.com>, Vinod Koul <vkoul@kernel.org>
CC: <dmaengine@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux@yadro.com>, Nikita Proshkin <n.proshkin@yadro.com>
Subject: [PATCH 1/2] dmaengine: sf-pdma: Fix dma descriptor status reporting
Date: Mon, 11 Nov 2024 18:25:59 +0300
Message-ID: <20241111152600.146912-2-n.proshkin@yadro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111152600.146912-1-n.proshkin@yadro.com>
References: <20241111152600.146912-1-n.proshkin@yadro.com>
MIME-Version: 1.0
X-ClientProxiedBy: T-EXCH-10.corp.yadro.com (172.17.11.60) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_072752_951215_6EC159C0 
X-CRM114-Status: GOOD (  16.08  )
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

In the current implementation sf_pdma_tx_status() will never report about
descriptor error (it returns DMA_IN_PROGRESS even when currently processed
descriptor failed already).
In particular, this leads to polling until timeout in the dma_sync_wait()
from the dmaengine API.

* Make sf_pdma_tx_status() return DMA_ERROR for failed descriptors;
* Make sure that all accesses to the pdma channels state are protected by
  spinlock from struct virt_dma_chan;
* Remove the code related with retries from struct sf_pdma_chan because it
  is never used in the current driver implementation: chan->retries stays
  0 during the whole lifetime.

Signed-off-by: Nikita Proshkin <n.proshkin@yadro.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 95 ++++++++++-------------------------
 drivers/dma/sf-pdma/sf-pdma.h |  3 --
 2 files changed, 26 insertions(+), 72 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 428473611115..55b7c57eeec9 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -153,44 +153,6 @@ static void sf_pdma_free_chan_resources(struct dma_chan *dchan)
 	vchan_dma_desc_free_list(&chan->vchan, &head);
 }
 
-static size_t sf_pdma_desc_residue(struct sf_pdma_chan *chan,
-				   dma_cookie_t cookie)
-{
-	struct virt_dma_desc *vd = NULL;
-	struct pdma_regs *regs = &chan->regs;
-	unsigned long flags;
-	u64 residue = 0;
-	struct sf_pdma_desc *desc;
-	struct dma_async_tx_descriptor *tx = NULL;
-
-	spin_lock_irqsave(&chan->vchan.lock, flags);
-
-	list_for_each_entry(vd, &chan->vchan.desc_submitted, node)
-		if (vd->tx.cookie == cookie)
-			tx = &vd->tx;
-
-	if (!tx)
-		goto out;
-
-	if (cookie == tx->chan->completed_cookie)
-		goto out;
-
-	if (cookie == tx->cookie) {
-		residue = readq(regs->residue);
-	} else {
-		vd = vchan_find_desc(&chan->vchan, cookie);
-		if (!vd)
-			goto out;
-
-		desc = to_sf_pdma_desc(vd);
-		residue = desc->xfer_size;
-	}
-
-out:
-	spin_unlock_irqrestore(&chan->vchan.lock, flags);
-	return residue;
-}
-
 static enum dma_status
 sf_pdma_tx_status(struct dma_chan *dchan,
 		  dma_cookie_t cookie,
@@ -198,12 +160,27 @@ sf_pdma_tx_status(struct dma_chan *dchan,
 {
 	struct sf_pdma_chan *chan = to_sf_pdma_chan(dchan);
 	enum dma_status status;
+	unsigned long flags;
+	struct virt_dma_desc *desc;
 
 	status = dma_cookie_status(dchan, cookie, txstate);
 
-	if (txstate && status != DMA_ERROR)
-		dma_set_residue(txstate, sf_pdma_desc_residue(chan, cookie));
+	if (status == DMA_COMPLETE) {
+		dma_set_residue(txstate, 0);
+		return status;
+	}
+
+	spin_lock_irqsave(&chan->vchan.lock, flags);
+
+	desc = vchan_find_desc(&chan->vchan, cookie);
+	if (chan->desc && cookie == chan->desc->async_tx->cookie) {
+		dma_set_residue(txstate, readq(chan->regs.residue));
+		status = chan->status;
+	} else if (desc) {
+		dma_set_residue(txstate, to_sf_pdma_desc(desc)->xfer_size);
+	}
 
+	spin_unlock_irqrestore(&chan->vchan.lock, flags);
 	return status;
 }
 
@@ -217,7 +194,6 @@ static int sf_pdma_terminate_all(struct dma_chan *dchan)
 	sf_pdma_disable_request(chan);
 	kfree(chan->desc);
 	chan->desc = NULL;
-	chan->xfer_err = false;
 	vchan_get_all_descriptors(&chan->vchan, &head);
 	spin_unlock_irqrestore(&chan->vchan.lock, flags);
 	vchan_dma_desc_free_list(&chan->vchan, &head);
@@ -278,7 +254,7 @@ static void sf_pdma_issue_pending(struct dma_chan *dchan)
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
 
-	if (!chan->desc && vchan_issue_pending(&chan->vchan)) {
+	if (vchan_issue_pending(&chan->vchan) && !chan->desc) {
 		/* vchan_issue_pending has made a check that desc in not NULL */
 		chan->desc = sf_pdma_get_first_pending_desc(chan);
 		sf_pdma_xfer_desc(chan);
@@ -300,15 +276,9 @@ static void sf_pdma_donebh_tasklet(struct tasklet_struct *t)
 	struct sf_pdma_chan *chan = from_tasklet(chan, t, done_tasklet);
 	unsigned long flags;
 
-	spin_lock_irqsave(&chan->lock, flags);
-	if (chan->xfer_err) {
-		chan->retries = MAX_RETRY;
-		chan->status = DMA_COMPLETE;
-		chan->xfer_err = false;
-	}
-	spin_unlock_irqrestore(&chan->lock, flags);
-
 	spin_lock_irqsave(&chan->vchan.lock, flags);
+	chan->status = DMA_COMPLETE;
+
 	list_del(&chan->desc->vdesc.node);
 	vchan_cookie_complete(&chan->desc->vdesc);
 
@@ -322,23 +292,12 @@ static void sf_pdma_donebh_tasklet(struct tasklet_struct *t)
 static void sf_pdma_errbh_tasklet(struct tasklet_struct *t)
 {
 	struct sf_pdma_chan *chan = from_tasklet(chan, t, err_tasklet);
-	struct sf_pdma_desc *desc = chan->desc;
 	unsigned long flags;
 
-	spin_lock_irqsave(&chan->lock, flags);
-	if (chan->retries <= 0) {
-		/* fail to recover */
-		spin_unlock_irqrestore(&chan->lock, flags);
-		dmaengine_desc_get_callback_invoke(desc->async_tx, NULL);
-	} else {
-		/* retry */
-		chan->retries--;
-		chan->xfer_err = true;
-		chan->status = DMA_ERROR;
-
-		sf_pdma_enable_request(chan);
-		spin_unlock_irqrestore(&chan->lock, flags);
-	}
+	spin_lock_irqsave(&chan->vchan.lock, flags);
+	dmaengine_desc_get_callback_invoke(chan->desc->async_tx, NULL);
+	chan->status = DMA_ERROR;
+	spin_unlock_irqrestore(&chan->vchan.lock, flags);
 }
 
 static irqreturn_t sf_pdma_done_isr(int irq, void *dev_id)
@@ -374,9 +333,9 @@ static irqreturn_t sf_pdma_err_isr(int irq, void *dev_id)
 	struct sf_pdma_chan *chan = dev_id;
 	struct pdma_regs *regs = &chan->regs;
 
-	spin_lock(&chan->lock);
+	spin_lock(&chan->vchan.lock);
 	writel((readl(regs->ctrl)) & ~PDMA_ERR_STATUS_MASK, regs->ctrl);
-	spin_unlock(&chan->lock);
+	spin_unlock(&chan->vchan.lock);
 
 	tasklet_schedule(&chan->err_tasklet);
 
@@ -480,8 +439,6 @@ static void sf_pdma_setup_chans(struct sf_pdma *pdma)
 		chan->pdma = pdma;
 		chan->pm_state = RUNNING;
 		chan->slave_id = i;
-		chan->xfer_err = false;
-		spin_lock_init(&chan->lock);
 
 		chan->vchan.desc_free = sf_pdma_free_desc;
 		vchan_init(&chan->vchan, &pdma->dma_dev);
diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
index 215e07183d7e..ea1a062adc18 100644
--- a/drivers/dma/sf-pdma/sf-pdma.h
+++ b/drivers/dma/sf-pdma/sf-pdma.h
@@ -102,11 +102,8 @@ struct sf_pdma_chan {
 	struct tasklet_struct		done_tasklet;
 	struct tasklet_struct		err_tasklet;
 	struct pdma_regs		regs;
-	spinlock_t			lock; /* protect chan data */
-	bool				xfer_err;
 	int				txirq;
 	int				errirq;
-	int				retries;
 };
 
 struct sf_pdma {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

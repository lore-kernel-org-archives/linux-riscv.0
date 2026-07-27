Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D536DC531D0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 20:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQYPnFnsSik2enyE6acpbikXy2RfJH/JJj8rmg/2or0=; b=iuroeQ1vCcLQLP
	X7LJL1+1K/pi62T2isqv0wTwdrvFE9tVmQhgEDYtecIvXraScRYLv9Sp99FhHDu43O2KHN7W8NqYj
	rtYwwcR/eaiqi6flebl/mmmICGJJLWkF1xPDJmMcGppAmh+gbgcQjeC1+fzkqu4jCDBSb0VYycuOl
	ShlvbvZIjHuxhfch2d5zgKPO+PelBK8c4cq8wRsVeID9392cIQwmoX1+LPnm/z0oFb6e4bLzkj0gf
	iyEyZPTDqK/B0oFnFS3Wq2bg2AHSl/aKveAz1G/ZKo6SUBs6eSK10iOS9zGtsfa2Cw6AkAXHBsgne
	hOlV6l4f/TrYBTX/Fzjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS0a-00000003r16-3PHs;
	Mon, 27 Jul 2026 20:33:08 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woS0Y-00000003r04-0e3t
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 20:33:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so40038825ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 13:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184385; x=1785789185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uj7JXucTWk1RlzdeooGpQiz1Xu9WUQokbk55k/nbKRo=;
        b=ZGiR+HdL9C7PiaMmv329Uz2JI8nCqxLuJL5idqOwCQsUdAjP9FoE762a0cj+ezUVOB
         wf2yS1SPVUwhmr/7chSLvBoxUn6B8TfB11SGpL8uVLdx0yvW602RWVW3nTfw5JgX6ylP
         dTOZ48j0Y91iUfMhZ6jWRqzlUMu6dHEBaAvxisFeK8trhq6+2F16MEzoDOla4hC24Uat
         zUKorxGuNR/0pYD84TR+zaF+W8Hyw7wppG7nL8lLF6O5CcbEdaTsqECVpZl/h9PNM1IJ
         5wm6PIfAHVlDEsVORTIWzLLlUyQ0tL0akke7EdnoGuguEm2vMmSfJ3dVd4RkTMW9kOHd
         7KaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184385; x=1785789185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uj7JXucTWk1RlzdeooGpQiz1Xu9WUQokbk55k/nbKRo=;
        b=IjXUAjeiktj95WMoEXHOWkouF7b5iWeGBkHm6xP3v2jufY3HGaRZkcWFohPVtMkTPV
         rs1p2mqJ2ehxiyerApesAiM9GOeUIVuUhRy7En2ITJyiR6NnMsqXLlyG5qlwadjnP+P0
         S6rIWVwXOiZu7GAc4wKZLpUwXrKGt1deqX73R7avbA60aTS8+7QxUONfvcB4TS7GxBDP
         XWD51SaMOsby3WzFrb8nKcGSvBQgeCv5VqHqh7yrwgwBQI7XlAX+axA7j8sKbBsy2Bix
         WRAsJ7ufWaJdVceGDgN8r3aI2l+UVHBbw38iMBFyqCEzcozAfxR7UOP5EmbJQD4XU14L
         6sTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr2oDa6yooz4H2HQ7dbAOwzQAH3JfQgcAwuAMHoYj1jUnl5K2JAk2udc/jicCUcbpBbnhqrojbC/YcKuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQeBYtKcCcOlazJxWrwwhaIYICNu2P2Rfb9hQ1mOwWkxCUJ9hk
	Iv75xBgnGKYuYAwklnmmMKtAw5Zpg+fP15kXv7r8jDfTe60xiniWXbQi
X-Gm-Gg: AR+sD12N+ZSpyvEfaazb5zmmiz9KBHaiz7aPWW2lFQPlK2CiFpg2KllinUsqBkejZ3M
	B+wfzE1baNnLKVonCAJiVtggZc4QYJRAqivY22i915HrlKPGWulQiEGtjnzFVpKIwzS6vu4oze1
	qxqF+xlXLGNGwL9Ns2ghdL3L/ryo1RNwoLFGHs6omBh94DHF+32vea5TxammbTQdpppA86B5njM
	t8Lb9peW0TI8XA5rdeyJDx4E1D2fDvQhH91Os4zLsA10o8ZTjFS3WN2bWpWb1II/EJIlG1UzOvw
	GN15XF+TJoS8/4D9tVwC8pyR2ncMAUvZ1O9qEwsgYX1FHQSOl+oFzq2GShPp8PPda3WMLA6NG0v
	lRutfV8BsQD1IB7re9c8pEtPsdTDEKYTPjHytwykxgzZvBIfPSo0XzljoC+yLBxFuIyzPDECA01
	WZeb2Btr/BeWvIynI=
X-Received: by 2002:a17:902:f549:b0:2cc:f7c6:8320 with SMTP id d9443c01a7336-2cfde8af530mr96971205ad.46.1785184385338;
        Mon, 27 Jul 2026 13:33:05 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:33:03 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 29/64] dmaengine: sf-pdma: route error callbacks through channel BH
Date: Mon, 27 Jul 2026 13:28:57 -0700
Message-ID: <cb95b5e1f0970fde25ab542047d3aecbb41ce653.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_133306_194336_475AECA8 
X-CRM114-Status: GOOD (  11.53  )
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

virt-dma now dispatches completion callbacks through per-channel BH work,
but SF-PDMA invokes the client callback directly from its error tasklet
after exhausting its retries.

Complete failed descriptors through virt-dma with an aborted result and
the remaining transfer size, then start the next pending transfer. During
removal, kill the producer tasklets before the channel BH so they cannot
enqueue callback work after it has been canceled.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 6f79cc28703e..a6c2f53f005e 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -328,7 +328,17 @@ static void sf_pdma_errbh_tasklet(struct tasklet_struct *t)
 	if (chan->retries <= 0) {
 		/* fail to recover */
 		spin_unlock_irqrestore(&chan->lock, flags);
-		dmaengine_desc_get_callback_invoke(desc->async_tx, NULL);
+
+		spin_lock_irqsave(&chan->vchan.lock, flags);
+		list_del(&desc->vdesc.node);
+		desc->vdesc.tx_result.result = DMA_TRANS_ABORTED;
+		desc->vdesc.tx_result.residue = desc->xfer_size;
+		vchan_cookie_complete(&desc->vdesc);
+
+		chan->desc = sf_pdma_get_first_pending_desc(chan);
+		if (chan->desc)
+			sf_pdma_xfer_desc(chan);
+		spin_unlock_irqrestore(&chan->vchan.lock, flags);
 	} else {
 		/* retry */
 		chan->retries--;
@@ -602,9 +612,9 @@ static void sf_pdma_remove(struct platform_device *pdev)
 		devm_free_irq(&pdev->dev, ch->txirq, ch);
 		devm_free_irq(&pdev->dev, ch->errirq, ch);
 		list_del(&ch->vchan.chan.device_node);
-		tasklet_kill(&ch->vchan.task);
 		tasklet_kill(&ch->done_tasklet);
 		tasklet_kill(&ch->err_tasklet);
+		dma_chan_kill_bh(&ch->vchan.chan);
 	}
 
 	if (pdev->dev.of_node)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

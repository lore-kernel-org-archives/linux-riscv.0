Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F7EC5AD69
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 19:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EuvC30FStdiaEpTeOaqQMDSbI4HEWcTr2fM6Si6apzA=; b=M1Y3BcEKRqJRZO
	dKLhv8D3N0srKaJLioh+zMTvETUn4cdpuSEFD5MdPFatOgBwCgIy1RPb+u/0QNvyPaE3nfhOMAtH5
	YTh3DcDA4cwU9MbC6kXTyPIFgfvqafytZTsqYc0BZCivL2vJoiONNQvR6tIH4qvbH1yHchcEpxMKK
	1bRPOHxtKqDzp9SHH0ELZpBEy/5l95gQML59UQ/ZIkjFxd/lzD25YjeWjPkDWw246OVfFf3Ex/+Aa
	z5ND9mBsj9pSxskDt60RCK7ctSBBIyRHn51z+UiFa1W1W3BEuCuD0OTCfWD05rnQVGgDzBugi/mLs
	PNepy06Dj/Dqxa4rkQCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWQJ-0000000FWX7-1kSA;
	Fri, 20 Feb 2026 19:44:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWQH-0000000FWW5-1xEU
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 19:44:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-483a233819aso20590115e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 11:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771616660; x=1772221460; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05/VV/lDFeba9RsGotT90a0/zpwPMFfBoAx0Ofiw31M=;
        b=aTo+xZdXfZZsFf7Ng53hdzcWcZFuofRneNoEgzrxCPCIzVSh74LyDwQGse5M9Ll/8t
         37SWJKww6OP+UyXDFdn0zU/gEm1+0DPPjwrDufZ8bm0pkxkDGbBOHaK0joFd9F3HwS6X
         VEGjdytx4Voymfb9hIVQ36KXIZyUOTEIcX1d3GmssGxDu690QSH2Ko/ivc6ASn00Gh35
         V/OiDktZz9BSTU6VvC7nkOHg1HVaCUmGonqIHo/2qUSWpWm6qVY8uwCeUEN4WWmHAeHN
         C4MwxqZdhe5M0KEBBXhqiH+GzERZnp5DQMFHP1MY4SlzBf8qzXti3sNt2bso+AKykvmB
         LvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771616660; x=1772221460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=05/VV/lDFeba9RsGotT90a0/zpwPMFfBoAx0Ofiw31M=;
        b=og9xssHO0I4dU603/lkCHhEN56dVEzKK28XN+gBOuWTqDsBPtuQZ8H5kL3v1c3sYBW
         /oxgh3G/Q4fTpQvepKDZmLSETorqildWIBc22b5J9SKz3MAZNa8oj4Kjt7xblqNZbqIM
         E8ZvzrM2+r65joGTq2vBiDHWIJbutW4mkBQ5jp+vbOIinxqGfe8H7oq/HDIzmlZJDC3E
         Ho9sl4/YuGgTE6OShgr+ufRqFaNQd8775P83I6HEnwf6i0LsQKWyhZfM8hNPHB7pgCtP
         DIfuX1Ol9AwPMWnkqXYdQGJx9igU98lIJtUEN4gzE0fFYt+y00oyyrYam/N/P7SKaZ12
         qyxw==
X-Gm-Message-State: AOJu0Yw5gfERnh7E1bNrRfF4G3CaikK0YFV7mh5obfiuP/TlMdiYiRdy
	ZnVma5J+vaVEU/zlMsJaHxi697s6iHEuCWKptiuGcYxq+toPqLX14/b3ITRSZhaaXl4=
X-Gm-Gg: AZuq6aJ2zjG1wLT1GtrDZC9LaNhixDHV1Zo7kSJKrSBYQi37I3/gl50Cb393BU3Z1Gd
	S+UYVLrIshZr8x5M14sYinPIlzpSkHmwT4eUdCCB0oTRazGQh58BIwSg+RVShuvk4YrIgvImFO7
	lubY8gbfDxXNqIidjSeLyngA3rQwbnd81gVUo08dHxni6IEJxgshtO+tRyMxfc/BxNRxbb+oYvA
	RATfK8SSabS0sZindqaL79yEOwUesMWxqeYOx7gfqXyXKU71rYB05gP0fBC1TgSqUhhsp7UX5Zu
	wk/gIGApLIMXACLxNWmdVOwBd3ZV595bI6ZEOMBCbqhH3TKFIVcg9o1hX0q29ZqL4wZVLvuMF18
	XtO5y2Lm62jofSr3BE+anWUODFOe3Clyo81OYy9Lo8PqsLYDfU6U9/ag798eaMyFvz6RELRnnFt
	n4GptdxMK0kkvQsbfxvi2A
X-Received: by 2002:a05:600c:c166:b0:483:8e67:e696 with SMTP id 5b1f17b1804b1-483a96088eamr11896155e9.15.1771616659825;
        Fri, 20 Feb 2026 11:44:19 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3e1b7ccsm24460755e9.11.2026.02.20.11.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 11:44:19 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Sat, 21 Feb 2026 03:43:55 +0800
Subject: [PATCH 3/5] dmaengine: sf-pdma: fix NULL pointer dereference in
 error and done handlers
MIME-Version: 1.0
Message-Id: <20260221-pdma-v1-3-838d929c2326@sifive.com>
References: <20260221-pdma-v1-0-838d929c2326@sifive.com>
In-Reply-To: <20260221-pdma-v1-0-838d929c2326@sifive.com>
To: Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Green Wan <green.wan@sifive.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Palmer Debbelt <palmer@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 devicetree@vger.kernel.org, Max Hsu <max.hsu@sifive.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3639; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=b/XfJRil1bwdPvFvx3l1pKzJDaN4pUj1HhV7xdp0NrE=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBpmLl7qrlEpbzWDbGuky8nT6UzW0f5jVL+Hu/hW
 iVRTh9Ulb6JAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCaZi5ewAKCRDSA/2dB3lA
 vY8NDACxy2OOvQk82FLF/6ENDUqR0VUXpYS61hwdKKk9L4hmAEMmXjyP5/BovrqX3b+34yGCO05
 +Pkx4U3PqbxNcHs+NQHaYGZoZZ8FRdDJ4iS5eKtQiIO/m5VfQAVuI+azxBu5TrFzSePhwpJko0R
 7x0JinBtqmGUTEtA8X7egXlkbd0qkMFE36xltmi6n8LmQTuV65oTkl95SArBYzMVLt6tiQzaYws
 o+0l/9Dk2bKZjyhWc987UGgbyGnKrGm6HzmCJmJrVIRjfFpBhrUOQhhGtDsP3GKSxV2al+7TcuK
 O+p9CvhQ/XS0lmko1kSN8dbtrl81Q68hyRV2IcsvKE6AVig+7TjNsd1aLkF7HctRS26JTJ49cvk
 75uVdQud3BGkNbBqIK5wCcjszzKDqiZAC7Kl7ZINFj0wRrkHwfydyhmeXAy555xdjICf7YBgy91
 SWW/1txoOQT/KdooJP8as+lq8Jk5MIgZLfhRZH90rf1jzO3wRNmeNGc27YsfpRJ7l2tjs=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_114421_535488_B7D9A48B 
X-CRM114-Status: GOOD (  13.34  )
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

Fix NULL pointer dereferences in both the error and done tasklets that
can occur due to race conditions during channel termination or completion.

Both tasklets (sf_pdma_errbh_tasklet and sf_pdma_donebh_tasklet)
dereference chan->desc without checking if it's NULL. However,
chan->desc can be NULL in legitimate scenarios:

1. During sf_pdma_terminate_all(): The function sets chan->desc = NULL
   while holding vchan.lock, but interrupts for previously submitted
   transactions could fire after the lock is released, before the
   hardware is fully quiesced. These interrupts can schedule tasklets
   that will run with chan->desc = NULL.

2. During channel cleanup: Similar race condition during
   sf_pdma_free_chan_resources().

The fix adds NULL checks at the beginning of both tasklets, protected
by vchan.lock, using the same lock that terminate_all and
free_chan_resources use when setting chan->desc = NULL. This ensures
that either:
- The descriptor is valid and we can safely process it, or
- The descriptor was already freed and we safely skip processing

Fixes: 6973886ad58e ("dmaengine: sf-pdma: add platform DMA support for HiFive Unleashed A00")
Cc: stable@vger.kernel.org
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 43 +++++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index ac7d3b127a24..70e4afcda52a 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -298,33 +298,56 @@ static void sf_pdma_free_desc(struct virt_dma_desc *vdesc)
 static void sf_pdma_donebh_tasklet(struct tasklet_struct *t)
 {
 	struct sf_pdma_chan *chan = from_tasklet(chan, t, done_tasklet);
+	struct sf_pdma_desc *desc;
 	unsigned long flags;
 
-	spin_lock_irqsave(&chan->lock, flags);
-	if (chan->xfer_err) {
-		chan->retries = MAX_RETRY;
-		chan->status = DMA_COMPLETE;
-		chan->xfer_err = false;
+	spin_lock_irqsave(&chan->vchan.lock, flags);
+	desc = chan->desc;
+	if (!desc) {
+		/*
+		 * The descriptor was already freed (e.g., by terminate_all
+		 * or completion on another CPU). Nothing to do.
+		 */
+		spin_unlock_irqrestore(&chan->vchan.lock, flags);
+		return;
 	}
-	spin_unlock_irqrestore(&chan->lock, flags);
 
-	spin_lock_irqsave(&chan->vchan.lock, flags);
-	list_del(&chan->desc->vdesc.node);
-	vchan_cookie_complete(&chan->desc->vdesc);
+	list_del(&desc->vdesc.node);
+	vchan_cookie_complete(&desc->vdesc);
 
 	chan->desc = sf_pdma_get_first_pending_desc(chan);
 	if (chan->desc)
 		sf_pdma_xfer_desc(chan);
 
 	spin_unlock_irqrestore(&chan->vchan.lock, flags);
+
+	spin_lock_irqsave(&chan->lock, flags);
+	if (chan->xfer_err) {
+		chan->retries = MAX_RETRY;
+		chan->status = DMA_COMPLETE;
+		chan->xfer_err = false;
+	}
+	spin_unlock_irqrestore(&chan->lock, flags);
 }
 
 static void sf_pdma_errbh_tasklet(struct tasklet_struct *t)
 {
 	struct sf_pdma_chan *chan = from_tasklet(chan, t, err_tasklet);
-	struct sf_pdma_desc *desc = chan->desc;
+	struct sf_pdma_desc *desc;
 	unsigned long flags;
 
+	spin_lock_irqsave(&chan->vchan.lock, flags);
+	desc = chan->desc;
+	if (!desc) {
+		/*
+		 * The descriptor was already freed (e.g., by terminate_all
+		 * or completion on another CPU). Nothing to do.
+		 */
+		spin_unlock_irqrestore(&chan->vchan.lock, flags);
+		return;
+	}
+	spin_unlock_irqrestore(&chan->vchan.lock, flags);
+
 	spin_lock_irqsave(&chan->lock, flags);
 	if (chan->retries <= 0) {
 		/* fail to recover */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

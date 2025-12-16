Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE40D5E36F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 14:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wgImdmBIFu8n81mSTEAj5ZeRBvSDVnM/j4hAER3eNHY=; b=TfWPzEr+MNk58T
	xCGzKoiqNlOo+5QFu9GDh4XgIFZPSyG7ZhxjAdriwqjdGSWPdWbTiTVyXmUZshEGT0wmbmmZI4WaD
	xcDjGNGEBq6xdSRTzprkkIhYgwd6p1vIeEvodr9XleG3rL1dZbJRSftt6JqHGX6ONZ/bStnOiHhdI
	SnhT9Hb9hvVey2W4QQAxzgayCRbCxFECFAFoG9RvIoAJIf+Q8CVByEgc4d/S0u0sv47FeFpNBH0uo
	R/E6LevhcjMSUoG0xQ8eYdp7kGz7Bl8SkSdEmG+SnkCKL9Z6V9jvtKRWp74FtA5zAGXzgvubrk5UX
	yf7KIPn7hq9F0kuHOkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVle-00000005K7p-1tUo;
	Tue, 16 Dec 2025 14:11:10 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVlY-00000005K6v-2MSV
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 14:11:09 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso3772708b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 06:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765894263; x=1766499063; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x0mQ2j55HYzsWAqKi9hLFK12hbv+niMldudmD970L/A=;
        b=vutLppoBS+aV9T1zXQRD26vjGVQ1C2MtLbo5npG/tAid4MKr2QeRL7CzucXAk65Hcm
         9RSCub9igD4Ljxk0MGBbLqjST4Ki5Hc4rsSzFaaKYyFSPVsGqm+vA0koTGsolAtqNHeM
         yJO1zKpLnQuGe48i6rwutCV0RV5G1V9dauBjT0ztzxgx+LB1OOa9NSUgpi6VrcuR0x4Q
         peSC86AEBCb88eztPIi0zr4DVO6BWSJnoxu3wQQ9d/nxRc8LkVEc/UWk91u5RA0u/Zl0
         FL0u2gaW5jW6oFvwrnnXq5w1sDppeUZ8UomWSqUAg1y7WHBjK2IzctP2by5ppv/W1V3X
         1cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765894263; x=1766499063;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0mQ2j55HYzsWAqKi9hLFK12hbv+niMldudmD970L/A=;
        b=wF4/m2ekFwKwPVz5N19ynud1dPXKiLoBGuGEk2BBGNs244zQkMp//QId7vsM+QaTxX
         ra50VAh6GGu9EOT+R1avlPHNtWPqSBGen3k1luvSixKeAExAn/pZ/Bt59BCW6hsw43qK
         REDBRftznGDeTBz5MscuFxNqWgzAQuJt9srDeKxMGVv+2jbsOuvyb5YdKzT31zJvar80
         wxjGlXOQsWtzCkwwdUeYUYcMT2kwDG48Woq2ZfUBInOtqd+eGUpPJtyLeRxyUaL9E+Y9
         CIpMEksFCsqJ4I5B2kTPupxcDFYBmmp45RQaOZScadrRa9WTHQfkotOeqf1djTDv3H9q
         tvXA==
X-Forwarded-Encrypted: i=1; AJvYcCWwYomCDDqShD2e2yxXXOWZKC++fSPPo5Eyegx1oLrERxj27d1X3fWqdurlGz0sZRK73lGJs7QiF+D4HA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyP2nXWk9qL0LjKVM/uPP/0WM17rXSoxWR8MXJzXGl5vfRo/Ome
	fdixgn1oIuQF6wqnEiZd7nBJT1Mwhcx94L3PI/ea+gBvRhGdNHS8WoXyMAbBj5b+WPMOUYw8zFh
	T9iv47wM=
X-Gm-Gg: AY/fxX6YZtqFZGFcBr6WTiH2HSqdTGbzSP5Db5j21+ZU4F/vf2PMmAYQrZAl6utpH/g
	tjb0qDXmPUndXqrkIfRASW32sGn5flMo3Zd18vR9xVtGrgIhkTmX5EUIP4fcVEWzckh6h+jMaEm
	Osd+H9n9jJbrZ9B3m/uhLSvyumQhm0Be7uGNkI6KqPAn9T/EWJbwf0UEtwYW6sWiePVXLCKWKQK
	xsgVYmdLVjSN00gPhblQMRE45uODFi1cUpqhNkuDBg3kkSPkHjiZmLQ6HIE6VubAscDRyRWsjih
	MQRC6Z749ErRG1kV9kKpmAhUShVBqNeji0gA1untLKBLCw1CBJzlT0wPQDUXhuBCunKzhLcKtSV
	j9SKJPLgSeIG0/XY9DQMZVlqotyq3DjM6WXRkSy7TKISbSEY5Q/L8WPOp4gMbmYy+jVXRvJsBPV
	d3xY+9TsK01a2fqlhqqpix5+3OAIzvhJQ=
X-Google-Smtp-Source: AGHT+IFdznc94KTDkz6BoktpmFeuIds91RWVwGw8kUgSdrZJ6fQjtIW9/MuumcftUmESsfRMEb1Hmg==
X-Received: by 2002:a05:6a20:e210:b0:35f:10a7:df67 with SMTP id adf61e73a8af0-369ad9d21c0mr14335397637.17.1765894263443;
        Tue, 16 Dec 2025 06:11:03 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe200077sm12055352a91.3.2025.12.16.06.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 06:11:03 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 22:10:06 +0800
Subject: [PATCH] dmaengine: mmp_pdma: Fix race condition in
 mmp_pdma_residue()
MIME-Version: 1.0
Message-Id: <20251216-mmp-pdma-race-v1-1-976a224bb622@riscstar.com>
X-B4-Tracking: v=1; b=H4sIAD1oQWkC/x3MTQqAIBBA4avErBvIof+rRAvTqWZhiUIE4t2Tl
 t/ivQSRg3CEuUoQ+JEo91Wg6grMqa+DUWwxUEOdItWjcx69dRqDNox2GMzYkpo2MlAaH3iX9/8
 ta84fhHNzfV8AAAA=
X-Change-ID: 20251216-mmp-pdma-race-d77c84219b2c
To: Vinod Koul <vkoul@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Juan Li <lijuan@linux.spacemit.com>, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_061104_630184_B9190C3B 
X-CRM114-Status: GOOD (  10.31  )
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

Add proper locking in mmp_pdma_residue() to prevent use-after-free when
accessing descriptor list and descriptor contents.

The race occurs when multiple threads call tx_status() while the tasklet
on another CPU is freeing completed descriptors:

CPU 0                              CPU 1
-----                              -----
mmp_pdma_tx_status()
mmp_pdma_residue()
  -> NO LOCK held
     list_for_each_entry(sw, ..)
                                   DMA interrupt
                                   dma_do_tasklet()
                                     -> spin_lock(&desc_lock)
                                        list_move(sw->node, ...)
                                        spin_unlock(&desc_lock)
  |                                     dma_pool_free(sw) <- FREED!
  -> access sw->desc <- UAF!

This issue can be reproduced when running dmatest on the same channel with
multiple threads (threads_per_chan > 1).

Fix by protecting the chain_running list iteration and descriptor access
with the chan->desc_lock spinlock.

Signed-off-by: Juan Li <lijuan@linux.spacemit.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/dma/mmp_pdma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index d07229a748868b8115892c63c54c16130d88e326..481b58c414e470cc08812d5a9fe7283cc48e5827 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -928,6 +928,7 @@ static unsigned int mmp_pdma_residue(struct mmp_pdma_chan *chan,
 {
 	struct mmp_pdma_desc_sw *sw;
 	struct mmp_pdma_device *pdev = to_mmp_pdma_dev(chan->chan.device);
+	unsigned long flags;
 	u64 curr;
 	u32 residue = 0;
 	bool passed = false;
@@ -945,6 +946,8 @@ static unsigned int mmp_pdma_residue(struct mmp_pdma_chan *chan,
 	else
 		curr = pdev->ops->read_src_addr(chan->phy);
 
+	spin_lock_irqsave(&chan->desc_lock, flags);
+
 	list_for_each_entry(sw, &chan->chain_running, node) {
 		u64 start, end;
 		u32 len;
@@ -989,6 +992,7 @@ static unsigned int mmp_pdma_residue(struct mmp_pdma_chan *chan,
 			continue;
 
 		if (sw->async_tx.cookie == cookie) {
+			spin_unlock_irqrestore(&chan->desc_lock, flags);
 			return residue;
 		} else {
 			residue = 0;
@@ -996,6 +1000,8 @@ static unsigned int mmp_pdma_residue(struct mmp_pdma_chan *chan,
 		}
 	}
 
+	spin_unlock_irqrestore(&chan->desc_lock, flags);
+
 	/* We should only get here in case of cyclic transactions */
 	return residue;
 }

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251216-mmp-pdma-race-d77c84219b2c

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

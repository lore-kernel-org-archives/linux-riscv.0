Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A757CF9C69
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 21:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VOQ5I2VtVZfigomG1HdnLUoKVODEp1QJr5BlIsJC6/8=; b=bUngo5n4AXfq4M
	wjE3f+B9ZWvwQEyDmXya1harrMXro+i/NAmN5Ik1nuG47FdAMUdnHmm2AWlpntrBH+6sBYeIsBEeM
	CaLtUt0OdqnMZSnr0s6VM//MQ446tSgGZde8L4NtUaxUmXIPXIdo67pE41zSatILQgY3R5+cdY5ND
	9uCFk4WViePwcIrKom6EhqVxwEh5LRyrm5YSywikavDZ1UgJHsy5im8z+FjBxaE7TaW8vT108fWcr
	Ch8eBM/xsvCLItuuYhYCRIZ2Ks6WXamWCZbvjKxEULAlyiBz7NobPDsERDK4c+reAICTK1cXjISN3
	4QCKw2GqWYxmJcDGSnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stCf6-00000003InS-49oe;
	Tue, 24 Sep 2024 21:01:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stCf3-00000003Imc-31bC
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 21:01:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2068a7c9286so60102295ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Sep 2024 14:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727211688; x=1727816488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MsmwfGIxGDNHXFbLStjjpLFP1XK3C1AVuwxVxIWA5pc=;
        b=hnusvEpN5gnKISyYHPAEknr0LkQ2pbD3A6iH7CjNd9dYGCl7cdyj6Up6BCYXgcJA6u
         J1lpbbiVjcoK4zejZ665OhZzj7ePteH+9FgWQNcQgnnmEnRj8TrfyrhSwmfYLY0G2cYe
         2QXNY74l2+REAFWLptMIzYAnxUNBtmOZDbyjGPV2PK23BMYtUfFKbwI/r91+cbKPQf/r
         Gp9ushSJImUBiEzrKUjDaQsBv0wzMwVGRU+ai3vnw+Aavk3Sspjf0qKrbXtCovjjkd7S
         j+ZL0bv2EzcaMxFOSfaoTqkqrbqU+qZIgafBkRu0beyr7W/qqLnwxIBYHj4Z1agrkz1e
         ePPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727211688; x=1727816488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsmwfGIxGDNHXFbLStjjpLFP1XK3C1AVuwxVxIWA5pc=;
        b=Dhghcm6et2UliW1cmAc1C0rBcszZmras5JbpsbhIS+KHLR/CYWEXCzYxsN1Okww2+8
         tg+anyfo+cLFbKeo6LzAnegVLzEuJIZuo1euQYPTYp50HjS1n9lp/RRTX1LPjt8J0jB5
         MQwj3LqZJYtncOTPKS+OBvvWsIxCxIP+jsnG7oPcN4dguZrT0D7LqfXnEG9SustVkjrQ
         wvDR/JM9PWaVPnFE1/zN/FSID5k7mFVWz7NfPN3zZDBEzkGeWGWN+jW6HSdX57aq5jTr
         zCP/HTpbmeUU7j83qRG91gFBxY+CnH9j0bUbE3ugb0sHSPxTDqSYWyGvDeax2rZ0hf4A
         KF+w==
X-Forwarded-Encrypted: i=1; AJvYcCXbleOmcbOSYGT/hpQtgoE6cJSJwEX/E6EKipoevtjF1y6ytzQt3vq+MBnmNMKg0BDFw2/iv9zbIAxccA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdaTJxe0DNMYvFsR2vnoHr1YXvy9wfhOuuhZVdduINKsnFvny3
	DPtYrTxKW0uRJ3XiXqQLFqGIB28rt4GkmiMqjTfCOmppKPNc5Kmt
X-Google-Smtp-Source: AGHT+IHGAgzTdiIMarbX1EfDyWZlQDo2yhTL6zFfq5FVYuejP7LnAB0RB0L9FOX9jUSKIwY3LsbBrg==
X-Received: by 2002:a17:902:db0b:b0:205:76d0:563b with SMTP id d9443c01a7336-20afc2d215bmr7394685ad.0.1727211687547;
        Tue, 24 Sep 2024 14:01:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1724163sm13754305ad.66.2024.09.24.14.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 14:01:26 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] mmc: core: Only set maximum DMA segment size if DMA is supported
Date: Tue, 24 Sep 2024 14:01:23 -0700
Message-ID: <20240924210123.2288529-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_140129_786621_188DC4F2 
X-CRM114-Status: GOOD (  10.88  )
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

Since upstream commit 334304ac2bac ("dma-mapping: don't return errors
from dma_set_max_seg_size") calling dma_set_max_seg_size() on a device
not supporting DMA results in a warning traceback. This is seen when
booting the sifive_u machine from SD. The underlying SPI controller
(sifive,spi0 compatible) explicitly sets dma_mask to NULL.

Avoid the backtrace by only calling dma_set_max_seg_size() if DMA is
supported.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/mmc/core/queue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
index d0b3ca8a11f0..4d6844261912 100644
--- a/drivers/mmc/core/queue.c
+++ b/drivers/mmc/core/queue.c
@@ -388,7 +388,8 @@ static struct gendisk *mmc_alloc_disk(struct mmc_queue *mq,
 
 	blk_queue_rq_timeout(mq->queue, 60 * HZ);
 
-	dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->queue));
+	if (mmc_dev(host)->dma_parms)
+		dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->queue));
 
 	INIT_WORK(&mq->recovery_work, mmc_mq_recovery_handler);
 	INIT_WORK(&mq->complete_work, mmc_blk_mq_complete_work);
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

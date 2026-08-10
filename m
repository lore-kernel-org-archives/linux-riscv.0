Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F401C5B567
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 18:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKs6VjxhE3coMH//6a/6nzp6jYHOBeMyd460VZMqBAA=; b=M1Tqy36dwXT1q5
	aqxI8GB///AuI6zHKYDqaU33bWLAXTjvhA+jiF57NitrYPgXoq9Fxyanl/OSvtyh0XqP1LFqfRrM+
	ayeJ5AzTv+5Y3F9iaHrpBzyS1uBTA24IH9upPiJXrjvOUQyatxHZ44VtXP+IvV3rCUbGaVLpUaPHW
	tD7FfBgTi8Fw+6Xga++S7ubdkiGv3BJViGJIMY4JjLuSuFm4ze3dbmGHHHx5qIZXlNrin/J+oXoNr
	vei6jHDENEJQ5zOqixnrmtglKBKjtyv3PSodTRzfGXb459aoLir85zj4cEy/PjZ21hLA1ZyG84bkt
	N9PRr98O2P27Hmv3FXKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUUz-0000000CcAz-2itc;
	Mon, 10 Aug 2026 18:13:21 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUUx-0000000Cc9S-2nDi
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 18:13:21 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so191679a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 11:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385599; x=1786990399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RUMe+KZIIE0p4VSC/2SRazogG3ObTz60RXYC/ZPy2cE=;
        b=OqcNslFyy53djxrvTp0XkQv4nxAV0vlYSO6W0ozebiSPs+GGukIAaD5bPOsbDosDSb
         JRas+mH1RBlwH1UNcMJizGhJtyvTVsBj/38EMrTeK7FBJgnLkIy8vM3Eu0uAphyiLnfb
         qSooG9FjRq7LJHkkVhMQEvNtxOZ8/JvQ9Kbu3YMImfKyOopNfgLku3cW2HR+3pr2agq4
         IzCtczRrtN/tpVOsCV7HWgmKb3J/YIn0FfY6tq5dX4kTTkyoR09kJop3TeV6pJZofNwB
         gNSJclNElA5Yb5uORZUnJ0r/FovFXtfqQGLuFDHHRO6IiSUe3ytB3e/FjzuxJT6vH+cX
         CyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385599; x=1786990399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RUMe+KZIIE0p4VSC/2SRazogG3ObTz60RXYC/ZPy2cE=;
        b=ZXMX37fsB7Jq06Up2s4XUNkRhvwf3qhS04Jxdn5NM5/kYNw1gjhiyxVV69sKUGSH66
         CZeRIjTkq3oztZ6QDG/Yn10a2YLY4F2Mb4oGXi4tff8CYUjasFc55OYEohcScMPUlIx7
         42se7UXP37xVkbOjewKOn1eGzgr4aK169OtD2GFW6O78xFpEzLEi4WjrrOArdqzjxzpD
         fBX2ktgT2R+3Tp1EOlaVlm1gn1fUC+qWUueNJQSftj4J5nARZyyO7NY2XWbsUTRonvXz
         8nF2lQLs1MqXJjmYNpO/QSPzhhvUrQHMal6C1K+Ru/ROySa0vZJBFcEP1Nf4kSOcoIn1
         hGvQ==
X-Forwarded-Encrypted: i=1; AHgh+RprT7Ea0/geIb/o5+/iMP5XQn8YWg370GiF/CwUTAu0r5b2iQL1IFshFggMauRLaOx/MXg+9+HC4ezM1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbHkmmhQnQnSqXrlbcreZqD0XpgzlvFhOuXNUsGx+zth4JPJb5
	wmP95Y0cOfagEkv0KRIIsNbnVA+OG1SSntGhll0zFsninHAhydt/28jR
X-Gm-Gg: AR+sD119hzXqBL6K/mbEq2UfzPp2nrJfCUTc9cl0UqvkAXSRwwNmAGa2jiyC0moEeWj
	4uLeFXHoyJXzUds4bWi4pPNy9uy/+uBWkcXlKUOODOyyWUZgHVbtXh7uu8O8b3WeSnIJnu4Q8LG
	H6Box8S+ncB1dLFZEkAo1tlXyx+8DS+icuDUBy/xK3YqH85MTX7vWE0UtivaNGLMcz/V1hx4LM8
	j/es34v3S05RyUtsDf3twZHju5/nJ65PN0wNDCRt94Me/LAG0/I4+67HgRdjFPphI9/vAlqRbU6
	vSLJbaIsFmnNSq3fefFBNZqSbueG+8e8NilWoK5rT8F8tu0vVM+rKtG7EcjR+TH4HLOu+9NijD2
	goTpfBDnbVTu6aKMfxpq3lfiZJueOrEMDDIGC718YmLjP7CjGOtBHyYXfxxt6sNz1v7aW8jyy6u
	cM6WNlAchXm1rGJIAiaERGVzNLD/c63U4FLq5XrZ7wgbYjzXfsIsIFKWMC/2BMarc=
X-Received: by 2002:a17:90b:2b45:b0:386:ca4b:16a9 with SMTP id 98e67ed59e1d1-392d61ce454mr128606a91.16.1786385598984;
        Mon, 10 Aug 2026 11:13:18 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:18 -0700 (PDT)
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
Subject: [PATCH v3 28/34] dmaengine: sf-pdma: route error callbacks through channel BH
Date: Mon, 10 Aug 2026 11:09:29 -0700
Message-ID: <8538eed11abe0c92b1a5b2830baf7a3f06ac698c.1786384169.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_111319_964627_2F8B3674 
X-CRM114-Status: GOOD (  11.19  )
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
index a08ca355dadb..ab2029af0c0c 100644
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
-		dmaengine_kill_bh(&ch->vchan.chan);
 		tasklet_kill(&ch->done_tasklet);
 		tasklet_kill(&ch->err_tasklet);
+		dmaengine_kill_bh(&ch->vchan.chan);
 	}
 
 	if (pdev->dev.of_node)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

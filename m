Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F4AC79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 06:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xolhQarWq2j8nUNXaCryhMehQtTqIHH/F1lD2YjfKso=; b=byzIKwqGKyatdY
	25JPSVIoBD30e8ceYXh4XUNGVF4p5Rfls2nxHrtutdRIL95buNcXX5fPvkms/Z15SBLZEHIeT95UP
	zXiTRmR2ovSde0eDKpdkynzUPUasys6V5yGo7bUxUeiqGXb+ikfdjNm8q0w8WK/ktOfC1ghL2uvE0
	F/1XzaH6kvSLspRwIL1geTvvfLfabkA5+O05mPMI3qWfcnO/uAfsRQaJQmvHYX3mz5qs+VAT2zHhV
	i5ZuV18Tpb9qbADLEjTTIUpNz8+8VSpBttj2qWEIyYw9KJSv5RD7Fub2C/KCTv1y+Tl1BPgi/I+/F
	c7KvVkxfqH48qoqqCNvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TEZ-000000064MQ-2dI0;
	Mon, 07 Sep 2026 06:53:39 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TEW-000000064LH-0nuf
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 06:53:38 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so2485907a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 06 Sep 2026 23:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764015; x=1789368815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0YpADwP/mkKyGO+EKdZI2bBLv0b75u6CTO5qSfwEOn4=;
        b=PsH2DVrf4yLxVUH/J/UgJ5mxKmOl6ujVzTXA0Zgv3DM9PIs9QDOdZxrMo92XprdNq9
         kiI2stOs1lcPpbYuqKQPYUA7nfyZy1Ky2+r9Ej33vdvIRSnsDATrkrHmUnodivF7WLos
         5BEghFcgpuov6UylGAG97SUxg0mJVk1xdswPLFlDs85litINGz4nSAElG6GjUmI0/gUa
         PiEj14fuDf50soUyXShynPTx5pmk5YGDtzfxZ4ou0YYSMh6HqgPgo4xzE++1O32Rr0Lj
         kjZtyWNwWfaO6BiAsO4uzydvq+3/svvl7gdsWr1OR9+q9yefS/9Ix1djlJZkhJEK8Vov
         5faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764015; x=1789368815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YpADwP/mkKyGO+EKdZI2bBLv0b75u6CTO5qSfwEOn4=;
        b=Iv/AbAbMKVfu3ESPcOlyJZzzCVJY4ZklUMa0+oO+svtQmJfk5gKsrXF/skTO58BaOq
         /BcY5qMKgQfAiwYZuQyk/aE1ATe0OsHATBenrczHWh3+1bVCqCmdAnERKM4bb0pJSIhQ
         Obu1/rNN+KEO+0HrhhtjQvuc3UWUCvLkwOcVgBarFbFMnlNOj1Dp2GmI9PjlFY1CbJ5M
         afE3iJwDMSB7YjE0xhIjAg0Fhldb3Xbyy8+3v3jdbaY94590sZUyHT3xVA833cVL6K91
         2HEYrxm/4f1/G6TyOGueP5NXEcXuHm+ZRQ/bJBi7Lqv7xj+323oJURdR+cy4k22P5TBr
         kuOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZTrnsTw1IxnFQrjT4HXQ/z02fXDwMZu3ih7Tt+XoaEgdVwbO30pP0t8iSP278go8n1srNOKRXGTNyGQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lDyWCC34Qqho++mvAfeWfWDaps/mqOexDyc+dJ8WXZD7wxIRM2
	6yMCVNzCIFj2GDzrVxZLtApuOXTf7o+qGNTfJ8fAHMbqO3p2WmrKZced
X-Gm-Gg: AYBFou0zezPdVKMi0DAIL91Q4n5IfLWrta0IBamWLIm8VWbEZ0jcU02cgE7thLgVwL9
	1BqcaxulT9fZFtsJKOZvwtEky0eh7drd9UZCXLn7PZM/xTdMJNhX1oYGNUE6lCB+UJG76UjNbNQ
	zP93rq18PN9+NZE3zT2b4+P21m/9ybbTw0+SuP0PZSnhKIkFUsp9hs3HRk4vls2kTBBuDuVgE6i
	xyHgrMCKB/ceQQzWzIydfrXLE3tLI5ZlgtuJ/rw662dATsoPdZXT8I4EPJL0BgWNRKhIyvIMmem
	HocWEVtMtOV2m8NIYQL0GwXtEm3rNyBTJrbWo2UByOBIuQvo/F3a/gf9doyEpRvDjYdNuwNIzNi
	W+OzViT23X1xArY4udA0tZA8K+YIinODpBuInrJX693Kaa6ycJlBjOQcbatqVYJ87wkA8jNZtdf
	jB0C88h4KHrpxPy1I6/KIzFtzNLJhBrf2XQDrFarnMh+wKog+frX01kN4LSGymwUfPnZSxDRngY
	yO3SBK3JpHoJg==
X-Received: by 2002:a05:6a20:e607:b0:3d3:ae0f:5267 with SMTP id adf61e73a8af0-3da3a152a11mr33125804637.19.1788764015179;
        Sun, 06 Sep 2026 23:53:35 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm24822574eec.12.2026.09.06.23.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:53:34 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 02/14] irqchip: fix typos in comments
Date: Mon,  7 Sep 2026 12:23:28 +0530
Message-ID: <20260907065328.32009-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_235336_232540_16044FBC 
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/irqchip/irq-mtk-cirq.c    | 2 +-
 drivers/irqchip/irq-sifive-plic.c | 2 +-
 drivers/irqchip/irq-vic.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 914d1d639fe3..d30c34ce0f56 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -247,7 +247,7 @@ static int mtk_cirq_suspend(void *data)
 		writel_relaxed(mask, reg);
 	}
 
-	/* set edge_only mode, record edge-triggerd interrupts */
+	/* set edge_only mode, record edge-triggered interrupts */
 	/* enable cirq */
 	reg = mtk_cirq_reg(cirq_data, CIRQ_CONTROL);
 	value = readl_relaxed(reg);
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b0dac104814..a7cddadddf40 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -452,7 +452,7 @@ static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler, void __iome
 		return 0;
 
 	/*
-	 * Interrupts delievered to hardware still become pending, but only
+	 * Interrupts delivered to hardware still become pending, but only
 	 * interrupts that are both pending and enabled can be claimed.
 	 * Clearing the enable bit for all interrupts but the first pending
 	 * one avoids a hardware bug that occurs during read from the claim
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index e38104c5064e..607e3284f700 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -478,7 +478,7 @@ static void __init __vic_init(void __iomem *base, int parent_irq, int irq_start,
 /**
  * vic_init() - initialise a vectored interrupt controller
  * @base: iomem base address
- * @irq_start: starting interrupt number, must be muliple of 32
+ * @irq_start: starting interrupt number, must be multiple of 32
  * @vic_sources: bitmask of interrupt sources to allow
  * @resume_sources: bitmask of interrupt sources to allow for resume
  */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

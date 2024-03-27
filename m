Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20385C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v2YfYx1soxtjqVdrc/y+w/MEfcuBWAE3aWO+LuRIlhg=; b=pLeLc0has9BLrK
	0+A62gbGfilqqE0W+dSAMC+XowDLD7lVADn0GpzJCf6pi9tHKkOMJ4IWLqOoDVxvZiqioDep6ppHl
	OlDGbaZqb0Qlzm57q2/7Or2/fFwuGNiTacbhAo0dqDQZh7N+yTasdNVQ0BBUXVbcy+aHBqfF8HMLv
	bjlYphOQNik8NYhE4fEVaOh62blSQBEojapAnJ8W5fHNnFnMjpnyNxJyFGxnXBvHAL2TmbYO/K9Ie
	//QB2Yva0qwgxX/LYkExDsRmpgEd6PECK2EbsHdarmz97WhAzOL76TZGifiXrkqHUCnzE/8b6BopJ
	65ahWt3kxwp2msSEJhrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpR6H-00000008XOb-0KQT;
	Wed, 27 Mar 2024 11:05:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpR5s-00000008XIS-3b9L
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 11:05:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-41493e0fbf2so3561365e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 04:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711537518; x=1712142318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=014p56NXkTx8ykc7/eVqJqevMHd3n2lLs/kLUplg5o0=;
        b=GOimYOfwoSeharxFN8KI4s+SzYUxlTfNY5FnFtQfCijpNQECSpcdLDowV6mvE/L9VT
         WhsbVXXus8djKy0/kdzQal7jz+AWimDNxxnsbeYv9Ioc5vMaJ/VQVt+6LAP2Cc+DVPQt
         F5i4VUQToCBbHAFsUf1SENYi5LUasJbMQWASRey/EIa3rv5UL1j3p82i+I5nNvDhA50Y
         LCmTJXo3apGhfKQ45/C71abgF2zUP5coxXg5Mh51AlQ/KAkFTBCf2KWJV/zycw0DyLqG
         PzbodNZxzaWw3Dt+XIc47Km2tG/jHFPna2tuV6tFx8uRAHd8vSnpB3OKiVDNxTK3ECwh
         QaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711537518; x=1712142318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=014p56NXkTx8ykc7/eVqJqevMHd3n2lLs/kLUplg5o0=;
        b=QZ9FNMQf1ArAnmDthi6CZF03tAMshK2QdOoFLz4JYq7ZelQy5QYSBsrFxOHSEtlzAY
         Mi9JxGMajo9/oBTFtTML48VqdzxhfMqKXL9kZBZocFQGzEfI1D9XuARFktKCz4i+kV1c
         HZG6FGwYUtio10H2lTfSwZ2O9PLGBL0R6scc3g7yqyAoC5gri4zwlD6tNHNyZeFvVjxO
         jv+VoFc1AAdeQi/gJUgij2qrcm2iG1r20OrIYhZGM6uGG19/bqU19K69ohumXGipIxWj
         j2uiYNfW1HzlLgpekD4tYoa4YU7BzSR03Ylpa4YmKFkxZErigMsjGMMuQJppZM+Mc4+G
         FW4w==
X-Forwarded-Encrypted: i=1; AJvYcCXN3wmzKsXvt3V7yci+kHpHsLdV4okD4WB8SLERu6TT1ce+Ku4y4EP0vQH/2hsx8TtNBLXMjH+GFdfP5/CG83eiz17dFDyIHJCwjivUEWJ8
X-Gm-Message-State: AOJu0Yylo979L1221qeD3mhzEQLtRGgDg8YenSAyMo/B09Oz1Mc/mTRa
	Q4gd/nKSkgf4sJP7QvR7XwrR1DsgXbN8/qNAuSRz/oSv7DLxAdf0
X-Google-Smtp-Source: AGHT+IELU/7JO+2Zja+aj+L6RZpytn4mXOMjoQiGw3A+Qqveb4jzvTJ5TixVDe6G93XhZRpnua7/gw==
X-Received: by 2002:a05:600c:358a:b0:413:f290:c747 with SMTP id p10-20020a05600c358a00b00413f290c747mr1671154wmq.33.1711537517652;
        Wed, 27 Mar 2024 04:05:17 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id dx23-20020a05600c63d700b00414887d9329sm1775106wmb.46.2024.03.27.04.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 04:05:17 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] irqchip/riscv-aplic: Fix spelling mistake "forwared" -> "forwarded"
Date: Wed, 27 Mar 2024 11:05:16 +0000
Message-Id: <20240327110516.283738-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_040520_917074_70BAEFC0 
X-CRM114-Status: GOOD (  10.11  )
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

There is a spelling mistake in a dev_info message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/irqchip/irq-riscv-aplic-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index 36cd04a5057b..028444af48bd 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -251,7 +251,7 @@ int aplic_msi_setup(struct device *dev, void __iomem *regs)
 
 	/* Advertise the interrupt controller */
 	pa = priv->msicfg.base_ppn << APLIC_xMSICFGADDR_PPN_SHIFT;
-	dev_info(dev, "%d interrupts forwared to MSI base %pa\n", priv->nr_irqs, &pa);
+	dev_info(dev, "%d interrupts forwarded to MSI base %pa\n", priv->nr_irqs, &pa);
 
 	return 0;
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5168EC531DE
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGTqgGHwShCWmPOljlqX+nexFBq7dv43rq8Q5aF3VuA=; b=QQR4d3XFAQ3qLO
	z9v7BQC6U7DXdPGt9K+z2pNfvBvVNgzpuWFGhFQhKlWo7iI6KHLwo82U9buGf0OHhmwSGx28v3bgD
	9L64SOrCB9mc7DHYgT1kuVJAAQVgkqNejeu0PMSC1hyexfh9aH5m6PIANhCOFlJMhWdLA2fbWibpN
	Q7STAcEAxa4kh9KTWjM5ixuJUtCyAwYy2DCCeFT+X/riwPUKfVcjPL1N6t+Qen/p9+lR6DiZr9ZTR
	HwYGIbA57QIXUcOc0v6LanJWp0Ng7SrhbgEt2NG0mrOfL+UJmt1pM0re4iDzphsc3x6xa79cA+y9y
	Eq+3jVKjz4NMrAdpFJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFRm-00000007OMA-35oU;
	Wed, 14 Aug 2024 14:57:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFQl-00000007O2c-1kgj
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 14:56:57 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id ACCE74596E
	for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 14:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723647409;
	bh=BLF9xhELpEDy4F+zOs829324v9jnXI7dzpQV04pN/74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=cQpdFYXi5LPhq9jS69QNMfn9zwqe9/6CQvgpxMcI41EqqsfqPOs+oHwtQJjioc7ni
	 w50DRCj1hiI9qtng0LReEwcobXSaODD2XLy4wGBgvpBkc/BAoNoK3COwFHTYt92EIa
	 44859Xxv1UlSXbSl4Zx7K8euCwk6mbvB4HPEXnPrCkeIyVFMupSDx0HDNzDhioBTcn
	 qm2iePwkio++xoCbmWSNhKRhOO5t0qK8+SE7vNIlmIuTWnOjkj8gweTm0yvsVGCgQu
	 ns2TJGNDBLW4AArpIIDNicE6fijIYfwObV+HngFxUBq4AOzQ+2H1BV9PsNdjY5rI0O
	 ZotlhgK6cjRDA==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a7aa3181bc2so480313666b.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 07:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647407; x=1724252207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLF9xhELpEDy4F+zOs829324v9jnXI7dzpQV04pN/74=;
        b=fkNcV9ZtWGkpv74jE4nVPi2nkf/ENkwdTxsEZXr+VeWxk7Y/TFpgchKac1SPsQ4AMW
         0m78749lo/E54LzZHfZ6eW5u3Hz81T4vK4Yt6DFzcD/nsccHUws1FtrLVUrhJUoIgX7Y
         bJF9gfGhVC6jbfESLeT0+jP9HMFJhf5dZomE8795epRHcZZNAnUajPoicHXlVYsDzbgo
         f4JOVDk2+yMrQuGGRvSnjOCeNHVuaxJ+fOYEJ/I1aYeQ6/eVudfTyYV3UZrGHslkQWdI
         gnzM5rRgWbWxAvGHwFsJf3jCus6CCSYlJo/tIad+k8n3YXOgISa82omVKmWmPpjPo3d8
         /csw==
X-Forwarded-Encrypted: i=1; AJvYcCWdO+4ngumPKPHOT367XqAsoH+wGDjYoF0O6pbMpccjDkotsuOSbA46XpYBWAMyy58aVvWCOwwa7k0f0tRHqviCpXYjKsSARznHnLKzxhrb
X-Gm-Message-State: AOJu0Yyfrok2qoBYLjHxqxxmVY0AJXfNwCDx04SiuschrSx7ihx3eh2z
	BWGXVGCD5Wr2HrxSAQZgHzWVl8R7jsKdhom3iEUpLbWg5aqbE9UPJUS0tobO52TMCcw0RwVupkU
	N5DVbEZO3/dERc3FxMssX1cDx6NVytQuQMA7dAvS3HB8ovdnzTtK0S8JG+n4MnFGYVAdfcapTst
	E2k9mKXg==
X-Received: by 2002:a17:907:d2cc:b0:a7a:b73f:7584 with SMTP id a640c23a62f3a-a8366d5cb0bmr234838966b.34.1723647407410;
        Wed, 14 Aug 2024 07:56:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCL8sD4kYOs9Y0VCnij/xL6fidS5/kQa/PnagADzJKqqhOA3GoZ+LuJZSindcfAjitSTS30g==
X-Received: by 2002:a17:907:d2cc:b0:a7a:b73f:7584 with SMTP id a640c23a62f3a-a8366d5cb0bmr234836466b.34.1723647406648;
        Wed, 14 Aug 2024 07:56:46 -0700 (PDT)
Received: from stitch.. ([2a01:4262:1ab:c:bbf4:eba3:898f:7501])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bdcbsm182316866b.105.2024.08.14.07.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:56:46 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v1 3/9] Revert "irqchip/sifive-plic: Improve locking safety by using irqsave/irqrestore"
Date: Wed, 14 Aug 2024 16:56:35 +0200
Message-ID: <20240814145642.344485-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_075655_762779_6D45BEEF 
X-CRM114-Status: GOOD (  12.69  )
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

This reverts commit abb7205794900503d6358ef1fb645373753a794d.

This is a prerequisite to reverting the patch converting the PLIC into a
platform driver. Unfortunately this breaks booting the Allwinner D1 SoC.

Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/irqchip/irq-sifive-plic.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index f3d4cb9e34f7..cbccd1da3ea1 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -103,11 +103,9 @@ static void __plic_toggle(void __iomem *enable_base, int hwirq, int enable)
 
 static void plic_toggle(struct plic_handler *handler, int hwirq, int enable)
 {
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&handler->enable_lock, flags);
+	raw_spin_lock(&handler->enable_lock);
 	__plic_toggle(handler->enable_base, hwirq, enable);
-	raw_spin_unlock_irqrestore(&handler->enable_lock, flags);
+	raw_spin_unlock(&handler->enable_lock);
 }
 
 static inline void plic_irq_toggle(const struct cpumask *mask,
@@ -244,7 +242,6 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type)
 static int plic_irq_suspend(void)
 {
 	unsigned int i, cpu;
-	unsigned long flags;
 	u32 __iomem *reg;
 	struct plic_priv *priv;
 
@@ -262,12 +259,12 @@ static int plic_irq_suspend(void)
 		if (!handler->present)
 			continue;
 
-		raw_spin_lock_irqsave(&handler->enable_lock, flags);
+		raw_spin_lock(&handler->enable_lock);
 		for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
 			reg = handler->enable_base + i * sizeof(u32);
 			handler->enable_save[i] = readl(reg);
 		}
-		raw_spin_unlock_irqrestore(&handler->enable_lock, flags);
+		raw_spin_unlock(&handler->enable_lock);
 	}
 
 	return 0;
@@ -276,7 +273,6 @@ static int plic_irq_suspend(void)
 static void plic_irq_resume(void)
 {
 	unsigned int i, index, cpu;
-	unsigned long flags;
 	u32 __iomem *reg;
 	struct plic_priv *priv;
 
@@ -294,12 +290,12 @@ static void plic_irq_resume(void)
 		if (!handler->present)
 			continue;
 
-		raw_spin_lock_irqsave(&handler->enable_lock, flags);
+		raw_spin_lock(&handler->enable_lock);
 		for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {
 			reg = handler->enable_base + i * sizeof(u32);
 			writel(handler->enable_save[i], reg);
 		}
-		raw_spin_unlock_irqrestore(&handler->enable_lock, flags);
+		raw_spin_unlock(&handler->enable_lock);
 	}
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

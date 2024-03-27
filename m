Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD12C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 05:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9KNATpPd5ZegXWwbo8ru8RqOW+TABkCxP4EYC2fSXn4=; b=lQEpmROqRV2ucW
	CtwfW50v6+sE9bUE7E1yGs9sNfsudYGJrmf12E0en/d7jFBTfOeIs3Dr1DE+rM7py14gU+JTjcZSP
	DokCAY1HirxG/BMH8YmOG6kiL4SJmLFdTx/3MnHThiWGkvyZSCISojjjq9zfUGTj07zGmFrDLTtMK
	Qe5T4c5lGBYsZ7oZkL/cnIje1XrqKFy4K2/QvfXMCzxGeJrBYhunuJ+LArEaiuTbUkVa/ep+SBSz7
	Sv6697kVa+wkRmP5tQcxvCitHVH2BU/MvXIbhR8M9j+acpbU+4ar5yD/itf5w5iJG4wD2C2Ch0frH
	r34LEFCOcfWHMcMBWH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpM6a-00000007ZGp-0TJ2;
	Wed, 27 Mar 2024 05:45:44 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpM6W-00000007ZGG-3S0K
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 05:45:42 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5a56a22004cso1078572eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 22:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711518339; x=1712123139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B1O4HrXUCV4MTrLSUHq40tp2u1LonHFNpKtBMnLkU4Q=;
        b=YcMirBVQrGEVc6sZCJB8HT0Jwrzq0p4uxL6ow/p6sKjtv9Rjrmw0fv3lRs7JuEcEfY
         Y9wE1yIHifoE8wIx4tFe+B5jfFBmB/FUnW8Vc2fjsvpFBQp0OxkYHtrAtfts4s+wvt1U
         BBri8cdkNw9VqTKqadaBYn2SqU6GQZ/XwkUX/FkCdRMtS7z3RIGYnNf9CO3aC904P8KF
         7oJhxjyaOWCQQtprjQtO4XuPhLftz5FabO13cDOE9/BoX/WWTksmI4ErTMG7tsbOzOM1
         Br4OiWYIh4fyReGIrMCVMaYktVzDtYznLOKi26WPHUOUX3tx8Y+Xw0A7PvEQ/QirTE/D
         yxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711518339; x=1712123139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1O4HrXUCV4MTrLSUHq40tp2u1LonHFNpKtBMnLkU4Q=;
        b=M+Vfj50VKHdqefd1VsJRpt/PQBVTW5KBEXVi+o7eXc0maeAcm4Vdiq1IKvW9UweJuI
         Ch3NmGYg+LMqoNXgPyIYGM/qQwmjEh1nLGe7iV6CTV3pZ5zKiGIaFZXPh9GJyUEZHBHC
         /cPwhwpLCnp7HK3f97Wa01DPgt1kDI3MIkY1UzNMr9TkjpqalKoPOGiGcQjRRHHh34pg
         CKv15T/f8S/GAX0Kwvixyqw98Ye/T+VQ8P304MLfoKsHLMK/ox5ZxCFPsgvbhCiiYlCH
         zYdRSWlrzA+9XyIqLYeFeNLPXIxZHaXLz+gI0sz7u2Bl5FPd3x1hgOotx3RF5mjFo9XZ
         Q5Cg==
X-Forwarded-Encrypted: i=1; AJvYcCV1hOGJ3lNRD0wFGkt3PHFoIDkwNq0TC3sP7/uA0GEjGeHTlV94WObI0/5CcdoU7VkpO33R6Vk9ZJ7dvasNWoi24XmdT2ilw6IxHx7LhMRg
X-Gm-Message-State: AOJu0YzrfV/Sr9/tqKzZKTuqGRAezlDOuracp8LyASIDqNndqqfUqkcN
	s1wTDSyR/yJiHItR+cB3MnMrKvqds5JFtpWZzXeISKDxogUaq359gktUiIzHW8o=
X-Google-Smtp-Source: AGHT+IH6LKE2qtw8a/Zvce9y/zXj8SNbfYrNTQipSKpUP4GisfAUe9jdUYEsOKlSbpnzK8+jvoSQ1g==
X-Received: by 2002:a05:6358:2d8d:b0:17f:8831:2b7c with SMTP id m13-20020a0563582d8d00b0017f88312b7cmr3720954rwn.25.1711518339245;
        Tue, 26 Mar 2024 22:45:39 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id v62-20020a632f41000000b005cf450e91d2sm7405772pgv.52.2024.03.26.22.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 22:45:38 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Conor Dooley <conor@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] cache: sifive_ccache: Partially convert to a platform driver
Date: Tue, 26 Mar 2024 22:45:24 -0700
Message-ID: <20240327054537.424980-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_224540_918628_20383D4C 
X-CRM114-Status: GOOD (  19.85  )
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

Commit 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a
platform driver") broke ccache initialization because the PLIC IRQ
domain is no longer available during an arch_initcall:

  [    0.087229] irq: no irq domain found for interrupt-controller@c000000 !
  [    0.087255] CCACHE: Could not request IRQ 0

Fix this by moving the IRQ handling code to a platform driver.

Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/cache/sifive_ccache.c | 72 ++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 26 deletions(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 89ed6cd6b059..e9cc8b4786fb 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -15,6 +15,8 @@
 #include <linux/of_address.h>
 #include <linux/device.h>
 #include <linux/bitfield.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
 #include <asm/cacheflush.h>
 #include <asm/cacheinfo.h>
 #include <asm/dma-noncoherent.h>
@@ -247,13 +249,49 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
 	return IRQ_HANDLED;
 }
 
+static int sifive_ccache_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	unsigned long quirks;
+	int intr_num, rc;
+
+	quirks = (unsigned long)device_get_match_data(dev);
+
+	intr_num = platform_irq_count(pdev);
+	if (!intr_num)
+		return dev_err_probe(dev, -ENODEV, "No interrupts property\n");
+
+	for (int i = 0; i < intr_num; i++) {
+		if (i == DATA_UNCORR && (quirks & QUIRK_BROKEN_DATA_UNCORR))
+			continue;
+
+		g_irq[i] = platform_get_irq(pdev, i);
+		if (g_irq[i] < 0)
+			return g_irq[i];
+
+		rc = devm_request_irq(dev, g_irq[i], ccache_int_handler, 0, "ccache_ecc", NULL);
+		if (rc)
+			return dev_err_probe(dev, rc, "Could not request IRQ %d\n", g_irq[i]);
+	}
+
+	return 0;
+}
+
+static struct platform_driver sifive_ccache_driver = {
+	.probe	= sifive_ccache_probe,
+	.driver	= {
+		.name		= "sifive_ccache",
+		.of_match_table	= sifive_ccache_ids,
+	},
+};
+
 static int __init sifive_ccache_init(void)
 {
 	struct device_node *np;
 	struct resource res;
-	int i, rc, intr_num;
 	const struct of_device_id *match;
 	unsigned long quirks;
+	int rc;
 
 	np = of_find_matching_node_and_match(NULL, sifive_ccache_ids, &match);
 	if (!np)
@@ -277,28 +315,6 @@ static int __init sifive_ccache_init(void)
 		goto err_unmap;
 	}
 
-	intr_num = of_property_count_u32_elems(np, "interrupts");
-	if (!intr_num) {
-		pr_err("No interrupts property\n");
-		rc = -ENODEV;
-		goto err_unmap;
-	}
-
-	for (i = 0; i < intr_num; i++) {
-		g_irq[i] = irq_of_parse_and_map(np, i);
-
-		if (i == DATA_UNCORR && (quirks & QUIRK_BROKEN_DATA_UNCORR))
-			continue;
-
-		rc = request_irq(g_irq[i], ccache_int_handler, 0, "ccache_ecc",
-				 NULL);
-		if (rc) {
-			pr_err("Could not request IRQ %d\n", g_irq[i]);
-			goto err_free_irq;
-		}
-	}
-	of_node_put(np);
-
 #ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
 	if (quirks & QUIRK_NONSTANDARD_CACHE_OPS) {
 		riscv_cbom_block_size = SIFIVE_CCACHE_LINE_SIZE;
@@ -315,11 +331,15 @@ static int __init sifive_ccache_init(void)
 #ifdef CONFIG_DEBUG_FS
 	setup_sifive_debug();
 #endif
+
+	rc = platform_driver_register(&sifive_ccache_driver);
+	if (rc)
+		goto err_unmap;
+
+	of_node_put(np);
+
 	return 0;
 
-err_free_irq:
-	while (--i >= 0)
-		free_irq(g_irq[i], NULL);
 err_unmap:
 	iounmap(ccache_base);
 err_node_put:
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

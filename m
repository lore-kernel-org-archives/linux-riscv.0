Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC522C52D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PBCNpMY0Cz5QDA22YnCQ0CZ3/TH1xeJ4Y69th/YxAk4=; b=JrWArVqIZ4Z/S8
	Hbu9m28B+Xb5J6kW8U5XmacXSSzEWpnmFNJDYcXCogWdqU/dRC4vJ0MyJvQr6zl8j3oRCV6RlSrM5
	gjs0VszET7T/+vsbno9bg+Kv8eWMDgYayxj2EVDJyQ0TNgK+lFVVcRYxNE2GqUXXEYoUZq9GIa0A/
	Z36yju1UxdzRTWh1cs1fVkcRt3wzMC2DT4fRX6mPqaTxIYAzJh2hQQ15pryPZa7yygSi+M4rNRAaY
	F3yLkreN1hg0HvWerCSzWfsfkRbnSoehfDn69Tff7AtcRL2FCNB/BLH1LQdT3/OYCRpNGUa4Ph1Ez
	CxEDQVBj++kpYbn6c9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFRp-00000007OOP-3JF4;
	Wed, 14 Aug 2024 14:58:01 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFQn-00000007O4F-260v
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 14:56:59 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A399141236
	for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723647413;
	bh=gWgIkbru9J14+uAT7SsXnPIjWj2SSXnesiQDy0WXkBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=hd0qu165qcNd1CnIQKU3ij/j7WJ5nYe96WJoiIYACue+uzFDdoqgDOv3+BT/mM8v+
	 FNZSmBev7unTwxKBlHyG3CqYEdMgWW0SHmSp3gdkLpoMDThsAZzGwjV4rpZJxc+/ZE
	 WX6RAmAUfgmv89TSbIijchj/I5XZ35XpdhtHYmYM4+eJIL9gwxxe0wPnlAj68OWVVZ
	 hsiOCihXlE5L2YynTUwDotSvWYLJBfe8payWpTRe5QT0GoR/3mrMxllHaMJaxx1ZgK
	 g+g4eL2gDdgpefXwO5n12NmfB2r79WD16jPW9fgnW3ahcfKBYAiGGsIPlXljpaWTXW
	 60Xk8Ccdhdhzw==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a7d63fbf4afso646946566b.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 07:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647412; x=1724252212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWgIkbru9J14+uAT7SsXnPIjWj2SSXnesiQDy0WXkBA=;
        b=ZyfojVEkg9k5N6/4hd/QUTOmQa/EOVtBdV5+LZdOyZNWTQ8Xzph3ZpLm86NbwRVDzN
         G2pAIOXkQkYwZESKLRFaV4sjIVKhBR/E7slZiEtLMOwgzQSebw3h6/gDs8qk8wjD8UEH
         wy0Y4pHzNplwt1rHHBgvRwg+nKQ4gYqeljDZss3MtIWr5UFzfB6bDhxxe2QSdU2zMhes
         +tUKx6HOipy884FOqCnyJ15P3KZIz9x3WZZLevOF3URZ8VSLPk9Hwldld/YW51ZL76hK
         eFGc7mc60VNinFHrfROMZ53wzHryZHUIwWIONp2nGFoQRs2YuEfYyk0ogLTpwnBqNtjK
         cIpw==
X-Forwarded-Encrypted: i=1; AJvYcCW7OttFrOhBEdfosLf1Krg4mxn5SkgzcD+jr5x51cbftJWyS1KqAh9DBqbdIJ706ZmmjL6L0stVB8QjZZr27QyASVAHhvuL6xliw9viF1ws
X-Gm-Message-State: AOJu0YygPknw20YeHp1HHToqCuDiCzmHa4lGd5RkzJmCahEh2O55CLCx
	4Xq9BWIMj193YQ24ZmDQq+4EMDGqZFiJ5mrz29sX2Fr245A3+AQW0IpkBUsTzh2e5N8Avhll+Il
	xtLWHdLc1XIg7tkEnJGjdPR+Gr31BYslvK51b+kogwUSlETtTGOZ6OZbinU/ioMLa+6IVq4vlRh
	ZbAWnw0A==
X-Received: by 2002:a17:907:e211:b0:a7d:edb2:21f5 with SMTP id a640c23a62f3a-a8366c30b5bmr210882766b.12.1723647411980;
        Wed, 14 Aug 2024 07:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh6y5MIdajZhV+9ZDD5gd/Pe4FLfBYyKgl9kFrMLGCKwzpnlebrJ2F89sA/4+Bqhck6YeZgQ==
X-Received: by 2002:a17:907:e211:b0:a7d:edb2:21f5 with SMTP id a640c23a62f3a-a8366c30b5bmr210879766b.12.1723647411267;
        Wed, 14 Aug 2024 07:56:51 -0700 (PDT)
Received: from stitch.. ([2a01:4262:1ab:c:bbf4:eba3:898f:7501])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bdcbsm182316866b.105.2024.08.14.07.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:56:50 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v1 8/9] Revert "irqchip/sifive-plic: Use dev_xyz() in-place of pr_xyz()"
Date: Wed, 14 Aug 2024 16:56:40 +0200
Message-ID: <20240814145642.344485-9-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_075657_796335_B2DEB242 
X-CRM114-Status: GOOD (  15.59  )
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

This reverts commit 25d862e183d4efeb5e8b9843d783c90aaae4b14a.

This is a prerequisite to reverting the patch converting the PLIC into a
platform driver. Unfortunately this breaks booting the Allwinner D1 SoC.

Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/irqchip/irq-sifive-plic.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 7cf06bbb3098..ac274e1166c3 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2017 SiFive
  * Copyright (C) 2018 Christoph Hellwig
  */
+#define pr_fmt(fmt) "plic: " fmt
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -376,10 +377,9 @@ static void plic_handle_irq(struct irq_desc *desc)
 	while ((hwirq = readl(claim))) {
 		int err = generic_handle_domain_irq(handler->priv->irqdomain,
 						    hwirq);
-		if (unlikely(err)) {
-			dev_warn_ratelimited(handler->priv->dev,
-					     "can't find mapping for hwirq %lu\n", hwirq);
-		}
+		if (unlikely(err))
+			pr_warn_ratelimited("can't find mapping for hwirq %lu\n",
+					hwirq);
 	}
 
 	chained_irq_exit(chip, desc);
@@ -407,7 +407,7 @@ static int plic_starting_cpu(unsigned int cpu)
 		enable_percpu_irq(plic_parent_irq,
 				  irq_get_trigger_type(plic_parent_irq));
 	else
-		dev_warn(handler->priv->dev, "cpu%d: parent irq not available\n", cpu);
+		pr_warn("cpu%d: parent irq not available\n", cpu);
 	plic_set_threshold(handler, PLIC_ENABLE_THRESHOLD);
 
 	return 0;
@@ -483,7 +483,7 @@ static int plic_probe(struct platform_device *pdev)
 		unsigned long hartid;
 
 		if (of_irq_parse_one(to_of_node(dev->fwnode), i, &parent)) {
-			dev_err(dev, "failed to parse parent for context %d.\n", i);
+			pr_err("failed to parse parent for context %d.\n", i);
 			continue;
 		}
 
@@ -506,13 +506,13 @@ static int plic_probe(struct platform_device *pdev)
 
 		error = riscv_of_parent_hartid(parent.np, &hartid);
 		if (error < 0) {
-			dev_warn(dev, "failed to parse hart ID for context %d.\n", i);
+			pr_warn("failed to parse hart ID for context %d.\n", i);
 			continue;
 		}
 
 		cpu = riscv_hartid_to_cpuid(hartid);
 		if (cpu < 0) {
-			dev_warn(dev, "Invalid cpuid for context %d\n", i);
+			pr_warn("Invalid cpuid for context %d\n", i);
 			continue;
 		}
 
@@ -531,7 +531,7 @@ static int plic_probe(struct platform_device *pdev)
 		 */
 		handler = per_cpu_ptr(&plic_handlers, cpu);
 		if (handler->present) {
-			dev_warn(dev, "handler already present for context %d.\n", i);
+			pr_warn("handler already present for context %d.\n", i);
 			plic_set_threshold(handler, PLIC_DISABLE_THRESHOLD);
 			goto done;
 		}
@@ -581,8 +581,8 @@ static int plic_probe(struct platform_device *pdev)
 		}
 	}
 
-	dev_info(dev, "mapped %d interrupts with %d handlers for %d contexts.\n",
-		 nr_irqs, nr_handlers, nr_contexts);
+	pr_info("%pOFP: mapped %d interrupts with %d handlers for %d contexts.\n",
+		to_of_node(dev->fwnode), nr_irqs, nr_handlers, nr_contexts);
 	return 0;
 
 out_free_enable_reg:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

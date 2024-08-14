Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76505C52D7D
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Avyf3l3dM278FuxwwIquAdfHAUCZm06HGAwwZibQyac=; b=0g5OqL8iErEgBt
	3h7hw0kO+JqHnUP+PsAYvMr0NeHq0TQ/FLB6EjxC/9XDuxclEFU6H2VdaXXWuzHKsNEeytOiHQf/a
	kT6nmHqAlLCYPztkiU1XVMRvkwCtotA6K/sYOo1LUmWBLxPhjyNeS7tSN8b3L1LL7m2szhRprI8yT
	iEUWwaiH/gWhzN2C7BCCD9Y4xxJKu1qvBekO6Ab1YTuNTAt6ax4G8yk7RSReCb7BdGyrthQb0s7Lc
	rbh4Sx3Tgaw7W8HHfnE1mAhxr74HxD9RnX4r9r4UBoqcl7LdccQ/bD0Iwpw/SuFN6vG2m1EC4s51k
	Z5eQSeXhKQkAEl/v+JCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFRl-00000007OLC-1ZuA;
	Wed, 14 Aug 2024 14:57:57 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFQi-00000007O1p-3G6w
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 14:56:55 +0000
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AB353402ED
	for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 14:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723647409;
	bh=2pXv+ysc8ToXtQ+ey2s0xoldhLum5hMAS4b7voRBoVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=EylwTyxsIh2eCpMDk7Ujf7R8k8f7DvHbxaUouUtLmKXejCjRWA1Txkxc5jenfSi5b
	 RGfaU8dUj1Kn0n/y2R7lSf/fHHQu6D5e3cDRzQJt4Qo1Mf+I2ZjImQRXANwvvotNn+
	 RgChsvMWKg2nqMyrWGp3JieLdKUnUqkStEbRk9QAF7pXck+yB8ePTwTHht2pdzMChE
	 MHeBrgnzcz3fDtXl4gcJCUnPxqDFQtRJgtiw1sca6Z2SUwxdPRgwf/8Tap+hIpdcss
	 VtX+pmkpEDHqgJJ5xecCmNlJvJ1oUei3QfZmJIH236FeXl4/VZu8gn3rgTclG9GgxL
	 IjozPZ6KFn76Q==
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ef3157ae4cso74104571fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 07:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647408; x=1724252208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pXv+ysc8ToXtQ+ey2s0xoldhLum5hMAS4b7voRBoVU=;
        b=HwpnA6WOnaIxOCW1oFxTzL58+o9DhNFMPuU8fD8dVJzzFBKlqr4S+0E2WDI+jOiDHu
         P0sHkJkidFDsZXtTSG8amz3jsCvufv8xcJNFiCeaIY4UlBYeDI4G2nIgrQtSsK/vN8Dr
         2bSHyWN3UX/HqtNSUfYlEwcYio2P6rTLgPMSe0BGmll628IWetQRSukpkMeDtNQZbOCh
         p/Id0DMAnlHR8M6cA0PqADxf9jXi4F4FjaiDmXgBkb7j/BVlmKcScJMKRPS+QpDIl9tQ
         ErBiwDKyd715iT2c787AW6Hv/OzzTcQhkYKLPs2B9ttwM3fW02dLikX/iveJNsGT3Xyu
         KuyA==
X-Forwarded-Encrypted: i=1; AJvYcCUGpQpsQ3+2z931hE08M+2DuyW/CmNXukZvZedvfcHqIjEo7c5egZjO0AKWWbUNH2COiBNE4Z4/JKreVqxYbZRJGpSeiwJJMGXijc9yEsdh
X-Gm-Message-State: AOJu0Yxo4ls4Ix0YhhBSgikCJPdmNEV0Ai4urLqr0e6ByNBGPfFllvHe
	Dxus1lx8IJHx4hsXw58hQhIvno0dCCjSkbz4uzAh9qS+xHW9rqiupZXzqgrw/6yjeU+ZytW0sL5
	4d9y62POmlGN8hGp3F31/KTlnJe1tz86QScYgPdLvcxCb1kiO/37Pk1gv0rtIwJmFk9Z9ehI2kA
	07jMAuyg==
X-Received: by 2002:a05:6512:3191:b0:52c:a20e:4da4 with SMTP id 2adb3069b0e04-532edbc05f7mr2571841e87.57.1723647408465;
        Wed, 14 Aug 2024 07:56:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF17QlVvCQ6SWsWAYWiNwbZ+WPFwxcRul+yZa2TRiM0FXs/GSQZrNmNRfbmzWrcCJByT8/6lw==
X-Received: by 2002:a05:6512:3191:b0:52c:a20e:4da4 with SMTP id 2adb3069b0e04-532edbc05f7mr2571804e87.57.1723647407430;
        Wed, 14 Aug 2024 07:56:47 -0700 (PDT)
Received: from stitch.. ([2a01:4262:1ab:c:bbf4:eba3:898f:7501])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bdcbsm182316866b.105.2024.08.14.07.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:56:47 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v1 4/9] Revert "irqchip/sifive-plic: Parse number of interrupts and contexts early in plic_probe()"
Date: Wed, 14 Aug 2024 16:56:36 +0200
Message-ID: <20240814145642.344485-5-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_075653_153795_BE19631B 
X-CRM114-Status: GOOD (  15.65  )
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

This reverts commit 95652106478030f54620b1f0d28f78ab110b3212.

This is a prerequisite to reverting the patch converting the PLIC into a
platform driver. Unfortunately this breaks booting the Allwinner D1 SoC.

Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/irqchip/irq-sifive-plic.c | 43 +++++++------------------------
 1 file changed, 10 insertions(+), 33 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index cbccd1da3ea1..b4c4050a02fb 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -423,34 +423,6 @@ static const struct of_device_id plic_match[] = {
 	{}
 };
 
-static int plic_parse_nr_irqs_and_contexts(struct platform_device *pdev,
-					   u32 *nr_irqs, u32 *nr_contexts)
-{
-	struct device *dev = &pdev->dev;
-	int rc;
-
-	/*
-	 * Currently, only OF fwnode is supported so extend this
-	 * function for ACPI support.
-	 */
-	if (!is_of_node(dev->fwnode))
-		return -EINVAL;
-
-	rc = of_property_read_u32(to_of_node(dev->fwnode), "riscv,ndev", nr_irqs);
-	if (rc) {
-		dev_err(dev, "riscv,ndev property not available\n");
-		return rc;
-	}
-
-	*nr_contexts = of_irq_count(to_of_node(dev->fwnode));
-	if (WARN_ON(!(*nr_contexts))) {
-		dev_err(dev, "no PLIC context available\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int plic_parse_context_parent(struct platform_device *pdev, u32 context,
 				     u32 *parent_hwirq, int *parent_cpu)
 {
@@ -499,26 +471,31 @@ static int plic_probe(struct platform_device *pdev)
 			plic_quirks = (unsigned long)id->data;
 	}
 
-	error = plic_parse_nr_irqs_and_contexts(pdev, &nr_irqs, &nr_contexts);
-	if (error)
-		return error;
-
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->dev = dev;
 	priv->plic_quirks = plic_quirks;
-	priv->nr_irqs = nr_irqs;
 
 	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (WARN_ON(!priv->regs))
 		return -EIO;
 
+	of_property_read_u32(to_of_node(dev->fwnode), "riscv,ndev", &nr_irqs);
+	if (WARN_ON(!nr_irqs))
+		return -EINVAL;
+
+	priv->nr_irqs = nr_irqs;
+
 	priv->prio_save = devm_bitmap_zalloc(dev, nr_irqs, GFP_KERNEL);
 	if (!priv->prio_save)
 		return -ENOMEM;
 
+	nr_contexts = of_irq_count(to_of_node(dev->fwnode));
+	if (WARN_ON(!nr_contexts))
+		return -EINVAL;
+
 	for (i = 0; i < nr_contexts; i++) {
 		error = plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu);
 		if (error) {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

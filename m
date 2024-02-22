Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8E8C48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 09:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aq9W85ebYGVvprMew3dPO+Zujft+a4+hH3XIvRSTqkY=; b=s/epXedinxmICE
	2HWYtNPu8sT4fq8dRRFJbg3Pb+WfJ6/CDF+FgvE/006ieqFsWc2DiFszs/jg3GOcDpVcl07NrzQv1
	xUYozn3xKC9rmfulXBsYJ1dlhf/yClNnb9Md+S0RWh1cN2+VwaTaEKH4kEpg2A+m5QYykf/8tggeb
	fpF/RnRRoBom0JtWFwMJnfMgblGEeeJEPiuE1SeyvviRyufanqT+/rNgQENGPbKAPKoRz9ZLZw3a8
	2+fGjHYvXEtGsTxAM8F/zU9/Fp1wsDV4pI9RKnd1ON7UEchtJGN+PzVgvDI5r3A8+yB/l8X7mwrmF
	3Z03jtaKdh//RATv96uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5ak-00000004J3t-3sLZ;
	Thu, 22 Feb 2024 09:42:10 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5Zi-00000004IDK-0AoX
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 09:41:08 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3bb9d54575cso1036724b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 01:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708594865; x=1709199665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67myGQfWdG/NTMsWtbLvxenqOsS6MBirvNDOIPSERro=;
        b=NEldiQJU+eS/KsTYbjPBSQhKkJVJQTMNOFJCQlRDw1MdTcZYBrSw0E9XmF5CnzOJkf
         Ofaznnx4SYl6+5J/eMfKkFTsPoBcWjdisDF63MNfFIkU4tYJx95DuqZKirh0wajmq+4B
         pmg7nmB+6VMlvD09KRG9rrqg5aDIbNFNEQ5Es+bHMTpyeY4YJnPN4CoZ77TneEpX19vH
         N/i4L3fFcrCcTIeST3M3wQDoREn6EauCrx4kVEi8V329HYGGez562jJorumijwgeig7S
         9ft2SRQHXskTTt2fnvAg+ZBwLAMoqiPHde3AFgBR5cWSyRqkrBmLmsksgrxAiatvB5rg
         6DFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594865; x=1709199665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67myGQfWdG/NTMsWtbLvxenqOsS6MBirvNDOIPSERro=;
        b=sxmeQuOhLMA6ON/QkE/4cUwfstxp7w+9WvVt8g0ePKNp7yOgdUrOw9arxeZI87neo+
         iztb8ojavb9zcBNzzUpW64KURfluPXUrO4POAhc6V18lsiLBP9KP7kz4V2hkO1YTNYiu
         PVDeNmuBXEoGUlCA9kRPMdqymUOd1UDVL18eyOH9h2etfe2Yub37mLybwWvUxr4q6fC4
         vil3u8neeNecNXYgQV9F8N5orF24bFyt0O79pbWPLpXXyo2XshmwAxz6c2kqP2TXNAek
         50it4s+FSDrxTHk8WwRDxXk01PwIlPbviSoPJ/5ERQLc4MQeIBAMR/riWRsyYjykqsO7
         yh5w==
X-Forwarded-Encrypted: i=1; AJvYcCXkguyJ6m5tLYucbOA/rcjDNJ615VMNHKc5rq0hv0ZRKfkLrTc2QHQyhW7lXTy6q5/n30iXSrWjfYuvzhuSpk3vsYrTDupkQl/JzqhhnsSL
X-Gm-Message-State: AOJu0YwZx3KVTTS/1KDZig6367rU0y4q6cAZb3akxmrHBhyycYnmhCv5
	TopYYb0WR79uV6E3jrHUnbjSfqcEt+8ZCI060kkfaoY/szmo6g6wM+yc1rD7QLA=
X-Google-Smtp-Source: AGHT+IEWljpjWcYNh6FWyteZzNizntERHCcdcGk1xA11bQ1Y2eMKvSMWtR4dupwFnRtiGSJXRVaPQw==
X-Received: by 2002:a05:6808:200a:b0:3c1:54c9:be7b with SMTP id q10-20020a056808200a00b003c154c9be7bmr14031502oiw.12.1708594865151;
        Thu, 22 Feb 2024 01:41:05 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n15-20020a05680803af00b003c17c2b8d09sm130699oie.31.2024.02.22.01.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:41:04 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v14 06/18] irqchip/sifive-plic: Parse number of irqs and contexts early in plic_probe
Date: Thu, 22 Feb 2024 15:09:54 +0530
Message-Id: <20240222094006.1030709-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222094006.1030709-1-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_014106_298838_8E680B08 
X-CRM114-Status: GOOD (  15.77  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SiFive PLIC driver needs to know the number of irqs and contexts
to complete initialization. Parse these details early in plic_probe()
to avoid unnecessary memory allocations and register mappings if these
details are not available.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 43 ++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index f0df5d0cb76e..e6d23fde51ed 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -416,6 +416,34 @@ static const struct of_device_id plic_match[] = {
 	{}
 };
 
+static int plic_parse_nr_irqs_and_contexts(struct platform_device *pdev,
+					   u32 *nr_irqs, u32 *nr_contexts)
+{
+	struct device *dev = &pdev->dev;
+	int rc;
+
+	/*
+	 * Currently, only OF fwnode is supported so extend this
+	 * function for ACPI support.
+	 */
+	if (!is_of_node(dev->fwnode))
+		return -EINVAL;
+
+	rc = of_property_read_u32(to_of_node(dev->fwnode), "riscv,ndev", nr_irqs);
+	if (rc) {
+		dev_err(dev, "riscv,ndev property not available\n");
+		return rc;
+	}
+
+	*nr_contexts = of_irq_count(to_of_node(dev->fwnode));
+	if (WARN_ON(!(*nr_contexts))) {
+		dev_err(dev, "no PLIC context available\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int plic_parse_context_parent(struct platform_device *pdev, u32 context,
 				     u32 *parent_hwirq, int *parent_cpu)
 {
@@ -464,31 +492,26 @@ static int plic_probe(struct platform_device *pdev)
 			plic_quirks = (unsigned long)id->data;
 	}
 
+	error = plic_parse_nr_irqs_and_contexts(pdev, &nr_irqs, &nr_contexts);
+	if (error)
+		return error;
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->dev = dev;
 	priv->plic_quirks = plic_quirks;
+	priv->nr_irqs = nr_irqs;
 
 	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (WARN_ON(!priv->regs))
 		return -EIO;
 
-	of_property_read_u32(to_of_node(dev->fwnode), "riscv,ndev", &nr_irqs);
-	if (WARN_ON(!nr_irqs))
-		return -EINVAL;
-
-	priv->nr_irqs = nr_irqs;
-
 	priv->prio_save = devm_bitmap_zalloc(dev, nr_irqs, GFP_KERNEL);
 	if (!priv->prio_save)
 		return -ENOMEM;
 
-	nr_contexts = of_irq_count(to_of_node(dev->fwnode));
-	if (WARN_ON(!nr_contexts))
-		return -EINVAL;
-
 	for (i = 0; i < nr_contexts; i++) {
 		error = plic_parse_context_parent(pdev, i, &parent_hwirq, &cpu);
 		if (error) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

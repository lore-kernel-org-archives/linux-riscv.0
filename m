Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D0CC46CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJwzDtdxNANqQBrvApmT3MPNoIUfwODfs4G6V3PbX9A=; b=wiTh35lH3KfEaE
	alwUGbtdHZ1rp6okj1bfadijK+Cp3DIbqstD+Fu8apJ6slkuA8GLP9igyNyYuVFwpPSpXsphjvlah
	Zv8MkU6OYYIAdXSalzWqP8OePsYQDoO7vPRhgv2wQfy+ie40mymgVJBbCsPg+tzlpRsN3f5a+5cSs
	Ssp/yYLz/o8u+5axF2X121dKN2k+MbgbEVRZFrRW0AevCFyK9OvV9G88PGqDfUQ6flgofKlNS90NZ
	eTcDYz++Q44n0568AKQ3qno0x6wYE8IzXyw3obKO3bEd/1PrJeBPdJRw7XNPnDlQBbiFR5uuImxer
	smOhU+hPZeNfQuMzyObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAg-00F0t9-28;
	Tue, 19 Dec 2023 17:46:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeAT-00F0ke-19
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 17:46:10 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d39afa1eecso29689685ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 09:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703007969; x=1703612769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LBkXmYKNUx+bSYPP6p7CLC2p/4CszGfBGCJeSRJvdc=;
        b=L9L/N++gd3RL+jsEdhZohtnewTO9PbnhJJf12Nhj1knvQhK8TiQarLZtvEbuWFX7e0
         38BF6SbjpcJGJohWCRd2g2gLL6MqVnVIMcBp8ygquxJjLHZVw7JQnq1Tn881ciZ+frEL
         06pZT9bkOLhRagq5gQEL8ctB2POiUOUkQzqTYlHq1pekzFakfx9lG5iRo8CJFR/nD9I0
         y5+6X66h2NWb/ao9lx/H1PvT5SMdmzEUa8ouXm7m35BI2uzR/ALalf6gD61pt7RektXT
         E67y/zNVfUnCYbQIYplkEhGMBT/EkK1upZJsx0GqUyYfT5RTv9z98UXAHeTogygcfv5Q
         bilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703007969; x=1703612769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LBkXmYKNUx+bSYPP6p7CLC2p/4CszGfBGCJeSRJvdc=;
        b=Y7rqOPTGN2vQA/1jz3HvSlVFWURhRDHlzlQsFySa202ztEq2IYpVHfBwSslG/KLZqD
         1Fo+YhEM8ZwJZiwDK82hRs+du95SIFOMpNXTNZH9sw2J2O9ijaQmwjEgzAxK7yG4/j9y
         hMGZTAOmd5hW3pLcWmF4Kwd0cx3wTb9eDzUvkc5xDiNLVMoFhz6kCJEZtKYItFZncp6F
         BvZo2HBthws9arIgzHq4FquOvPklcTPPZck8ZYIPQC86BsI7GsJ6b+SvHsT2ZZDapsIH
         hwTngzWFnJLya7gd81jhpTwMGj/0PLASi8ddFBiqZyOJhZ/Mo+tHCjol6GXk3Pie4u1y
         N20Q==
X-Gm-Message-State: AOJu0YwbRdLSC7zJq1EQgUl2ubw+S4RnmynyuDVyfi5IbeFc8Ob7WWyk
	OW1A+Scp5gfcTt6SGsu4g0pB8g==
X-Google-Smtp-Source: AGHT+IEMvSYcrKMxqjyd3ACjSYFZyEXnOTwUkKyhJepg7AXslIP9xhn3TON8/gf45hSmF7UFc175LA==
X-Received: by 2002:a17:903:1206:b0:1d0:7d9a:3bca with SMTP id l6-20020a170903120600b001d07d9a3bcamr23158609plh.52.1703007968947;
        Tue, 19 Dec 2023 09:46:08 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b001d3320f6143sm14453015plh.269.2023.12.19.09.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:46:08 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v3 06/17] pnp.h: Reconfigure IRQ in pnp_irq() to support deferred probe
Date: Tue, 19 Dec 2023 23:15:15 +0530
Message-Id: <20231219174526.2235150-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_094609_391952_83D4ED4B 
X-CRM114-Status: GOOD (  16.85  )
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
Cc: Marc Zyngier <maz@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

PNP devices add the IRQ resources to PNP data structure early during
boot from ACPI resource structure. As part of this, the Interrupt
resource (GSI) are registered and appropriate linux IRQ is saved
directly in PNP data structure while creating PNP devices. But at this
time, the interrupt controller for the GSI (either via GSI vector
mapping or via ResourceSource in Interrupt()) may not be probed and
initialized. Hence, the IRQ number in PNP data structure may not be the
linux IRQ number. When the actual driver for the PNP device get probed,
it will get incorrect linux IRQ number.

Fix this issue similar to how platform devices handle this. Basically,
while creating PNP devices, the hwirq number is saved in PNP device and
marked as disabled since acpi_register_gsi() would have failed. When the
actual driver calls pnp_irq(), get the linux IRQ number again if the IRQ
is disabled.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/pnp/pnpacpi/core.c |  7 +++++++
 include/linux/pnp.h        | 14 ++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/pnp/pnpacpi/core.c b/drivers/pnp/pnpacpi/core.c
index 6ab272c84b7b..239355977d4c 100644
--- a/drivers/pnp/pnpacpi/core.c
+++ b/drivers/pnp/pnpacpi/core.c
@@ -326,3 +326,10 @@ static int __init pnpacpi_setup(char *str)
 }
 
 __setup("pnpacpi=", pnpacpi_setup);
+
+void pnpacpi_reconfigure_irq(struct pnp_dev *dev, unsigned int index, struct resource *res)
+{
+	if (has_acpi_companion(&dev->dev))
+		acpi_irq_get(ACPI_HANDLE(&dev->dev), index, res);
+}
+EXPORT_SYMBOL(pnpacpi_reconfigure_irq);
diff --git a/include/linux/pnp.h b/include/linux/pnp.h
index c2a7cfbca713..8753eb4275b0 100644
--- a/include/linux/pnp.h
+++ b/include/linux/pnp.h
@@ -26,6 +26,7 @@ struct pnp_dev;
 #ifdef CONFIG_PNP
 struct resource *pnp_get_resource(struct pnp_dev *dev, unsigned long type,
 				unsigned int num);
+
 #else
 static inline struct resource *pnp_get_resource(struct pnp_dev *dev,
 			unsigned long type, unsigned int num)
@@ -146,13 +147,22 @@ static inline resource_size_t pnp_mem_len(struct pnp_dev *dev,
 	return 0;
 }
 
+#ifdef CONFIG_PNPACPI
+void pnpacpi_reconfigure_irq(struct pnp_dev *dev, unsigned int index, struct resource *res);
+#endif
 
-static inline resource_size_t pnp_irq(struct pnp_dev *dev, unsigned int bar)
+static inline int pnp_irq(struct pnp_dev *dev, unsigned int bar)
 {
 	struct resource *res = pnp_get_resource(dev, IORESOURCE_IRQ, bar);
 
-	if (pnp_resource_valid(res))
+	if (pnp_resource_valid(res)) {
+#ifdef CONFIG_PNPACPI
+		if (!pnp_resource_enabled(res))
+			pnpacpi_reconfigure_irq(dev, bar, res);
+#endif
 		return res->start;
+	}
+
 	return -1;
 }
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

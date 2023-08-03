Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCC8C04E69
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pgrlan2DfreYt3Rfj+APG9gOR6q3Zfe61bW4HQizk4w=; b=FEsS9vWSlEHT+i
	QmA+sbmkzeaX/ghGC5gsJHj0kpb/dDAItti/U2nkgzoiD2p2uO4eXHzYtG/MCAfJRJI6lya6sIlAX
	iqpvqzgWVQyvc72Jvr8fdb7Xh6e6FwQM6LagwXvpuSBTGJE++xdhRyALKFnzc8I4/oBfzU30LskwI
	quTOdhn1jdc4hVnU84VEKSfo/b+gYTlsV5qHQ1buAL5Ohi1JbnNlZxxqg4nmreOm2cQKOWrjf9HSv
	+kpBUVzfKpmt857P57SbtB0ibQsz/L55pxfK5C3MptBXh+muZfOuzaFu9agQO7xhDIrsQuCCFOq4P
	tXxsV2OAWR7Yo0nQIAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRceO-00AWQZ-1a;
	Thu, 03 Aug 2023 18:02:16 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRceK-00AWLX-0S
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:02:13 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-686f38692b3so1121815b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 11:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085731; x=1691690531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6v/OYLYVQR57/X+MrAxBhstfGEPE9Vxe5lIE5dFdYi8=;
        b=AeOusJd65H1nN1T0NetBGmbqBfBlOSImAu7Uelx9yA3pASs2f7sefFvXswRe4EVo2O
         CvUG6NJ6T0Pauy/FEY1z5ifwQKaQ06fZ/QslUnSfxbFdlQQHr+pvPalyXWSwjuG3lGFe
         N1LN4E6rnrgXD+zSMCTdgWsdIH0dBVzy56DIMSqXW0LgorqgduoErF2Wbz+QyBps81Ai
         wV5S04bojOgDVv2obMHVmqCVcIR+bI4vWpp49wguFw5PN1QGxBVRCxnEyACKDFScpqmP
         f1VlfC3SCiQWQ3gVN3KnKCA9ctwnKV1CBt9CVqeVS5hcazcDOMedqZBolJmK3o+QT4M9
         R8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085731; x=1691690531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6v/OYLYVQR57/X+MrAxBhstfGEPE9Vxe5lIE5dFdYi8=;
        b=eMcLzwFlSVQ5o+vgfNagh/r/WnqB5JFcga0/t/WG/yvTZ59DtMiGWJxpNTgoWMO3sK
         4qzZsc+3oDtwpPsTkbD9+82LE8vymeB77gj2wIY8p6schB+S2JVUQK5AaJv17NdHXs1M
         8GcngsiOPl9bvmqA5goxltx/xOfB/JF9wSg49umNP/cOMayYmfprTLzqkU7V+h4/nzOx
         JOL+gUgLd3ZFRKXIO41JylP3hbX8Kf4lo6iWAIw3eXBO/uyE45XyqC6zH892KE2SgedA
         dm+UrQbAG6o6ikhimbuKXvu/olHOCYgLHnofwA3BiDPzc4F1MT/jEV5DKpmFGxw8B06l
         7n2A==
X-Gm-Message-State: ABy/qLZGiN66eNAaDdtdnBkmmOGMYWIFwng4VwxVBGh/6WArFTY83K5o
	33xBVtouNeVxKwmCBsMm3ka3ow==
X-Google-Smtp-Source: APBJJlHFcm8ihxMfvEuKYdAJoJ0melHlBTDt1Jia2pL1VWUw/BkWIxLDR2Ghhray/SCxDTG4+7EhFQ==
X-Received: by 2002:a05:6a20:938b:b0:13e:f5b5:48ee with SMTP id x11-20020a056a20938b00b0013ef5b548eemr7542379pzh.59.1691085731121;
        Thu, 03 Aug 2023 11:02:11 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:02:10 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 21/21] irqchip/sifive-plic: Add GSI conversion support
Date: Thu,  3 Aug 2023 23:29:16 +0530
Message-Id: <20230803175916.3174453-22-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_110212_286101_01A95B7A 
X-CRM114-Status: GOOD (  15.96  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ACPI uses flat Global System Interrupt Vector space and
hence the GSI number needs to be converted to corresponding
local IRQ number of the interrupt controller. Add a new
gsi_base field in the priv structure to handle this which
will be 0 on DT based systems.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 72d6e06ef52b..1c22070e9cdd 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -68,6 +68,7 @@ struct plic_priv {
 	unsigned long plic_quirks;
 	unsigned int nr_irqs;
 	unsigned long *prio_save;
+	u32 gsi_base;
 };
 
 struct plic_handler {
@@ -314,6 +315,10 @@ static int plic_irq_domain_translate(struct irq_domain *d,
 {
 	struct plic_priv *priv = d->host_data;
 
+	/* For DT, gsi_base is always zero. */
+	if (fwspec->param[0] >= priv->gsi_base)
+		fwspec->param[0] = fwspec->param[0] - priv->gsi_base;
+
 	if (test_bit(PLIC_QUIRK_EDGE_INTERRUPT, &priv->plic_quirks))
 		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
 
@@ -453,6 +458,17 @@ static int plic_probe(struct platform_device *pdev)
 		return -EIO;
 	}
 
+	/*
+	 * Find out GSI base number
+	 *
+	 * Note: DT does not define "riscv,gsi-base" property so GSI
+	 * base is always zero for DT.
+	 */
+	rc = fwnode_property_read_u32_array(dev->fwnode, "riscv,gsi-base",
+					    &priv->gsi_base, 1);
+	if (rc)
+		priv->gsi_base = 0;
+
 	rc = fwnode_property_read_u32_array(dev->fwnode, "riscv,ndev",
 						&nr_irqs, 1);
 	if (rc) {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

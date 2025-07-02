Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2E4C83013
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 07:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZuRwYaDezwwgNTjQu5h9WdQ181nkZEXBet3d5W+Buc=; b=G2m7xZx4NKGg4T
	3A7mFAXimrufHMk3NERGoYVTYMvDyxnKlNI1r6+71QM6f4gPu/uQABwzd94/KQG94shWymVZDFPg9
	sv2Hn+NGt4DVW9BnTWFx8fiBqVxam4gbU+BbWF8JtCdZEmo591/+WqVeA7/9yaWMCdFYkMlC6pxex
	Yamg+PvTyG0VwTm4jBKUuC2elbHpGS1ig4O4h8h0Aw0ipkrPI/dCf9NwybNvkOhFAXGQmeCBsRyEB
	0D/JyvrJyw2BiA26/ifPmVavWPxaCk8ReIOk55repqf1Sp/axGq1orMw/QlE/xLbc7D/xntHJBlBD
	5IAsaI76D6IvJPPy9iNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsFO-00000007Xxu-48vk;
	Wed, 02 Jul 2025 07:51:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWppf-00000007GKQ-275S
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:16:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2353a2bc210so37517655ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433391; x=1752038191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=oMJjWjvzFq4/GfoNfQBmQ8j86IKhjx5kfT8jH/5P3V7m6gigvDhJl7qX3Fy5iNnzA+
         KRiNVhMTh/aBffBDr/9TfNoB3TwJ05A4ulRPD/AsxUOyOSHn7yd1QW5qdVXxoUoMYavZ
         xsYLxbe562mB5nrSwT3yaJVaxWW3F9B4eRK9/8LX2aegNUB2jtRhsqBisLuy5rDXIZBm
         JnD+j5gCTb/jml9+fNg0J+e81k1/fOY19tZP+Yxqsr7BKF1/35zCRCCM3MKk/tBOCOhW
         hym++smJq+eIfMc+Py4Gjnad8OX9txPt0iaSBtpP6Dey8z2FnmDa94H0SoiSwzwXeayc
         XuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433391; x=1752038191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=DV3ekbuSWYUdZIPtAnB7eE5PgHbLZpdASHOTo3QyfEAKmdHhmrRaGtHw+xtT2EnHxX
         sSipeb5f3anVxtHOQFNdZfwSp8NG9r858b+IqO2cVY7SZ1NDYeBPYpgGZOswZ1pbTggD
         ZqXgJU1FVSTeFcmC/EhCyYCR0ZykPhlMV9MMF9K/CNmso9/AmjSJwVjiHpf2L1mmc1uj
         kij3BoebIDrUxZFwXzoG+HHKpsqMB33jFG5NIwkd4xrT2KWsdGQz9cVBRxNu+g7nLp1U
         FgthXKXmikfeBjuljB7QTAhiA81sNxBnW9fqqr/ncbGmDxSOcjGwddOHHpdDFcAaRTOt
         E/Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVQZ9uUST0ajj1XQqNexeRV7IKKrlFsxQj08xOrv9RxQdSHIBrCfKSdMvHv/L6eY4onxPlDf8wxyJYn6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYBl6UEun9js+C3LUSILambAKGgBxmGBgbXZxK4RmuBCMCuo71
	3B/kzuBSJshJJt3KckZ1Xqfcw8WWiUCiaKdSYD+2cag1FDmRwffxwo9sjpW/tBAjI/E=
X-Gm-Gg: ASbGnct0CF36z2slQ69vS/rBV8enZUob4v1VooEVLSy4YwdmtC1ykdJNBVkKRFj0bYs
	c2dkBplYYobRT0NLHgQ1iTSiTFxUgnS5yZsJVhV3GfC3p6ciu36AQTkRoIJmRU5X12x32dqtnfl
	dxNkr9zmRDjS8UV5PHKpIkTRpT1Msr6zXCdEA4puS0N3kV3PL7yNMGcjivMsX2Y08Vb8cs0m7qM
	Fpt02bkWgA1bRCfL9HqfkIrpH3mzKQf6CLp/ZrOlburWGAtJhTaFzKIlf4/xqLKD+WvEKpMGviM
	F+R/J2HLPLo+HKoOpsU6cUEGFW9qAw9qH5RXUP9heeQMTgvumRgTR5Qh1MMx2IOpZ/XtjRrHkdU
	aOUEAT3zSJZaow1EW
X-Google-Smtp-Source: AGHT+IGVPhlwjhXki+/3hyU8U7wHE3TbWpzk5YrsdGI24+SP+ypvFn2VzK1niX3bMdBnop5rpgktYA==
X-Received: by 2002:a17:903:3c6b:b0:234:9670:cc73 with SMTP id d9443c01a7336-23c6e490fc1mr24534815ad.5.1751433390748;
        Tue, 01 Jul 2025 22:16:30 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:30 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v7 19/24] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Wed,  2 Jul 2025 10:43:40 +0530
Message-ID: <20250702051345.1460497-20-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221631_541500_D53EEBF7 
X-CRM114-Status: GOOD (  14.30  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

The RPMI System MSI device will provide GSIs to downstream devices
(such as GED) so add it to the RISC-V GSI to fwnode mapping.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h |  1 +
 drivers/acpi/riscv/irq.c     | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 2caf049f09c8..9c9d22f5165e 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -30,6 +30,7 @@ enum riscv_irqchip_type {
 	ACPI_RISCV_IRQCHIP_IMSIC	= 0x01,
 	ACPI_RISCV_IRQCHIP_PLIC		= 0x02,
 	ACPI_RISCV_IRQCHIP_APLIC	= 0x03,
+	ACPI_RISCV_IRQCHIP_SMSI		= 0x04,
 };
 
 int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cc1928422418..d9a2154d6c6a 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -168,6 +168,33 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	return 0;
 }
 
+static acpi_status __init riscv_acpi_create_gsi_map_smsi(acpi_handle handle, u32 level,
+							 void *context, void **return_value)
+{
+	acpi_status status;
+	u64 gbase;
+
+	if (!acpi_has_method(handle, "_GSB")) {
+		acpi_handle_err(handle, "_GSB method not found\n");
+		return AE_ERROR;
+	}
+
+	status = acpi_evaluate_integer(handle, "_GSB", NULL, &gbase);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_err(handle, "failed to evaluate _GSB method\n");
+		return status;
+	}
+
+	riscv_acpi_register_ext_intc(gbase, 0, 0, 0, ACPI_RISCV_IRQCHIP_SMSI);
+	status = riscv_acpi_update_gsi_handle((u32)gbase, handle);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_err(handle, "failed to find the GSI mapping entry\n");
+		return status;
+	}
+
+	return AE_OK;
+}
+
 static acpi_status __init riscv_acpi_create_gsi_map(acpi_handle handle, u32 level,
 						    void *context, void **return_value)
 {
@@ -222,6 +249,9 @@ void __init riscv_acpi_init_gsi_mapping(void)
 
 	if (acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, riscv_acpi_aplic_parse_madt, 0) > 0)
 		acpi_get_devices("RSCV0002", riscv_acpi_create_gsi_map, NULL, NULL);
+
+	/* Unlike PLIC/APLIC, SYSMSI doesn't have MADT */
+	acpi_get_devices("RSCV0006", riscv_acpi_create_gsi_map_smsi, NULL, NULL);
 }
 
 static acpi_handle riscv_acpi_get_gsi_handle(u32 gsi)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

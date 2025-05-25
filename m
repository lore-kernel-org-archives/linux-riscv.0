Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EF8C54E90
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fmvtu5Fv1V3x6pKP3XDM1R64YVKPm7zX19klDlzkuK8=; b=GX8//L+cDaYDRV
	AQSCi+rHJoEA+jsWpNvmd9cw7o+FeQjVT8RxmsIRqrLk541ddW9dKwoVl42gDyGcZYK6z5GFomvcd
	xQ86aJtCCwOEVQh1kJ0E4Pwl8j4+uWypv/LLGLsQRjZHlK7wSXFISkzxqFFWaJN8LMFMwHRymMp8M
	3hTHAmOHACsHEMNcVke1HrO4nrOyLkFL73qdR06k6+ovrn/dT+Fc9pctMHhhT43YwiPl+i8+FpEvB
	K/sRoBVfD2rjKe4hlOgcayrCta9RgMUI2GkReAtOQX58i7kAWsewYuGRPMVO3ZQqq5sB7AoqQ/ZX2
	XYsQEDqUluTBWUalAILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ74t-00000006ngP-2YjZ;
	Sun, 25 May 2025 08:51:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ73e-00000006nQz-22Vj
	for linux-riscv@bombadil.infradead.org;
	Sun, 25 May 2025 08:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Tk9rsFOMcBi0w2iwyjKL4nID6SkMtfavACIq0xoKWps=; b=BRn5iLOhJpcjNz6Ko/XoHZNds5
	sdsViJQTcnT59oM1IL5cZENM1Cc92osG4wrGNDku//hHH5MJ22LkzkeLN4jntw+XW4U5hEwgC4mo4
	Kcn9XYKGS9bPVGCcvPbZch2EA2vk0OPFw9R6NwfjvsndJ28xUbDp0Zd26iujbsETWupjGdFlVLone
	LibK6BpAYWrvFMgnehRHsfARV3DUKGetsDTfyU50kj6AmuOg9L4KJZYRxdUq5i5McdlmDpzrNYlfG
	rcskGnd8ka+fHzXApxYlvdac/jjrc8/0hxijen6msEnetuckXmBXqLZNi2UH4OwiCxQyeRn7Wkopg
	7l52RMNg==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uJ73T-00000001a1f-2Tg4
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:50:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-234593b0613so411465ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748163001; x=1748767801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tk9rsFOMcBi0w2iwyjKL4nID6SkMtfavACIq0xoKWps=;
        b=GBMsvU2fTcUiooJHGxjdJMrl+KR7S0FGmRM1WSvlJil4/IqGF3+TURgrPvV39GB3SV
         9X6q7s0bhJfjGOkZcT7J6PGrfrm6177y74qXlocvf0D91TZ3MslacEtSNqIdd5snVWKs
         cbjgH9q4HquCiuPVv2Msv6nJ15OffLElDFUnk1++fTRNum/tM6qaLNXkBq144NsxN3RF
         PfFMl+TVZYJG6PyICgKOFxclVcugJ8NESKABDlSUKi53/HkmZAssHWyo3+UiGmPvEIvF
         x9pD/AvutVeoeRQ67GvqkPZSUlvzbS7YdnskGdkaOzaiJAGIVwqGD6hmfEHr1fxcw9IQ
         46Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163001; x=1748767801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tk9rsFOMcBi0w2iwyjKL4nID6SkMtfavACIq0xoKWps=;
        b=EasE5xU2E+U95aufkylHX0I2pPLmJuwvKVwzjm9RGLEDmJRfWX03ouTmqmlVycipc2
         YdzwJUiLYo4Ooe0I1nx1SkqIHWzz87l2+0rCUWX1aStfIPnnSBTlhw2PMYjG4zXiDGQW
         KlajyfDrkwCBVVt0NEzuwhlb7/AkAA7n4ylid9j3dMbjhAJcM5JlWtOALvTm59R86IvT
         IpoQg/dAcsmu0qp0Cg/yIbmeNh2qbaglaKN24W1qBIa8jzLGppGEW0bhSXprnvFtxK3z
         CHKd1lX7uUC35GZlQU6nS1Wkw12qKMEb6qWghhexDRs/cNwSGbElf/fzfeltun66g3iW
         g92w==
X-Forwarded-Encrypted: i=1; AJvYcCXXGcsZ/G+Np2JhsDZ2VDZPrTdOyx4ARSgPeutwnusWbQi4DEearGl8r2nz80SMv9Db98oyKH7QSprwnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfZFQ8WUbfe3q9dVlgY2gYPATql7eCMvkpmCW4ze0IzTSDi348
	Bc6h0XbDLJZ+6h/50SU+i6iqGJKpv+PgmWaDzK7w9XJRlR2/EmTPPMIkRfBXNx8GFXU=
X-Gm-Gg: ASbGncuDFNUoIEZIoJYARA/rCpCRi6WjIj09mxu3eaEq8vN0jDxpLAr0RaC19JAekT5
	0sj+KkV6RA1PAKPmFK6LWOewJupqPkpYV70Vx2H1/AAOL3RtoPWy/o3feoxvhxOWaitkMzZp+7o
	PlVSdw8XSRp7SNWlMptZ7DtggJPSGmvCEm2PfSTapSKoy8R+bj94VIHxUYV6FUitB9yl9yfFi2E
	G4BV0NAtzJ/IcEIihS6euOKAZ9OgHoQHnY8zk1kQWYe8oTuizQkXqWEh/1td/BSwwJe7ttiB6Zo
	+oi8mBHFtSU18ftKjNR2JxehsZFlW1fK4k3bZ7HckSv3qiaWl5a8NFbqUwl1su+ELgV6XK7s50s
	lVDN+ShNK
X-Google-Smtp-Source: AGHT+IHd4+b/db3RG7uCJei3SJ2Uvb1+0nClU288A6ml3cofwF28+g4UZ6VjLiZVLsynxXDRsQl3Dg==
X-Received: by 2002:a17:903:3a86:b0:224:23ab:b88b with SMTP id d9443c01a7336-23414f48ec8mr72169465ad.8.1748163000846;
        Sun, 25 May 2025 01:50:00 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:50:00 -0700 (PDT)
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
Subject: [PATCH v4 19/23] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Sun, 25 May 2025 14:17:06 +0530
Message-ID: <20250525084710.1665648-20-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_095009_833265_32DD05CD 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
index c881cf037f0a..f5e91972b5fa 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -173,6 +173,33 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
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
@@ -227,6 +254,9 @@ void __init riscv_acpi_init_gsi_mapping(void)
 
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

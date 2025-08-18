Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5642FCA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 05:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkoNZz0C9Zfp22WjZpdoIVo6o8WGJq1w+Dho1hokSG4=; b=wrBLljuh6p5bpE
	hY4FkBEqa8ITwiaPJeC46llkh0EgsJBGVqiLEGfa97Ak5gTGezJgUEMCr9RmyBP//U6TZW+Nfqvkr
	rfQRFuUZDjnJbtmLKxPy49BA8ec4n2nJPdpMoUDqwH2M75sWzahCErqYz+ovBydUI8+NPq8WlBVL/
	CLxkhECDgi4xYPqJsp1uRlCmwQsuwjrok1GsP2eD2BPOg5NNPQF7ckjxHH/TdSK37niGT+OLaQB2T
	l2cI8tBK1tu5H6ccQcvyjy6EjYxmvi2V45ZS8/NsauVEU+bxbH1f4zXDvBWH/o6FHbo3CUQyyIMs1
	MZvDRmk8EA84Vyk3CDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsGN-00000006XDm-1Z9M;
	Mon, 18 Aug 2025 05:18:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEs-00000006Rj6-2SD9
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=puANNupOfTPwupiCwBFR/x6cxjL9cWmUBZsMBIE26AA=; b=N05bYWwoGbmSmlnpNASaXOGa5T
	wEL4FjiLlh9QgYYqlKPY08K0s+EzZ1BNwLreNJ6jT1bV5d+5vQGIukNJ6gHjnJqUxUOBtPWA+0vqK
	8/4OIIRDGbDMJuRhNA28vykUPNe42h0qVQJkwvcMaj1EdtXK5i+bAsYtopbxC4kWxAp+wJ810DclW
	Zfb32i5W0zo7f7teElUkdRf5+GVch3OsXd8UEhAuCMe3QAY/2GRsyVhZkMDpFI033J2tsnGjXBeFL
	O97sc22yYp+uguD6a+fxb45yOtH37dShxHXA2bFtIou1HRhh3dxAizw4KhxhQNnTf/3opq+zMHMFf
	NooSkRvQ==;
Received: from mail-pj1-f49.google.com ([209.85.216.49])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEk-0000000HEEB-1P7n
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:12:52 +0000
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32372c05c5dso229599a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490363; x=1756095163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puANNupOfTPwupiCwBFR/x6cxjL9cWmUBZsMBIE26AA=;
        b=iZxn+YG6RluB6RPynTrKyGCao1vghz3eJiAI22UUoIaqbMCyHWgqCC3OxvnB2kht9W
         AHJ03EVLTmeDXvd6mbnidOl68hx9DFGym5RMg96Zncp52eU5EUm0s7QvDAzpJXSn1Dfh
         DsK1vAqlGKOCXwfjKSvALHbG78FQbpsLm1T/bSyf1kqhDpG3+hdfFHcOxZkGpRjExTAP
         4Gu2eVNeJ+bt2/AQlDcMErysx92d1Jy+skCtNC2FmSbyN4TuDWST1ISS6jGJSnwp6kfq
         yqcZnvsglNcEvf5G8Co6h6HnDbZNeDN/WCI+dPt8NqMPPLs3RIbZ5AQxmZbJlDMAo7JX
         LSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490363; x=1756095163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puANNupOfTPwupiCwBFR/x6cxjL9cWmUBZsMBIE26AA=;
        b=KguMMHcWvYrx/tpVo03iX/1iGoY0bBwWXTtdF56xCCkj6yJH+FuhoyS+GynB7G0c69
         DZIIzSf6BJYVB6+raCmd9csPq43M/VZPY8CwqsR/7VE3i99fU4Jqy2IsXKtN8Hb7tLDg
         cXy+idKxj6A5WvWB2VUFCqo5A+vMpEV9a8Jt+MINlJBsHJNJLVdsRlUk7CS+/PGqKwXH
         RJSavSrBCKtslCXdvXO6KXN5/n6CjKlVAP0rGhMXHpcrhyQC5LC3htnxrmluSKTbkyfO
         rbmTgsV0Rzd2wI2A7Vg4fdXAIHnuuZWQRk/ZwvOWDi/BJ3RKBNkzFVPnAroB6iUK8sFX
         /opw==
X-Forwarded-Encrypted: i=1; AJvYcCXYkxXDXYVNDXTKL26lMTjlY6Yiceq79l2ndOF/2Ig2teGCTJk3cnxYPkDUehcsp6yl3Z/b8rMWB06ADg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZm8A/Hqdxho9yeagfi5Lacg47FwwYkXRUXNc+7F4msjy6NFsZ
	wGcl+JPOw9mpevKNS/NLy9ziX1EP2k1yVyz0GP01tkQxLlBwRuAfkb9YeEyV+Af42E8=
X-Gm-Gg: ASbGncsFzSA89izcpetW8EaJaf5isVNWzjXV1huH8QFf2DBOiPlvj4nmSOsSlYEokME
	p616PDhVGoxLox9ppb7Kllp8FYy+Uah8aij1BkAE1q47Oaj6kDQjB85SAkchvVti+d8YUaiYC7u
	kDQ5eGuU9tXx5lsI+28MWb3O1R5xTcIqLEo3ixX//ylytQZCKSfQCyFkLy65CZHKNuk5bcLo5pr
	npEDQN4epK4z8IIolV9cbO3zFbPLISxTOuL5fSELh2KBKpAGZyOOp7XruEEBezc6w6q5JSvEkUe
	qkFJs4/VRWbUmOP9yHzIzzCq1dwuC19GYPCyBRMlADXPQGadn86hsaijYSz2MaLZxE4F59myh/3
	H2kxo8Zj5h4kvl0IAOs03XPc0TnaRFleOxeP5XJnUgWVrHqTKV9TnEQ==
X-Google-Smtp-Source: AGHT+IEC3gS3fhyc6UCaYhWEA2S/aXsvy2asvBmFcLedoY4ZJ0Vv6Zyu/0geFA+k87d1XbbA1zhDRg==
X-Received: by 2002:a17:90b:52c6:b0:31c:15d9:8ae with SMTP id 98e67ed59e1d1-3234218df88mr16496712a91.33.1755490362422;
        Sun, 17 Aug 2025 21:12:42 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:12:41 -0700 (PDT)
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
Subject: [PATCH v10 19/24] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Mon, 18 Aug 2025 09:39:15 +0530
Message-ID: <20250818040920.272664-20-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_051248_086422_ED824394 
X-CRM114-Status: GOOD (  13.47  )
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
index 7ec592fe430a..e29ded3416b4 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -32,6 +32,7 @@ enum riscv_irqchip_type {
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

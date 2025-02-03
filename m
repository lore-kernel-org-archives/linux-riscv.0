Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D892BC0219A
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYADX7LiFcTJxVdE6uTLHT5jblfvZxqmuHGjIfKOKSs=; b=qR42YRZ2VfyO/a
	sA2A6w4rirF2zyZWl0aD6WcvcQBr7Y5Ra34Mc8lZaUQNg93K0WDohDU74CyytfpQb9DhI4k1XTOcy
	+coDfxbcKkLoCCZy6DT/HH2yqlYQHAp5W+bbJtdfCUlr/dVtKPi20YswnSJ81TMu7njnMmDR5G/0j
	tJhBUMKFJEmAff0fEkPxO/LruibC8E/mZz385nWK/cR+CmHwFYz37sxdB08156EU8ZfM+AdjmAG9+
	ku2YwqURUieykHhOIrtwMGKofi2mJ2qut3gKUExG6MQy9u0A+609Buf/wFDzAYSlFdqod0k5O5oRD
	FVsaFa2kHCDvw9BGGdfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetG8-0000000F3y8-275N;
	Mon, 03 Feb 2025 10:00:52 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesBk-0000000EuiV-3Ra8
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:52:17 +0000
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467b086e0easo17821441cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 00:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572735; x=1739177535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtaZk8L3qjlS8UU58qulSnorfsC0dbtiDK1e5t15IP8=;
        b=S1mtLWTUOWbCljsIdCH5zxmLLRH6iaHLdRW7Ed7E/PjRrodFkPEiH0XLjp/kWTTike
         q0cYf/pIES4qOfi38CCTGULBFQipQ7WEtXYvlWzyfV1tIUcpKhZK/xKldVkpphyRjtNc
         72d6PmV8mTJnQx8ya6Nux431V1DpKy+gOmm4OxE1pAu3BACfIYuDARFChqvIan2j+mDN
         RFFLcWRx4XYJii+q+t9vLo/KIvXz2oTMqjsevgKhuhqOycqs2Kb/KsS4aZqWf9WbBQE+
         SBciSvtEwcLfdO5uxO9WmOR7j7ZeRfch9z6Y62S64/6ygyBegeCbz15kb4drqRMc17FG
         uuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572735; x=1739177535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtaZk8L3qjlS8UU58qulSnorfsC0dbtiDK1e5t15IP8=;
        b=SvW64bi9uIHc2qvW+pTGQanyQjH+F2Aw0uedO4ulXoOUZ9YBk0fwxgLvtODJwIjrvu
         mSRUkO2OuhFf0w3bIZInCjzBdrqv+L+WxKd6+meUVRWr1rTtVBfMzXWSJQsEGiIlmeDG
         fCcxGVbVT4APQNGm5pBDNo/ph5mZAGWTwwjLq+navYvBnuuaPoCdDcw2IGTPqLbYhJbq
         JaqjBug2ftUzOUx7xUNwW1w1S2yf2FtKNcUSfx2vsQQLm62mDvWRqaiHafzIjJZviyx6
         IhK7Zmo4rxAq9xJyn0kSh9bvi3wd2qXfXfLTKWUOxJrhwgV+zvgEr5n0WVRuDEUW4vPu
         Kbrw==
X-Forwarded-Encrypted: i=1; AJvYcCUaXMH61pF9sAQ6AM+1ISaV5WgY4Sf4w6ofBArbbS0LzYSRyma1LCfdVdpscgRIGI6JITZjUjTYlHVz/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3r4gfN4S4jsxH7GjcB6Vh1dYKU0pHoDB9HKouiTeWG4tfXZJ4
	W/YaIFVI0G50hL3ANVVIFMhNNeT0RSzrB34/wTYgDc+6oSy1KyeOzRoVIJbOVzw=
X-Gm-Gg: ASbGncsmCjJFW8KIEzcMSpM9RsyFrxf6d5sBFhSBUPFfCpGYr1zd+v25Yh3UFAUoXgv
	Q8YgVb6RGdriWK1/QAmpKme36QI3xjKJmV5BcfIKcu3eluvDPfHw8j0tfMHXwVVzg+yRVjxflUT
	BYd2t1qlAVrOUHq3Z72qjqtcN1Va73VTav5UOVOxxL3iF7W4CBoRVhgZ1ArLBg4JIJLQeDjRxEw
	qirTcHoSEh8YC00k5fkDpYEMyO1YGvd2/X7YWF5ZmZJ/vYVc5d4p9ZyrLD9dHbxcnj7xdoiwEig
	wtAtL2K5r3rVTAPTcDyyVdIDHVwhUsLZHwXc3xOZfwJRql92ZzBUN88=
X-Google-Smtp-Source: AGHT+IHyOsiVqCAtnNa8Q481eo/B2M8Ztab6qXUkekooWXnznAT6Se1XFkIj6MwCVgjL4f2KC2DyyQ==
X-Received: by 2002:a05:622a:4108:b0:469:715:d94c with SMTP id d75a77b69052e-46fd0a123abmr298052801cf.6.1738572735411;
        Mon, 03 Feb 2025 00:52:15 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:52:14 -0800 (PST)
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
Subject: [RFC PATCH v2 14/17] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Mon,  3 Feb 2025 14:19:03 +0530
Message-ID: <20250203084906.681418-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_005216_860321_628D0EE3 
X-CRM114-Status: GOOD (  13.57  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
 drivers/acpi/riscv/irq.c     | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 7b038f3b7cb0..144f97189112 100644
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
index cced960c2aef..c141975c62b3 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -129,6 +129,36 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
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
+	/*
+	 * TODO - find out number of interrupts from ACPI method
+	 */
+	riscv_acpi_register_ext_intc(gbase, 4, 0, 0, ACPI_RISCV_IRQCHIP_SMSI);
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
@@ -183,6 +213,9 @@ void __init riscv_acpi_init_gsi_mapping(void)
 
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

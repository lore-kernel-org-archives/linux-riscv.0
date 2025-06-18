Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE58C7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZuRwYaDezwwgNTjQu5h9WdQ181nkZEXBet3d5W+Buc=; b=PJPrtQjgeELHcD
	U16nnIBU9QIWCgs0vjs0EnuMrxDu1to1iLXwHipOKbuODtdjfdYfM6jku98gF/ob2k2rIXXuol6n0
	rCBB0e6cGfE9OtcyxyiudE+nbcU9H4FZPGzxKC6ysdOe85OHe3xtJj8r2h8yNyRzr1QjIPzBl+VPQ
	xSWE8zUAtdp5iYWOdcpqdJEDDV6lfixyC5SPB+qd95E2AwcblbbekS8NVeDX7k7ZSfj52fENTRcRE
	DgjPcs8Li2OlesxEFKKZqeFGpM88W7VKwgs55U+WgNLW6bZCxPthyjossXvX/32DedckAyc9pS+6P
	mckuGlcSdk6BvP8VfWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtpM-0000000ARGI-0vPD;
	Wed, 18 Jun 2025 14:31:48 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRril-0000000A5d6-1qVD
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:16:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-748c3afd0dbso1789740b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249011; x=1750853811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=huwn1sMCIM6RiftP3/9Chv6NW3FxQ7LzsQZT9OLFghobRyhCTTlAiRTsaX5W1QTTy0
         fPKWHje+NowNnsyG2sOt3SB+h/XZVmx38FyILjMuuoZ4tkobiwPP+D+5yG8LdYwmumEN
         mzQUSv9SmvxVvDSxvms/GJC1YLEtkY5i3c7I+Kz8veDf1mbAcD5rAWxgQ2uzFFpgJOXl
         UtkA5RL47zWGYTD1LsOYWyBobn2KkY+K4zpOFv+P1onuoWPOCUhrjXr4ODBtgLPi75fB
         EWOUiiqtmtjINWZshiNvu1NtlNZuObxsGnKGXbtgaHfJip4qzlgUmB9x20AAo0OqnrYj
         KLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249011; x=1750853811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ya0GtiFk/8ci1A3C7Dw+WSyLS2yytdeeB0s74FDG4=;
        b=jA537lR3S2oILwIA+PsxiQjbvuQr3pj5AXIYB+j/UrBkJk45RIiGWuTi9kL4mGuIG2
         yNCUaF7CpqMZF/b6V6qF44+7JDzQn020Skh4yyfr1vLcIPPR91LQmiD/PxeSLCs/poaz
         6ZwvL8xT7dRc71HmskYnLjTIT8lQ8csZbqhnHNgBEDNuNQkrZ5y2N6z0QHZCStXVeaP1
         THZYsuGd93MBd7eDpdAbjmaPT/UZ7KvSXK43Fvlj4hXOPvqMs2733y2a0IYznyI4ftFD
         7ptsUjOYb8ihpBw0F/Rd/HbuQ5qAIh2Wk3PvDAgGVvK/nmYVqTCJTD/uhJttt1eEgeTd
         5E/A==
X-Forwarded-Encrypted: i=1; AJvYcCXrSj+f2aoCYUuaQdtXoziKQkEIxZeS6AhKAXeFtvbEBOyv5jP509FsSs87yMg4l8rdTVsMJKga7wduOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEvO/kg3buTtM6ZxVj33jey7BoLGEwSGI5VrqstUdIuYnKw53D
	uNrHyuOfqENCxXrSGLSj0x01CRrEnBvi7/IHhA9sJs2/ERjJ0JgZyFsQkqUxc/z38hE=
X-Gm-Gg: ASbGncsxqtmHpCLKNhnB27MVvN3oGrhRa6guS5I7qBHjfEdssQzk7dEP9n1B+/hGIH8
	GPD/r4F39AnKm45tNVICIONz5FOi6WLmmrZBPKgBnyVxi7lTQk9sruZxqP4oFDd3j0ZBtA+ud0K
	ccMEXkwx+E8bv/1Mlo/F/FGFmBK8TMaPkgVlM53omV2/R37PIGKA1gpFcAq5e8fu5ycrB5TeYUW
	bhYN5Qo4tCtMoqwqydN2sQSYUQZTb8ekNYkpbNZG0z6O4NNMVBd7I0ZooXbb1rCHTT2WrWzFLhl
	UK5r2Z7PjYoDUarlw37rDPN57x0+droyvi+vpD19QMFO8kvn5HuuBKq+1/XUeLQQMXcxgs3rxUs
	UTl5EgNuLajKtw988ww==
X-Google-Smtp-Source: AGHT+IGBu9f7X1d5EGUhRQ9j96q5jUjwVSBF0M5vehfN7EkXrctEjP/TYemz83ALSInZEF27aHmtjA==
X-Received: by 2002:a05:6a00:148a:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-7489cdeef7emr22605339b3a.1.1750249010475;
        Wed, 18 Jun 2025 05:16:50 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:49 -0700 (PDT)
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
Subject: [PATCH v6 18/23] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Wed, 18 Jun 2025 17:43:53 +0530
Message-ID: <20250618121358.503781-19-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051651_495572_9DBD012C 
X-CRM114-Status: GOOD (  13.56  )
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810B0C3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 14:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wiSe54OSTPp1Yyy17JTdOkTqrDRY3wHWZsJc7RAKcg=; b=nIuAF/HFoU/a4U
	dfioIhbq7Nq70nvexJzQZYjsdr1Mv+rE0PQ3u5SjvkE4p+9jb8CqLuGpSG0GTVMJ3qEKOHn1ZD1Am
	krLtlMJGoN+CvrnJM3nRwNQ2b1sBDYaoZJ41YrRipa8uGxx6e7RcRS7puGYhyMlBJxy3wc6FKsLqP
	tfPlMXX9qnPcOSNHh+Vr8QVR8tNUOt2i2j1iQv41BlmERlBs2Clik1IUcuskQyrkWrKOb7+SGn1yx
	24TW2E1/J0apWrk4dRt1JcaGgrwcO2AoNhKA0DjgmotPf3DunxtEEZsudYDt5aK2zUNu9y1SQeFL6
	OdZCfHFBQrL+HGXttyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7z2-00000007Ovi-0iYp;
	Sun, 11 May 2025 14:48:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6xA-00000007ITz-1AQN
	for linux-riscv@bombadil.infradead.org;
	Sun, 11 May 2025 13:42:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xL0ekEHf+9tk1LYRRg9x2F3+Sqxj6qvGnxsbEos9s5Y=; b=ENzB8PQ9Wl5U69rNw6NuEVUWWP
	XlMsgIv+fJ5uJSvnmgyOJ+5S24q9vHxhpA9/13V7on2793WgMDTCqw5/LXpeLugJ4dCIavdFKFGRl
	a5zU9scDGk3Nxk20vnvzlImS1NrCHtTtvzWeeaX85CqGMrxlHyYZcQTWc7jwnrBPpWT2OrGWFSbOS
	6pGLK+GE3WHgybZnUdEtRF7agTmsmHIVbOdhhZwUr7Akd4LwtYLeZlUgMNvJHvBGeWdnUIjhm6MsO
	mj1UxT0WWf93cUX1Lngr9NPyVE1jk++atd+qnCzI5R3EwBEt6CNw4oOt/a8/A7XL0S2l1bDYhe0C1
	TRYNOyog==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE6x6-0000000Gc3R-0AMH
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:42:51 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b200178c011so2757624a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970966; x=1747575766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xL0ekEHf+9tk1LYRRg9x2F3+Sqxj6qvGnxsbEos9s5Y=;
        b=CfOr5yVV3jkW5c+H1eOWGszTqMbfOUKsf8Deo31j87lysPiveKEUCRHvb1+0n92PvB
         d7jMgrpRPf9tyXJOmXvMuaKIUsm5zViDb6P7wYBSQZSsXND9rkjiSmDXnubZZ+yi7TgW
         5Z/32111+hmHIVGw3L8pPF00jv7nSlmmGuP0kBtp2uTp0gHkvtafMC2JvvuN0NCj0zp7
         BKRelFXk2msgonkFgcyYBYq0EUf2GAfeI+3V2ySaRcKnazfaMMGXZTWCM898AAHGADgC
         MXiFdVxtC/ydic4cQIPg5TXCvfNnj+7ki6s8rf78DWj3YOfJsf8KajENnRPIMX09eOC8
         Piqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970966; x=1747575766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xL0ekEHf+9tk1LYRRg9x2F3+Sqxj6qvGnxsbEos9s5Y=;
        b=Nzh4KN+VhOrr+50EcEnCg77VZFbbRmrx3lQUIyvc5kR3dWWoCKfCtBavjzZk+xoglr
         ZDGm6G5Ek64vXHSNXLFurUSUWc8b8MM18xbDAfnZ0FMlsv+zO5Yhv6c6mJRsVsSrliMu
         O8+mA0q0gt+dZv3qUVAFzb4RuD1SbxQ0jVChjnSme/DhTIGWM5bnj6vt9/TpPhAVVT5R
         C2UnOBDNrw3bsHgUl2pUQXHlu0Vg8BpOAQZ+q2aZoHT45f4kP9n2/ENgIr8tzJXWxtY1
         5st5To/eXV8ZDa13EUFP89iKowNOP4db5mUJ+gm35CG7eDwtdRgFm6d+ozotDmjo2uUI
         DEnA==
X-Forwarded-Encrypted: i=1; AJvYcCVC9ZE+p7G4m30B4Ztu/iJz10/K/1JihO/O8odeeCXbsstgW87OU3ilD/IhkZzLIyZEWgWXFsLm7Z/FiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5qlJmD323VEd35T8Uvz18+TuOvdKKgn479tFijDWOEg/av+Hm
	a4CDvPwdKdyOXG2zo+7p2/TD99awhhY3lgIGH+IlmGb+BwN8nPG24NfWENzDPx8=
X-Gm-Gg: ASbGncukhflaIxWlxyIREZwPEMTWqqsfo8R7YB6WFXBkuKfv+Xsy+WvGwdiy70Xhw+f
	5OHToavcSOEWpHn9aMJ4ddfaoFGD20r3/ZX9P9NxsJBVnRRd+mb6fnGrtNd5nsKLmiFY8j+I1N4
	k72jJqsXqLvXI/9BJR5fgd4c1bquf0EssUT/BTPHloBlsD7d8ubZSKcCntVmFlUCfshIdaukf2i
	n5XiJysAiUwKsuapBFO956/lgUd6xq922S7umhPNLKj/bLADkvt6K6DVNayjZN+lytGK6+Za/pu
	Hbma36dSUddMjCm/bkgfZsYBGvMTOcjd4uGE9A2O+dvwczi6mBldbmxHhensAWkgnG/Xxx/axvl
	Yq1ypIEThcFt81A==
X-Google-Smtp-Source: AGHT+IFD9aro01q26Oqr2tLLTgh9Uxp62papfpR06AdmrrPoZMhToINHO7wyBBWzA9lmGnJCy0hp7w==
X-Received: by 2002:a17:902:e393:b0:22f:b25b:8e93 with SMTP id d9443c01a7336-22fc918d15cmr122283765ad.48.1746970966248;
        Sun, 11 May 2025 06:42:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:45 -0700 (PDT)
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
Subject: [PATCH v3 19/23] ACPI: RISC-V: Add RPMI System MSI to GSI mapping
Date: Sun, 11 May 2025 19:09:35 +0530
Message-ID: <20250511133939.801777-20-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_144248_466066_21E06B1D 
X-CRM114-Status: GOOD (  12.46  )
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
index ef4aff62fba7..d28f90a25421 100644
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
index 2ce311042627..42f79940a69d 100644
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

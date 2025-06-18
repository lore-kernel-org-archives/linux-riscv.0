Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FC0C7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEJ9SQJwdOk9JSE2EAV5LffF/i4nt7+MqheoeRiZu5I=; b=1mt5knbby8Sl9r
	Ht9c8kY4jJOCN3D7J1RGFbcbM2AdXE6uA48hj54aVtBJ/vracolzEj2MDEZDWdrHK29wrvcy2yoKW
	lZOTG8vA6iIDOiBWkqCy9rcBxvkFyI9w45xs/EYrSegN8tAT1xUdTO7kVEV9PHx93CKS/hans2z1T
	F+YDf9nQXM0bMFfeSbEXBuPXbHzATiOre5+1OHY4pUcHwp0eFgaX33eE1F98P6+3SJa39EeyFApkz
	b1ihs7O/qXQaBtjTJaWqp3bQw2xFIJmYanjg09EPpn7/bQzS8p7SrsD/zl8m6BM1wWey0kg6oMHNo
	mGjY+/UkLh0TgOGdgqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtpL-0000000ARFi-2SNj;
	Wed, 18 Jun 2025 14:31:47 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRric-0000000A5c6-2iCJ
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 12:16:43 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-742c7a52e97so5666470b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 05:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750249002; x=1750853802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=ebt9Uim6xVfJKevUuzH1G1KProa2O0o+ST4WLg4Q4Nlf4ZRAkTwPRauVVmOw1gH5D4
         ba6VsQdL82XW/f28xEWsm+u3XOPWOBuiD8EilQvsWsJNsIiwfMZQP8huyT0A6yfWxJnn
         ++1jD8naBhMf8ZqIiDBNNbN799ea2u8UF2wNmbvbE5EYWUnDZmrXPlxgxTj0TLvoAs+E
         CifGgY3rokaDQ57AYuEmsduIOZmF0KKNAd5pCvyitg0fZT3ACVpyE5/lG1y2fuzO49xP
         3htiAKT7IWrN4tOPQPf2C/DefE5J2DXiidqhWTdBSYVJGzhOEofAtQNVFzrp+S96GYrO
         1a7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249002; x=1750853802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=Wo3dmP44aYPOj3owDVPEviRkxVNRMkyAoQ+mIVY/RMOzlHaj+FuGUF1GwQ/pDjVTHO
         4Gv9LRoZTMjRQfzsAuKsGC0OpgUpsEe0Q7vSh9aLshYXtlk4nCMy7hv6zT/HZgoCt+Yo
         plAaHlj3ZmkyDxK5gJ/8x3750a8WXRXSMhCSpzOLlTrWzUz/FDEpeiPCtkd9ua5MgX/B
         CEG77k7aIEz6/MLkDM+0VnamisoqKIw+MJ4BnjclV4sskzfiLKlhV01FNtyAa1Q8CRut
         O8c3vEqg7D/QNy15xAhilK4N9Ai0xJnmx0tYVnkgmsTS+szTL9ZL/Wukge3Y6CY4jxpB
         +i/A==
X-Forwarded-Encrypted: i=1; AJvYcCXsPY7wLvBoIVR80KLf4a6vzTi0YnxT4SUNqIDiSEeFFMSVOu7PaLdmj/Pk5eaUETILkGGM6JYPhe8mpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXkY6pUdIZM5h/iXLiuS0WIBFU+x6GMBW/BDme8jw351uBhuni
	b/3+6q7fAcldnjvGCy0K6Q9LvIUq5GBmU1mQ2dwLMUv6C5avAGuYpGysEWN3FMpu17U=
X-Gm-Gg: ASbGncujBU54N14MyXR9QHLSOx0PKcZOg6vn+45MUmqAVnMbRAnL4UgYnmFIAadphCs
	sCpMYr3KTByrBS10cidbneQdGMQSaxYXDDbcX+dr9Lhxe/VkFSeJcSOnMqdJj5yBEOBr0IKzi2z
	9gm+5RI2a9kVT25CtmdTc5EYaJPaJNExPgL00IQBIEQsNTtHR4Y/xsZnCb0Su4DZhbQ8yYjHRHn
	cdTDBdQYvMTo86Dhp5dnjr38oS3Z114n7V7pshJr8y9g19VTQ+tMGGV1SLMzHzq+5utNn1FGqwt
	qiW9PK8Kt4CCL1t9RTW8ayE9MMeF4vcAjf8x/9ZvVH04dcWYGwPNW9LoO03oTFyiwWmY04YGvXY
	xobwArSvSxkuSJddh1Q==
X-Google-Smtp-Source: AGHT+IH2P2w3U/h/GCyVrF4vWBLzughOxmxuriiQUW79HX0TxSqhiFkSr2jBzgPxCEWk+K4/KL10ag==
X-Received: by 2002:a05:6a00:14cc:b0:740:4fd8:a2bc with SMTP id d2e1a72fcca58-7489cf5c8e8mr20222421b3a.5.1750249001664;
        Wed, 18 Jun 2025 05:16:41 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:41 -0700 (PDT)
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
Subject: [PATCH v6 17/23] ACPI: RISC-V: Add support to update gsi range
Date: Wed, 18 Jun 2025 17:43:52 +0530
Message-ID: <20250618121358.503781-18-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051642_688458_298BE853 
X-CRM114-Status: GOOD (  20.52  )
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

Some RISC-V interrupt controllers like RPMI based system MSI interrupt
controllers do not have MADT entry defined. These interrupt controllers
exist only in the namespace. ACPI spec defines _GSB method to get the
GSI base of the interrupt controller, However, there is no such standard
method to get the GSI range. To support such interrupt controllers, set
the GSI range of such interrupt controllers to non-overlapping range and
provide API for interrupt controller driver to update it with proper
value.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h |  5 +++++
 drivers/acpi/riscv/irq.c     | 38 ++++++++++++++++++++++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 7b038f3b7cb0..2caf049f09c8 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -40,6 +40,7 @@ unsigned long acpi_rintc_ext_parent_to_hartid(unsigned int plic_id, unsigned int
 unsigned int acpi_rintc_get_plic_nr_contexts(unsigned int plic_id);
 unsigned int acpi_rintc_get_plic_context(unsigned int plic_id, unsigned int ctxt_idx);
 int __init acpi_rintc_get_imsic_mmio_info(u32 index, struct resource *res);
+int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs);
 
 #else
 static inline int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
@@ -74,6 +75,10 @@ static inline int __init acpi_rintc_get_imsic_mmio_info(u32 index, struct resour
 	return 0;
 }
 
+static inline int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs)
+{
+	return -ENODEV;
+}
 #endif /* CONFIG_ACPI */
 
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index 33c073e2e71d..cc1928422418 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -10,6 +10,8 @@
 
 #include "init.h"
 
+#define RISCV_ACPI_INTC_FLAG_PENDING BIT(0)
+
 struct riscv_ext_intc_list {
 	acpi_handle		handle;
 	u32			gsi_base;
@@ -17,6 +19,7 @@ struct riscv_ext_intc_list {
 	u32			nr_idcs;
 	u32			id;
 	u32			type;
+	u32			flag;
 	struct list_head	list;
 };
 
@@ -69,6 +72,22 @@ static acpi_status riscv_acpi_update_gsi_handle(u32 gsi_base, acpi_handle handle
 	return AE_NOT_FOUND;
 }
 
+int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs)
+{
+	struct riscv_ext_intc_list *ext_intc_element;
+
+	list_for_each_entry(ext_intc_element, &ext_intc_list, list) {
+		if (gsi_base == ext_intc_element->gsi_base &&
+		    (ext_intc_element->flag & RISCV_ACPI_INTC_FLAG_PENDING)) {
+			ext_intc_element->nr_irqs = nr_irqs;
+			ext_intc_element->flag &= ~RISCV_ACPI_INTC_FLAG_PENDING;
+			return 0;
+		}
+	}
+
+	return -ENODEV;
+}
+
 int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
 			    u32 *id, u32 *nr_irqs, u32 *nr_idcs)
 {
@@ -115,14 +134,22 @@ struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
 static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
 					       u32 id, u32 type)
 {
-	struct riscv_ext_intc_list *ext_intc_element, *node;
+	struct riscv_ext_intc_list *ext_intc_element, *node, *prev;
 
 	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
 	if (!ext_intc_element)
 		return -ENOMEM;
 
 	ext_intc_element->gsi_base = gsi_base;
-	ext_intc_element->nr_irqs = nr_irqs;
+
+	/* If nr_irqs is zero, indicate it in flag and set to max range possible */
+	if (nr_irqs) {
+		ext_intc_element->nr_irqs = nr_irqs;
+	} else {
+		ext_intc_element->flag |= RISCV_ACPI_INTC_FLAG_PENDING;
+		ext_intc_element->nr_irqs = U32_MAX - ext_intc_element->gsi_base;
+	}
+
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
 	list_for_each_entry(node, &ext_intc_list, list) {
@@ -130,6 +157,13 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 			break;
 	}
 
+	/* Adjust the previous node's GSI range if that has pending registration */
+	prev = list_prev_entry(node, list);
+	if (!list_entry_is_head(prev, &ext_intc_list, list)) {
+		if (prev->flag & RISCV_ACPI_INTC_FLAG_PENDING)
+			prev->nr_irqs = ext_intc_element->gsi_base - prev->gsi_base;
+	}
+
 	list_add_tail(&ext_intc_element->list, &node->list);
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

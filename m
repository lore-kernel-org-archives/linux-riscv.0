Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3FAC83F07
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 07:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEJ9SQJwdOk9JSE2EAV5LffF/i4nt7+MqheoeRiZu5I=; b=do9nCaRjgTHsur
	KR8g+d305JQf0o+EIymH2/dw11eYTNaZS4TJSlcEOGmHoWs8wEqXl+Nr7LXE6+GgZEJMWChyeSCvX
	Nbe3su54qkPU/P/Vg3UnqdiDyM+N22Xrn+OgNOlUO+ylpeZGZ88SSwLxEKLRMnEjTgzeR8rRzfFxH
	YeMFQzM52Kq73PHL2vUd5r1/yTyWg7AwtpuMJOKIHV5dcW0d/ZUlYUDbDEeywB30yJZlTsPUfjYxa
	BfkpNA+nJ3Ho60v9dFNsNdocAlNdq3dsY17W/nas6U18AfZp+mMssl4YlZ90d8+mmtF3r6TLFLgn5
	t3w3YhiLOmyf1SCZ75OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsFO-00000007XxA-0ktB;
	Wed, 02 Jul 2025 07:51:14 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWppY-00000007GGq-1TXC
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 05:16:25 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-23636167b30so37275775ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 22:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433383; x=1752038183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=mE0wUdjlsOGVGECr6SfwL7V8SSLgApBYqDKIYsDHs71OMdHAaLvqvBZo/8hX40HyTJ
         /se+X9QYOIA1oQqnxsynTdg1EtP7qsXJHjBE2EQitNQaQASrxhHc/Vjis7uZ/h1R765P
         WTbYJ+XUlG7QGSO31w6RL+FZWP59wlUqYOiSOuNseFMPn2G99MZwp49w0pphNdPfZrn6
         CJn+d3/NfBpmyjPnOsMqoU26B0xf+YlAFCUVke85tIKm/iJibTDowPjDe42ubA5nmz7l
         nlbS2z5O3UEVOdlL+BKmOEEesp4BEQUHButFsX6fNSwOTciPTDZdaYQpkZIvwoUS4wd6
         F9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433383; x=1752038183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=L01NzchXV7wDdRv4D5z3Yki4Cwkdk5OvfJcgsBtEV1qJkDNe5+9MdtgGXazej0z+ft
         fPYoHPsyoeKElpBsZ788G6KkMTEEL74cGdq+4nfOW9KLCNDbw7NURBe9Xq+MdeYmrRWv
         ueQI+y136xvpAKhI8kIVbdva3Jw9RL6hBbID8zkg5ywEhUVbhJt7600PhVJoxGq46rHQ
         Pxp1o/PIKB3reQeMZB5mSEEvCpGu3sy2HylWwikZJl8Ky9Q0Zlv3YtYZk8COdgsJ68zO
         Ng5VDCf2h8ryZ86Xm071LzAsqdH+bq/kYvsGXcTJAyYPcGImly7BgHa9Rm3VZC3if1Ex
         2joA==
X-Forwarded-Encrypted: i=1; AJvYcCUhxWvSUZYLDWxhmwSbrFLb6IPDborLuRUu7TsJn0O8GbUjwHaN39b9pO5kyymc7y0tszGKIP3RmMEmbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzulUgY9ghjuDC+d3hJcyqssvxI+n/hq278YAl/L9janqZe/zId
	1yKQWKj/KqKpyyMS4UqoZWrjwUzglxxf6rYiU2T3huxFcGIay/q9cCBomSU9DDevHws=
X-Gm-Gg: ASbGncu5Et5F1YDhmtPx/6qEl2+oCzLd1ToqIGz9saDU/RSaiPEwmtMupWR6rQkhfFO
	+iYXizXdC7ONJTDgULl1loK1annpYeSbQI6RLPN6XJa/biQnZOm7TiCHeVyS34OtZtYvNCZ+l3E
	Bcls+084l34MQd9wWeMlibUyWz6jYW7fa0VTGEFXlmNZgBY6EuVZSKFDyXXfs5Ko8Tg+ZkElI7m
	3wC+uzw6oYlxMJpmouK0OyO19+XtdoDsGAdrzA1+h/TY4DiMJmJGJPm+cn/rkhvKty1jbbcZkfW
	rNaf8e+kNPI6ELRn5XlyBZee8W38p2O5XeGxd9Vd/RO48FsIX7h6omSUQbG5thonbcWEldFmGLu
	AD2rr5fkCVAR7GRFjzGlJIE983tA=
X-Google-Smtp-Source: AGHT+IGjcdQ5SCYBwX/q8Ua3m2HXtZ+rTtj1lRl52H5ZQqdaEzollbkuxBGMe/8i5xm2XRTqzzD/0w==
X-Received: by 2002:a17:903:1b63:b0:235:2403:77c7 with SMTP id d9443c01a7336-23c6e5708bdmr18551065ad.37.1751433383171;
        Tue, 01 Jul 2025 22:16:23 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:16:22 -0700 (PDT)
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
Subject: [PATCH v7 18/24] ACPI: RISC-V: Add support to update gsi range
Date: Wed,  2 Jul 2025 10:43:39 +0530
Message-ID: <20250702051345.1460497-19-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_221624_399454_CD6C848B 
X-CRM114-Status: GOOD (  21.34  )
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

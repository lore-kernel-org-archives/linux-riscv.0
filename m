Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D66C83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 07:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEJ9SQJwdOk9JSE2EAV5LffF/i4nt7+MqheoeRiZu5I=; b=ydU/uewzr+lPL+
	uBYOSkXfRXTPpRZ7RJSvKsoHh2n3iKKAoKNMQwOUJC6Bij3pW1uxnnjGhyIG1LJFLiNnX8c8tERJn
	Y4po4vDPcxzhic4v3DrgbOMhaB14dNwS43AfV/ZWGdBG6B08oekUImrHi83O4K1hMIcAUzI3V6ZnC
	jckFBjgFvHUKtkMNqB+TIHncF9QKk3yP8aSqm6AXUrajfj1564xY9PuZkDMIBQ8WWhKZXPhenEF3D
	y+jkOBaUUC5BE5FYNm6KK24JCen/p4vP8PjvCIhubivtcIgsed8gdQ4hyUge9kns4UkJ6QUWMnGLs
	5e9azlsSHDe5QOn6RXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaWQ-0000000DVVY-3EPD;
	Fri, 04 Jul 2025 07:07:46 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXaWO-0000000DVSh-1cUa
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 07:07:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3134c67a173so723924a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612864; x=1752217664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=EzAu3NtvvA6ss7YfHKYJvywj5zUYgxlm+ufpjLO2SJbBYiVF8wrN8cLyEDKigDwrzg
         uV4ZukLSC3XWHbem8JvGm19yyts5gC103TvrlsYswk3XqS2LpkS2ZgYrfW82TiE5Mh0/
         mNL5Ubcq5o3Ostpcc96jwsr97lnVdqQ5vH1bvEZNbj9EIWMtfdbu+HNDaCvoR3RaLOpZ
         9hz2uDe03aUhBn10H2RyOuBgoDrmNYW0oBHViOFIwPB8WvbHWrJxEFf4qBcefHQZurE0
         BHssN7N02+iHfhZg6P14FygOPaLEnHnCApJWpVr2z+1OgjtYhVj9/8+dz3JYWYfQzjDU
         Nepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612864; x=1752217664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=vwXMvqLTPhdUi2eSZBES8Cxzqth4qjp2asuld3sMGFJIBXqx39pQPJDulSnHpcKoJy
         jvuup4oEkNLUezhWMwQCRWpZoJul2WXz4/EyhzH7+CPPkE5vj4Sj0rRxsZWtuOHgxfea
         bTNdCxkzGdhU/3Fp4HURDpbBHCncLaBuKgNkYK9MT15xo/oShA6WVUtW0Oc9RGVcc8Y+
         PumoNJXMFfNWWLEubMDbfrjEeuw+TMktWBDXl5a/E0N7VG+X0SeWaf4F9iBBFMnz1gQU
         oUZl2DYN3uZB9J26956pxUllbBmLnbqlyYVaMK+qZP3H0zKzLNVMpDsvQp2ws3pOb/99
         Bzxw==
X-Forwarded-Encrypted: i=1; AJvYcCXah6cMfw2d8hW987yOBEzzvEUjJDjaPgtK4DEJGVLd9N1fYnZhDYK7beIAuvsDRqCqrdGzHbPtc4hhIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYzhmae4QoUQE2oHc+dMnrmczKMIa8M5iIOJ098jZJDj7NUPAu
	8lnXATHlzzT/XhqvLjOL7+/rWmwLulzXYo0frylRkNzma1geS8boegP6TLFf7MTQ0aw=
X-Gm-Gg: ASbGncvSLhwYpYfiDa2J1vwff1xEsecPt5LuxQuB7yhwtQ0B8p37ccBJaRtm87FdDw9
	yBKHfXFHAjUxjmNxPiGXDO1fuB+eG1nkahZ0EFsH+9aXbvQf7LKvswD+2y4pvEYVg12TdaPMm46
	A8DYYe5sN8LHpqcOmsNQyIfZI4R1NzTFSAcLkkKyRFZCoj7ub4VgJ3VptB44pYM0Hjjz0CUjhgG
	mlz3Cajq/A3VEtRAt3yObz6hzJftJltEq3akYJJ+26RdQYpMR8du6z3wGKIIh/45JTt5SMPitJi
	iJDyk2f0QbDCoXp6oCc50QBvLNrkHUorUTHjSaaS8brHbLubnRGF+mDXhbdlWPc9zP1PQE3gK4R
	mPhiLMSH0sDpL+gV37j+GXfXxew==
X-Google-Smtp-Source: AGHT+IHRFTKO0VDW/jyTEW0IE+/OsJGDpLv9gEELtrJIpL7F8SbPvAzBJD3XM8BB/v/qFZ/tjbTf8Q==
X-Received: by 2002:a17:90b:2548:b0:311:da03:3437 with SMTP id 98e67ed59e1d1-31aac4cd544mr2256497a91.27.1751612863613;
        Fri, 04 Jul 2025 00:07:43 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:07:43 -0700 (PDT)
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
Subject: [PATCH v8 18/24] ACPI: RISC-V: Add support to update gsi range
Date: Fri,  4 Jul 2025 12:33:50 +0530
Message-ID: <20250704070356.1683992-19-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_000744_428594_353BDFE2 
X-CRM114-Status: GOOD (  20.58  )
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

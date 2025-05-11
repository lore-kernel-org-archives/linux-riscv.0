Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D629C3ABD2
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfVo/DUxZZ7f5PuIX2ZM2/lUzGGHJXiPotInXFlgOpA=; b=QWvfU//Vh3IwR8
	kVAMA2RrG2B7LeT8rRVD4US+rQMeP04P7tYKnPNz8JbeHlMQ6JYFNzhjSKaOBATg501HUS5bMP2VB
	4/4ZAdfLNQMGDYSSqJ1VeEtWJTqfp4N815OeOryHANA1xU1lrQrP57YJLuLi3JleyQwRAXaLDiiLr
	Onw97+4+SnploGZDYARKKv8KkpI14BYKu7KNWLjKjug1zztmTIgkZsIrc2HUjsF1fl/GO3rZIg1Wm
	31XGTLQjmVXfCCeakwuE4VlisCperhdTUS9fCKGgk4LQ0EkW0sa5EHLJc/IjO5EfguQaP+RBYArnf
	VtNWsoERN1NzZ4WVEo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7z1-00000007OvR-2C67;
	Sun, 11 May 2025 14:48:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE6x4-00000007ISL-0hEn
	for linux-riscv@bombadil.infradead.org;
	Sun, 11 May 2025 13:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EicnbWAWAWZGOgLLZdl8aWUhfZGM+BMdqy1GBjeEe78=; b=HFKFeOW1BZhwWel4vUT8ubKfx7
	z7vJmYxzRp4dZ6MBM31od6bjBspKNjpGdYIJsvY/XM/pbxqaIfLPDC+LFQlvf8ANeFYT3DGCRwwaV
	7AJj2S08bODqwPSYvH1fqC/GUQ8jm28cC3OxXZrGUWYKqOZrOUjHiyxLqK8Y/2NsKfE8PJos6S6s5
	t5R7DNDOp4VZ+xSX6Mz96JIMBfuXu0Cd2Oj0lxZ3p1Wx7Ir47XZ5lsxYsniCWte1KehVJdP6zE8WK
	dL8BqYs3YTscEIRA7rE4ZZP8lgNi2bT5XINiuIwxolhj3Fcdzq6B5aWxE3uWAqx03/S+h0HDJGUzg
	lhprpDWg==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE6wz-0000000Gc1x-3Ngi
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 13:42:44 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b1fb650bdf7so2186883a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970958; x=1747575758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EicnbWAWAWZGOgLLZdl8aWUhfZGM+BMdqy1GBjeEe78=;
        b=jQNlf9Pgi0ortuczkFOdvYMSbbcJc+uD6Rsnj3TY0fTSVUmgEWrDWb5gCUkJ05Gc90
         Usa5hehenfXc4maRgApz59IlasGni7Yrw2fvmyox7Q3+vxAfQUXBoR8jIT7fpKYlrHKl
         L9QeOVoQCrLdlkXmgMQ2JmWhFbdI+FFZQwOC3vah0GJPJ82w1iD/h8M5z93moW+jUrkO
         kqOAf02vZyVmtrNqloxaef24DWPl2IGO3Z0/XfdhQ970O9SrD4ajmLR3EtzYbuiRyIt5
         8LzOwIdzTD9zzlZ4BRMmId3lbXDU5qVJF/+XmBs2beJoKbvDbh/HP/0JHmcB/nUBbSdl
         skkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970958; x=1747575758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EicnbWAWAWZGOgLLZdl8aWUhfZGM+BMdqy1GBjeEe78=;
        b=rEUC7MfpDeqMoGAgInudaI+zcQJrL/b60CsgCNQT33fxcL2bXCzW9asTvFhi/c994k
         U0poSjKzXnmr8W3P1NygqEluZn1rj2vWAWHGR+sbAHPEQpo0fZV9AthwCf7fZ8oGy2Iq
         tQWJG3tv4mrk4zwq7vIw3yzJdXVM2jAnV0I319p5qRUo8wLCJe9fM815wMLdcjCKNLbk
         nFQyjwuYx1Ip73RCA7FvqeoaPP2OVu7uEoKgqijy3qwr12GmePcGZki6NkVVKH1rSu5u
         ytw2fUANyGxMC4i6VTJ6VZ6l8pm6WKbnNMe1z1ztUMlGI0h98za0OD9mcyVkGWvPcYLt
         dHVg==
X-Forwarded-Encrypted: i=1; AJvYcCUxLgugYT4KtfIKckYqlF5Qe8nB+g9RiCXH00X99wSCBIoJvtzV563uLPy8TaMQChdqStKin/FYJmPA+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2uZznJKBjySo/ab6AdRXaS6Ery7j26lO6c2CvfHlZm7273dcd
	jPw78sBBre1a/VwTtohOirZ9k+feprco9PZ1ca0u5JF026fF1WrOXieC6cOduQc=
X-Gm-Gg: ASbGncv0YiUna4N3S1cP7Mmq009O7qOT7Q7yT7Kw7A9Ra/EhFk40jMzdzyb12DOJADd
	UDLUOyN7gaNBUoIWLjNm/FrmadUwW2FLn9XuW1PYnK7sT6FRCWeT6a2wZ+h2ib3mqcl+IHYlv1W
	opf91x/Yc9QYNgvM5sAgs771+vfWsJ1Zqq8BrQlNTONXWIGHujJ7ocn6ISzh3CyvsWmTX1kfx3R
	4euXM1rgaJJK5ppbWrcZ8GnxpafekLFZnDNQDLGtG7DV1E5IYpEt3JZh5na5BmYLvOKKn7U9I0j
	O6wQPdEemRxJv/pE2qeF1gQeQn6m9mg8c6s/4Hy4qVD5/5BG1VTcxWyuLgutC3yaNVVIwGSzWpu
	bToNGScVPAaYVGw==
X-Google-Smtp-Source: AGHT+IHcv0oB42y9G0S/HkQGQ5hPOUGyXWyhO3DHzdff0XOTKBe+J2a2zxdeZPOiU00EgG5CU4MCpA==
X-Received: by 2002:a17:902:e94d:b0:224:1074:6393 with SMTP id d9443c01a7336-22fc918c44amr161982025ad.43.1746970957821;
        Sun, 11 May 2025 06:42:37 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:37 -0700 (PDT)
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
Subject: [PATCH v3 18/23] ACPI: RISC-V: Add support to update gsi range
Date: Sun, 11 May 2025 19:09:34 +0530
Message-ID: <20250511133939.801777-19-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_144242_084092_820EA871 
X-CRM114-Status: GOOD (  19.88  )
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
Cc: devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
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
---
 arch/riscv/include/asm/irq.h |  5 +++++
 drivers/acpi/riscv/irq.c     | 38 ++++++++++++++++++++++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 7b038f3b7cb0..ef4aff62fba7 100644
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
+	return -1;
+}
 #endif /* CONFIG_ACPI */
 
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index 95b4d7574ce3..2ce311042627 100644
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
+	return -1;
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
+	if (!nr_irqs) {
+		ext_intc_element->flag |= RISCV_ACPI_INTC_FLAG_PENDING;
+		ext_intc_element->nr_irqs =  U32_MAX - ext_intc_element->gsi_base;
+	} else {
+		ext_intc_element->nr_irqs = nr_irqs;
+	}
+
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
 	if (list_empty(&ext_intc_list)) {
@@ -135,6 +162,13 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 			break;
 	}
 
+	/* Adjust the previous node's GSI range if that has pending registration */
+	prev = list_prev_entry(node, list);
+	if (!list_entry_is_head(prev, &ext_intc_list, list)) {
+		if (prev->flag & RISCV_ACPI_INTC_FLAG_PENDING)
+			prev->nr_irqs = ext_intc_element->gsi_base - prev->gsi_base;
+	}
+
 	__list_add(&ext_intc_element->list, node->list.prev, &node->list);
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

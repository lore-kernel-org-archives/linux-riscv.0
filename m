Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327E2C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 06:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEJ9SQJwdOk9JSE2EAV5LffF/i4nt7+MqheoeRiZu5I=; b=PXIi8xmv8q2zBI
	nMKSDUDD5Kp255Ahrd5RMcaz26uB+NVfjx72ILw/G+q8oz9olpfUBEGOfexnIzOQzjGaFslQfjubx
	FA1KP0CMJ4GYWR+K+UYxtQiq5jb1jNVVLsvlsBYDhcycD5nKr2yGeskaCszG1/6fHVQLl/tqeipTw
	z1xj2mL2gqfVYgUxWebgriHTXeFtL8xs/OUnPzeV4ha/J5CHYA+D5DeiQIPOBSmxBNF4OCoOWnlGJ
	H4pwBMQyUz5ZWVl6XCYmLwLMuFtqtrnX/ommiokRmCEgDHv90DfnZTmIekZ2rBAdBzv9aSiVysiej
	WH0rduJcufCaDMa8ozhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEtr-00000008zfs-0pet;
	Wed, 11 Jun 2025 06:25:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEto-00000008zf1-3CzF
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 06:25:26 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23602481460so43205675ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 23:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623124; x=1750227924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=hxabYhXxV/mG9/0eeg/wjiVWjdCGbQ4qXLJv5mk67yLSypJGrFeqdyfyEPjodGsdBj
         uWOaL5mx4xIp2SWXJP4VjGu9Zlo/F/z0gN9iZesaXTq5J3xLZIRmu+tLKE2n0PAJv70H
         P5oQ0XsZ7Brr/Fmgkz4SrCvq37ajWWg9KsTnHanoxXcJWEJ8waA/e5YA7ac8/k9CHB7i
         fkSXjOxdYtdrUZyz7pFiqvK9iPmxYYnb6dKhezsTOPFNIBiplivlL9Owlw0iFNWdFSA4
         HesEVOIxTvdeza/qLDYzz2RYoOuenj/HvP17oScgLZR9qsXdBr0Y4BcnWipcTZLpJOVC
         msEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623124; x=1750227924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=HoHymXonsg/JDMVxCKeU45mm+Oko9KHQZPMDVJFdw+ZrVGETZZAGLrph1UlbUW9PZA
         SfvNL82/TAd2fBedA4JQ5BWaDNQ5iSfjX6LNecuOfIaZMi7485/YOZViu/BZz5EEEjpK
         u2xcNwkckRtxXtW/syDzLND7NEHGE6+7Sww1ulmW1AfPbw/cQJPLCqzjQocGd4VAi0w6
         9sWj8+OZtPpgFQkFTcgCAk8KTwHZf+vYkOv+syt0dQYmwJkRJPmwGhkq6B+NE081XFrY
         tWiAHnRQswzBK5LywuG6X9lW/91FSq9ZJtaDKNTbuc5AruE4JlTpQGTp8B2U56CP2faC
         H4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgb22gWdt72t/u9Ypgj5/+wTgKZtvPe2Q0WMYPi/1J7KWffWjTBmRjwWAdSdkvJ2gRv/VU328IirXx8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVSV4CrRpz7Uc8IYxxaB5+HAw8/mk4SelB+iNv74LLvtcBd7Ws
	izR5sHGHqCu9KDgQ2S8HyWOK7IjN2sJ7tPnAI3sxaj/694gMEKD16Eq8gqwBhe7zPAU=
X-Gm-Gg: ASbGncuN0p+YuJZbLcsF0Pg7yNmkY9I+pwggkqIX3nPnH4Ga+1wzRqR5k60N5HspQjv
	ygNEaDaD34mVxSTKKsqjqiTamMcv/IIa7aIPp8luSB+YBEyh/O1k+scoetSKp4jWop0UJhTARot
	gN16VW+zNQs/2cpyes9D5R1TEuftoNl8XtEgMeY48GdkurGk3ZtdF/9zPjkjabtwP9jFpn+mYbv
	ah+EUoHjW8OLAKH9fdS2+YvKjiaNrJWauM2PzSQsgEyadtX+vHEDY75CwaOggoW4Ub0MEvYnEy5
	UbTGmYFy7ciZdTc3HAvhqywmVpCqPWpgYee2hzjXkqx1+7BURJdnJiCzABgyDJ7kmq4vfgeSCi0
	m6Mwqhu96piRDFmvqtSNN78lLRQ==
X-Google-Smtp-Source: AGHT+IGEWLvHu+QitAoaSc5JCFVSXTiR4zAQBrrLEPUMyZeyXwPVzV+EQ4Eq/uT7lUdx2oEJTNiDkA==
X-Received: by 2002:a17:903:2407:b0:224:76f:9e4a with SMTP id d9443c01a7336-23641abc3d7mr31388505ad.14.1749623123949;
        Tue, 10 Jun 2025 23:25:23 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:23 -0700 (PDT)
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
Subject: [PATCH v5 17/23] ACPI: RISC-V: Add support to update gsi range
Date: Wed, 11 Jun 2025 11:52:32 +0530
Message-ID: <20250611062238.636753-18-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_232524_812619_42937DA9 
X-CRM114-Status: GOOD (  20.09  )
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

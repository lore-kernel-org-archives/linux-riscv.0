Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CA5C54ED0
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 08:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c053hLDYfvZJZjINQeeIrjyoh+IlGb2tHbbqM0TkC1g=; b=jiOQO7XXfOUV9k
	oLeVrQveSUHet++tawJkTxp1y1SGyngcvU6eW6ik9tv2/UjQJtUWKjoD8awabGIBFpl/s6vVmGsp9
	rULH/ho+JuRZuVRwBuG2vm4jMY5wIlxp4FGjyAHbwScqVSUwuQ6kEWwU0rGqxGLUYx9iTuz1BExkW
	hhPQsiJCFxidqxr+rdD3L7rCYarT5q9RNXRZd9SQcKgZ+4lIici32auSqTi1IW25uKijXz5FDLO44
	+fTVQ4UBW+44bGTr4zySxHS7ffYIUPTdEN1n/t8GudcetxayjiqPLxkmvaxL+8vc2SqBfVcjqFfZP
	VG27hK/vgLN4qFp3tk9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ74s-00000006nfO-0iFT;
	Sun, 25 May 2025 08:51:30 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ73J-00000006nNt-2rPl
	for linux-riscv@lists.infradead.org;
	Sun, 25 May 2025 08:49:54 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-742c5eb7d1cso1426128b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 May 2025 01:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162993; x=1748767793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JayfekSBf60XxmNCoReWHRNPh+4d4QR/028ggZ4l4HQ=;
        b=m4QYJis7i2uka67n9vMgBd2O3T7MEbQ3WmppXU+CkLnODe1ITLGbfB2vzaByPWtvQS
         JdDJqJIz04PdW7zARenFSscX7Uim6NhwLNbf4ENuVkMk09bPT0iTplz98/tkZbqJYtg9
         4gudTJcyen7kAfpg/+WK55CvKGvHACuRNb8ZNyqKhd5+kUaTUbpKNx/dexvdGSN3U2nK
         lZ7SFO4Ro3PbGYlOlbUZMzrJqV1EW8O/b0HFtXekviWw4Avd93fQwB1B9VUUNDrvL2I9
         80OYQ04Kl63H8hwlBbhcWW/W80eP7fssBhH3DP1hiK3JEorWzcRGen5Czc3IIPhAcvFd
         956Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162993; x=1748767793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JayfekSBf60XxmNCoReWHRNPh+4d4QR/028ggZ4l4HQ=;
        b=jrfKLiVZ7ckJeNy34cB+MbqbmoX3ON35DwbwZy4n4L/2ord9HYn7LnR/oGl1X1pYc/
         ATBAHN4EC908uRIU6DEcAQqYhxv9AmKE3sqYnHrxuWL9P6wSjLQFIo9jOLp4iDvgflZL
         pZTdXb0NyD796186wXct0HN8zmbsgaiLcWwRxqhU5hIBsnExcRpPCgsYvUK4kkY8uObF
         im4t5SFGMkzjmem6O9MiOs6ioczPFDo3Voqzng4/l7uICrZPNk2/Wnmy3dwXrpNlOmpI
         NtmU9rUlXaYS8tpMoOIjS4ODukPZ9tL+xfCUMpW+qGwYXzi3bFKwdKCL4KwsJYf1PoPO
         KkUg==
X-Forwarded-Encrypted: i=1; AJvYcCWDP+YAJ+srrTBDQzdJOofXddG8yJiCw+Tq5G0fjSLonMt8sIcQiC+pKrEUPrycO7oaa+tu6WIG6y4qAg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1cTnzsTiVxn4u7X0TczZoVp9EstgjNLRNgL+AYsB1JZfxBeEc
	BEvM8TEDStrh20OMxr8G/hyV3uBKoxS12NF+F1+1J112+NVT/V1HhUZFTGtVaZ8niIg=
X-Gm-Gg: ASbGncuNbjygbO6VHF66Z3ixfGn52BECIYUwF4SKHJlzaVGiXcvy/cV/CPBehm82ukh
	nLChTRaf2pjQhlX76sQZIU1msTbQwCCheztWVSciyS0yXsn01pzCHE4Wu9Qb1jFP0YmENH/12LZ
	Ouoy+OodlbA80sYnUScYrA9yf0LptU6kGEv/PAGaTaUYifD4nZS+/ThtdL6kL13YvCaz2azjqWw
	nDdUlIE1eIj7SUbIDm05j3m/a7uo6Sxm6bqh6BXzXq3oM0It7fb+lWRrzjOeLvr1f+rzs3efclG
	e9b6Vq21vW0lOL1TUB02neTm7MvlRIWJB0b0n/paACIKw30qfGWIJOibzOQA26kn8B3Cao2jO5h
	WIDktLz3N
X-Google-Smtp-Source: AGHT+IEwbZO/SSaKSehtYIjWeeQeYjGYbuE6PZbtY+EctOE5J9CWn4Wrz1InyntDeMSrBzuiztLrSQ==
X-Received: by 2002:a05:6a20:3d94:b0:215:d25d:fd14 with SMTP id adf61e73a8af0-2188c243786mr7499517637.13.1748162992994;
        Sun, 25 May 2025 01:49:52 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:52 -0700 (PDT)
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
Subject: [PATCH v4 18/23] ACPI: RISC-V: Add support to update gsi range
Date: Sun, 25 May 2025 14:17:05 +0530
Message-ID: <20250525084710.1665648-19-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_014953_720626_E87EC1D1 
X-CRM114-Status: GOOD (  20.48  )
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
index 95b4d7574ce3..c881cf037f0a 100644
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C29C87FD4
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 10:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEJ9SQJwdOk9JSE2EAV5LffF/i4nt7+MqheoeRiZu5I=; b=m9YUcvSSCxJOqx
	gF44qHcVOuHY0xWB8pP2XZ+dn4ALrA+7m1eCh7xg+GMd0uIbl2i26LfRG2MTgmbyzhDORbV3xiZTc
	At374ahNHQgY4lRZOh25rAsWJ5HTEPaExNhQa9Mv34tUyARM3zZ+oZEg2bzAgm3mqC+gkoEtL7WfF
	bRvrL/uRXmCfC1fu0AFp/KMnRObpVQhNH/QvvGma9EKlkFCm1Dd5jLSkPhRqj+DyWcRyqUTr5H3Vy
	j1Bvg/B6oiZwWbZm7r75FxDmc+QX6UW1x5T7jZyqyyp9cuo1B6eBFsEMT/WzmEhTvkzUiHl4j3gjT
	kvmS6wJPZu5bZXC4Y9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLY8-0000000EI4Y-4BaE;
	Mon, 28 Jul 2025 10:57:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOl-0000000E8pL-0nDC
	for linux-riscv@bombadil.infradead.org;
	Mon, 28 Jul 2025 09:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=; b=eVu+jgHK8c4Pt7RjwgKNmW5Cby
	oO8y+BX+5VgNkqd/jYnDOdktjXm7YYLJ3i77o9CcoLJiYW4OkYRy1p3ljpPoff8bm19y9MtaZt9/Z
	UuhpbTR3wnwji7GowaEqdtE/2/mSdYI91+HbjxzEEfznfJRZC+S+l1uJZWz7lxvfYpcE0VD5NaYpM
	rnVxeOiLiba4w7TWqNIlD4MTX/utbk7F/KKXuHO1am4rZhuOSNzWyus0fcL9MyCezA1gWsUGr3xbY
	yfq2sPjf/ItnQf/YCKRATjHonsFZ6FCBfqdn3j9Stg+1MdeHwnkH/DCMwp1WW++i4FOY9i6E3gqo9
	jnnhkC5A==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKOi-0000000CPlp-1L6y
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 09:43:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-23636167afeso36121195ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 02:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753695835; x=1754300635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=k6Ide90t+jFV4Iv2RgURKzCLBJ8qslyS10+JKo2corsie8VNNlGi19gVXB3YbSt8K/
         c6I3vfleeZAZfzmuG9EcXYjQADtw9EAX3ilhnl6cHVQJFkzPxc63MGkVPBxnWxD7hoCh
         3zAfya83/5YSyHBBoZjP/GMxGjr8FYwEIml/FZS7FNVgItnTHLQZUNJWMA96ZOgJea71
         RYkWAIrmu+brQRPtdjq9aQTVJJ8Wun/3zM0DEObMaqnv0WNkWaiwQ0qMZQxPXOChzzeD
         qm62i3MqQZqdmR/h2UMRaim8Bx0EQANGsyXVPvWW91igZH4rrAo8eTe/23Q1jsm9RuVr
         +V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753695835; x=1754300635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3TJh+HyLkyeQ1VqRyPxzf43XEd03uT1gCuO+kpCcOM=;
        b=Z3Zc2Y/MySLy0xvJlj5MRP1bJOW66MptdnxY3aBa9naFq+SZHAQlt8IfF5w7TS87Da
         qBYjvfghgj7rFxKRBghmI/m89urQ29PtNslr2K+ACX3ie07z6enGTqKpuLDfbxClCeA3
         tyWYzJzSKxYoevm2FU38CFtFB7V7aC82SmrfH6ZSq+vsZ9L4uNimXf51Fyp4L520scug
         v2XjkUZxbODrGkYgp4h6rN1JI35gAJX9KUedbb0GT6cZjSm32pcwh/IH8sVQqYb5OKf+
         dPbB9NZ6MC29QNaiz/4jczW7Ch9Zb8DucD0zDfOktkR5Li8SDFRTFU1nS6zgaYeas23J
         nHGw==
X-Forwarded-Encrypted: i=1; AJvYcCX5IYKFldyv1fx64kQeMRGsELL8HV73TBWzBBw/UfpS6cz0k6iNFh6+9AqI1GZgBjafnvV335YnH5dbOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl75y6H17yGrVabf/R8T2NrYxOsT+JLp7MgTmLixRsvj1n0HtW
	kvGvwegqZOsGHi31Mcp9onVfnpXrwOhqZzNe2kuqQIH/0v5XhmPASOtcJ03O+gcLRgA=
X-Gm-Gg: ASbGncs1NCl/W3ELKopJqPAFfSsUNa6YTYAbkDlTN0S/hQFK8fx+J7t6A8KUXhUbnqw
	ejbr15ScZE/P1FP2cdtKkEzxIghX4CdgIVV88/OrGNtyLaM/ig1afME1uAW9VxqjNuNUwmso8KV
	ErHumrjELTSfJ0foZaoIEGzDJTVIfSrZH6JH6G6wNxwTn7xuT1pP6OXBFkqgXh9Q/N9eBkCjsA4
	rFRNHpLEcupVgHUTYU1t2ifJAa6DMjaM4lyLAsSa5xL9dKLlqjuAEK69VYNTZVMWl1zW0bfbxlu
	vXbMjPkr75w5eZi3obIUQ3jCPuWLHiwQZEBvvYUnjhkU7emRIvb2tiijoyWqdPG54C5xySe7rQu
	KaSc1wJ//HZXRMAnIYgPkFIu6swOxV9mEQpjdhvbFfW5DODD7ByRKoqUQZuw8
X-Google-Smtp-Source: AGHT+IHI2M7ktVDfnRXlbMOQx8cI9hQctNhXTmp4VHflXoE3OleDRvbaoO88+G60sLgtIf+JGimi6Q==
X-Received: by 2002:a17:902:f30b:b0:23f:f983:5ca1 with SMTP id d9443c01a7336-23ff9835e51mr55263795ad.12.1753695834472;
        Mon, 28 Jul 2025 02:43:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.19.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm5396230a91.1.2025.07.28.02.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 02:43:53 -0700 (PDT)
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
Subject: [PATCH v9 18/24] ACPI: RISC-V: Add support to update gsi range
Date: Mon, 28 Jul 2025 15:10:26 +0530
Message-ID: <20250728094032.63545-19-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728094032.63545-1-apatel@ventanamicro.com>
References: <20250728094032.63545-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_104356_544387_91E272A2 
X-CRM114-Status: GOOD (  20.12  )
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

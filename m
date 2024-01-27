Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFADC47DA9
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/Mz9Q1rtJct9eN+5KEO7wUv1HOp6gPrU7wnfbtNre0=; b=BVTHTeToMVlpK/
	BeyrVbqQI826IS1p9TWvkUSmPYxIGlrX8WGw6Bml2scQdp7/QSbwvGd0Bk7RlEBfTX61H4J++IFWZ
	sxEqXYEDDexhBdtp5eVi9XF1Qj0WCkZ59ibFtki86muoZM7AXxyPKCjig5ol+isGepEE9pYwFdNCl
	2jpsx88cOc4BL/AR8wWZd044FCf9a4GR5xz4pLEQb3+N2JtbMUTb1H4nshWWKrQBaR5rFckrB08di
	LYGXpTY3NX9mxGl3lH5/Me1k1ARIz4wltsg1JjwGDrqnPaWZp6mVE0KShdVFKS2ERQoVwyYBPxQmN
	zC224dPuM3NXyETojZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlQL-00000007lhT-0nE2;
	Sat, 27 Jan 2024 16:20:53 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlOx-00000007kgC-07ue
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:19:33 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2906dffd8ddso1097154a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372366; x=1706977166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4yC/aDtV6KBGHtbSqNeK69fWufSyNkr8dJJVArWQoc=;
        b=IwnOZOksmPCqwbCLZQEiASWjcWzyT0ttLCPha9/bobMa+IhnhJ5hEmeTihpg9ibfg5
         lb35gMGM379MXd34oUSpyniWUolTEQPeI2vrq7E2aerfdQmkKNSSzYoh6imssRhdwA0U
         OnLINkmRatdTTncaB/nFQGra8eXbtUOf34gSpInHeHOp5FLegR75LGuZC+bEFZg64MPl
         XcT8pl238C7lwXl/zmzrMWDL5GuaWgEiriGtO177zH0zHK7/wxPPN7yMaVIvYV2cTcig
         dDZiYp6RHI06Ix4vAaLZvnzcBd1ucSt+il9j4jYs+vVWqhbXiXAX4yBSUbF94oyy8woV
         JTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372366; x=1706977166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4yC/aDtV6KBGHtbSqNeK69fWufSyNkr8dJJVArWQoc=;
        b=N+dTuFTpn0PK+91fUjAeouUpGnwxZdOPvZ/M9kAdJ3Ml9/ugUu75xiN8WoL1cdD/2U
         qsW0j56fH/dY7LUoEuVw/TD/km9rDPdpO4bZSXD0wCsQ+QKuA/RPK6fxLNY5pKOfbAgr
         LQBK5XliPCdnIa8yJIeCGlLwvhAJulrRUV+eaYmqLBJ8yxN0GixgH+SGBKLVJYNLVbbs
         emZ3S2nPaAnQFKZ2tT3OSjxbbH4GWugZa4zfxBVnGUxQ8ao/CqaXKyykCXObaHCWB8NO
         FAim9hiuvrH3nHxwDJ61jgSWGHVS/oqAMjSJpplovpVyzZ9y4CDCL6lazG7upO5haH7z
         8mNg==
X-Gm-Message-State: AOJu0YzwIHd7yrzuNjqQjz++6gzv/5YYDcatmVOJz2IC3MX93XHCNNe5
	t5KRAzldsYxXmzZuBTkWSB52W00fjZ/WXTkpoJGyX4T35vYit9eGe4vZlS6aYxk=
X-Google-Smtp-Source: AGHT+IEdn8vgLUGX2eDHAqn3V+MPuHc8ggNPbo8L4egywusYdrINzdqDh00M1BqTAPj6pqFfggQNNg==
X-Received: by 2002:a17:90a:8981:b0:28c:f504:12a with SMTP id v1-20020a17090a898100b0028cf504012amr1237917pjn.24.1706372366213;
        Sat, 27 Jan 2024 08:19:26 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:19:25 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 12/25] genirq/irqdomain: Reroute device MSI create_mapping
Date: Sat, 27 Jan 2024 21:47:40 +0530
Message-Id: <20240127161753.114685-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081927_349214_98ABC619 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

Reroute interrupt allocation in irq_create_fwspec_mapping() if the domain
is a MSI device domain. This is required to convert the support for wire
to MSI bridges to per device MSI domains.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 kernel/irq/irqdomain.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 8fee37918195..aeb41655d6de 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -29,6 +29,7 @@ static int irq_domain_alloc_irqs_locked(struct irq_domain *domain, int irq_base,
 					unsigned int nr_irqs, int node, void *arg,
 					bool realloc, const struct irq_affinity_desc *affinity);
 static void irq_domain_check_hierarchy(struct irq_domain *domain);
+static void irq_domain_free_one_irq(struct irq_domain *domain, unsigned int virq);
 
 struct irqchip_fwid {
 	struct fwnode_handle	fwnode;
@@ -858,8 +859,13 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 	}
 
 	if (irq_domain_is_hierarchy(domain)) {
-		virq = irq_domain_alloc_irqs_locked(domain, -1, 1, NUMA_NO_NODE,
-						    fwspec, false, NULL);
+		if (irq_domain_is_msi_device(domain)) {
+			mutex_unlock(&domain->root->mutex);
+			virq = msi_device_domain_alloc_wired(domain, hwirq, type);
+			mutex_lock(&domain->root->mutex);
+		} else
+			virq = irq_domain_alloc_irqs_locked(domain, -1, 1, NUMA_NO_NODE,
+							    fwspec, false, NULL);
 		if (virq <= 0) {
 			virq = 0;
 			goto out;
@@ -914,7 +920,7 @@ void irq_dispose_mapping(unsigned int virq)
 		return;
 
 	if (irq_domain_is_hierarchy(domain)) {
-		irq_domain_free_irqs(virq, 1);
+		irq_domain_free_one_irq(domain, virq);
 	} else {
 		irq_domain_disassociate(domain, virq);
 		irq_free_desc(virq);
@@ -1755,6 +1761,14 @@ void irq_domain_free_irqs(unsigned int virq, unsigned int nr_irqs)
 	irq_free_descs(virq, nr_irqs);
 }
 
+static void irq_domain_free_one_irq(struct irq_domain *domain, unsigned int virq)
+{
+	if (irq_domain_is_msi_device(domain))
+		msi_device_domain_free_wired(domain, virq);
+	else
+		irq_domain_free_irqs(virq, 1);
+}
+
 /**
  * irq_domain_alloc_irqs_parent - Allocate interrupts from parent domain
  * @domain:	Domain below which interrupts must be allocated
@@ -1907,9 +1921,9 @@ static int irq_domain_alloc_irqs_locked(struct irq_domain *domain, int irq_base,
 	return -EINVAL;
 }
 
-static void irq_domain_check_hierarchy(struct irq_domain *domain)
-{
-}
+static void irq_domain_check_hierarchy(struct irq_domain *domain) { }
+static void irq_domain_free_one_irq(struct irq_domain *domain, unsigned int virq) { }
+
 #endif	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
 
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

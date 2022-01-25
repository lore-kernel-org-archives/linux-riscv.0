Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79703C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 05:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXZYrAtp+Qu8HtMx/XVoergSAV4mGRn0pdzsu05sESM=; b=VnzIfR+k0B4tPN
	J0fhwjdu9vrigBLe7cfnHjizH0azALYfouFX6FB8U3wKcRF2dC3i5xDXQ4x15a9e+S3m+vKRy8zBW
	rLkDVRamrWoul7yR0rI0e6dEpNtFUB4ftMuDpjX2d5dXIAB8U7T8iS64+GBfwSyNTuekP/kWSjQWF
	02G3VvIIVkW7fjNOudTQjwmeNkYv1BYJBbV4LTh3EoKCcRHSKjB3ULNKbLddCJfzVNzryFalRdrdV
	ddQT/ZH3qKqrzTSeTBIRJjX7+DfgGBhLPStqbqzkojH4dtKEBzmPoHrT+HewIUP9UTnJ5HeQ7ByCt
	NdUnr0tlNBDjsGZ52VzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCEce-006VnB-3Q; Tue, 25 Jan 2022 05:44:04 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCEcb-006Vlb-QW
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 05:44:03 +0000
Received: by mail-pf1-x435.google.com with SMTP id w190so12293229pfw.7
 for <linux-riscv@lists.infradead.org>; Mon, 24 Jan 2022 21:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uQS+XB01rQTghLAjvmUkl8tFaMQ6CMQ1+K0sDDXtaTI=;
 b=Ky+UZvUt3KlfSaUIzSkiXKL3tJePDBQAjdWQLddrc4hgN63O6uogDkolOLjlF53Bn9
 VPvfMSi8100wkYCP4WISvBQWXzxIbuWfrf3xkQJKAhv61BAtY3LWN/vf0IVXJ+jWw7Dj
 9+zkGdkWRVcNGi0rpqI1bCaF/pgO4jgj6ra97b5428qJbBbGqQ2DDXxYOO5/BLmkvT/9
 sf/CbFSOr8QDetg0xTCqFexST5SlPPuoYNXzDNyQKvhmL69uxuV421bz1yaA80lFUJ/W
 zHaq1YQ9ZeFle2HzKjPS0p25cZlX3DbZ3K9E6gVC8zVIJJDm2ffuf5CXF3U7wIxB6fb0
 M6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uQS+XB01rQTghLAjvmUkl8tFaMQ6CMQ1+K0sDDXtaTI=;
 b=l6+Y9/6+rdAqpV+mSz+a+RlJKvD4FkTuQEuGIqP0nUFiKNw5r1eJJbFFlwZ94NQOvW
 sVyEnIVH+dARf+DRCKvPUflrt5+WDWCZTfHvU/R16IluFXrDDzzDiRn3izEr31JuAI2Y
 9zpp8WSaVKTHCWkXjIbqZuY1Ro3iBDEM34YIrw86XGAD7Km8y1MBL3eumCRhUvmkTikb
 vQ5Lrb+Q+ZGGspvskRzlOdPKIljCrQ7CWKrGOiw9CvNxu4nPS4BylXgADoyzCiSRFwyw
 lcZK6dnEliaGJX8Z7fPBmF9IuYQc4ejp9DAfiJsyIQpEYRflivLuOmky+NLhH60HgFLW
 Xjqw==
X-Gm-Message-State: AOAM531e1Hb4XKmcSOG1HrIyV+M9U15VdMYxFGyh3adNrpMux6LDuR56
 c3BwI5Puxq/ZGYud9YJFrNRE5A==
X-Google-Smtp-Source: ABdhPJzMWcWR6nzR3mwo77XGWNf8PMri0gVk1yT1811+iC80BfVQO9Nmz+o+PxMVKmPrJqIXqV43JQ==
X-Received: by 2002:a05:6a00:179c:b0:4c9:ef72:87eb with SMTP id
 s28-20020a056a00179c00b004c9ef7287ebmr5121764pfg.47.1643089440765; 
 Mon, 24 Jan 2022 21:44:00 -0800 (PST)
Received: from localhost.localdomain ([122.179.14.218])
 by smtp.gmail.com with ESMTPSA id c6sm19524508pfl.200.2022.01.24.21.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 21:44:00 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/6] irqchip/riscv-intc: Set intc domain as the default host
Date: Tue, 25 Jan 2022 11:12:13 +0530
Message-Id: <20220125054217.383482-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125054217.383482-1-apatel@ventanamicro.com>
References: <20220125054217.383482-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_214401_885392_3D686994 
X-CRM114-Status: GOOD (  13.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We have quite a few RISC-V drivers (such as RISC-V SBI IPI driver,
RISC-V timer driver, RISC-V PMU driver, etc) which do not have a
dedicated DT/ACPI fwnode. This patch makes intc domain as the default
host so that these drivers can directly create local interrupt mapping
using standardized local interrupt numbers

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 17 +----------------
 drivers/irqchip/irq-riscv-intc.c  |  9 +++++++++
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 1767f8bf2013..dd6916ae6365 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -102,8 +102,6 @@ static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
 static int __init riscv_timer_init_dt(struct device_node *n)
 {
 	int cpuid, hartid, error;
-	struct device_node *child;
-	struct irq_domain *domain;
 
 	hartid = riscv_of_processor_hartid(n);
 	if (hartid < 0) {
@@ -121,20 +119,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (cpuid != smp_processor_id())
 		return 0;
 
-	domain = NULL;
-	child = of_get_compatible_child(n, "riscv,cpu-intc");
-	if (!child) {
-		pr_err("Failed to find INTC node [%pOF]\n", n);
-		return -ENODEV;
-	}
-	domain = irq_find_host(child);
-	of_node_put(child);
-	if (!domain) {
-		pr_err("Failed to find IRQ domain for node [%pOF]\n", n);
-		return -ENODEV;
-	}
-
-	riscv_clock_event_irq = irq_create_mapping(domain, RV_IRQ_TIMER);
+	riscv_clock_event_irq = irq_create_mapping(NULL, RV_IRQ_TIMER);
 	if (!riscv_clock_event_irq) {
 		pr_err("Failed to map timer interrupt for node [%pOF]\n", n);
 		return -ENODEV;
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index b65bd8878d4f..9f0a7a8a5c4d 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -125,6 +125,15 @@ static int __init riscv_intc_init(struct device_node *node,
 		return rc;
 	}
 
+	/*
+	 * Make INTC as the default domain which will allow drivers
+	 * not having dedicated DT/ACPI fwnode (such as RISC-V SBI IPI
+	 * driver, RISC-V timer driver, RISC-V PMU driver, etc) can
+	 * directly create local interrupt mapping using standardized
+	 * local interrupt numbers.
+	 */
+	irq_set_default_host(intc_domain);
+
 	cpuhp_setup_state(CPUHP_AP_IRQ_RISCV_STARTING,
 			  "irqchip/riscv/intc:starting",
 			  riscv_intc_cpu_starting,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

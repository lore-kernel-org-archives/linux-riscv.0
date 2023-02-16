Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03F4C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3aCDt2HaXmkV2Ux2n8MMM5aSH/zSLOA0KKPH9JQbafE=; b=LOLgXF+alcgpSP
	cQLeL+NMya/XbI/yZLvctwELMA00OqGkI5SnJFkorNMQWFHR+hZ4iFA9s2z7WlTN5lOk3sdAYaTSy
	6jr03ETZGPjQvObx5wj2WVJO+rwsXzMu2VOtz4YVkBTHk922SAElx2r29vradf7IHLDq9IiMKQi75
	f7bFEPmGTcv0GQ5cPljFQWGQilDPIhTONldP2BiCEG3SHMwP4oGeVlIUTWG+2zhrnbI6fCZzsB5bm
	RE2lNLXF3nlu0mF3Vwb1feWqGfrJyEE/8nTZc98hd3cckam1XRdIFR4Dl44RTGLgkwx+nJPeVzV0z
	Zd8DUMGIl/MeDncujHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitW-00BUAv-AF; Thu, 16 Feb 2023 18:22:10 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitT-00BU6y-Nu
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:22:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id i15so137803plr.8
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4phaq6quaw8OEd5i/LKAI0eg66LQgH0oflAjuJIR3hM=;
        b=assdfSn79vHm0/djewQo2bAQqyjoTdSiGlBucWz/vkwhlh0gcU4AzKvvNGpbvajSzo
         pyLddLDI91C5MOJAqpvr+uIMgruD0aMCS5ZkzhicFmN14+x8C7nDK2QPkEwxAZY0cHrN
         njQ2zJIhkyPA0oCk8owapfaEaiAVm/jFqJqZHUtqhNpdOsJj6oyEzlmxzG7BmxRHGnTl
         010zIM+wIuONTlBkSYFy/AXiy57JLHaoy1nGIKW/GgvturAOhwh37d7TDfwp1XJZOcol
         NymKVNVqiyDZoXLOoFLIZsBv8PZxexq/CRxJGVCU0XPdAsT0x8D1+iC3ghJYaXGI5Q0c
         l0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4phaq6quaw8OEd5i/LKAI0eg66LQgH0oflAjuJIR3hM=;
        b=FF3PuyaDWwgkQoHSE3GrAXNKwwQ3iawcFe2DjyKjNAETy3ElhI17618BUsU5H4tKWp
         PoFGAHdOQaaNCCVLZgqApcatbdEWism/aUTzCPo3pZfDwhFmBinYSEdP+xeKD6cEd8R4
         Q7mTQyK9ki+P48yobKDXFl8MKapbsILV3Cq53XdibqW/uZDHXZ1qIpn2nWXkUe2ZeZNc
         kPm3g++iJZNBrZo/7+VptZwfSVJOp1PQcfpQySOXiOhW8k9alsRc0P4Rkr+6Mj2X6Mw0
         VgbCp6AlG4D98D0HV7oO+91SlQ1NeVtGhkgSJgLXbkLA5/n7ppyeWf7T2r36rGFPx4Tt
         3yPA==
X-Gm-Message-State: AO0yUKXBatfLNC8mDp4ljTbebcNyEUZsoYKe2ZEmi2cYVCALgjj4z1FX
	55f95aV+G5JPj8srlwEtiRG41w==
X-Google-Smtp-Source: AK7set8C1pCi1Yn5xatlevccbWobHFbDGG2iAF9QZ/ZGlbvVWblYYzDHJ0Lrj8g7Jn58dLz+YVQtEQ==
X-Received: by 2002:a05:6a20:7350:b0:bc:80bd:462d with SMTP id v16-20020a056a20735000b000bc80bd462dmr8512373pzc.46.1676571724598;
        Thu, 16 Feb 2023 10:22:04 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:22:04 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 15/21] clocksource/timer-riscv: Refactor riscv_timer_init_dt()
Date: Thu, 16 Feb 2023 23:50:37 +0530
Message-Id: <20230216182043.1946553-16-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102207_803132_2149A3E7 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Refactor the timer init function such that few things can be
shared by both DT and ACPI based platforms.

Co-developed-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/clocksource/timer-riscv.c | 82 +++++++++++++++----------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 1b4b36df5484..2ae8e300d303 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -119,61 +119,28 @@ static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int __init riscv_timer_init_dt(struct device_node *n)
+static int __init riscv_timer_init_common(void)
 {
-	int cpuid, error;
-	unsigned long hartid;
-	struct device_node *child;
-	struct irq_domain *domain;
+	int error;
+	struct irq_domain *domain = NULL;
+	struct fwnode_handle *intc_fwnode = riscv_get_intc_hwnode();
 
-	error = riscv_of_processor_hartid(n, &hartid);
-	if (error < 0) {
-		pr_warn("Not valid hartid for node [%pOF] error = [%lu]\n",
-			n, hartid);
-		return error;
-	}
-
-	cpuid = riscv_hartid_to_cpuid(hartid);
-	if (cpuid < 0) {
-		pr_warn("Invalid cpuid for hartid [%lu]\n", hartid);
-		return cpuid;
-	}
-
-	if (cpuid != smp_processor_id())
-		return 0;
-
-	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
-	if (child) {
-		riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
-					"riscv,timer-cannot-wake-cpu");
-		of_node_put(child);
-	}
-
-	domain = NULL;
-	child = of_get_compatible_child(n, "riscv,cpu-intc");
-	if (!child) {
-		pr_err("Failed to find INTC node [%pOF]\n", n);
-		return -ENODEV;
-	}
-	domain = irq_find_host(child);
-	of_node_put(child);
+	domain = irq_find_matching_fwnode(intc_fwnode, DOMAIN_BUS_ANY);
 	if (!domain) {
-		pr_err("Failed to find IRQ domain for node [%pOF]\n", n);
+		pr_err("Failed to find irq_domain for INTC node [%pfwP]\n",
+		       intc_fwnode);
 		return -ENODEV;
 	}
 
 	riscv_clock_event_irq = irq_create_mapping(domain, RV_IRQ_TIMER);
 	if (!riscv_clock_event_irq) {
-		pr_err("Failed to map timer interrupt for node [%pOF]\n", n);
+		pr_err("Failed to map timer interrupt for node [%pfwP]\n", intc_fwnode);
 		return -ENODEV;
 	}
 
-	pr_info("%s: Registering clocksource cpuid [%d] hartid [%lu]\n",
-	       __func__, cpuid, hartid);
 	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
 	if (error) {
-		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
-		       error, cpuid);
+		pr_err("RISCV timer registration failed [%d]\n", error);
 		return error;
 	}
 
@@ -202,4 +169,35 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	return error;
 }
 
+static int __init riscv_timer_init_dt(struct device_node *n)
+{
+	int cpuid, error;
+	unsigned long hartid;
+	struct device_node *child;
+
+	error = riscv_of_processor_hartid(n, &hartid);
+	if (error < 0) {
+		pr_warn("Invalid hartid for node [%pOF] error = [%lu]\n",
+			n, hartid);
+		return error;
+	}
+
+	cpuid = riscv_hartid_to_cpuid(hartid);
+	if (cpuid < 0) {
+		pr_warn("Invalid cpuid for hartid [%lu]\n", hartid);
+		return cpuid;
+	}
+
+	if (cpuid != smp_processor_id())
+		return 0;
+
+	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
+	if (child) {
+		riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
+					"riscv,timer-cannot-wake-cpu");
+		of_node_put(child);
+	}
+	return riscv_timer_init_common();
+}
+
 TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

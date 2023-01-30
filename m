Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A2DC54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NSASO8024TN/nI5XxqLxqUmgbz5XKVFi0oUreBOoM0=; b=lH4zbKlTkhu+Ty
	yfJe/NjkbYK+7lJhDUwefTDFTazdtMfoMQQu313qruaKqJQ/lc/MsRoHWNs6nvar1wrgjQKCbqxvC
	sF0EaNJSiE2Dq17qUufPByXqQN4CgBg+/hG0IyAonbJmzwKnYt0afOYVIxsbgVTMBFtPcOe++AaLv
	RiQXXRe3AydVEwu10SJRMuZLYZgGs5+Sklgv/Cwj1V2ZdSZG5BJmuC9hw7zWr8lkUMoi4RTnnEl5Z
	qmzvzthB+HXiRReJ8J3ODY9KFQdRmrI/xw6Xi+UdXWB4Ex62qOZeEXQOeHygahGDh2Z0+O138385+
	/w0V2cbnyKEtfTzB8DOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYrP-004yoM-Im; Mon, 30 Jan 2023 18:26:31 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYoh-004xEf-AF
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:23:44 +0000
Received: by mail-pl1-x629.google.com with SMTP id r8so5687476pls.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjjcPypQMXaOislrOYJ95mTwSGDcKCLLP/xnE1MVdDc=;
        b=AGORcmtB0RKxmmBwtZG1zMcjO7O0Ex0YmoIi7gY/J9VsriQPAifWmKEzTA9QHLjQtJ
         uuY/Btcl6/C0NO3gPY7h6UdBWNs8xGinuds7pHrAcoLcqXWDqlcY/35Gb0Y34sXr/nH6
         AUDb81pJKh5riqyRf79BFqrqOf6Z8PxMDrk2OLRBoHbCCbVeMEonFkkzJgF3iNzYIPOx
         Kj3k6OurbJzyh0ha8eQh4zGGgFbVghVnpZcUk4cq084rkO4qGd+AYNDGlrb+SAz2M45c
         nh29uBLGpX1HMNZiQGlV9kpnDEmCj8YVP8Y0+cRcs20155Dcavg9lOAIfEEKcMjuiMgJ
         jsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjjcPypQMXaOislrOYJ95mTwSGDcKCLLP/xnE1MVdDc=;
        b=3VqZ/DkEtUfTQIEhisR7feqUrm6cfycDPM4RMUb43KI6QvdUSB8pYx+mCHdNnI3abg
         B5wRyXIzs4EGRZiRX0S6crz629IwGQGcqHDkzFt3zjzEzJeyLuxdwTKRX5EgAqUc54wR
         dwzqbw1UpRLNNq/uECIU+jZT19OZ5h2bShioKc91G5/VmNT2zShKyaBS8QrbUfn/TmiA
         7ZvVJbED0aW3oYZBvws1cVBGDsnmJC4t8aIRdf0J5UmizpCWnCzp3GxK+EvJEavFsEQp
         lYSGnfd88G2ZAe9R1RBefLumKjo41/gIEb2Fhlhk4SG5y42mZtS23+X/tXD8jwzOhNTq
         lKWg==
X-Gm-Message-State: AO0yUKXO912qLAxDlux17GmyzLlsisxmAOxlRjNtIDJan07XWCd5VLMg
	G1sXP/s/1RAGWZhgw7D+SKEsag==
X-Google-Smtp-Source: AK7set/ApwUqtEFlaGh+sQPBVQI6DfYliPE4sHjMsW+qEax8tpPZ22KBh+GDARvBbGe81QGEdL8hng==
X-Received: by 2002:a05:6a20:3948:b0:be:25af:be2c with SMTP id r8-20020a056a20394800b000be25afbe2cmr3819489pzg.41.1675103022512;
        Mon, 30 Jan 2023 10:23:42 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:42 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 15/24] clocksource/timer-riscv: Refactor riscv_timer_init_dt()
Date: Mon, 30 Jan 2023 23:52:16 +0530
Message-Id: <20230130182225.2471414-16-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102343_385607_B92E2BF1 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Refactor the timer init function such that few things can be shared by
both DT and ACPI based platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 79 +++++++++++++++----------------
 1 file changed, 37 insertions(+), 42 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 1b4b36df5484..4016c065a01c 100644
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
-
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
+	int error;
+	struct fwnode_handle *intc_fwnode = riscv_get_intc_hwnode();
+	struct irq_domain *domain = NULL;
 
-	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
-	if (child) {
-		riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
-					"riscv,timer-cannot-wake-cpu");
-		of_node_put(child);
-	}
 
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
+		pr_err("Failed to find INTC node [%pfwP]\n", intc_fwnode);
 		return -ENODEV;
 	}
 
 	riscv_clock_event_irq = irq_create_mapping(domain, RV_IRQ_TIMER);
 	if (!riscv_clock_event_irq) {
-		pr_err("Failed to map timer interrupt for node [%pOF]\n", n);
-		return -ENODEV;
+		pr_err("Failed to map timer interrupt for node [%pfwP]\n",
+			intc_fwnode);
 	}
 
-	pr_info("%s: Registering clocksource cpuid [%d] hartid [%lu]\n",
-	       __func__, cpuid, hartid);
 	error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
 	if (error) {
-		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
-		       error, cpuid);
+		pr_err("clocksource register failed [%d]\n", error);
 		return error;
 	}
 
@@ -199,7 +166,35 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 		static_branch_enable(&riscv_sstc_available);
 	}
 
+	pr_info("timer registered using %s\n",
+		(static_branch_likely(&riscv_sstc_available)) ?
+		"RISC-V Sstc" : "RISC-V SBI");
+
 	return error;
 }
 
+static int __init riscv_timer_init_dt(struct device_node *n)
+{
+	int cpuid, error;
+	unsigned long hartid;
+
+	error = riscv_of_processor_hartid(n, &hartid);
+	if (error < 0) {
+		pr_warn("Not valid hartid for node [%pOF] error = [%lu]\n",
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
+	return riscv_timer_init_common();
+}
+
 TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

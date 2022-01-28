Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CE1C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 05:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VY3aQFpRj71d/fZaTo0RMf/tpIJF43egMSttSWthBBM=; b=rS9PDrruJL+FK8
	TTf1SWPBgqXwyAF7D4QgnglZ+zjbiml7OACKCbkV5S74KplpZhrETHQfF1j3tKtgxc5DQS7kCSbSO
	fr/phvcQLXbNVqVw/Jw+c/cV3LJ/FkC2gczV6F1cgwJnznc+WU96x6cW7KDvkOcRC1e3f0qkKeVMC
	uYmTWHXmB/ouQJzxc/Jd/xNn1dK10AXnE5tn6RKENsh6p5F4Cs8yCi8NyG4bz2/ZjGfAm4GdeY3MK
	qmtiWr31S6e9d36WVXutPSV9MpGeGyEtYSmHHgjsRi58+8ioVAIDzgL9/DJ5sh9npLlbYWHF7p1f8
	NzYXoyi2u7Nn/MVlUjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDJlw-000RcD-FP; Fri, 28 Jan 2022 05:26:08 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDJlu-000Rai-56
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 05:26:07 +0000
Received: by mail-pf1-x42f.google.com with SMTP id i17so5107359pfq.13
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 21:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j9bhhMlYZfbNKyzoCv/ayDBRnHkown2JzdDW4g4LQ2k=;
 b=PG14Twr1T36PDZ9Lp91jMcSwErNrhnRQyZ/T2zgfWnqsHCF2A+7srpKNe8DC4VKX+c
 rfvzP6l13YHKFyIwbxV4XRJjzMneciOvNs7NRunxMV46hlOod7v3o4EhXs4FhIs97Ls3
 t+rAMCY0UTy0zvsBBxeiubiw+Hh1EuI6/meAxSWOlnMQDVqsQiDc2Wk46WNtyefWKlJY
 SqIX6cQiLhT0GlXOwJmeFAC0k4hPn9kJFJL5vLw1STMH6PDhGczvkhGkow3hkKhRDmSS
 2lbfdBNlO+cLqlycnC8tGNbVh1JO4jf+ut1yEfnJZmKiQtDWwd9QuUk4hq3sfNTstjMz
 l4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j9bhhMlYZfbNKyzoCv/ayDBRnHkown2JzdDW4g4LQ2k=;
 b=vfyezBrr8xkbzLGAcJ4PeDLw1jFln/gAA7JEw/t6LJHC15MAFdhmm4HG84OOHfJNLl
 gPy77DJsjd+BERqI0QUIqjDqnmbYqp8LuTva89PTynhZDg5W9wVvGh5mtIUssNnbGR0h
 hR0Xw73h/S3hNarLrErDyL5X2Z8nUf89zqgke5OSHc9tQZjg35YwbOWAhbENWbn5ZZDE
 erb/zdV+7Z34jXfWb4eyD59GC+9g+Iw24L2Ele5fiITLly5T+QghZibkrfxcIOKHwdK3
 bOO+4iVn7G6JcFhyRQ4qB9aPEx38689QcyBsjj/MC7lwUiK8QIv1tRNSDyei1hEBPamz
 g4ww==
X-Gm-Message-State: AOAM5302g6q8IOGCNh/nYSs7L924s23f9hxnyEFpsDjilFQ+TXIjHdXT
 ErxLt5RlSlK4QoGyewAF8JBlfQ==
X-Google-Smtp-Source: ABdhPJzSXzSKFtRYCAOJYuoq5WcCiRU4FQ1JUlCuvTPHoOBx/wjdxNoDkJlY68x15om+KPBFRH618Q==
X-Received: by 2002:a63:d54:: with SMTP id 20mr5469993pgn.442.1643347565401;
 Thu, 27 Jan 2022 21:26:05 -0800 (PST)
Received: from localhost.localdomain ([122.171.184.231])
 by smtp.gmail.com with ESMTPSA id b20sm7731744pfv.134.2022.01.27.21.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 21:26:04 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 4/6] RISC-V: Allow marking IPIs as suitable for remote
 FENCEs
Date: Fri, 28 Jan 2022 10:55:03 +0530
Message-Id: <20220128052505.859518-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128052505.859518-1-apatel@ventanamicro.com>
References: <20220128052505.859518-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_212606_234820_471812C7 
X-CRM114-Status: GOOD (  18.07  )
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

To do remote FENCEs (i.e. remote TLB flushes) using IPI calls on
the RISC-V kernel, we need hardware mechanism to directly inject
IPI from the RISC-V kernel instead of using SBI calls.

The upcoming ACLINT [M|S]SWI devices and AIA IMSIC devices allow
direct IPI injection from the RISC-V kernel. To support this, we
extend the riscv_ipi_set_virq_range() function so that irqchip
drivers can mark IPIs as suitable for remote FENCEs.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/ipi-mux.h  |  2 ++
 arch/riscv/include/asm/smp.h      | 18 ++++++++++++++++--
 arch/riscv/kernel/ipi-mux.c       |  3 ++-
 arch/riscv/kernel/sbi.c           |  3 ++-
 arch/riscv/kernel/smp.c           | 11 ++++++++++-
 drivers/clocksource/timer-clint.c |  2 +-
 6 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/ipi-mux.h b/arch/riscv/include/asm/ipi-mux.h
index 988e2bba372a..3a5acbf51806 100644
--- a/arch/riscv/include/asm/ipi-mux.h
+++ b/arch/riscv/include/asm/ipi-mux.h
@@ -15,6 +15,7 @@ void riscv_ipi_mux_handle_irq(void);
 
 /* Create irq_domain for muxed IPIs */
 struct irq_domain *riscv_ipi_mux_create(bool use_soft_irq,
+			bool use_for_rfence,
 			void (*clear_ipi)(void),
 			void (*send_ipi)(const struct cpumask *mask));
 
@@ -28,6 +29,7 @@ static inline void riscv_ipi_mux_handle_irq(void)
 }
 
 static inline struct irq_domain *riscv_ipi_mux_create(bool use_soft_irq,
+			bool use_for_rfence,
 			void (*clear_ipi)(void),
 			void (*send_ipi)(const struct cpumask *mask))
 {
diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 178fe4ada592..ddd3be1c77b6 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -16,6 +16,9 @@ struct seq_file;
 extern unsigned long boot_cpu_hartid;
 
 #ifdef CONFIG_SMP
+
+#include <linux/jump_label.h>
+
 /*
  * Mapping between linux logical cpu index and hartid.
  */
@@ -46,7 +49,12 @@ void riscv_ipi_disable(void);
 bool riscv_ipi_have_virq_range(void);
 
 /* Set the IPI interrupt numbers for arch (called by irqchip drivers) */
-void riscv_ipi_set_virq_range(int virq, int nr_irqs);
+void riscv_ipi_set_virq_range(int virq, int nr_irqs, bool use_for_rfence);
+
+/* Check if we can use IPIs for remote FENCEs */
+DECLARE_STATIC_KEY_FALSE(riscv_ipi_for_rfence);
+#define riscv_use_ipi_for_rfence() \
+	static_branch_unlikely(&riscv_ipi_for_rfence)
 
 /* Secondary hart entry */
 asmlinkage void smp_callin(void);
@@ -93,10 +101,16 @@ static inline bool riscv_ipi_have_virq_range(void)
 	return false;
 }
 
-static inline void riscv_ipi_set_virq_range(int virq, int nr)
+static inline void riscv_ipi_set_virq_range(int virq, int nr,
+					    bool use_for_rfence)
 {
 }
 
+static inline bool riscv_use_ipi_for_rfence(void)
+{
+	return false;
+}
+
 #endif /* CONFIG_SMP */
 
 #if defined(CONFIG_HOTPLUG_CPU) && (CONFIG_SMP)
diff --git a/arch/riscv/kernel/ipi-mux.c b/arch/riscv/kernel/ipi-mux.c
index 93835355dccf..501b20aed179 100644
--- a/arch/riscv/kernel/ipi-mux.c
+++ b/arch/riscv/kernel/ipi-mux.c
@@ -144,6 +144,7 @@ static int ipi_mux_starting_cpu(unsigned int cpu)
 }
 
 struct irq_domain *riscv_ipi_mux_create(bool use_soft_irq,
+			bool use_for_rfence,
 			void (*clear_ipi)(void),
 			void (*send_ipi)(const struct cpumask *mask))
 {
@@ -198,7 +199,7 @@ struct irq_domain *riscv_ipi_mux_create(bool use_soft_irq,
 			  "irqchip/riscv/ipi-mux:starting",
 			  ipi_mux_starting_cpu, ipi_mux_dying_cpu);
 
-	riscv_ipi_set_virq_range(virq, BITS_PER_LONG);
+	riscv_ipi_set_virq_range(virq, BITS_PER_LONG, use_for_rfence);
 
 	return ipi_mux_priv.domain;
 
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index fa3d92fce9f8..210d23524771 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -630,7 +630,8 @@ static void sbi_ipi_clear(void)
 
 void __init sbi_ipi_init(void)
 {
-	if (riscv_ipi_mux_create(true, sbi_ipi_clear, sbi_send_cpumask_ipi))
+	if (riscv_ipi_mux_create(true, false,
+				 sbi_ipi_clear, sbi_send_cpumask_ipi))
 		pr_info("providing IPIs using SBI IPI extension\n");
 }
 
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index a9f1aca38358..b98d9c319f6f 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -149,7 +149,10 @@ bool riscv_ipi_have_virq_range(void)
 	return (ipi_virq_base) ? true : false;
 }
 
-void riscv_ipi_set_virq_range(int virq, int nr)
+DEFINE_STATIC_KEY_FALSE(riscv_ipi_for_rfence);
+EXPORT_SYMBOL_GPL(riscv_ipi_for_rfence);
+
+void riscv_ipi_set_virq_range(int virq, int nr, bool use_for_rfence)
 {
 	int i, err;
 
@@ -172,6 +175,12 @@ void riscv_ipi_set_virq_range(int virq, int nr)
 
 	/* Enabled IPIs for boot CPU immediately */
 	riscv_ipi_enable();
+
+	/* Update RFENCE static key */
+	if (use_for_rfence)
+		static_branch_enable(&riscv_ipi_for_rfence);
+	else
+		static_branch_disable(&riscv_ipi_for_rfence);
 }
 EXPORT_SYMBOL_GPL(riscv_ipi_set_virq_range);
 
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index d20c093c5564..bc9be091a732 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -225,7 +225,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 		goto fail_free_irq;
 	}
 
-	riscv_ipi_mux_create(true, clint_clear_ipi, clint_send_ipi);
+	riscv_ipi_mux_create(true, true, clint_clear_ipi, clint_send_ipi);
 	clint_clear_ipi();
 
 	return 0;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

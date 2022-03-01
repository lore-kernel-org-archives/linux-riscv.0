Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95C4C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Mar 2022 04:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbZjmyfy+F7DIqXWRxy/v5lh/XIt8EZA0rNEZCrs8+E=; b=pumC34lNuqlE02
	GqWqkG9iNrl/ZdrRvM3U9jU9NAnZBCDzZIZcutO2X6dfdhMOsKCwLNzeuR4e7XFdn53jgVFjptDHN
	rE0KeUZGGq9WRd5r1o0inmnpwtlS7SeKKmaIf1EuWdubXvil6ifyiCscPOSJ2REBhgdaGzwgEgXIK
	lGS3vkqHxh8CayywwC9/uiIDw3rOHydOwQPwBaZx/qrHalEy5KYNy1ZR7B3VL9q62qjQc9G41mF0O
	fEDRpxYToSFjyItVhrTIcbsV+nTeSDwEFP2+n+3fr0ho8+JiAURSEsaPmv4tbxDUnHdMtmgiCt5zy
	O2j+fj058CxfKi14u7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOu84-00EtHR-0t; Tue, 01 Mar 2022 04:28:52 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOu7m-00Et77-3y
 for linux-riscv@lists.infradead.org; Tue, 01 Mar 2022 04:28:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id v21so18461862wrv.5
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 20:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1dvQpmktLMIBE5zILdeneM+K/jB6oDBX0KNz7QqesMQ=;
 b=UWot9+IKQnkBxOtBKqZCFbkzbWwkiSYSfH29Vs+HVQmBV1nMtXjntkuPvnTiu8eSHh
 MOIIomRS+JqYe4IABr2l85Ba6VB0HNhcMraLbyGKhSieqJnEPIS/U4sfEl8qcl0ulKSr
 neIYpYd2OLJBT4hb8tDmj2iQfHJHEpzniPxQOuXjEybdumghKw4Kd4rQ0SABJuwUbGY/
 FH7lATW7s2OIt6+WaP+DVHKz7GMEpfC0mNu8Iqi5CO+rxu8gNWNXtx24317USXhFpbRl
 QU3B78v1AwaLevpkKehqtsiYWv59HQWSZY2G2sj0mngemRM00d1XdIr98WAsKSinhdlg
 SnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1dvQpmktLMIBE5zILdeneM+K/jB6oDBX0KNz7QqesMQ=;
 b=8Lxew0bwzfJGzxaLqtrqFN4qOd3a/c6bwsGdC6hp1gpf3/I++zXtmDlf9u0X3H7g2n
 oRjXKTnzVaxrTYwYBeBlRkhWYHjrTA2uDgJKxIyE3M21QSpfT3eqv3UJnYadhdmpjWX7
 q8ZGk+Rkk0IhobPtr08pvAxtwZCj71ZxVJj/AgoUpEsRwnlrxeafE2nD2dRd0egr8Kwe
 EQj1D5wCcgvmUDeN4wh6HhtSdGQgI63LNmsGs5fRSMbzGaAnvBHYJ7KzcdTwtjtrVOWS
 rtAu+9wY8landD7EwL2E30v7hl+U1JhuAy8XdaMai5SgZTtIqxnlacJtH4LecZ1q7zCw
 Ra2w==
X-Gm-Message-State: AOAM533Pdfjj6aUFjmxFNnXK2vCJTmEsEwsv/TmM2XbWunQwh45xJB9E
 Xy5O6U66bEsrXUnGRmGjufQ/Sg==
X-Google-Smtp-Source: ABdhPJyPsI1+Nu7GMUXFm/RS4F+v/3R0bi19Km9ReWOA5RisVE1tZPvaeeJkRQA8w9mZHqSeRvMpHQ==
X-Received: by 2002:adf:cd0a:0:b0:1ed:e0b3:428 with SMTP id
 w10-20020adfcd0a000000b001ede0b30428mr17792226wrm.357.1646108912581; 
 Mon, 28 Feb 2022 20:28:32 -0800 (PST)
Received: from localhost.localdomain ([122.179.35.69])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm1209107wmz.43.2022.02.28.20.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 20:28:32 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 4/6] RISC-V: Allow marking IPIs as suitable for remote
 FENCEs
Date: Tue,  1 Mar 2022 09:57:20 +0530
Message-Id: <20220301042722.401113-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301042722.401113-1-apatel@ventanamicro.com>
References: <20220301042722.401113-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_202834_218941_989FBA6E 
X-CRM114-Status: GOOD (  18.06  )
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

To do remote FENCEs (i.e. remote TLB flushes) using IPI calls on the
RISC-V kernel, we need hardware mechanism to directly inject IPI from
the supervisor mode (i.e. RISC-V kernel) instead of using SBI calls.

The upcoming AIA IMSIC devices allow direct IPI injection from the
supervisor mode (i.e. RISC-V kernel). To support this, we extend the
riscv_ipi_set_virq_range() function so that IPI provider (i.e. irqchip
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
index 3a0405f0e0de..544074ea3ead 100644
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
index ab38814f1977..909fb36a0910 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -652,7 +652,8 @@ static void sbi_ipi_clear(void)
 
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
index b05a9e946633..607d47dab896 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -224,7 +224,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
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

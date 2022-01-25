Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9472FC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 05:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gK+OcGgajGq4l/4yUtk4PFb/Az8v26q/JHD5CvQ5YPY=; b=uEPFUn5G3y+QbZ
	xgEnAicNN0kALW/mpUEqdPs/TWjWVruuMTfJM/3GFkFqLJGU2k+yXICOUIhLV2xuKZWkSnCzJKX4E
	6G1u5vIx0W1nwCU/VWI1511hMYeAXPL1bMw4PtR2PmwMY+4rcyJj+npxtNyaHjzdXHuu21Bj20yEf
	AILamodD1xfp1nFiVYMEZFvmQEjcR8eR03ECE1FOJTVAv3LP103DG2rIarmPe8Xmu0bfnziqWQayv
	N9OkBa2eV+NV8ppwlKUZdF9kZQzLK7zIjI5F9hcprBuNzdTKaLtYean8wZWbINUMIEhAvPSjdvSNL
	ym67QR95DA5/DclHrRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCEco-006VtQ-Vk; Tue, 25 Jan 2022 05:44:15 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCEcl-006VqG-TV
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 05:44:13 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 d12-20020a17090a628c00b001b4f47e2f51so1155353pjj.3
 for <linux-riscv@lists.infradead.org>; Mon, 24 Jan 2022 21:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x9vjMe+XXvltbCaafWpvqji8oCKXy5m+Di+E6HTISoI=;
 b=P6dPykyyfYeOrtId8fPa6HTSfidtoNke8FQXyDkPtmuEscubilP6q56UkbokB7s3+z
 75ZzzykG4a6kmQDV1lGsxbWbLH/BDGt2wdTDogY4SsNfjNixH24SzwaxaeY/qhnr5FwF
 m/V+l2jy2uusFHr+unAd2dGjbFHEPcGNqBoc3Q/5mEBvHOUG0HWG7BsvoufhTY+rpTl2
 S51vL/79raTygq1FV5oUhdm3ZHHrOj3CQJ2o28lSQvWxuShYTsEGnPiTW+ct5sQ93oQ/
 qLVMTJUN1K4RpBMDZyS66CJvo71otbj6r6e8ryh7hKEV926nPUE2aT8wjakhF+r+7M5f
 8XYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x9vjMe+XXvltbCaafWpvqji8oCKXy5m+Di+E6HTISoI=;
 b=BpRlFmH4I2DtpNT6yDBDQkGs1/5i0WQmfxLfY0+ti2symRZWPpJZx8A09i3eOJ9GuF
 QsQZ0y0XG1+MT5lxdVQKSJaFqP7SWYUbsUIlnhAj63OGY9Suze1ViVZMqKYU7nJ2bd7c
 Fb1Xkod9cYFG+q4ImjkPIvndfF+J4JUcewH6bbNKmbotURU1A2MZtnhrWv8Q4A2DjXSz
 0wbWC3hYOyewk0PYJeCGwfotFuu166eUnAVInV9GateYVkymSup1O7MRv63kHYEoPMoo
 eJEHeirWM18zx8gr5YY4jjB5PU9a0Y4pd+Q4bB2xoEy7mUmyA+3M6qGdNOu0z+ecu6ig
 oTQw==
X-Gm-Message-State: AOAM532A6SZAtT66sfJ5cJ9QvFalzMonN1vafuvrcpIADTIFlXPpU612
 ImeZuTAZpzsm/g4+5mD98QDATA==
X-Google-Smtp-Source: ABdhPJyTIzq8jxLbrRGN86xChviDm/SR56guVk2P+a/+NALhEYa4eb7WcMRL1jH6u7eojBnC5HWagQ==
X-Received: by 2002:a17:902:704c:b0:14a:fd51:3b5d with SMTP id
 h12-20020a170902704c00b0014afd513b5dmr16847412plt.172.1643089450831; 
 Mon, 24 Jan 2022 21:44:10 -0800 (PST)
Received: from localhost.localdomain ([122.179.14.218])
 by smtp.gmail.com with ESMTPSA id c6sm19524508pfl.200.2022.01.24.21.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 21:44:10 -0800 (PST)
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
Subject: [PATCH 4/6] RISC-V: Allow marking IPIs as suitable for remote FENCEs
Date: Tue, 25 Jan 2022 11:12:15 +0530
Message-Id: <20220125054217.383482-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125054217.383482-1-apatel@ventanamicro.com>
References: <20220125054217.383482-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_214412_010096_2B23A37C 
X-CRM114-Status: GOOD (  18.21  )
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
index e24bdeded489..bc9b0eb318be 100644
--- a/arch/riscv/kernel/ipi-mux.c
+++ b/arch/riscv/kernel/ipi-mux.c
@@ -145,6 +145,7 @@ static int ipi_mux_starting_cpu(unsigned int cpu)
 }
 
 struct irq_domain *riscv_ipi_mux_create(bool use_soft_irq,
+			bool use_for_rfence,
 			void (*clear_ipi)(void),
 			void (*send_ipi)(const struct cpumask *mask))
 {
@@ -192,7 +193,7 @@ struct irq_domain *riscv_ipi_mux_create(bool use_soft_irq,
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

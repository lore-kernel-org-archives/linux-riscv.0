Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434DDC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Apr 2022 10:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sw3SnaUjAcN57VgR4FM6F5T0li3Xl34Gtf4iuaMoXCI=; b=twllwNFyPyujqt
	+yRxsKmT98e0tVwNXxreXOSRbhRHRm5rgcI5ILRcE+aQanUDpD/4CBmifmrmbZMH1o6M74ycXKLcd
	+0vwMS+EyzQcol0dLUAy7eJy4twefMRWoG++wIUuDqsd2Qa6StdFvUnHQ6dtbUoM7bpbP8BvNsiAZ
	E7I+qxTBaIjGOCKEosKtXdzMN0uRiQ55ZhGsJPgobc1yIvfixpQVB/jqP2qohTXEtZuhkyQsQYYAD
	AQKsr6PGwZJFPPor7wsPSMRgrLRgueyGsKk1r/AC+7R1aGxuuCG+C5lbbhafYSHmR9a8RQQBkiCQs
	++1/SCKkyGNm4+Qx/Xkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngP1I-00GNYe-Ec; Mon, 18 Apr 2022 10:54:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngP1F-00GNUk-Ca
 for linux-riscv@lists.infradead.org; Mon, 18 Apr 2022 10:54:10 +0000
Received: by mail-pl1-x635.google.com with SMTP id d15so12030966pll.10
 for <linux-riscv@lists.infradead.org>; Mon, 18 Apr 2022 03:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9SKjNRSyRMak/9hQdUHsRIqkH3nlR2Enu7iMUizer5s=;
 b=jbSDUWADN1sgR8LEVmbW/w48kLzUGe7kDFaqwX8vtQxxhlfaFsqJ7ZitgG07vEzwJl
 KZMg38cwGmT5dOoL4kW0VZXpBoKIqbg9A269EZ5R8tvOLyDx5dIQluofOsLs5jaZyf0V
 XV0MczsP1RSn3Xj5snyjiPyCAmp3hjG83LV895wnYJm3qOJNvbArPmfRMDJNnXqbSjvB
 IoAeKj5PjSx8p7MjHIahlGAiGRAIqnIVXg0Dd/Lj3IWZneZjJAdYsEiGVw0obDSDMiD8
 cwRF8DaM9clWjHcEHhRgbM9j1WmCPzoCtVmRPBvNaHkYCMy1ste8ZKmRks9hKGYe6DUR
 8alA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9SKjNRSyRMak/9hQdUHsRIqkH3nlR2Enu7iMUizer5s=;
 b=XFvJcNMOge4TBQghOQsCeU2FOMmKWqFnbbCSOQAC/776hHNafkdVlK7WYoNL5tkbUd
 nmJ5FXP0uYr8AQiBjUsq7uUbH1i+pTbr/JDU55t7Z+KmjLyG+kwKnift0ak2rppm8qNP
 zzwBoKviAgvc1tomAdxm+YZ3YwhxL4Wq3BKS6e01R3xqLzX8w8fKZE9urjdaKumMlXZ7
 bvLUaIIz0yWcxwa6GyiJ+UUQMt+LVLI02+z28DSUWSYWkPtdhbhax0mnAlVDsLYnEWXi
 gnxK9p8tR5x6nn6YJBPMLlYHFkeIt7iDXRoi0f5CQe6/rMJQi3wQ7fNNFdu4EDDFKw2W
 SFjg==
X-Gm-Message-State: AOAM530IIz690kmINcvCiYsBDmB5b7RNZ4vo6avDk62Rn5Rk68fmN7l9
 w9q4ryIN5t8/5Mz8jU3Lw9odcg==
X-Google-Smtp-Source: ABdhPJyrJqEwjzsKZurDySfOcGZkxUYGAdWOMe01BOorRgS1V8ONDJ/MM4Wp48bZ0o9WV5aXnaIPOw==
X-Received: by 2002:a17:902:ab8b:b0:156:16c0:dc6d with SMTP id
 f11-20020a170902ab8b00b0015616c0dc6dmr10184498plr.147.1650279246557; 
 Mon, 18 Apr 2022 03:54:06 -0700 (PDT)
Received: from localhost.localdomain ([122.172.241.223])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a056a00130d00b004f1025a4361sm12986278pfu.202.2022.04.18.03.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 03:54:06 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 5/7] RISC-V: Allow marking IPIs as suitable for remote
 FENCEs
Date: Mon, 18 Apr 2022 16:23:03 +0530
Message-Id: <20220418105305.1196665-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418105305.1196665-1-apatel@ventanamicro.com>
References: <20220418105305.1196665-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_035409_457190_9339238C 
X-CRM114-Status: GOOD (  16.53  )
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
 arch/riscv/include/asm/smp.h      | 18 ++++++++++++++++--
 arch/riscv/kernel/sbi-ipi.c       |  2 +-
 arch/riscv/kernel/smp.c           | 11 ++++++++++-
 drivers/clocksource/timer-clint.c |  2 +-
 4 files changed, 28 insertions(+), 5 deletions(-)

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
diff --git a/arch/riscv/kernel/sbi-ipi.c b/arch/riscv/kernel/sbi-ipi.c
index 67f213ec2b04..ce26d62146de 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -55,6 +55,6 @@ void __init sbi_ipi_init(void)
 		return;
 	}
 
-	riscv_ipi_set_virq_range(virq, IPI_MUX_NR_IRQS);
+	riscv_ipi_set_virq_range(virq, IPI_MUX_NR_IRQS, false);
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
index 1861db1bfcbf..eb80bf79dc93 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -245,7 +245,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 		goto fail_remove_cpuhp;
 	}
 
-	riscv_ipi_set_virq_range(virq, IPI_MUX_NR_IRQS);
+	riscv_ipi_set_virq_range(virq, IPI_MUX_NR_IRQS, true);
 	clint_clear_ipi(clint_ipi_irq);
 
 	return 0;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

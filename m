Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B02ECAAD4
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 16:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6g1JE2kZ0445IuAEkKf9TH4YEDSnykfcdXJd00v9Rk=; b=OgCk0AeRgIbf/A
	fHHQFlaIs4NWyV3LdRb+qSb+Q1dnx2oEWzXOb0O4PdGueyigBMUMxS3S9yGPp6HkBFMXM/9ilT0Zk
	vSpyLKiRRXxaZ3Emx2Z6Jjbbx4Z04sbyqzbEeg5r6qUcnX0LQGsiSBcGADd12Bop5Nud1QfZjEive
	b0oBTD2Z1zSp4IDI0Vz+C9pavFSjQDtmVPWUEcKfjXoREg7bxgjkfdzrZXsyqNXfuwiFp/HgAazXS
	VCEXZvwOFFuLAKaJ6WHnKc+0o1FUmw8hq8bi+nvVzWVByQuAbtkFlMO+G09zXaTDz5BT50zGaWV1J
	VD6QhV4SPK5HplqVlTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVmJ-00DPG1-KB; Sat, 03 Sep 2022 16:13:51 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVmG-00DPDY-To
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 16:13:50 +0000
Received: by mail-pj1-x1031.google.com with SMTP id t5so4705093pjs.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 Sep 2022 09:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=h5vbiCwBIdHCkTvxpxGpkeqRUzJsyJ7Up90KQ9Iobrk=;
        b=d+xIs49i1KvI+0EukPKrG0kUElp03kibpOc6e07deTkmz5srsJ7DBxSv+e5ySuN0sF
         +AnXlYc3yjw/+gvYwM8x2CxOJ9c7kIidpmu8Fj19mRKzzW69JLNfuWY/ygAkpFMKY+xg
         0cv6eQzWqDHS1efDCzIaLORDeEhAUK6/pnGcxO02VvAfABs8XFlVcE4zIGwtckzadD8F
         xJi9K9ovv+lR+iWdOeb1G6ZVYYGRhJa9dAKn7UTYd90JEu88Gn9bWnOusAhlBHB1R3RM
         WsVUT1niYe/Fpg8/SD/LcvQvkltuOsfWALT11TwrKjBW61zgDCREzKv+C1+zB53F3/oa
         1zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=h5vbiCwBIdHCkTvxpxGpkeqRUzJsyJ7Up90KQ9Iobrk=;
        b=mso03LqXCnIevsKzQayLEOql4List+jPhBKz8cA8pECCMngrBfiA3Se2j5NNGO7lYX
         H+aYSGVf9xU3The68YqS1djOH5//Zwpn0Z2Ihtp6lx7/pX7kk40wXg/zPenRX9BoEmzG
         ixyPHmfT6bCZ5jtwJ3fnmL0duk3PVZEXMTa3+ucbF7OivNyzhfgLAQhIJ9qSp2ixcAC+
         Cx6ccnmmIocBh0wpl4JfhVkPacCSoWHEwhxSEtGrgWYxq/nUXp9BRQjK0TkwygshdVgs
         E0mL7nG/SLMfkZI2ytsBR34pU5sqHUAbgkYQ7VZSGRwiAr68J57fKEbL0efoZNl9XV9G
         sP7A==
X-Gm-Message-State: ACgBeo0C3BmVaHQniTButvpKpGcpQ8nH7fWYgDCRDyKATAMREWDopVGJ
	NFlsbMjrkK4R7LREDaIXBp5q3Q==
X-Google-Smtp-Source: AA6agR4K5oeWtpW2qoOfMn2zJ9PPQaL7Gdoy5tZW3LhCZJKxccanyU+8ybZcR2BSTYVcjftRF+m30Q==
X-Received: by 2002:a17:902:dac1:b0:172:eae4:950c with SMTP id q1-20020a170902dac100b00172eae4950cmr40252381plx.70.1662221628301;
        Sat, 03 Sep 2022 09:13:48 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.86.115])
        by smtp.gmail.com with ESMTPSA id 4-20020a620504000000b00537b1aa9191sm4166738pff.178.2022.09.03.09.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Sep 2022 09:13:47 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v9 5/7] RISC-V: Allow marking IPIs as suitable for remote FENCEs
Date: Sat,  3 Sep 2022 21:43:07 +0530
Message-Id: <20220903161309.32848-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220903161309.32848-1-apatel@ventanamicro.com>
References: <20220903161309.32848-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_091349_011565_2B8F6150 
X-CRM114-Status: GOOD (  15.88  )
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
index 79ed0b73cd4e..56976e41a21e 100644
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
-void riscv_ipi_set_virq_range(int virq, int nr);
+void riscv_ipi_set_virq_range(int virq, int nr, bool use_for_rfence);
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
index 0bb070a5dcb4..27fdc394d2f0 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -55,6 +55,6 @@ void __init sbi_ipi_init(void)
 		return;
 	}
 
-	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE, false);
 	pr_info("providing IPIs using SBI IPI extension\n");
 }
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index e8a20454d65b..74b8cb1a89ab 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -145,7 +145,10 @@ bool riscv_ipi_have_virq_range(void)
 	return (ipi_virq_base) ? true : false;
 }
 
-void riscv_ipi_set_virq_range(int virq, int nr)
+DEFINE_STATIC_KEY_FALSE(riscv_ipi_for_rfence);
+EXPORT_SYMBOL_GPL(riscv_ipi_for_rfence);
+
+void riscv_ipi_set_virq_range(int virq, int nr, bool use_for_rfence)
 {
 	int i, err;
 
@@ -168,6 +171,12 @@ void riscv_ipi_set_virq_range(int virq, int nr)
 
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
index ac7c2caaa65a..f418816fd706 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -246,7 +246,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 		goto fail_remove_cpuhp;
 	}
 
-	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE, true);
 	clint_clear_ipi(clint_ipi_irq, NULL);
 
 	return 0;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

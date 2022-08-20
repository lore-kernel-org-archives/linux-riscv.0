Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF4BC25B08
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Aug 2022 06:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPH0q+RZhKZAjy0VMujvwJqXAdNzdLGaNxvAEbHjIHU=; b=RMA6BOsWTXgz62
	UN8sbODNc5toWrFcki5ihcNXEk0LyBGz/MD58iKdYz3Q0IKCPYN3EQLah70y4/WS8RgwhsXEEfQJg
	n71XmbjUBlUlxRW3RkWGMHdwhKM7rgtERlvQoSC9J/c17mVuQ5EQ7SqAdXe75NAezLlNcVHr6bNif
	ntE+Utxk7lYoiw3nla3jsD55zremOl2Ndggh4KtHwavpVC1KcxIwIP4ka5XYq4r/eU7vWrj6yR+9j
	A87dZ0wGoNaPk54lprOKyqzRAcHftsNQJwtigF5WGE+lAPGP+cCsVQeeFwaf/pTJAixhU/q4u4Bc0
	q4OvLc9bCN8Z1yVhD7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPIP1-003uil-7s; Sat, 20 Aug 2022 06:56:15 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPIOw-003uei-41
	for linux-riscv@lists.infradead.org; Sat, 20 Aug 2022 06:56:11 +0000
Received: by mail-oi1-x22d.google.com with SMTP id o184so6944007oif.13
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 23:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=SQLEV3ZJdsSTEKNxjgfsvOWLI34f1G/vgTOHGNz1ESU=;
        b=KfEegITjib3KDK815XP3VzvFhA6icKjuLs09g/yTqCf6xaSL2mqu99L/+L8fj6PC5a
         b8tbrdfYgZckjz3uiONGIjghGAyNwqkDI55kXSSHRH2sCjT4Ke8lfBk5kiAKKXxFakG+
         xwsZuz1CdE3wMwcrrqy5S41Nm3D8VifKjYYY7svKwAwwNVfL8zAH9ZlLv8IbY4XbgQOR
         yXA9Gz3UbwWWA3OgCZTptkbRlQIkmd0ZzAiC+SPQFqtvpEhO2uc9RnQwGx766FCNTcmf
         uhrZyLmlpSIad69tow/AxXRW2s+GqVzfzHEaLErauRcfTZIOjk921WNjOWzgb5UVig6Q
         Wa8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=SQLEV3ZJdsSTEKNxjgfsvOWLI34f1G/vgTOHGNz1ESU=;
        b=CWKRBIbAeQoFbt6n8LypwN3Q5Iea8R2Mg/XxgYrI17sCBFyGsZhJ14iaXWTnFXb6Cl
         Iu1dHaBNjZlrHwA90pRXOwVPTxvjy+3QRXej6/aa46Ciyg+cFoxGeh38q9dgLpsAIc4P
         o/S6JjzrRlD2XWar9SxbJ3sApvwxSuJOlcZ5DrKEBBzodNgg/Zl4QYc5/dXZyqJo0oAk
         IZMWrm+xlJqGMfqEG0kXpr1qriiqzvpwcmEgqfOQ/8yrOn6wrmo277l5doQ4vIT0zwCk
         uid8W2qALm+tXzSlbI/3yPYpJ32IOY5ZLic/DJbBTitbM+PkHwwmywjtSiG3bXu/t9xt
         wQvg==
X-Gm-Message-State: ACgBeo3IPkY6oJwV/pEv50Pb45/0MqtAs5bBk+j/gpfN4BzusAxKSK7b
	9zhGaEdvfJKUQs9F1cI5jpu2uw==
X-Google-Smtp-Source: AA6agR72R5W/Kex/XQuCupNMmzaZixN6xlaEo5/RRm3bBS76PuHWKeKoMW9NiLcn+wuJrVWPuvXKYQ==
X-Received: by 2002:a05:6808:295:b0:344:eccd:3fd6 with SMTP id z21-20020a056808029500b00344eccd3fd6mr7807774oic.2.1660978569430;
        Fri, 19 Aug 2022 23:56:09 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.68])
        by smtp.gmail.com with ESMTPSA id h26-20020a9d641a000000b00636faf5e2d9sm1661098otl.39.2022.08.19.23.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 23:56:08 -0700 (PDT)
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
Subject: [PATCH v8 5/7] RISC-V: Allow marking IPIs as suitable for remote FENCEs
Date: Sat, 20 Aug 2022 12:24:44 +0530
Message-Id: <20220820065446.389788-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220820065446.389788-1-apatel@ventanamicro.com>
References: <20220820065446.389788-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_235610_247867_263DCA3F 
X-CRM114-Status: GOOD (  15.42  )
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
index e25d39cd2d27..cb2bda4822de 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -143,7 +143,10 @@ bool riscv_ipi_have_virq_range(void)
 	return (ipi_virq_base) ? true : false;
 }
 
-void riscv_ipi_set_virq_range(int virq, int nr)
+DEFINE_STATIC_KEY_FALSE(riscv_ipi_for_rfence);
+EXPORT_SYMBOL_GPL(riscv_ipi_for_rfence);
+
+void riscv_ipi_set_virq_range(int virq, int nr, bool use_for_rfence)
 {
 	int i, err;
 
@@ -166,6 +169,12 @@ void riscv_ipi_set_virq_range(int virq, int nr)
 
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

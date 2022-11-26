Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A713C4321E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 17:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDQ60acnRDvnpIqUeXccvMxqNbI2mK7qG37fJv/q91o=; b=RqiP4PCIN+cAUr
	gMjqrpC+GW+ZoVObxnNtiCADIsfsfLaJo3SuYyfyzAXySaZ0PLKsDviY7+bFZ+bJhAu3uQN3ggfxt
	HBARFnxlIJsnpwlT/QXOD91Q/9MA0sQsgH8K5d8sdNColNX685MCQmV4GxAPMqgtrmgxJvUhTk08m
	9l7rLnKDL3h5+8bfnZrPSb7datgkNlG+AYhpEujb7a7+E4vE/NdpzkTVOq5GiKEUwTedRtVJFCO26
	IMKyrgjAGoU59+wRA46dNd8M6cVsgBHmyQ7EJAQRbSro9qAJj67BkHQmKQnIjOKTv/QcmaQY1T//V
	VTQvk0PFz8sDyw+xGQgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyz5P-007Uer-9w; Sat, 26 Nov 2022 17:35:31 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyz5N-007Ucb-0n
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 17:35:30 +0000
Received: by mail-pl1-x629.google.com with SMTP id io19so6569137plb.8
        for <linux-riscv@lists.infradead.org>; Sat, 26 Nov 2022 09:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OK/4RawC1T+mup8+Yv13tTbMmFi+4qA07tn31q2P/Go=;
        b=oydasNcqvNUm1jhZZtdzTNzzrYtq4pVQLv9TPBovvtd9FJOLChkmd+YwdLMQ3I5ym3
         HrJMCH3WlIIV1NqEIp6ubQd550hjV5GYPUYpDoujyd3ZPykZO6CHyG+Zp/es73STJbU/
         X00hS6wcKhS0dE9k0qg+MTLENkKpi2iMFrLisAkg7cIWmxi8vAzyxeJQjN3280Sf0lkI
         +Zr+ZHHlFagVaE2Q2NH/mGwprPWnIZUpntwwqcaTpohJIgy9ZkRnGa+utRnANDSWUZRH
         RJKy3F6/X2Bo3eRCf2ipu0Zmiz4/r4MMYgyX/ep+7V8wCwXOHkiXeG2i91zwYNnV14Fo
         Z6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OK/4RawC1T+mup8+Yv13tTbMmFi+4qA07tn31q2P/Go=;
        b=h94mSPST4+Y2/ucuaz4WtSZKP7AG/lHzxfMzpWX03UrOQ804umTxB0X2eM4xsMOQRk
         Ht72UQkVm6pJhR4Da5psgPNHmRgCDgCSUGaiKRY0r7f1s+eCJmbEaRpjueyXtlIwPyir
         QZAX5dT9IQOEO7rH7ABudMtEp76ebTziJd9uAX9Mxj3Knkr0vvfUte9GSc5W9U9axr++
         +TqRy4Qkne80a+yXZG7oW9Od4uKhAx+YtYIIWa5GhNp9Dnfu/45UchuBAvNjvTdPOFZx
         WrlYH5RChiyNIfo3Dh0SoOw/5xpTZJg7dhNZxaxv/ZRxj7I1m+F2jbAxbawTneX3cqZA
         kyhA==
X-Gm-Message-State: ANoB5plr/XAaAxkAUUTyyzgWf4F4LY6WpS0834Dq+jSBYxAwwlL69Cfh
	MXiAc2SStMeLel+2GsNzpmHoXQ==
X-Google-Smtp-Source: AA0mqf6iRpv0y5fW/WVxoMFE5QYAltgUUnVS8Lr8CxTZJdAJV1j5Uu99EIZ6S9J8ubDP3SEU+63QsQ==
X-Received: by 2002:a17:902:a9c6:b0:188:52df:769e with SMTP id b6-20020a170902a9c600b0018852df769emr23686921plr.30.1669484127751;
        Sat, 26 Nov 2022 09:35:27 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902bf4b00b0017f7c4e260fsm5639813pls.150.2022.11.26.09.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 09:35:27 -0800 (PST)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v12 5/7] RISC-V: Allow marking IPIs as suitable for remote FENCEs
Date: Sat, 26 Nov 2022 23:04:51 +0530
Message-Id: <20221126173453.306088-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126173453.306088-1-apatel@ventanamicro.com>
References: <20221126173453.306088-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_093529_099911_AA0DC8AE 
X-CRM114-Status: GOOD (  14.93  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
index b1f654b861fc..d4cd4d96ab49 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -81,6 +81,6 @@ void __init sbi_ipi_init(void)
 			  "irqchip/sbi-ipi:starting",
 			  sbi_ipi_starting_cpu, sbi_ipi_dying_cpu);
 
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
index d5dbe8883e40..1146753a373a 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -251,7 +251,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 		goto fail_free_irq;
 	}
 
-	riscv_ipi_set_virq_range(rc, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(rc, BITS_PER_BYTE, true);
 	clint_clear_ipi();
 #endif
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

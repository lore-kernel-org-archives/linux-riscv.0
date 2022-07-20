Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2145DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtWJP7OKO2oJiswBSHeRQMeOm5L1CfgnBARWSaClJyw=; b=S7TAA5XG3rHUPB
	+qUdsk9BqZGS5youBd265HihSxZpjCswtvH2QaBkHvWWun1S8dZWk7IigzGOBWcvkQURwzjaRtmVh
	vm2wjP0lXLV+pvU9Uo6XMW1J3imPTPGXQqnXZcs9twUOfXDM01hrjSmZPN6uqsZ3ph21KDWRBxNQl
	hvUCk2PpxXEC11tOjad9h73Ty42pUqUn09aUiUzUsE4wNmM9DdTVoSsgDVLGXRjxvpjDegHExTq/X
	kH6QkSN+EeWPfU4IIrzszXmfOblof8wjkV3rBbUdBpdj4l6kRrEAIoZqrP+oH4b56QnL6dj0yJ3wd
	XpbVkJZ6kH/7aT9Jrv4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEBZB-007WZY-P7; Wed, 20 Jul 2022 15:24:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEBZ8-007WUY-Fh
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 15:24:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id f11so15259487plr.4
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+gCL8vpkJbMH1zCQTfU568m0Qd8HeqUY1yacjYAcBHY=;
        b=X8TiORhLv6PwQsozH3XMukbzGmm2vwQrlM4EifR2sfp15mScEYgjqTQRppLOH3ZsC6
         QAxDDw/OKkUpPzWjpGDtzVT4tHM8L2Jc0Y4+Uceu0KCcbRQ+1jAyZRJLf12YeGVIeU8i
         G6cl8Dny6jK2xFnoyghm967Mr92Pde2Yad3cN9JIz2ll95lP/PjLMq/6RlCHTA4eSGcH
         jFOqIVhkxwhU0i62Qu6EIAqnJswj7SVbTM+JzcEzi0ZtUEOChWksZ+xe2qDH1fhwKQms
         6/nmSI+6lCxwBnUCIDov36aMiGHpbYro6oJ3EmkI1tSXgOkRhqsHNs/IdhnzeVSRfit+
         iHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+gCL8vpkJbMH1zCQTfU568m0Qd8HeqUY1yacjYAcBHY=;
        b=m5C75RaMSwIubl4WBCLY5fh4MAxRjb4CUh7G2J36HvPVHhgPun/nnEomKG8F9b3oDo
         w0K15+vOSa9c+fHi7DjdWPR0+TC2jmFPiLBoAdFM0J/aMJNOJtTG5goUXb3h1LL/E1wU
         Kn87niVhns0Mi+DNVM6BT08WPtN2CVQhlLzGDSwdq8YRgaCfHR34HUifxaZLSYGCo3yB
         8rbz80WCo/NBj7kAsmbfz5pKDND/smVndHoCePAQ84CBAdSBoywEhqvvjJJiiQcbOyK6
         snL1NPsbzj8Dl4TWrsrZa8/3H9NMzDgK9jjqH+wMJGQ73hu2tlZNLc6aKmH/MTk4ov+K
         iXcw==
X-Gm-Message-State: AJIora+DKYzhkdApfkI5vtL2ddpoFyT7EOgjCjUSXVczSo72lDbNr/Pw
	JmghMYAEAHoEPv5WHWXCZoj1kQ==
X-Google-Smtp-Source: AGRyM1vNCIefghATWrh2c+eN2722FUXmTj/HYQM7BJj7GSnaWk7QvPgGc48SocyX0/qvS60iheL9Eg==
X-Received: by 2002:a17:902:b28a:b0:16d:1c68:2e2 with SMTP id u10-20020a170902b28a00b0016d1c6802e2mr5029303plr.26.1658330682703;
        Wed, 20 Jul 2022 08:24:42 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.179.42.230])
        by smtp.gmail.com with ESMTPSA id w15-20020a1709026f0f00b0016cf8f0bdd5sm6013031plk.108.2022.07.20.08.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:24:42 -0700 (PDT)
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
Subject: [PATCH v7 5/7] RISC-V: Allow marking IPIs as suitable for remote FENCEs
Date: Wed, 20 Jul 2022 20:53:46 +0530
Message-Id: <20220720152348.2889109-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220720152348.2889109-1-apatel@ventanamicro.com>
References: <20220720152348.2889109-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_082446_588224_E4843F56 
X-CRM114-Status: GOOD (  16.08  )
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
 arch/riscv/include/asm/smp.h      | 19 +++++++++++++++++--
 arch/riscv/kernel/sbi-ipi.c       |  2 +-
 arch/riscv/kernel/smp.c           | 12 +++++++++++-
 drivers/clocksource/timer-clint.c |  2 +-
 4 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 7da034e2f231..f69fb9ac1756 100644
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
@@ -46,7 +49,13 @@ void riscv_ipi_disable(void);
 bool riscv_ipi_have_virq_range(void);
 
 /* Set the IPI interrupt numbers for arch (called by irqchip drivers) */
-void riscv_ipi_set_virq_range(int virq, int nr_irqs, bool percpu_enable);
+void riscv_ipi_set_virq_range(int virq, int nr_irqs, bool percpu_enable,
+			      bool use_for_rfence);
+
+/* Check if we can use IPIs for remote FENCEs */
+DECLARE_STATIC_KEY_FALSE(riscv_ipi_for_rfence);
+#define riscv_use_ipi_for_rfence() \
+	static_branch_unlikely(&riscv_ipi_for_rfence)
 
 /* Secondary hart entry */
 asmlinkage void smp_callin(void);
@@ -94,10 +103,16 @@ static inline bool riscv_ipi_have_virq_range(void)
 }
 
 static inline void riscv_ipi_set_virq_range(int virq, int nr,
-					    bool percpu_enable)
+					    bool percpu_enable,
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
index 5be545f6914c..e45a7d9a16c2 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -55,6 +55,6 @@ void __init sbi_ipi_init(void)
 		return;
 	}
 
-	riscv_ipi_set_virq_range(virq, BITS_PER_LONG, false);
+	riscv_ipi_set_virq_range(virq, BITS_PER_LONG, false, false);
 	pr_info("providing IPIs using SBI IPI extension\n");
 }
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 07f1ff652362..80ab8359ad48 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -150,7 +150,11 @@ bool riscv_ipi_have_virq_range(void)
 	return (ipi_virq_base) ? true : false;
 }
 
-void riscv_ipi_set_virq_range(int virq, int nr, bool percpu_enable)
+DEFINE_STATIC_KEY_FALSE(riscv_ipi_for_rfence);
+EXPORT_SYMBOL_GPL(riscv_ipi_for_rfence);
+
+void riscv_ipi_set_virq_range(int virq, int nr, bool percpu_enable,
+			      bool use_for_rfence)
 {
 	int i, err;
 
@@ -174,6 +178,12 @@ void riscv_ipi_set_virq_range(int virq, int nr, bool percpu_enable)
 
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
index 69f8d2ac1916..3a90b6b3ca48 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -245,7 +245,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 		goto fail_remove_cpuhp;
 	}
 
-	riscv_ipi_set_virq_range(virq, BITS_PER_LONG, false);
+	riscv_ipi_set_virq_range(virq, BITS_PER_LONG, false, true);
 	clint_clear_ipi(clint_ipi_irq);
 
 	return 0;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

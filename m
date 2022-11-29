Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5427BC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuLGL6PFoTJK8uNBb4/unK9ELLD1pWJ7bLwkdn1oOeU=; b=n73s8iAAG2ZdWR
	oo4GXOIoW1dpiwCuCZJP3LzA996KY0d79c7AVyH/DiJmfYBzJOVCtxTPtjLeAsDmMaUpyElPxIBD6
	UV1kMYZ81kTBt2sJZ57Sy3HMuEqNeR8ibX2p6CKytmVqGFNWhAUuQs50QE2H3m6lqNCB4XmqleTWc
	DI+H7gtbKjCUAKQTLjplb2vJROXR0s2koNNPsLXEk+UFvEsdNH9siWGAC+47Y8jibJ9Wx+R69Xbue
	Ey9AF24IKf9/HsYjYiQ4uXqIMTeYJI58m1VJxdBmgz2jek1R/z4/J71oxSYQNXAozgsB6Wosm2Wr7
	LYdzNXL+TPyeXh9hyNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01YP-009E8E-2e; Tue, 29 Nov 2022 14:25:45 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Xz-009Dkv-Hx
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:25:26 +0000
Received: by mail-pl1-x635.google.com with SMTP id w23so13534386ply.12
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe57EoQBO7kaxIm5DHEr+NjxUNyA/iTv7lBLEurKYJw=;
        b=BT1N+o1wuVcSfqUyqn3ANFvHK2WDducnvVp/0T4W7XCLFj4OFsj1omPHHRMovKFtSs
         st6gX2x11fW3xzYkhgLxCp/Kv51r8j7y/XdVVDUGjnVyM51gO4t8sKpRSYi/Mui0gnny
         Kctm+LKfaJhU2hCiGT8WPzESIGf6CC4mYWZwQrrPQkn8Z0HxAQq1Hu/9JEUn3fQ/XjVL
         cUHZoYHInoC+BrMdFKrs+UPyCD3RGKhPoQYxPXM2TTOZ+JbVR7Jp1pf1QHcFXPGKbyTA
         FNH+C18eu5VOuXYG7T408lYkkxdcxDfEiPB3mqSvpzLERsqo4KafIEovrMc2kCgb/+5Y
         1OmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qe57EoQBO7kaxIm5DHEr+NjxUNyA/iTv7lBLEurKYJw=;
        b=ot8AoeYLnA76+oadytCtwcT2z1fhroE7wFdxyBJXvaS8ETWE5VvUMxhym3Qnq0QZfE
         dan8uuFOLxBSYEvNiKOqFUsQmC/rAOZszleGLSBVlpHqPlwhQJQulu61/IMiE6J76evT
         6EhsA1t+z4AK+dhYmc2pNC++5CoYYN2TaU8apzre/ob5NE5zBDda3SmEqIAQZjE2frmc
         S0pgIr+r+c8MmwbhA8jVoCohxyPXR6h8SBw+Bfh3iwWu6e40h8ccAc270sKAfak/wy9E
         6cyVnYcZUm2cQvKCq+cZ8EGKYiMTv13NXnamVFcV8xfdH7KR0IbdJV2J5/tW9STL06D6
         z1DA==
X-Gm-Message-State: ANoB5pkqZDDjBpvK7WuRo7mV+kGFUv5ESObv7eQsBa5Iho9DSK78WJ27
	ngflJ09hepR2VkZD7c+M4KLoyUByb6lHTw==
X-Google-Smtp-Source: AA0mqf4Mi+h8Bb7reeupkyZycc5+cz9JHv+7jDVNydR7H/mgu9bxKKI0ugkTmaIBAg0t02li4t43yw==
X-Received: by 2002:a17:90b:438a:b0:218:f733:d9c7 with SMTP id in10-20020a17090b438a00b00218f733d9c7mr28409108pjb.221.1669731919082;
        Tue, 29 Nov 2022 06:25:19 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.98])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b00176a2d23d1asm11039076plh.56.2022.11.29.06.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:25:18 -0800 (PST)
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
Subject: [PATCH v13 5/7] RISC-V: Allow marking IPIs as suitable for remote FENCEs
Date: Tue, 29 Nov 2022 19:54:47 +0530
Message-Id: <20221129142449.886518-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129142449.886518-1-apatel@ventanamicro.com>
References: <20221129142449.886518-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_062519_650180_5203D8A9 
X-CRM114-Status: GOOD (  15.49  )
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
index 6466706b03a7..efe18de74e95 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -76,6 +76,6 @@ void __init sbi_ipi_init(void)
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
index 9877b4b1c9e9..eb23da3054b8 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -248,7 +248,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
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

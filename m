Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86EAC4707C
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 22:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9t1ZojKuJWB2/JchThIUKFPeMCYhPcBMBbEjSWDHj8=; b=WQg2YZgkGdnQZa
	LRaLMTgCUspL5MzzXG9lKC/kEBDa8BpyZKoYajfJa5WLcfdmbUAuNg7ZtyqWOoVLMLeP5uO0GEGOR
	ehU9uRtc+fXndz8CRA6rTYlVS6+CQN/LRd0oODtILP6rcVSPcIK+/bM26QEc9iyqzxifaFZBWD3jQ
	MY9gAKbyZJWWGPz3Oy7y4krCJnJaVDHd1mDfmzlnhf8LyhtpZ/jShMke2d0aQLrdAes+y3tfO+wm9
	F+l461QZOHnwkIMBlMNP60SeC1y3IJiiHiE78/wrD5fICPeH5KSXpjmaBloptG7uWofNATrqmn3IF
	vr+IGFjMBdwue+IQqaEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpX-0098TU-1x;
	Tue, 02 Jan 2024 22:01:47 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKmpQ-0098Np-1v
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 22:01:44 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-28bd623c631so8055285a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 14:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704232899; x=1704837699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pynuwdwrgTDQTs9EZPEkGjuJgTxII1R0VKB5FEKmh8A=;
        b=Ozk14naO8drEsQbcifTk8r8w81m+11gmsrPRNb18qYqaQcOyB8TaKunokujqAruE+b
         LEiml3W0ROiPQJGnnVzEHH4Shb8A1fwmXOyU0H326vkX63yKsDrmvfg4/Oicjy2Itc87
         zdK+KocE6mhDPzsdyyIXjV+z5hhxUZzZ0gAKnE+eNt/YHLiS5o0lH+eFqI0VlFwo7zkA
         UcqnGMkA4p9b0gbSBbDoKKGdlddCZfjAOO51jkS/5970zDV0dM3s2Mg1ng0hx9GO2fxb
         TdPFwB9b/I53ri5ivrwFNHVqXIAhAzrT86V5mruCq/GHkHjUJKSwHAlFnevtk9ThSGrz
         BESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704232899; x=1704837699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pynuwdwrgTDQTs9EZPEkGjuJgTxII1R0VKB5FEKmh8A=;
        b=wottk8h8G4C1P8lsCiIqW13yen13XOL0SnRugvCdmDO2Q9+NQpnq+ce1Ba60ESUgpa
         ni15v4nmudmTUdUWHIqfGjyvVGjTCOH1IRmz1YGnryBp1JSom7vl9wtzl+DzEUSFoACF
         efoTHw/WtbZ0eDgYrgjQIJ5m064nn06XmbnCaYLFzCkBbaE0M6+506b5lS160774Dcow
         paUHD9WqxNwu+hEpJaU+FBOw9B3ZDB3yJ8w8WcYYbkARFGV7ESZ/eicj9I7j7pcV+6ub
         ElWM/waItUdpSe8MGfEuQJEzdxJ4ZnXD1O80SgRtUzkACflgsti31mfdHdZI6f9XHIzP
         KVpQ==
X-Gm-Message-State: AOJu0YxYG9JPktKx3bsz+OhxzyJNRD4E4cj6wwNnHcV1lVu0vwvwq4Th
	62bFR3zMPaLdv+p6dX26DkL675YXNmL/NA==
X-Google-Smtp-Source: AGHT+IEYPya8PYA19IRLK0MnT0T3isXxWKz5hXZR0znVEsgxQFvYhbUCwOfyfHQYZwqQ+xa53Aj2UQ==
X-Received: by 2002:a17:90b:3ec2:b0:28c:1b98:e6e7 with SMTP id rm2-20020a17090b3ec200b0028c1b98e6e7mr8644807pjb.47.1704232899208;
        Tue, 02 Jan 2024 14:01:39 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id r59-20020a17090a43c100b0028ce507cd7dsm101724pjg.55.2024.01.02.14.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 14:01:38 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 02/12] riscv: Use IPIs for remote cache/TLB flushes by default
Date: Tue,  2 Jan 2024 14:00:39 -0800
Message-ID: <20240102220134.3229156-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240102220134.3229156-1-samuel.holland@sifive.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_140140_653516_C54EF5DB 
X-CRM114-Status: GOOD (  21.86  )
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

An IPI backend is always required in an SMP configuration, but an SBI
implementation is not. For example, SBI will be unavailable when the
kernel runs in M mode.

Generally, IPIs are assumed to be faster than SBI calls due to the SBI
context switch overhead. However, when SBI is used as the IPI backend,
then the context switch cost must be paid anyway, and performing the
cache/TLB flush directly in the SBI implementation is more efficient
than inserting an interrupt to the kernel. This is the only scenario
where riscv_ipi_set_virq_range()'s use_for_rfence parameter is false.

Thus, it makes sense for remote fences to use IPIs by default, and make
the SBI remote fence extension the special case.

sbi_ipi_init() already checks riscv_ipi_have_virq_range(), so it only
calls riscv_ipi_set_virq_range() when no other IPI device is available.
So we can move the static key and drop the use_for_rfence parameter.

Furthermore, the static branch only makes sense when CONFIG_RISCV_SBI is
enabled. Optherwise, IPIs must be used. Add a fallback definition of
riscv_use_sbi_for_rfence() which handles this case and removes the need
to check CONFIG_RISCV_SBI elsewhere, such as in cacheflush.c.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v4:
 - New patch for v4

 arch/riscv/include/asm/sbi.h      |  4 ++++
 arch/riscv/include/asm/smp.h      | 15 ++-------------
 arch/riscv/kernel/sbi-ipi.c       | 11 ++++++++++-
 arch/riscv/kernel/smp.c           | 11 +----------
 arch/riscv/mm/cacheflush.c        |  5 ++---
 arch/riscv/mm/tlbflush.c          | 31 ++++++++++++++-----------------
 drivers/clocksource/timer-clint.c |  2 +-
 7 files changed, 34 insertions(+), 45 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 0892f4421bc4..aeee0127df76 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -339,8 +339,12 @@ unsigned long riscv_cached_marchid(unsigned int cpu_id);
 unsigned long riscv_cached_mimpid(unsigned int cpu_id);
 
 #if IS_ENABLED(CONFIG_SMP) && IS_ENABLED(CONFIG_RISCV_SBI)
+DECLARE_STATIC_KEY_FALSE(riscv_sbi_for_rfence);
+#define riscv_use_sbi_for_rfence() \
+	static_branch_unlikely(&riscv_sbi_for_rfence)
 void sbi_ipi_init(void);
 #else
+static inline bool riscv_use_sbi_for_rfence(void) { return false; }
 static inline void sbi_ipi_init(void) { }
 #endif
 
diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 0d555847cde6..7ac80e9f2288 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -49,12 +49,7 @@ void riscv_ipi_disable(void);
 bool riscv_ipi_have_virq_range(void);
 
 /* Set the IPI interrupt numbers for arch (called by irqchip drivers) */
-void riscv_ipi_set_virq_range(int virq, int nr, bool use_for_rfence);
-
-/* Check if we can use IPIs for remote FENCEs */
-DECLARE_STATIC_KEY_FALSE(riscv_ipi_for_rfence);
-#define riscv_use_ipi_for_rfence() \
-	static_branch_unlikely(&riscv_ipi_for_rfence)
+void riscv_ipi_set_virq_range(int virq, int nr);
 
 /* Check other CPUs stop or not */
 bool smp_crash_stop_failed(void);
@@ -104,16 +99,10 @@ static inline bool riscv_ipi_have_virq_range(void)
 	return false;
 }
 
-static inline void riscv_ipi_set_virq_range(int virq, int nr,
-					    bool use_for_rfence)
+static inline void riscv_ipi_set_virq_range(int virq, int nr)
 {
 }
 
-static inline bool riscv_use_ipi_for_rfence(void)
-{
-	return false;
-}
-
 #endif /* CONFIG_SMP */
 
 #if defined(CONFIG_HOTPLUG_CPU) && (CONFIG_SMP)
diff --git a/arch/riscv/kernel/sbi-ipi.c b/arch/riscv/kernel/sbi-ipi.c
index a4559695ce62..1026e22955cc 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -13,6 +13,9 @@
 #include <linux/irqdomain.h>
 #include <asm/sbi.h>
 
+DEFINE_STATIC_KEY_FALSE(riscv_sbi_for_rfence);
+EXPORT_SYMBOL_GPL(riscv_sbi_for_rfence);
+
 static int sbi_ipi_virq;
 
 static void sbi_ipi_handle(struct irq_desc *desc)
@@ -72,6 +75,12 @@ void __init sbi_ipi_init(void)
 			  "irqchip/sbi-ipi:starting",
 			  sbi_ipi_starting_cpu, NULL);
 
-	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE, false);
+	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
 	pr_info("providing IPIs using SBI IPI extension\n");
+
+	/*
+	 * Use the SBI remote fence extension to avoid
+	 * the extra context switch needed to handle IPIs.
+	 */
+	static_branch_enable(&riscv_sbi_for_rfence);
 }
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 40420afbb1a0..1d06df04eb71 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -171,10 +171,7 @@ bool riscv_ipi_have_virq_range(void)
 	return (ipi_virq_base) ? true : false;
 }
 
-DEFINE_STATIC_KEY_FALSE(riscv_ipi_for_rfence);
-EXPORT_SYMBOL_GPL(riscv_ipi_for_rfence);
-
-void riscv_ipi_set_virq_range(int virq, int nr, bool use_for_rfence)
+void riscv_ipi_set_virq_range(int virq, int nr)
 {
 	int i, err;
 
@@ -197,12 +194,6 @@ void riscv_ipi_set_virq_range(int virq, int nr, bool use_for_rfence)
 
 	/* Enabled IPIs for boot CPU immediately */
 	riscv_ipi_enable();
-
-	/* Update RFENCE static key */
-	if (use_for_rfence)
-		static_branch_enable(&riscv_ipi_for_rfence);
-	else
-		static_branch_disable(&riscv_ipi_for_rfence);
 }
 
 static const char * const ipi_names[] = {
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 55a34f2020a8..47c485bc7df0 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -21,7 +21,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
+	if (riscv_use_sbi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -69,8 +69,7 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
-	} else if (IS_ENABLED(CONFIG_RISCV_SBI) &&
-		   !riscv_use_ipi_for_rfence()) {
+	} else if (riscv_use_sbi_for_rfence()) {
 		sbi_remote_fence_i(&others);
 	} else {
 		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index e6659d7368b3..09b03bf71e6a 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -73,10 +73,10 @@ static void __ipi_flush_tlb_all(void *info)
 
 void flush_tlb_all(void)
 {
-	if (riscv_use_ipi_for_rfence())
-		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
-	else
+	if (riscv_use_sbi_for_rfence())
 		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
+	else
+		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
 }
 
 struct flush_tlb_range_data {
@@ -96,7 +96,6 @@ static void __ipi_flush_tlb_range_asid(void *info)
 static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 			      unsigned long size, unsigned long stride)
 {
-	struct flush_tlb_range_data ftd;
 	const struct cpumask *cmask;
 	unsigned long asid = FLUSH_TLB_NO_ASID;
 	bool broadcast;
@@ -119,20 +118,18 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
 		broadcast = true;
 	}
 
-	if (broadcast) {
-		if (riscv_use_ipi_for_rfence()) {
-			ftd.asid = asid;
-			ftd.start = start;
-			ftd.size = size;
-			ftd.stride = stride;
-			on_each_cpu_mask(cmask,
-					 __ipi_flush_tlb_range_asid,
-					 &ftd, 1);
-		} else
-			sbi_remote_sfence_vma_asid(cmask,
-						   start, size, asid);
-	} else {
+	if (!broadcast) {
 		local_flush_tlb_range_asid(start, size, stride, asid);
+	} else if (riscv_use_sbi_for_rfence()) {
+		sbi_remote_sfence_vma_asid(cmask, start, size, asid);
+	} else {
+		struct flush_tlb_range_data ftd;
+
+		ftd.asid = asid;
+		ftd.start = start;
+		ftd.size = size;
+		ftd.stride = stride;
+		on_each_cpu_mask(cmask, __ipi_flush_tlb_range_asid, &ftd, 1);
 	}
 
 	if (mm)
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 9a55e733ae99..7ccc16dd6a76 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -251,7 +251,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	}
 
 	irq_set_chained_handler(clint_ipi_irq, clint_ipi_interrupt);
-	riscv_ipi_set_virq_range(rc, BITS_PER_BYTE, true);
+	riscv_ipi_set_virq_range(rc, BITS_PER_BYTE);
 	clint_clear_ipi();
 #endif
 
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

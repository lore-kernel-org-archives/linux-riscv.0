Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DC0E7718B
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Dec 2024 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T3xgNvGqqdiBgQQuM/sHTHbOix+fsAUo6hZUzJjT5BQ=; b=FHLU/ik87KNZmH
	41VGBe26wwfdi0cGFdsKDpX87CGdZvqNMXFcx1pavEYQ1bSNi5d2VHw+7nk/hwO2y3KIHlRbp3PuJ
	nVmI85M18A0wpb8rvzi2NN3lVGxlmJbGGkYI7QOGijY+bvK8dCfWpdL63AEA0XVNnnQhki/qMsI2V
	Lgzbjz7TgFgQCac6HoCw1AJ9la9v4+AwRFmgK/URQVfISZUwh5GY83GLBYDz7m9m8etTKZTy6e1oi
	+FFcA2oyOY8xCAk6HSjV/3xNyHL7yDVK8ka9YkQOwSe3K43Ea36aTuOmwqJGqc+kP/ZwvhVY1BZ0j
	MdRtJHbrMQw29O1EvRJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRBpv-00000000TO8-1gyn;
	Fri, 27 Dec 2024 15:01:11 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRBpp-00000000TN0-32EX
	for linux-riscv@lists.infradead.org;
	Fri, 27 Dec 2024 15:01:09 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aaec61d0f65so965504266b.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Dec 2024 07:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735311662; x=1735916462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6nWvR0vk+i2n876V40eVSxtv5PV4CDfGaV5mWkbhDI=;
        b=L1+M/X0HcZ9UrbKWKn+D1cCx0gDATMhBNZNDRLtjFfpqJyPQsEm41hWyDPgchMyBmM
         J0TpFUqKA7fEL9+tv1DN42S7wq9bq4AfqkqANH/aIXE5adCyvOyg4JPeSdGpfQe07WxN
         UQhBy7jtNDgS5bVw/pxXi0pezj+kZqb2QPaPUHpZ/w6PwVhWkcf6mkm/6QfMpqTE3jsj
         HiVTDgX3OmQw8kWL05eLVWW63xu+kYrbIRyfzMDv1Tw6pBI/MUgYn7bOdGIZFyDlEWdP
         aY2jZ1Vb/aBX+nZqeVwb9OeOGXzHCYuuUqvhRnZAd8ryvQtNnBg/nV6NP1qvN1S2rUZE
         lo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735311662; x=1735916462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6nWvR0vk+i2n876V40eVSxtv5PV4CDfGaV5mWkbhDI=;
        b=uSrbTYUnUA8RBCTAF96eVOKMYTokyqlKM2hFoJspgcIoMA/Vbjfqbq+NxDQnEvq6Nv
         SCAxWLq+C3n/oHUiY6gZYf8mfVXM8tDOhCCH7Xt8wq8QY4NqNXHhHG5d81Sptkw55g5E
         qMeYCMStcw8ERMequgwsNj2GtE+/34X9z4725GNA1kmZXsB90q78WMU8l+VZ6JnHm1PJ
         k4wq0ykmpRFhYlBQfjY7D7sSBZtYpMv3HYO3+qewbu3xFq1wPw+Pk89Uq3kLjd2GpcT/
         7WaHGNX/2UvDoI25bIHVQQKvaUhcIweln9RfdccE2lrWc/WaVJSvpvx11+7dsrGfN7iK
         vTiw==
X-Gm-Message-State: AOJu0YzRCSFGoHalVXD7dY6UIB8R2tQWYySZS3mWV9Koy3hxi41/7ZRn
	fGzda029xckNACy7Y+qQyVWuagiySaGherDonlAVUFGfIWgozrt3ToDRI6CY
X-Gm-Gg: ASbGnctv9YPnHZUeJqC26pgF5Y4DroMz3s7kEOL6tvgTyBJlGa8CbVbtmVD/CYUDJI5
	4UhHYbWHO2BZh/H2cb7NcfSegwmSk59yRSgFgyZjD5WyjFhd8MtkhaVB3/FbZcqAk86wxGuq85I
	MFAsHc6cONxau5BF99UJZRnDjx5djyyUxE6/nuafy5P1im54Bql9DB6mibCxIFRTmaNunoSh3KZ
	GjHLuTzWCDHAWr8Nc/VAYh6BWLHBPiroIaXdCK2SmjzASV1jn/s218QhI8/TCA5TXL1T60eSy3/
	4bW3KN7RiqL3eA==
X-Google-Smtp-Source: AGHT+IFAnAKsu4fySImOehC1LgbAdBG7QwGonyAyN7SvLzOQfDEK+190VEjoB8OB69R/Hm04r0FMrw==
X-Received: by 2002:a17:907:1a4f:b0:aae:8841:2bba with SMTP id a640c23a62f3a-aae88412f5dmr1339959766b.22.1735311661579;
        Fri, 27 Dec 2024 07:01:01 -0800 (PST)
Received: from localhost.localdomain ([109.245.32.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e892bb7sm1118019666b.43.2024.12.27.07.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 07:01:01 -0800 (PST)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Access time mmio instead of rdtime.
Date: Fri, 27 Dec 2024 16:00:56 +0100
Message-Id: <20241227150056.191794-1-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_070105_766487_19F90C2E 
X-CRM114-Status: GOOD (  15.09  )
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

Allows for riscv-clock to pick up mmio address for faster rdtime access
via clock-reg (u64) property on boot cpu node.

Add RISCV_TIME_MMIO config.

Signed-off-by: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
---
 arch/riscv/Kconfig                | 11 ++++++
 arch/riscv/include/asm/timex.h    | 59 ++++++++++++++++++++-----------
 drivers/clocksource/timer-riscv.c | 22 ++++++++++++
 3 files changed, 72 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d4a7ca0388c0..0f4243e4bc1b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -716,6 +716,17 @@ config RISCV_ISA_ZACAS
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_TIME_MMIO
+	bool "Time mmio support"
+	depends on !RISCV_M_MODE
+	help
+	   Access time mmio instead of rdtime.
+	   Allows for riscv-clock to pick up mmio address for faster rdtime
+	   access via clock-reg (u64) property on boot cpu node.
+	   Some CPUs trap on rdtime or reading the time CSR register.
+
+	   If you don't know what to do here, say N.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index a06697846e69..b1956c737513 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -7,31 +7,24 @@
 #define _ASM_RISCV_TIMEX_H
 
 #include <asm/csr.h>
+#include <asm/mmio.h>
+
+#include <linux/jump_label.h>
 
 typedef unsigned long cycles_t;
 
+extern u64 __iomem *riscv_time_val;
+DECLARE_STATIC_KEY_FALSE(riscv_time_mmio_available);
+
+#define riscv_time_val riscv_time_val
+
 #ifdef CONFIG_RISCV_M_MODE
 
 #include <asm/clint.h>
 
-#ifdef CONFIG_64BIT
-static inline cycles_t get_cycles(void)
-{
-	return readq_relaxed(clint_time_val);
-}
-#else /* !CONFIG_64BIT */
-static inline u32 get_cycles(void)
-{
-	return readl_relaxed(((u32 *)clint_time_val));
-}
-#define get_cycles get_cycles
+#undef riscv_time_val
 
-static inline u32 get_cycles_hi(void)
-{
-	return readl_relaxed(((u32 *)clint_time_val) + 1);
-}
-#define get_cycles_hi get_cycles_hi
-#endif /* CONFIG_64BIT */
+#define riscv_time_val clint_time_val
 
 /*
  * Much like MIPS, we may not have a viable counter to use at an early point
@@ -46,22 +39,48 @@ static inline unsigned long random_get_entropy(void)
 }
 #define random_get_entropy()	random_get_entropy()
 
-#else /* CONFIG_RISCV_M_MODE */
+#endif
+
+static inline long use_riscv_time_mmio(void)
+{
+	return IS_ENABLED(CONFIG_RISCV_M_MODE) ||
+		(IS_ENABLED(CONFIG_RISCV_TIME_MMIO) &&
+		 static_branch_unlikely(&riscv_time_mmio_available));
+}
+
+#ifdef CONFIG_64BIT
+static inline cycles_t mmio_get_cycles(void)
+{
+	return readq_relaxed(riscv_time_val);
+}
+#else /* !CONFIG_64BIT */
+static inline cycles_t mmio_get_cycles(void)
+{
+	return readl_relaxed(((u32 *)riscv_time_val));
+}
+#endif /* CONFIG_64BIT */
+
+static inline u32 mmio_get_cycles_hi(void)
+{
+	return readl_relaxed(((u32 *)riscv_time_val) + 1);
+}
 
 static inline cycles_t get_cycles(void)
 {
+	if (use_riscv_time_mmio())
+		return mmio_get_cycles();
 	return csr_read(CSR_TIME);
 }
 #define get_cycles get_cycles
 
 static inline u32 get_cycles_hi(void)
 {
+	if (use_riscv_time_mmio())
+		return mmio_get_cycles_hi();
 	return csr_read(CSR_TIMEH);
 }
 #define get_cycles_hi get_cycles_hi
 
-#endif /* !CONFIG_RISCV_M_MODE */
-
 #ifdef CONFIG_64BIT
 static inline u64 get_cycles64(void)
 {
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 48ce50c5f5e6..1f6be676d6c7 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -32,6 +32,13 @@
 static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
 static bool riscv_timer_cannot_wake_cpu;
 
+#if defined(CONFIG_RISCV_TIME_MMIO)
+EXPORT_SYMBOL(riscv_time_mmio_available);
+DEFINE_STATIC_KEY_FALSE_RO(riscv_time_mmio_available);
+u64 __iomem *riscv_time_val __ro_after_init;
+EXPORT_SYMBOL(riscv_time_val);
+#endif
+
 static void riscv_clock_event_stop(void)
 {
 	if (static_branch_likely(&riscv_sstc_available)) {
@@ -203,6 +210,9 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	int cpuid, error;
 	unsigned long hartid;
 	struct device_node *child;
+#if defined(CONFIG_RISCV_TIME_MMIO)
+	u64 mmio_addr;
+#endif
 
 	error = riscv_of_processor_hartid(n, &hartid);
 	if (error < 0) {
@@ -220,6 +230,18 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (cpuid != smp_processor_id())
 		return 0;
 
+#if defined(CONFIG_RISCV_TIME_MMIO)
+	if (!of_property_read_u64(n, "clock-reg", &mmio_addr)) {
+		riscv_time_val = ioremap((long)mmio_addr, 8);
+		if (riscv_time_val) {
+			pr_info("Using mmio time register at 0x%llx\n", mmio_addr);
+			static_branch_enable(&riscv_time_mmio_available);
+		} else {
+			pr_warn("Unable to use mmio time at 0x%llx\n", mmio_addr);
+		}
+	}
+#endif
+
 	child = of_find_compatible_node(NULL, NULL, "riscv,timer");
 	if (child) {
 		riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

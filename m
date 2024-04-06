Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA5CCD1292
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 11:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PFt1fqhA7NXGKO/x982oMu7MyCLh6Lw5VnsZX7Mcr8=; b=44h64dFFwpPnvd
	T4B6wmlUYLkCnvB5lNxtey5IUgH9+/wCcrlgqh9nKAfXJXlsRk1dogENRK5L02Mm9N3Io+zjXF2xI
	RnuYscjtDTFEq63iNoxwgtAt4C0ESAYQdAAWrLjwMhwblMAQ6/LUzTmZl9g1gHd9l5DuFJHBIGXiE
	W/Q0n41zdOqetZ5sHWmFrpVhKXXS0anMQZ30szZqLg9gswkJLCM9chO4b3ZfGty4NI68Gzr54MZP8
	y1DMx4Us7DdnCroYqxpX2WVaJaEHviDxFueA1MXe8OgqNp4fymcKMDCDHPfaP2MYHhnJcs9NDKO6T
	pPm1UedAjqaI5aJhPdoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4KV-0000000ADfe-2lr2;
	Sat, 06 Apr 2024 11:35:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4KT-0000000ADei-1tsS
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 11:35:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF37660B2C;
	Sat,  6 Apr 2024 11:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E50C43390;
	Sat,  6 Apr 2024 11:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712403324;
	bh=P4a9KYACvIIRNW48O2VQT45jjUsOBcQvvKsYyjPbY5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l0ZeV5ZCLAozcfubDL9o5rFOQR1+aqsnMrGjnK5RkVMi0AK653WLvHm9FWjD/3bV/
	 GPIq9K7BruLtMize8NP++CRewTgdCOYYrG1bwdb5C4b7yp2cZWVeKE9IxEW28tF9ks
	 +9zW/QLnp5L6aGIUzIGEG2u7p6tnOMILYYL6VkJpFjTCw1WIjg1mPnaM5Z8f2dKMEp
	 jf8yyeH8Tl9kLVRkhzK7zP4/byvejzsoROKUU92Ov8UXN90YAN3QgbsvOkkQ837gMO
	 wSNXf4iTIpSdqVHhRnZoCNcwayoaG02MA6ydDoLRTKYLIszGRljPd3aksEK7B+EkTz
	 ADbyryrsZY0yw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] clocksource/drivers/timer-clint: Add option to use CSR instead of mtime
Date: Sat,  6 Apr 2024 19:21:58 +0800
Message-ID: <20240406112159.1634-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240406112159.1634-1-jszhang@kernel.org>
References: <20240406112159.1634-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_043525_625755_177620A1 
X-CRM114-Status: GOOD (  16.62  )
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

As pointed out by commit ca7810aecdba ("lib: utils/timer: mtimer: add a
quirk for lacking mtime register") of opensbi:

"T-Head developers surely have a different understanding of time CSR and
CLINT's mtime register with SiFive ones, that they did not implement
the mtime register at all -- as shown in openC906 source code, their
time CSR value is just exposed at the top of their processor IP block
and expects an external continous counter, which makes it not
overrideable, and thus mtime register is not implemented, even not for
reading. However, if CLINTEE is not enabled in T-Head's MXSTATUS
extended CSR, these systems still rely on the mtimecmp registers to
generate timer interrupts. This makes it necessary to implement T-Head
C9xx CLINT support in OpenSBI MTIMER driver, which skips implementing
reading mtime register and falls back to default code that reads time
CSR."

To use the clint in RISCV-M NOMMU env on Milkv Duo little core, we
need to fall back to read time CSR instead of mtime register. Add the
option for this purpose.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/timex.h    | 6 +++---
 drivers/clocksource/Kconfig       | 9 +++++++++
 drivers/clocksource/timer-clint.c | 7 +++++++
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index a06697846e69..1c3eed4263cd 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -10,7 +10,7 @@
 
 typedef unsigned long cycles_t;
 
-#ifdef CONFIG_RISCV_M_MODE
+#if defined(CONFIG_RISCV_M_MODE) && !defined(CONFIG_CLINT_USE_CSR_INSTEADOF_MTIME)
 
 #include <asm/clint.h>
 
@@ -46,7 +46,7 @@ static inline unsigned long random_get_entropy(void)
 }
 #define random_get_entropy()	random_get_entropy()
 
-#else /* CONFIG_RISCV_M_MODE */
+#else /* CONFIG_RISCV_M_MODE && !CONFIG_CLINT_USE_CSR_INSTEADOF_MTIME */
 
 static inline cycles_t get_cycles(void)
 {
@@ -60,7 +60,7 @@ static inline u32 get_cycles_hi(void)
 }
 #define get_cycles_hi get_cycles_hi
 
-#endif /* !CONFIG_RISCV_M_MODE */
+#endif /* !CONFIG_RISCV_M_MODE || CONFIG_CLINT_USE_CSR_INSTEADOF_MTIME */
 
 #ifdef CONFIG_64BIT
 static inline u64 get_cycles64(void)
diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 34faa0320ece..7bbdbf2f96a8 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -650,6 +650,15 @@ config CLINT_TIMER
 	  This option enables the CLINT timer for RISC-V systems.  The CLINT
 	  driver is usually used for NoMMU RISC-V systems.
 
+config CLINT_USE_CSR_INSTEADOF_MTIME
+	bool "Use TIME CSR instead of the mtime register"
+	depends on CLINT_TIMER
+	help
+	  Use TIME CSR instead of mtime register. Enable this option if
+	  prefer TIME CSR over MTIME register, or if the implementation
+	  doesn't implement the mtime register in CLINT, so fall back on
+	  TIME CSR.
+
 config CSKY_MP_TIMER
 	bool "SMP Timer for the C-SKY platform" if COMPILE_TEST
 	depends on CSKY
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index f468fa8bf5f0..0d3890e00b75 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -76,6 +76,12 @@ static void clint_ipi_interrupt(struct irq_desc *desc)
 #define clint_get_cycles_hi()	readl_relaxed(((u32 *)clint_timer_val) + 1)
 #endif
 
+#ifdef CONFIG_CLINT_USE_CSR_INSTEADOF_MTIME
+static u64 notrace clint_get_cycles64(void)
+{
+	return get_cycles64();
+}
+#else
 #ifdef CONFIG_64BIT
 static u64 notrace clint_get_cycles64(void)
 {
@@ -94,6 +100,7 @@ static u64 notrace clint_get_cycles64(void)
 	return ((u64)hi << 32) | lo;
 }
 #endif /* CONFIG_64BIT */
+#endif /* CONFIG_CLINT_USE_CSR_INSTEADOF_MTIME */
 
 static u64 clint_rdtime(struct clocksource *cs)
 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

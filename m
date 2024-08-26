Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D674BC5321D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 11:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pjh61scdukg6liDf5XWkVBY62hv7OQUxwpTkeK0IqB0=; b=rMY8iTg6LQsjPo
	JOb1jGsz8AE6tDG7LjZNe6Nvgk2eMRMKsVukI6NhlgRtHwPPANQtd5QRRNeM3t81JqXYwEfsf0Xet
	045EStOpfayHC3sTBcTqXUghDqe9jfSZUC1SB2rB4Kfx6+3LLzF460ejAouyj4ZYOq1QhRWZDL/6W
	jgD9UOVTPjMXmIGHJoTJ0b5S1IhNt/NOsytbHSPb0VoGddzkdlRv36S5SkElPRXt/1EJe5lsAj9Tr
	Jxfx4n125M4GcAMOlbdRz0wCsZ1ksCn3uAhyHM4KhBirK6JjHccd4fT0qicGr3hA7MDkAetGFg560
	/mBxhssJDYzOSi/qUFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siXS0-000000073A4-1qKj;
	Mon, 26 Aug 2024 10:59:56 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siXPp-000000072Of-3pNq
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 10:57:43 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-371b97cfd6fso2613108f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 03:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724669859; x=1725274659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rUDYsNzKPDakoR8t1erMElmoWZbKHeQKwZAuEcREEvs=;
        b=vriYPIPo3zyxfiWY+eWjjgX4/Q0Cc/x/ZzDx41VsQcCYYmBqtDC5knoejMRHmyYNZ6
         goFx3kQqthZGv5zdmMt+92pcF30YdkS2EaaGQp4GSMRxFAx1TB2lErSBKFDZv7wfvddb
         oVnaJ82/cdq5JcsxI6rzSwV2vL2f6lYLSRGRgbpHerO0vG5VE0yroqo5ZLxCDSFv8hyu
         OIzv5A8p+uiUGxIAsds+04hVm4Uj13TnVTLtcy4KPJkPEt7bqjf0uBbXpJADPd5mo5re
         qnMtGxSbGEqAdA9iKSmWPZ4+CUPenCkkxIvziJBzNVzTDC/oSBQWM4Mw0QXmXN4LWWrW
         MB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724669859; x=1725274659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUDYsNzKPDakoR8t1erMElmoWZbKHeQKwZAuEcREEvs=;
        b=WW8IBMtjubGkDDWF4u5gOpNQflzHgbQNgCXQcQj+M6w98dRJ/lLQX6xbXUuPFrASZE
         EBa2X53Jfe254zkfekhlMGAVBpH+o8dXjWlPxgOnzNBL6Jzt9THm7oR7Q/kcUDiybeZF
         Na7wGXd5L0ns04D0pu/2/ynDyXFILOUNzpYWVP/0aI1rcDNOQlZu21ssL3R2owm8Tb1k
         3e96LP9pwKr3Jy5uMf4rRpyjafKo2TvG8d9zaoR2b3uFb4t1OKpZlBXuIv2JJlAQmuap
         llpJ45i6mGVdBACZ7OkhDTgNvgwlb5gajiff/i2NQocrLtVZ8YDn9UkgvEc5NWUcfrha
         TEaw==
X-Forwarded-Encrypted: i=1; AJvYcCXW1A5RJlxEtlHvdFUsa2TgR9WEZG/4bQd1GwkWufCHX1XoaIWHieMuqQ6DjMDuoAjiXUplymCqG/mmuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlFn90lHo5muRGPgzK91RCxHn1cntP6fP7Yc6pZ3xBUcDYzv8u
	vPBIohADe/S4k/xDaFKuhLG9cqo6LckAvUv/yK72gMPOrm25Edhw2YHuIGkz6m8=
X-Google-Smtp-Source: AGHT+IEsR1/6NVxEyhN6BHVWC4KeJ2FDaiiHGT5LpbIIwXcJ1VaPNCaPZhqmoLBgKfWmSJW1DiSBYA==
X-Received: by 2002:a5d:4583:0:b0:368:8015:8a96 with SMTP id ffacd0b85a97d-3731185f2f6mr6284586f8f.16.1724669859216;
        Mon, 26 Aug 2024 03:57:39 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308160586sm10511722f8f.58.2024.08.26.03.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:57:38 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes] riscv: Fix RISCV_ALTERNATIVE_EARLY
Date: Mon, 26 Aug 2024 12:57:37 +0200
Message-Id: <20240826105737.106879-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_035741_988582_753F3F58 
X-CRM114-Status: GOOD (  17.13  )
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

RISCV_ALTERNATIVE_EARLY will issue sbi_ecall() very early in the boot
process, before the first memory mapping is setup so we can't have any
instrumentation happening here.

In addition, when the kernel is relocatable, we must also not issue any
relocation this early since they would have been patched virtually only.

So, instead of disabling instrumentation for the whole kernel/sbi.c file
and compiling it with -fno-pie, simply move __sbi_ecall() and
__sbi_base_ecall() into their own file where this is fixed.

Fixes: 1745cfafebdf ("riscv: don't use global static vars to store alternative data")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h  |  2 ++
 arch/riscv/kernel/Makefile    |  6 ++++-
 arch/riscv/kernel/sbi.c       | 44 --------------------------------
 arch/riscv/kernel/sbi_ecall.c | 48 +++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 45 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi_ecall.c

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 7cffd4ffecd0..5843a10b380e 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -9,6 +9,7 @@
 
 #include <linux/types.h>
 #include <linux/cpumask.h>
+#include <linux/jump_label.h>
 
 #ifdef CONFIG_RISCV_SBI
 enum sbi_ext_id {
@@ -304,6 +305,7 @@ struct sbiret {
 };
 
 void sbi_init(void);
+long __sbi_base_ecall(int fid);
 struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
 			  unsigned long arg2, unsigned long arg3,
 			  unsigned long arg4, unsigned long arg5,
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 06d407f1b30b..7f88cc4931f5 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -20,17 +20,21 @@ endif
 ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
 CFLAGS_alternative.o := -mcmodel=medany
 CFLAGS_cpufeature.o := -mcmodel=medany
+CFLAGS_sbi_ecall.o := -mcmodel=medany
 ifdef CONFIG_FTRACE
 CFLAGS_REMOVE_alternative.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_cpufeature.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_sbi_ecall.o = $(CC_FLAGS_FTRACE)
 endif
 ifdef CONFIG_RELOCATABLE
 CFLAGS_alternative.o += -fno-pie
 CFLAGS_cpufeature.o += -fno-pie
+CFLAGS_sbi_ecall.o += -fno-pie
 endif
 ifdef CONFIG_KASAN
 KASAN_SANITIZE_alternative.o := n
 KASAN_SANITIZE_cpufeature.o := n
+KASAN_SANITIZE_sbi_ecall.o := n
 endif
 endif
 
@@ -88,7 +92,7 @@ obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
-obj-$(CONFIG_RISCV_SBI)		+= sbi.o
+obj-$(CONFIG_RISCV_SBI)		+= sbi.o sbi_ecall.o
 ifeq ($(CONFIG_RISCV_SBI), y)
 obj-$(CONFIG_SMP)		+= sbi-ipi.o
 obj-$(CONFIG_SMP) += cpu_ops_sbi.o
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 837bdab2601b..ace9e2f59c41 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -14,9 +14,6 @@
 #include <asm/smp.h>
 #include <asm/tlbflush.h>
 
-#define CREATE_TRACE_POINTS
-#include <asm/trace.h>
-
 /* default SBI version is 0.1 */
 unsigned long sbi_spec_version __ro_after_init = SBI_SPEC_VERSION_DEFAULT;
 EXPORT_SYMBOL(sbi_spec_version);
@@ -27,36 +24,6 @@ static int (*__sbi_rfence)(int fid, const struct cpumask *cpu_mask,
 			   unsigned long start, unsigned long size,
 			   unsigned long arg4, unsigned long arg5) __ro_after_init;
 
-struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
-			  unsigned long arg2, unsigned long arg3,
-			  unsigned long arg4, unsigned long arg5,
-			  int fid, int ext)
-{
-	struct sbiret ret;
-
-	trace_sbi_call(ext, fid);
-
-	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
-	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
-	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
-	register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
-	register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
-	register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
-	register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
-	register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
-	asm volatile ("ecall"
-		      : "+r" (a0), "+r" (a1)
-		      : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
-		      : "memory");
-	ret.error = a0;
-	ret.value = a1;
-
-	trace_sbi_return(ext, ret.error, ret.value);
-
-	return ret;
-}
-EXPORT_SYMBOL(__sbi_ecall);
-
 int sbi_err_map_linux_errno(int err)
 {
 	switch (err) {
@@ -535,17 +502,6 @@ long sbi_probe_extension(int extid)
 }
 EXPORT_SYMBOL(sbi_probe_extension);
 
-static long __sbi_base_ecall(int fid)
-{
-	struct sbiret ret;
-
-	ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
-	if (!ret.error)
-		return ret.value;
-	else
-		return sbi_err_map_linux_errno(ret.error);
-}
-
 static inline long sbi_get_spec_version(void)
 {
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_SPEC_VERSION);
diff --git a/arch/riscv/kernel/sbi_ecall.c b/arch/riscv/kernel/sbi_ecall.c
new file mode 100644
index 000000000000..24aabb4fbde3
--- /dev/null
+++ b/arch/riscv/kernel/sbi_ecall.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2024 Rivos Inc. */
+
+#include <asm/sbi.h>
+#define CREATE_TRACE_POINTS
+#include <asm/trace.h>
+
+long __sbi_base_ecall(int fid)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_BASE, fid, 0, 0, 0, 0, 0, 0);
+	if (!ret.error)
+		return ret.value;
+	else
+		return sbi_err_map_linux_errno(ret.error);
+}
+EXPORT_SYMBOL(__sbi_base_ecall);
+
+struct sbiret __sbi_ecall(unsigned long arg0, unsigned long arg1,
+			  unsigned long arg2, unsigned long arg3,
+			  unsigned long arg4, unsigned long arg5,
+			  int fid, int ext)
+{
+	struct sbiret ret;
+
+	trace_sbi_call(ext, fid);
+
+	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);
+	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);
+	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);
+	register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);
+	register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);
+	register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);
+	register uintptr_t a6 asm ("a6") = (uintptr_t)(fid);
+	register uintptr_t a7 asm ("a7") = (uintptr_t)(ext);
+	asm volatile ("ecall"
+		       : "+r" (a0), "+r" (a1)
+		       : "r" (a2), "r" (a3), "r" (a4), "r" (a5), "r" (a6), "r" (a7)
+		       : "memory");
+	ret.error = a0;
+	ret.value = a1;
+
+	trace_sbi_return(ext, ret.error, ret.value);
+
+	return ret;
+}
+EXPORT_SYMBOL(__sbi_ecall);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

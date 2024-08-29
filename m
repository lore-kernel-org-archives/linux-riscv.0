Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B99C87FC8
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 16:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ONXi7viF6JUFaX59BOxcnMdG52Mvmv6F0F6GoV7mikU=; b=CYWoaoHvmOFjIe
	rh7hEuKfVyTOupcM0EKqZ4dHUAAeGd6eBhz0RvLwZ4W/XJvFhMihVmQcu5Hi4gTJsVydTEkXj+Amn
	cF/YZ6V2XS5a7cuaUGn0uKlUoUtq/j8tbsfBpPPWiY+5/1dmgSg4ML86Jz9rh4E7WxzKne5k6/LPP
	wf3FMC7CsY53bQ3I4BeuRcxXKGmNEeyOUFCN0OF8bEU4uSzRqrjqzHaThQwQnGi/fQvEzWERkeJuX
	ILIsbTH4iv3WZusykaqwdvdiobAu/SjQ91V05G/kcFHkWWQAZuAJowIcma1GkxXg+JpadD+abQt2r
	T8DcaAs6qoOHimlznn7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjiMN-00000002tg0-3Bw7;
	Thu, 29 Aug 2024 16:50:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjiMJ-00000002teY-0X6i
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 16:50:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-371a13c7c80so1233465f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724950253; x=1725555053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNRo4pYlVhAaDob5jz389OO0K96/Tof4H7HpMWmLpCE=;
        b=YhyW63OlQsbw3CxrV4gs4z09BnVS9q8qO+k6OMu5/lNPgQrUJC8J975hMuLXNvSpUt
         HZOzZMxt07EdZ5Xpss6V8nDyKjcHev7WEn8c/Z9uXyatx809RSP3TkHIr1YMwKp2Fy9o
         Aff9AfuCvIwmV7j0zAil4qPeKp7rfAOg0KV6nDsskuw96m3rkGj69tbfJAnguAom0xRQ
         ApZMrnETzpJKCdZbZvM/YrcsTQP3i/89sOhh+HMn2ksC6uJvM3EblX01yblO0zytR4u1
         wv+M75qln843tP6MwEljkjuVrIg66CDSEgJlVqCnMqhdUkAhbGmcAZbXFu9OCqckEbFN
         ErIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724950253; x=1725555053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNRo4pYlVhAaDob5jz389OO0K96/Tof4H7HpMWmLpCE=;
        b=wDfRZn+Xjr2QupbMRXICX/RarMJLXSEZGb0Uhg38wd7hCKaGamIhzz74PST3EST59S
         65f43xtsMRpoxnjWt4vtdhf48sM8xa1xUkBmHQNf8+qn+H05BwigCWJzgZNGcgavi75f
         vyxaXmgeaPD5LMCQ6DHnoqdF6qARbBFqEot8eGG20tmi5C7KqW+b1BnDT+Xyk3xFX4Nu
         MZ8D6IUIItrnotZR+Wvt8QQgKWe3lAnsvqrJmBv2quJaXJC/S8mQGQZymbf8LOcnEujk
         8TQJ26dS8goQOsEXyXPHkpScGqwpUuI5HKGtOcniElOMgKt3VNDZQM4dvCBQqCPtVRMY
         od6w==
X-Forwarded-Encrypted: i=1; AJvYcCViyhBeNJ+VlRkJD5qStUggZ6YPK/9Kuo9V0I4CByys18WL3xjjBEA6j9Rh7QLHAZM5eg2FCl6+1Xr67g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfWi4f7oDOsBSQRPERpB1cDh9waxmAOauFpkEwETyYR69EBb4K
	YTcO1XDncfgeZEhVAQB1UShlu0UwVJ8FgK+FJvtXPapJxFiEw4Q8h7bMy6CQxnM=
X-Google-Smtp-Source: AGHT+IGiImxHTvG37n8UL0B/l76NzCvlfBmx0BJGM9uNrDMyVOCeNKcJXBtNbCYakEaAYL3zIFmgPw==
X-Received: by 2002:adf:fd81:0:b0:368:3562:7c76 with SMTP id ffacd0b85a97d-3749fe43401mr1919619f8f.3.1724950252528;
        Thu, 29 Aug 2024 09:50:52 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ef8adcbsm1852277f8f.71.2024.08.29.09.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:50:52 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	syzbot+cfbcb82adf6d7279fd35@syzkaller.appspotmail.com
Subject: [PATCH -fixes v2] riscv: Fix RISCV_ALTERNATIVE_EARLY
Date: Thu, 29 Aug 2024 18:50:48 +0200
Message-Id: <20240829165048.49756-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_095055_398108_9A15B37E 
X-CRM114-Status: GOOD (  18.56  )
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

Reported-by: Conor Dooley <conor.dooley@microchip.com>
Closes: https://lore.kernel.org/linux-riscv/20240813-pony-truck-3e7a83e9759e@spud/
Reported-by: syzbot+cfbcb82adf6d7279fd35@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-riscv/00000000000065062c061fcec37b@google.com/
Fixes: 1745cfafebdf ("riscv: don't use global static vars to store alternative data")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Changes in v2:
* Move sbi_err_map_linux_errno() in sbi.h (Samuel)

 arch/riscv/include/asm/sbi.h  | 20 ++++++++++-
 arch/riscv/kernel/Makefile    |  6 +++-
 arch/riscv/kernel/sbi.c       | 63 -----------------------------------
 arch/riscv/kernel/sbi_ecall.c | 48 ++++++++++++++++++++++++++
 4 files changed, 72 insertions(+), 65 deletions(-)
 create mode 100644 arch/riscv/kernel/sbi_ecall.c

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 7cffd4ffecd0..7bd3746028c9 100644
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
@@ -373,7 +375,23 @@ static inline unsigned long sbi_mk_version(unsigned long major,
 		| (minor & SBI_SPEC_VERSION_MINOR_MASK);
 }
 
-int sbi_err_map_linux_errno(int err);
+static inline int sbi_err_map_linux_errno(int err)
+{
+	switch (err) {
+	case SBI_SUCCESS:
+		return 0;
+	case SBI_ERR_DENIED:
+		return -EPERM;
+	case SBI_ERR_INVALID_PARAM:
+		return -EINVAL;
+	case SBI_ERR_INVALID_ADDRESS:
+		return -EFAULT;
+	case SBI_ERR_NOT_SUPPORTED:
+	case SBI_ERR_FAILURE:
+	default:
+		return -ENOTSUPP;
+	};
+}
 
 extern bool sbi_debug_console_available;
 int sbi_debug_console_write(const char *bytes, unsigned int num_bytes);
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
index 837bdab2601b..1989b8cade1b 100644
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
@@ -27,55 +24,6 @@ static int (*__sbi_rfence)(int fid, const struct cpumask *cpu_mask,
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
-int sbi_err_map_linux_errno(int err)
-{
-	switch (err) {
-	case SBI_SUCCESS:
-		return 0;
-	case SBI_ERR_DENIED:
-		return -EPERM;
-	case SBI_ERR_INVALID_PARAM:
-		return -EINVAL;
-	case SBI_ERR_INVALID_ADDRESS:
-		return -EFAULT;
-	case SBI_ERR_NOT_SUPPORTED:
-	case SBI_ERR_FAILURE:
-	default:
-		return -ENOTSUPP;
-	};
-}
-EXPORT_SYMBOL(sbi_err_map_linux_errno);
-
 #ifdef CONFIG_RISCV_SBI_V01
 static unsigned long __sbi_v01_cpumask_to_hartmask(const struct cpumask *cpu_mask)
 {
@@ -535,17 +483,6 @@ long sbi_probe_extension(int extid)
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

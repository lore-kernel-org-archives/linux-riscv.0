Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4EFD3C530
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 19:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFZBX8vkr81FFibP57OQskWxW+oVtSlLHV4z0Qau4Ho=; b=h7Wh2QtwE8t/Ny
	3CsfMxHt+QIXa5svBd/V0SMhaFadCpTvTmQePdgTdANvA8qs1cNAoru0Czgu7z+406ztGsdUOw58o
	bqjVejTgH/+Pd/T880VteknpECzUUILUBBsZ4c6JvKamR3HrPfbsYW72ebKzqza5cqvkMOuO/dhvi
	QBfOd73n1C42PwahGazKfw2BFSCf+Z9R2SnjKCgWxT3bwstW0rBhiczMTrS9kVpC0xBljcxz5Cyfl
	inCXWLk90v52Otf1RLmNL6dJRYrlyPZNFfLg8I1WbfLAdldoNoO2VjHCGCtE5wj3Bgx7u0r+gnoCP
	1DFy4Vqoo3usvaKbDevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vjp-0000000FxkI-2bqK;
	Thu, 17 Oct 2024 19:00:45 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vji-0000000FxgS-16Yd
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 19:00:40 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20c805a0753so11772615ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 12:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729191637; x=1729796437; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogonrlLXVsX6M3+rlqKepY1dG9PkImghSSy1s/qibR0=;
        b=q0bfvz/XkGwXRUoghnjn2TAYGluVdW6LHCO+GTi63wBmIUTmhlTbsQJcF3xK2E110m
         rISJ3AQm7z/syvr8JavWYoTM30yD4Ehx5Uks2xUDiYoSumjoT5Odp+RsNPVFhVxlInd+
         64u+JcMY4X/J16AJyJ9JTs7yFIfIyQWOihLkcHrP8Tn+RHoV8zljZ0ProyCGZq0g0k9k
         FnyjctiWFev1zZtOFvikBuO8ARNMvQhwQAZBWb4X1RtDS0SX155LAyg7QBAvcFe2ltGC
         7PtzzSoVd0rgQOJNz1G1AC/Iqdqrck3A2ZgMO13GsXcXlgnJbtJoACXxWnWWpoS5rU89
         uMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729191637; x=1729796437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogonrlLXVsX6M3+rlqKepY1dG9PkImghSSy1s/qibR0=;
        b=ArOmG4oOe4wHogFUeQ0jNfoqtGg3nxDzh5ID2YsoNFh3nYBLAZnAe85HW+jYRBHFPl
         E5V6jDb0R0w1Sns2G626EaBPWZCaKcrVSlKLzyeS0dDMJqXlRZKgUoyFqg1EM8PRhzuT
         R8UOvKbnafPJbbUEX9Pe9HEmp6ak5q3I5YNyVo1gpxMwd2gtD8rjp4qkIzaHdp+qG8Wq
         StFrSwsbP1v7RMECUmlpsogMkwx/LrSVJW+P+2IOeWbWDpIZzVIuTNxzrgf9vUO0oCgl
         HzO+mYOiIebbg6RJOX/GNdOqlvm8i3cAoM6UXT1D62BG/AedXnqc33pOC07Ihsxo6XeF
         nINw==
X-Forwarded-Encrypted: i=1; AJvYcCXNCg2I/1+vm2VYA6FyX+FJ7ILhdTkw1CwWaYfNQsXxBsGKePe341UudUGajaGPeAICftd9gNaovlUGnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwI7hCSM/H+o+w7CjfjmB1ZMFUGlirv10P1xUiecN30H0ooBxHO
	AF/N2E1Jj9W4uolZyZqq5U6XR0zJ55dC36wODHAE3ydiUhp/6Qgv2AturP0uUU0=
X-Google-Smtp-Source: AGHT+IGtsotcPt9N7zM25wfsZRy04iqy+fteSW/madU0GyC6QM/RMEa7M8aYdsNK2J6fNpkiAn+1Eg==
X-Received: by 2002:a17:903:2283:b0:20b:a10c:9bdf with SMTP id d9443c01a7336-20d27ed02f5mr114467135ad.32.1729191637057;
        Thu, 17 Oct 2024 12:00:37 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e55d7bf9a8sm217766a91.13.2024.10.17.12.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:00:36 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 17 Oct 2024 12:00:20 -0700
Subject: [PATCH v10 3/6] RISC-V: Replace RISCV_MISALIGNED with
 RISCV_SCALAR_MISALIGNED
MIME-Version: 1.0
Message-Id: <20241017-jesse_unaligned_vector-v10-3-5b33500160f8@rivosinc.com>
References: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
In-Reply-To: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4308; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=oS5AxBPQyGJnJ4mjuTj84YXbYf1uYCdG7DZp3yT92dA=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pg3BmmAxGrqwuXpP2u2O/hcdE5z/hSYtyy5/c1Hk+bc
 HrfznPnOkpZGMQ4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZiIwQyG/8m/1d+IHFCcXPB7
 6tKovL0HObaLWEg9Squ+sWm12I99sVWMDBv/mM+7mt7aIR9h8aaI8XXG15ceOW1ZZ/6ZMZz88e/
 KKVYA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_120038_595775_0EA8E909 
X-CRM114-Status: GOOD (  12.55  )
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

From: Jesse Taube <jesse@rivosinc.com>

Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED to allow
for the addition of RISCV_VECTOR_MISALIGNED in a later patch.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 arch/riscv/Kconfig                    | 6 +++---
 arch/riscv/include/asm/cpufeature.h   | 2 +-
 arch/riscv/include/asm/entry-common.h | 2 +-
 arch/riscv/kernel/Makefile            | 4 ++--
 arch/riscv/kernel/fpu.S               | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 939ea7f6a228..2d963d4a26d7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -765,7 +765,7 @@ config THREAD_SIZE_ORDER
 	  Specify the Pages of thread stack size (from 4KB to 64KB), which also
 	  affects irq stack size, which is equal to thread stack size.
 
-config RISCV_MISALIGNED
+config RISCV_SCALAR_MISALIGNED
 	bool
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	help
@@ -782,7 +782,7 @@ choice
 
 config RISCV_PROBE_UNALIGNED_ACCESS
 	bool "Probe for hardware unaligned access support"
-	select RISCV_MISALIGNED
+	select RISCV_SCALAR_MISALIGNED
 	help
 	  During boot, the kernel will run a series of tests to determine the
 	  speed of unaligned accesses. This probing will dynamically determine
@@ -793,7 +793,7 @@ config RISCV_PROBE_UNALIGNED_ACCESS
 
 config RISCV_EMULATED_UNALIGNED_ACCESS
 	bool "Emulate unaligned access where system support is missing"
-	select RISCV_MISALIGNED
+	select RISCV_SCALAR_MISALIGNED
 	help
 	  If unaligned memory accesses trap into the kernel as they are not
 	  supported by the system, the kernel will emulate the unaligned
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index dfa5cdddd367..ccc6cf141c20 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -59,7 +59,7 @@ void riscv_user_isa_enable(void);
 #define __RISCV_ISA_EXT_SUPERSET_VALIDATE(_name, _id, _sub_exts, _validate) \
 	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _validate)
 
-#if defined(CONFIG_RISCV_MISALIGNED)
+#if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
 bool check_unaligned_access_emulated_all_cpus(void);
 void check_unaligned_access_emulated(struct work_struct *work __always_unused);
 void unaligned_emulation_finish(void);
diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 2293e535f865..0a4e3544c877 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -25,7 +25,7 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 void handle_page_fault(struct pt_regs *regs);
 void handle_break(struct pt_regs *regs);
 
-#ifdef CONFIG_RISCV_MISALIGNED
+#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
 int handle_misaligned_load(struct pt_regs *regs);
 int handle_misaligned_store(struct pt_regs *regs);
 #else
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 7f88cc4931f5..45624c5ea86c 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -68,8 +68,8 @@ obj-y	+= probes/
 obj-y	+= tests/
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
-obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
-obj-$(CONFIG_RISCV_MISALIGNED)	+= unaligned_access_speed.o
+obj-$(CONFIG_RISCV_SCALAR_MISALIGNED)	+= traps_misaligned.o
+obj-$(CONFIG_RISCV_SCALAR_MISALIGNED)	+= unaligned_access_speed.o
 obj-$(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)	+= copy-unaligned.o
 
 obj-$(CONFIG_FPU)		+= fpu.o
diff --git a/arch/riscv/kernel/fpu.S b/arch/riscv/kernel/fpu.S
index 327cf527dd7e..f74f6b60e347 100644
--- a/arch/riscv/kernel/fpu.S
+++ b/arch/riscv/kernel/fpu.S
@@ -170,7 +170,7 @@ SYM_FUNC_END(__fstate_restore)
 	__access_func(f31)
 
 
-#ifdef CONFIG_RISCV_MISALIGNED
+#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
 
 /*
  * Disable compressed instructions set to keep a constant offset between FP
@@ -224,4 +224,4 @@ SYM_FUNC_START(get_f64_reg)
 	fp_access_epilogue
 SYM_FUNC_END(get_f64_reg)
 
-#endif /* CONFIG_RISCV_MISALIGNED */
+#endif /* CONFIG_RISCV_SCALAR_MISALIGNED */

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

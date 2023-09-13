Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630B3EE0211
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 21:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewzy+aRXBls/yvK/3L5wUQYDqWWhca3OeqkHS6S5K8k=; b=GoqKb1z6wttfhF
	6pk0nFlJnSwhzfknHkSwuMdcSsrCOXUvyIhI8UnXd4szGzWorOG6rwf46n/3ijLlCzH35F07qRSqP
	E5i3EBaV5/yN3NVKrzmQrkYcWKS3WGHdOgzaaEwJNOsnEB2F0KOp5B+68YO9sjA920/BOo0EE791Q
	ZuuzYZiTgIaph8svDihTF2YMh1J0mosNlagNuQmNEYU1g2I//ylhfUfHRg1Oq65OdZNMzEu5JzjA4
	RduKNqw7dYH+t2vRzadC5N12jjmMTbHbl9su7ZmcYD6IVjLbIxPwT/o5k5VG6LM5sP2+XBrCmL4Qn
	TijAL5xNz0j+v8xkWPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgX3V-006j8u-1a;
	Wed, 13 Sep 2023 21:05:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgX3R-006j5p-1j
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 21:05:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bf7423ef3eso1820375ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 14:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694639142; x=1695243942; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtSREAAsc0PfBIKOVZpOeKFMlctC6IiggFW+Cf905O0=;
        b=SXhZ9XNo4vhF5/dcFyFF+sQbgbaE6eRndESoeVvK19qvCPqS7rRzXlOmYsQcFYfufU
         HVbs/bByad5HDc6iW4ZHAjnc1hnehpmTaZOruN+S5LJVXxC5gdYNZYoD8yQ0SeKbFroe
         Nh2tnTI+BLQ6nIV4VS3i6gTm1LhGg/NMGSKOyz9eTtzApyFSWDgligfOfKm5DX6ukglg
         6fMO2xWHJBPhn/+mqyikYlx0oXpcTxskALg2wjz3eGHEuYPVxEelPRBOtVg08Tg5ItmA
         pVXNilcuO0KW5Rv+M7iuSWGk58AVn5CW14Y39HJqdKqsS7iC5Nuhim9GNylG/giJfEUJ
         mrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694639142; x=1695243942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtSREAAsc0PfBIKOVZpOeKFMlctC6IiggFW+Cf905O0=;
        b=m3Ft/1mNgNeMlL6vNySzbPx158S96IWuZRveHcTFihfCMBjrg6mw4yLRDD2jlDs56d
         TFQ15I95Gdn18944m2kr1D6mm0CztE3ZiIRt5D6cnUEhTdww1i8P8SmPmdi0vQXSB1+/
         xlmhVqcQq7bPveW/cYjxTikyz+BQ/aANqRpCLTS40OV+UVM6sl4DQ7LNNNZ2hCBJNFOF
         GieelwZFT48yO1sygXamEeDb4Dr6u9jWNEcSZ1UqaDQ7r3oFvWdiBOGIxr8pYtBpuzIo
         CalYClB0DPwh1nK9JOV0gO0gMSQ51PWDQ505yj/w2diaNbJpJQplOCA0du/6ryUePORZ
         dufQ==
X-Gm-Message-State: AOJu0YwU9tJu3t0fnS0zmIUhXFJAzhUardc47rbGPJvQ+aMjvW0CaVtT
	SgmjJ0ra0QVGexT1IVFMjDiJiOUsd7SJloL/oPM=
X-Google-Smtp-Source: AGHT+IHPv/vMc9Dxb8fCwIXYWHfUTJZjK2DX1bxPyMPPN672DPWOWr8BN7Fo+XQ7gtPWklS/0alodw==
X-Received: by 2002:a17:902:ab8d:b0:1b8:6cab:db7f with SMTP id f13-20020a170902ab8d00b001b86cabdb7fmr3666918plr.53.1694639142356;
        Wed, 13 Sep 2023 14:05:42 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id z16-20020a170903019000b001ab2b4105ddsm66323plg.60.2023.09.13.14.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 14:05:41 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Sep 2023 14:04:50 -0700
Subject: [PATCH 2/2] riscv: Add tests for riscv module loading
MIME-Version: 1.0
Message-Id: <20230913-module_relocations-v1-2-bb3d8467e793@rivosinc.com>
References: <20230913-module_relocations-v1-0-bb3d8467e793@rivosinc.com>
In-Reply-To: <20230913-module_relocations-v1-0-bb3d8467e793@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
Cc: Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_140545_598008_EF82783C 
X-CRM114-Status: GOOD (  16.75  )
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

Add test cases for the two main groups of relocations added: SUB and
SET.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig.debug                           |  1 +
 arch/riscv/kernel/Makefile                         |  1 +
 arch/riscv/kernel/tests/Kconfig.debug              | 32 +++++++++++
 arch/riscv/kernel/tests/Makefile                   |  1 +
 arch/riscv/kernel/tests/module_test/Makefile       | 11 ++++
 .../tests/module_test/test_module_linking_main.c   | 64 ++++++++++++++++++++++
 arch/riscv/kernel/tests/module_test/test_set16.S   | 23 ++++++++
 arch/riscv/kernel/tests/module_test/test_set32.S   | 20 +++++++
 arch/riscv/kernel/tests/module_test/test_set6.S    | 23 ++++++++
 arch/riscv/kernel/tests/module_test/test_set8.S    | 23 ++++++++
 arch/riscv/kernel/tests/module_test/test_sub16.S   | 22 ++++++++
 arch/riscv/kernel/tests/module_test/test_sub32.S   | 22 ++++++++
 arch/riscv/kernel/tests/module_test/test_sub6.S    | 22 ++++++++
 arch/riscv/kernel/tests/module_test/test_sub64.S   | 27 +++++++++
 arch/riscv/kernel/tests/module_test/test_sub8.S    | 22 ++++++++
 15 files changed, 314 insertions(+)

diff --git a/arch/riscv/Kconfig.debug b/arch/riscv/Kconfig.debug
index e69de29bb2d1..eafe17ebf710 100644
--- a/arch/riscv/Kconfig.debug
+++ b/arch/riscv/Kconfig.debug
@@ -0,0 +1 @@
+source "arch/riscv/kernel/tests/Kconfig.debug"
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 6ac56af42f4a..8310f62732fe 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -56,6 +56,7 @@ obj-y	+= stacktrace.o
 obj-y	+= cacheinfo.o
 obj-y	+= patch.o
 obj-y	+= probes/
+obj-y	+= tests/
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
diff --git a/arch/riscv/kernel/tests/Kconfig.debug b/arch/riscv/kernel/tests/Kconfig.debug
new file mode 100644
index 000000000000..05ca55fb4645
--- /dev/null
+++ b/arch/riscv/kernel/tests/Kconfig.debug
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "arch/riscv/kernel Testing and Coverage"
+
+menuconfig RUNTIME_KERNEL_TESTING_MENU
+       bool "arch/riscv/kernel runtime Testing"
+       def_bool y
+       help
+         Enable riscv kernel runtime testing.
+
+if RUNTIME_KERNEL_TESTING_MENU
+
+config RISCV_MODULE_LINKING_KUNIT
+       bool "KUnit test riscv module linking at runtime" if !KUNIT_ALL_TESTS
+       depends on KUNIT
+       default KUNIT_ALL_TESTS
+       help
+         Enable this option to test riscv module linking at boot. This will
+	 enable a module called "test_module_linking".
+
+         KUnit tests run during boot and output the results to the debug log
+         in TAP format (http://testanything.org/). Only useful for kernel devs
+         running the KUnit test harness, and not intended for inclusion into a
+         production build.
+
+         For more information on KUnit and unit tests in general please refer
+         to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+         If unsure, say N.
+
+endif # RUNTIME_TESTING_MENU
+
+endmenu # "arch/riscv/kernel runtime Testing"
diff --git a/arch/riscv/kernel/tests/Makefile b/arch/riscv/kernel/tests/Makefile
new file mode 100644
index 000000000000..7d6c76cffe20
--- /dev/null
+++ b/arch/riscv/kernel/tests/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_RISCV_MODULE_LINKING_KUNIT)	+= module_test/
diff --git a/arch/riscv/kernel/tests/module_test/Makefile b/arch/riscv/kernel/tests/module_test/Makefile
new file mode 100644
index 000000000000..4b54978468ec
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/Makefile
@@ -0,0 +1,11 @@
+obj-m += test_module_linking.o
+
+test_sub := test_sub6.o test_sub8.o test_sub16.o test_sub32.o test_sub64.o
+
+test_set := test_set6.o test_set8.o test_set16.o test_set32.o
+
+test_module_linking-objs += $(test_sub)
+
+test_module_linking-objs += $(test_set)
+
+test_module_linking-objs += test_module_linking_main.o
diff --git a/arch/riscv/kernel/tests/module_test/test_module_linking_main.c b/arch/riscv/kernel/tests/module_test/test_module_linking_main.c
new file mode 100644
index 000000000000..61e053520b83
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/test_module_linking_main.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Rivos Inc.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <kunit/test.h>
+
+MODULE_LICENSE("GPL");
+
+extern int test_set32(void);
+extern int test_set16(void);
+extern int test_set8(void);
+extern int test_set6(void);
+extern long test_sub64(void);
+extern int test_sub32(void);
+extern int test_sub16(void);
+extern int test_sub8(void);
+extern int test_sub6(void);
+
+#define CHECK_EQ(lhs, rhs) KUNIT_ASSERT_EQ(test, lhs, rhs)
+
+void run_test_set(struct kunit *test)
+{
+	int val32 = test_set32();
+	int val16 = test_set16();
+	int val8 = test_set8();
+	int val6 = test_set6();
+
+	CHECK_EQ(val32, 0);
+	CHECK_EQ(val16, 0);
+	CHECK_EQ(val8, 0);
+	CHECK_EQ(val6, 0);
+}
+
+void run_test_sub(struct kunit *test)
+{
+	int val64 = test_sub64();
+	int val32 = test_sub32();
+	int val16 = test_sub16();
+	int val8 = test_sub8();
+	int val6 = test_sub6();
+
+	CHECK_EQ(val64, 0);
+	CHECK_EQ(val32, 0);
+	CHECK_EQ(val16, 0);
+	CHECK_EQ(val8, 0);
+	CHECK_EQ(val6, 0);
+}
+
+static struct kunit_case __refdata riscv_module_linking_test_cases[] = {
+	KUNIT_CASE(run_test_set),
+	KUNIT_CASE(run_test_sub),
+	{}
+};
+
+static struct kunit_suite riscv_module_linking_test_suite = {
+	.name = "riscv_checksum",
+	.test_cases = riscv_module_linking_test_cases,
+};
+
+kunit_test_suites(&riscv_module_linking_test_suite);
diff --git a/arch/riscv/kernel/tests/module_test/test_set16.S b/arch/riscv/kernel/tests/module_test/test_set16.S
new file mode 100644
index 000000000000..2be0e441a12e
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/test_set16.S
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Rivos Inc.
+ */
+
+.text
+.global test_set16
+test_set16:
+	lw	a0, set16
+	la	t0, set16
+#ifdef CONFIG_32BIT
+	slli	t0, t0, 16
+	srli	t0, t0, 16
+#else
+	slli	t0, t0, 48
+	srli	t0, t0, 48
+#endif
+	sub	a0, a0, t0
+	ret
+.data
+set16:
+	.reloc set16, R_RISCV_SET16, set16
+	.word 0
diff --git a/arch/riscv/kernel/tests/module_test/test_set32.S b/arch/riscv/kernel/tests/module_test/test_set32.S
new file mode 100644
index 000000000000..de0444537e67
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/test_set32.S
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Rivos Inc.
+ */
+
+.text
+.global test_set32
+test_set32:
+	lw	a0, set32
+	la	t0, set32
+#ifndef CONFIG_32BIT
+	slli	t0, t0, 32
+	srli	t0, t0, 32
+#endif
+	sub	a0, a0, t0
+	ret
+.data
+set32:
+	.reloc set32, R_RISCV_SET32, set32
+	.word 0
diff --git a/arch/riscv/kernel/tests/module_test/test_set6.S b/arch/riscv/kernel/tests/module_test/test_set6.S
new file mode 100644
index 000000000000..c39ce4c219eb
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/test_set6.S
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Rivos Inc.
+ */
+
+.text
+.global test_set6
+test_set6:
+	lw	a0, set6
+	la	t0, set6
+#ifdef CONFIG_32BIT
+	slli	t0, t0, 26
+	srli	t0, t0, 26
+#else
+	slli	t0, t0, 58
+	srli	t0, t0, 58
+#endif
+	sub	a0, a0, t0
+	ret
+.data
+set6:
+	.reloc set6, R_RISCV_SET6, set6
+	.word 0
diff --git a/arch/riscv/kernel/tests/module_test/test_set8.S b/arch/riscv/kernel/tests/module_test/test_set8.S
new file mode 100644
index 000000000000..a656173f6f99
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/test_set8.S
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Rivos Inc.
+ */
+
+.text
+.global test_set8
+test_set8:
+	lw	a0, set8
+	la	t0, set8
+#ifdef CONFIG_32BIT
+	slli	t0, t0, 24
+	srli	t0, t0, 24
+#else
+	slli	t0, t0, 56
+	srli	t0, t0, 56
+#endif
+	sub	a0, a0, t0
+	ret
+.data
+set8:
+	.reloc set8, R_RISCV_SET8, set8
+	.word 0
diff --git a/arch/riscv/kernel/tests/module_test/test_sub16.S b/arch/riscv/kernel/tests/module_test/test_sub16.S
new file mode 100644
index 000000000000..c561e155d1db
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/test_sub16.S
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Rivos Inc.
+ */
+
+.text
+.global test_sub16
+test_sub16:
+	lh	a0, sub16
+	addi	a0, a0, -32
+	ret
+first:
+	.rept 8
+	.word 0
+	.endr
+second:
+
+.data
+sub16:
+	.reloc		sub16, R_RISCV_ADD16, second
+	.reloc		sub16, R_RISCV_SUB16, first
+	.half		0
diff --git a/arch/riscv/kernel/tests/module_test/test_sub32.S b/arch/riscv/kernel/tests/module_test/test_sub32.S
new file mode 100644
index 000000000000..93232c70cae6
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/test_sub32.S
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Rivos Inc.
+ */
+
+.text
+.global test_sub32
+test_sub32:
+	lw	a0, sub32
+	addi	a0, a0, -32
+	ret
+first:
+	.rept 8
+	.word 0
+	.endr
+second:
+
+.data
+sub32:
+	.reloc		sub32, R_RISCV_ADD32, second
+	.reloc		sub32, R_RISCV_SUB32, first
+	.word		0
diff --git a/arch/riscv/kernel/tests/module_test/test_sub6.S b/arch/riscv/kernel/tests/module_test/test_sub6.S
new file mode 100644
index 000000000000..d9c9526ceb62
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/test_sub6.S
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Rivos Inc.
+ */
+
+.text
+.global test_sub6
+test_sub6:
+	lb	a0, sub6
+	addi	a0, a0, -32
+	ret
+first:
+	.rept 8
+	.word 0
+	.endr
+second:
+
+.data
+sub6:
+	.reloc		sub6, R_RISCV_SET6, second
+	.reloc		sub6, R_RISCV_SUB6, first
+	.byte		0
diff --git a/arch/riscv/kernel/tests/module_test/test_sub64.S b/arch/riscv/kernel/tests/module_test/test_sub64.S
new file mode 100644
index 000000000000..6d260e2a5d98
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/test_sub64.S
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Rivos Inc.
+ */
+
+.text
+.global test_sub64
+test_sub64:
+#ifdef CONFIG_32BIT
+	lw	a0, sub64
+#else
+	ld	a0, sub64
+#endif
+	addi	a0, a0, -32
+	ret
+first:
+	.rept 8
+	.word 0
+	.endr
+second:
+
+.data
+sub64:
+	.reloc		sub64, R_RISCV_ADD64, second
+	.reloc		sub64, R_RISCV_SUB64, first
+	.word		0
+	.word		0
diff --git a/arch/riscv/kernel/tests/module_test/test_sub8.S b/arch/riscv/kernel/tests/module_test/test_sub8.S
new file mode 100644
index 000000000000..af7849115d4d
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/test_sub8.S
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Rivos Inc.
+ */
+
+.text
+.global test_sub8
+test_sub8:
+	lb	a0, sub8
+	addi	a0, a0, -32
+	ret
+first:
+	.rept 8
+	.word 0
+	.endr
+second:
+
+.data
+sub8:
+	.reloc		sub8, R_RISCV_ADD8, second
+	.reloc		sub8, R_RISCV_SUB8, first
+	.byte		0

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

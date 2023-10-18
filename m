Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64494CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 22:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoinRVnf9xO4RJe/e2QURocpfCGDhXD81XnGHkVUE3w=; b=txUubz8wk7sjZ5
	ShrTPhJF/Bs/mZGqg1nhyUOMF7Dv2IM6ALEKwUldSzUW2nCDv5qu9G9yXMP9YzM36x5PnUWbTai4A
	LGf2p0J30LW8gzmYlrCkDqYZ8LNy39vWjr1i3N/wOayFZ3Hfd23X8hfhifAlO+PHvY5e2JFo2kq5P
	8yof1tPuc2yi3mbrkC/d5GqoWgiQXVnSzmtMBZUsXHyxmtcFw7KvThz+7Vim4E/+0436DcqCEW1Xr
	8oS7fNLJNB+GIXXnTMU/jcTV9FJjcgPKJW/pt5sgenZeY2wIl8KWcyrEfdEzpWL65sv5pWWO/ReCD
	WezSvfQmx2tnZ98inavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtFNi-00Fr8U-1f;
	Wed, 18 Oct 2023 22:51:14 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtFNd-00Fr66-2H
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 22:51:13 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-581e819cf28so1103472eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 15:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697669468; x=1698274268; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozAkGUmu/g2vPdjYsuI5geKJqXaONTU37MWQT8rh8Io=;
        b=zZ+dMS9wQgef36g00w5ae8hggIU0pC8arFPcdTTptFKwEwTEKSEsoBw6Hn/JCUc41r
         x0UzoPtjRC7/h3S5OPFM7ukPxsWGLmjDvHcoGR/kRUE/GK4A9XdTNx/VxqGu8pP1vApa
         1O9JI2mzcAZz9xjaBxFKfpotMCS/IEY1HlEWj5yUl3EMoScGNd9+GRI22povg+g0sNZN
         1awfvHgC0imqqhJ7TfUEUGaso1KsZaBWw9jFCBf2jDH0DE5DcR8TmlyNuO6qJvrVsiuY
         a+W7bMA8J9BJJBiYynPWfTqJfTduPLrJu87n+etL0TujcchyQH5h2VCPAnLS8RP6GT2P
         iv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697669468; x=1698274268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozAkGUmu/g2vPdjYsuI5geKJqXaONTU37MWQT8rh8Io=;
        b=W/39dboqvZe5wy8nkD96xq+E/SQBSfraBxIsmgElFt/U00JcnypJObOzTejyiFu21b
         jL9+584lnDbSpk+eyaGIqo00flaJmI85npelsqyBo82okfVmUSn9rAzt9OXMGNtkqPZk
         GqaIvMKw0DHp866C0H/jqi3oSH3zqZMk9NKh2JO7nVxkKB8xmaoE9UDCZIsCSTd+aA8m
         OosKVoEAJ33dgIitj9y/wt17pzHBUV2jy4evXtIpcanAUYw9iULaMVqRAfvLw10QVCiD
         Dns0mJsUmxWv78FGYkVCyeBgfaQrNVdjuEmJxv9w5JrlU3wkcePIdRWb02iks8ly/H8Y
         N50A==
X-Gm-Message-State: AOJu0Yy3uOs6HIz6cgg8/b1NJ7JV8kPKcm/7nqtYyHbqLsmHD5zU6i9t
	eSmDhCkgU8TIFB1dTKT0c7kQBQ==
X-Google-Smtp-Source: AGHT+IHNA+QzIyRBjLZTBxsb6UeEKgsbDuMnE4kRFrzU3mKQZGgci8IZ+QjZBkEHu6Jx3kRgx05QMg==
X-Received: by 2002:a4a:c50c:0:b0:573:3fe0:cdd6 with SMTP id i12-20020a4ac50c000000b005733fe0cdd6mr553181ooq.6.1697669468275;
        Wed, 18 Oct 2023 15:51:08 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id r195-20020a4a37cc000000b00581e7506f2fsm641134oor.9.2023.10.18.15.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 15:51:07 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 18 Oct 2023 15:51:03 -0700
Subject: [PATCH v5 3/3] riscv: Add tests for riscv module loading
MIME-Version: 1.0
Message-Id: <20231018-module_relocations-v5-3-dfee32d4dfc3@rivosinc.com>
References: <20231018-module_relocations-v5-0-dfee32d4dfc3@rivosinc.com>
In-Reply-To: <20231018-module_relocations-v5-0-dfee32d4dfc3@rivosinc.com>
To: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_155109_745656_E515D257 
X-CRM114-Status: GOOD (  17.53  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Charlie Jenkins <charlie@rivosinc.com>, Andreas Schwab <schwab@linux-m68k.org>, Eric Biederman <ebiederm@xmission.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add test cases for the two main groups of relocations added: SUB and
SET, along with uleb128 which is a bit different because SUB and SET are
required to happen together.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig.debug                           |  1 +
 arch/riscv/kernel/Makefile                         |  1 +
 arch/riscv/kernel/tests/Kconfig.debug              | 35 +++++++++
 arch/riscv/kernel/tests/Makefile                   |  1 +
 arch/riscv/kernel/tests/module_test/Makefile       | 15 ++++
 .../tests/module_test/test_module_linking_main.c   | 85 ++++++++++++++++++++++
 arch/riscv/kernel/tests/module_test/test_set16.S   | 23 ++++++
 arch/riscv/kernel/tests/module_test/test_set32.S   | 20 +++++
 arch/riscv/kernel/tests/module_test/test_set6.S    | 23 ++++++
 arch/riscv/kernel/tests/module_test/test_set8.S    | 23 ++++++
 arch/riscv/kernel/tests/module_test/test_sub16.S   | 22 ++++++
 arch/riscv/kernel/tests/module_test/test_sub32.S   | 22 ++++++
 arch/riscv/kernel/tests/module_test/test_sub6.S    | 22 ++++++
 arch/riscv/kernel/tests/module_test/test_sub64.S   | 27 +++++++
 arch/riscv/kernel/tests/module_test/test_sub8.S    | 22 ++++++
 arch/riscv/kernel/tests/module_test/test_uleb128.S | 20 +++++
 16 files changed, 362 insertions(+)

diff --git a/arch/riscv/Kconfig.debug b/arch/riscv/Kconfig.debug
index e69de29bb2d1..eafe17ebf710 100644
--- a/arch/riscv/Kconfig.debug
+++ b/arch/riscv/Kconfig.debug
@@ -0,0 +1 @@
+source "arch/riscv/kernel/tests/Kconfig.debug"
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 95cf25d48405..bb99657252f4 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -57,6 +57,7 @@ obj-y	+= stacktrace.o
 obj-y	+= cacheinfo.o
 obj-y	+= patch.o
 obj-y	+= probes/
+obj-y	+= tests/
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
diff --git a/arch/riscv/kernel/tests/Kconfig.debug b/arch/riscv/kernel/tests/Kconfig.debug
new file mode 100644
index 000000000000..5dba64e8e977
--- /dev/null
+++ b/arch/riscv/kernel/tests/Kconfig.debug
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "arch/riscv/kernel Testing and Coverage"
+
+config AS_HAS_ULEB128
+	def_bool $(as-instr,.reloc label$(comma) R_RISCV_SET_ULEB128$(comma) 127\n.reloc label$(comma) R_RISCV_SUB_ULEB128$(comma) 127\nlabel:\n.word 0)
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
index 000000000000..d7a6fd8943de
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/Makefile
@@ -0,0 +1,15 @@
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
+ifeq ($(CONFIG_AS_HAS_ULEB128),y)
+test_module_linking-objs += test_uleb128.o
+endif
+
+test_module_linking-objs += test_module_linking_main.o
diff --git a/arch/riscv/kernel/tests/module_test/test_module_linking_main.c b/arch/riscv/kernel/tests/module_test/test_module_linking_main.c
new file mode 100644
index 000000000000..49820352f1df
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/test_module_linking_main.c
@@ -0,0 +1,85 @@
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
+MODULE_DESCRIPTION("Test module linking");
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
+#ifdef CONFIG_AS_HAS_ULEB128
+extern int test_uleb(void);
+#endif
+
+#define CHECK_EQ(lhs, rhs) KUNIT_ASSERT_EQ(test, lhs, rhs)
+
+void run_test_set(struct kunit *test);
+void run_test_sub(struct kunit *test);
+void run_test_uleb(struct kunit *test);
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
+#ifdef CONFIG_AS_HAS_ULEB128
+void run_test_uleb(struct kunit *test)
+{
+	int valuleb = test_uleb();
+
+	CHECK_EQ(valuleb, 0);
+}
+#endif
+
+static struct kunit_case __refdata riscv_module_linking_test_cases[] = {
+	KUNIT_CASE(run_test_set),
+	KUNIT_CASE(run_test_sub),
+#ifdef CONFIG_AS_HAS_ULEB128
+	KUNIT_CASE(run_test_uleb),
+#endif
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
diff --git a/arch/riscv/kernel/tests/module_test/test_uleb128.S b/arch/riscv/kernel/tests/module_test/test_uleb128.S
new file mode 100644
index 000000000000..db9f301092d0
--- /dev/null
+++ b/arch/riscv/kernel/tests/module_test/test_uleb128.S
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Rivos Inc.
+ */
+
+.text
+.global test_uleb
+test_uleb:
+	ld	a0, second
+	addi	a0, a0, -127
+	ret
+.data
+first:
+	.rept 127
+	.byte 0
+	.endr
+second:
+	.reloc second, R_RISCV_SET_ULEB128, second
+	.reloc second, R_RISCV_SUB_ULEB128, first
+	.dword 0

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

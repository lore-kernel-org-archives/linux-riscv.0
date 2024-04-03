Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C60CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gb+OB5bbRwddQfCw9t6khYuMjwyK+oCxJEWeJoOR/I8=; b=VQvm01XOw/jmIt
	rGqQQlRd/2ZZl/VCzWcGpfGZ2SFydHhhmTRrvF6ZaN7eQ98YTEHIe1u+K2WysQ2RPZ3mOkgk12KPS
	CFFWW90s+26ABtonFGw6TZnjC6X3rLScBjXqTLvepZ58R+rfNv3wUGaq2LOf2zeumT9JDoEQUI2Oc
	tTGlNWDdpzQnFlSKCr/+fxkaaNoWJq8f83gN/c/7Pv8PLvCGR7mcjOrEAwWUA0fWh5AQQyW27xcl/
	rntaim71MeSjST0IXwwJFUJIIBldOi2FZ0Ff87gRngZwHGP7nEAHrC1Csnaqcmvkj8+0B93D+pgGU
	yQ/AJWnRMW5byTaXh6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsANX-00000000ew9-0xDo;
	Wed, 03 Apr 2024 23:50:51 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsANT-00000000esu-19et
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:50:50 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-229b7ada9e8so236243fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712188245; x=1712793045; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BjQ9DxTSZlVH9DP6dgs1HodUGsGtzbmnUpujjVOtQj8=;
        b=jSoDbGdhvnfRh2avdsVZqYuvguN+SsYhpTPFRr0gFW+XcEWp+Y2hPreIfm9IFIZFZn
         ubgWL6r91Bm0/vY25Saxd3ljdBdPLoaBa34fw/9ATx47kgOBSmrkjUmVVXxVjWUqbCOG
         0AKY6R/pG4BeAysYhdYI0HTc18/PYrtXfubc4CfARDrLqXXlYDbmpKNFBPI0ehMJ08XI
         F2ZbTW1ihcQ5o7868SvkGnrzlB/Ww4kYxyt+aZygksUH38cVyXaAZ8Z/jxXMHgBc/u8X
         UCxYPTCeqUoVO7AdZ+l9StSQC1C7vZrn3ogqVL08OECpPwRDB3m4BcCxgilSzKvbhqmv
         KG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712188245; x=1712793045;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjQ9DxTSZlVH9DP6dgs1HodUGsGtzbmnUpujjVOtQj8=;
        b=e0KlSFgqC9TNRNnB6J4BKADU/EADo5qXSpCjeMCMLHufX8p/Rm4rgbII0809MvsmZb
         2i5JeXcxssL3Vwr55tj//unQlOA2DTeb3egoWe0EjzzK7zJUHaT0RJbdqxzVgRaJh0Yb
         LjjIDEa5tzDCwEhXno5htkl4IQTtMNQ6zdNw+bYMEc/WgOdMaP/LC7poPGzCa0NgN63J
         AllO0qJfNezKfaXwOgsqmDvMacyt4A36jElOBBWQWdOyJ2er+S2saCdrrN2sB+7eBHFw
         Ldw9ESw7Mqf5i4DJjTWIaqlm2rmyWHGOlXxhpt7ldNPagv38zdjiSXeipg8SIU8YT+eO
         0tZw==
X-Forwarded-Encrypted: i=1; AJvYcCVMYNkqyqN87z14qBx0RoHaCbGDfFXHRcr2Vo1WTJOMhhYRUMDaNHP3D1onNgeG4w2ZV8Y4QhysIyhURWmY5vBA3v+3a34RMw6LqdHQwKZ4
X-Gm-Message-State: AOJu0YzNZS14ir8Uffj91GU3LzIf363qjvXPfDJ0nsYlSuLzNW/ka/V/
	8sKyBWZKAA6c+io71XBh9OKaBUZyduU6mXfcBi7XrZXJF8aeI5s4He6zgJpiqRo=
X-Google-Smtp-Source: AGHT+IHjAXx1a8Huhn/8CyAzHYhBZMJfUNiw7lEDFVuWqXwpbQSe+8i7659rtws4stx/ns6wvAQ1rQ==
X-Received: by 2002:a05:6870:f113:b0:22e:8954:79e0 with SMTP id k19-20020a056870f11300b0022e895479e0mr910730oac.27.1712188244889;
        Wed, 03 Apr 2024 16:50:44 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fk23-20020a056a003a9700b006eac2c1187esm12396470pfb.69.2024.04.03.16.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:50:44 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 03 Apr 2024 16:50:29 -0700
Subject: [PATCH] riscv: selftests: Add signal handling vector tests
MIME-Version: 1.0
Message-Id: <20240403-vector_sigreturn_tests-v1-1-2e68b7a3b8d7@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAETrDWYC/x3MQQqAIBBA0avErBO0DKSrRITYaLOxmLEIorsnL
 d/i/wcEmVBgbB5gvEhozxWmbSBsPidUtFZDpzurre7VhaHsvAglxnJyXgpKEeWMcVH7MNjoocY
 HY6T7H0/z+358AMhUaAAAAA==
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andy Chiu <andy.chiu@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Vineet Gupta <vineetg@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712188243; l=4622;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=sjml5nKV165rpXbyrONuqdwpWxVpnj1/2NP5/i0pID8=;
 b=4iFK/GfVcZesnDl+zdr6iD0IGvm4qzOpnkoVTbipLNsG58jc957MZltjGAdMn1mOnR5S7NYNa
 vRE76Q28UMqADC3o7OVdl/8bmddTFGw77o8lQqW12vEowRDKKO0WIxs
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_165047_473405_9F5FC8D0 
X-CRM114-Status: GOOD (  16.64  )
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

Add two tests to check vector save/restore when a signal is received
during a vector routine. One test ensures that a value is not clobbered
during signal handling. The other verifies that vector registers
modified in the signal handler are properly reflected when the signal
handling is complete.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
These tests came about to highlight the bug fixed in
https://lore.kernel.org/lkml/20240403072638.567446-1-bjorn@kernel.org/
and will only pass with that fix applied.
---
 tools/testing/selftests/riscv/Makefile             |  2 +-
 tools/testing/selftests/riscv/sigreturn/.gitignore |  1 +
 tools/testing/selftests/riscv/sigreturn/Makefile   | 12 ++++
 .../testing/selftests/riscv/sigreturn/sigreturn.c  | 82 ++++++++++++++++++++++
 4 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
index 4a9ff515a3a0..7ce03d832b64 100644
--- a/tools/testing/selftests/riscv/Makefile
+++ b/tools/testing/selftests/riscv/Makefile
@@ -5,7 +5,7 @@
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 
 ifneq (,$(filter $(ARCH),riscv))
-RISCV_SUBTARGETS ?= hwprobe vector mm
+RISCV_SUBTARGETS ?= hwprobe vector mm sigreturn
 else
 RISCV_SUBTARGETS :=
 endif
diff --git a/tools/testing/selftests/riscv/sigreturn/.gitignore b/tools/testing/selftests/riscv/sigreturn/.gitignore
new file mode 100644
index 000000000000..35002b8ae780
--- /dev/null
+++ b/tools/testing/selftests/riscv/sigreturn/.gitignore
@@ -0,0 +1 @@
+sigreturn
diff --git a/tools/testing/selftests/riscv/sigreturn/Makefile b/tools/testing/selftests/riscv/sigreturn/Makefile
new file mode 100644
index 000000000000..eb8bac9279a8
--- /dev/null
+++ b/tools/testing/selftests/riscv/sigreturn/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2021 ARM Limited
+# Originally tools/testing/arm64/abi/Makefile
+
+CFLAGS += -I$(top_srcdir)/tools/include
+
+TEST_GEN_PROGS := sigreturn
+
+include ../../lib.mk
+
+$(OUTPUT)/sigreturn: sigreturn.c
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/sigreturn/sigreturn.c b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
new file mode 100644
index 000000000000..62397d5934f1
--- /dev/null
+++ b/tools/testing/selftests/riscv/sigreturn/sigreturn.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <ucontext.h>
+#include <linux/ptrace.h>
+#include "../../kselftest_harness.h"
+
+#define RISCV_V_MAGIC		0x53465457
+#define DEFAULT_VALUE		2
+#define SIGNAL_HANDLER_OVERRIDE	3
+
+static void simple_handle(int sig_no, siginfo_t *info, void *vcontext)
+{
+	ucontext_t *context = vcontext;
+
+	context->uc_mcontext.__gregs[REG_PC] = context->uc_mcontext.__gregs[REG_PC] + 4;
+}
+
+static void vector_override(int sig_no, siginfo_t *info, void *vcontext)
+{
+	ucontext_t *context = vcontext;
+
+	// vector state
+	struct __riscv_extra_ext_header *ext;
+	struct __riscv_v_ext_state *v_ext_state;
+
+	/* Find the vector context. */
+	ext = (void *)(&context->uc_mcontext.__fpregs);
+	if (ext->hdr.magic != RISCV_V_MAGIC) {
+		fprintf(stderr, "bad vector magic: %x\n", ext->hdr.magic);
+		abort();
+	}
+
+	v_ext_state = (void *)((char *)(ext) + sizeof(*ext));
+
+	*(int *)v_ext_state->datap = SIGNAL_HANDLER_OVERRIDE;
+
+	context->uc_mcontext.__gregs[REG_PC] = context->uc_mcontext.__gregs[REG_PC] + 4;
+}
+
+static int vector_sigreturn(int data, void (*handler)(int, siginfo_t *, void *))
+{
+	int after_sigreturn;
+	struct sigaction sig_action = {
+		.sa_sigaction = handler,
+		.sa_flags = SA_SIGINFO
+	};
+
+	sigaction(SIGSEGV, &sig_action, 0);
+
+	asm(".option push				\n\
+		.option		arch, +v		\n\
+		vsetivli	x0, 1, e32, ta, ma	\n\
+		vmv.s.x		v0, %1			\n\
+		# Generate SIGSEGV			\n\
+		lw		a0, 0(x0)		\n\
+		vmv.x.s		%0, v0			\n\
+		.option pop" : "=r" (after_sigreturn) : "r" (data));
+
+	return after_sigreturn;
+}
+
+TEST(vector_restore)
+{
+	int result;
+
+	result = vector_sigreturn(DEFAULT_VALUE, &simple_handle);
+
+	EXPECT_EQ(DEFAULT_VALUE, result);
+}
+
+TEST(vector_restore_signal_handler_override)
+{
+	int result;
+
+	result = vector_sigreturn(DEFAULT_VALUE, &vector_override);
+
+	EXPECT_EQ(SIGNAL_HANDLER_OVERRIDE, result);
+}
+
+TEST_HARNESS_MAIN

---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240403-vector_sigreturn_tests-8118f0ac54fa
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7DDC61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJvRQsYJjn+aX5rLOM4XVxRP/hFpZXT2ovyyq6BKbIU=; b=0K5MjbYGZrO87C
	s7MOT2y5QMJLu9zu85H3Q6vRniOyah/3hMmWTNtYdsvojGQsgxvf+rCHeLQBklN9lFuCO2UVMKut4
	XFdpG8IGEgczxcPCq2KntxXes88qoybefmimkfVYfdIKklBof/sJaWsRLKH8prMBhCjVuVLb4MtRN
	wKc+owgSBEyggMkZTd8Ddsfp2caNEBUn/YzeEvNpUA53KVx2J0BoON0n83KGjzW6II87N5hegxPB6
	ygdzUIOoFi1pJRMDkfjZ2hUEw6rBdLdZGCS5ofraGKgQEWVx1VwfiCRcCtBQhKbh355z5GpUnJXws
	WqoLv5VIXAMHDgIJKRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYq0-009d3b-9G; Tue, 21 Feb 2023 20:02:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYpz-009d2m-8F
	for linux-riscv@bombadil.infradead.org; Tue, 21 Feb 2023 20:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2Tqclwd4xuHoIstm7B9UCq8HRirfokgGB9GqloWqZiE=; b=mqz/bD/z6GBVcDXDZVpJ0PzLI8
	r2VVR7ubSulKuvzS2td8iQsFHJIFCrXVC2uoih7E72+Zdqf3RpXYawHaP4KjTMSKXRk6rO4E9D5Bs
	bfsXPDRspu2C1knUQSCLPdDGQ+mVip2Rl7po5sT+Sx3XNRRAkg2LYTWK5jF9xhyXWqntqS7YtA26X
	qQOzhtTaIJVXO1YUcXxgR2CzaE764MYyrYfu8QBg/qEcoxVeQXsoLMCUzXmpMWAnuGFREXgdJSEFA
	vPkTjyScCYsIZsmzgis5T28o4wCUzXhud/XPFpQQnhCV++PHHmWB64hRTcNF1nYBHrmCfn/Eo45K4
	sWIbd6+g==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUY1H-00CGXP-17
	for linux-riscv@lists.infradead.org;
	Tue, 21 Feb 2023 19:09:45 +0000
Received: by mail-pj1-x1036.google.com with SMTP id nw10-20020a17090b254a00b00233d7314c1cso6137669pjb.5
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Tqclwd4xuHoIstm7B9UCq8HRirfokgGB9GqloWqZiE=;
        b=Glob1piUQen2dFOUxlhvjRQj1tFTffF+lmacJDS8QehrlDVh4nBSsxUVpti29enOmc
         Ts3wco5RVkC/XsDz7hiLoMRoqNlJ2rz+fpVTLNlKx46nR+IUjT21SYM0Ta8uD1mbYVJm
         w7GE5FT6oG9+lb+XUNup35yMK+qbWTBvqvO9GWhSk0rnPafkitJM82jwEF3qiTZRreIZ
         cbO5Cq002Bt1cu2tKL1BJe973TcIvwMkBi/OdRgdFqY/S185mPI/l/1QANji5hwDdsxi
         48Y6Qv3FKj9BmZlRAjAFkMya5T7OSCx3dzUwzhKjoZbKxJcx/mKWejGjM2WIdYKbrso+
         YWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Tqclwd4xuHoIstm7B9UCq8HRirfokgGB9GqloWqZiE=;
        b=1Rt8YwWv0I2QB3Kw4Rudk2s9jo60D6EBl3Tjw3wcaWB1coP9SZLAQ7XXsNY2k/AffS
         a5NfC/QK7hWthvnoehouxHVymnBP8pyMPeCnpFCmHpTacaKn0Vf2DRVYj5X7cKJzoPI9
         j4RenEg8M99ODqDFMCoKcN2qXK2wdNogDyfoLLKcmDQi3MNIor8fAzQEUYAKb0Oi5FI6
         elhklE/alPiALy4GLnn50miriSx8TwUQEe2ElnXa6stY9rR4jJMZ06xyDVhO13x/+JiP
         byp1NlvrS0PPPKJUoXxZO06nE3gyQqiVWIQrjFbUbj7KEJ8OJUlR7W8VRJ3Bw6ByAI3O
         /eiw==
X-Gm-Message-State: AO0yUKWKxf5KfZ8LyJKM+JvKiqV15ZtRoKTDrwYY8NTKtuD0Bv2LYs1A
	vRZAGK9k6sqzHqge11RlAqiavw==
X-Google-Smtp-Source: AK7set8KKr96eBrj1R/guBqOwnlQKDGOKsi6FPJZIyeJcudjAKXfowybkO6ZGH2MC0wQPkyoqLAyrg==
X-Received: by 2002:a05:6a20:394f:b0:c0:df5b:e9e7 with SMTP id r15-20020a056a20394f00b000c0df5be9e7mr6407888pzg.60.1677006581159;
        Tue, 21 Feb 2023 11:09:41 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id b16-20020a170902b61000b0019602b2c00csm1583863pls.175.2023.02.21.11.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:40 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: heiko@sntech.de,
	Conor Dooley <conor@kernel.org>,
	slewis@rivosinc.com,
	vineetg@rivosinc.com,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 6/7] selftests: Test the new RISC-V hwprobe interface
Date: Tue, 21 Feb 2023 11:08:57 -0800
Message-Id: <20230221190858.3159617-7-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221190858.3159617-1-evan@rivosinc.com>
References: <20230221190858.3159617-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_190943_562423_FD8874A8 
X-CRM114-Status: GOOD (  28.16  )
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

This adds a test for the recently added RISC-V interface for probing
hardware capabilities.  It happens to be the first selftest we have for
RISC-V, so I've added some infrastructure for those as well.  The build
stuff looks pretty straight-forward, but there's also  a tiny C library
to avoid coupling this to any userspace implementation.

Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Evan Green <evan@rivosinc.com>

---

(no changes since v2)

Changes in v2:
 - Updated the selftests to the new API and added some more.
 - Fixed indentation, comments in .S, and general checkpatch complaints.


---
 tools/testing/selftests/Makefile              |  1 +
 tools/testing/selftests/riscv/Makefile        | 58 ++++++++++++
 .../testing/selftests/riscv/hwprobe/Makefile  | 10 +++
 .../testing/selftests/riscv/hwprobe/hwprobe.c | 89 +++++++++++++++++++
 .../selftests/riscv/hwprobe/sys_hwprobe.S     | 12 +++
 5 files changed, 170 insertions(+)
 create mode 100644 tools/testing/selftests/riscv/Makefile
 create mode 100644 tools/testing/selftests/riscv/hwprobe/Makefile
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 41b649452560..a599ef726310 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -62,6 +62,7 @@ TARGETS += pstore
 TARGETS += ptrace
 TARGETS += openat2
 TARGETS += resctrl
+TARGETS += riscv
 TARGETS += rlimits
 TARGETS += rseq
 TARGETS += rtc
diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
new file mode 100644
index 000000000000..32a72902d045
--- /dev/null
+++ b/tools/testing/selftests/riscv/Makefile
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0
+# Originally tools/testing/arm64/Makefile
+
+# When ARCH not overridden for crosscompiling, lookup machine
+ARCH ?= $(shell uname -m 2>/dev/null || echo not)
+
+ifneq (,$(filter $(ARCH),riscv))
+RISCV_SUBTARGETS ?= hwprobe
+else
+RISCV_SUBTARGETS :=
+endif
+
+CFLAGS := -Wall -O2 -g
+
+# A proper top_srcdir is needed by KSFT(lib.mk)
+top_srcdir = $(realpath ../../../../)
+
+# Additional include paths needed by kselftest.h and local headers
+CFLAGS += -I$(top_srcdir)/tools/testing/selftests/
+
+CFLAGS += $(KHDR_INCLUDES)
+
+export CFLAGS
+export top_srcdir
+
+all:
+	@for DIR in $(RISCV_SUBTARGETS); do				\
+		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
+		mkdir -p $$BUILD_TARGET;			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+	done
+
+install: all
+	@for DIR in $(RISCV_SUBTARGETS); do				\
+		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+	done
+
+run_tests: all
+	@for DIR in $(RISCV_SUBTARGETS); do				\
+		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+	done
+
+# Avoid any output on non riscv on emit_tests
+emit_tests: all
+	@for DIR in $(RISCV_SUBTARGETS); do				\
+		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+	done
+
+clean:
+	@for DIR in $(RISCV_SUBTARGETS); do				\
+		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
+	done
+
+.PHONY: all clean install run_tests emit_tests
diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
new file mode 100644
index 000000000000..ebdbb3c22e54
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2021 ARM Limited
+# Originally tools/testing/arm64/abi/Makefile
+
+TEST_GEN_PROGS := hwprobe
+
+include ../../lib.mk
+
+$(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
+	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
new file mode 100644
index 000000000000..ddfb61de2938
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <asm/hwprobe.h>
+
+/*
+ * Rather than relying on having a new enough libc to define this, just do it
+ * ourselves.  This way we don't need to be coupled to a new-enough libc to
+ * contain the call.
+ */
+long riscv_hwprobe(struct riscv_hwprobe *pairs, long pair_count,
+		   long cpu_count, unsigned long *cpus, unsigned long flags);
+
+int main(int argc, char **argv)
+{
+	struct riscv_hwprobe pairs[8];
+	unsigned long cpus;
+	long out;
+
+	/* Fake the CPU_SET ops. */
+	cpus = -1;
+
+	/*
+	 * Just run a basic test: pass enough pairs to get up to the base
+	 * behavior, and then check to make sure it's sane.
+	 */
+	for (long i = 0; i < 8; i++)
+		pairs[i].key = i;
+	out = riscv_hwprobe(pairs, 8, 1, &cpus, 0);
+	if (out != 0)
+		return -1;
+	for (long i = 0; i < 4; ++i) {
+		/* Fail if the kernel claims not to recognize a base key. */
+		if ((i < 4) && (pairs[i].key != i))
+			return -2;
+
+		if (pairs[i].key != RISCV_HWPROBE_KEY_BASE_BEHAVIOR)
+			continue;
+
+		if (pairs[i].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA)
+			continue;
+
+		return -3;
+	}
+
+	/*
+	 * This should also work with a NULL CPU set, but should not work
+	 * with an improperly supplied CPU set.
+	 */
+	out = riscv_hwprobe(pairs, 8, 0, 0, 0);
+	if (out != 0)
+		return -4;
+
+	out = riscv_hwprobe(pairs, 8, 0, &cpus, 0);
+	if (out == 0)
+		return -5;
+
+	out = riscv_hwprobe(pairs, 8, 1, 0, 0);
+	if (out == 0)
+		return -6;
+
+	/*
+	 * Check that keys work by providing one that we know exists, and
+	 * checking to make sure the resultig pair is what we asked for.
+	 */
+	pairs[0].key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR;
+	out = riscv_hwprobe(pairs, 1, 1, &cpus, 0);
+	if (out != 0)
+		return -7;
+	if (pairs[0].key != RISCV_HWPROBE_KEY_BASE_BEHAVIOR)
+		return -8;
+
+	/*
+	 * Check that an unknown key gets overwritten with -1,
+	 * but doesn't block elements after it.
+	 */
+	pairs[0].key = 0x5555;
+	pairs[1].key = 1;
+	pairs[1].value = 0xAAAA;
+	out = riscv_hwprobe(pairs, 2, 0, 0, 0);
+	if (out != 0)
+		return -9;
+
+	if (pairs[0].key != -1)
+		return -10;
+
+	if ((pairs[1].key != 1) || (pairs[1].value == 0xAAAA))
+		return -11;
+
+	return 0;
+}
diff --git a/tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S b/tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S
new file mode 100644
index 000000000000..ed8d28863b27
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/sys_hwprobe.S
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2022 Rivos, Inc */
+
+.text
+.global riscv_hwprobe
+riscv_hwprobe:
+	# Put __NR_riscv_hwprobe in the syscall number register, then just shim
+	# back the kernel's return.  This doesn't do any sort of errno
+	# handling, the caller can deal with it.
+	li a7, 258
+	ecall
+	ret
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

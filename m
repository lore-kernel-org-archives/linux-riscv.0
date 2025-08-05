Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A647FC87FDA
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 19:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rj74oY6kKRv7n2xNZj9PXMiJnRgjKkuJpn4Jz9gog98=; b=yyrWdxOdWGZU1p
	r8PchFCzuOf6zvrjDhxm0UGu6td6bqIxVhpG5VONX4wJfqSGRKuAWfmSfevwFIpjeXDWO6aGan/GR
	/OSpxksG7S6V7RnIXs4uaiZa9I67NmhgWjrOuJ2l1pegJiMMe1yNfTIIZ+o5zYsWxkZYyLkLntpjQ
	10uKqrrRF5GfNsPz4TMQPxwAkEbSmwJgqBWkjsgZR6OyArNSNviXMylXB/3U3oQ8JMF22pl9lZV3x
	lx+fu83+xxYbYwqL0zPYMKLVh7krS6PXkjsub8659x8EKdkW8NPe+VOt2T/of5J/QLX9msbI8GREk
	CsZKaiIyyapCRBxKPFUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujNWG-0000000Dgmv-0qD6;
	Tue, 05 Aug 2025 19:40:20 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujNWC-0000000Dgiv-274m
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 19:40:18 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7e6399d0654so318053385a.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Aug 2025 12:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754422815; x=1755027615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vL4PFY0aOH8JnUAWFk8/IxlbUSq0aZKvwKplwC4IJQE=;
        b=DRkWLU1SzSteZVxT6uZbvJnt3PhYaZn88TE0YCxsJBrHiONmSbvmUcsqEp2JevKs3J
         T/Ga69NoX8BTOPtFXkd48lj7Lbr4oXa7DKjIme8jnF7wxiz7i09o5cNjGM27RgM8btF8
         gwwRccS6egEJ79L3fz7kHDGbJOIwzY0q27/bbYXDv4t+/8a77rwX4jDJ9/EL+yRFwFyM
         EByrdDJzHqLglpZjgTS+cil0P4laxCuGvwAUZj2bA0+X4wt5WxWNx8BJk8tX0p4kn57t
         Q+HUuIcPmsIF/Jm9c76JvNR4N+VCoweMXmkv/Yv8H6mq2v2ZXdtuWMRdkVXjDQp85KAq
         HYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754422815; x=1755027615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vL4PFY0aOH8JnUAWFk8/IxlbUSq0aZKvwKplwC4IJQE=;
        b=puJcH/6Q+n8zgRv5H85zrPM0mImOqGfnXNb1AqSbMqwdD7+c6m/FGmlJJo68hI/Vj7
         cqbAcqyh7PmIsXFouB64j7ff+dtkE58/SUtX5zXopyHcz6cnG8XRTkWVui04i6Zs/oQY
         nxeNylco+mUzEpKz+W4L8OciCgZnq1OmqnOyS0HzkLiwufmRUkiPrY83XtxIVYfEypwV
         ujG64E8IcrGs8tf+p/Z7u7zJyu88tQNnI8VVgGzLE+erNDnjboZr7XJsILAFr7OVSSXX
         EZivBycDINyvSi6TCERmv+13Brg8Y3PK9mSIC/HLpqiu9BYpSM/S9IYAFqMcVp0aczRS
         q0Ow==
X-Gm-Message-State: AOJu0YyzHIyKVJt349PJth1JV8OS93kxZ2Iq1Y5HwJXftjgj4eLbbGIQ
	L87Q8XoKuS/kLeMoARASebNAyd8d9xoOLlKZ0iaUU7fCNwF7dkfd9O0FbEizFgLXwnWyZMFSsqT
	loQqB
X-Gm-Gg: ASbGncsUk7yA8plQrkAZPEeIbE8ZBUuowGrFEc1GcvRHdcEhJLx4bXRMisGRras933f
	jPDFNjX833wHW96mHR4eTFvKeh/nStDnMhI3iAzIp42kd2HhPUCCNis5JfJnjPAoexb41sEuTyX
	wzk1NK+P8zsCeq3lU4XSpg4c3XCgcfytLYiYTqq35n6rcaVzOQxX+8XquUdy0UMlEFvTr7oENs9
	x168IW2wppjQNHjV/CJprFckKeNTX0aybqSB56srjJL5gxsIB/OwtGRlywiVQE6xzjHUJVEK6+b
	au2fGON/WqoJCt8+prc5ZV6ErT7uawKLtCrUFkeWsaeYgEA+RVS3tSpZ2p22W5I97qysyieKk6l
	tFRGLKVFfbcW/IuPI5H/c1CVH2xsuv+9secLcPXIkBFTmO/KOHFLhIwg0/DidEOFSuenNo8f3Jg
	+RNFM2Y68y5Fo2Ppq8
X-Google-Smtp-Source: AGHT+IGXS15aibedECz6CkDF0iaK6CSzoEd5PRNEgnuhiSDuN9qkS/vQpcn9djWvm2zxOAxHWnrvxg==
X-Received: by 2002:a05:620a:aa09:b0:7e6:969e:c54 with SMTP id af79cd13be357-7e814e175f0mr73691085a.63.1754422815267;
        Tue, 05 Aug 2025 12:40:15 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f7064b0sm717855685a.54.2025.08.05.12.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 12:40:15 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Jesse Taube <jesse@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley  <conor.dooley@microchip.com>,
	Deepak Gupta  <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	WangYuli <wangyuli@uniontech.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Nylon Chen <nylon.chen@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 8/8] selftests: riscv: Add test for hardware breakpoints
Date: Tue,  5 Aug 2025 12:39:55 -0700
Message-ID: <20250805193955.798277-9-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250805193955.798277-1-jesse@rivosinc.com>
References: <20250805193955.798277-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_124016_615212_F6BD4249 
X-CRM114-Status: GOOD (  26.34  )
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

Add riscv specific selftest for hardhardware breakpoints.
These tests are based on:
tools/testing/selftests/breakpoints/breakpoint_test_arm64.c

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
The selftest fails as register_user_hw_breakpoint seemingly does not
call arch_install_hw_breakpoint. The test also seems to fail on arm64
in the same way when I tested it.

RFC -> V1:
 - New commit
---
 tools/perf/tests/tests.h                      |   3 +-
 tools/testing/selftests/riscv/Makefile        |   2 +-
 .../selftests/riscv/breakpoints/.gitignore    |   1 +
 .../selftests/riscv/breakpoints/Makefile      |  12 +
 .../riscv/breakpoints/breakpoint_test.c       | 246 ++++++++++++++++++
 5 files changed, 262 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/breakpoints/.gitignore
 create mode 100644 tools/testing/selftests/riscv/breakpoints/Makefile
 create mode 100644 tools/testing/selftests/riscv/breakpoints/breakpoint_test.c

diff --git a/tools/perf/tests/tests.h b/tools/perf/tests/tests.h
index 8aea344536b8..5ff35304c11a 100644
--- a/tools/perf/tests/tests.h
+++ b/tools/perf/tests/tests.h
@@ -183,7 +183,8 @@ DECLARE_SUITE(util);
  * Just disable the test for these architectures until these issues are
  * resolved.
  */
-#if defined(__powerpc__) || defined(__s390x__) || defined(__arm__) || defined(__aarch64__)
+#if defined(__powerpc__) || defined(__s390x__) || defined(__arm__) || defined(__aarch64__) || \
+    defined(__riscv)
 #define BP_SIGNAL_IS_SUPPORTED 0
 #else
 #define BP_SIGNAL_IS_SUPPORTED 1
diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
index 099b8c1f46f8..96aba246cb3e 100644
--- a/tools/testing/selftests/riscv/Makefile
+++ b/tools/testing/selftests/riscv/Makefile
@@ -5,7 +5,7 @@
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 
 ifneq (,$(filter $(ARCH),riscv))
-RISCV_SUBTARGETS ?= abi hwprobe mm sigreturn vector
+RISCV_SUBTARGETS ?= abi hwprobe mm sigreturn vector breakpoints
 else
 RISCV_SUBTARGETS :=
 endif
diff --git a/tools/testing/selftests/riscv/breakpoints/.gitignore b/tools/testing/selftests/riscv/breakpoints/.gitignore
new file mode 100644
index 000000000000..9b3193d06608
--- /dev/null
+++ b/tools/testing/selftests/riscv/breakpoints/.gitignore
@@ -0,0 +1 @@
+breakpoint_test
diff --git a/tools/testing/selftests/riscv/breakpoints/Makefile b/tools/testing/selftests/riscv/breakpoints/Makefile
new file mode 100644
index 000000000000..91e1c02c0073
--- /dev/null
+++ b/tools/testing/selftests/riscv/breakpoints/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2021 ARM Limited
+# Originally tools/testing/arm64/abi/Makefile
+
+CFLAGS += -I$(top_srcdir)/tools/include
+
+TEST_GEN_PROGS := breakpoint_test
+
+include ../../lib.mk
+
+$(OUTPUT)/breakpoint_test: breakpoint_test.c
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/breakpoints/breakpoint_test.c b/tools/testing/selftests/riscv/breakpoints/breakpoint_test.c
new file mode 100644
index 000000000000..faeecc72da12
--- /dev/null
+++ b/tools/testing/selftests/riscv/breakpoints/breakpoint_test.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2016 Google, Inc.
+ *
+ * Original Code by Pavel Labath <labath@google.com>
+ *
+ * Code modified by Pratyush Anand <panand@redhat.com>
+ * for testing different byte select for each access size.
+ * Originally tools/testing/selftests/breakpoints/breakpoint_test_arm64.c
+ */
+
+#define _GNU_SOURCE
+
+#include <asm/ptrace.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <sys/ptrace.h>
+#include <sys/param.h>
+#include <sys/uio.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <string.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <elf.h>
+#include <errno.h>
+#include <signal.h>
+
+#include "../../kselftest.h"
+
+#define MAX_BP_SIZE 8
+
+static volatile uint8_t var[3*MAX_BP_SIZE] __attribute__((__aligned__(MAX_BP_SIZE)));
+
+static void child(int size, int wr)
+{
+	volatile uint8_t *addr = &var[MAX_BP_SIZE + wr];
+
+	if (ptrace(PTRACE_TRACEME, 0, NULL, NULL) != 0) {
+		ksft_print_msg(
+			"ptrace(PTRACE_TRACEME) failed: %s\n",
+			strerror(errno));
+		_exit(1);
+	}
+
+	if (raise(SIGSTOP) != 0) {
+		ksft_print_msg(
+			"raise(SIGSTOP) failed: %s\n", strerror(errno));
+		_exit(1);
+	}
+
+	if ((uintptr_t) addr % size) {
+		ksft_print_msg(
+			 "Wrong address write for the given size: %s\n",
+			 strerror(errno));
+		_exit(1);
+	}
+
+	switch (size) {
+	case 1:
+		*addr = 47;
+		break;
+	case 2:
+		*(uint16_t *)addr = 47;
+		break;
+	case 4:
+		*(uint32_t *)addr = 47;
+		break;
+	case 8:
+		*(uint64_t *)addr = 47;
+		break;
+	}
+
+	_exit(0);
+}
+
+static bool set_watchpoint(pid_t pid, int size, int wp)
+{
+	const volatile uint8_t *addr = &var[MAX_BP_SIZE + wp];
+	const int offset = (uintptr_t)addr % 8;
+	const unsigned int type = 2; /* Write */
+	const unsigned int enable = 1;
+	struct __riscv_hwdebug_state debug_state;
+	struct iovec iov;
+
+	memset(&debug_state, 0, sizeof(debug_state));
+	debug_state.addr = (uintptr_t)(addr - offset);
+	debug_state.len = size;
+	debug_state.ctrl = enable;
+	debug_state.type = type;
+	iov.iov_base = &debug_state;
+	iov.iov_len = sizeof(debug_state);
+	if (ptrace(PTRACE_SETREGSET, pid, NT_RISCV_HW_BREAK, &iov) == 0)
+		return true;
+
+	if (errno == EIO)
+		ksft_print_msg(
+			"ptrace(PTRACE_SETREGSET, NT_RISCV_HW_BREAK) not supported on this hardware: %s\n",
+			strerror(errno));
+
+	ksft_print_msg(
+		"ptrace(PTRACE_SETREGSET, NT_RISCV_HW_BREAK) failed: %s\n",
+		strerror(errno));
+	return false;
+}
+
+static bool run_test(int wr_size, int wp_size, int wr, int wp)
+{
+	int status;
+	siginfo_t siginfo;
+	pid_t pid = fork();
+	pid_t wpid;
+
+	if (pid < 0) {
+		ksft_test_result_fail(
+			"fork() failed: %s\n", strerror(errno));
+		return false;
+	}
+	if (pid == 0)
+		child(wr_size, wr);
+
+	wpid = waitpid(pid, &status, __WALL);
+	if (wpid != pid) {
+		ksft_print_msg(
+			"waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+	if (!WIFSTOPPED(status)) {
+		ksft_print_msg(
+			"child did not stop: %s\n", strerror(errno));
+		return false;
+	}
+	if (WSTOPSIG(status) != SIGSTOP) {
+		ksft_print_msg("child did not stop with SIGSTOP\n");
+		return false;
+	}
+
+	if (!set_watchpoint(pid, wp_size, wp))
+		return false;
+
+	if (ptrace(PTRACE_CONT, pid, NULL, NULL) < 0) {
+		ksft_print_msg(
+			"ptrace(PTRACE_CONT) failed: %s\n",
+			strerror(errno));
+		return false;
+	}
+
+	alarm(3);
+	wpid = waitpid(pid, &status, __WALL);
+	if (wpid != pid) {
+		ksft_print_msg(
+			"waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+	alarm(0);
+	if (WIFEXITED(status)) {
+		ksft_print_msg("child exited prematurely\n");
+		return false;
+	}
+	if (!WIFSTOPPED(status)) {
+		ksft_print_msg("child did not stop\n");
+		return false;
+	}
+	if (WSTOPSIG(status) != SIGTRAP) {
+		ksft_print_msg("child did not stop with SIGTRAP\n");
+		return false;
+	}
+	if (ptrace(PTRACE_GETSIGINFO, pid, NULL, &siginfo) != 0) {
+		ksft_print_msg(
+			"ptrace(PTRACE_GETSIGINFO): %s\n",
+			strerror(errno));
+		return false;
+	}
+	if (siginfo.si_code != TRAP_HWBKPT) {
+		ksft_print_msg(
+			"Unexpected si_code %d\n", siginfo.si_code);
+		return false;
+	}
+
+	kill(pid, SIGKILL);
+	wpid = waitpid(pid, &status, 0);
+	if (wpid != pid) {
+		ksft_print_msg(
+			"waitpid() failed: %s\n", strerror(errno));
+		return false;
+	}
+	return true;
+}
+
+static void sigalrm(int sig)
+{
+}
+
+int main(int argc, char **argv)
+{
+	int opt;
+	bool succeeded = true;
+	struct sigaction act;
+	int wr, wp, size;
+	bool result;
+
+	ksft_print_header();
+	ksft_set_plan(213);
+
+	act.sa_handler = sigalrm;
+	sigemptyset(&act.sa_mask);
+	act.sa_flags = 0;
+	sigaction(SIGALRM, &act, NULL);
+	for (size = 1; size <= MAX_BP_SIZE; size = size*2) {
+		for (wr = 0; wr <= MAX_BP_SIZE; wr = wr + size) {
+			for (wp = wr - size; wp <= wr + size; wp = wp + size) {
+				result = run_test(size, MIN(size, 8), wr, wp);
+				if ((result && wr == wp) ||
+				    (!result && wr != wp))
+					ksft_test_result_pass(
+						"Test size = %d write offset = %d watchpoint offset = %d\n",
+						size, wr, wp);
+				else {
+					ksft_test_result_fail(
+						"Test size = %d write offset = %d watchpoint offset = %d\n",
+						size, wr, wp);
+					succeeded = false;
+				}
+			}
+		}
+	}
+
+	for (size = 1; size <= MAX_BP_SIZE; size = size*2) {
+		if (run_test(size, 8, -size, -8))
+			ksft_test_result_pass(
+				"Test size = %d write offset = %d watchpoint offset = -8\n",
+				size, -size);
+		else {
+			ksft_test_result_fail(
+				"Test size = %d write offset = %d watchpoint offset = -8\n",
+				size, -size);
+			succeeded = false;
+		}
+	}
+
+	if (succeeded)
+		ksft_exit_pass();
+	else
+		ksft_exit_fail();
+}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B75C88E50
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99/HiyCCM/9MI0FbSKmAa8ogsxy45BLjPZD88peEKWk=; b=Rqjr5LCKDzuy26
	1zux63xieXaIbkhDYJ8OMZfE0GWWOt6xJiQbKYeBQ6EGLD8if/Ohokq/x55uRzlqEzbCT3o6oZUKi
	ZulcckN6d/atfdQJ7wH40yZQ13UIvrnn/GrYvMOBI/7DKs9eUx9OBebYCR546or6rx5V/iAwOYsgp
	83ooy+lTEIN4VKgbnM9FsB5fZivTnt3bHQ2rZwLdYr+lTLmZggPSdfvd2hTkA5xPQU4GqHM9ugICR
	PlLuluYtrY9f0S7lG4YNqUuNs0/pT4LePE6RnXRefvU5nfg6Li2Lx8oamiI4jser5lkFt+kasSZIc
	TiFSjhnNtjtRYmBMagXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50DI-0000000GcAP-3KJg;
	Fri, 11 Sep 2026 12:18:40 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50DB-0000000Gc5I-426Q
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 12:18:40 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccafb752so828563a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 05:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789129113; x=1789733913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uPqiENyHK/eI6mIkd6EtYTrMG0xLQpwgJVbdDlAHxyc=;
        b=BzGhVwL00yKv+jtdERtXJ1BszeTc79JT4mg5NoU71Yx70QokgkalvXgCSfGzGwDWlw
         HyFXKUpgxYrExdpCETlkp09Yfq1T/xBruxu61iWeN0kwYQhVJ02SYytg/LqwBV116WEu
         oSqEpwuLJfAjyAKNZAN6/TZ8URH4KQeDe9Vl01uo3RNC2Ku3LN0VVIrERBPdE/gO8ufc
         7U9kDz492Wk4zjQvwkFzjzGwDPrtNYQoTYZ1jTWD4IH4EE7HhcLLt73PgVSwsN/Eqpis
         mn1kEdXUZgRXJ1dGuViZjzXHO37C2oGkZoZFQkV9QZi2VFWgS47xhoRyk+g1ZotuDiWW
         ARrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129113; x=1789733913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uPqiENyHK/eI6mIkd6EtYTrMG0xLQpwgJVbdDlAHxyc=;
        b=ZlfzxryD2MDWf3yb9Pbjsx6x0XMsHzvNvqIhglotToRqx5FDdeXjAiYmUyQe1tk986
         FVEAMgxl6ElyUWqKGd2DrmuwRzUMDV6coT2wcbuSclzDLhp+B88QBrNViuifNPiNYcSf
         d1JqgwIer2SN6QPXvgysDobD8ptO5WXbnJL/7y1dNiguptrGu+wvIYto4DUPERbOL6IY
         YZ713JwVBNKwFi1dOJIOcnb9ly0IVA+/AZrSVNjdywnW1IjXeWyDt6KxNpjua7IqmM+T
         9Q/Wgcq8SQ/hR0Nek/3HJ8H8YgrrhTAiEt/AlM6wGnT5scunI/gME5nRvWBvRoD/C5Hm
         7GWw==
X-Forwarded-Encrypted: i=1; AKwUvBzeUcOSFmAmbWJezUDIQXNayI4jhHETgFbztwFte2wRg57t4zoV6ASxcrzjz0dx2eP04kV+or/UNxSmcA==@lists.infradead.org
X-Gm-Message-State: AFuF++lAEooNrjNMz6gsBbNUWN+Sxg5QshP0DwcitDGn4FNi9G0K2pF4
	wiLh14HCG5vii3IZOwhQmbD7OxwdDWNZa14Rnto+dzRmfzDRWu5a/t9NDEAPqsXQ45U=
X-Gm-Gg: AYBFou38H4UyhJYiHXj5LdSyQ7JNzMmPHHkyemx5h4hJ5TwUmtzb7sL2XJ0A96EAjKB
	Df+1RSPt29VTpCLv1WqfJfSSKrbEkasIJn49HlcadwJBH+jvf9Fc4ibnZPcj6CpqEl63JNt7Ev2
	2Yx5Ct7IAcZR5DVVUXRsDUIGNGJViDV/uIRhmZWEZWjBvB6CB06U5m1mHNKJ2RZgmW7BaUVwPwp
	hvXh/3xZS8n9YcJC8CIc2mA9OW1ACzJta2G87FSY372HNV1DMtYnIeBHu0JQ/R8gEPVCdQw4Hlj
	Ptd6V1cBvCKenbQYneH/Qn009BBa0DvmIEbXMdmZF0Bzm0imcGybtfmUmBhVetVFp6xVEqHlCoE
	7lzULcp6S2iBuizi51BCCmlzgb7ymky4Oh2FamsNJQRo6ExjqUa5yELprf8ykdIyO2BqedpKxc/
	qnYNuYYElfv42zSGVDPOB+E9bYfOKoTY4XXa5n4rGGsxmlsMlyjRWnXVhdIdsAWXNHKuen5bkrZ
	E487eqrwqUbe5axShxrZow+NwTpjyxwVlO6cgAT/WtCKHcsuhfp
X-Received: by 2002:a17:90b:4fc2:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39d9bc42d1bmr7538132a91.6.1789129113087;
        Fri, 11 Sep 2026 05:18:33 -0700 (PDT)
Received: from FJ7FR2JRQ3 ([2409:8a28:f48:3091:908c:b537:572a:4db0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm3178278eec.8.2026.09.11.05.18.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 05:18:32 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 9/9] selftests/riscv: add perf user-stack SSE copy regression test
Date: Fri, 11 Sep 2026 20:14:56 +0800
Message-ID: <20260911121456.33223-10-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_051834_097232_AF549D26 
X-CRM114-Status: GOOD (  31.51  )
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

On RISC-V, PMU overflow interrupts can be delivered through the SBI
Supervisor Software Events (SSE) mechanism. A perf event that samples
the raw user stack (PERF_SAMPLE_STACK_USER, as perf record
--call-graph dwarf does) then copies a chunk of the interrupted task's
user stack from an NMI-like context. If that copy is allowed to take a
nested page fault it can corrupt the interrupted task's kernel state and
hang or crash the machine under load; this is what
riscv_perf_out_copy_user() and the nofault page-fault change fix.

The existing SSE selftest module exercises the framework (register,
enable, inject, complete, priorities, stress) but never drives the perf
user-stack copy that motivated the no-fault path. Add a userspace test
that closes that gap:

  - Open a sampling hardware PMU event with PERF_SAMPLE_STACK_USER over a
    deep, partially non-resident user stack, drain the ring buffer, and
    verify every SAMPLE record is well formed and never reports more
    dumped bytes than were requested. This checks that a non-resident
    page truncates the dump cleanly instead of faulting or overrunning.
  - Drive a multi-CPU unix-socket + deep-recursion workload under
    high-frequency DWARF sampling; the pass criterion is simply that the
    machine survives, since the original bug took it down.

The test reports SKIP when hardware PMU sampling is unavailable or
perf_event_paranoid forbids it, so it is safe to run unprivileged or in
constrained environments. It is placed under the RISC-V SSE selftests
because SSE delivery is the RISC-V-specific condition it protects, and
is wired into the sse subtarget Makefile alongside the module runner.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 tools/testing/selftests/riscv/sse/Makefile    |   5 +
 .../selftests/riscv/sse/sse_perf_ustack.c     | 564 ++++++++++++++++++
 2 files changed, 569 insertions(+)
 create mode 100644 tools/testing/selftests/riscv/sse/sse_perf_ustack.c

diff --git a/tools/testing/selftests/riscv/sse/Makefile b/tools/testing/selftests/riscv/sse/Makefile
index 7e2677fdce09..646b418de9ff 100644
--- a/tools/testing/selftests/riscv/sse/Makefile
+++ b/tools/testing/selftests/riscv/sse/Makefile
@@ -1,5 +1,10 @@
+CFLAGS += -I$(top_srcdir)/tools/testing/selftests
+LDLIBS += -lpthread
+
 TEST_GEN_MODS_DIR := module
 
+TEST_GEN_PROGS := sse_perf_ustack
+
 TEST_PROGS := run_sse_test.sh
 
 include ../../lib.mk
diff --git a/tools/testing/selftests/riscv/sse/sse_perf_ustack.c b/tools/testing/selftests/riscv/sse/sse_perf_ustack.c
new file mode 100644
index 000000000000..9535b6d7ba4c
--- /dev/null
+++ b/tools/testing/selftests/riscv/sse/sse_perf_ustack.c
@@ -0,0 +1,564 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Regression test for the RISC-V perf user-stack copy taken in SSE
+ * (NMI-like) context.
+ *
+ * On RISC-V, PMU overflow interrupts can be delivered through the SBI
+ * Supervisor Software Events (SSE) mechanism. A perf event that samples the
+ * raw user stack (PERF_SAMPLE_STACK_USER, as perf record --call-graph dwarf
+ * does) then copies a large chunk of the interrupted task's user stack from
+ * that context. If that copy is allowed to take a nested page fault it can
+ * corrupt the interrupted task's kernel state and hang or crash the machine
+ * under load.
+ *
+ * This test exercises that exact path:
+ *   - It opens a sampling hardware PMU event with PERF_SAMPLE_STACK_USER.
+ *   - It samples a child running on a controlled user stack followed by an
+ *     inaccessible page, so the copy must truncate at that page boundary.
+ *   - It checks that every user-stack sample record is well formed and that
+ *     the dumped size never exceeds the requested size (i.e. the copy stops
+ *     cleanly rather than faulting on).
+ *   - It then drives a multi-threaded unix-socket + deep-recursion workload
+ *     under high-frequency per-CPU sampling and requires every active sampler
+ *     to make progress without taking the machine down.
+ *
+ * The test is architecture independent in what it drives; it is placed under
+ * the RISC-V SSE selftests because SSE delivery is the RISC-V-specific
+ * condition it is meant to protect.
+ */
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <poll.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+
+#include <linux/perf_event.h>
+#include <pthread.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/socket.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
+
+#include "../../kselftest.h"
+
+#ifndef noinline
+#define noinline __attribute__((noinline))
+#endif
+
+#define STACK_DUMP_SIZE		8192		/* 8 KiB, 8-byte aligned */
+#define RB_DATA_PAGES		64		/* power of two */
+#define SELF_SAMPLE_FREQ	4000
+#define STRESS_SAMPLE_FREQ	5000
+#define STRESS_SECONDS		5
+#define RECURSE_DEPTH		512
+#define TRUNCATION_RUN_MS	250
+
+static long page_size;
+
+static int perf_event_open(struct perf_event_attr *attr, pid_t pid, int cpu,
+			   int group_fd, unsigned long flags)
+{
+	return syscall(__NR_perf_event_open, attr, pid, cpu, group_fd, flags);
+}
+
+/* Prevent the compiler from optimizing away a stack buffer. */
+static void keep_alive(void *p)
+{
+	__asm__ __volatile__("" : : "r"(p) : "memory");
+}
+
+/*
+ * Consume a deep user stack and keep it live, so a raw user-stack sample has
+ * many pages to copy. Returns a value derived from the stack so the compiler
+ * cannot elide the frames.
+ */
+static noinline unsigned long burn_stack(int depth, unsigned long *sink)
+{
+	unsigned long frame[32];
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(frame); i++)
+		frame[i] = (unsigned long)depth * i + *sink;
+
+	if (depth > 0)
+		frame[depth & 31] += burn_stack(depth - 1, sink);
+
+	for (i = 0; i < ARRAY_SIZE(frame); i++)
+		*sink += frame[i];
+
+	keep_alive(frame);
+	return *sink;
+}
+
+static struct perf_event_attr sampling_attr(unsigned long freq)
+{
+	struct perf_event_attr attr = {
+		.type		= PERF_TYPE_HARDWARE,
+		.size		= sizeof(attr),
+		.config		= PERF_COUNT_HW_INSTRUCTIONS,
+		.sample_type	= PERF_SAMPLE_STACK_USER,
+		.sample_stack_user = STACK_DUMP_SIZE,
+		.freq		= 1,
+		.sample_freq	= freq,
+		.disabled	= 1,
+		.exclude_kernel	= 1,
+		.exclude_hv	= 1,
+	};
+
+	return attr;
+}
+
+static bool open_skip_reason(int err, const char **why)
+{
+	switch (err) {
+	case EACCES:
+	case EPERM:
+		*why = "insufficient privilege for PMU sampling (perf_event_paranoid)";
+		return true;
+	case ENOENT:
+	case ENODEV:
+	case EOPNOTSUPP:
+		*why = "hardware PMU sampling event not available";
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool pmu_sse_route_testable(const char **why)
+{
+	char *line = NULL;
+	size_t line_size = 0;
+	FILE *interrupts;
+	bool testable = true;
+
+	interrupts = fopen("/proc/interrupts", "re");
+	if (!interrupts) {
+		*why = "cannot inspect the active PMU delivery route";
+		return false;
+	}
+
+	/* The SBI PMU driver registers this name only for ordinary IRQ delivery. */
+	while (getline(&line, &line_size, interrupts) >= 0) {
+		if (strstr(line, "riscv-pmu")) {
+			*why = "ordinary RISC-V PMU IRQ delivery is active";
+			testable = false;
+			break;
+		}
+	}
+
+	free(line);
+	fclose(interrupts);
+	return testable;
+}
+
+static bool ring_copy_from(void *dst, const void *rb, size_t rb_bytes,
+			   uint64_t pos, size_t size)
+{
+	size_t offset = pos % rb_bytes;
+	size_t first;
+
+	if (size > rb_bytes)
+		return false;
+
+	first = size < rb_bytes - offset ? size : rb_bytes - offset;
+	memcpy(dst, (const char *)rb + offset, first);
+	if (first != size)
+		memcpy((char *)dst + first, rb, size - first);
+
+	return true;
+}
+
+static int truncation_child(void *arg)
+{
+	int ready_fd = (intptr_t)arg;
+	char ready = 1;
+
+	if (write(ready_fd, &ready, sizeof(ready)) != 1)
+		return 1;
+
+	for (;;)
+		__asm__ __volatile__("" : : : "memory");
+}
+
+static pid_t start_truncation_child(void **stack_mapping)
+{
+	struct pollfd pfd = { .events = POLLIN };
+	size_t mapping_size = 2 * page_size;
+	char ready;
+	void *stack;
+	pid_t pid;
+	int pipefd[2];
+	int saved_errno;
+
+	stack = mmap(NULL, mapping_size, PROT_NONE,
+		     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (stack == MAP_FAILED)
+		return -1;
+	if (mprotect(stack, page_size, PROT_READ | PROT_WRITE))
+		goto err_unmap;
+	if (pipe(pipefd))
+		goto err_unmap;
+
+	/* clone() starts the child below the inaccessible second page. */
+	pid = clone(truncation_child, (char *)stack + page_size, SIGCHLD,
+		    (void *)(intptr_t)pipefd[1]);
+	if (pid < 0)
+		goto err_pipe;
+
+	close(pipefd[1]);
+	pfd.fd = pipefd[0];
+	if (poll(&pfd, 1, 1000) != 1 ||
+	    read(pipefd[0], &ready, sizeof(ready)) != sizeof(ready)) {
+		saved_errno = ETIMEDOUT;
+		kill(pid, SIGKILL);
+		waitpid(pid, NULL, 0);
+		close(pipefd[0]);
+		errno = saved_errno;
+		goto err_unmap;
+	}
+	close(pipefd[0]);
+
+	*stack_mapping = stack;
+	return pid;
+
+err_pipe:
+	saved_errno = errno;
+	close(pipefd[0]);
+	close(pipefd[1]);
+	errno = saved_errno;
+err_unmap:
+	saved_errno = errno;
+	munmap(stack, mapping_size);
+	errno = saved_errno;
+	return -1;
+}
+
+static void stop_truncation_child(pid_t pid, void *stack_mapping)
+{
+	kill(pid, SIGKILL);
+	while (waitpid(pid, NULL, 0) < 0 && errno == EINTR)
+		;
+	munmap(stack_mapping, 2 * page_size);
+}
+
+/*
+ * Subtest 1: sample a child whose stack is followed by an inaccessible page.
+ * Every record must be well formed and at least one stack copy must truncate
+ * at the controlled page boundary rather than fault or overrun.
+ */
+static void test_ustack_records_wellformed(void)
+{
+	struct perf_event_attr attr = sampling_attr(SELF_SAMPLE_FREQ);
+	size_t rb_bytes = (size_t)RB_DATA_PAGES * page_size;
+	struct perf_event_mmap_page *meta;
+	unsigned long samples = 0, truncated = 0;
+	void *child_stack;
+	const char *why;
+	void *rb;
+	pid_t child;
+	int fd;
+
+	child = start_truncation_child(&child_stack);
+	if (child < 0) {
+		ksft_test_result_fail("ustack records: create guarded stack child: %s\n",
+				      strerror(errno));
+		return;
+	}
+
+	fd = perf_event_open(&attr, child, -1, -1, PERF_FLAG_FD_CLOEXEC);
+	if (fd < 0) {
+		if (open_skip_reason(errno, &why))
+			ksft_test_result_skip("ustack records: %s\n", why);
+		else
+			ksft_test_result_fail("ustack records: perf_event_open: %s\n",
+					      strerror(errno));
+		goto out_child;
+	}
+
+	meta = mmap(NULL, page_size + rb_bytes, PROT_READ | PROT_WRITE,
+		    MAP_SHARED, fd, 0);
+	if (meta == MAP_FAILED) {
+		ksft_test_result_fail("ustack records: mmap ring buffer: %s\n",
+				      strerror(errno));
+		close(fd);
+		goto out_child;
+	}
+	rb = (char *)meta + page_size;
+
+	ioctl(fd, PERF_EVENT_IOC_RESET, 0);
+	ioctl(fd, PERF_EVENT_IOC_ENABLE, 0);
+	usleep(TRUNCATION_RUN_MS * 1000);
+	ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
+
+	/* Drain the ring buffer and validate every SAMPLE record. */
+	{
+		uint64_t head = __atomic_load_n(&meta->data_head, __ATOMIC_ACQUIRE);
+		uint64_t tail = meta->data_tail;
+		bool ok = true;
+
+		if (head < tail || head - tail > rb_bytes)
+			ok = false;
+
+		while (ok && tail < head) {
+			struct perf_event_header hdr;
+			uint64_t available = head - tail;
+
+			if (available < sizeof(hdr) ||
+			    !ring_copy_from(&hdr, rb, rb_bytes, tail, sizeof(hdr)) ||
+			    hdr.size < sizeof(hdr) || hdr.size > available ||
+			    hdr.size > rb_bytes) {
+				ok = false;
+				break;
+			}
+
+			if (hdr.type == PERF_RECORD_SAMPLE) {
+				uint64_t dump_size, dyn_size;
+				size_t cursor = sizeof(hdr);
+
+				if (sizeof(dump_size) > hdr.size - cursor ||
+				    !ring_copy_from(&dump_size, rb, rb_bytes,
+						    tail + cursor, sizeof(dump_size)) ||
+				    dump_size > STACK_DUMP_SIZE) {
+					ok = false;
+					break;
+				}
+				cursor += sizeof(dump_size);
+				samples++;
+				if (dump_size) {
+					/* data blob then trailing dynamic size */
+					if (dump_size > hdr.size - cursor) {
+						ok = false;
+						break;
+					}
+					cursor += dump_size;
+					if (sizeof(dyn_size) > hdr.size - cursor ||
+					    !ring_copy_from(&dyn_size, rb, rb_bytes,
+							    tail + cursor,
+							    sizeof(dyn_size))) {
+						ok = false;
+						break;
+					}
+					if (dyn_size > dump_size) {
+						ok = false;
+						break;
+					}
+					if (dyn_size < dump_size)
+						truncated++;
+				}
+			}
+			tail += hdr.size;
+		}
+		__atomic_store_n(&meta->data_tail, head, __ATOMIC_RELEASE);
+
+		if (!ok)
+			ksft_test_result_fail("ustack records: malformed sample record\n");
+		else if (samples == 0)
+			ksft_test_result_skip("ustack records: no samples collected\n");
+		else if (truncated == 0)
+			ksft_test_result_fail("ustack records: no guarded-stack truncation\n");
+		else
+			ksft_test_result_pass("ustack records: %lu samples, %lu truncated\n",
+					      samples, truncated);
+	}
+
+	munmap(meta, page_size + rb_bytes);
+	close(fd);
+out_child:
+	stop_truncation_child(child, child_stack);
+}
+
+/* ---- Subtest 2: multi-threaded per-CPU sampling stress ---- */
+
+struct stress_thread {
+	pthread_t tid;
+	int cpu;
+	int *stop;
+	int fd;
+	void *rb;
+	size_t rb_bytes;
+};
+
+static void *stress_worker(void *arg)
+{
+	struct stress_thread *st = arg;
+	unsigned long sink = 1;
+	int sv[2];
+	char buf[64];
+
+	if (socketpair(AF_UNIX, SOCK_STREAM, 0, sv) == 0) {
+		while (!__atomic_load_n(st->stop, __ATOMIC_RELAXED)) {
+			/* unix-socket ping-pong: takes the socket locks the
+			 * original bug corrupted, while sampling nests.
+			 */
+			if (write(sv[0], buf, sizeof(buf)) > 0)
+				(void)read(sv[1], buf, sizeof(buf));
+			burn_stack(RECURSE_DEPTH, &sink);
+			/* Periodically consume the ring buffer so sampling
+			 * keeps delivering rather than filling up and stopping.
+			 */
+			if (st->rb) {
+				struct perf_event_mmap_page *m = st->rb;
+				uint64_t h = __atomic_load_n(&m->data_head,
+							     __ATOMIC_ACQUIRE);
+				__atomic_store_n(&m->data_tail, h,
+						 __ATOMIC_RELEASE);
+			}
+		}
+		close(sv[0]);
+		close(sv[1]);
+	}
+
+	return (void *)sink;
+}
+
+static void test_sse_stress_no_crash(void)
+{
+	struct perf_event_attr attr = sampling_attr(STRESS_SAMPLE_FREQ);
+	size_t rb_bytes = (size_t)RB_DATA_PAGES * page_size;
+	struct stress_thread *threads;
+	cpu_set_t available;
+	long progressed = 0;
+	int stop = 0;
+	const char *why = NULL;
+	long started = 0;
+	long nproc;
+	long slot;
+	int cpu;
+
+	if (sched_getaffinity(0, sizeof(available), &available)) {
+		ksft_test_result_fail("sse stress: sched_getaffinity: %s\n",
+				      strerror(errno));
+		return;
+	}
+	nproc = CPU_COUNT(&available);
+	if (nproc < 1) {
+		ksft_test_result_skip("sse stress: no available CPUs\n");
+		return;
+	}
+
+	threads = calloc(nproc, sizeof(*threads));
+	if (!threads) {
+		ksft_test_result_fail("sse stress: out of memory\n");
+		return;
+	}
+
+	slot = 0;
+	for (cpu = 0; cpu < CPU_SETSIZE; cpu++) {
+		struct stress_thread *st;
+		pthread_attr_t thread_attr;
+		cpu_set_t set;
+		void *map;
+		int ret;
+
+		if (!CPU_ISSET(cpu, &available))
+			continue;
+		st = &threads[slot++];
+
+		st->fd = -1;
+		st->cpu = cpu;
+		st->stop = &stop;
+		st->rb_bytes = rb_bytes;
+		st->fd = perf_event_open(&attr, -1, cpu, -1,
+					 PERF_FLAG_FD_CLOEXEC);
+		if (st->fd < 0) {
+			if (!started && open_skip_reason(errno, &why))
+				break;
+			continue;
+		}
+
+		map = mmap(NULL, page_size + rb_bytes, PROT_READ | PROT_WRITE,
+			   MAP_SHARED, st->fd, 0);
+		if (map == MAP_FAILED) {
+			close(st->fd);
+			st->fd = -1;
+			continue;
+		}
+		st->rb = map;
+
+		CPU_ZERO(&set);
+		CPU_SET(cpu, &set);
+		pthread_attr_init(&thread_attr);
+		ret = pthread_attr_setaffinity_np(&thread_attr, sizeof(set), &set);
+		if (!ret)
+			ret = pthread_create(&st->tid, &thread_attr,
+					     stress_worker, st);
+		pthread_attr_destroy(&thread_attr);
+
+		if (ret) {
+			munmap(st->rb, page_size + rb_bytes);
+			close(st->fd);
+			st->rb = NULL;
+			st->fd = -1;
+			continue;
+		}
+
+		ioctl(st->fd, PERF_EVENT_IOC_RESET, 0);
+		ioctl(st->fd, PERF_EVENT_IOC_ENABLE, 0);
+		started++;
+	}
+
+	if (started == 0) {
+		free(threads);
+		if (why)
+			ksft_test_result_skip("sse stress: %s\n", why);
+		else
+			ksft_test_result_skip("sse stress: could not start any sampler\n");
+		return;
+	}
+
+	sleep(STRESS_SECONDS);
+	__atomic_store_n(&stop, 1, __ATOMIC_RELAXED);
+
+	for (slot = 0; slot < nproc; slot++) {
+		struct stress_thread *st = &threads[slot];
+		struct perf_event_mmap_page *meta;
+
+		if (st->fd < 0)
+			continue;
+		pthread_join(st->tid, NULL);
+		ioctl(st->fd, PERF_EVENT_IOC_DISABLE, 0);
+		meta = st->rb;
+		if (__atomic_load_n(&meta->data_head, __ATOMIC_ACQUIRE))
+			progressed++;
+		munmap(st->rb, page_size + rb_bytes);
+		close(st->fd);
+	}
+
+	free(threads);
+	if (progressed != started)
+		ksft_test_result_fail("sse stress: %ld/%ld samplers made progress\n",
+				      progressed, started);
+	else
+		ksft_test_result_pass("sse stress: %ld samplers x %ds made progress\n",
+				      started, STRESS_SECONDS);
+}
+
+int main(void)
+{
+	const char *why;
+
+	page_size = sysconf(_SC_PAGESIZE);
+
+	ksft_print_header();
+	ksft_set_plan(2);
+	if (!pmu_sse_route_testable(&why)) {
+		ksft_test_result_skip("ustack records: %s\n", why);
+		ksft_test_result_skip("sse stress: %s\n", why);
+		ksft_finished();
+	}
+
+	test_ustack_records_wellformed();
+	test_sse_stress_no_crash();
+
+	ksft_finished();
+}
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B2E606A330
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mq+Nnuv/;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ihF9hZPk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+QSch06VPmC/n8OKcsW4wgyUEcfDwAvFtDaUJwDM8zk=; b=mq+Nnuv/tQql0xi85cI+Q1Kd0i
	0ZIz1nOnsQcBtAp5EmowVNCm8ePRPMny519l1jaGfHl0+WX7++kJXF6ap7zz84HRFWoK3si8dPIn0
	sFqgcRUz2Qb31qlVc636HkitjHQGGI17wuecoRXv+/X190gSZi5v6sr/d3SXKo3tTc8Fbhyyx+N4P
	cx6IGPrEF8W7rFfyI0LJ9zhEeNRpoJpMT3BKcCsvdaeq2Kt81fEsHWiIQvWFaTQT75FlPL2XRflwv
	MMEAxHNHVGilUMqvnC0h0mALouLXJGVFkVOdveIe6Gh+NMeH/h5zWyAsPQ7umedezfr4mf98+2zqG
	tLmPLMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXr5-00000004x4j-2Wun;
	Wed, 04 Nov 2026 10:04:31 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXr2-00000004x29-0IUz
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 10:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793786663; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=ZFwjYKo9FGrLtd7J7SFuZotKMZwQyEOUtKROv1AJQfQ=;
	b=ihF9hZPk5kagnJKrqSm54edJJSQij9D5R56P/3jscGPLhrBKFhRdN5Mcn4sBn1x9oGHa8JpbXvl/3cdgaREnCrSS/Ecpe9xtGZH9yYtKpsFY0zrGIZ6VeYX6DWmcPI43rXyskg7QM1ghHpijkkdnRjQnMd4FJp2FmHJzjPiO6GM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R901e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XE5SaaJ_1793786661;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XE5SaaJ_1793786661 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 04 Nov 2026 18:04:21 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	shuah@kernel.org,
	rgbi3307@gmail.com,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 bpf-next 3/3] selftests/bpf: Add a runtime test for private stack and stack arguments
Date: Wed,  4 Nov 2026 18:04:11 +0800
Message-ID: <20261104100411.997-4-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104100411.997-1-cp0613@linux.alibaba.com>
References: <20261104100411.997-1-cp0613@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_020428_440453_AB33B051 
X-CRM114-Status: GOOD (  28.08  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

No existing test reaches the combination. bpf_enable_priv_stack() grants
an adaptive private stack only to kprobe, tracepoint, perf_event and
raw_tracepoint programs, and to tracing, lsm and struct_ops ones that
request it or recurse. The stack-argument tests run from tc, socket,
syscall and fentry/fexit, all left at NO_PRIV_STACK; the private-stack
tests call subprograms of up to three arguments, which stay in
registers. Neither pairs a private stack with outgoing stack arguments,
where the caller writes the argument area relative to SP and the callee
reads it relative to the frame pointer.

Add a runtime test for that combination. A static ten-argument callee
writes through a pointer into the caller frame and keeps a 128-byte
volatile local array, so its own depth crosses the 64-byte threshold at
which the verifier grants a subprog the adaptive private stack. The same
workload runs from a raw tracepoint, which gets a private stack, and
from tc, which does not; the test pins itself to each allowed CPU in
turn and checks the CPU the program reported.

A runtime result cannot show where the three stack areas landed, so the
riscv64 __jited patterns pin the layout: the caller's kernel frame is 48
bytes against the control group's 176 and the callee's 64 against 208,
the 128 and 144 byte differences being exactly the BPF stack that moved
to the per-CPU area. Both groups write the two outgoing arguments at
0x0(sp) and 0x8(sp) and the callee reads them back at 0x0(s0) and
0x8(s0), so the outgoing area, the saved registers and the BPF stack
occupy disjoint ranges. None of the patterns assert the per-CPU lookup,
which is only emitted on CONFIG_SMP, so one set matches SMP and UP
alike.

The zero-depth struct_ops program is a control case for the kernel
stack path, not a private-stack allocation: the verifier grants the
adaptive private stack only once a subprog's stack depth, rounded up to
the JIT's 16-byte granularity, reaches 64 bytes.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---

Notes:
Reachability of a private stack together with outgoing stack arguments,
per architecture, for review context only:

- x86-64 cannot reach it. The verifier denies the private stack to
  subprograms with stack arguments there because R9 doubles as the
  private stack frame pointer and argument 6, so both halves of this
  test would be kernel stack runs.
- powerpc64 has no stack arguments at all, as it does not report
  bpf_jit_supports_stack_args(), so it cannot reach it either.
- arm64 reports both bpf_jit_supports_private_stack() and
  bpf_jit_supports_stack_args(), so the combination is reachable there
  today and has no test for it. Widening the gate to arm64 needs arm64
  __jited patterns and an arm64 machine to validate them, so I would
  post that separately once the maintainers agree this runtime test is
  worth keeping.

 .../selftests/bpf/private_stack_runtime.h     |  12 ++
 .../bpf/prog_tests/private_stack_runtime.c    |  84 +++++++++++
 .../bpf/progs/private_stack_runtime.c         | 140 ++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/private_stack_runtime.h
 create mode 100644 tools/testing/selftests/bpf/prog_tests/private_stack_runtime.c
 create mode 100644 tools/testing/selftests/bpf/progs/private_stack_runtime.c

diff --git a/tools/testing/selftests/bpf/private_stack_runtime.h b/tools/testing/selftests/bpf/private_stack_runtime.h
new file mode 100644
index 000000000000..8ed49ff66a6e
--- /dev/null
+++ b/tools/testing/selftests/bpf/private_stack_runtime.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PRIVATE_STACK_RUNTIME_H
+#define __PRIVATE_STACK_RUNTIME_H
+
+struct private_stack_result {
+	long value;
+	long first;
+	long last;
+	__u32 cpu;
+};
+
+#endif
diff --git a/tools/testing/selftests/bpf/prog_tests/private_stack_runtime.c b/tools/testing/selftests/bpf/prog_tests/private_stack_runtime.c
new file mode 100644
index 000000000000..918c41d6b179
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/private_stack_runtime.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <test_progs.h>
+#include <network_helpers.h>
+#include "private_stack_runtime.h"
+#include "private_stack_runtime.skel.h"
+
+void serial_test_private_stack_runtime(void)
+{
+#if defined(__riscv) && __riscv_xlen == 64
+	LIBBPF_OPTS(bpf_test_run_opts, opts,
+		    .data_in = &pkt_v4,
+		    .data_size_in = sizeof(pkt_v4),
+	);
+	struct private_stack_runtime *skel;
+	struct bpf_link *trace = NULL, *ops = NULL;
+	cpu_set_t saved, single;
+	int cpu, err, tested = 0;
+
+	/*
+	 * Two independent halves. RUN_TESTS() validates the __jited patterns
+	 * through the test loader, which builds its own object from the ELF
+	 * bytes. The half below loads a separate skeleton to check the runtime
+	 * values and the CPU the program reported, which disassembly patterns
+	 * cannot express.
+	 */
+	RUN_TESTS(private_stack_runtime);
+
+	if (!ASSERT_OK(sched_getaffinity(0, sizeof(saved), &saved), "getaffinity"))
+		return;
+
+	skel = private_stack_runtime__open();
+	if (!ASSERT_OK_PTR(skel, "open"))
+		return;
+	if (!skel->rodata->has_stack_args) {
+		printf("%s:SKIP: clang lacks __BPF_FEATURE_STACK_ARGUMENT\n", __func__);
+		test__skip();
+		goto out;
+	}
+	skel->rodata->target_tgid = getpid();
+	if (!ASSERT_OK(private_stack_runtime__load(skel), "load"))
+		goto out;
+
+	trace = bpf_program__attach_raw_tracepoint(skel->progs.private_args, "sys_enter");
+	if (!ASSERT_OK_PTR(trace, "attach_tracepoint"))
+		goto out;
+
+	for (cpu = 0; cpu < CPU_SETSIZE; cpu++) {
+		if (!CPU_ISSET(cpu, &saved))
+			continue;
+		CPU_ZERO(&single);
+		CPU_SET(cpu, &single);
+		if (!ASSERT_OK(sched_setaffinity(0, sizeof(single), &single), "setaffinity"))
+			break;
+
+		err = bpf_prog_test_run_opts(bpf_program__fd(skel->progs.kernel_args), &opts);
+		if (!ASSERT_OK(err, "kernel_args") || !ASSERT_EQ(opts.retval, 0, "retval"))
+			break;
+		syscall(__NR_getpgid, 0);
+		ASSERT_EQ(skel->bss->private_result.value, 324 + getpid(), "private_value");
+		ASSERT_EQ(skel->bss->private_result.first, 29, "private_first");
+		ASSERT_EQ(skel->bss->private_result.last, 324, "private_last");
+		ASSERT_EQ(skel->bss->private_result.cpu, cpu, "private_cpu");
+		ASSERT_EQ(skel->bss->kernel_result.value, 324 + getpid(), "kernel_value");
+		ASSERT_EQ(skel->bss->kernel_result.first, 29, "kernel_first");
+		ASSERT_EQ(skel->bss->kernel_result.last, 324, "kernel_last");
+		ASSERT_EQ(skel->bss->kernel_result.cpu, cpu, "kernel_cpu");
+		tested++;
+	}
+	ASSERT_GT(tested, 0, "tested_cpus");
+
+	ops = bpf_map__attach_struct_ops(skel->maps.zero_stack_ops);
+	if (!ASSERT_OK_PTR(ops, "attach_zero_stack"))
+		goto out;
+	ASSERT_OK(trigger_module_test_read(256), "trigger_zero_stack");
+	ASSERT_EQ(skel->bss->zero_calls, 1, "zero_stack_calls");
+out:
+	bpf_link__destroy(ops);
+	bpf_link__destroy(trace);
+	private_stack_runtime__destroy(skel);
+	ASSERT_OK(sched_setaffinity(0, sizeof(saved), &saved), "restore_affinity");
+#else
+	test__skip();
+#endif
+}
diff --git a/tools/testing/selftests/bpf/progs/private_stack_runtime.c b/tools/testing/selftests/bpf/progs/private_stack_runtime.c
new file mode 100644
index 000000000000..61c144fd5cbe
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/private_stack_runtime.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <vmlinux.h>
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+#include "../test_kmods/bpf_testmod.h"
+#include "../private_stack_runtime.h"
+#include "bpf_misc.h"
+
+char _license[] SEC("license") = "GPL";
+
+const volatile __u32 target_tgid;
+const volatile long seed = 1;
+
+struct private_stack_result private_result, kernel_result;
+int zero_calls;
+
+#ifdef __BPF_FEATURE_STACK_ARGUMENT
+const volatile bool has_stack_args = true;
+
+struct frame {
+	long slots[16];
+};
+
+static __noinline long check_args(long a, long b, long c, long d, long e,
+				  long f, long g, long h, long i,
+				  struct frame *caller)
+{
+	volatile long local[16] = {};
+	long sum;
+
+	local[0] = a;
+	local[15] = i;
+	sum = a + 2 * b + 3 * c + 4 * d + 5 * e + 6 * f + 7 * g + 8 * h + 9 * i;
+	caller->slots[15] = caller->slots[0] + sum + local[0] + local[15];
+	return caller->slots[15] + (bpf_get_current_pid_tgid() >> 32);
+}
+
+static __always_inline void run_args(struct private_stack_result *result)
+{
+	struct frame caller = {};
+	long n = seed;
+
+	caller.slots[0] = 29;
+	result->value = check_args(n, n + 1, n + 2, n + 3, n + 4,
+				   n + 5, n + 6, n + 7, n + 8, &caller);
+	result->first = caller.slots[0];
+	result->last = caller.slots[15];
+	result->cpu = bpf_get_smp_processor_id();
+}
+#else
+const volatile bool has_stack_args = false;
+
+static __always_inline void run_args(struct private_stack_result *result)
+{
+}
+#endif
+
+SEC("raw_tp/sys_enter")
+#ifdef __BPF_FEATURE_STACK_ARGUMENT
+__arch_riscv64
+/*
+ * func #0, the caller. With a private stack the kernel frame holds only the
+ * saved registers and the outgoing stack argument area, so it is 48 bytes =
+ * 32 (ra, fp, s5, tcc) + 16 (two 8 byte outgoing slots). The 128 byte BPF
+ * stack is not in this frame; it lives on the per-CPU private stack reached
+ * through s5. The caller writes the two outgoing arguments relative to sp.
+ */
+__jited("	addi	sp, sp, -0x30")
+__jited("...")
+__jited("	sd	{{.*}}, 0x0(sp)")
+__jited("...")
+__jited("	sd	{{.*}}, 0x8(sp)")
+__jited("...")
+/*
+ * func #1, the ten argument callee, gets a private stack of its own, so its
+ * kernel frame is the 64 bytes of saved registers and nothing else. It reads
+ * the two incoming stack arguments relative to fp (s0), which its prologue
+ * set to the caller's sp, i.e. exactly the area the caller wrote above.
+ */
+__jited("func #1")
+__jited("...")
+__jited("	addi	sp, sp, -0x40")
+__jited("...")
+__jited("	ld	{{.*}}, 0x0(s0)")
+__jited("...")
+__jited("	ld	{{.*}}, 0x8(s0)")
+#endif
+
+int private_args(void *ctx)
+{
+	if ((bpf_get_current_pid_tgid() >> 32) == target_tgid)
+		run_args(&private_result);
+	return 0;
+}
+
+SEC("tc")
+#ifdef __BPF_FEATURE_STACK_ARGUMENT
+__arch_riscv64
+/*
+ * func #0, the caller, control group. BPF_PROG_TYPE_SCHED_CLS is
+ * NO_PRIV_STACK, so the 128 byte BPF stack stays in the kernel frame and s5
+ * is sp relative: 176 bytes = 32 saved + 128 BPF stack + 16 outgoing, i.e.
+ * 128 bytes larger than the private stack caller above. The outgoing stack
+ * argument area is written relative to sp in both cases.
+ */
+__jited("	addi	sp, sp, -0xb0")
+__jited("...")
+__jited("	addi	s5, sp, 0x90")
+__jited("...")
+__jited("	sd	{{.*}}, 0x0(sp)")
+__jited("...")
+__jited("	sd	{{.*}}, 0x8(sp)")
+__jited("...")
+/* func #1, the callee: 208 bytes = 64 saved + 144 BPF stack. */
+__jited("func #1")
+__jited("...")
+__jited("	addi	sp, sp, -0xd0")
+__jited("...")
+__jited("	ld	{{.*}}, 0x0(s0)")
+__jited("...")
+__jited("	ld	{{.*}}, 0x8(s0)")
+#endif
+
+int kernel_args(struct __sk_buff *skb)
+{
+	run_args(&kernel_result);
+	return 0;
+}
+
+SEC("struct_ops")
+int BPF_PROG(zero_stack)
+{
+	zero_calls++;
+	return 0;
+}
+
+SEC(".struct_ops")
+struct bpf_testmod_ops3 zero_stack_ops = {
+	.test_1 = (void *)zero_stack,
+};
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

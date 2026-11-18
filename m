Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214BF606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YqyY3bRz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEXixdfx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Pqrt5+i22PQoMXdCqB26Z9Jc1ILGp0whKyQ/ican4yM=; b=YqyY3bRzf7xtDwZn63zgQAdjYa
	ElVmDRMJ6V4Sf3Px0wZ2WPFWfCOt19Ipv1w1+Wcbra5vexUttTxN51cxfeFZEGMX7NIQi2Rv8a8Ab
	X4anxvVwGxN8xgdQar1mVlrCEqbCEDnL0CWQ/WVxGq1CswD9nR01/pQ+xK8zDQZdw9hrxjQoUbZhp
	m+HVDnBtBZ2yxN8TXiroITGSnecTXjUF9cWLQr6Cc0ClScU/23x1ALNgZ5ClphEindG4AGdxEs99F
	TTB3uyCYMEXNHNiXJbX3yfvnF+vJYZ6GfczYmPG21ZXz1R6/Q3yhEbXrX3zHYQRkCuArivNJYeIzf
	DOatrJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbID-00000008D4v-2cWL;
	Wed, 18 Nov 2026 08:45:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbIA-00000008D2x-3JEh;
	Wed, 18 Nov 2026 08:45:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B37F60DF7;
	Wed, 18 Nov 2026 08:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FF81F000C4;
	Wed, 18 Nov 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991521;
	bh=pwLw1PN0N5G0/zB/Y6J6/hvuDTRFVTY/2ACWaIVrQfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XEXixdfxIzWEjdmYVlLVXQKKC/1OSeLK4Dd2KI/ueBBJ2zsxZdV01ZPnYYNWVPzEW
	 aKSn5DRrdjMn96VrFDKoBWo3Ev/LzcHi2s7mSQnjtViNEbm+GleedWTNvwp3fG08CN
	 1CQJJbNAg0dO84aDdBlajIscTmlxNv9LWlsjdZFS7d5lSVLTM1V0u0I9hAGxeXFkxc
	 OlNJ/zRLaG0REmdXEZ4lNqW8+0MERdiuohXnQQzCK/SidctsNm/jJPr9Ex5b5O4NK6
	 7iK5eLYGfDfHBYuFeF3s34LutpI/mxoKWZ2XrZBmyPmEsMCjW1AO97sGOfu/9uhrnL
	 WWoLktO2YGCJQ==
From: Jiri Olsa <jolsa@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>
Cc: bpf@vger.kernel.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	rtm@csail.mit.edu
Subject: [PATCH bpf 2/2] selftests/bpf: Test which ctx registers a uprobe prog can write
Date: Wed, 18 Nov 2026 09:44:50 +0100
Message-ID: <20261118084451.12590-3-jolsa@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118084451.12590-1-jolsa@kernel.org>
References: <20261118084451.12590-1-jolsa@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A uprobe program can write only the pt_regs fields that ptrace can set
to any value. Add verifier tests for x86-64, arm64 and riscv:

  - writes to the general registers, the stack pointer and the
    instruction pointer load
  - writes to cs, ss, flags and orig_ax on x86-64, to pstate and
    orig_x0 on arm64, and to status, badaddr and cause on riscv fail
    with "invalid bpf_context access"
  - a 4-byte write to the low half of a read-only field fails too
  - reading a read-only field still works
  - on x86-64, a kprobe program that writes ctx->flags fails to load

Other arches get one test that just loads.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 .../selftests/bpf/prog_tests/verifier.c       |   2 +
 .../bpf/progs/verifier_uprobe_write_ctx.c     | 196 ++++++++++++++++++
 2 files changed, 198 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_uprobe_write_ctx.c

diff --git a/tools/testing/selftests/bpf/prog_tests/verifier.c b/tools/testing/selftests/bpf/prog_tests/verifier.c
index 6a494c381266..5a31f04677e0 100644
--- a/tools/testing/selftests/bpf/prog_tests/verifier.c
+++ b/tools/testing/selftests/bpf/prog_tests/verifier.c
@@ -131,6 +131,7 @@
 #include "verifier_unpriv.skel.h"
 #include "verifier_unwind.skel.h"
 #include "verifier_unpriv_perf.skel.h"
+#include "verifier_uprobe_write_ctx.skel.h"
 #include "verifier_value_adj_spill.skel.h"
 #include "verifier_value.skel.h"
 #include "verifier_value_illegal_alu.skel.h"
@@ -321,6 +322,7 @@ void test_verifier_uninit(void)               { RUN(verifier_uninit); }
 void test_verifier_unpriv(void)               { RUN(verifier_unpriv); }
 void test_verifier_unwind(void)               { RUN(verifier_unwind); }
 void test_verifier_unpriv_perf(void)          { RUN(verifier_unpriv_perf); }
+void test_verifier_uprobe_write_ctx(void)     { RUN(verifier_uprobe_write_ctx); }
 void test_verifier_value_adj_spill(void)      { RUN(verifier_value_adj_spill); }
 void test_verifier_value(void)                { RUN(verifier_value); }
 void test_verifier_value_illegal_alu(void)    { RUN(verifier_value_illegal_alu); }
diff --git a/tools/testing/selftests/bpf/progs/verifier_uprobe_write_ctx.c b/tools/testing/selftests/bpf/progs/verifier_uprobe_write_ctx.c
new file mode 100644
index 000000000000..f5ed453b1798
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/verifier_uprobe_write_ctx.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+#include "bpf_misc.h"
+
+/*
+ * A uprobe prog can write only the registers that ptrace can set to any
+ * value. The fields the kernel restores on the way to user space (segments,
+ * flags, privilege state) are read-only.
+ */
+
+#define WRITE_CTX(name, field, sz)					\
+__naked void name(void)							\
+{									\
+	asm volatile ("							\
+	r2 = 0;								\
+	*(" #sz " *)(r1 + %[off]) = r2;					\
+	r0 = 0;								\
+	exit;								\
+"	:								\
+	: __imm_const(off, offsetof(struct pt_regs, field))		\
+	: __clobber_all);						\
+}
+
+#define READ_CTX(name, field)						\
+__naked void name(void)							\
+{									\
+	asm volatile ("							\
+	r0 = *(u64 *)(r1 + %[off]);					\
+	r0 = 0;								\
+	exit;								\
+"	:								\
+	: __imm_const(off, offsetof(struct pt_regs, field))		\
+	: __clobber_all);						\
+}
+
+#if defined(__TARGET_ARCH_x86)
+
+SEC("uprobe")
+__description("uprobe: write ctx->ax")
+__success
+WRITE_CTX(write_ax, ax, u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->r15")
+__success
+WRITE_CTX(write_r15, r15, u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->di")
+__success
+WRITE_CTX(write_di, di, u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->ip")
+__success
+WRITE_CTX(write_ip, ip, u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->sp")
+__success
+WRITE_CTX(write_sp, sp, u64)
+
+SEC("uprobe")
+__description("uprobe: write lower half of ctx->ax")
+__success
+WRITE_CTX(write_ax_u32, ax, u32)
+
+SEC("uprobe")
+__description("uprobe: write ctx->orig_ax")
+__failure __msg("invalid bpf_context access")
+WRITE_CTX(write_orig_ax, orig_ax, u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->cs")
+__failure __msg("invalid bpf_context access")
+WRITE_CTX(write_cs, cs, u64)
+
+SEC("uprobe")
+__description("uprobe: write lower half of ctx->cs")
+__failure __msg("invalid bpf_context access")
+WRITE_CTX(write_cs_u32, cs, u32)
+
+SEC("uprobe")
+__description("uprobe: write ctx->flags")
+__failure __msg("invalid bpf_context access")
+WRITE_CTX(write_flags, flags, u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->ss")
+__failure __msg("invalid bpf_context access")
+WRITE_CTX(write_ss, ss, u64)
+
+SEC("uprobe")
+__description("uprobe: read ctx->flags")
+__success
+READ_CTX(read_flags, flags)
+
+SEC("kprobe")
+__description("kprobe: write ctx->flags")
+__failure __msg("invalid bpf_context access")
+WRITE_CTX(kprobe_write_flags, flags, u64)
+
+#elif defined(__TARGET_ARCH_arm64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->regs[0]")
+__success
+WRITE_CTX(write_x0, regs[0], u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->regs[30]")
+__success
+WRITE_CTX(write_x30, regs[30], u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->sp")
+__success
+WRITE_CTX(write_sp, sp, u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->pc")
+__success
+WRITE_CTX(write_pc, pc, u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->pstate")
+__failure __msg("invalid bpf_context access")
+WRITE_CTX(write_pstate, pstate, u64)
+
+SEC("uprobe")
+__description("uprobe: write lower half of ctx->pstate")
+__failure __msg("invalid bpf_context access")
+WRITE_CTX(write_pstate_u32, pstate, u32)
+
+SEC("uprobe")
+__description("uprobe: write ctx->orig_x0")
+__failure __msg("invalid bpf_context access")
+WRITE_CTX(write_orig_x0, orig_x0, u64)
+
+SEC("uprobe")
+__description("uprobe: read ctx->pstate")
+__success
+READ_CTX(read_pstate, pstate)
+
+#elif defined(__TARGET_ARCH_riscv)
+
+SEC("uprobe")
+__description("uprobe: write ctx->epc")
+__success
+WRITE_CTX(write_epc, epc, u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->a0")
+__success
+WRITE_CTX(write_a0, a0, u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->t6")
+__success
+WRITE_CTX(write_t6, t6, u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->status")
+__failure __msg("invalid bpf_context access")
+WRITE_CTX(write_status, status, u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->badaddr")
+__failure __msg("invalid bpf_context access")
+WRITE_CTX(write_badaddr, badaddr, u64)
+
+SEC("uprobe")
+__description("uprobe: write ctx->cause")
+__failure __msg("invalid bpf_context access")
+WRITE_CTX(write_cause, cause, u64)
+
+SEC("uprobe")
+__description("uprobe: read ctx->status")
+__success
+READ_CTX(read_status, status)
+
+#else
+
+SEC("uprobe")
+__description("uprobe: ctx writes not checked on this arch")
+__success
+__naked void unsupported(void)
+{
+	asm volatile ("r0 = 0; exit;" ::: __clobber_all);
+}
+
+#endif
+
+char _license[] SEC("license") = "GPL";
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

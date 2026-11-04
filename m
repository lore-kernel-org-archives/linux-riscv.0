Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32C4606A33C
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AH4jCuZ1;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=W8GFFAQE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MPwkuf7oaIw56RW9FIpnyLxHm3rEcnkGaS+TtuOGRho=; b=AH4jCuZ1PkbTgUiEtMh5z4bMxh
	K8kzhDlRhWBQtRvkJ57GJv5CJ3r3ox5ATfN1pEsWEQzl898AZ7aSsTdmgka/061JCB+uuaF07gr2V
	os+v+0ghJObjLSTLX9uiT+KDN+OyZDdG0rimEFJXl9SxXfPFGPOBH8A9/1/R2xwB7+Ab3gDWHrAdl
	5pYzvYlb+XpB2A4o4FL/5qLedYeYtTGDJmdFN9cjXgQZzLvM4vh9VBFSTnDRFWVzZ+oa7tnI4PiAZ
	lU65qe7NOBvVfqDcmBSz6fHI24u8m/TvTAeQ4xsK9QOJcLquGgJY9AY/NkcV6KdhsJOlIRN3P7gQO
	znMnNd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXr0-00000004x2T-151M;
	Wed, 04 Nov 2026 10:04:26 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXqy-00000004x1o-15M3
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 10:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793786659; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=MGGIrCRkMY2tw6CcNj/MCmch+qG0XHux1S4w4kckfr0=;
	b=W8GFFAQEtk+ehX5Hhr1k/61DxOBmxlI0M9fHwV10sppXtzjO1v/tSptzPYA9SzQcMKCvg6ipfC6khg9DvjEXqIDu/wGakDU7IoP3EwCTxiXq+b5E6lT9oACMtgt8mHxdSQixmvo2C1QFBHbaHDR40k4zqvMHJaA+mF4SJs1jeFU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R331e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XE5SaXm_1793786652;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XE5SaXm_1793786652 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 04 Nov 2026 18:04:17 +0800
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
Subject: [PATCH v2 bpf-next 0/3] riscv: bpf: Add BPF private stack support
Date: Wed,  4 Nov 2026 18:04:08 +0800
Message-ID: <20261104100411.997-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_020424_583454_A0AE65D2 
X-CRM114-Status: GOOD (  19.48  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds private-stack support to the RV64 BPF JIT.

The verifier rejects a struct_ops program that requests a private stack
with -EACCES when the JIT does not report
bpf_jit_supports_private_stack(), and sched_ext requests one for its
dispatch callback, so no sched_ext scheduler can load on riscv64 today.

Allocation, the guard value and the lifetime handling follow arm64,
x86-64 and powerpc64; the 16-byte two-copy guard layout follows arm64
and powerpc64, since x86-64 uses an 8-byte guard with a single copy.
What is specific to riscv64 is where the pointers end up:

 - Every BPF stack access goes through BPF_REG_FP (S5), so pointing S5
   at the top of the per-CPU area and leaving SP on the kernel stack is
   all the JIT has to do. S5 is callee-saved and each subprog derives
   its own, so bpf2bpf calls need no extra save and restore.
 - The outgoing stack-argument area stays in the kernel frame: callers
   write it relative to SP while callees read it relative to RV_REG_FP.
   Unlike x86-64, no register here is shared with the private-stack
   frame pointer, so no verifier-side exclusion is needed and stack
   arguments keep working together with a private stack. arm64 already
   does the same, and patch 3 measures the three ranges at run time and
   pins them in the disassembly.
 - The per-CPU lookup is emitted after the tail-call entry point. A
   program using a private stack can still be entered as a tail-call
   target, at RV_TAILCALL_OFFSET, so it has to set up its own S5 there;
   and since that offset is a constant added to the target's bpf_func,
   everything in front of it must be the same size in every program.

The base address is materialized with absolute moves, as on arm64,
x86-64 and powerpc64. Those three reach the per-CPU offset through gs:,
TPIDR or r13 and only have to move the base into a register; riscv64 has
no such register, so the address of __per_cpu_offset is loaded here too.
A PC-relative pair is not an option for the base itself: the dynamic
per-CPU area is vmalloc'd, further from the JIT region than auipc
reaches, which is why the whole setup is ten instructions on the kernel
tested here. __per_cpu_offset is a kernel-image symbol and on that
kernel lands in the sign-extended 32-bit range, so emit_imm() renders it
in two instructions through its 32-bit fast path - what an emit_addr()
pair would cost, and the form insn_is_mov_percpu_addr() already uses;
unifying the two needs an extra_pass argument and an error return in
bpf_jit_build_prologue(), which also touches bpf_jit_comp32.c, so it is
left as is. Both constants are fixed before the offset-convergence loop,
so the prologue length is stable across passes.

RV32 does not declare support and keeps the existing behaviour; the
prologue signature is unchanged, so bpf_jit_comp32.c needs no edit.

Changes since v1:
 - Patch 1 commit message: guard layout credited to arm64 and powerpc64,
   value alone to x86-64; __per_cpu_offset described as a choice.
 - Patch 3: test_private_stack_runtime() renamed to
   serial_test_private_stack_runtime(), and the stack-argument skip
   prints a reason.

Testing
=======
QEMU virt rv64, an 8 vCPU SMP kernel and a 1 vCPU UP kernel, both built
on the base commit below, source tree clean at the head of this series,
selftests built from these patches. There are no private-stack related
failures, and no run logged a BUG, WARNING, panic, unknown opcode or
guard corruption. On UP, kfunc_call/subprog, kfunc_call/subprog_lskel
and scx_simple are not run: all three fail the same way on the unpatched
base.

 - verifier_private_stack, struct_ops_private_stack,
   private_stack_runtime.
 - tailcalls, stack_arg, subprogs, fentry_fexit, kfunc_call,
   percpu_alloc, async_stack_depth, arena_atomics, arena_ldsx.
 - verifier_stack_arg, stack_arg_precision.
 - may_goto_priv_stack, may_goto_far, verifier_may_goto_1,
   verifier_may_goto_2.
 - scx_simple.
 - sched_ext runner sweep on SMP: 40 cases, 39 pass. enable_cmask fails
   because its ops.enable() takes a struct scx_cmask __arena pointer and
   riscv64 does not implement bpf_jit_supports_arena_args().

Chen Pei (3):
  riscv: bpf: Add BPF private stack support
  selftests/bpf: Enable private stack tests for riscv64
  selftests/bpf: Add a runtime test for private stack and stack
    arguments

 arch/riscv/net/bpf_jit.h                      |   1 +
 arch/riscv/net/bpf_jit_comp64.c               |  42 +++++-
 arch/riscv/net/bpf_jit_core.c                 |  84 +++++++++--
 .../selftests/bpf/private_stack_runtime.h     |  12 ++
 .../bpf/prog_tests/private_stack_runtime.c    |  84 +++++++++++
 .../bpf/prog_tests/struct_ops_private_stack.c |   3 +-
 .../bpf/progs/private_stack_runtime.c         | 140 ++++++++++++++++++
 .../bpf/progs/verifier_private_stack.c        |  41 ++++-
 8 files changed, 393 insertions(+), 14 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/private_stack_runtime.h
 create mode 100644 tools/testing/selftests/bpf/prog_tests/private_stack_runtime.c
 create mode 100644 tools/testing/selftests/bpf/progs/private_stack_runtime.c


base-commit: 8fb43ffc3327d12d57d3fbe6f4820b5a522de0d1
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

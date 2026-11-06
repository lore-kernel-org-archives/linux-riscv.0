Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004FA606D818
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 18:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0iFjxWN6;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=tEKY+hhu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CItyNH7ZcpcaJFPlPlC4SwyMxPheJvADwSxnV1om3VA=; b=0iFjxWN6lQYWEb/COauqynyQTm
	DtualJHNgfvTE+R/VNYqPWE7QXtshGs3zxdEaWvcMuaCBC0NLGZ1qY0/bWpQPyJYRRIqozbtPRxgh
	TAD4YeFO4VRUfKnfkJSeTWzKiE8Zk6wK1OVyMvrEenQjWZ0ouTX9IMzkbhRJaj0OGzDomKgk5Syq5
	Z57uqfWBkM+6TwZ3YZu9FTyZSO9QqFaAh/jyD9RG31GWjIaYqsgUwQqdfNUhPObYDdLsNXQAnTcZX
	ESOMFLjNYBa/jxMSz7NzkMD9WWonC9DreoHck5+3Vu58g9OYDTtJj17KdrcYpERnCt1dEzz0z/vB3
	pv0XF+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOU3-0000000DMtu-2Xap;
	Fri, 06 Nov 2026 18:16:15 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOTz-0000000DMqf-3muy
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 18:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793988969; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=bdqlIDpO1Rbh7tY3234Rn/68H01qvnrPvCer2ASmJqg=;
	b=tEKY+hhuPc0tL5xvWZEmqsSFY/2OUfFFDxP90TvT9CZ7QtG9nP8tNmYL4tb+qkLrpmhgn7XMRUcu3vAMZ2v9lMzxwhj2dnuxeTW6kSP4PhIeml6wi31v7NBLcyqRPYOpapkU4S28EhEhwcX2EB0uqtI/PNcRC60SzxENqvGvxMA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R961e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XECMC01_1793988959;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XECMC01_1793988959 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 07 Nov 2026 02:16:07 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org,
	alexei.starovoitov@gmail.com
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
Subject: [PATCH v3 bpf-next 0/3] riscv: bpf: Add BPF private stack support
Date: Sat,  7 Nov 2026 02:15:55 +0800
Message-ID: <20261106181558.1564-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_101612_441414_846B985E 
X-CRM114-Status: GOOD (  14.91  )
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
x86-64 and powerpc64; the 16 byte two-copy guard layout follows arm64
and powerpc64, since x86-64 uses an 8 byte guard with a single copy.
What is specific to riscv64 is where the pointers end up:

 - Every BPF stack access goes through BPF_REG_FP (S5), so pointing S5
   at the top of the per-CPU area and leaving SP on the kernel stack is
   all the JIT has to do. S5 is callee-saved and each subprog derives
   its own, so bpf2bpf calls need no extra save and restore.
 - The outgoing stack argument area stays in the kernel frame: callers
   write it relative to SP while callees read it relative to RV_REG_FP.
   Unlike x86-64, no register here is shared with the private-stack
   frame pointer, so no verifier-side exclusion is needed and stack
   arguments keep working together with a private stack. arm64 already
   does the same, and patch 3 tests that combination.
 - The per-CPU lookup is emitted after the tail call entry point. A
   program using a private stack can still be entered as a tail call
   target, at RV_TAILCALL_OFFSET, so it has to set up its own S5 there;
   and since that offset is a constant added to the target's bpf_func,
   everything in front of it must be the same size in every program.

The base address is materialized with absolute moves, as on arm64,
x86-64 and powerpc64, which reach the per-CPU offset through gs:, TPIDR
or r13; riscv64 has no such register, so the address of __per_cpu_offset
is loaded too. Patch 1 has the detail, including why emit_imm() is a
choice there and why the prologue length stays fixed across passes.

RV32 does not declare support and keeps the existing behaviour; the
prologue signature is unchanged, so bpf_jit_comp32.c needs no edit.

Changes since v2:
 - Patch 1: PRIV_STACK_GUARD_VAL moved to bpf_jit.h.
 - Patch 3: The test redone as two asm programs in
   progs/verifier_stack_arg.c.

Changes since v1:
 - Patch 1 commit message: guard layout credited to arm64 and powerpc64,
   value alone to x86-64; __per_cpu_offset described as a choice.
 - Patch 3: test_private_stack_runtime() renamed to
   serial_test_private_stack_runtime(), and the stack argument skip
   prints a reason.

Testing
=======
QEMU virt rv64, an 8 vCPU SMP kernel and a 1 vCPU UP kernel, both built
on the base commit below, source tree clean at the head of this series,
selftests built from these patches. There are no private-stack related
failures, and the private-stack suites logged no BUG, WARNING, unknown
opcode or guard corruption. On UP, kfunc_call/subprog,
kfunc_call/subprog_lskel and scx_simple are not run: all three fail on
the unpatched base as well.

 - verifier_private_stack, struct_ops_private_stack.
 - tailcalls, stack_arg, subprogs, fentry_fexit, kfunc_call,
   percpu_alloc, async_stack_depth, arena_atomics, arena_ldsx.
 - verifier_stack_arg, stack_arg_precision.
 - may_goto_priv_stack, may_goto_far, verifier_may_goto_1,
   verifier_may_goto_2.
 - scx_simple.
 - sched_ext runner sweep on SMP: 40 cases, 39 pass. enable_cmask fails
   because its ops.enable() takes a struct scx_cmask __arena pointer and
   riscv64 does not implement bpf_jit_supports_arena_args().
 - patch 3's test again on x86-64 and arm64, so all three
   architectures it is gated on have run it.

Chen Pei (3):
  riscv: bpf: Add BPF private stack support
  selftests/bpf: Enable private stack tests for riscv64
  selftests/bpf: Test a private stack together with stack arguments

 arch/riscv/net/bpf_jit.h                      |  2 +
 arch/riscv/net/bpf_jit_comp64.c               | 42 +++++++++-
 arch/riscv/net/bpf_jit_core.c                 | 82 +++++++++++++++++--
 .../bpf/prog_tests/struct_ops_private_stack.c |  3 +-
 .../bpf/progs/verifier_private_stack.c        | 41 +++++++++-
 .../selftests/bpf/progs/verifier_stack_arg.c  | 49 +++++++++++
 6 files changed, 205 insertions(+), 14 deletions(-)


base-commit: a3c8813409f13779fec225468aba7d4067a66468
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

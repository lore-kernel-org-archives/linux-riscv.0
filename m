Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798E8CC6B2D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 02:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aW6ltOgFa9O8aJGjKOwRp74xYFbfKDWQyjD4uYKTZqw=; b=Qa5b7OYCyiFDk5
	3jVEN6oTHaV+FXZIRx4jlz6/dhayy0w5pqq2uxn3u74lTjZSKgygi2TdYyPZcZ/YBniiUFUlYHbsJ
	MS29f9/kkqQz6IMgxqnCzK3vABbkwvL8x6tJXgBNhn9z5Zm7+YijoKWyO5G/6ib2qezELduXd4hJi
	oYqpyxNtfIbR5MR4DU7lQg7nW2nUxb/Se6GcYQ0D/qWvGHr2JJTQZsCfcOvyfUgt/mqisvWGbCbRS
	3JJC1iBVpVBKC4/cUD3nY7yFmz+cU616ZFmg8ZWnUbECbTaeJ4I7NfKevuXJX7v68/5EEQ5s0hIjc
	iyifwDZTCt4e/mV5VZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAy3-0000000Ge8X-3BBJ;
	Thu, 15 Oct 2026 02:13:17 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAy0-0000000Ge7E-0oDW
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 02:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792030385; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=JBK5MtrbNOToG3i1rm+lE1KNxMqjgadGnGOGQQ4TX6U=;
	b=jWyXp/62+euKfyhQt22kjwFan7pxY2TsESSfHubDxHqtaCJ82Ts7W9RBYE8K9UhcQzMz0CcLpzP8DoOY25H7oSPzPxedprNwjUo1Gh3COtVGkO/9ufM/znkwaetY+5ufToXTqtJ8NwgN+B0Zu8bdskWVh4l/7vRZD1I9OEQJoX4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XCqJ00E_1792030358;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XCqJ00E_1792030358 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 15 Oct 2026 10:13:03 +0800
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
Subject: [PATCH bpf-next 0/3] riscv: bpf: Add BPF private stack support
Date: Thu, 15 Oct 2026 10:12:35 +0800
Message-ID: <20261015021238.5657-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_191313_073533_BD7EC38C 
X-CRM114-Status: GOOD (  18.27  )
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

This series adds private-stack support to the RV64 BPF JIT.

The verifier rejects a struct_ops program that requests a private stack
with -EACCES when the JIT does not report
bpf_jit_supports_private_stack(), and sched_ext requests one for its
dispatch callback, so no sched_ext scheduler can load on riscv64 today.

Allocation, the 16-byte guard regions at both ends, the guard value and
the lifetime handling follow arm64, x86-64 and powerpc64. What is
specific to riscv64 is where the pointers end up:

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
reaches, which is why the whole setup is ten instructions on the sv39
kernel tested here. __per_cpu_offset is a kernel-image symbol and could
use the emit_addr() form that insn_is_mov_percpu_addr() already uses, at
the same two instructions; unifying the two needs an extra_pass argument
and an error return in bpf_jit_build_prologue(), which also touches
bpf_jit_comp32.c, so it is left as is. Both constants are fixed before
the offset-convergence loop, so the prologue length is stable across
passes.

RV32 does not declare support and keeps the existing behaviour; the
prologue signature is unchanged, so bpf_jit_comp32.c needs no edit.

Testing
=======
QEMU virt rv64, an 8 vCPU SMP kernel and a 1 vCPU UP kernel, source tree
clean at the head of this series, selftests built from these patches, no
private-stack related failures. On UP, kfunc_call/subprog,
kfunc_call/subprog_lskel and scx_simple are not run: all three fail the
same way on the unpatched base.

 - verifier_private_stack, struct_ops_private_stack,
   private_stack_runtime
 - tailcalls, stack_arg, subprogs, fentry_fexit, kfunc_call,
   percpu_alloc, async_stack_depth, arena_atomics, arena_ldsx
 - may_goto_priv_stack, may_goto_far, verifier_may_goto_1,
   verifier_may_goto_2
 - scx_simple on SMP

Chen Pei (3):
  riscv: bpf: Add BPF private stack support
  selftests/bpf: Enable private stack tests for riscv64
  selftests/bpf: Add a runtime test for private stack and stack
    arguments

 arch/riscv/net/bpf_jit.h                      |   1 +
 arch/riscv/net/bpf_jit_comp64.c               |  42 +++++-
 arch/riscv/net/bpf_jit_core.c                 |  84 +++++++++--
 .../selftests/bpf/private_stack_runtime.h     |  12 ++
 .../bpf/prog_tests/private_stack_runtime.c    |  83 +++++++++++
 .../bpf/prog_tests/struct_ops_private_stack.c |   3 +-
 .../bpf/progs/private_stack_runtime.c         | 140 ++++++++++++++++++
 .../bpf/progs/verifier_private_stack.c        |  41 ++++-
 8 files changed, 392 insertions(+), 14 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/private_stack_runtime.h
 create mode 100644 tools/testing/selftests/bpf/prog_tests/private_stack_runtime.c
 create mode 100644 tools/testing/selftests/bpf/progs/private_stack_runtime.c

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

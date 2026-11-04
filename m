Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF811606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eBcb8dmd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IAMT6IEp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LDZhzDsNJ1SGAAw3LgDNvNGMLDh/oJDszPG+7CfXzcw=; b=eBcb8dmd5ZNzeVefdmni9V0hQv
	Xs48Tg2Zx6uyjtlwIC5XqBrN/T0sVOaKqaNlEGCU6k4xjeccI3vxKrwc97KUWrng2UpH+9Ds5kYM2
	7sprXdHDiG6GUHrP4Cyy7FhIiFpCTiRLveKZK2e7VJs8NVC7ef5atI/UpJqeaTjPRUbJ1ix/2OOZ9
	HzhK2CPY+iJK9eNktQ8kvrlR0T/Gg3Ul9MpAE9SXBKMKEzftgFb8Diw1Gzux6sSxlLq0Kz6HDgay+
	SyWGFqUvnlfV4xcQ3Ttzm8s/9iLUl/7e4QJ50yLfDXuKjO6poFsQvqH5GuQ0b56sLzOg8PAoYrvs3
	U03KIENA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYT9-000000051u6-2iYH;
	Wed, 04 Nov 2026 10:43:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYT8-000000051ti-2AQC
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 10:43:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EC2C60DA7;
	Wed,  4 Nov 2026 10:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CC71F000C1;
	Wed,  4 Nov 2026 10:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793789029;
	bh=4+EcRDWVmPDx1ZpyH2GACpj8rgMH2E771rpsXUmTySI=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=IAMT6IEpl/QMyUK0smoW4bFmv3nLyQ7xt99aBDZLcTYCFItn0RTUnhrfLwFNuNQUT
	 P4ebdCuXDpC+CwFG7aTmsIYpJ6BDwcxQKB3mdjsVkWxrcwWacToq65U+rswtrWs4dJ
	 3jSTCBJK4pOZRinRwH54VZgPcyrssoF/ynNmiy5XRmIEu3VynlgUJNFb8bkotuZebX
	 CiO4ftWaoQZ5V21RYmfu+jsPz5qKyGpoKyxR7wSHjzLNCywv90YP+u451pW+g1cqYH
	 m7ET7EzTzhtXO71f8/wRTSSqoVEz88PlVY70Rl02YtpdVgErR30z1Bp9gF695XOLkJ
	 dhkxW5T9/J8lQ==
Content-Type: multipart/mixed; boundary="===============5210111555606903047=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <6e5775fb342f79e0404d11547d954fc855dd7bfcfafac5d43184c966fc3ca290@mail.kernel.org>
In-Reply-To: <20261104100411.997-4-cp0613@linux.alibaba.com>
References: <20261104100411.997-4-cp0613@linux.alibaba.com>
Subject: Re: [PATCH v2 bpf-next 3/3] selftests/bpf: Add a runtime test for private stack and stack arguments
From: bot+bpf-ci@kernel.org
To: cp0613@linux.alibaba.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,memxor@gmail.com,bjorn@kernel.org,puranjay@kernel.org
Cc: eddyz87@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,pulehui@huawei.com,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,luke.r.nels@gmail.com,xi.wang@gmail.com,shuah@kernel.org,rgbi3307@gmail.com,guoren@kernel.org,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Wed,  4 Nov 2026 10:43:48 +0000 (UTC)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5210111555606903047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> selftests/bpf: Add a runtime test for private stack and stack arguments

TL;DR: Commit message only: it may be inaccurate in saying fentry/fexit tests
are left at NO_PRIV_STACK, since tracing programs that recurse are eligible
for a private stack; the review suggests rewording.

>     selftests/bpf: Add a runtime test for private stack and stack arguments
>
>     No existing test reaches the combination. bpf_enable_priv_stack() grants
>     an adaptive private stack only to kprobe, tracepoint, perf_event and
>     raw_tracepoint programs, and to tracing, lsm and struct_ops ones that
>     request it or recurse. The stack-argument tests run from tc, socket,
>     syscall and fentry/fexit, all left at NO_PRIV_STACK; the private-stack
>     tests call subprograms of up to three arguments, which stay in
>     registers. Neither pairs a private stack with outgoing stack arguments,
>     where the caller writes the argument area relative to SP and the callee
>     reads it relative to the frame pointer.
>
>     Add a runtime test for that combination. A static ten-argument callee
>     writes through a pointer into the caller frame and keeps a 128-byte
>     volatile local array, so its own depth crosses the 64-byte threshold at
>     which the verifier grants a subprog the adaptive private stack. The same
>     workload runs from a raw tracepoint, which gets a private stack, and
>     from tc, which does not; the test pins itself to each allowed CPU in
>     turn and checks the CPU the program reported.
>
>     A runtime result cannot show where the three stack areas landed, so the
>     riscv64 __jited patterns pin the layout: the caller's kernel frame is 48
>     bytes against the control group's 176 and the callee's 64 against 208,
>     the 128 and 144 byte differences being exactly the BPF stack that moved
>     to the per-CPU area. Both groups write the two outgoing arguments at
>     0x0(sp) and 0x8(sp) and the callee reads them back at 0x0(s0) and
>     0x8(s0), so the outgoing area, the saved registers and the BPF stack
>     occupy disjoint ranges. None of the patterns assert the per-CPU lookup,
>     which is only emitted on CONFIG_SMP, so one set matches SMP and UP
>     alike.
>
>     The zero-depth struct_ops program is a control case for the kernel
>     stack path, not a private-stack allocation: the verifier grants the
>     adaptive private stack only once a subprog's stack depth, rounded up to
>     the JIT's 16-byte granularity, reaches 64 bytes.
>
>     Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

The commit message says the stack-argument tests run from "tc, socket,
syscall and fentry/fexit, all left at NO_PRIV_STACK".  Is that accurate
for fentry/fexit?

Those are BPF_PROG_TYPE_TRACING programs, and bpf_enable_priv_stack() does:

    case BPF_PROG_TYPE_TRACING:
    case BPF_PROG_TYPE_LSM:
    case BPF_PROG_TYPE_STRUCT_OPS:
        if (prog->aux->priv_stack_requested || bpf_prog_check_recur(prog))
            return PRIV_STACK_ADAPTIVE;

bpf_prog_check_recur() returns true for TRACING unless expected_attach_type
is BPF_TRACE_ITER, so the fentry/fexit tracers in
progs/tracing_stack_arg_tailcall_tracer.c and
progs/tracing_struct_int128_tracer.c get PRIV_STACK_ADAPTIVE at the program
level.  That is the "tracing ... ones that ... recurse" case named in the
preceding sentence.

The real reasons those tracers never pair a private stack with stack
arguments seem to be different.  check_max_stack_depth_subprog() only gives
a subprog PRIV_STACK_ADAPTIVE when its rounded depth reaches
BPF_PRIV_STACK_MIN_SIZE (64), and these programs only copy a few ctx[]
slots into globals.  They also make no outgoing stack-argument calls; the
stack arguments belong to the traced syscall-program target.

Could the sentence say that the fentry/fexit tracers are eligible for a
private stack, but stay below the 64-byte threshold and make no
stack-argument calls?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/41813628482
--===============5210111555606903047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5210111555606903047==--


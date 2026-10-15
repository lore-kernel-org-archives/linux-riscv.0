Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20E3CC6B2D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 02:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvLKvfBUhwj9GO9Gprjr/P0JFOz2UjrLybMmmw5nuj8=; b=DAYKxtMWufz0zNfb1TPSKy8EAp
	e93dMk4B733z6Gx7/Uw/E7uTllOfHx3Pd+zz6DqJovbyrScL5+GKHzzeJBLeGU4/BCa4Irm6sXQ2F
	d2tLpF/GWoXmxEBKue3pVYeGd+KtbrNXBgg7oT0kWLABsh1GvV0O2m+ZT7yl3hvd2o0MhvVER7Vdm
	kFxZ59Fub0AZ9eclYVezVDVOFaGa+BqMSXrIbAiHpexd1hRtZHOWiJUfT953KLzNq31kh9wr9F7Nd
	ZsmLtayTIwVeen12di7woF4KgUutRAazoKjSp5aeUHmzCNNtt1e1ndJk1JbJlCeEkuJKme/AC/lQ3
	mPH9CB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBgQ-0000000GhoS-2Isk;
	Thu, 15 Oct 2026 02:59:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBgJ-0000000Ghnw-1NPp
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 02:59:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B1C58437AE;
	Thu, 15 Oct 2026 02:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EF51F000C4;
	Thu, 15 Oct 2026 02:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033138;
	bh=bpYRRTqwLo2HWeFqcCqbpPVh6DLjUFtMcKybkXV94SI=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=IlA+k60Oq0HnoXlVurZ79XrtX0WclPoBWWRgWMU4d0FzDe3KQGy7nbCPpm09Rp0f1
	 NBJX7JJBz+pzLr9/QP/4iL+D7KGD9iyhkRP3iPngXQ+7PpmIOkhJbOOYxfjIb/377s
	 NUQQ2PAj99rde/FOcELCmo7ATdG4wTiSAEXNhV6pAu4B77k8HiVx7sjttOCLrfyq5x
	 nT39Fx19ZGoGxZFCbF/Of2YGLivBRvB5OkhWqGrnq77hZs2Yqn/8qYyvrS8GjxzPyc
	 wcrlpOnT9tkRQD2qk7swi0F2XZ9V8/YjCq740BPh2nVA8qo9OjbLo2vXS7WdmdM1cP
	 qDL7AHVXCN6Ow==
Content-Type: multipart/mixed; boundary="===============4514555578709208116=="
MIME-Version: 1.0
Message-Id: <b96ee2ab6347e86e3da161bcdea1d17fde1acb1c619d3519b7c980daf03b20d5@mail.kernel.org>
In-Reply-To: <20261015021238.5657-2-cp0613@linux.alibaba.com>
References: <20261015021238.5657-2-cp0613@linux.alibaba.com>
Subject: Re: [PATCH bpf-next 1/3] riscv: bpf: Add BPF private stack support
From: bot+bpf-ci@kernel.org
To: cp0613@linux.alibaba.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,memxor@gmail.com,bjorn@kernel.org,puranjay@kernel.org
Cc: eddyz87@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,pulehui@huawei.com,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,luke.r.nels@gmail.com,xi.wang@gmail.com,shuah@kernel.org,rgbi3307@gmail.com,guoren@kernel.org,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Thu, 15 Oct 2026 02:58:55 +0000 (UTC)
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4514555578709208116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> riscv: bpf: Add BPF private stack support

TL;DR: Commit message only: it says the guard layout follows x86-64, but
x86-64 uses an 8 byte single-copy guard, and it may overstate why
__per_cpu_offset needs absolute moves.

> riscv: bpf: Add BPF private stack support

[ ... ]

> The base is materialized with absolute moves, as on arm64, x86-64 and
> powerpc64: the dynamic per-CPU area is vmalloc'd, beyond a PC-relative
> auipc pair from the JIT region, and riscv64 has no segment or register
> holding the per-CPU offset, so __per_cpu_offset needs materializing the
> same way. Both constants are fixed before the offset convergence loop,
> so the prologue length is stable across passes.
>
> The guard layout and value follow arm64, x86-64 and powerpc64: a 16
> byte region at each end holding two copies of the pattern. A jited
> program has them checked when it is freed, reporting the first
> corrupted CPU only; failure paths release the area unchecked since the
> image never ran, which also clears priv_stack_ptr for the later
> bpf_jit_free().

Is the statement that the guard layout follows x86-64 accurate?

arm64 and powerpc64 use a 16 byte guard with two copies of the pattern at
each end, but x86-64 differs:

arch/x86/net/bpf_jit_comp.c:
    #define PRIV_STACK_GUARD_SZ    8
    ...
    stack_ptr[0] = PRIV_STACK_GUARD_VAL;
    stack_ptr[underflow_idx] = PRIV_STACK_GUARD_VAL;

It uses an 8 byte guard with a single copy at each end, and it rounds the
stack depth to 8 rather than 16.  Only the guard value (0xEB9F12345678eb9f)
is shared by all three.  Could the changelog say that the 16 byte, two-copy
layout follows arm64 and powerpc64, and that only the guard value follows
x86-64?

Separately, the changelog says __per_cpu_offset "needs materializing the
same way", meaning with absolute moves.  The existing BPF_MOV64_PERCPU_REG
handler in bpf_jit_emit_insn() already loads the same symbol PC-relatively:

    /* Load address of __per_cpu_offset array in T2 */
    emit_addr(RV_REG_T2, (u64)&__per_cpu_offset, extra_pass, ctx);

Is emit_imm() for __per_cpu_offset in emit_priv_stack_frame() required, or a
choice made so that the prologue length stays fixed across passes?  The
changelog could say which.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/38671177164
--===============4514555578709208116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4514555578709208116==--


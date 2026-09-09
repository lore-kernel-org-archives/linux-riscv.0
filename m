Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071FFC79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 16:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5s7so5Ny5pR3yLtKvPanQOjJjSv6OJHMIn91HRxLUp0=; b=TBTYIKATck6dgB
	iatYxulxmR9YLyHhr8n92fRpFJ7ht1ZFc9AhOoMHeh5YcA4upM8bfkurAy2PLKSNN7HPEqur+EYrm
	qAhsc9YeqO4BEcrhNoG7i9V6WL1ESUsed4eUox5H+VP9lr6PF3DBOZdebm2Yyu1byhJk96rFLmgfM
	wZEtfiL+ppaNtgdGm1UlJ4qrnHIqTjA9zAVYfsrpEgkQW7D/YbohciUBAD3zsQd8rukEFrRVVhymA
	EvTAC0/gEXtIMYZJj7qMP1HpozSKxMKocCc9s8kXWykdHeL5oBplYA49bZo7JVZwMW9xPuTJ8s8Ql
	AprSRCNbqaR3YrGg9xqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LGU-0000000CLKz-1YeY;
	Wed, 09 Sep 2026 16:35:14 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LGP-0000000CLHk-2dPY
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 16:35:13 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-836c4474028so60109697b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 09:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788971705; cv=none;
        d=google.com; s=arc-20260327;
        b=TRj2BB13rbTVXQ3cuceiGPw8p0t5iSKF5uv+Sex+1Oji1HQmJbI1YHFenxH2+ViDcR
         0M0tZwFa6OXeiuJpZY1P1oSc7zb0Yv8R17/dwdVpz57nrGcZTQLN4FvLiKwBcwFs1efE
         caGExDcmMkcIDzVG9AfWv+JBGXu4VWD1UhV2XKhzOI82Nrppim6Xm39ayHfrr/aRF6xp
         gGT3oW8HJvZIGhln3NNiyi+dpmFSJxZGtBnyew/j7YF5WGGmLDSyB9oRAYu9Q5qlF5m0
         oRyy9bgDpqPMv0vTKTozi1G7w/YFN1QLCm3AIiNyqsV2QaBfdCRg+UtbUPjR8xwADTgL
         66rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AurL6CS51ZxhuGokqtXHBRLRcchDPoQ4/ZSuDu7JVek=;
        fh=BX9aQ1JiSHzcilrbaE4b0onT4lolHH846ksI50sSZws=;
        b=Z5EnR/t5n6Sr1LFJ7ZpSOKMqYDKimB7vwyWgfnfITJzA1S1ZoWI6LxE9gi5+ZqWHmE
         0Bcp3AQTaoJZaqPjvOhyBfUG8e2ceA70GqSwtn/3zDDJpYFVGupPy88uajj+Qmf3K1cV
         v70Ov+lpOMB5oNAYAhL09H4O4uB+6L3JB7lNdN/+Zv+uHEItYQeqEy/wqgSAJ1EbACHR
         4TD1Nzao9ZzcGEZHJgDsRZjSjnlvEZkV/V5rRilgB8oq0Zta4l5LSnFUrturPL1Z6o7M
         nBMoX45j6SSSTv7QxEHVxU7RubvBdNAIn1eNnacf1uGhP7EqtH7Z50aDoX6dNV/oWlln
         HqFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971705; x=1789576505; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AurL6CS51ZxhuGokqtXHBRLRcchDPoQ4/ZSuDu7JVek=;
        b=Y39cd2DYoKzCMZjdYjHjNd7J6YQcBGGUyTpwoQ5fdqkY1HeJ9uAYXuyxqv1hMlISY5
         KlABw9Fh0ddrfA3dMRCCY68q+yFSxF01RlVB+eu+PVN2+LRYsBtHq8wh+jBu76Nh8jH9
         Y+zg5xAVyQZ6NXqzMHHPP8Ppzd8Yf1gXCGC8t4M6bo2z5ITai2VgXtdpTOFycvNFcL+5
         YOghDewCOBmTU/3MfBtPJVxr5S1DZAncvvg/7Eq0Msq+tbYwYloByKiZxohUP6sVTwrX
         9JeqZE9MIUS/ToU0gEIPTWoZUZJUm4a6OxCMj4EyFg3/phMweeeFl6wDcyUSbdaWGTq6
         uW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971705; x=1789576505;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AurL6CS51ZxhuGokqtXHBRLRcchDPoQ4/ZSuDu7JVek=;
        b=kXh2iBOhYORCRGIP6npZ+u3oDgKzktbj6Q3oxwAgKQohw+MTYNSVAuragCyiV6XBnc
         uV1eCM9PuZ30Cnpn24UG5wAx0to8iXcPKkts3d3Yg34zC5fmCxeat+GfgKWTbwdpiBwU
         40WcDDGkYpiBQXB+1YB570dMSei4X0DyjIGZnZ/aqkRZc0Njo/Xs8vTcYJ6PsER0Z/xQ
         whLIiSgTTtz8AyjGDYCp5Wm0D653zf+ApKG0cvhAM5kZ6tvQ7HPKxnOwgZh+Bq/nb3XS
         WcdM9fbJkNcso5MZUNygN+hMv1k0XFOSuoqiOrYHjSNSLDss/+NY9iacNQUI+SW4Md2D
         nIoQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4C1FOb7mR9wFR7M3DWIZHergCCGBCm5bP59euww1AQJWNXQBaFnx5goiGhWX29//vBWSWeGAOuvB66g==@lists.infradead.org
X-Gm-Message-State: AFuF++kYtb7LdCV3AGrxoyzUWegH0CDKec6dkPJwUTenETuXm4XrRKHu
	VZ5NX7TsvwLsVbf1p9hNesXreDQNEabVJLXUv+0+eFU6XRFvPBiE6vtZnUSGLKt3sJ9Wp2iqYuv
	JU2D3Qqg5Gpvy/4bwsErAuhKbVjZdBG0=
X-Gm-Gg: AYBFou0rWTMketK0tCA75PU3jwEHebmMe1RRNAlHj0Z1R93JYPEPksinLaIVaRX7Tk8
	/igjpV+4zng5SJH+mNnZQO4fum33kib5M0rI7kX/eqGEZz4gL2HIqqBViG+UVMC0jiomfIWtZ40
	JaaVmOUR3cJmmxdkXSObIwZ/eNWacAGVY0n15pMvAHQd1q4r7Q+AZvoVkm1hZbCbdVkssDxZlyR
	FToYPQWSMckKXeCH8tcZnpWKDbYSD6hiAfZzvEmVxaHj3uRKt49KzFxfVsw84/lYcwlQBL3VBeq
	opzFUdJmO219Nc/4FKuW/Sc/YPo+WOKoS6mWJ2MMsziSS8a8hFD+GhnshHHbfGkAeGQSrAEZlq7
	51++XcATGZR7cApREekXxndpvGpM1oCuq8tTt4mLRHQEl6JS/8YpyzeFjPiwGT/NXoaQ/ezDa/y
	W7P+foRhZTCKxJJ1H6Md8nTHs=
X-Received: by 2002:a05:690c:c622:b0:86f:6c64:7eb7 with SMTP id
 00721157ae682-87122599769mr119770507b3.1.1788971705167; Wed, 09 Sep 2026
 09:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260904195132.141068-3-sidchintamaneni@gmail.com> <4866144aa416a8491c9874325394e88f5dc2e66259212baa56032e0428f0772b@mail.kernel.org>
In-Reply-To: <4866144aa416a8491c9874325394e88f5dc2e66259212baa56032e0428f0772b@mail.kernel.org>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Wed, 9 Sep 2026 09:34:53 -0700
X-Gm-Features: AcwNN1WCeNCqyff3VAuQjYBnYtHIwccOam8Qp1LEGjFOZzxZQ1VjRoRu1i5QAcI
Message-ID: <CAE5sdEhdsPvK8UD-SEZ=YNX5_GpHkUV8mivRW1j=6hJ6XkM7Zw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 2/7] bpf, x86: Use resolved pointer for timed may_goto
To: bot+bpf-ci@kernel.org
Cc: bpf@vger.kernel.org, jeremy.jean@oss.cyber.gouv.fr, ast@kernel.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org, 
	eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, a.s.protopopov@gmail.com, puranjay@kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-riscv@lists.infradead.org, rlmenge@gmail.com, 
	hargar@linux.microsoft.com, apais@microsoft.com, martin.lau@kernel.org, 
	mason@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093509_687217_F9C1AD1D 
X-CRM114-Status: GOOD (  33.95  )
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

On Fri, 4 Sept 2026 at 13:33, <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/arch/x86/net/bpf_timed_may_goto.S b/arch/x86/net/bpf_timed_may_goto.S
> > index 54c690cae190..6e9d9e7c2b1d 100644
> > --- a/arch/x86/net/bpf_timed_may_goto.S
> > +++ b/arch/x86/net/bpf_timed_may_goto.S
> > @@ -11,12 +11,6 @@
> >  SYM_FUNC_START(arch_bpf_timed_may_goto)
> >       ANNOTATE_NOENDBR
> >
> > -     /*
> > -      * r10 passes us stack depth, load the pointer to count and timestamp
> > -      * into r10 by adding it to BPF frame pointer.
> > -      */
> > -     leaq (%rbp, %r10, 1), %r10
> > -
>
> A subsystem pattern flags this as potentially concerning: This commit
> changes the x86 trampoline to the new 'pointer in BPF_REG_AX' ABI, but the
> producer side of that ABI was changed one commit earlier, in d8319a04dafc
> ("bpf: Fix timed may_goto stack pointer for private stacks"), which
> rewrote kernel/bpf/fixups.c to emit:
>
>     insn_buf[4] = BPF_MOV64_REG(BPF_REG_AX, BPF_REG_FP);
>     insn_buf[5] = BPF_ALU64_IMM(BPF_ADD, BPF_REG_AX, stack_off_cnt);
>
> At commit d8319a04dafc (i.e. HEAD~1), does x86 still execute
> 'leaq (%rbp, %r10, 1), %r10' on a register that already holds a resolved
> pointer, producing r10 = rbp + (frame_ptr + stack_off_cnt) -- roughly
> 2*rbp, a non-canonical address?
>
> bpf_check_timed_may_goto() then reads and writes p->timestamp / p->count
> through it (kernel/bpf/core.c:3410). Would any BPF program containing
> may_goto oops on x86_64 at that commit?
>
> The same window exists for arm64, riscv, powerpc64 and s390, whose
> trampolines are only converted in the four later commits d35642770d98,
> 7053db7d3c0d, 6e03227c5677 and 20356163d51e. Is the tree bisectable across
> the series?
>
> The two halves carry different Fixes: tags (this one 2fb761823ead, the
> fixups.c one e723608bf428), which invites a partial stable backport that
> reintroduces exactly this wild-pointer write. Would squashing the fixups.c
> ABI change with the arch trampoline updates, or ordering all arch updates
> before the generic change, address the bisectability concern?
>
> >       /* Setup frame. */
> >       pushq %rbp
> >       movq %rsp, %rbp
>

I tried to follow the same pattern used when the patches were
introduced, but this is a valid concern.
Should I just squash all the patches to one then?

> The x86-only __xlated expectations for the timed may_goto expansion in
> tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c were never
> updated for the new 7-insn -> 8-insn sequence. The test expects:
>
>     __xlated("7: if r12 == 0x0 goto pc+6")
>     __xlated("8: r12 -= 1")
>     __xlated("9: if r12 != 0x0 goto pc+2")
>     __xlated("10: r12 = -24")
>     __xlated("11: call unknown")
>     __xlated("12: *(u64 *)(r10 -24) = r12")
>

I've fixed this in the selftests patch.

> Does this test fail on x86_64 for the whole series? Every line from index
> 7 onward is now wrong: the first branch becomes 'goto pc+7' (insn->off + 6
> instead of insn->off + 5), the second becomes 'goto pc+3' instead of
> 'pc+2', 'r12 = -24' is replaced by the pair 'r12 = r10' / 'r12 += -24',
> and the trailing indices shift by one ('call unknown' at 12, the store at
> 13, then 14 and 15).
>
> git log 28bd77eb835b..8dc5c7d5340d shows the only selftest commit in the
> series is 8dc5c7d5340d ("selftests/bpf: Test timed may_goto with private
> stacks"), which adds new coverage but does not touch
> verifier_bpf_fastcall.c. Note the original x86 JIT enablement commit
> 2fb761823ead -- the commit this patch lists in its Fixes: tag -- adjusted
> this very test for the same reason, so the update belongs with the ABI
> change.
>
> > commit 28bd77eb835bc1a95190315e93afbc6bb186b9ff
> > Author: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> >
> >     bpf, x86: Use resolved pointer for timed may_goto
> >
> >     The timed may_goto fixup now passes the resolved counter pointer through
> >     BPF_REG_AX instead of a stack offset.
> >
> >     Use the pointer directly rather than adding it to RBP. This preserves the
> >     private-stack address selected by the JIT through R9.
> >
> >     Fixes: 2fb761823ead ("bpf, x86: Add x86 JIT support for timed may_goto")
>                  ^^^^^^^^^^^
>
> The existing Fixes: tag points to commit 2fb761823ead, which is not an
> ancestor of this fix and is on a different branch (bpf-next/res_spin_lock).
>

I'll fix this in the next iteration

> The bug was actually introduced by commit 47ab38f3f4d9 in this branch's
> history, which added the incorrect code 'leaq (%rbp, %r10, 1), %r10' that
> overwrites r10 instead of preserving it.
>
> Should this use:
>
>   Fixes: 47ab38f3f4d9 ("adding ci files")
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33914557238

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

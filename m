Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A727360A2603
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kPa5sK1J;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LhYz8SYG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h0Ur6hc0yNcvRD0ZATBUKNkg789xZRKXThL1d1kbMfU=; b=kPa5sK1JJNjUt2FlGTRT8NluRE
	G2/YMzXQ6BV40S2loKi/sLRwSc5BPIs+/nmx+oKpcAHdtO2TcUSvZ7ek1p0haK37nzK7sTAG5PQqy
	MFkhwRE+06tjY3KveaQjtSMJyXNh0KSQunUvfn14j6wdq5u5OuiJX01qINclKykWnUpiv0fWopUMS
	GbG5JjU4N7F0q3dKJ7DyLUxnkss5cWCtBUTCz6Ese63tS3DvK+iY+4EDHZ9b+J5gi48L04mqt287M
	r+9iNKuB9IqMCHTwMHw8flkhUuUvks0ldRSh7LVFxRrYN+hn6acC2vhL4MpjhuenGJ2YvE6II7t/I
	3nOph7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW75U-00000008nUH-0a6l;
	Wed, 25 Nov 2026 07:06:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW75A-00000008nEy-1r1p;
	Wed, 25 Nov 2026 07:06:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 31AB444673;
	Wed, 25 Nov 2026 07:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41331F000CA;
	Wed, 25 Nov 2026 07:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795590380;
	bh=tf12otNrN4/M2wFpWK6UKOb8se/vjIpF1oB/7PJedo8=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=LhYz8SYGjI1xkHTUIwd0+xr71cge4PCaQOlERzeVkoaw+uHNBcWPZsPjDf0wf3Jx0
	 CkiyTGwincDtCV/IOiCBLzc05m75quSTAQa3zDLD3a3VpPb6ncCugwb2b4UkAB6Ntc
	 hVQKhKwrf2YNlRsmXQfKGz+19jcM1thKj5vixBjMRh0F8G5/utYJ4srAvt8umULiR1
	 8cEQ7O6QJoqCgOiFWRrzypC4LQ+C7I9oQ/szMjM3unGdF70B3QAaUoRZEfpuwg9uG7
	 y+K/UDM5HdBU04VDnMsKI1VA9QiMrbH6B5rsh0/jwGm+aJgsCPjNpg+6KM0zSFfti8
	 KyF4tubmAb4Cw==
Content-Type: multipart/mixed; boundary="===============3552485567889792111=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <6de91cfc63dfb312e51a201bcffd8890ab902cf9c9da92d9f57c2aae542c9095@mail.kernel.org>
In-Reply-To: <20261125061523.1540234-16-irogers@google.com>
References: <20261125061523.1540234-16-irogers@google.com>
Subject: Re: [RFC PATCH v2 15/30] arm64: Add DWARF CFI annotations to entry, ftrace, EFI, BPF, and KASAN
From: bot+bpf-ci@kernel.org
To: irogers@google.com,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org,rostedt@goodmis.org,peterz@infradead.org,mingo@redhat.com,tglx@kernel.org,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,linux-riscv@lists.infradead.org,acme@kernel.org,namhyung@kernel.org,linux-perf-users@vger.kernel.org,mhiramat@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,bpf@vger.kernel.org,nathan@kernel.org,llvm@lists.linux.dev,nsc@kernel.org,linux-kbuild@vger.kernel.org,ojeda@kernel.org,rust-for-linux@vger.kernel.org,ardb@kernel.org,linux-efi@vger.kernel.org,maz@kernel.org,oupton@kernel.org,kvmarm@lists.linux.dev,shuah@kernel.org,linux-kselftest@vger.kernel.org,indu.bhagat@oracle.com,jremus@linux.ibm.com,wnliu@google.com,dylanbhatch@google.com,irogers@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yongho
 ng.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Wed, 25 Nov 2026 07:06:15 +0000 (UTC)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3552485567889792111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> arm64: Add DWARF CFI annotations to entry, ftrace, EFI, BPF, and KASAN

TL;DR: Commit message only: it claims bpf_jit_supports_exceptions() is changed
but only a comment is, possibly premature before the unwinder commit; it also
omits an unconditional xzr store in return_to_handler.

>     arm64: Add DWARF CFI annotations to entry, ftrace, EFI, BPF, and KASAN
>
>     Annotate arm64 hand-written assembly helpers with .cfi_* directives
>     under CONFIG_UNWINDER_DWARF_CFI so runtime .eh_frame unwinding traverses
>     call_on_irq_stack(), __efi_rt_asm_wrapper(), return_to_handler() (and
>     exports ftrace_caller_end), __hwasan_tag_mismatch(), and
>     arch_bpf_timed_may_goto(), and allow bpf_jit_supports_exceptions() when
>     CONFIG_UNWINDER_DWARF_CFI is enabled.
>
>     Signed-off-by: Ian Rogers <irogers@google.com>

The commit message says the patch will "allow bpf_jit_supports_exceptions()
when CONFIG_UNWINDER_DWARF_CFI is enabled", but the arm64 hunk only
rewrites the comment:

> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -3909,10 +3909,11 @@ u64 bpf_arch_uaddress_limit(void)
>  
>  bool bpf_jit_supports_exceptions(void)
>  {
> -	/* We unwind through both kernel frames starting from within bpf_throw
> -	 * call and BPF frames. Therefore we require FP unwinder to be enabled
> -	 * to walk kernel frames and reach BPF frames in the stack trace.
> -	 * ARM64 kernel is always compiled with CONFIG_FRAME_POINTER=y
> +	/*
> +	 * We unwind through both kernel frames starting from within bpf_throw
> +	 * call and BPF frames. Both UNWINDER_FRAME_POINTER and
> +	 * UNWINDER_DWARF_CFI preserve x29 across kernel frames and walk
> +	 * JITed BPF frame records.
>  	 */
>  	return true;
>  }

bpf_jit_supports_exceptions() returned true unconditionally before this
patch and still does.  The wording looks like it came from the x86 patch in
this series, which added "|| IS_ENABLED(CONFIG_UNWINDER_DWARF_CFI)".

There is also an ordering question.  At this commit arm64 has neither
UNWINDER_FRAME_POINTER nor UNWINDER_DWARF_CFI; both arrive in the next
commit, 14d0cf0eeab5 ("arm64/unwind: Add Minimal DWARF CFI kernel
unwinder").  The removed sentence "ARM64 kernel is always compiled with
CONFIG_FRAME_POINTER=y" is still true here and stops being true only in that
commit.  Should this comment change move there?

The message also says the annotations are added "under
CONFIG_UNWINDER_DWARF_CFI", but one change in return_to_handler is not under
that option:

> @@ -338,12 +352,24 @@ SYM_CODE_START(return_to_handler)
> -	/* Save the callsite's FP */
> +	/* Save the callsite's FP and clear unused LR slot in ftrace_regs */
>  	str	x29, [sp, #FREGS_FP]
> +	str	xzr, [sp, #FREGS_LR]
> +#ifdef CONFIG_UNWINDER_DWARF_CFI

The str xzr store runs in every CONFIG_FUNCTION_GRAPH_TRACER build.  It
looks harmless, since ftrace_partial_regs() used to copy stack garbage into
regs->regs[30] for kprobe_multi return programs and now copies 0, but it is
not mentioned in the changelog.

Could the changelog say that the bpf_jit_comp.c part only updates the
justification ahead of the unwinder-choice commit (or move it there), and
mention the unconditional FREGS_LR store?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45561209846
--===============3552485567889792111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3552485567889792111==--


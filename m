Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8721A606A323
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FVAFpleW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYDA9t8w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GbMv3CCEzwUlNBE3RxE6ZEwNXinP7BG5Z+t/LYfwOww=; b=FVAFpleW3VFVfoZDlXapvzzPOC
	ZmEnT9vQkaTDENoSiodE9MhPVjHGdPlNRNLBtfsapqj+X1Leqj7jtUKtNbS4e8YtVgwnzdSoRpyTh
	JdgEa/CxhUCTLKMRgR6+7FhNjeVK9qd09okEgAGb3ujylIljlu+7jX3n6PCzMrbVNVsARW4gSHzGm
	ib0Pc4s3ZnxAKC9pyf51HlWBwBzoIrsCbLbr4ODbIypMFnq2Wcbv7HJ9sj6FbX4DQZHPEdBo1lPun
	/30GawXb6fJpC2qdPNs3WxyR0x1bl+kWKjYnxXUEpfUtudSXZy3EUwkrclcj3ja2dGs7Y8bOMRurZ
	YJeTpqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW75m-00000008nvR-0brU;
	Wed, 25 Nov 2026 07:06:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW75j-00000008npp-0r3B;
	Wed, 25 Nov 2026 07:06:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E8DC544003;
	Wed, 25 Nov 2026 07:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362D41F000EB;
	Wed, 25 Nov 2026 07:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795590414;
	bh=6+2sBF4UGgNSi1pC4PKTKJ+2fuWG4BySrMPF8SXLyvw=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=EYDA9t8wPTTIOmpJQN+1x/1ojVmic2gMFJnin56uQu21yU2ozij8RaQrM+4OddC8c
	 yaV6kxuA0FVl63uhWjhk0Tt0UClD35F5droy0lb8c2KbMrGlt0oNRemaEc2jpn4ZKw
	 veHmUL8m7aOP0O0PFp14n1H8AA2DGm+UgzH7DTLZE0qhOiMEBv+pe4JeLsUEyTy4KO
	 87/WG3vvAVX49+K8oNuIGwQKEyqpEAsaWmwC5dxqAIij70w1ftKqt6BQmCDhJZYDpe
	 NT/TNbzo6EoDnXW9N2T0Fm11Un4rp8nQ5t+ADm4hRyNz3I4dxq6cNnOcsmVgdzc6SK
	 a9j1oqe2P2h5g==
Content-Type: multipart/mixed; boundary="===============8194175368741298771=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <a8cf21b1f0e36cfeac11d08e6093e9abc8037e04d1747d452498bf79941c5ddb@mail.kernel.org>
In-Reply-To: <20261125061523.1540234-17-irogers@google.com>
References: <20261125061523.1540234-17-irogers@google.com>
Subject: Re: [RFC PATCH v2 16/30] arm64/unwind: Add Minimal DWARF CFI kernel unwinder
From: bot+bpf-ci@kernel.org
To: irogers@google.com,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org,rostedt@goodmis.org,peterz@infradead.org,mingo@redhat.com,tglx@kernel.org,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,linux-riscv@lists.infradead.org,acme@kernel.org,namhyung@kernel.org,linux-perf-users@vger.kernel.org,mhiramat@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,bpf@vger.kernel.org,nathan@kernel.org,llvm@lists.linux.dev,nsc@kernel.org,linux-kbuild@vger.kernel.org,ojeda@kernel.org,rust-for-linux@vger.kernel.org,ardb@kernel.org,linux-efi@vger.kernel.org,maz@kernel.org,oupton@kernel.org,kvmarm@lists.linux.dev,shuah@kernel.org,linux-kselftest@vger.kernel.org,indu.bhagat@oracle.com,jremus@linux.ibm.com,wnliu@google.com,dylanbhatch@google.com,irogers@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yongho
 ng.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Wed, 25 Nov 2026 07:06:50 +0000 (UTC)
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8194175368741298771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> arm64/unwind: Add Minimal DWARF CFI kernel unwinder

TL;DR: The module lookup (__module_address) called from the noinstr arm64
stack walkers is unannotated, so kprobes or tracing may re-enter the walker
and RCU may not be watching; no concrete crash found.

> diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
> --- a/arch/arm64/kernel/stacktrace.c
> +++ b/arch/arm64/kernel/stacktrace.c

[ ... ]

> +/**
> + * arm64_dwarf_cfi_module_find() - Look up Minimal DWARF CFI in loadable modules
> + * @pc: Kernel instruction pointer to evaluate.
> + * @row: Output evaluated Minimal DWARF CFI row.
> + *
> + * Uses rcu_read_lock_sched_notrace() and rcu_dereference_raw() so lookups are
> + * safe inside noinstr stack walks and NMI contexts.
> + *
> + * Return: 0 on success, -ENOENT if @pc is not in a module FDE, or a negative
> + * errno on invalid FDE bytecode.
> + */
> +static __always_inline int
> +arm64_dwarf_cfi_module_find(unsigned long pc, struct dwarf_cfi_row *row)
> +{
> +	struct mod_dwarf_cfi_index *idx;
> +	struct module *mod;
> +	int ret;
> +
> +	rcu_read_lock_sched_notrace();
> +	mod = __module_address(pc);

Is this safe inside the noinstr stack walkers?

arm64_dwarf_cfi_module_find() is __always_inline into arch_stack_walk(),
arch_stack_walk_reliable() and arch_bpf_stack_walk(), which are all
noinline noinstr.  But __module_address() is an ordinary out-of-line
function with no noinstr, notrace or NOKPROBE_SYMBOL() annotation, and it
calls mod_find(), which is also unannotated.

The arm64 walker was made noinstr by commit 0fbcd8abf337 ("arm64: Prohibit
instrumentation on arch_stack_walk()") because the stacktrace code can be
used in kprobe context and cannot be safely probed.  With
CONFIG_UNWINDER_DWARF_CFI=y, any pc not covered by the vmlinux
.eh_frame_hdr (module text, BPF JIT code, asm without CFI such as the
el1h_64_sync vectors) goes to __module_address().  Can a kprobe, fprobe or
function tracer attached to __module_address() or mod_find() now fire from
inside the walker, for example via a kprobe event with a stacktrace trigger
that re-hits the probe?

Separately, rcu_read_lock_sched_notrace() only skips lockdep and tracing.
It does not make RCU watch, so is the RCU-sched read side section valid
in a noinstr region where RCU may not be watching?

The comment claims the lookup is "safe inside noinstr stack walks and NMI
contexts", and the commit message calls kunwind_next_cfi() "noinstr-safe".
Either the module lookup path needs to be noinstr or kprobe-blacklisted,
or the comment and commit message should drop that claim.  I could not
construct a concrete crash through the current kprobe re-entry handling.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45561209846
--===============8194175368741298771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8194175368741298771==--


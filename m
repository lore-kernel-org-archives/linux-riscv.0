Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DDC606A31D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 00:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M9G5WUni;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQyg0+hy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c7V4SSnF9cTEX2y27ZniSQasgD4kKfUuEL11cKdNwRM=; b=M9G5WUnishwydKr2ahmO+HAXPJ
	WZEvlHmgZbvir/4EcbSpWkfUXMWTfXwLgs+POKYcUF2XJFYH8LPaJqOtr/QDlgMOBqSSExIs3DakU
	EJE22jvAWJSacOBPqEEHUhYB1n04EFIzEWTN/bJ/KhYRFqW4+wlSvHekWKK5jOycUyHGR4zaF6Ply
	gRGofvoifLAMJ3UKz7GOTealrC2NT5fi6WtMW/E97AfDtpjFEYlFAzqKoiujsrzxNih987xU0C9VL
	sIRMeVo6AFUTrprNxqHWsOt4Cztqn2BthhjR1Asvsd20VUI6se0xpVDZpXHU5fRSd/KVWq7V6mPui
	E0qBZ1wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI66-00000001zBn-1BO1;
	Mon, 23 Nov 2026 00:39:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI63-00000001zB6-1UJG;
	Mon, 23 Nov 2026 00:39:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F4ED61879;
	Mon, 23 Nov 2026 00:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879B01F000CA;
	Mon, 23 Nov 2026 00:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795394389;
	bh=PoQAgAi4SsG/ALVfUnoUkJyn+DyGMuCfLxAQhCZvy1U=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=jQyg0+hyIOUk5ZUyV35FWjse5XowVORSf874N4s6kc8mr2FsoTNaawGmqqpQCkjS9
	 ZwDRYmI0saY6rlsrczcP/rB3PIa+akAwyvKzcK6reziBxFWamgV8edcWzxXSOCdAcY
	 Np1I9BaTgKWLXBX6ABscXy97xhTu9tsuTO9Me0ecZeUgnJdsAjxTXyn1dCCxzZTSii
	 zA1vphX2daI3J96L1I3YIK+1wqe0d7mHE6Al2pPzx2EiI/qR6tbwLTDXTVj+nkoYfM
	 C7UMQ/NlJxXLnP6PHPmAga4Em6YJjVb2Q7UYely1UtvU/ZjJlCrzjLca4VHj4ei9ZR
	 ZTn3txTyJls3Q==
Content-Type: multipart/mixed; boundary="===============8029890971532200664=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <1a25d1706794155410612608bd28a535e5f6796b96cd294439b19f55ac467c82@mail.kernel.org>
In-Reply-To: <20261122235757.3456048-9-irogers@google.com>
References: <20261122235757.3456048-9-irogers@google.com>
Subject: Re: [RFC PATCH v1 08/11] riscv: unwind_user: Support Minimal DWARF CFI and FP user unwinding
From: bot+bpf-ci@kernel.org
To: irogers@google.com,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org,rostedt@goodmis.org,peterz@infradead.org,mingo@redhat.com,tglx@kernel.org,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,linux-riscv@lists.infradead.org,acme@kernel.org,namhyung@kernel.org,linux-perf-users@vger.kernel.org,mhiramat@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,bpf@vger.kernel.org,nathan@kernel.org,nsc@kernel.org,linux-kbuild@vger.kernel.org,ojeda@kernel.org,rust-for-linux@vger.kernel.org,ardb@kernel.org,linux-efi@vger.kernel.org,maz@kernel.org,oupton@kernel.org,kvmarm@lists.linux.dev,shuah@kernel.org,linux-kselftest@vger.kernel.org,indu.bhagat@oracle.com,jremus@linux.ibm.com,wnliu@google.com,dylanbhatch@google.com,irogers@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mas
 on@kernel.org,ihor.solodrai@linux.dev
Date: Mon, 23 Nov 2026 00:39:45 +0000 (UTC)
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

--===============8029890971532200664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> riscv: unwind_user: Support Minimal DWARF CFI and FP user unwinding

TL;DR:
- Nits only: a comment names a nonexistent __compat_vdso_rt_sigreturn symbol
- The !CONFIG_MMU branch in the sigreturn unwinder looks like dead code, since
  Kconfig requires MMU

> diff --git a/arch/riscv/kernel/compat_signal.c b/arch/riscv/kernel/compat_signal.c
> --- a/arch/riscv/kernel/compat_signal.c
> +++ b/arch/riscv/kernel/compat_signal.c

[ ... ]

> +#ifdef CONFIG_UNWIND_USER
> +/**
> + * compat_unwind_user_sigreturn() - Unwind an RV32 compat vDSO rt_sigreturn frame
> + * @state: Current user unwind state.
> + *
> + * Return: true if @state was at __compat_vdso_rt_sigreturn and advanced to the
> + * interrupted 32-bit user context, false otherwise.
> + */

This isn't a bug, but __compat_vdso_rt_sigreturn does not appear to exist
anywhere in the tree.

arch/riscv/kernel/compat_vdso/rt_sigreturn.S just includes
../vdso/rt_sigreturn.S, so the compat vDSO symbol is also
__vdso_rt_sigreturn, which COMPAT_VDSO_SYMBOL(mm->context.vdso,
rt_sigreturn) resolves through compat__vdso_rt_sigreturn_offset.

Could the comment say "the compat vDSO __vdso_rt_sigreturn" instead?

> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c

[ ... ]

> +#ifdef CONFIG_UNWIND_USER

[ ... ]

> +	frame = (struct rt_sigframe __user *)state->sp;
> +#ifdef CONFIG_MMU
> +	if (!mm->context.vdso)
> +		return false;
> +	sigret = (unsigned long)VDSO_SYMBOL(mm->context.vdso, rt_sigreturn);
> +#else
> +	sigret = (unsigned long)&frame->sigreturn_code;
> +#endif

Can the !CONFIG_MMU branch here ever be built?

This function is inside #ifdef CONFIG_UNWIND_USER, and UNWIND_USER is only
selected by HAVE_UNWIND_USER_FP and HAVE_UNWIND_USER_CFI.  The Kconfig
change in this patch selects both only when MMU is set:

	select HAVE_UNWIND_USER_CFI if MMU
	select HAVE_UNWIND_USER_FP if MMU

So CONFIG_UNWIND_USER=y on riscv implies CONFIG_MMU=y, and the
&frame->sigreturn_code path can never be compiled or tested.  Should the
#ifdef CONFIG_MMU / #else be dropped, leaving only the vDSO lookup?  A
nommu variant could come together with the Kconfig change that enables it.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45087188604
--===============8029890971532200664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8029890971532200664==--


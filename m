Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647BEC5CFCF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 17:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UksT4OW2+4vi8284oGNJncb5lzekvrFblapJBsmecsY=; b=zeikUuvSavAMfTHjPxyqPolBCF
	YTvOaZ/PKtgQTnvPxDkiAL1LiAmCT1mfmQIaM4BqpBwlDmsd2t1pCPN88CCXeY5zF+ztdu+XrpizG
	DVDej9qhvlnWtO56W1n0utW/KrggRil1LxcbLEzOp7E61mLD1K7gVfd3+p1q9/d8PiQBftCx7gw9g
	mtKJWwFGMpX5oBgYE6UND4TXqDX5IhVw3Jbd5H0KK90YrLtAUeI6VVe33AxZ5H3O6azKINACc6DG9
	q1qdIVO/Sx4L1aXPpbliq/c8B+fhGftJHrzRJdHnyWF8+Q88pBwK6XXRzHfCyFvn3cJPfAkZOqf96
	rpZ6zaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvb1-00000002yqL-2oi1;
	Fri, 14 Aug 2026 17:21:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvaz-00000002yqE-3GU4
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 17:21:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 86A40434B5;
	Fri, 14 Aug 2026 17:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615AE1F000E9;
	Fri, 14 Aug 2026 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786728089;
	bh=hIUmBOdY6HX7M5gu+2gq+RKIctitw4NlYYYUXiCL7Bw=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=mS2m34YxevKISKQgpfSgIK+BqRJfJvtR5yJeKFZk01uxIXNA6WmPSrYeg6B9FULKS
	 Ko1Be2DLNLX3KNTiQCZd7EUFKh9OzOAmUYRjYnhh/MCadORT7tNAfR0aSCCNZFOoZm
	 gqxb3i0PkRB5e/sQL3oTNglZMu7T7i32Kb85vYLzNvHugYK8FhkDTGkD1w3RrL0cd4
	 H5qT9UBXi57cb2bxiI9+LL3M2wtf3bWfqeETPG6o9ygFkTtWZFdBtLHA2b0tX3gsOT
	 O+bKmRKKrHQrBSbBEqaIgPBvF0kIVnGION1iKfzMwjhNoSAj8czDEIoz/iyccrdy9O
	 LtLysnex+1GsA==
Content-Type: multipart/mixed; boundary="===============8474726166455005706=="
MIME-Version: 1.0
Message-Id: <2d5fd63ede99cfdeb2d64b074e29d70e28d45332244c353f829139627f72c6e5@mail.kernel.org>
In-Reply-To: <20260812171940.1046116-1-bill.roberts@arm.com>
References: <20260812171940.1046116-1-bill.roberts@arm.com>
Subject: Re: [PATCH v2 1/2] x86/shstk: support via prctl
From: bot+bpf-ci@kernel.org
To: bill.roberts@arm.com,hpa@zytor.com,aou@eecs.berkeley.edu,alex@ghiti.fr,bp@alien8.de,dave.hansen@linux.intel.com,mingo@redhat.com,palmer@dabbelt.com,pjw@kernel.org,rick.p.edgecombe@intel.com,shuah@kernel.org,tglx@kernel.org,x86@kernel.org
Cc: bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-kselftest@vger.kernel.org,linux-riscv@lists.infradead.org,bill.roberts@arm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Fri, 14 Aug 2026 17:21:28 +0000 (UTC)
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

--===============8474726166455005706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> commit da8268120aa61fb379fb63e246049155c172ab29
> Author: Bill Roberts <bill.roberts@arm.com>
>
>     x86/shstk: support via prctl
>
>     Historically, managing the user-space shadow stack state on x86 has
>     been handled exclusively through the arch_prctl() interface via the
>     ARCH_SHSTK_* operations. However, other architectures (such as arm64 and
>     riscv) do not implement arch_prctl() and instead utilize the newer,
>     arch-agnostic, prctl() interface (i.e. PR_GET_SHADOW_STACK_STATUS and
>     PR_SET_SHADOW_STACK_STATUS).
>
>     To provide language runtimes, toolchains, and libc implementations with a
>     consistent, cross-architecture interface for managing control-flow
>     integrity, wire up the generic shadow stack prctl handlers for x86.
>
>     Map the generic PR_SHADOW_STACK_ENABLE, PR_SHADOW_STACK_DISABLE, and
>     PR_SHADOW_STACK_LOCK operations onto the underlying x86 internal CET helper
>     routines. This allows portable userspace applications to toggle or query
>     shadow stack states without relying on architecture-specific system calls,
>     while maintaining backward compatibility with existing arch_prctl() calls.
>
>     Signed-off-by: Bill Roberts <bill.roberts@arm.com>

Does this description accurately reflect the prctl interface?

Looking at include/uapi/linux/prctl.h, the interface defines three
operations (PR_GET_SHADOW_STACK_STATUS, PR_SET_SHADOW_STACK_STATUS, and
PR_LOCK_SHADOW_STACK_STATUS) and three status bits
(PR_SHADOW_STACK_ENABLE, PR_SHADOW_STACK_WRITE, and
PR_SHADOW_STACK_PUSH).

PR_SHADOW_STACK_DISABLE and PR_SHADOW_STACK_LOCK do not exist as
separate operations. Disabling is expressed by clearing
PR_SHADOW_STACK_ENABLE via PR_SET_SHADOW_STACK_STATUS.

Also, the commit message doesn't mention that x86 only implements
PR_SHADOW_STACK_ENABLE and PR_SHADOW_STACK_WRITE. Could this be more
precise about which status bits are actually supported?

> diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
> index 0ca64900192f8..c34ba3701dd06 100644
> --- a/arch/x86/kernel/shstk.c
> +++ b/arch/x86/kernel/shstk.c
> @@ -18,6 +18,7 @@
>  #include <linux/sizes.h>
>  #include <linux/user.h>
>  #include <linux/syscalls.h>
> +#include <linux/prctl.h>
>  #include <asm/msr.h>
>  #include <asm/fpu/xstate.h>
>  #include <asm/fpu/types.h>
> @@ -630,3 +631,39 @@ bool shstk_is_enabled(void)
>  {
>  	return features_enabled(ARCH_SHSTK_SHSTK);
>  }
> +
> +#define PR_SHADOW_STACK_SUPPORTED_STATUS_MASK \
> +		(PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_WRITE | PR_SHADOW_STACK_PUSH)

Is PR_SHADOW_STACK_PUSH actually supported on x86?

The mask includes PR_SHADOW_STACK_PUSH, which is copied from arm64, but
shstk_prctl() only handles ARCH_SHSTK_SHSTK and ARCH_SHSTK_WRSS. Nothing
in arch_set_shadow_stack_status() below consumes the PUSH bit.

So prctl(PR_SET_SHADOW_STACK_STATUS, PR_SHADOW_STACK_ENABLE |
PR_SHADOW_STACK_PUSH) returns success while silently not providing push
support. The following PR_GET_SHADOW_STACK_STATUS returns only
PR_SHADOW_STACK_ENABLE, violating the documented contract in
include/uapi/linux/prctl.h (the returned value should match what was
configured).

riscv sets the precedent here by narrowing the mask to what the arch
actually implements: arch/riscv/include/asm/usercfi.h defines it as
(PR_SHADOW_STACK_ENABLE) only. Should x86 likewise use
(PR_SHADOW_STACK_ENABLE | PR_SHADOW_STACK_WRITE) so unsupported bits are
rejected with -EINVAL?

> +
> +/* Handles the generic prctl interface for PR_SET_SHADOW_STACK_STATUS and its feature bits */
> +int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
> +{
> +	int rc;
> +
> +	if (status & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
> +		return -EINVAL;
> +
> +	/* x86 arch_prctl is single bit at a time, so handle these one at time */
> +	if (!status & PR_SHADOW_STACK_ENABLE)
> +		return shstk_prctl(t, ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK);

Could this be a precedence issue?

The ! operator binds tighter than &, so !status & PR_SHADOW_STACK_ENABLE
evaluates as (!status) & 1, which is true only when status == 0.

Looking at the consequences for user-controlled status values:
- status == 0: (!0) & 1 == 1, so disable. Correct.
- status == PR_SHADOW_STACK_ENABLE (1): (!1) & 1 == 0, so skip to
  enable. Correct.
- status == PR_SHADOW_STACK_WRITE (2): (!2) & 1 == 0, so the disable
  branch is skipped and the function falls through to enable the shadow
  stack.

So a request that explicitly does NOT contain PR_SHADOW_STACK_ENABLE
instead enables the shadow stack. This allocates a shadow stack VMA and
writes MSR_IA32_U_CET/MSR_IA32_PL3_SSP via shstk_setup().

Because the shadow stack is empty, the userspace function that invoked
prctl() takes a control-protection fault on its return. Is the intent
here !(status & PR_SHADOW_STACK_ENABLE)?

For comparison, arm64 uses (arg & PR_SHADOW_STACK_ENABLE && ...) in
arch/arm64/mm/gcs.c and riscv uses (enable_shstk = status &
PR_SHADOW_STACK_ENABLE) in arch/riscv/kernel/usercfi.c, both with
explicit parentheses.

> +
> +	rc = shstk_prctl(t, ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK);
> +	if (rc)
> +		return rc;
> +
> +	if (status & PR_SHADOW_STACK_WRITE)
> +		return shstk_prctl(t, ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS);
> +
> +	return shstk_prctl(t, ARCH_SHSTK_DISABLE, ARCH_SHSTK_WRSS);

Can the second shstk_prctl() call fail after the first one succeeds?

The enable path splits into two shstk_prctl() calls with no rollback.
shstk_prctl() rejects any operation on a locked feature (if (features &
task->thread.features_locked) return -EPERM, at shstk.c:596), and the
WRSS step is executed unconditionally here - either ENABLE WRSS or
DISABLE WRSS.

With ARCH_SHSTK_WRSS locked (reachable via arch_prctl(ARCH_SHSTK_LOCK,
ARCH_SHSTK_WRSS) or prctl(PR_LOCK_SHADOW_STACK_STATUS,
PR_SHADOW_STACK_WRITE)):

1. prctl(PR_SET_SHADOW_STACK_STATUS, PR_SHADOW_STACK_ENABLE)
2. shstk_prctl(ENABLE, ARCH_SHSTK_SHSTK) succeeds: shadow stack is
   allocated, CET_SHSTK_EN is set, features_set(ARCH_SHSTK_SHSTK)
3. shstk_prctl(DISABLE, ARCH_SHSTK_WRSS) returns -EPERM (locked)
4. arch_set_shadow_stack_status() returns -EPERM

Userspace sees the prctl fail, so it believes nothing changed, but the
shadow stack is now enabled and the shadow stack VMA is leaked into the
thread state. The caller then faults (#CP) on its return.

Note the request itself was perfectly satisfiable: PR_SHADOW_STACK_ENABLE
without PR_SHADOW_STACK_WRITE only needs WRSS to stay off, which it
already is.

Both arm64 (gcs_check_locked() before any state change,
arch/arm64/mm/gcs.c:174) and riscv (is_shstk_locked() check before
allocation, arch/riscv/kernel/usercfi.c:397) validate the locked state
up front so that a failing PR_SET_SHADOW_STACK_STATUS leaves the thread
untouched.

> +}
> +
> +/* Handles the generic prctl interface for PR_LOCK_SHADOW_STACK_STATUS and its feature bits */
> +int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status)
> +{
> +	return shstk_prctl(t, ARCH_SHSTK_LOCK, status);
> +}
> +
> +int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
> +{
> +	return shstk_prctl(t, ARCH_SHSTK_STATUS, (unsigned long)status);
> +}

---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/31820235607
--===============8474726166455005706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8474726166455005706==--


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB788606A6A7
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 00:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JxKYOxTn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+PR/x1I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lUdrbppwU4pHP9RdAGcgWMsp18Uk99jypQkrhAijV8w=; b=JxKYOxTndB+16/+cmihYa3ZFqZ
	v51cvMHA1quhb4P3ozwbXYtYPkobAB8yJh6Svq+fnjjaGj06QkMRUPYRBW3FqXt/Yb6y9qoZCRAyw
	ypqEqSUAEs/ZJYYBsQ0ggrPQ+IYB9dwEtvGpR3xcRbH33AzPbYJzvBFtDhuaw/3wzWJVoRESDzbKj
	GMZffiKXe9ZE9uRSxNjKplLA5UpCx5ygV3tGxH3xZqVjgTg2emWfInrcI1Vs3se8Pgfma+NfO3K+9
	YB84K41nzswNZl2bPVhXOsV6nIonBJbm8BvXIE15zRc582suHTrVgShRAuuhh4fb7/5zYf9pm65Ke
	POyIZAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI6V-00000001zTd-3TBc;
	Mon, 23 Nov 2026 00:40:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI6T-00000001zS9-1dtO;
	Mon, 23 Nov 2026 00:40:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8AD140756;
	Mon, 23 Nov 2026 00:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203561F0157D;
	Mon, 23 Nov 2026 00:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795394416;
	bh=7l+dD/W+BgV5YgI2G/09krvBCEN+4VhBdym5+PJEAjA=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=P+PR/x1Ic0FMmBINkGnzjlhVNTqrgdSr6ODVINX+75rWP5OpP9BGalwwv3/d9VNSA
	 CQSh4D/rjj+1M78cLXWFTLgo0IhKgin2cw7xejAJ/2t5KFGRNF0veGEbH542pRDqUm
	 081AAu0XpDF+e5fpQJVItumdlwggjHlPCpjJwOHGu7cry04g4HGn7tU9Swacdn41GB
	 Y1u78LgnGiCs2JXBPJJ6DoB/CVl7rRrSn3dd+KNGu/KGrW9eYuN6hbyMTOarrxji+v
	 gh4lB1GtH/zgNAbIL2J0RQ98Af1tfequRK2bprfqw4IGS2+elLrOMQuxA6i0eMc9fn
	 hTY8CIZMbclgw==
Content-Type: multipart/mixed; boundary="===============0669259821457419272=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <3ae6b586116787e3221428028ac62cb6cd4fc70ba1740a541f515f78bb2c8ce0@mail.kernel.org>
In-Reply-To: <20261122235757.3456048-11-irogers@google.com>
References: <20261122235757.3456048-11-irogers@google.com>
Subject: Re: [RFC PATCH v1 10/11] selftests/perf_events: Add Minimal DWARF CFI deferred user unwind test
From: bot+bpf-ci@kernel.org
To: irogers@google.com,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org,rostedt@goodmis.org,peterz@infradead.org,mingo@redhat.com,tglx@kernel.org,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,linux-riscv@lists.infradead.org,acme@kernel.org,namhyung@kernel.org,linux-perf-users@vger.kernel.org,mhiramat@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,bpf@vger.kernel.org,nathan@kernel.org,nsc@kernel.org,linux-kbuild@vger.kernel.org,ojeda@kernel.org,rust-for-linux@vger.kernel.org,ardb@kernel.org,linux-efi@vger.kernel.org,maz@kernel.org,oupton@kernel.org,kvmarm@lists.linux.dev,shuah@kernel.org,linux-kselftest@vger.kernel.org,indu.bhagat@oracle.com,jremus@linux.ibm.com,wnliu@google.com,dylanbhatch@google.com,irogers@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mas
 on@kernel.org,ihor.solodrai@linux.dev
Date: Mon, 23 Nov 2026 00:40:12 +0000 (UTC)
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

--===============0669259821457419272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> selftests/perf_events: Add Minimal DWARF CFI deferred user unwind test

TL;DR:
- Selftest may report false "not ok" for 32-bit ARM builds on arm64 COMPAT
  kernels, since __arm__ is listed as supported (unverified)
- Redundant PERF_RECORD_CALLCHAIN_DEFERRED #ifndef (nit)

> diff --git a/tools/testing/selftests/perf_events/unwind_user_cfi.c b/tools/testing/selftests/perf_events/unwind_user_cfi.c
> new file mode 100644
> --- /dev/null
> +++ b/tools/testing/selftests/perf_events/unwind_user_cfi.c

[ ... ]

> +#include "../../../../include/linux/compiler_attributes.h"
> +
> +#ifndef PERF_RECORD_CALLCHAIN_DEFERRED
> +#define PERF_RECORD_CALLCHAIN_DEFERRED 22
> +#endif

this isn't a bug, but PERF_RECORD_CALLCHAIN_DEFERRED is an enumerator of
enum perf_event_type, not a preprocessor macro, so the #ifndef is always
true.

The defer_callchain and defer_output attr fields used later in main() come
from the same uapi change as the enumerator, so any header that compiles
this file already has it.

Could this #ifndef/#define fallback be dropped?

[ ... ]

> +#if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && \
> +	!defined(__arm__) && !defined(__riscv)
> +	ksft_test_result_skip("Architecture lacks Minimal DWARF CFI user unwind support\n");
> +	ksft_finished();
> +#endif

A subsystem pattern flags this as potentially concerning: exiting with a
status other than KSFT_SKIP when a feature is missing makes run_one()
record "not ok".

Is __arm__ correct in this list of supported architectures?

The kernel CFI user unwinder finds unwind data only through
PT_GNU_EH_FRAME.  parse_user_elf32_eh_hdr() returns -ENOENT without it:

    if (!have_load0 || !have_eh || !eh_memsz)
        return -ENOENT;

As far as I know, arm-linux-gnueabi(hf) toolchains emit ARM EHABI tables
(.ARM.exidx) rather than .eh_frame, so a normal AArch32 binary would have
no PT_GNU_EH_FRAME.  I did not have an ARM cross compiler to confirm this.

On a native arm32 kernel, arch/arm does not select HAVE_UNWIND_USER_FP or
HAVE_UNWIND_USER_CFI, so no deferred record arrives and the test reaches
its "No PERF_RECORD_CALLCHAIN_DEFERRED records" skip.

On an arm64 kernel with CONFIG_COMPAT, deferred records are produced since
unwind_user_cfi_arch() accepts ws == 4.  Each frame gets -ENOENT from
unwind_user_next_cfi(), and unwind_user_next() falls back to
unwind_user_next_fp(), which expects APCS frames at compat_fp (r11).  A
-fomit-frame-pointer build does not have those.

The record then stops after one or two entries and saw_full_chain stays
false:

    ksft_test_result(saw_full_chain, "unwind_user Minimal DWARF CFI across ...\n");
    ksft_finished();

ksft_finished() exits with KSFT_FAIL, so a 32-bit ARM build run on an
arm64 COMPAT kernel reports "not ok" because of an unsupported unwind
format rather than a kernel regression.

Should __arm__ be dropped from the supported list so the existing skip
runs, or should the test skip when the binary has no PT_GNU_EH_FRAME?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45087188604
--===============0669259821457419272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0669259821457419272==--


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453F9606A330
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W6v80GQ9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mae69HOv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H1sEa81sFFKLKXauwmI9Glzmh+aKpUUmZ2HwDn45/og=; b=W6v80GQ9Ib+PWRV8wOYMmQFrr7
	fVAZ47pDZR1hSj6iSwJUcxJia+Xhjkn7/+5FAVkauDSMxt/LTaLchxrGempMRkMmcY5aE0bNUXVJi
	72mGItpFPP8byFPMzS5lfONAHF2Og5dEH3zvQp+GTYTJ3O3T7aiw6O2Vi4YsJAQt8ehrP6djW69pE
	QTzVFsSlARKTcZidEUpBKm1YJ1cecMvPC06IVOCUvZge1E+zxcJmhAgNvkIVWM6wjCgHwsvLO1cMa
	ogFQ1vJkj6nzSy6G1oIwek06YR/0T4XBXeki2yn/p4SANFlM33gdCo0BZelch3yqu5xC8jeNezUkg
	GAviVggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW74n-00000008mrj-441F;
	Wed, 25 Nov 2026 07:05:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW74k-00000008mou-0YOu;
	Wed, 25 Nov 2026 07:05:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CB526223A;
	Wed, 25 Nov 2026 07:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05151F00A36;
	Wed, 25 Nov 2026 07:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795590353;
	bh=eY8MxL4CQsiYqvHInHyteTrR1VjWiJ0DqyBDBb2ppMM=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=mae69HOvNQF9iQmI9mch+Buz/1p55Vrhqg5GHI/FdhPJ1Spt80vXovSrv+jIYfmHC
	 NFnqRJ8MRH6Khi2QuQ3siO1GiDVva/m9Gf138mpYqxIunhIoVx0NILfAhA4jCwQums
	 42Dpu0zZVX7VxsAn+bK/23NrzJYqWYOXj/dTDvrw4e2ZsSeKFHSitMKlsiWfHmoRIC
	 iki4HZdpMKVDUdfKadRjNbm2iUhlzqZ2iSQjYc+OV7zNvHUu7RpIZiPFiHZQaik0rO
	 0PKeesZeBT8Z/tK5uLiWpN/lH7FqCp8mRZF+mvHaxDIfXwo8VnWYepsjJ/K60cyuHf
	 9rG+fRZfX9+1A==
Content-Type: multipart/mixed; boundary="===============1142665870477895472=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <1c6ad7441ca027dcd0f305477f5e65c82e85f5b049d06a8970bcfb67aa451162@mail.kernel.org>
In-Reply-To: <20261125061523.1540234-21-irogers@google.com>
References: <20261125061523.1540234-21-irogers@google.com>
Subject: Re: [RFC PATCH v2 20/30] selftests/perf_events: Add Minimal DWARF CFI deferred user unwind test
From: bot+bpf-ci@kernel.org
To: irogers@google.com,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org,rostedt@goodmis.org,peterz@infradead.org,mingo@redhat.com,tglx@kernel.org,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,linux-riscv@lists.infradead.org,acme@kernel.org,namhyung@kernel.org,linux-perf-users@vger.kernel.org,mhiramat@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,bpf@vger.kernel.org,nathan@kernel.org,llvm@lists.linux.dev,nsc@kernel.org,linux-kbuild@vger.kernel.org,ojeda@kernel.org,rust-for-linux@vger.kernel.org,ardb@kernel.org,linux-efi@vger.kernel.org,maz@kernel.org,oupton@kernel.org,kvmarm@lists.linux.dev,shuah@kernel.org,linux-kselftest@vger.kernel.org,indu.bhagat@oracle.com,jremus@linux.ibm.com,wnliu@google.com,dylanbhatch@google.com,irogers@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yongho
 ng.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Wed, 25 Nov 2026 07:05:48 +0000 (UTC)
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

--===============1142665870477895472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> selftests/perf_events: Add Minimal DWARF CFI deferred user unwind test

TL;DR: Test issues only, low severity: unwind_user_cfi.c includes a
kernel-internal header and #undefs macros, and may report "not ok" instead of
skip when perf_event_open returns ENOSYS.

> diff --git a/tools/testing/selftests/perf_events/unwind_user_cfi.c b/tools/testing/selftests/perf_events/unwind_user_cfi.c
> new file mode 100644
> index 000000000000..a36e9f4d39e2
> --- /dev/null
> +++ b/tools/testing/selftests/perf_events/unwind_user_cfi.c
> @@ -0,0 +1,482 @@

[ ... ]

> +#include "../kselftest.h"
> +#undef __always_inline
> +#undef __attribute_const__
> +#undef __must_check
> +#undef __printf
> +#include "../../../../include/linux/compiler_attributes.h"

This isn't a bug, but would it be simpler to spell the few attributes this
test needs directly, for example __attribute__((noinline, noclone)) and
__attribute__((aligned(64))), instead of including
include/linux/compiler_attributes.h and #undef'ing the clashing macros
first?

From tools/testing/selftests/perf_events/ that path resolves to the
kernel-internal include/linux/ header rather than a tools/include copy, and
no other selftest includes a kernel-internal header this way.  Also,
__must_check is not defined by either earlier include, so that #undef
appears to do nothing.

[ ... ]

> +	fd = (int)sys_perf_event_open(&attr, /*pid=*/0, /*cpu=*/-1,
> +				      /*group_fd=*/-1, /*flags=*/0);
> +	if (fd < 0) {
> +		if (jit_page != MAP_FAILED)
> +			munmap(jit_page, page_sz);
> +		if (errno == EACCES || errno == EPERM || errno == EINVAL) {
> +			ksft_test_result_skip("perf_event_open(defer_callchain) unavailable: %s\n",
> +					      strerror(errno));
> +			ksft_finished();
> +		}
> +		ksft_exit_fail_msg("perf_event_open failed: %s\n", strerror(errno));
> +	}

Should ENOSYS be treated as a skip here as well?

On a kernel built without CONFIG_PERF_EVENTS, perf_event_open is a
COND_SYSCALL and returns -ENOSYS, so main() reaches ksft_exit_fail_msg()
and the runner records "not ok" instead of a skip.  The selftests guide
flags exiting nonzero other than KSFT_SKIP when a feature or config option
is missing.

The other missing prerequisites in main() (unsupported architecture, no
PT_GNU_EH_FRAME, defer bits unknown to an older kernel) are already
reported as skips, so adding ENOSYS to the errno check would make this case
consistent with them.  The neighbouring perf_events tests also fail rather
than skip when perf_event_open() fails, so this is low severity.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45561209846
--===============1142665870477895472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1142665870477895472==--


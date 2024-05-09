Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E48C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0m/8pWbQD+ARZM/UiNZ8s0/o+aX+QH6fXrjjRM711o=; b=d+/5SlyxwBKxU1
	OXlXpTBpsJoy92pH1vbDZC0dmn3gOJC7JlN3oFam31BiWHzYSI8R62ktN5vaQoWcOOCrVezYs+kvf
	x6bRQdmRONoNjwb6HwbzH2vfhDoy/BSpzAAxB/Sp2zqiefty2LrWZuiey5NXmKTk1JUlWzwuVn5EP
	7U5s+6Znh1aHhhZPH0GP/xRZRrSUZS6+cSl+cKP3DI94Jlytwrbv9d3uNH8POA7Q0G7p1DY2yzqbi
	+SdtubdHUMHCv30NYNTLrn+qpx1LkAWFo+OuTxNR5SYqIsF/7JbQoxgzJSf5kFjrdF+SqxRSHIZJV
	zLLzUGVCN72W3/AxCUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5ABc-00000002iJ4-0cVx;
	Thu, 09 May 2024 20:16:16 +0000
Received: from smtpout.efficios.com ([167.114.26.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5ABY-00000002iGA-3iSO
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1715285763;
	bh=cMWw8x/P40/KMWgVweNbntQjYA+K9n2XKgcRYU9QC9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HPZWOmhnoRkqipHqnwg6g545VwMlsV8zx/BSHSoFPE4eWw/mPW4cf0jmeu422Z636
	 jLntHYOgVNutEjpLrWE9rP1+MPli0NS8sJtlLTVtYguaOTUm+CI3HmXiFtMYktT8Ql
	 FX7RzuXYLAAEEvihpE/pWrH7pdCmnGMkPWZh//qC1SMDLhRv9YnaftIhQfQitZZkKa
	 RamXBJLbx3DsqqXTvrWF2nqFsEHQH+JMe/Okl/wi7F4CIjX7ap+LzVAwX78Jj8CHfN
	 IFkpFCckFqnrzKm/TaiKH4FX05dPGhNGc4WCKG05ghyQKfvelcPFGNsUruPcwx/gTc
	 /zFV5k2dA0e8g==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4Vb3Df5nW8zyZy;
	Thu,  9 May 2024 16:16:02 -0400 (EDT)
Message-ID: <638a7831-493c-4917-9b22-5aa663e9ee84@efficios.com>
Date: Thu, 9 May 2024 16:16:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 54/68] selftests/rseq: Drop define _GNU_SOURCE
To: Edward Liaw <edliaw@google.com>, shuah@kernel.org,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@android.com, linux-security-module@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>
References: <20240509200022.253089-1-edliaw@google.com>
 <20240509200022.253089-55-edliaw@google.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20240509200022.253089-55-edliaw@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_131613_257466_FA18D439 
X-CRM114-Status: GOOD (  18.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2024-05-09 15:58, Edward Liaw wrote:
> _GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
> redefinition warnings.
> 
> Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")

The patch per se looks fine, except for the "Fixes" tag.

Commit 809216233555 introduces use of asprintf in kselftest_harness.h
which is used by (all ?) selftests, including the rseq ones. However,
the rseq selftests each have the #define _GNU_SOURCE, which would have
been OK without those further changes.

So this patch is more about consolidating where the _GNU_SOURCE is
defined, which is OK with me, but not so much about "fixing" an
issue with commit 809216233555.

A "Fix" is something to be backported to stable kernels, and I
don't think this patch reaches that threshold.

If anything, this patch removes a warning that gets added by
https://lore.kernel.org/lkml/20240509200022.253089-1-edliaw@google.com/T/#mf8438d03de6e2b613da4f86d4f60c5fe1c5f8483
within the same series.

Arguably, each #define _GNU_SOURCE could have been first protected
by a #ifndef guard to eliminate this transient warning, and there
would be nothing to "fix" in this consolidation series.

Thoughts ?

Thanks,

Mathieu

> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
>   tools/testing/selftests/rseq/basic_percpu_ops_test.c | 1 -
>   tools/testing/selftests/rseq/basic_test.c            | 2 --
>   tools/testing/selftests/rseq/param_test.c            | 1 -
>   tools/testing/selftests/rseq/rseq.c                  | 2 --
>   4 files changed, 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/rseq/basic_percpu_ops_test.c b/tools/testing/selftests/rseq/basic_percpu_ops_test.c
> index 2348d2c20d0a..5961c24ee1ae 100644
> --- a/tools/testing/selftests/rseq/basic_percpu_ops_test.c
> +++ b/tools/testing/selftests/rseq/basic_percpu_ops_test.c
> @@ -1,5 +1,4 @@
>   // SPDX-License-Identifier: LGPL-2.1
> -#define _GNU_SOURCE
>   #include <assert.h>
>   #include <pthread.h>
>   #include <sched.h>
> diff --git a/tools/testing/selftests/rseq/basic_test.c b/tools/testing/selftests/rseq/basic_test.c
> index 295eea16466f..1fed749b4bd7 100644
> --- a/tools/testing/selftests/rseq/basic_test.c
> +++ b/tools/testing/selftests/rseq/basic_test.c
> @@ -2,8 +2,6 @@
>   /*
>    * Basic test coverage for critical regions and rseq_current_cpu().
>    */
> -
> -#define _GNU_SOURCE
>   #include <assert.h>
>   #include <sched.h>
>   #include <signal.h>
> diff --git a/tools/testing/selftests/rseq/param_test.c b/tools/testing/selftests/rseq/param_test.c
> index 2f37961240ca..48a55d94eb72 100644
> --- a/tools/testing/selftests/rseq/param_test.c
> +++ b/tools/testing/selftests/rseq/param_test.c
> @@ -1,5 +1,4 @@
>   // SPDX-License-Identifier: LGPL-2.1
> -#define _GNU_SOURCE
>   #include <assert.h>
>   #include <linux/membarrier.h>
>   #include <pthread.h>
> diff --git a/tools/testing/selftests/rseq/rseq.c b/tools/testing/selftests/rseq/rseq.c
> index 96e812bdf8a4..88602889414c 100644
> --- a/tools/testing/selftests/rseq/rseq.c
> +++ b/tools/testing/selftests/rseq/rseq.c
> @@ -14,8 +14,6 @@
>    * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
>    * Lesser General Public License for more details.
>    */
> -
> -#define _GNU_SOURCE
>   #include <errno.h>
>   #include <sched.h>
>   #include <stdio.h>

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

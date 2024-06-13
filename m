Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EFAC27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 09:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tagWgrZbkW8FVfZ+RP6zCk3KtcbhIGr+cCPXu+ZkR1k=; b=z0XgNKavVF8dg0
	yUAnmFC+zFljYct3T4vVo1L+nCVdk2iq87GBpiGpB3dwqG8Z10pp9uIbVVFwqZLwvYCO9iazWuqvV
	zGp3KuZMo0fgZx6SAEPWRw7d8CWpeztsmoFg5ktipZrMmHpmNe+Bm3cGrsWxoAMNz9NjsYsEN/9KE
	ONmCYIQk9ZCuGRlYt86tnl4TgVrsSlWQxkScXUBNK/9u0YWmAeOb7k7ukO73kS33yWEi7mqxJfTdS
	s/ZViMrUrUkyM4nT6VFyA6fB11ZEdpSdSqRgaS22dvIOjIVxAmgLQAdjrfNEEyHbHPgMH5BmNgAYi
	KGZW6AD/+gpozWxoNpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHgjy-0000000FxII-0c9P;
	Thu, 13 Jun 2024 09:27:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHgjt-0000000FxGj-3UKg;
	Thu, 13 Jun 2024 09:27:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED0ED1063;
	Thu, 13 Jun 2024 02:27:46 -0700 (PDT)
Received: from [192.168.1.100] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F0333F5A1;
	Thu, 13 Jun 2024 02:27:17 -0700 (PDT)
Message-ID: <bdf1ab6e-b887-4182-a0ae-7653bd835907@arm.com>
Date: Thu, 13 Jun 2024 10:27:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Refactor perf python module build
To: Ian Rogers <irogers@google.com>
References: <20240612183205.3120248-1-irogers@google.com>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Nick Terrell <terrelln@fb.com>,
 Ravi Bangoria <ravi.bangoria@amd.com>, Kees Cook <keescook@chromium.org>,
 Andrei Vagin <avagin@google.com>, Athira Jajeev
 <atrajeev@linux.vnet.ibm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Ze Gao <zegao2021@gmail.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 coresight@lists.linaro.org, rust-for-linux@vger.kernel.org,
 bpf@vger.kernel.org
From: James Clark <james.clark@arm.com>
In-Reply-To: <20240612183205.3120248-1-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_022726_108938_9C4CA7DA 
X-CRM114-Status: GOOD (  13.50  )
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



On 12/06/2024 19:31, Ian Rogers wrote:
> Refactor the perf python module build to instead of building C files
> it links libraries. To support this make static libraries for tests,
> ui, util and pmu-events. Doing this allows fewer functions to be
> stubbed out, importantly parse_events is no longer stubbed out which
> will improve the ability to work with heterogeneous cores.
> 
> Patches 1 to 5 add static libraries for existing parts of the perf
> build.
> 
> Patch 6 adds the python build using libraries rather than C source
> files.
> 
> Patch 7 cleans up the python dependencies and removes the no longer
> needed python-ext-sources.
> 

Reviewed-by: James Clark <james.clark@arm.com>

It does require a clean build to avoid some -fPIC errors presumably
because not everything that requires it gets rebuilt, for anyone who
gets stuck on that.

> Ian Rogers (7):
>   perf ui: Make ui its own library
>   perf pmu-events: Make pmu-events a library
>   perf test: Make tests its own library
>   perf bench: Make bench its own library
>   perf util: Make util its own library
>   perf python: Switch module to linking libraries from building source
>   perf python: Clean up build dependencies
> 
>  tools/perf/Build                              |  14 +-
>  tools/perf/Makefile.config                    |   5 +
>  tools/perf/Makefile.perf                      |  66 ++-
>  tools/perf/arch/Build                         |   4 +-
>  tools/perf/arch/arm/Build                     |   4 +-
>  tools/perf/arch/arm/tests/Build               |   8 +-
>  tools/perf/arch/arm/util/Build                |  10 +-
>  tools/perf/arch/arm64/Build                   |   4 +-
>  tools/perf/arch/arm64/tests/Build             |   8 +-
>  tools/perf/arch/arm64/util/Build              |  20 +-
>  tools/perf/arch/csky/Build                    |   2 +-
>  tools/perf/arch/csky/util/Build               |   6 +-
>  tools/perf/arch/loongarch/Build               |   2 +-
>  tools/perf/arch/loongarch/util/Build          |   8 +-
>  tools/perf/arch/mips/Build                    |   2 +-
>  tools/perf/arch/mips/util/Build               |   6 +-
>  tools/perf/arch/powerpc/Build                 |   4 +-
>  tools/perf/arch/powerpc/tests/Build           |   6 +-
>  tools/perf/arch/powerpc/util/Build            |  24 +-
>  tools/perf/arch/riscv/Build                   |   2 +-
>  tools/perf/arch/riscv/util/Build              |   8 +-
>  tools/perf/arch/s390/Build                    |   2 +-
>  tools/perf/arch/s390/util/Build               |  16 +-
>  tools/perf/arch/sh/Build                      |   2 +-
>  tools/perf/arch/sh/util/Build                 |   2 +-
>  tools/perf/arch/sparc/Build                   |   2 +-
>  tools/perf/arch/sparc/util/Build              |   2 +-
>  tools/perf/arch/x86/Build                     |   6 +-
>  tools/perf/arch/x86/tests/Build               |  20 +-
>  tools/perf/arch/x86/util/Build                |  42 +-
>  tools/perf/bench/Build                        |  46 +-
>  tools/perf/scripts/Build                      |   4 +-
>  tools/perf/scripts/perl/Perf-Trace-Util/Build |   2 +-
>  .../perf/scripts/python/Perf-Trace-Util/Build |   2 +-
>  tools/perf/tests/Build                        | 140 +++----
>  tools/perf/tests/workloads/Build              |  12 +-
>  tools/perf/ui/Build                           |  18 +-
>  tools/perf/ui/browsers/Build                  |  14 +-
>  tools/perf/ui/tui/Build                       |   8 +-
>  tools/perf/util/Build                         | 394 +++++++++---------
>  tools/perf/util/arm-spe-decoder/Build         |   2 +-
>  tools/perf/util/cs-etm-decoder/Build          |   2 +-
>  tools/perf/util/hisi-ptt-decoder/Build        |   2 +-
>  tools/perf/util/intel-pt-decoder/Build        |   2 +-
>  tools/perf/util/perf-regs-arch/Build          |  18 +-
>  tools/perf/util/python-ext-sources            |  53 ---
>  tools/perf/util/python.c                      | 271 +++++-------
>  tools/perf/util/scripting-engines/Build       |   4 +-
>  tools/perf/util/setup.py                      |  33 +-
>  49 files changed, 612 insertions(+), 722 deletions(-)
>  delete mode 100644 tools/perf/util/python-ext-sources
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

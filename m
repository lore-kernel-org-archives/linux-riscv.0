Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D018FD3DEA0
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2024 17:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPp2F8WEs/TojOPqju0LlKkIrx4pFbqsV4EtB3lWdYc=; b=sjKCZM7BYVB7km
	zkGpCEgHa2/cob062DJliOHxePNwP6rtcdZPAfPiQKIFAHrP6Z5C8Zs/RlODV2iHMlVRs1SoEeiYM
	bLayeFYiRZKYozXEEEO6w6ub+b/yUiKUB4U5Pcn98iWDMESaDNrrIyaF80YNRmQMfawnkosaA5Fpe
	ZrWwCXD/UcOsjhwQssIqHcCwDoD+CP1/CzR1N43OR0NPfwzvMJjJLKUacG2DifnocNdvsd+lYCx5s
	y/3F6P8n61zKVtS1zGWBc283KW3P4o0h5hWvfvRVAEqc8OsDZvEdxp1rQNPGt7JKZABAFjOvPP8AL
	mBpFtcMWgXtWewPaNC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1qbN-00000001S3I-1wa5;
	Fri, 18 Oct 2024 17:17:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1qZs-00000001RpZ-33eb;
	Fri, 18 Oct 2024 17:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90797A447E0;
	Fri, 18 Oct 2024 17:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB06C4CEC3;
	Fri, 18 Oct 2024 17:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729271751;
	bh=PxV2+YSoG3L+9FeMerajwARE0bW9TZdVPVKJTc27WUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cbvFbEbbpWMa6AqYecZ4p4hhtkMqbi/BuKtCX7EzVu6UN5hpx7MAEsWF2Gr9jo015
	 9nBZlci6FFMUYSRTJ4b9ruiX2a1ibXh4lk1H5FrzfJSKnPjL51aWEQN4HhDIs60CvH
	 ooFkj/EEeSpTaGpGL3R3XnNhWeU1yIvJq0aCkRT4j/0KjK2ZQElfa9R5fmeuCF/cvj
	 qPmahqoIHpnGBm1zzdqgDXJUv/0/RSUdospo9VsssVBKS/HUPpG+pkwzVZx3CaT2uF
	 z4i+X/yDN05FzTEIw+UsYoCQvFw2+S0oTNrLriybVne3LifqGaEVnce0680oMLG+fT
	 e7mMlDJtITQJA==
Date: Fri, 18 Oct 2024 10:15:48 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Changbin Du <changbin.du@huawei.com>,
	Guilherme Amadio <amadio@gentoo.org>,
	Yang Jihong <yangjihong@bytedance.com>,
	Aditya Gupta <adityag@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Kajol Jain <kjain@linux.ibm.com>, Atish Patra <atishp@rivosinc.com>,
	Shenlin Liang <liangshenlin@eswincomputing.com>,
	Anup Patel <anup@brainfault.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Steinar H. Gunderson" <sesse@google.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Dima Kogan <dima@secretsauce.net>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 00/11] Libdw/dwarf build clean up
Message-ID: <ZxKXxKji_LhtLLpu@google.com>
References: <20241017001354.56973-1-irogers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241017001354.56973-1-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_101552_928549_D73470EE 
X-CRM114-Status: GOOD (  22.95  )
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

On Wed, Oct 16, 2024 at 05:13:43PM -0700, Ian Rogers wrote:
> These patches were originally on top of:
> https://lore.kernel.org/lkml/20240924003720.617258-1-irogers@google.com/
> where it was pointed out that a lot of the libdw conditional
> compilation was due to features that have now been standard for 10 or
> 15 years. The patches remove the conditional compilation assuming the
> features are in libdw where the feature test is expanded to check
> there pressence. The patch series is now on top of:
> https://lore.kernel.org/lkml/20241016235622.52166-1-irogers@google.com/
> 
> In the Makefile code, and for `perf record --call-graph`, dwarf tends
> to mean unwind or libdw support for dwarf things. To make it clearer
> when dwarf really just means libdw numerous build variables and
> defines are renamed.
> 
> There is some tech debt in the changes as perf check still reports the
> values using the old name and for features that are no longer
> tested. This can be cleanup for another day.
> 
> v3: Move PERF_HAVE_DWARF_REGS cleanup to follow up patch series. Add
>     build fix from patch series these changes are on top of.
> v2: Instead of renaming PERF_HAVE_DWARF_REGS to PERF_HAVE_LIBDW_REGS,
>     remove it.
> 
> Ian Rogers (11):
>   perf build: Fix LIBDW_DIR
>   perf build: Rename NO_DWARF to NO_LIBDW
>   perf build: Remove defined but never used variable
>   perf build: Rename test-dwarf to test-libdw
>   perf build: Combine libdw-dwarf-unwind into libdw feature tests
>   perf build: Combine test-dwarf-getlocations into test-libdw
>   perf build: Combine test-dwarf-getcfi into test-libdw
>   perf probe: Move elfutils support check to libdw check
>   perf libdw: Remove unnecessary defines
>   perf build: Rename HAVE_DWARF_SUPPORT to HAVE_LIBDW_SUPPORT
>   perf build: Rename CONFIG_DWARF to CONFIG_LIBDW

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung

> 
>  tools/build/Makefile.feature                  | 11 +---
>  tools/build/feature/Makefile                  | 24 ++------
>  tools/build/feature/test-all.c                | 16 +-----
>  tools/build/feature/test-dwarf.c              | 11 ----
>  tools/build/feature/test-dwarf_getcfi.c       |  9 ---
>  tools/build/feature/test-dwarf_getlocations.c | 13 -----
>  tools/build/feature/test-libdw-dwarf-unwind.c | 14 -----
>  tools/build/feature/test-libdw.c              | 56 +++++++++++++++++++
>  tools/perf/Documentation/perf-check.txt       |  6 +-
>  tools/perf/Makefile.config                    | 47 +++++-----------
>  tools/perf/Makefile.perf                      |  2 +-
>  tools/perf/arch/arm/Makefile                  |  2 +-
>  tools/perf/arch/arm/util/Build                |  2 +-
>  tools/perf/arch/arm64/Makefile                |  2 +-
>  tools/perf/arch/arm64/util/Build              |  2 +-
>  tools/perf/arch/csky/Makefile                 |  2 +-
>  tools/perf/arch/csky/util/Build               |  2 +-
>  tools/perf/arch/loongarch/Makefile            |  2 +-
>  tools/perf/arch/loongarch/util/Build          |  2 +-
>  tools/perf/arch/mips/Makefile                 |  2 +-
>  tools/perf/arch/mips/util/Build               |  2 +-
>  tools/perf/arch/powerpc/Makefile              |  2 +-
>  .../perf/arch/powerpc/annotate/instructions.c |  4 +-
>  tools/perf/arch/powerpc/util/Build            |  4 +-
>  tools/perf/arch/riscv/Makefile                |  2 +-
>  tools/perf/arch/riscv/util/Build              |  2 +-
>  tools/perf/arch/s390/Makefile                 |  2 +-
>  tools/perf/arch/s390/util/Build               |  2 +-
>  tools/perf/arch/sh/Makefile                   |  2 +-
>  tools/perf/arch/sh/util/Build                 |  2 +-
>  tools/perf/arch/sparc/Makefile                |  2 +-
>  tools/perf/arch/sparc/util/Build              |  2 +-
>  tools/perf/arch/x86/Makefile                  |  2 +-
>  tools/perf/arch/x86/annotate/instructions.c   |  2 +-
>  tools/perf/arch/x86/util/Build                |  2 +-
>  tools/perf/arch/xtensa/Makefile               |  2 +-
>  tools/perf/arch/xtensa/util/Build             |  2 +-
>  tools/perf/builtin-annotate.c                 |  2 +-
>  tools/perf/builtin-check.c                    |  6 +-
>  tools/perf/builtin-probe.c                    | 14 ++---
>  tools/perf/builtin-report.c                   |  4 +-
>  tools/perf/util/Build                         | 12 ++--
>  tools/perf/util/annotate-data.h               |  8 +--
>  tools/perf/util/debuginfo.h                   |  6 +-
>  tools/perf/util/disasm.c                      |  4 +-
>  tools/perf/util/disasm.h                      |  4 +-
>  tools/perf/util/dwarf-aux.c                   |  6 --
>  tools/perf/util/dwarf-aux.h                   | 54 ------------------
>  tools/perf/util/genelf.c                      |  4 +-
>  tools/perf/util/genelf.h                      |  2 +-
>  tools/perf/util/include/dwarf-regs.h          |  6 +-
>  tools/perf/util/probe-event.c                 |  4 +-
>  tools/perf/util/probe-finder.c                |  6 --
>  tools/perf/util/probe-finder.h                |  6 +-
>  54 files changed, 154 insertions(+), 259 deletions(-)
>  delete mode 100644 tools/build/feature/test-dwarf.c
>  delete mode 100644 tools/build/feature/test-dwarf_getcfi.c
>  delete mode 100644 tools/build/feature/test-dwarf_getlocations.c
>  delete mode 100644 tools/build/feature/test-libdw-dwarf-unwind.c
>  create mode 100644 tools/build/feature/test-libdw.c
> 
> -- 
> 2.47.0.105.g07ac214952-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

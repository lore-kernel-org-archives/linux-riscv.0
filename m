Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38830C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 18:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5U8VoolARJ52peuCnNNgiTBQ0TEACG2Jt+Ym1YFGBgk=; b=rCNQL3xCnpz6+e
	j5BAfFsUAkV4Z9IODQvW8BWqiwyghP/l11/ToE829O6uvBAB3gEPlAuZ1gevJjmEd5iRQ92diBllA
	/qRufsD976sJ6zcSfM+mUDoDRnLxbheSta5faaNddWIOJVRoiA72x5PsCli7XqHWJZFa02Fqb54Qw
	Tvt6Kro4UEvxc3MJg0ipoxsOpMT3sp18f23Ss/PsYUp/GkvetwiiPeUfmH/d53feX/43aQjqcqEBu
	Oqgsz9xi5bLEtUwnPN8ZyNAOUCCbqdyPaJP5bqi68vzWaEOsThMqwZBOKHzxLtgGt0r2GCvYvQ7lG
	H2xK5Tfo6UKzTZenVRvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHSnF-0000000DkS5-3t8O;
	Wed, 12 Jun 2024 18:33:58 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHSmx-0000000DkD5-40Hg
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 18:33:42 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dfe71fc2ab1so263000276.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 11:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718217216; x=1718822016; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hxFca2akLEi/c6aeiWryG3twAj/x8mJ+5CcLXE4nJMw=;
        b=0MtYCp4T1q7CAbw9UFa0vDSsoIAFoaVaCLbSdtLyMDBK/3L/BUZkSWyBa9sZni1vev
         Zsv+nOkZGYrQ5xxuyHP3miuiRVfKaIrXIHXFUo3KRRl1snaQOqglLS1o8W23BV+niW1j
         snpxGblBg9tn95E4CF8qWYlm+nYJeKNJsY3V5MncKSffvWQei5CNdKiUorae3KY+HcxT
         IpmLF/AK0bBeIkIhHQKktAh6T98GC45Swd03xsNuJWkjAYxAk6hoV1hl1s7Y+RLQ2z7e
         Y8v+145Fcvu+uIN6W94EI3mCSYpoU6+nYYBBYg2Kl50wWsnQ63ZcyFyyJGOfsAQhiEf8
         /Gbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718217216; x=1718822016;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hxFca2akLEi/c6aeiWryG3twAj/x8mJ+5CcLXE4nJMw=;
        b=qYNYPKpDKk/aTClG9gXkMO2M6L/PNxKA8B3486jX7iELdpBGeIsk+eB2MZAahIX+5A
         DQiWYqWiRo2S6m+GmfERlDRHo0og5YZpjCcnO17zsO5ODTVYYDlj3pwJz7fOO8krE1/8
         HGNla8TEkDbCr8WXn8FDpDn1hVquztATHnWE7x0TTlAfP7QaF2Rn8/I+6DY0fdOKLUHW
         yioPZ8shYWBStm8Wbwgrlor8Jj98dM29C263Au1vMNt7c6OyxmU5295CiDmTATaSmWKn
         1B8bcIXBIJmm2ZVnwlE5JNfsSi4Aa14c2VUO73GAoiocp6tczhEogFs1ObEPrcs7FddD
         5NDw==
X-Forwarded-Encrypted: i=1; AJvYcCV8Yn0spHtcT0PY2Xr0O9Q9bIazehVxBqflivLt6ZYI6We3+QV6q6GNm2oguuI18wp1Dz9ryMEjxBS1pKuSh3aH4sSsqi0jkprdjtJLO1Kk
X-Gm-Message-State: AOJu0YyizByglyLWgTyRE1kY42aeh5cWoP9YR2/Q2MYnxQ96djVIwIEq
	Ay6iRAmdX/JmOg2W0x688AxvD2+Fkhb55WHuLFUoRq0EK+ocG8TJXk7VgXm7AgmVo/HiZaZXE61
	cVeWQlg==
X-Google-Smtp-Source: AGHT+IHHEhm3YqNyXbkwlJqf7zAbA10K5YtztZ12tlPf+OX1TpaElO1uBuwFIrHE76zPeVUQ691ENdAPSP7k
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:959d:4302:db0e:d12a])
 (user=irogers job=sendgmr) by 2002:a05:6902:2b03:b0:dda:c57c:b69b with SMTP
 id 3f1490d57ef6-dfe62f13456mr822488276.0.1718217216102; Wed, 12 Jun 2024
 11:33:36 -0700 (PDT)
Date: Wed, 12 Jun 2024 11:32:02 -0700
In-Reply-To: <20240612183205.3120248-1-irogers@google.com>
Message-Id: <20240612183205.3120248-5-irogers@google.com>
Mime-Version: 1.0
References: <20240612183205.3120248-1-irogers@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Subject: [PATCH v1 4/7] perf bench: Make bench its own library
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nick Terrell <terrelln@fb.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Kees Cook <keescook@chromium.org>, Andrei Vagin <avagin@google.com>, 
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Ze Gao <zegao2021@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	coresight@lists.linaro.org, rust-for-linux@vger.kernel.org, 
	bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_113340_266999_214966B7 
X-CRM114-Status: GOOD (  12.84  )
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

Make the benchmark code into a library so it may be linked against
things like the python module to avoid compiling code twice.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Build         |  4 ++--
 tools/perf/Makefile.perf | 11 +++++++++-
 tools/perf/bench/Build   | 46 ++++++++++++++++++++--------------------
 3 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/tools/perf/Build b/tools/perf/Build
index fddd45ab35b4..2787f5630ff7 100644
--- a/tools/perf/Build
+++ b/tools/perf/Build
@@ -1,4 +1,4 @@
-perf-y += builtin-bench.o
+perf-bench-y += builtin-bench.o
 perf-y += builtin-annotate.o
 perf-y += builtin-config.o
 perf-y += builtin-diff.o
@@ -35,7 +35,7 @@ endif
 
 perf-$(CONFIG_LIBELF) += builtin-probe.o
 
-perf-y += bench/
+perf-bench-y += bench/
 perf-test-y += tests/
 
 perf-y += perf.o
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index ecf0586e9061..f9709718cb83 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -425,6 +425,9 @@ endif
 
 export PERL_PATH
 
+LIBPERF_BENCH_IN := $(OUTPUT)perf-bench-in.o
+LIBPERF_BENCH := $(OUTPUT)libperf-bench.a
+
 LIBPERF_TEST_IN := $(OUTPUT)perf-test-in.o
 LIBPERF_TEST := $(OUTPUT)libperf-test.a
 
@@ -438,7 +441,7 @@ PERFLIBS = $(LIBAPI) $(LIBPERF) $(LIBSUBCMD) $(LIBSYMBOL)
 ifdef LIBBPF_STATIC
   PERFLIBS += $(LIBBPF)
 endif
-PERFLIBS += $(LIBPERF_TEST) $(LIBPERF_UI) $(LIBPMU_EVENTS)
+PERFLIBS += $(LIBPERF_BENCH) $(LIBPERF_TEST) $(LIBPERF_UI) $(LIBPMU_EVENTS)
 
 # We choose to avoid "if .. else if .. else .. endif endif"
 # because maintaining the nesting to match is a pain.  If
@@ -740,6 +743,12 @@ $(LIBPMU_EVENTS_IN): FORCE prepare
 $(LIBPMU_EVENTS): $(LIBPMU_EVENTS_IN)
 	$(QUIET_AR)$(RM) $@ && $(AR) rcs $@ $<
 
+$(LIBPERF_BENCH_IN): FORCE prepare
+	$(Q)$(MAKE) $(build)=perf-bench
+
+$(LIBPERF_BENCH): $(LIBPERF_BENCH_IN)
+	$(QUIET_AR)$(RM) $@ && $(AR) rcs $@ $<
+
 $(LIBPERF_TEST_IN): FORCE prepare
 	$(Q)$(MAKE) $(build)=perf-test
 
diff --git a/tools/perf/bench/Build b/tools/perf/bench/Build
index c2ab30907ae7..279ab2ab4abe 100644
--- a/tools/perf/bench/Build
+++ b/tools/perf/bench/Build
@@ -1,25 +1,25 @@
-perf-y += sched-messaging.o
-perf-y += sched-pipe.o
-perf-y += sched-seccomp-notify.o
-perf-y += syscall.o
-perf-y += mem-functions.o
-perf-y += futex-hash.o
-perf-y += futex-wake.o
-perf-y += futex-wake-parallel.o
-perf-y += futex-requeue.o
-perf-y += futex-lock-pi.o
-perf-y += epoll-wait.o
-perf-y += epoll-ctl.o
-perf-y += synthesize.o
-perf-y += kallsyms-parse.o
-perf-y += find-bit-bench.o
-perf-y += inject-buildid.o
-perf-y += evlist-open-close.o
-perf-y += breakpoint.o
-perf-y += pmu-scan.o
-perf-y += uprobe.o
+perf-bench-y += sched-messaging.o
+perf-bench-y += sched-pipe.o
+perf-bench-y += sched-seccomp-notify.o
+perf-bench-y += syscall.o
+perf-bench-y += mem-functions.o
+perf-bench-y += futex-hash.o
+perf-bench-y += futex-wake.o
+perf-bench-y += futex-wake-parallel.o
+perf-bench-y += futex-requeue.o
+perf-bench-y += futex-lock-pi.o
+perf-bench-y += epoll-wait.o
+perf-bench-y += epoll-ctl.o
+perf-bench-y += synthesize.o
+perf-bench-y += kallsyms-parse.o
+perf-bench-y += find-bit-bench.o
+perf-bench-y += inject-buildid.o
+perf-bench-y += evlist-open-close.o
+perf-bench-y += breakpoint.o
+perf-bench-y += pmu-scan.o
+perf-bench-y += uprobe.o
 
-perf-$(CONFIG_X86_64) += mem-memcpy-x86-64-asm.o
-perf-$(CONFIG_X86_64) += mem-memset-x86-64-asm.o
+perf-bench-$(CONFIG_X86_64) += mem-memcpy-x86-64-asm.o
+perf-bench-$(CONFIG_X86_64) += mem-memset-x86-64-asm.o
 
-perf-$(CONFIG_NUMA) += numa.o
+perf-bench-$(CONFIG_NUMA) += numa.o
-- 
2.45.2.505.gda0bf45e8d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

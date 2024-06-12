Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A883FC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 18:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F51f1aFQMM2uF0yV9SunCjM9pR5xGykUzVKiMME/aFg=; b=hloz1y0idEuYYJ
	i0YcRVVpVo1eVDdpBgxm6zVD8+NHpX+KpnBCIqw7x/r+Yc38QxRvwTpF7wBR0KAYhx8ZjGEtaEZ4u
	gdEBScmsGhU6DnJByArynpiwCNRZz2K++VSfqQXBoI2jUFaY84p1zbpfhMXZwiJdOXZVlVMiLpvd6
	MBR9aUP5YjLsVeZK90SqL3PS3XTL97+bHTrg2NRSjjC4EeKi6mkvOilroJPDMeIfMNh59yWSoSldy
	2sub6IhcsIRoHg+M321IGsPW8HLHrTXaT7CpJZiiua1Z83X1HNceeHPj9C4rh5gQMdRcyQtcP4EwA
	1ol2n89qiLAtTyT4hYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHSmt-0000000DkC4-0rZT;
	Wed, 12 Jun 2024 18:33:35 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHSmq-0000000Dk7O-0gYM
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 18:33:33 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dfede368fcaso273204276.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 11:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718217207; x=1718822007; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rm0EtUlY7qVzQZI97HOfdq0hSIaq1mUCwGuA2+Hn2yY=;
        b=zoSK2C2cHxhpdxPo86Pt4oMZBGRxeSDwFY6dYeamhti7J4nJwvVwCB5fHao3ICNKnT
         ypvOMMIFKqR3HWCV47GcQmR+7Ipp6SDgO1auiapW9CPrt24ZC339fXEkzBaelTmqWqJL
         j2q+JNy3A8tcIPG2WUl43b2bloKrbvgmIpxhSvn/F43Pv8DPPI4IFoTouS4249DU6XGU
         0NOsl5SPW0jXYfJwOInNO/gUxcYRx+r20CbjIVLqMXepbR/TvWMsdi9567ZmR9FwY903
         /jLqSbf6zEkj+NNykNlnuECjbeQJFrwgqkmaUCU3w3N73o1wioFJ59I69QldSdCTBbRo
         q3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718217207; x=1718822007;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rm0EtUlY7qVzQZI97HOfdq0hSIaq1mUCwGuA2+Hn2yY=;
        b=PaFAF29PtmJk3hsgkMX/NcE+f2YS1MCUUJPk9+azPvR0Ou85kf4sgF4RZmInetV3W+
         ZNZ0hrAhSsCMHw7dTiCMuGeMt5zELUxgh14NXjVI6ajABFbFGq2miGlG+jjYfQcmdkz/
         EwdfEhYErDTj3fEz+mNlk1PPb91A8BNAatKLzql8+Cg1SGc3pSFePxJvzaIj/D++VJSu
         83sIoHZRBIItE0HcIbYj1gnuI8qUyfFBN9pGJdvtAUutd5kU7/WeUZ/7ecdRphR94uUb
         dME0nC0Q7nXTNdnd3nRl3rWtVRnYrPt9HMhakSBlLnyjSHW9qpYTjtEzkhIzlWyEwMtN
         NV9g==
X-Forwarded-Encrypted: i=1; AJvYcCXNs/rCxsWEeccrRSFULfWCCLPITCuX2m83R7MXjP7o5uAe0Pk4TCZRBvXuzdkJvAa1sAyZA1DvxB7KfTF3j037pE3U9y+vX57owiqTnfB9
X-Gm-Message-State: AOJu0YzZF4g6TajZ0ckKKeEbqc4sLrOkX1L5KxGwjK8ZyMZV+PSWozlN
	e3Lgawl7XH5gBaautEnWP/KQVB9H9/dlhs86ZzPHti+MkKL307duZX2wQZS1Dm52W8fZNypMDpg
	LdnqqOg==
X-Google-Smtp-Source: AGHT+IH1yI9i/s+26+jM/E/uI8+fPG/zWe9dsO6CmMohvLKaJEU2deKggpKC2BICy6YM6dj4+CXqvZYdg/vu
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:959d:4302:db0e:d12a])
 (user=irogers job=sendgmr) by 2002:a25:c841:0:b0:dfb:197c:8caf with SMTP id
 3f1490d57ef6-dfe66b6704fmr445067276.6.1718217207099; Wed, 12 Jun 2024
 11:33:27 -0700 (PDT)
Date: Wed, 12 Jun 2024 11:31:58 -0700
Message-Id: <20240612183205.3120248-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Subject: [PATCH v1 0/7] Refactor perf python module build
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
X-CRM114-CacheID: sfid-20240612_113332_438443_C0737F00 
X-CRM114-Status: GOOD (  12.06  )
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

Refactor the perf python module build to instead of building C files
it links libraries. To support this make static libraries for tests,
ui, util and pmu-events. Doing this allows fewer functions to be
stubbed out, importantly parse_events is no longer stubbed out which
will improve the ability to work with heterogeneous cores.

Patches 1 to 5 add static libraries for existing parts of the perf
build.

Patch 6 adds the python build using libraries rather than C source
files.

Patch 7 cleans up the python dependencies and removes the no longer
needed python-ext-sources.

Ian Rogers (7):
  perf ui: Make ui its own library
  perf pmu-events: Make pmu-events a library
  perf test: Make tests its own library
  perf bench: Make bench its own library
  perf util: Make util its own library
  perf python: Switch module to linking libraries from building source
  perf python: Clean up build dependencies

 tools/perf/Build                              |  14 +-
 tools/perf/Makefile.config                    |   5 +
 tools/perf/Makefile.perf                      |  66 ++-
 tools/perf/arch/Build                         |   4 +-
 tools/perf/arch/arm/Build                     |   4 +-
 tools/perf/arch/arm/tests/Build               |   8 +-
 tools/perf/arch/arm/util/Build                |  10 +-
 tools/perf/arch/arm64/Build                   |   4 +-
 tools/perf/arch/arm64/tests/Build             |   8 +-
 tools/perf/arch/arm64/util/Build              |  20 +-
 tools/perf/arch/csky/Build                    |   2 +-
 tools/perf/arch/csky/util/Build               |   6 +-
 tools/perf/arch/loongarch/Build               |   2 +-
 tools/perf/arch/loongarch/util/Build          |   8 +-
 tools/perf/arch/mips/Build                    |   2 +-
 tools/perf/arch/mips/util/Build               |   6 +-
 tools/perf/arch/powerpc/Build                 |   4 +-
 tools/perf/arch/powerpc/tests/Build           |   6 +-
 tools/perf/arch/powerpc/util/Build            |  24 +-
 tools/perf/arch/riscv/Build                   |   2 +-
 tools/perf/arch/riscv/util/Build              |   8 +-
 tools/perf/arch/s390/Build                    |   2 +-
 tools/perf/arch/s390/util/Build               |  16 +-
 tools/perf/arch/sh/Build                      |   2 +-
 tools/perf/arch/sh/util/Build                 |   2 +-
 tools/perf/arch/sparc/Build                   |   2 +-
 tools/perf/arch/sparc/util/Build              |   2 +-
 tools/perf/arch/x86/Build                     |   6 +-
 tools/perf/arch/x86/tests/Build               |  20 +-
 tools/perf/arch/x86/util/Build                |  42 +-
 tools/perf/bench/Build                        |  46 +-
 tools/perf/scripts/Build                      |   4 +-
 tools/perf/scripts/perl/Perf-Trace-Util/Build |   2 +-
 .../perf/scripts/python/Perf-Trace-Util/Build |   2 +-
 tools/perf/tests/Build                        | 140 +++----
 tools/perf/tests/workloads/Build              |  12 +-
 tools/perf/ui/Build                           |  18 +-
 tools/perf/ui/browsers/Build                  |  14 +-
 tools/perf/ui/tui/Build                       |   8 +-
 tools/perf/util/Build                         | 394 +++++++++---------
 tools/perf/util/arm-spe-decoder/Build         |   2 +-
 tools/perf/util/cs-etm-decoder/Build          |   2 +-
 tools/perf/util/hisi-ptt-decoder/Build        |   2 +-
 tools/perf/util/intel-pt-decoder/Build        |   2 +-
 tools/perf/util/perf-regs-arch/Build          |  18 +-
 tools/perf/util/python-ext-sources            |  53 ---
 tools/perf/util/python.c                      | 271 +++++-------
 tools/perf/util/scripting-engines/Build       |   4 +-
 tools/perf/util/setup.py                      |  33 +-
 49 files changed, 612 insertions(+), 722 deletions(-)
 delete mode 100644 tools/perf/util/python-ext-sources

-- 
2.45.2.505.gda0bf45e8d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

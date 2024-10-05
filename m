Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE017CFB42C
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 19:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u2+ZSi3jM4DFIFRoau45VDKWMVgiIYEwDPnEl7Fod8Y=; b=YfwBB3pbllAgrS
	RT36CAmMcqIigoCsn5pYYOYPnobKH9FFpX7uuWxga8CS9M1vRNDfuVprAoZnF0WVHK9x5qc3gWJfX
	5mkK7S6K5AdKMPm4mX0GKcohzloxzYsMKdB1Qq6c2lu80CoYmLfeFUYE4WQtMzowwEgp0xp8KhtkJ
	/FK9VUouxb7vU2/dlbQyr5UJaojSWQTRfyvnCYWWNzskGEYwbXo9iBWXAPjTHL4tYoy8Gw+Pf//x2
	J0Mtxig+SW2ZKFoVk0jKFkhfPdYKPJbw4MmOv5hTVxtGYEBWIF3mcWm+Qw9DHOT5/E1xmXyLLyjVv
	xOAk+wFzbF6WATU6TO8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAsk-0000000FpoO-0L86;
	Sat, 05 Oct 2024 19:56:02 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAsi-0000000FpnM-0F5u
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:01 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e2555d3d0eso54455987b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158158; x=1728762958; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Ia1pxUxtivl837TCEzwnkRhGXsXOccOACzKPX2t/h8=;
        b=GtHLMO6fvJuUW/Be40xNLJYpdg1o+JKLowZ9WPCP4f/9GXcwqxUwmMwVDnBOoizJQ2
         ynmi1vBjP3l3YQY8L0n6Yzm5PeBu/MToipTiLpAfKdii6lM4DN5NOn3npKH6tURAXU3T
         K0ywhLF+lUoXJl/dy5RSiI0Thi0fAmTj2GAbgiams3YuI8ysAbWScr3BuSxz21MKxlHL
         +11nRrTOVBEy4bfB778XNnOs3Xv7WQu0Uu/xEs+p5Q2f98OXIQ1JqHXQO0N+rBiArGzk
         /1mqeTgb/lEvQUGxBg1aSElyFVsqlY2giUzxXnE0r8utouVsyOGMZXXa38344YipZUI7
         RKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158158; x=1728762958;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Ia1pxUxtivl837TCEzwnkRhGXsXOccOACzKPX2t/h8=;
        b=Q2ZPmT0ddW/Yo2JBqJqnDOJoBVG3/YDFQ4PDvNBl/9WQRG2JCfzF3UI8dzc30Hx3T0
         Lx3aa4tyxACQtPPOBl7MC2elfJBQmxtqo7YflkV4Mb6oQSvG01mytB75IYz3OXCfBklG
         3/Fhoq5JaTh1GlG2R5Xh6knTSUwHZHl03OYCd1h/YQkLyy1gfW+JqAoW5oi8PWUfwv2P
         mOW/STkJUo327wAZdfPOSkGUQC96tipDXdY35hiUdX0pnQUgQ8aksD/FB4RLYUbbypcW
         A2BbjdCkxyAdmoL4ZEuNCIDR+2Y+05/1ljnwEgoRkau2bym7P4UO4rKGbEaplowW99Hj
         1JfA==
X-Forwarded-Encrypted: i=1; AJvYcCUTB9L7xHbxIZLFRoVFo2w3EUtsJXpTatfdRhhq0rMCJBZipgvuxT86BnpJqqQdbqhAV06batIcErprpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9YiF9QwJ43pRInAJ7SCmtwybpW+7UggYXvvPncp/I/LpJxA+P
	epTCLPJIHnzwVVLl/Zo8C36FptfzU6F0HKgXMs//s+CtFwV4YvYWjafOtqsruRdX09vsXPL553a
	LOjI4fw==
X-Google-Smtp-Source: AGHT+IEASCaY05lrXQKKNEqOZGA4D4bafeubD7up1cQ89dxTILSgemClarJHc4Z6Y6dnUZEhXAABTIp0GUvt
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a05:690c:6f8c:b0:6db:c34f:9e4f with SMTP
 id 00721157ae682-6e2c72ca7d4mr2444947b3.8.1728158158105; Sat, 05 Oct 2024
 12:55:58 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:10 -0700
Message-Id: <20241005195541.380070-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 00/31] Libdw/dwarf build clean up
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Guilherme Amadio <amadio@gentoo.org>, Changbin Du <changbin.du@huawei.com>, 
	Daniel Bristot de Oliveira <bristot@kernel.org>, Daniel Wagner <dwagner@suse.de>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Shenlin Liang <liangshenlin@eswincomputing.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Yury Norov <yury.norov@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_125600_159591_1D73D93A 
X-CRM114-Status: GOOD (  20.66  )
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

There patches are on top of:
https://lore.kernel.org/lkml/20240924003720.617258-1-irogers@google.com/
where it was pointed out that a lot of the libdw conditional
compilation was due to features that have now been standard for 10 or
15 years. The patches remove the conditional compilation assuming the
features are in libdw where the feature test is expanded to check
there pressence.

In the Makefile code, and for `perf record --call-graph`, dwarf tends
to mean unwind or libdw support for dwarf things. To make it clearer
when dwarf really just means libdw numerous build variables and
defines are renamed. PERF_HAVE_DWARF_REGS was particularly tricky and
has been removed as it isn't necessary as was somewhat inversely
guarding libdw support. The Makefile variable indicated an
architecture having a dwarf-regs.c file. This file contained code for
BPF prologues, which were removed with BPF event support. The files
also often just contained a redundant get_arch_regstr function. The
function was redundant as get_dwarf_regstr would do the appropriate
thing if the ELF machine were given. To remove get_arch_regstr the ELF
machine is computed for the host machine. This now makes the logic
work across platforms, but the testing I was able to do across
platforms was minimal.

There is some tech debt in the changes as perf check still reports the
values using the old name and for features that are no longer
tested. This can be cleanup for another day.

v2: Instead of renaming PERF_HAVE_DWARF_REGS to PERF_HAVE_LIBDW_REGS,
    remove it.

Ian Rogers (31):
  perf build: Fix !HAVE_DWARF_GETLOCATIONS_SUPPORT
  perf build: Rename NO_DWARF to NO_LIBDW
  perf build: Remove defined but never used variable
  perf build: Rename test-dwarf to test-libdw
  perf build: Combine libdw-dwarf-unwind into libdw feature tests
  perf build: Combine test-dwarf-getlocations into test-libdw
  perf build: Combine test-dwarf-getcfi into test-libdw
  perf probe: Move elfutils support check to libdw check
  perf libdw: Remove unnecessary defines
  perf build: Rename HAVE_DWARF_SUPPORT to HAVE_LIBDW_SUPPORT
  perf build: Rename CONFIG_DWARF to CONFIG_LIBDW
  perf bpf-prologue: Remove unused file
  perf dwarf-regs: Remove PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET
  perf dwarf-regs: Add EM_HOST and EF_HOST defines
  perf disasm: Add e_machine/e_flags to struct arch
  perf dwarf-regs: Pass accurate disassembly machine to get_dwarf_regnum
  perf dwarf-regs: Pass ELF flags to get_dwarf_regstr
  perf dwarf-regs: Move x86 dwarf-regs out of arch
  perf arm64: Remove dwarf-regs.c
  perf arm: Remove dwarf-regs.c
  perf dwarf-regs: Move csky dwarf-regs out of arch
  perf loongarch: Remove dwarf-regs.c
  perf mips: Remove dwarf-regs.c
  perf dwarf-regs: Move powerpc dwarf-regs out of arch
  perf riscv: Remove dwarf-regs.c and add dwarf-regs-table.h
  perf s390: Remove dwarf-regs.c
  perf sh: Remove dwarf-regs.c
  perf sparc: Remove dwarf-regs.c
  perf xtensa: Remove dwarf-regs.c
  perf dwarf-regs: Remove get_arch_regstr code
  perf build: Remove PERF_HAVE_DWARF_REGS

 tools/build/Makefile.feature                  |  11 +-
 tools/build/feature/Makefile                  |  24 +--
 tools/build/feature/test-all.c                |  16 +-
 tools/build/feature/test-dwarf.c              |  11 --
 tools/build/feature/test-dwarf_getcfi.c       |   9 --
 tools/build/feature/test-dwarf_getlocations.c |  13 --
 tools/build/feature/test-libdw-dwarf-unwind.c |  14 --
 tools/build/feature/test-libdw.c              |  56 +++++++
 tools/perf/Documentation/perf-check.txt       |   6 +-
 tools/perf/Makefile.config                    |  58 ++-----
 tools/perf/Makefile.perf                      |   2 +-
 tools/perf/arch/arc/annotate/instructions.c   |   2 +
 tools/perf/arch/arm/Makefile                  |   3 -
 tools/perf/arch/arm/annotate/instructions.c   |   2 +
 tools/perf/arch/arm/util/Build                |   2 -
 tools/perf/arch/arm/util/dwarf-regs.c         |  61 -------
 tools/perf/arch/arm64/Makefile                |   4 -
 tools/perf/arch/arm64/annotate/instructions.c |   2 +
 tools/perf/arch/arm64/util/Build              |   1 -
 tools/perf/arch/arm64/util/dwarf-regs.c       |  92 -----------
 tools/perf/arch/csky/Makefile                 |   4 -
 tools/perf/arch/csky/annotate/instructions.c  |   7 +-
 tools/perf/arch/csky/util/Build               |   1 -
 tools/perf/arch/loongarch/Makefile            |   4 -
 .../arch/loongarch/annotate/instructions.c    |   2 +
 tools/perf/arch/loongarch/util/Build          |   1 -
 tools/perf/arch/loongarch/util/dwarf-regs.c   |  44 -----
 tools/perf/arch/mips/Makefile                 |   4 -
 tools/perf/arch/mips/annotate/instructions.c  |   2 +
 tools/perf/arch/mips/util/Build               |   1 -
 tools/perf/arch/mips/util/dwarf-regs.c        |  38 -----
 tools/perf/arch/powerpc/Makefile              |   5 -
 .../perf/arch/powerpc/annotate/instructions.c |   6 +-
 tools/perf/arch/powerpc/util/Build            |   3 +-
 tools/perf/arch/powerpc/util/dwarf-regs.c     | 153 ------------------
 tools/perf/arch/riscv/Makefile                |   5 +-
 .../arch/riscv/include/dwarf-regs-table.h     |  42 +++++
 tools/perf/arch/riscv/util/Build              |   1 -
 tools/perf/arch/riscv/util/dwarf-regs.c       |  72 ---------
 .../perf/arch/riscv64/annotate/instructions.c |   2 +
 tools/perf/arch/s390/Makefile                 |   4 -
 tools/perf/arch/s390/annotate/instructions.c  |   2 +
 tools/perf/arch/s390/util/Build               |   1 -
 tools/perf/arch/s390/util/dwarf-regs.c        |  43 -----
 tools/perf/arch/sh/Build                      |   1 -
 tools/perf/arch/sh/Makefile                   |   4 -
 tools/perf/arch/sh/util/Build                 |   1 -
 tools/perf/arch/sh/util/dwarf-regs.c          |  41 -----
 tools/perf/arch/sparc/Build                   |   1 -
 tools/perf/arch/sparc/Makefile                |   4 -
 tools/perf/arch/sparc/annotate/instructions.c |   2 +
 tools/perf/arch/sparc/util/Build              |   1 -
 tools/perf/arch/sparc/util/dwarf-regs.c       |  39 -----
 tools/perf/arch/x86/Makefile                  |   4 -
 tools/perf/arch/x86/annotate/instructions.c   |   5 +-
 tools/perf/arch/x86/util/Build                |   3 -
 tools/perf/arch/x86/util/dwarf-regs.c         | 153 ------------------
 tools/perf/arch/xtensa/Build                  |   1 -
 tools/perf/arch/xtensa/Makefile               |   4 -
 tools/perf/arch/xtensa/util/Build             |   1 -
 tools/perf/arch/xtensa/util/dwarf-regs.c      |  21 ---
 tools/perf/builtin-annotate.c                 |   2 +-
 tools/perf/builtin-check.c                    |   6 +-
 tools/perf/builtin-probe.c                    |  14 +-
 tools/perf/builtin-report.c                   |   4 +-
 tools/perf/util/Build                         |  15 +-
 tools/perf/util/annotate-data.h               |   8 +-
 tools/perf/util/annotate.c                    |   6 +-
 tools/perf/util/bpf-prologue.h                |  37 -----
 tools/perf/util/debuginfo.h                   |   6 +-
 tools/perf/util/disasm.c                      |   4 +-
 tools/perf/util/disasm.h                      |   8 +-
 tools/perf/util/dwarf-aux.c                   |   6 -
 tools/perf/util/dwarf-aux.h                   |  53 ------
 .../dwarf-regs.c => util/dwarf-regs-csky.c}   |  19 +--
 tools/perf/util/dwarf-regs-powerpc.c          |  61 +++++++
 tools/perf/util/dwarf-regs-x86.c              |  50 ++++++
 tools/perf/util/dwarf-regs.c                  |  38 +++--
 tools/perf/util/genelf.c                      |   4 +-
 tools/perf/util/genelf.h                      |   2 +-
 tools/perf/util/include/dwarf-regs.h          | 114 ++++++++++---
 tools/perf/util/probe-event.c                 |   4 +-
 tools/perf/util/probe-finder.c                |  19 +--
 tools/perf/util/probe-finder.h                |   9 +-
 84 files changed, 454 insertions(+), 1157 deletions(-)
 delete mode 100644 tools/build/feature/test-dwarf.c
 delete mode 100644 tools/build/feature/test-dwarf_getcfi.c
 delete mode 100644 tools/build/feature/test-dwarf_getlocations.c
 delete mode 100644 tools/build/feature/test-libdw-dwarf-unwind.c
 create mode 100644 tools/build/feature/test-libdw.c
 delete mode 100644 tools/perf/arch/arm/util/dwarf-regs.c
 delete mode 100644 tools/perf/arch/arm64/util/dwarf-regs.c
 delete mode 100644 tools/perf/arch/csky/Makefile
 delete mode 100644 tools/perf/arch/loongarch/util/dwarf-regs.c
 delete mode 100644 tools/perf/arch/mips/util/dwarf-regs.c
 delete mode 100644 tools/perf/arch/powerpc/util/dwarf-regs.c
 create mode 100644 tools/perf/arch/riscv/include/dwarf-regs-table.h
 delete mode 100644 tools/perf/arch/riscv/util/dwarf-regs.c
 delete mode 100644 tools/perf/arch/s390/util/dwarf-regs.c
 delete mode 100644 tools/perf/arch/sh/Build
 delete mode 100644 tools/perf/arch/sh/Makefile
 delete mode 100644 tools/perf/arch/sh/util/Build
 delete mode 100644 tools/perf/arch/sh/util/dwarf-regs.c
 delete mode 100644 tools/perf/arch/sparc/Build
 delete mode 100644 tools/perf/arch/sparc/util/Build
 delete mode 100644 tools/perf/arch/sparc/util/dwarf-regs.c
 delete mode 100644 tools/perf/arch/x86/util/dwarf-regs.c
 delete mode 100644 tools/perf/arch/xtensa/Build
 delete mode 100644 tools/perf/arch/xtensa/Makefile
 delete mode 100644 tools/perf/arch/xtensa/util/Build
 delete mode 100644 tools/perf/arch/xtensa/util/dwarf-regs.c
 delete mode 100644 tools/perf/util/bpf-prologue.h
 rename tools/perf/{arch/csky/util/dwarf-regs.c => util/dwarf-regs-csky.c} (74%)
 create mode 100644 tools/perf/util/dwarf-regs-powerpc.c
 create mode 100644 tools/perf/util/dwarf-regs-x86.c

-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

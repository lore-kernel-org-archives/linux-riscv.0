Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE337E9380C
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 02:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rl2TStkq0+2faZWv0qZpqiuKC4cDYS4KkpNXG2QK2AI=; b=CmuL4ZNgWfo3VVS/2K8mrLAyz3
	RvO4XeuWbAp2d8CGef5edhJ57+bvLThm9tPGKDZLNCZZYRoBGOthoshf4eykpHSre+67esFGsJHTM
	QOj/U2s2riT+Qmkvpqub/S09GDvnUOCLYXWguDlZgQWpBju7nnkZtNtndN44SpStLaqNjyUgPXXHn
	Sh6LxOQMpgoG7QQwE2MF5x3hDI+1ZfaNT1prR63ezZEf0GJxjb2hsxkLgzFHeJjb8g94wEpbpFCbY
	EOcoXFC2Hvf9eRa4+Vbp6OkPwVSq58mx+mUsR3s0AlzszXoftSNSPwbURb8sy+aAF5GQdpCBTdREf
	7sxh0p+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7LT-0000000Esw1-0cDw;
	Mon, 13 Apr 2026 02:48:15 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7LP-0000000EsuB-2EHb
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 02:48:12 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2d5de9deba9so4516922eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 12 Apr 2026 19:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776048490; x=1776653290; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1hYaaoL2TK3xqrMtTO2We7nUeIa8+5wMOYf3VUga0c=;
        b=UZXv0bD42HOCKsuFSDrhZPPZG7lTyWS3QoSHx21mzJklHocQnIEzVV1PRmYVQbdkVa
         JuRxyYSU0es01Gnn4GIMludX24W45znuEfhJciFafKyNllfNW4n43NdS0/mcrNo8dcs0
         JLJ+FZc5eX2XwoX+m7yGy1hS1+PvVzo4y4Bi/3lOMKgf0yE1DswMkce9GJecXyadLY5s
         M2BZIHz1gzFHSNkiQdDhBCY/dAkiT1zb8OJ30MINN85KXX6Prv3KvJori7fnMJRxRGPR
         DINGh/Fs5es9/Nz4Yj/2FB2mU4bGvauI/qvAtNcYpU9Pe/8Qc7VEwNopkc3pgKr5UZHD
         oTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776048490; x=1776653290;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1hYaaoL2TK3xqrMtTO2We7nUeIa8+5wMOYf3VUga0c=;
        b=F4zOrtCqDw2vyWua7Cl56BA6Zq18dzxVYX1KBIMTe0+FGMZzgUDgmBL9Qj02V9Ieeu
         D5dGlZ7Jpl0KVtV7CkcBHCFWtiHUzKhErX/Ek7IBQV8C98b/h8295i6gHz9cFT8ljJNd
         S1N99UJVA5QuSala4CrAHWKRqSUUZZGAmW+PUAw3BS2dUsTUSb8nndZa5jsDBdGdS8vF
         PVcJjnEYMD5P0jEZRwmlJMtkxnlKuHmk8/r7GrOH+9CUDCd5iX3lFWWb8BXaWFCRkEtk
         lhfeZ/QZJWj/K5sY2dc2RUl2KgN658fXlagELFjZzWgbpt8/WZHYwcI/UlbvC6D+5nQz
         tPgw==
X-Forwarded-Encrypted: i=1; AFNElJ/SjDKhLVWxvmfpkPHizbdXkr0kqfxyCFE1bQGKqAuwTwKtIFc16fS/CWVt/xB6d7mjiPkgXp1I5FxrYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSCPr90nlDIDHorvie68ykSpOtq5ByWg6SDzWozp+CxH2G9fd6
	T1bnJyj/7A+KO935/oCwQ1H+Av1OZ9Vw7ZSU8AlhDn6wFLspXhZipr6ezrbRLYmS+eVzNDUFVkq
	0DI3kR9gcXg==
X-Received: from dyt12.prod.google.com ([2002:a05:693c:808c:b0:2d7:37d5:85cf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:5787:b0:2da:10f0:a8df
 with SMTP id 5a478bee46e88-2da10f0b2e4mr76194eec.12.1776048489353; Sun, 12
 Apr 2026 19:48:09 -0700 (PDT)
Date: Sun, 12 Apr 2026 19:47:57 -0700
In-Reply-To: <advv6twWCEVBo_Hc@x1>
Mime-Version: 1.0
References: <advv6twWCEVBo_Hc@x1>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260413024805.1316480-1-irogers@google.com>
Subject: [PATCH v4 0/8] perf libunwind multiple remote support
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, alex@ghiti.fr, 
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com, 
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, blakejones@google.com, 
	ctshao@google.com, dapeng1.mi@linux.intel.com, howardchu95@gmail.com, 
	irogers@google.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_194811_567562_A894E374 
X-CRM114-Status: GOOD (  18.41  )
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

Fix the libunwind build for when libdw and libunwind are feature
detected, currently failing with a duplicate symbol.

Refactor the libunwind support so that whenever a remote target is
available, perf functions using the ELF machine can use that remote
target regardless of what the host/local machine is. Migrate existing
libunwind supported architectures like powerpc, arm64 and loongarch so
that they can work in a cross-architecture way. Add support for
RISC-V. Make the code more regular in function names, etc. and avoid
including a C-file. This increases the lines of code. It is similar in
style to the unwind-libdw implementation. It is hoped that the more
uniform nature of the code with help with refactoring the perf
registers for SIMD/APX support.

Aside from local host testing these patches are under tested, in part
as I'm failing to see how to build libunwind with support for multiple
remote targets. Please could I get help in testing.

v4: Rebase, in particular the zalloc->calloc change conflicted.

v3: Minor whitespace clean up and warn when a dynamic choice of libdw
    or libunwind is selected for unwinding and support is missing (Arnaldo).
https://lore.kernel.org/lkml/20260404054032.1538095-1-irogers@google.com/

v2: Move two fixes patches to position 1 and 2 in the series. Fix
    struct naming inconsistency, Andrew Jones
    <andrew.jones@oss.qualcomm.com>. Fix other inconsistencies and
    potential non-x86 build issues.
https://lore.kernel.org/lkml/20260305221927.3237145-1-irogers@google.com/

v1: https://lore.kernel.org/lkml/20260224142938.26088-1-irogers@google.com/

Ian Rogers (8):
  perf unwind: Refactor get_entries to allow dynamic libdw/libunwind
    selection
  perf build loongarch: Remove reference to missing file
  tools build: Deduplicate test-libunwind for different architectures
  perf build: Be more programmatic when setting up libunwind variables
  perf unwind-libunwind: Make libunwind register reading cross platform
  perf unwind-libunwind: Move flush/finish access out of local
  perf unwind-libunwind: Remove libunwind-local
  perf unwind-libunwind: Add RISC-V libunwind support

 tools/build/feature/Makefile                  |  38 +-
 tools/build/feature/test-libunwind-aarch64.c  |  27 -
 tools/build/feature/test-libunwind-arm.c      |  28 -
 .../test-libunwind-debug-frame-aarch64.c      |  17 -
 .../feature/test-libunwind-debug-frame-arm.c  |  17 -
 .../feature/test-libunwind-debug-frame.c      |   1 -
 tools/build/feature/test-libunwind-x86.c      |  28 -
 tools/build/feature/test-libunwind-x86_64.c   |  28 -
 tools/build/feature/test-libunwind.c          |   1 -
 tools/perf/Makefile.config                    | 215 ++---
 tools/perf/arch/arm/util/Build                |   2 -
 tools/perf/arch/arm/util/unwind-libunwind.c   |  50 --
 tools/perf/arch/arm64/util/Build              |   1 -
 tools/perf/arch/arm64/util/unwind-libunwind.c |  17 -
 tools/perf/arch/loongarch/util/Build          |   3 -
 .../arch/loongarch/util/unwind-libunwind.c    |  82 --
 tools/perf/arch/mips/Build                    |   1 -
 tools/perf/arch/mips/util/Build               |   1 -
 tools/perf/arch/mips/util/unwind-libunwind.c  |  22 -
 tools/perf/arch/powerpc/util/Build            |   1 -
 .../perf/arch/powerpc/util/unwind-libunwind.c |  92 --
 tools/perf/arch/x86/util/Build                |   3 -
 tools/perf/arch/x86/util/unwind-libunwind.c   | 115 ---
 tools/perf/builtin-inject.c                   |   4 +
 tools/perf/builtin-report.c                   |   4 +
 tools/perf/builtin-script.c                   |   4 +
 tools/perf/util/Build                         |   5 +-
 tools/perf/util/libunwind-arch/Build          |  11 +
 .../perf/util/libunwind-arch/libunwind-arch.c | 319 +++++++
 .../perf/util/libunwind-arch/libunwind-arch.h | 296 +++++++
 .../perf/util/libunwind-arch/libunwind-arm.c  | 290 ++++++
 .../util/libunwind-arch/libunwind-arm64.c     | 289 ++++++
 .../perf/util/libunwind-arch/libunwind-i386.c | 312 +++++++
 .../util/libunwind-arch/libunwind-loongarch.c | 297 +++++++
 .../perf/util/libunwind-arch/libunwind-mips.c | 299 +++++++
 .../util/libunwind-arch/libunwind-ppc32.c     | 301 +++++++
 .../util/libunwind-arch/libunwind-ppc64.c     | 303 +++++++
 .../util/libunwind-arch/libunwind-riscv.c     | 297 +++++++
 .../perf/util/libunwind-arch/libunwind-s390.c | 299 +++++++
 .../util/libunwind-arch/libunwind-x86_64.c    | 320 +++++++
 tools/perf/util/libunwind/arm64.c             |  40 -
 tools/perf/util/libunwind/x86_32.c            |  41 -
 tools/perf/util/maps.c                        |  29 +-
 tools/perf/util/maps.h                        |   4 +-
 tools/perf/util/symbol_conf.h                 |  10 +
 tools/perf/util/thread.c                      |  29 +-
 tools/perf/util/unwind-libdw.c                |   2 +-
 tools/perf/util/unwind-libunwind-local.c      | 831 ------------------
 tools/perf/util/unwind-libunwind.c            | 679 ++++++++++++--
 tools/perf/util/unwind.c                      |  98 +++
 tools/perf/util/unwind.h                      |  77 +-
 51 files changed, 4549 insertions(+), 1731 deletions(-)
 delete mode 100644 tools/build/feature/test-libunwind-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-aarch64.c
 delete mode 100644 tools/build/feature/test-libunwind-debug-frame-arm.c
 delete mode 100644 tools/build/feature/test-libunwind-x86.c
 delete mode 100644 tools/build/feature/test-libunwind-x86_64.c
 delete mode 100644 tools/perf/arch/arm/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/arm64/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/loongarch/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/mips/Build
 delete mode 100644 tools/perf/arch/mips/util/Build
 delete mode 100644 tools/perf/arch/mips/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/powerpc/util/unwind-libunwind.c
 delete mode 100644 tools/perf/arch/x86/util/unwind-libunwind.c
 create mode 100644 tools/perf/util/libunwind-arch/Build
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arch.h
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-arm64.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-i386.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-loongarch.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-mips.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc32.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-ppc64.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-riscv.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-s390.c
 create mode 100644 tools/perf/util/libunwind-arch/libunwind-x86_64.c
 delete mode 100644 tools/perf/util/libunwind/arm64.c
 delete mode 100644 tools/perf/util/libunwind/x86_32.c
 delete mode 100644 tools/perf/util/unwind-libunwind-local.c
 create mode 100644 tools/perf/util/unwind.c

-- 
2.53.0.1213.gd9a14994de-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

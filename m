Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F40EE88D86
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 05:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+EWRHEjcXngHos4dr6wnHxVz3CL0kiHfywf7G34MY2Y=; b=eAl7Bwe4OGpIVk8KRFfasxla3n
	tgjjJtaOlpqwlqJcuRk2EwkUssp+ILnpJRkYaaWqz6pdOT6Vu9mPt50nOodnIuobNMdXaNVpi85tP
	HqVNmsYuGBJbqesUjWs111fIX1WjgRWVSsfmyr2MbjZvKhrXC1Q6/q63FYuB/GSqfE2qcnBZwHaGF
	fOM0hnX4FqSTjlVFubcOGtT6jX8PdylKvG73ho+ztJLOzTOuhjdSUuPNReCX01TyX4/YsEtZzkksP
	bfrqUwY/Jgz6x33FV7aZaHBkKrtCGztxfdOc4Rvz3PC55i70DiVzDkr3wx/jngbfqzVeL9k/PlyMS
	PvzrySsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tkZ-00000003ABA-37ej;
	Sat, 04 Apr 2026 05:40:51 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tkW-00000003A9Q-2L7i
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 05:40:49 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2c68a134df8so2351068eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 22:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775281247; x=1775886047; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q0bWS7IQWf/pTrd7yQAODT3hHm6x/5r6ulA0C6sdgYw=;
        b=AmpUDqiQG+LA1quiYTfF72Z88xKtJlAF2gWujpBrZbYvjJ5Y+upEDvtRHY8z/lXNdx
         e3c0kSWYO0LMMXtheLfzRPrKkeY0uoxepGr6Zfo8Kp77BcntN/mbf15LXrK9z62zsRGH
         E1F7Cy4Z4+dl11lr4IYlnvxDTsrS85mfApOGWEQUMBy1ZvxfD4ex76InyPJpiEnHGILN
         b7N5A5YEsRE4c/g2AcNmR5kOzWkf+VtkKmrwge/sjb8KKHAdNN2fULaAVwhzGdIA+JGL
         fjBTdSeUKmoAUBxbX9efpyoWnXV2UeF5wo17LnubnN+cY9ZnAHp9mjn3E0/yfQAxNmxe
         i5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775281247; x=1775886047;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0bWS7IQWf/pTrd7yQAODT3hHm6x/5r6ulA0C6sdgYw=;
        b=blIiPa/lHvyO4wkbrMLP3YPYU53dfdOucoknA2LhoblTjM74AoqYG09P2XjlXHRWX9
         Sha36kl1kmjrxS6FwoF7FQgppYDQMqtUB1trz3otHjYK4b3kr3Bj+JF8c/5Rh6TUJzC4
         BA0Nth2JwFGdymgeWAm723aupN9lh1vG/XQYaJ+8PuXLu2vvzNwJfJvRm0SHLt0JZHXJ
         s0C/VG6lpXdCH80LozAhq23COxxDujgE45nc8lzp21TVeyRcwWgda62PbwgJy/fN5aMI
         /VaLTgT/zqMYFIQ2OHwIbpsBXs4clovtmppgr/bL2jizyAvVPgSSYQGvXB3RnkqKk8as
         0gag==
X-Forwarded-Encrypted: i=1; AJvYcCXPFJh/IMaq4Ssx/HJhb20E8U/v1LpSHOYCF/ar7THOWhYrUEREOs0Ikt3Mw4uDePPHMMJuUKeO5Hezpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyxU+I/4YOgfRJRj0t6R1FUos5puJ5EWDAkcZ/0lnKdbXExF/L
	Qwn0WADjWYgDF1r/FkU2J93cfcdInO+ZFAz3TLfVTgmsBzBvJuLQiq5NstseKxG3hfC5Lb63lgS
	dCcA2SkvBSw==
X-Received: from dybmx6.prod.google.com ([2002:a05:7300:d406:b0:2c1:5b29:d58f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:3005:b0:2ca:2f21:64da
 with SMTP id 5a478bee46e88-2cbf6a8e179mr2811537eec.0.1775281246342; Fri, 03
 Apr 2026 22:40:46 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:40:24 -0700
In-Reply-To: <20260305221927.3237145-1-irogers@google.com>
Mime-Version: 1.0
References: <20260305221927.3237145-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260404054032.1538095-1-irogers@google.com>
Subject: [PATCH v3 0/8] perf libunwind multiple remote support
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org
Cc: irogers@google.com, 9erthalion6@gmail.com, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_224048_607375_3DA59D9F 
X-CRM114-Status: GOOD (  18.15  )
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

v3: Minor whitespace clean up and warn when a dynamic choice of libdw
    or libunwind is selected for unwinding and support is missing (Arnaldo).

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
 tools/perf/util/unwind-libunwind-local.c      | 832 ------------------
 tools/perf/util/unwind-libunwind.c            | 679 ++++++++++++--
 tools/perf/util/unwind.c                      |  98 +++
 tools/perf/util/unwind.h                      |  77 +-
 51 files changed, 4549 insertions(+), 1732 deletions(-)
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

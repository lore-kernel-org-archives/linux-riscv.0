Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E45BC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Mime-Version
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G8Sawp+1kpMNgt+98ixcHQX2hxwBzttNIobTgSxjOD4=; b=RSe7qI4n2oHTUS
	w79JGj13lTrH/faHLak5Hi4zgbDUEaxEgJkhFbIN69vC5B327BJe7534nF5DicOGGgOlo51oYfHln
	MM2D+c86wuN5VgeVee89VmZdt5rIoxIO769yIXkmHBM6b1xLVMSOglAxwiy6kEpopGjp3MKOTElhp
	9WbryQ4eekkXzRpUxaBLtIlCMJVf26ZQSaEWhS78AhBwbRBStYs103eSsqN8Ae87mX/YNqUL/Q+DX
	SeBCAcEtKmZXfJMoXYZJgRZVNagIgBnG9+21nk4gFuRiamtY0YQzbGlO1sOM8xFrwvUkqQ9t6YKgU
	FfuFjYsvybhnkUS4oINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAE-00000006Y1D-0J7Y;
	Thu, 22 Jan 2026 07:31:34 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAB-00000006Xys-3gBj
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:31:33 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2a13cd9a784so6563785ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 23:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769067090; x=1769671890; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2R1FRhbsKavEIm7ZjwPShbYdeLpx11RnJSbV1m2ZXYk=;
        b=aeMuiJedAcyrw02fJP7sffyyhyBkEITqLExxOFN0Bd/YbtbSyofsuG3rAZO92w5AvG
         dLlqjcTRlyKxZFWu536vii5L8ScqNf5Sj1LPXNj9Q3ozegc3VkWUDz81I3ZIF6rXDdVh
         ZgicbWgovIFMG/aKFlNW23Lps+Ir9n6hOVpbuEwewLJA+KvwuVWOHK2l+5n8s3E89JZU
         +ZlgGFtvqEkAsk2yy9UlIDXEQ+WtNcuIw4Ys9Ff0YTCUfizmClWU+fBbaj/RkxsCeqBK
         yBfGI5fQP7vpmBS/v36POziD4dR/SSGGM5Sbd0LLHnp7Y0Qxs1ssUY8k7jprS3HMgCBG
         VlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067090; x=1769671890;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2R1FRhbsKavEIm7ZjwPShbYdeLpx11RnJSbV1m2ZXYk=;
        b=jiTuDCl//t6hvCIA4bmPNXQmpg9I8yUiHidbPOY8ddDHI2vBzGb6Xr9+FneSmjnCKW
         9dwAeTsFAKBGVTUw+O9RO0pBWIKYpqqtUvR1yLrHqpN59DCOILKgB+byfFBTDII4KSzx
         Xj9B/AG6hN+Z4GWq1mMejMw1JYii3lW3YKKFk1EmkrY6P0CR+wUAd4wIEDP3a+Ep5EJw
         doJZ2dnjAbBsKZRWd7pa1O12Ew5L/9/8jcMyR/oFXW/cadiErWMD4FLN0Fsfavx+91ZT
         M+waEZ4Vq1pMgEVwqXUWZSkJRrswfinXpz4sigmlkWD1eX27TY7xYo0NT+iMfV0seMA+
         fbKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmyGOu5Sg7eqj0mKoxjujWhQUB+d02To+oD9vr/4qPST6iM1u9UjbDdodFZPmtJ86U8nG4/ASXt1uq7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVQ3ZdANr+RwRIehDiWDi5AeWr6o4khY6ro7xINi5EBa5UQ4+M
	9wWZZAWHfsK6XyNX1MMGmP1G3WgwblB3ylicJhDpWNgpmy6MlhdwNB/pIWRe/8NImeT7cRsgZOn
	VNpGj/jplOQ==
X-Received: from plkq20.prod.google.com ([2002:a17:902:edd4:b0:2a7:885f:d4c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:b4f:b0:2a7:683c:afd0
 with SMTP id d9443c01a7336-2a7683cb263mr75816465ad.14.1769067090015; Wed, 21
 Jan 2026 23:31:30 -0800 (PST)
Date: Wed, 21 Jan 2026 23:31:16 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122073127.375139-1-irogers@google.com>
Subject: [PATCH v1 00/11] perf annotate arch clean up
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Zecheng Li <zecheng@google.com>, 
	Tianyou Li <tianyou.li@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233131_919266_74FD9955 
X-CRM114-Status: GOOD (  17.33  )
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

2 initial memory leak fix patches for perf annotate.

Move the disasm.c #included arch files into a new util/annotate-arch
directory. Make the code compile standalone. Try to better encapsulate
architecture specific code within the files and with a
arch__new_<arch> function that allows additional data to be associated
with the struct arch using the standard container_of trick.

Make the lookup of struct arch use the ELF machine gather from a
thread rather than an evsel. For example, the evsel can't determine
the difference between EM_386 and EM_X86_64 so generally the latter
has currently been used. This means the dwarf registers are off as
register 1 is CX with EM_386 and DX with EM_X86_64. To facilitate this
change map_symbol is refactored to use a struct thread rather than a
struct maps, the maps being obtainable from the thread.

To make in and out arguments clearer, for safety, etc. try to constify
struct arch and its related structs.

Ian Rogers (11):
  perf maps: Fix reference count leak in maps__find_ams
  perf annotate: Fix args leak of map_symbol
  perf disasm: Constify use of struct arch
  perf disasm: Constify use of struct ins_op
  perf disasm: Constify use of struct ins
  perf disasm: Rework the string arch__is to use the ELF machine
  perf disasm: Don't include C files from the arch directory
  perf disasm: Refactor ins__is_call/jump to avoid exposing arch ins_ops
  perf map_symbol: Switch from holding maps to holding thread
  perf disasm: Refactor arch__find and initialization of arch structs
  perf disasm: Minor layout tweaks for struct arch

 tools/perf/arch/arc/annotate/instructions.c   |  11 -
 .../perf/arch/riscv64/annotate/instructions.c |  36 --
 tools/perf/ui/browsers/annotate.c             |   6 +-
 tools/perf/ui/browsers/hists.c                |   3 +-
 tools/perf/util/Build                         |   1 +
 tools/perf/util/addr_location.c               |   4 -
 tools/perf/util/addr_location.h               |   1 -
 tools/perf/util/annotate-arch/Build           |  11 +
 tools/perf/util/annotate-arch/annotate-arc.c  |  18 +
 .../annotate-arch/annotate-arm.c}             |  48 +-
 .../annotate-arch/annotate-arm64.c}           |  59 +--
 .../annotate-arch/annotate-csky.c}            |  29 +-
 .../annotate-arch/annotate-loongarch.c}       |  57 ++-
 .../annotate-arch/annotate-mips.c}            |  29 +-
 .../annotate-arch/annotate-powerpc.c}         | 125 +++++-
 .../util/annotate-arch/annotate-riscv64.c     |  41 ++
 .../annotate-arch/annotate-s390.c}            |  59 ++-
 .../annotate-arch/annotate-sparc.c}           |  26 +-
 .../annotate-arch/annotate-x86.c}             |  89 ++--
 tools/perf/util/annotate-data.c               |  12 +-
 tools/perf/util/annotate-data.h               |   2 +-
 tools/perf/util/annotate.c                    |  88 ++--
 tools/perf/util/annotate.h                    |  10 +-
 tools/perf/util/callchain.c                   |  12 +-
 tools/perf/util/capstone.c                    |  18 +-
 tools/perf/util/db-export.c                   |   1 -
 tools/perf/util/disasm.c                      | 424 +++++++-----------
 tools/perf/util/disasm.h                      |  95 ++--
 tools/perf/util/event.c                       |   2 -
 tools/perf/util/hist.c                        |  18 +-
 tools/perf/util/llvm.c                        |   8 +-
 tools/perf/util/machine.c                     |  13 +-
 tools/perf/util/map_symbol.c                  |   5 +-
 tools/perf/util/map_symbol.h                  |   3 +-
 tools/perf/util/maps.c                        |   1 +
 tools/perf/util/sort.c                        |   2 +-
 tools/perf/util/unwind-libdw.c                |   2 +-
 tools/perf/util/unwind-libunwind-local.c      |   2 +-
 38 files changed, 752 insertions(+), 619 deletions(-)
 delete mode 100644 tools/perf/arch/arc/annotate/instructions.c
 delete mode 100644 tools/perf/arch/riscv64/annotate/instructions.c
 create mode 100644 tools/perf/util/annotate-arch/Build
 create mode 100644 tools/perf/util/annotate-arch/annotate-arc.c
 rename tools/perf/{arch/arm/annotate/instructions.c => util/annotate-arch/annotate-arm.c} (59%)
 rename tools/perf/{arch/arm64/annotate/instructions.c => util/annotate-arch/annotate-arm64.c} (70%)
 rename tools/perf/{arch/csky/annotate/instructions.c => util/annotate-arch/annotate-csky.c} (67%)
 rename tools/perf/{arch/loongarch/annotate/instructions.c => util/annotate-arch/annotate-loongarch.c} (66%)
 rename tools/perf/{arch/mips/annotate/instructions.c => util/annotate-arch/annotate-mips.c} (59%)
 rename tools/perf/{arch/powerpc/annotate/instructions.c => util/annotate-arch/annotate-powerpc.c} (73%)
 create mode 100644 tools/perf/util/annotate-arch/annotate-riscv64.c
 rename tools/perf/{arch/s390/annotate/instructions.c => util/annotate-arch/annotate-s390.c} (70%)
 rename tools/perf/{arch/sparc/annotate/instructions.c => util/annotate-arch/annotate-sparc.c} (85%)
 rename tools/perf/{arch/x86/annotate/instructions.c => util/annotate-arch/annotate-x86.c} (93%)

-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

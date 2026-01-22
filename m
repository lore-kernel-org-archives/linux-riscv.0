Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BE0D6CFA6
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 21:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Mime-Version
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xhZ2BikZv1qoWwGerOInjdgCqre4xz/FovVn/tNllMg=; b=18fMdztNCgeI0y
	mTCZfZs3iZffR7WAyKeSiCYhEpG6jWvQGnVxNKRhwQGPc8fpmfnjXOhDlWrn2byPYdVj7dXFftqK9
	y2J7pqRqauqalNBmUqLPjPquwmRX6kJ8AhvhhIHtnBU0ySHfqZWwyKe6cpKVeFiBVkiUz68jIyTdr
	eM8YKJoLhkbj3n7OUe0fTgFjqxQKbPlSeP7W9bIrRr6BX5Dp587BicbRjc5q7l7jTWhSGcsBx6BuZ
	QXUOpAUqOCku1dPoOeimZzhkmL+tr7o5PjtZfBpPQxTEno8BjpONQcYyWJjTNee5KvW0fuQLtwLXi
	8XAQckxAsSWIHjzvVtwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2Ku-00000007mHr-1I6R;
	Thu, 22 Jan 2026 21:35:28 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2Kr-00000007mFp-0waX
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 21:35:26 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so7790431eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 13:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769117723; x=1769722523; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZjxarqoXVmrnwFoXxcECDiv8CYdTI3p8aLn4Yna1I44=;
        b=hDILKNswD5LB0GHWf7teNRkuxoQhVzvycJiqOytRTRdN+k41cVkOvSIo1DzDPRVMy1
         Jgpd3WbrtvrBoAzbAlwebOt3XiO52SaSOcwXnUYeZDJ7bBJKGCHBdGB24Ei6CdJTZ2kr
         NvkubtCj9H+FcMFvQMFkEjCVBeqSKWeAcXrD5OvNI8AkaCG8cmDj5QbUDoBQfnCUtIM7
         zI9gHwbnqI6hi7ezd9tDvUuLYpdRRo7UMnmNjnD0k4vbtzgqGjKuun3xyVo3lWFdYYoe
         nHbKF3yE0noXT5latQn01VOJ6ktDQklPzR1S/Fa+yNOBuPt+R4Ff75wuZ3PtKnLcV0Z+
         P/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117723; x=1769722523;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZjxarqoXVmrnwFoXxcECDiv8CYdTI3p8aLn4Yna1I44=;
        b=b1+Rht6B9PsOYNhJTUFq0q4zb9VduO/U+Id3+9qGJ8SK6i7W7oW+KSLGMiaRnQh4/p
         R/f/3sYcWl9jSM/M6eI6DN6sUgo9/zUZPtZqs5AFm3M/6ac3ZJyl34I8FIyIIaUWTz9t
         fdcEKGauSNQB6zL6iMb4dBZo8pES0DAnQVTOMwFNu4JscNCN0ucsOrLrkrBdLNFBSrZn
         tj/wrcLZawVx/p+r1JsYPXhv1YgyDS+sBqsVLCesyX7It1PupRqiyDXjQ+w4DAy9Hega
         HUDIwerJcmC6srlnj7XWjGwgyPqQVt59i4QzddtTlj+TNIvqf2rmovhM0I7i0IswPr5Z
         6fGQ==
X-Forwarded-Encrypted: i=1; AJvYcCULK22seNAdpgPhK7Oe0SZ88ce43L3O5F5Qdj8D+zTBIf12SCo+CfhElr2Wcapcyh9O/v6qkBSrskRilg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvEFq+mcQ3pGTpSbT307/xHOHikoingE/WKY04L72lhMuo987Z
	1CxFUM4mNNLrVK5jpLdqBOHBgnQXMNhhFuvZbJMTl03SptJB/wkqUzpDeHqahQ8dpPQhM2Tcq+l
	sqN23U9mWDw==
X-Received: from dycph3.prod.google.com ([2002:a05:7300:dd43:b0:2b7:b7:1269])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6094:b0:2ae:5d5b:4ed0
 with SMTP id 5a478bee46e88-2b739b751e6mr408223eec.21.1769117723263; Thu, 22
 Jan 2026 13:35:23 -0800 (PST)
Date: Thu, 22 Jan 2026 13:35:04 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122213516.671089-1-irogers@google.com>
Subject: [PATCH v3 00/12] perf annotate arch clean up
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
X-CRM114-CacheID: sfid-20260122_133525_260960_3269228D 
X-CRM114-Status: GOOD (  18.83  )
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

3 initial memory leak fix patches for perf annotate.

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

v3: Fix arch initialization on arm, arm64, powerpc and sparc as spotted by Suchit
    Karunakaranw.

v2: Add a patch to fix a domain info memory leak that was blocking
    leak sanitizer analysis. Fix more map_symbol leaks or uses after
    reference count put (Suchit Karunakaranw
    <suchitkarunakaran@gmail.com>).  Try to repro annotate test crash
    (James Clark) but suspect it was addressed in the other reference
    count fixes.
    https://lore.kernel.org/lkml/20260122165407.561888-1-irogers@google.com/

v1: https://lore.kernel.org/lkml/20260122073127.375139-1-irogers@google.com/

Ian Rogers (12):
  perf header: Fix memory leaks in process_cpu_domain_info
  perf annotate: Fix args leak of map_symbol
  perf maps: Fix reference count leak in maps__find_ams
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
 .../annotate-arch/annotate-arm.c}             |  50 +-
 .../annotate-arch/annotate-arm64.c}           |  59 +--
 .../annotate-arch/annotate-csky.c}            |  29 +-
 .../annotate-arch/annotate-loongarch.c}       |  71 +--
 .../annotate-arch/annotate-mips.c}            |  29 +-
 .../annotate-arch/annotate-powerpc.c}         | 127 +++++-
 .../util/annotate-arch/annotate-riscv64.c     |  41 ++
 .../annotate-arch/annotate-s390.c}            |  70 +--
 .../annotate-arch/annotate-sparc.c}           |  28 +-
 .../annotate-arch/annotate-x86.c}             |  89 ++--
 tools/perf/util/annotate-data.c               |  12 +-
 tools/perf/util/annotate-data.h               |   2 +-
 tools/perf/util/annotate.c                    |  88 ++--
 tools/perf/util/annotate.h                    |  10 +-
 tools/perf/util/callchain.c                   |  12 +-
 tools/perf/util/capstone.c                    |  18 +-
 tools/perf/util/db-export.c                   |   1 -
 tools/perf/util/disasm.c                      | 428 +++++++-----------
 tools/perf/util/disasm.h                      |  95 ++--
 tools/perf/util/event.c                       |   2 -
 tools/perf/util/header.c                      |  17 +-
 tools/perf/util/hist.c                        |  18 +-
 tools/perf/util/llvm.c                        |   8 +-
 tools/perf/util/machine.c                     |  13 +-
 tools/perf/util/map_symbol.c                  |   5 +-
 tools/perf/util/map_symbol.h                  |   3 +-
 tools/perf/util/maps.c                        |   1 +
 tools/perf/util/sort.c                        |   2 +-
 tools/perf/util/unwind-libdw.c                |   2 +-
 tools/perf/util/unwind-libunwind-local.c      |   2 +-
 39 files changed, 775 insertions(+), 648 deletions(-)
 delete mode 100644 tools/perf/arch/arc/annotate/instructions.c
 delete mode 100644 tools/perf/arch/riscv64/annotate/instructions.c
 create mode 100644 tools/perf/util/annotate-arch/Build
 create mode 100644 tools/perf/util/annotate-arch/annotate-arc.c
 rename tools/perf/{arch/arm/annotate/instructions.c => util/annotate-arch/annotate-arm.c} (59%)
 rename tools/perf/{arch/arm64/annotate/instructions.c => util/annotate-arch/annotate-arm64.c} (70%)
 rename tools/perf/{arch/csky/annotate/instructions.c => util/annotate-arch/annotate-csky.c} (67%)
 rename tools/perf/{arch/loongarch/annotate/instructions.c => util/annotate-arch/annotate-loongarch.c} (60%)
 rename tools/perf/{arch/mips/annotate/instructions.c => util/annotate-arch/annotate-mips.c} (59%)
 rename tools/perf/{arch/powerpc/annotate/instructions.c => util/annotate-arch/annotate-powerpc.c} (73%)
 create mode 100644 tools/perf/util/annotate-arch/annotate-riscv64.c
 rename tools/perf/{arch/s390/annotate/instructions.c => util/annotate-arch/annotate-s390.c} (66%)
 rename tools/perf/{arch/sparc/annotate/instructions.c => util/annotate-arch/annotate-sparc.c} (85%)
 rename tools/perf/{arch/x86/annotate/instructions.c => util/annotate-arch/annotate-x86.c} (93%)

-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

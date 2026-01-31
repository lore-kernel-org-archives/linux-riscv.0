Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42DCE7C6E5
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 20:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Mime-Version
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WHEctTDU58OFoKpxbhJzYR6axS5iM6/wUwWeAFI8TlY=; b=M92SchqxWyJlIf
	odRdUiOcWCgl/VAHayO7v1bH7qdT845xHqBUfHr14DS13/oKmpQeY7cM/u7nsk3baVbK5u4xlSUVL
	pRAU2eQhGCGo5CP1N01QsDAiLZcHVWDh3dJzj/lu54SQ2EMdvSU27WT0ofZleTFrkXuH3BJpXmmR6
	dGVwQX2JhbY6tNlZfKM/9529g/1mt+mwt0dmaq+/WvZUC2HyVOu80tqA0FRT2vOR+/zwUe3QrrgmL
	DGD/KrAZ3uTseQ7PJK96CJfPd3ovsN9YxwOQUcuuXUoVe2HFn69J1P+4sxAgzTfC3MM9zdaWLNwtB
	Wao4Aeuvzp+pyRr3IHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHAu-00000002wSS-3BZ6;
	Sat, 31 Jan 2026 20:02:32 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHAs-00000002wQm-0mLh
	for linux-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 20:02:31 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b7c12b62f8so1991581eec.0
        for <linux-riscv@lists.infradead.org>; Sat, 31 Jan 2026 12:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769889748; x=1770494548; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QaGUZTYnRQ2wGpunAGr/0FtMXdyckbXL2oq4bK6APm0=;
        b=Ro+vv5xmujxFKPjzp/bjDqBhSKPV3LEJxHvCIq+Bc+Q12O/FE8QjFbTqw6KpqHCDga
         otQ7a8ZacWu3QgBP/DXbQj2zfvhm9IaG3354zPEL91N6oTZwjU7Dil8K4cnXDq1mX1fh
         2TQeDd/lCWc+DiJUfEjZVHgRMfLkBI/rTW4SMoaIjz+lio1TNh4VvNZswmeD0Qc5YzIR
         HWdc5F3Nuo5MbNMQ8xYpPz4LRjFAZfvszh6lASCNqTEcU/PRx2lbwp3gLvMJPVtyD1Wm
         FZaC62KVgD5+GhVBvTz/0PHg0S7leEotOB/NliY3cD8PN5+zv7tDcA7+JNnPthlKHOPw
         dIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889748; x=1770494548;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QaGUZTYnRQ2wGpunAGr/0FtMXdyckbXL2oq4bK6APm0=;
        b=ZjyvjmJQOS11zsD9czHEqIhWppoJCa85tdchG//9DU24KRwc7z2wehOW1UKJ/h8GV6
         A1sQ93NxNtKDuWnVk0dwk577ihlkKNQN3a5DYyxAIR/g7H1lCTacdeCHCztIqGfmEbAe
         31YKXNfg8xHh4ygX/Qp3imvoCVArPhkz7ZZcxKcB0y9prdJjtTenJB9dw+Um/J2ZxjI/
         dEMdvE+P+kZsnlEPW2fE8O8K+x/0UHhyeLSblNvWtimyaM+uHGy9SWDRjtZwxEbRX0vM
         6EfmzymaTMgRfzGKcpInLFhSm8/ItHNv9R9uXQrBCG6Cv39WHB0t/5rMS+SscIR05OyX
         35kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW0nBTwoSu8Ww/zMhrBveDBAP8u01lPz54bvTaLtJfqaoNSOG0tbDWfCJWip9TcHzKiaXJaDRAzKENSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr+nr1039te4iZRyY/lmEcdYAHGN9WIyA+57xv9HDC1gFFNAMY
	TkrVjMIdBavLwqt+lv1Y7obqtgYTB1/fTjT78J/Ms9vwnpq/kvjgbttqJvieJbCJ3Nyme9d5n7b
	gUxNsrOP6ow==
X-Received: from dlbpy24.prod.google.com ([2002:a05:7022:e998:b0:123:2708:9404])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:608d:b0:123:2de5:346e
 with SMTP id a92af1059eb24-125c18bebdbmr2411145c88.0.1769889747533; Sat, 31
 Jan 2026 12:02:27 -0800 (PST)
Date: Sat, 31 Jan 2026 12:02:18 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131200224.1296136-1-irogers@google.com>
Subject: [PATCH v2 0/6] perf Cross platform KVM support
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, Yunseong Kim <ysk@kzalloc.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Blake Jones <blakejones@google.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Anubhav Shelat <ashelat@redhat.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_120230_217757_93B330BC 
X-CRM114-Status: GOOD (  14.30  )
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

The existing perf kvm code is using the arch directory, which means a
data file can only be processed on the same machine type that it was
recorded. Switch to using the ELF machine of the session at runtime to
set up the KVM support, making it cross-architectural. So that the ELF
machine number is available early in initialization add it to the perf
data file header.

v2: Wire up the perf data header to have the e_machine and allow early
    initialization of the KVM operations based upon it.
v1: https://lore.kernel.org/lkml/20260128074106.788156-1-irogers@google.com/

Ian Rogers (6):
  perf test kvm: Add stat live testing
  perf kvm stat: Remove use of the arch directory
  perf kvm: Wire up e_machine
  perf session: Add e_flags to the e_machine helper
  perf header: Add e_machine/e_flags to the header
  perf thread: Don't require machine to compute the e_machine

 tools/perf/Makefile.config                    |   4 -
 tools/perf/arch/arm64/Makefile                |   1 -
 tools/perf/arch/arm64/util/Build              |   1 -
 tools/perf/arch/loongarch/Makefile            |   1 -
 tools/perf/arch/loongarch/util/Build          |   1 -
 tools/perf/arch/powerpc/Makefile              |   1 -
 tools/perf/arch/powerpc/util/Build            |   1 -
 tools/perf/arch/riscv/Makefile                |   1 -
 tools/perf/arch/riscv/util/Build              |   2 -
 tools/perf/arch/s390/Makefile                 |   1 -
 tools/perf/arch/s390/util/Build               |   1 -
 tools/perf/arch/x86/Makefile                  |   1 -
 tools/perf/arch/x86/util/Build                |   1 -
 tools/perf/builtin-kvm.c                      |  73 +++---
 tools/perf/builtin-report.c                   |   4 +-
 tools/perf/builtin-script.c                   |   6 +-
 tools/perf/tests/shell/kvm.sh                 |  30 ++-
 tools/perf/util/Build                         |   3 +-
 tools/perf/util/env.h                         |   3 +
 tools/perf/util/evsel.c                       |   6 +-
 tools/perf/util/evsel.h                       |   1 +
 tools/perf/util/header.c                      |  33 +++
 tools/perf/util/header.h                      |   1 +
 tools/perf/util/kvm-stat-arch/Build           |   6 +
 .../kvm-stat-arch}/arm64_exception_types.h    |   0
 .../kvm-stat-arch}/book3s_hcalls.h            |   0
 .../kvm-stat-arch}/book3s_hv_exits.h          |   0
 .../kvm-stat-arch/kvm-stat-arm64.c}           |  43 ++--
 .../kvm-stat-arch/kvm-stat-loongarch.c}       |  48 ++--
 .../kvm-stat-arch/kvm-stat-powerpc.c}         |  61 ++---
 .../kvm-stat-arch/kvm-stat-riscv.c}           |  42 ++--
 .../kvm-stat-arch/kvm-stat-s390.c}            |  38 ++--
 .../kvm-stat-arch/kvm-stat-x86.c}             |  44 ++--
 .../kvm-stat-arch}/riscv_trap_types.h         |   2 +-
 tools/perf/util/kvm-stat.c                    | 215 +++++++++++++++++-
 tools/perf/util/kvm-stat.h                    |  70 ++++--
 .../scripting-engines/trace-event-python.c    |   8 +-
 tools/perf/util/session.c                     |  62 ++++-
 tools/perf/util/session.h                     |   2 +-
 tools/perf/util/thread.c                      |   5 +
 40 files changed, 606 insertions(+), 217 deletions(-)
 create mode 100644 tools/perf/util/kvm-stat-arch/Build
 rename tools/perf/{arch/arm64/util => util/kvm-stat-arch}/arm64_exception_types.h (100%)
 rename tools/perf/{arch/powerpc/util => util/kvm-stat-arch}/book3s_hcalls.h (100%)
 rename tools/perf/{arch/powerpc/util => util/kvm-stat-arch}/book3s_hv_exits.h (100%)
 rename tools/perf/{arch/arm64/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-arm64.c} (62%)
 rename tools/perf/{arch/loongarch/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-loongarch.c} (77%)
 rename tools/perf/{arch/powerpc/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-powerpc.c} (78%)
 rename tools/perf/{arch/riscv/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-riscv.c} (57%)
 rename tools/perf/{arch/s390/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-s390.c} (77%)
 rename tools/perf/{arch/x86/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-x86.c} (88%)
 rename tools/perf/{arch/riscv/util => util/kvm-stat-arch}/riscv_trap_types.h (96%)

-- 
2.53.0.rc1.225.gd81095ad13-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0455DD5AE6B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 07:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TDHmNlcrAwzRMJTGOCP7lkIUjQg5lefZA+29RlboJjc=; b=tGQzIq4M7vd88P
	4h/MX3TAs3f9Md79GQ7G6cRINEcoRoQp6IV/4uPBK1dCPeCuMKk5ldnoVxp/nhhfbPJRWgkPRwpUQ
	N9azc9Ui9PBUMY2CaAZleyylQ68UhRxyhWQA0LNoZxKRZcShTyvGjxDentA1O6SB5rBlCK0KorBuB
	VxOKgZNyN8H5R4xRvfzh0AeI0mf36NbuavVegSlyxrgV3D3G+vRBcLmW8+8WT48aeOBYUB2MCedVW
	clUOeLK7tv4oIN10Y++L3+iTY9cDOdBxrBE73ocvOPjXuothx+fb+pgOQgkRgI+1qzcWqYs3qPhDy
	jWeHdipHZ0Y8ye1mUjSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wkV-00000005wri-0RVD;
	Thu, 07 Nov 2024 07:16:11 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wkP-00000005wnh-210z
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 07:16:10 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ea33aad097so20159247b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Nov 2024 23:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730963763; x=1731568563; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wIF/aFyjH0swzXh//3pYKGTGeXLDfUk5PCZEh9QeTEg=;
        b=GPjAsAp0hZHJkaillkkdthRVabxpIYe3a/RQ+eexxMfJ7BhmPERvxfoWIZaXkTE/Zy
         hR/wOqE03Ntu6Mr30cbM5TDBYoeeiMJ2cu3INVq+jBbofk3RWb6O0YnKX5RyNRBHTXLN
         UIGBq5FavRWHFj2GtlNsxvE51DmTSI8FjzmQfw8L1YzwkmRQRkKBSpyCueHSHBA72nsH
         SVB3lPn5yVFAqGirJHnlMbuE41AfMiW2QKUwf5EmpEsZXjZ3HJIUgz9bfKYC27qN1TB0
         WHKS7RCo0gVegXvkPU+Xpdd6rmIXMMbJn9DWWXf9i3DCPZg5CcN3ujYamTj7hdRKmtXK
         G+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963763; x=1731568563;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wIF/aFyjH0swzXh//3pYKGTGeXLDfUk5PCZEh9QeTEg=;
        b=tsDlmT7HHlR1WNBatfLMZ+0ttmRDwTvQoFAidPgCnPngIBc2iytuwwHItnWTEpDeto
         vCejoKfDFWSzPQEUYmj6Dxv94LwMJ7FFuu1JIhIstopKmc6a0sAcb7TPL2ThrGI60D0S
         87dZq0VYJKZTJXmuOXI06580EIAbYxKKYCP0LOBpBVBBqTuRRZ1mlYpZ67ywF0fpiWI2
         ZyIjy5yUnmUjloBVP9wxcuRWTr3uEWBQrfKNaMdV0lsynb7GkFRuIhb+Lihqc5WwShjK
         q4esfzaQ9XqC22n/czWZv/6W8WAeKola59dxJMat3JqppEG0zaPpjKGCAA+nPYw7FapJ
         lyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUViu/ObAbb8LBwayihYCr7fZk9Cfz+4US4kQmhIj1AY809sJm/lBOzHeMk7Lgoso0luBkN+1H+rvk6nA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywitb5orWw8SlBfYpfJr1dHEqNtQFqs2DMX+cthvcx8uSRJMtbh
	TxLKA58ZLsreXHsn+wnhfbjen2w/hRwzCDxgrLng1uqLWuRyFeBTdyb0iIOACtYo0Xfhti2ay8G
	O/GUvQA==
X-Google-Smtp-Source: AGHT+IHvCILyN5DpJxEsgBeXCmm3giFiBD6WLezeO39x4rZhcquIeovnhv7BJuOVaBOHsKZJ7wG2BPFJsN4k
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:acc7:bda:7167:18d8])
 (user=irogers job=sendgmr) by 2002:a25:600b:0:b0:e30:cbcf:181c with SMTP id
 3f1490d57ef6-e3368e1f4femr4836276.2.1730963763338; Wed, 06 Nov 2024 23:16:03
 -0800 (PST)
Date: Wed,  6 Nov 2024 23:15:53 -0800
Message-Id: <20241107071600.9082-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v1 0/7] Refactor cpuid and metric table lookup code
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das <sandipan.das@amd.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, 
	"=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=" <clement.legoffic@foss.st.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_231605_562958_63410053 
X-CRM114-Status: GOOD (  12.04  )
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

Xu Yang <xu.yang_2@nxp.com> reported issues with the system metric
lookup:
https://lore.kernel.org/linux-perf-users/20241106085441.3945502-1-xu.yang_2@nxp.com/
These patches remove a lot of the logic relating CPUIDs to PMUs so
that the PMU isn't part of the question when finding a metric table.
For time reasons, it doesn't go as far as allowing system metrics
without a metric table as a metric table is needed for metrics to
refer to other metrics, and the refactoring of that resolution is a
hassle.

Ian Rogers (7):
  perf header: Move is_cpu_online to numa bench
  perf header: Refactor get_cpuid to take a CPU for ARM
  perf arm64 header: Use cpu argument in get_cpuid
  perf header: Avoid transitive PMU includes
  perf header: Pass a perf_cpu rather than a PMU to get_cpuid_str
  perf jevents: Add map_for_cpu
  perf pmu: Move pmu_metrics_table__find and remove ARM override

 tools/perf/arch/arm64/util/arm-spe.c     | 14 +---
 tools/perf/arch/arm64/util/header.c      | 73 ++++++++++-----------
 tools/perf/arch/arm64/util/pmu.c         | 20 ------
 tools/perf/arch/loongarch/util/header.c  |  4 +-
 tools/perf/arch/powerpc/util/header.c    |  4 +-
 tools/perf/arch/riscv/util/header.c      |  4 +-
 tools/perf/arch/s390/util/header.c       |  6 +-
 tools/perf/arch/x86/util/auxtrace.c      |  3 +-
 tools/perf/arch/x86/util/header.c        |  5 +-
 tools/perf/bench/numa.c                  | 51 +++++++++++++++
 tools/perf/builtin-kvm.c                 |  4 +-
 tools/perf/pmu-events/empty-pmu-events.c | 39 ++++++-----
 tools/perf/pmu-events/jevents.py         | 39 ++++++-----
 tools/perf/pmu-events/pmu-events.h       |  2 +-
 tools/perf/tests/expr.c                  |  5 +-
 tools/perf/util/env.c                    |  4 +-
 tools/perf/util/expr.c                   |  6 +-
 tools/perf/util/header.c                 | 82 ++++++++----------------
 tools/perf/util/header.h                 | 23 +++----
 tools/perf/util/pmu.c                    | 25 --------
 tools/perf/util/pmu.h                    |  2 -
 tools/perf/util/probe-event.c            |  1 +
 22 files changed, 187 insertions(+), 229 deletions(-)

-- 
2.47.0.199.ga7371fff76-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

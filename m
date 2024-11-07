Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EA1D43379
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 16:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UHsGV79mnt/H3Ech9+wtHFtLuOgCtH/+i/+myYwnM80=; b=mnEIbyjXAu9Y8O
	chjE32vKOtsFnROB55MG1WLWZUlpl0JfYo6MXaSUuCQ4TZ0YUQ8O7sXSyFVp5y4dZD4nKrQRhMhkG
	txjQkkSP1tf08CRE77FYpvZczHhain967WpxGTJ4hswmgJqFZHyCydqdlFuZploYsMCnN9P2UH18h
	AEA2gvWuJJ4XmEANGAnuh2NTwKGgN5gNidAzkftD/Vxdhfsz6jrqCyCgEi2UcV+3fFsTvO5Dgcej6
	99P8Kzt41lnNB86PqBn6nCGE9K9NZ9a3I0zDF1p6UruLulae7MfK8N9QPVu5L9DmSCo8/KJ46SfmO
	JPBK+3lvgOlU+Ch7w4pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95ND-00000007e1P-1PzH;
	Thu, 07 Nov 2024 16:28:43 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95FS-00000007bZC-2TXL
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 16:20:44 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6ea82a5480fso22118847b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2024 08:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730996441; x=1731601241; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v57hY9ptVyUkWxpU5CBHz4hqYdCeNDSYBzpW7YMhHII=;
        b=QCWlrhEtkTxu0m+acOEHaOxNXNuICDZM79pzUvwprj01prHwqRwSgoCsJxxq8o/5RI
         B+lWy1JBCm+OCo33hbwtI7YNAUAnTDpRrrmofTXhSULwf7K+tgrCkVbJH1hX3Q8ddfaW
         ORV23YsI/VrAA64qIduLpjTAUKErPxnXS12b/h5/wNes6fQ9om7fPSO5GZdOYmPGtOgf
         W5Q+kfy2wyol7mFiSvKUIKQP4kU3pIYFbLw8y5u6L44SUyAKGt1rXtgWe5xg4dr8wRc3
         +TxBRjS/URafxIAzhQZZZ9GW42hyE4sTjiBltIl56NM7m85mciGBaaYOnG73IdzNd1bH
         ZR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730996441; x=1731601241;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v57hY9ptVyUkWxpU5CBHz4hqYdCeNDSYBzpW7YMhHII=;
        b=W9IFaIFUaPmWPhdQKhBPaJuddpcxGVP2EZeSsNEa2bl5+kDaNzs6u4ecWsadIgO9F/
         5ToboyrF03mj/h7OMI6rRWmkttZg2oP3z/hEkunwG2hq6UkoQY5ZrREXrZkXFGOEHrIW
         e27VlarpTlxCDUSlCp+bDSRA2QdqVYZ866TAXkqXw4jw+9kOx1gSz5a1R2oC7D0xr4rz
         b2F6AjXDZ4He7UPq0GUO9AwN+e3I6tqln5MWhVyyp4Kt3vxglc1CESnHyslTNnKdPlNr
         eG+T8rH82k9ujtcsg8g95q7B/ahydo+cAT1mIl7pdzIZ4hxhSXn8mOLWJq3Jw9KU2a8r
         dMVw==
X-Forwarded-Encrypted: i=1; AJvYcCU6LaS7EXpGXYymD9Hw39Usia5sAxYgw6zemmtacz0rSoeduU3VmPpj+8LzKJ2p7JuI3dNYJ4r5D+Vd7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YytO74yXwOJUDF8+odZsytfiEIcHlJ4EXMFN1mFR8gcjZRD4AIc
	HBSz4GHGTQ0BRVwZWaU0SaY/CAQExwK/QMVHSC5nQaHWn8hHzUTJTHqatJ/jI3RtKTm4M31atNS
	e3P02kA==
X-Google-Smtp-Source: AGHT+IHC0X+WZsmRaD10ygx7XOVdKB/UZb7/tV2Np4btpUBS2SgGAemSgZHBuWrvuUd2DVUs75+KuuMxxrqo
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:acc7:bda:7167:18d8])
 (user=irogers job=sendgmr) by 2002:a05:690c:13:b0:6ea:8651:4b27 with SMTP id
 00721157ae682-6eadc1065acmr1207b3.5.1730996440734; Thu, 07 Nov 2024 08:20:40
 -0800 (PST)
Date: Thu,  7 Nov 2024 08:20:27 -0800
Message-Id: <20241107162035.52206-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v2 0/8] Refactor cpuid and metric table lookup code
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
X-CRM114-CacheID: sfid-20241107_082042_650187_6057AC3F 
X-CRM114-Status: GOOD (  12.00  )
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

Xu Yang (1):
  perf jevents: fix breakage when do perf stat on system metric

 tools/perf/arch/arm64/util/arm-spe.c     | 14 +---
 tools/perf/arch/arm64/util/header.c      | 73 ++++++++++-----------
 tools/perf/arch/arm64/util/pmu.c         | 20 ------
 tools/perf/arch/loongarch/util/header.c  |  4 +-
 tools/perf/arch/powerpc/util/header.c    |  4 +-
 tools/perf/arch/riscv/util/header.c      |  4 +-
 tools/perf/arch/s390/util/header.c       |  6 +-
 tools/perf/arch/x86/util/auxtrace.c      |  3 +-
 tools/perf/arch/x86/util/header.c        |  5 +-
 tools/perf/bench/numa.c                  | 53 +++++++++++++++
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
 22 files changed, 189 insertions(+), 229 deletions(-)

-- 
2.47.0.199.ga7371fff76-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

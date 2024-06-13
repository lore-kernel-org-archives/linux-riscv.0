Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83059C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 18:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bMSEDS7zbyCvVJQVqozO8JtYRZwnFdsaKJAm7XR5XIk=; b=qObVRWZEfKF9Yr
	VvYC73Vs156u/Y5UloXV2uiPEfOMBcDmrVrg23m+6xVFfqk8l2UxHfooKW8oWKaa0E3SvgFvY71to
	uQk0R9JaqE3XpT+FrlCqhMx8XXVtXU0DlQFttez+WVtV9ArrjIiFsrqO/acMAU6H+Q/hWyDQyShYt
	w5NBl4+za1asj+KCMQd7elWEFh3L7RZaE1ZPk/c6NdtSKAz+2VdjLaIouBIDQa7ce2hgD88+7jqx9
	7K7LTp1grjIgH39CvgkP6P+U5bLmlbYkzzt2y8F3kfgqVNpLMGqBzZ1FovwbltbMxPAfUbQxs3HNk
	cG1h6wjZnh+/6gKxgrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpFX-000000005wy-0WMi;
	Thu, 13 Jun 2024 18:32:39 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHpFU-000000005vb-239q
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 18:32:38 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dfeff1ae480so2285575276.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 11:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718303553; x=1718908353; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GvTiDUv73PJ62h8lVRQjJMyYJyL2LnE71Yt7gAeiVUY=;
        b=WQw4Gc0MQWY3DFp8O7w3j0GGaNc7yWgX626R0x8iyWxa8GIJYiW9/yyFruAHP6UwZx
         FDBnpmX+uOB0a9NChhI+cui+938M0g5vBnTd9YRuadBqKVE/IxbIBbzJQ4ULTtABxquk
         udRGdBwY9JUPhTBuckMMGtebxGvGtSIoSSs5uPonFHxDz+oioOeboBZynXlaMP99xWcP
         yWRKKT5O84e5ROIaaMPX99QoTJNNUVbTpRiu1laFo4J9LjvEeTN12krKPYvgCN6nSD4G
         9p65T/wQydQ5dafgnzRcMqogBy/W0z3+n8n22larsaeSjUKtVu2An+WYeb/0D0d25hA0
         vV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718303553; x=1718908353;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GvTiDUv73PJ62h8lVRQjJMyYJyL2LnE71Yt7gAeiVUY=;
        b=hQvqjE6SwgXOb2zZEue6GP9du7zJrWlFEJ7eIoAHaRjOwgOsyEn3rSHOZvNzcr5E0S
         O/ntwPtkUt1wGf5GbTaURT3+KsPvS09dqA1yG4mbYg/UGnTC3KtkmdNSinix+t0mcl1F
         vV7H6MSBmiMFsRgoP9mJSRX/B0jm5B0yIi8pMGIuHYkjk4e15mYZD+t03uiD9SVDMBsH
         4WY+gK4NXxDMbxPb8AA6Fz4C3ClMjQcBacfa3XxJF/LAZkQ3L0an/6CSnQ9jYDb3zZb5
         7wuhLkW7bu0E29zz1Q+uF3HM+fDEQUAHJIWTp63LfRGPY+25En5rogmMp5xu4In+bN+d
         Vwog==
X-Forwarded-Encrypted: i=1; AJvYcCXT6ayKOQSvpRiXC56SwyYzTyWdaH/MaemWhtm7ukyYgFXGiwLAEPHjZy+O4G+vD4LjDZfJ3S+Op36JSPCJr+WFpehvxyftzeR2hZXVMvwf
X-Gm-Message-State: AOJu0Yw34BCSQgX0SobXY6B+dcmW3NhRVi/Wst9DhariQFdNV9aNIq4O
	VHgfGOIYQ+VFp+60r58YQUrgavxCzQrcyJiRPol7zAS5kdVx2EuJnfMqyfIFx8jOpdsaOX4hMvT
	72gsxBA==
X-Google-Smtp-Source: AGHT+IF2KkrgoY57dGWdPw77kXn2zBaD+Uy2G1hRssubmTdIuyA2t/vU2zQn1FmdaIlmDTTWb1i59wcVKt0o
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:96dd:26a6:1493:53c8])
 (user=irogers job=sendgmr) by 2002:a05:6902:2988:b0:dfa:4b20:bdaf with SMTP
 id 3f1490d57ef6-dff15470dfdmr25437276.13.1718303552539; Thu, 13 Jun 2024
 11:32:32 -0700 (PDT)
Date: Thu, 13 Jun 2024 11:32:16 -0700
Message-Id: <20240613183224.3399628-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Subject: [PATCH v2 0/8] Refactor perf python module build
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
X-CRM114-CacheID: sfid-20240613_113236_542568_5F224BBE 
X-CRM114-Status: GOOD (  13.27  )
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

By not building .c files for the python module and for the build of
perf, this should also help build times.

Patch 1 adds '*.a' cleanup to the clean target.

Patches 2 to 6 add static libraries for existing parts of the perf
build.

Patch 7 adds the python build using libraries rather than C source
files.

Patch 8 cleans up the python dependencies and removes the no longer
needed python-ext-sources.

v2: Add '*.a' cleanup to clean target. Add reviewed-by James Clark.

Ian Rogers (8):
  perf build: Add '*.a' to clean targets
  perf ui: Make ui its own library
  perf pmu-events: Make pmu-events a library
  perf test: Make tests its own library
  perf bench: Make bench its own library
  perf util: Make util its own library
  perf python: Switch module to linking libraries from building source
  perf python: Clean up build dependencies

 tools/perf/Build                              |  14 +-
 tools/perf/Makefile.config                    |   5 +
 tools/perf/Makefile.perf                      |  83 +++-
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
 49 files changed, 624 insertions(+), 727 deletions(-)
 delete mode 100644 tools/perf/util/python-ext-sources

-- 
2.45.2.627.g7a2c4fd464-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

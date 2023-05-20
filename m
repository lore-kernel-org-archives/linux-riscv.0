Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869CAC77B75
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 02:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QCM+gII1z0rwh8INYa6cMIXNn1UHEwxYZ0FQ9xTuM+Q=; b=dvmzk+P+KTRzoC
	EvqyVt3wKtHWTb6eLALiSe93vbed7X5Zd/k4RFisT+DbkF/8yNc6k3BOke4SGFM4EvSp3aKKUEuc2
	4M4LZZTuWys53qFU0bey8wQkkqlYpDpLC/N+mCew1lTnzzd/28Oms4Pq4PH1Y6r4Oesh14ZtlUHWY
	Xh7yNuFoGUdYCY3YiueCsRFizMEjx3hPq9zNICFo/iW6TKYfzMwdXZPVW3Zu/Kq4X9C9tRLW8Cr3x
	S+3VOE9UzujpzSld4gdGYk57LitJtzhZ2Ee3PZqmMA3NjDxABGIqfuAkws5y3UpSGS2Z10ZNLN9V7
	f7xDjbRQ55sEq7a55qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0ClA-000V9t-2M;
	Sat, 20 May 2023 02:55:56 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0Cl7-000V83-1p
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 02:55:55 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6436dfa15b3so2879843b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 19:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684551351; x=1687143351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jdSvKOAXL7sdlLkGjTnnuwOA/VbKrzGOIijIH+Tf82k=;
        b=xE8Cw7jDANx3AqisU3EyAG8VrY1HFl5eTc84ib3IPvWx968QS3Aqj/Ee18o/QUglQP
         UszG3vCgAkfxlpn24AYf27GDUNEpDUU405dBM4CRA3h8+FitTO/SBDzvJWZohdd9WMLY
         LlB5bRSYIqKKW99Sh5peZrcLWc7wdoMhBI73p1LoJD0GczzjXTxjHq7j43K/Ucc7J07N
         /T8M7u9SSX2dC1wxkylvNVAaEV21EFnFFUg9hVEp2dPyi2C4gmII2Na3uJhIeOhcvik+
         suQheC48KkYjXO9ht32iBrWY5zMNStb7YZh7p6/TO3FsUr0JII5JTkg8mgpaglK/b+Av
         Hpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684551351; x=1687143351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdSvKOAXL7sdlLkGjTnnuwOA/VbKrzGOIijIH+Tf82k=;
        b=Ael65m7HUGibvK67vmCdo7GkgJZZm22YVxGttXxcWQ8D2NF1UVhOadq/88S6oWhEw5
         dFJFt6wujFXZIywZ/BizehIi20i2mE7YZtgVkn9x4KLXfVK7z/SegMCxjJMP/+UseRbb
         QnsYDmVrZbCycA3tnIP2+uRVILkinMq6z7XKdL0Qv927N/XgyNCM2GeT6lJCx7Re+lLI
         FGso4sWmLe+mrSz3XTX8pu9coheV162KlykbH8Tloey3NOvtOMBjgFu+R/CuU0HyN/pw
         22ALQsPz92KVjr4gq96CfF4OwjvuSt087bDjNC3WuhXiGBW4XPFvUtoGTai8dXAJpLtw
         NKlw==
X-Gm-Message-State: AC+VfDxUNebhycVyOt7yTXCNbEIakoLYbGKDUfAgtqNamEqS7GBGs+o5
	dkRvreptfb9sOS7EtA0UxhLsgw==
X-Google-Smtp-Source: ACHHUZ6RpF/8FxxuZkieXS5msDgwv84HNNcHwRibxyaBrbA0VudSU3lWns+f544SUGcVsGNFXYsn6Q==
X-Received: by 2002:a17:903:18b:b0:1ac:8be5:8787 with SMTP id z11-20020a170903018b00b001ac8be58787mr4699376plg.21.1684551351025;
        Fri, 19 May 2023 19:55:51 -0700 (PDT)
Received: from leoy-yangtze.lan ([156.59.236.113])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902d50600b001a95aef9728sm346100plg.19.2023.05.19.19.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 19:55:50 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Qi Liu <liuqi115@huawei.com>,
	Sandipan Das <sandipan.das@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v1 0/5] perf parse-regs: Refactor arch related functions
Date: Sat, 20 May 2023 10:55:32 +0800
Message-Id: <20230520025537.1811986-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_195553_636755_24F1A292 
X-CRM114-Status: GOOD (  15.46  )
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

The register parsing have two levels: one level is under 'arch' folder,
another level is under 'util' folder.  A good design is 'arch' folder
handles architecture specific operations and provides APIs for upper
layer, on the other hand, 'util' folder should be general and simply
calls APIs to talk to arch layer.

The current code mixes these two layers, e.g. util/perf_regs.h includes
architecture's perf_regs.h, so it implicitly couples with specific
architecture during building time.  Furthermore, util/perf_regs.c
includes all architectures' perf_regs.h, this is easily to cause conflict
due to duplicated definitions from any two different archs.

So this patch series is to refactor arch related functions for register
parsing:

Firstly, it creates a new folder util/perf-regs-arch and uses dedicated
source file for every arch, note, all of these source files will be
built in tool to support cross analysis (e.g. we can run perf on x86
machine for parsing aarch64's perf data file).

Secondly, rather than directly referring macros, we introduce new
functions, these functions are provided by architecture and then will be
invoked by perf common code.  At the end, we can generalize the register
parsing in 'util' folder.

This patch series has been compiled successfully on my Arm64 and x86
machine.


Leo Yan (5):
  perf parse-regs: Refactor arch register parsing functions
  perf parse-regs: Introduce functions arch__reg_{ip|sp}()
  perf parse-regs: Remove unused macros PERF_REG_{IP|SP}
  perf parse-regs: Remove PERF_REGS_{MAX|MASK} from common code
  perf parse-regs: Move out arch specific header from util/perf_regs.h

 tools/perf/arch/arm/include/perf_regs.h       |   3 -
 tools/perf/arch/arm/util/perf_regs.c          |  21 +
 tools/perf/arch/arm/util/unwind-libdw.c       |   1 +
 tools/perf/arch/arm64/include/perf_regs.h     |   3 -
 tools/perf/arch/arm64/util/machine.c          |   1 +
 tools/perf/arch/arm64/util/perf_regs.c        |  16 +
 tools/perf/arch/arm64/util/unwind-libdw.c     |   1 +
 tools/perf/arch/csky/include/perf_regs.h      |   3 -
 tools/perf/arch/csky/util/perf_regs.c         |  21 +
 tools/perf/arch/csky/util/unwind-libdw.c      |   1 +
 tools/perf/arch/mips/include/perf_regs.h      |   2 -
 tools/perf/arch/mips/util/perf_regs.c         |  21 +
 tools/perf/arch/powerpc/include/perf_regs.h   |   3 -
 tools/perf/arch/powerpc/util/perf_regs.c      |  16 +
 tools/perf/arch/powerpc/util/unwind-libdw.c   |   1 +
 tools/perf/arch/riscv/include/perf_regs.h     |   3 -
 tools/perf/arch/riscv/util/perf_regs.c        |  21 +
 tools/perf/arch/riscv/util/unwind-libdw.c     |   1 +
 tools/perf/arch/s390/include/perf_regs.h      |   3 -
 tools/perf/arch/s390/util/perf_regs.c         |  21 +
 tools/perf/arch/s390/util/unwind-libdw.c      |   1 +
 tools/perf/arch/x86/include/perf_regs.h       |   2 -
 tools/perf/arch/x86/util/perf_regs.c          |  16 +
 tools/perf/arch/x86/util/unwind-libdw.c       |   1 +
 tools/perf/util/Build                         |   1 +
 tools/perf/util/evsel.c                       |   2 +-
 tools/perf/util/perf-regs-arch/Build          |   8 +
 .../util/perf-regs-arch/perf_regs_aarch64.c   |  86 +++
 .../perf/util/perf-regs-arch/perf_regs_arm.c  |  50 ++
 .../perf/util/perf-regs-arch/perf_regs_csky.c |  90 +++
 .../perf/util/perf-regs-arch/perf_regs_mips.c |  77 +++
 .../util/perf-regs-arch/perf_regs_powerpc.c   | 135 ++++
 .../util/perf-regs-arch/perf_regs_riscv.c     |  82 +++
 .../perf/util/perf-regs-arch/perf_regs_s390.c |  86 +++
 .../perf/util/perf-regs-arch/perf_regs_x86.c  |  88 +++
 tools/perf/util/perf_regs.c                   | 646 +-----------------
 tools/perf/util/perf_regs.h                   |  18 +-
 tools/perf/util/unwind-libdw.c                |   2 +-
 tools/perf/util/unwind.h                      |   4 +-
 39 files changed, 887 insertions(+), 671 deletions(-)
 create mode 100644 tools/perf/util/perf-regs-arch/Build
 create mode 100644 tools/perf/util/perf-regs-arch/perf_regs_aarch64.c
 create mode 100644 tools/perf/util/perf-regs-arch/perf_regs_arm.c
 create mode 100644 tools/perf/util/perf-regs-arch/perf_regs_csky.c
 create mode 100644 tools/perf/util/perf-regs-arch/perf_regs_mips.c
 create mode 100644 tools/perf/util/perf-regs-arch/perf_regs_powerpc.c
 create mode 100644 tools/perf/util/perf-regs-arch/perf_regs_riscv.c
 create mode 100644 tools/perf/util/perf-regs-arch/perf_regs_s390.c
 create mode 100644 tools/perf/util/perf-regs-arch/perf_regs_x86.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

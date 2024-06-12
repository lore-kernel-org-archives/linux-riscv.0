Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0134DC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 18:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xE4cvoV2hwwDu5MhqmNtwZMpDqdZRm9WbhdYWMuzJeo=; b=DLoLFOMjWSXJMb
	dHwEll6JhBXx/NF+KoOkmS1cFR1/KFJcsMnteN86jQKKn/jdyRnlkSLLWUzzbEYHbcW40XdzO9/yp
	JjHz5a2fBs32W8hfTBcvpqZGkYuNjA5uSO1mA9iKGfn6wyaOVQwTMoEklMRNs+ee3Y8NrEumjvO7S
	h2+p4AeEcHeqKR/NZ7ANNiYCVx0YH2pChGKvdSxeIeo1yx/Vis3haJoM0t4HIqfvx6I+7wq8v6AIy
	2ifNJCu5v9txvYZwEQmwhToVHY5X9plzziOSt9LLQ6DyDSs3dPtYhcf1Cd9VH+Gr/AcDN3wYJGirV
	kJrSdagqjD2zQseV8ZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHSn0-0000000DkGc-0TE1;
	Wed, 12 Jun 2024 18:33:44 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHSmr-0000000Dk8t-1yYK
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 18:33:35 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6306bd937e7so2995287b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 11:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718217209; x=1718822009; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VGJvGIe1CwvnPYERWz1EPbS43EUUz4nerE4PJ3wm8uk=;
        b=DaGUetOk27l5Lb74MjcKiejtI1CKpwVQhGZkt5qg3D0USB3WvQ4NaSAWs+VLh9VL/C
         6AqY4tJUPBiphQ9+2rKeWtwpfLNC9hJFKfiTmRCzLXn6Ns5qT0cNT/SMLxQX0p3St9H8
         k4OOYS+XYZd5CuKbkSeQ0Z27CdKFnXq+IQ++qVJvdF/S3zDhtldQRNb6wj7NrG2h2sEz
         mlpNqWXF07ZLKOhHq9pGhtHEg5SV1m+uW8ZhNFdPMXVv8aN+I2UNsehVc3VZnnAsQRlJ
         991HXiaI/9sysc4Il3wIzRP0P8oXX63er8pUCsiTvhBBoWv84HVL51I/ArRHmpCXx5Ia
         Vg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718217209; x=1718822009;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGJvGIe1CwvnPYERWz1EPbS43EUUz4nerE4PJ3wm8uk=;
        b=vzMRuD1KtKvWE3LYqm06ZEDJ/sYaIcANvHuZcYPd6Rt3HBdPpMBi5lnPCiEDa4qPdw
         31PF2XwOHtKVqhTri9gfBK7XytXnVGkc4uWu+sRaOdlj5txJArH0QCfk1Ip0YMCCZgYa
         tstfdc+vXNNayobG0UFlKiJGCDbukG63Ap5/WtAHbbfJAz9ucp2X1fXjrJ7Qc67Qu9oT
         icG+Ycjflht7dVpCQhVfs2god9l7ivN2wGkeN80vHpqF0M33YRqlgJ21KdKVkEiKDfNB
         ONq7eDwb7+Hh43Ot0wgQYTIygFmXVnPSrNTJ5LzCv0Es1R593uOT1AVeizD8y3fS+pc4
         pfUg==
X-Forwarded-Encrypted: i=1; AJvYcCUkEyG115wjN1NDQrqfGZmZ+ztBbsU1x7oYCPRldqczRGtnp4FYretHJsTCbLJyNEOqRWsTcL+T2kHVEk5wpn+YMt64Unx4c8X8wK3QS3jL
X-Gm-Message-State: AOJu0Yzme+2S29LHIZSUyTEunCHPanYHSbf6Pw5A/9xoexMC6tskHnow
	QghgvZH7+tSP+gK3jcD2pj0mvfaOdD+GuehajNRoOZjvTsJqxdLKFzTxSclubGLFsKS2nbY/wxY
	FyEgfcA==
X-Google-Smtp-Source: AGHT+IGXEDI7uql6mJLDFjO1+Fqeh1AyLA9O3UleyCaiFC6kUY86MVaz89Z/OC+PlyfjDDJprAmYcNiyixd1
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:959d:4302:db0e:d12a])
 (user=irogers job=sendgmr) by 2002:a05:690c:6605:b0:62c:ea0b:a44e with SMTP
 id 00721157ae682-62fb97e690dmr7848007b3.2.1718217209459; Wed, 12 Jun 2024
 11:33:29 -0700 (PDT)
Date: Wed, 12 Jun 2024 11:31:59 -0700
In-Reply-To: <20240612183205.3120248-1-irogers@google.com>
Message-Id: <20240612183205.3120248-2-irogers@google.com>
Mime-Version: 1.0
References: <20240612183205.3120248-1-irogers@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Subject: [PATCH v1 1/7] perf ui: Make ui its own library
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
X-CRM114-CacheID: sfid-20240612_113333_556486_05564703 
X-CRM114-Status: GOOD (  11.93  )
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

Make the ui code its own library. This is done to avoid compiling code
twice, once for the perf tool and once for the perf python module.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Build             |  2 +-
 tools/perf/Makefile.perf     | 10 ++++++++++
 tools/perf/ui/Build          | 18 +++++++++---------
 tools/perf/ui/browsers/Build | 14 +++++++-------
 tools/perf/ui/tui/Build      |  8 ++++----
 5 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/tools/perf/Build b/tools/perf/Build
index b0cb7ad8e6ac..16ed1357202b 100644
--- a/tools/perf/Build
+++ b/tools/perf/Build
@@ -55,7 +55,7 @@ CFLAGS_builtin-report.o	   += -DDOCDIR="BUILD_STR($(srcdir_SQ)/Documentation)"
 
 perf-y += util/
 perf-y += arch/
-perf-y += ui/
+perf-ui-y += ui/
 perf-y += scripts/
 
 gtk-y += ui/gtk/
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 5c35c0d89306..350b65088fc1 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -425,10 +425,14 @@ endif
 
 export PERL_PATH
 
+LIBPERF_UI_IN := $(OUTPUT)perf-ui-in.o
+LIBPERF_UI := $(OUTPUT)libperf-ui.a
+
 PERFLIBS = $(LIBAPI) $(LIBPERF) $(LIBSUBCMD) $(LIBSYMBOL)
 ifdef LIBBPF_STATIC
   PERFLIBS += $(LIBBPF)
 endif
+PERFLIBS += $(LIBPERF_UI)
 
 # We choose to avoid "if .. else if .. else .. endif endif"
 # because maintaining the nesting to match is a pain.  If
@@ -729,6 +733,12 @@ $(PERF_IN): prepare FORCE
 $(PMU_EVENTS_IN): FORCE prepare
 	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=pmu-events obj=pmu-events
 
+$(LIBPERF_UI_IN): FORCE prepare
+	$(Q)$(MAKE) $(build)=perf-ui
+
+$(LIBPERF_UI): $(LIBPERF_UI_IN)
+	$(QUIET_AR)$(RM) $@ && $(AR) rcs $@ $<
+
 $(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN)
 	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) \
 		$(PERF_IN) $(PMU_EVENTS_IN) $(LIBS) -o $@
diff --git a/tools/perf/ui/Build b/tools/perf/ui/Build
index 6b6d7143a37b..d2ecd9290600 100644
--- a/tools/perf/ui/Build
+++ b/tools/perf/ui/Build
@@ -1,12 +1,12 @@
-perf-y += setup.o
-perf-y += helpline.o
-perf-y += progress.o
-perf-y += util.o
-perf-y += hist.o
-perf-y += stdio/hist.o
+perf-ui-y += setup.o
+perf-ui-y += helpline.o
+perf-ui-y += progress.o
+perf-ui-y += util.o
+perf-ui-y += hist.o
+perf-ui-y += stdio/hist.o
 
 CFLAGS_setup.o += -DLIBDIR="BUILD_STR($(LIBDIR))"
 
-perf-$(CONFIG_SLANG) += browser.o
-perf-$(CONFIG_SLANG) += browsers/
-perf-$(CONFIG_SLANG) += tui/
+perf-ui-$(CONFIG_SLANG) += browser.o
+perf-ui-$(CONFIG_SLANG) += browsers/
+perf-ui-$(CONFIG_SLANG) += tui/
diff --git a/tools/perf/ui/browsers/Build b/tools/perf/ui/browsers/Build
index 2608b5da3167..a07489e44765 100644
--- a/tools/perf/ui/browsers/Build
+++ b/tools/perf/ui/browsers/Build
@@ -1,7 +1,7 @@
-perf-y += annotate.o
-perf-y += annotate-data.o
-perf-y += hists.o
-perf-y += map.o
-perf-y += scripts.o
-perf-y += header.o
-perf-y += res_sample.o
+perf-ui-y += annotate.o
+perf-ui-y += annotate-data.o
+perf-ui-y += hists.o
+perf-ui-y += map.o
+perf-ui-y += scripts.o
+perf-ui-y += header.o
+perf-ui-y += res_sample.o
diff --git a/tools/perf/ui/tui/Build b/tools/perf/ui/tui/Build
index f916df33a1a7..2ac058ad1a61 100644
--- a/tools/perf/ui/tui/Build
+++ b/tools/perf/ui/tui/Build
@@ -1,4 +1,4 @@
-perf-y += setup.o
-perf-y += util.o
-perf-y += helpline.o
-perf-y += progress.o
+perf-ui-y += setup.o
+perf-ui-y += util.o
+perf-ui-y += helpline.o
+perf-ui-y += progress.o
-- 
2.45.2.505.gda0bf45e8d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

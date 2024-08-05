Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6E2C3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 19:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FUKElaP/bdXPYBhqzJFUfCKcUdr1LRtZFZi9jz9c8q8=; b=aOdTSi5IgTAbP+
	7k9+uGiMxMk0KcpDZXFu7SMRd9qSYUQ7VGN+2qFvvJyCu6esMyK9NXjK6VGbFFyqgGXa5QFhpgWfh
	pV44rlWLpqCnpfxmzl4zygiIiKxCnCDykvsr9/CBBUSkBIDKZPZ+mU3ViHbMI0+MFrgyvUdX/rDpl
	KENXaWlpUOVWlfYKuu3LLU/yphb+bxdXa8O0FeJWtBr+W/+4eWJJAiikzfTtMUmPn07v4h66F3UvW
	t8D2/NnUI1Hy22iDVu8u6aytOMGbUKOzfZOXv9GmopLoPVyICGPvVDsBtg0lotuddgTnRgkZCuzpS
	CEdbQ09rDMV0eiIln/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3dF-0000000H3Vu-0r7A;
	Mon, 05 Aug 2024 19:44:37 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3dB-0000000H3Uf-2d0Y
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 19:44:35 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-672bea19c63so254950267b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 12:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722887072; x=1723491872; darn=lists.infradead.org;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iJXWmNBT0oaBhJJEJy7hYTlF13tlRK8nid7RNuMSvR8=;
        b=mZLw8nlBahajOLXGbG7njY4ZEMnHOs5KBEuDPXLx+WH3fFIjIjMuwxURAnjqyIHlXU
         7+U/4dAfrePPX5tnJWS1SQ6G464joOY2iul6BmEgj/SfD0HiECncTIgojq3QCe1rvstu
         h/czzCEOEvk1Ppa2NUlooRfNzr7s7LaIDVYKgZui8h7Yj/se3jEbNdqjdLex9+4LrgxV
         cLlmVY9HV18x62DNhUhqlcMbF3EQQll27z++kzfxMZt1aMJFOmZ/IHHm4rzf7Tq8s1ht
         YNP9W7tY/d6jT9BcWpacfDCG8YWXZHQy9uLkHRNpSpgzN2kZoMDzNXS/T2oF3p5BXA0g
         VIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722887072; x=1723491872;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJXWmNBT0oaBhJJEJy7hYTlF13tlRK8nid7RNuMSvR8=;
        b=sWYTH5P1SsD83JnwYfahv9mt2Vu7y6sNxaT1XVM1+2SIjoDSmU+Pf162O62zU0Aw9z
         d7vfbzTuDcG2L/tmPiIY0r5ATEV1VDWUZ3OkczKFd1qSw7iSpb9rMvg2iE0HwERUjpLa
         bP3eRHPBzsyEWsOH+sezofUpomp2ihWgTT6wRmmAyPWaqDOTqpDNo1sA2UQ3HKI9vBOp
         nr+/GrkQV8y5vrq9ZfAenwcDhr7DBOo+2YNgGCynAM+MbL5jo9gMkFfhDqlBSmV9HPQn
         reeTjGnwQq8MSc4HppVymcfuFvtgYm5sc/04cwQXKqavPfRQAoF6FN+MQu1PZSj5y6Aj
         iUZw==
X-Forwarded-Encrypted: i=1; AJvYcCVlh5ZFaCc2R664QlZf9pQ76hHyM/pZPAHbng5FjWM+my99mNIocLMajsASa1Pt/YZW3B6chWuVlh7R5UKl6+eLkZDpYC7kuGmF00m+7/nR
X-Gm-Message-State: AOJu0YyuTpLfUTvYtE42gSGZG2Cw5SJSfwk5Urr2HWlSz3BZUIRO0XWH
	MDsHs/Ti0gpR6FT/es+kGrDUfg2bnnDat4AZUU2oY7oRZ+FxwxADSleqxb3DoSOG+fxBbYxp+Mh
	AzCpfMQ==
X-Google-Smtp-Source: AGHT+IHJSqpiy7EVr1MrO3N5kEdZB8cHENC2V7KXM1QSWWQkT2wB+WeZ6roGFkSYmicbn8frWZfPR7R4IIZC
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:1f65:8dc8:61d0:4b08])
 (user=irogers job=sendgmr) by 2002:a05:690c:288:b0:669:f244:2ae5 with SMTP id
 00721157ae682-689601a6da3mr4014357b3.3.1722887072239; Mon, 05 Aug 2024
 12:44:32 -0700 (PDT)
Date: Mon,  5 Aug 2024 12:44:20 -0700
Message-Id: <20240805194424.597244-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Subject: [PATCH v1 1/5] perf test: Add build test for JEVENTS_ARCH=all
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel.holland@sifive.com>, 
	Charles Ci-Jyun Wu <dminus@andestech.com>, Locus Wei-Han Chen <locus84@andestech.com>, 
	Atish Patra <atishp@rivosinc.com>, Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Jing Zhang <renyu.zj@linux.alibaba.com>, 
	Xu Yang <xu.yang_2@nxp.com>, Sandipan Das <sandipan.das@amd.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Changbin Du <changbin.du@huawei.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	vincent.chen@sifive.com, greentime.hu@sifive.com, 
	Eric Lin <eric.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_124433_687317_E4659802 
X-CRM114-Status: GOOD (  10.69  )
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

Building with JEVENTS_ARCH=all builds all CPU types and allows things
like assertions to check the validity of the input json.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/make | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index a1f8adf85367..8a9edf758f10 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -70,6 +70,7 @@ make_python_perf_so := $(python_perf_so)
 make_debug          := DEBUG=1
 make_nondistro      := BUILD_NONDISTRO=1
 make_extra_tests    := EXTRA_TESTS=1
+make_jevents_all    := JEVENTS_ARCH=all
 make_no_bpf_skel    := BUILD_BPF_SKEL=0
 make_gen_vmlinux_h  := GEN_VMLINUX_H=1
 make_no_libperl     := NO_LIBPERL=1
@@ -140,6 +141,7 @@ run += make_python_perf_so
 run += make_debug
 run += make_nondistro
 run += make_extra_tests
+run += make_jevents_all
 run += make_no_bpf_skel
 run += make_gen_vmlinux_h
 run += make_no_libperl
-- 
2.46.0.rc2.264.g509ed76dc8-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

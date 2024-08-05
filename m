Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253F6C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 19:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPSwOT50HvIOeo9koBHLF2JU/WntXKy/GlY2y9EeaoM=; b=UW1bLlrRTEsQ3t
	GeLRmZWMrEeDY3lOvpfVzr6x5vVRtMn9zQlfigELZg7AfdG+lf+A3kPI2cpxC5Ftv66RrlX/mUFoG
	ioR+nwRART6PJFfE3Wc0Rn9n2O4mxBojH8Vm2rQmUMJbyW1oTNiMrRQewsfhYcodxfh+zLEx7Dtg/
	zQT1awYTDXYc8E0cQcnMwMKcCtUEV1vus0hMngO8kSBwjsm0pUPaKkstLnPzmpstxUkZkw4X+P3Qo
	pWSm4OBFmZFP5dqE3HOqEcY9Qi7SPcEJ39o7jEO/wl8GbStBcRaBPQ5BQnUcG0oFAbyjON5mySJB8
	Ynx64aPWmcqR+4U5GcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3eq-0000000H48x-2QEn;
	Mon, 05 Aug 2024 19:46:16 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3dI-0000000H3Xj-2Wde
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 19:44:42 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e0b3742b309so16577024276.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 12:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722887079; x=1723491879; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lfe4gxEvYKxDxRwW2qESsqEIUodbK6p7qv/mhdEEZFQ=;
        b=th8ctGH/tvOeVkICXtC9iF71jrbKdZfrRCz82faohW+rJ/MIQzfU7f56Jjf+OEcQ4s
         xZcvjtPE8JktgLbeoZaxzqjJ1kYe+KQ/nO5bJAitHAAG9syDuj5gDYdmVHg3K+Spn4o5
         lE0OaYsvBuD7nBZMYhHkCGmd7DVbIFHYf65BZi6atg2J5Q1fiOPlTp8rB4pR8yYzs17/
         rvTPOakUxmRY0TWQR5r/RDXN0X9AKs6aeM2FymMySHrF7g98DmaLTBhIX+av3G89J/LN
         OUO/ufDzUXt4EPCgvgqNkPSx1xRngM6nQu3cbLT9htz41yPpKapX4dMY/J8mt72+B654
         BbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722887079; x=1723491879;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lfe4gxEvYKxDxRwW2qESsqEIUodbK6p7qv/mhdEEZFQ=;
        b=FrWgfeAmBtVnhe4s0w7UTttaPGvKAmnmVy6Rlyfc4Rxr68Smo6T77IR044Sl09g49U
         LNdNtqefcYbKfNHG9N4MOJN9FkTh7LER+kQt7LFcDcLueFiHy3Md/zfJH7UaXCkMfqVp
         jN1vEkpB5mfs/s3BETLfItonfsI2iGR109Ygh8w94T2n7vqw4uyrBaF960c+yIsOvAto
         SNGc1ySywPdRLE79QAKEpS2wpwHvnTcuPXCne6J8z9/3W7bNHTgAv40I/99tFNz8dWOg
         RTZ7xG6DkYMxn2KQU1CtovYLb2GSPRYf+F/xgZx1qivQQimACYYX/F2+vKFM/yltBXTl
         aVNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXmhTuEvXwUvXFUcS17O7kh0iz6vMObVf/CAJoWqxusfLz21ejXSojBUtXErV2WORo59jEENXcDcaJr2zxZ8cfQq5yUJr4MYGOiAwaCCoJ
X-Gm-Message-State: AOJu0Yyi1C0T95LXeK90/MivDyqsfHVZy2vZZ0rwcKsxUPAt5rb9UI5B
	k83Gqmb9TxjD/h5GdowRqRxqUkBX2aGA3ZPVEQK1BdPU1jzDEQ51IQ+hN162K6tFO6SmRA4A1Tf
	vN2qZ7Q==
X-Google-Smtp-Source: AGHT+IGrmti4jOH/kazGkyLVxy/soVqkMo0+E8STQu6tXr+6jrpf9QaL4kxNGpeU3MiUA4lgzpOT4h7CHrFx
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:1f65:8dc8:61d0:4b08])
 (user=irogers job=sendgmr) by 2002:a05:6902:2311:b0:e0b:6bb1:fac with SMTP id
 3f1490d57ef6-e0bde421a34mr35840276.9.1722887079301; Mon, 05 Aug 2024 12:44:39
 -0700 (PDT)
Date: Mon,  5 Aug 2024 12:44:23 -0700
In-Reply-To: <20240805194424.597244-1-irogers@google.com>
Message-Id: <20240805194424.597244-4-irogers@google.com>
Mime-Version: 1.0
References: <20240805194424.597244-1-irogers@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Subject: [PATCH v1 4/5] perf pmu-events: Remove duplicated riscv firmware event
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
X-CRM114-CacheID: sfid-20240805_124440_664097_3F087494 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

FW_SFENCE_VMA_RECEIVED is repeated twice in the file which will break
invariants in perf list as discussed in this thread:
https://lore.kernel.org/linux-perf-users/20240719081651.24853-1-eric.lin@sifive.com/

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json      | 3 ---
 tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json      | 3 ---
 .../perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json | 3 ---
 .../perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json | 3 ---
 4 files changed, 12 deletions(-)

diff --git a/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json b/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
index 9b4a032186a7..5a996fa4b837 100644
--- a/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
+++ b/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
@@ -35,9 +35,6 @@
   {
     "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
   },
-  {
-    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
-  },
   {
     "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
   },
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json b/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
index 9b4a032186a7..5a996fa4b837 100644
--- a/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
+++ b/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
@@ -35,9 +35,6 @@
   {
     "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
   },
-  {
-    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
-  },
   {
     "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
   },
diff --git a/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json b/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json
index 9b4a032186a7..5a996fa4b837 100644
--- a/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json
+++ b/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json
@@ -35,9 +35,6 @@
   {
     "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
   },
-  {
-    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
-  },
   {
     "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
   },
diff --git a/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json b/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json
index 9b4a032186a7..5a996fa4b837 100644
--- a/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json
+++ b/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json
@@ -35,9 +35,6 @@
   {
     "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
   },
-  {
-    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
-  },
   {
     "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
   },
-- 
2.46.0.rc2.264.g509ed76dc8-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

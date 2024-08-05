Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF8FC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 19:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkkuCFOCRS1WUkF/+shlPEuQkWAhB9Yh1KqoBSLHA6k=; b=tHX0UP2sU4R0ao
	dlfotGj5FnYSXSynvo2hdMRIEYOrbhZxX9fjnuKn7LynfyMLVqcKI0uhlPuwFZV3VTP1Kdq23PmDf
	uhHjE+HN6mTAtV9uhy4Qz+nbmZ7qHpe2+b6JqQknz9ejP0L0rcMLokv4ChvJUdLH6BvYdq65dDfpG
	XSnhdnYDSu5EvgXg4Qk1mdAMbX3Eg1PkHC2VCOk7JgvllYhbTOVcFnEBaWf4h+Y7WRZtKwTBz2702
	V2nu/d483zjPC1V+l/Nss1xTcXaBpBFyGY17+Q2UTJMS2wK0jmXb1aw0YTRzBK36Qh3yEHEaKwNFG
	AWLJZXndVeeyqq3C9KRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3fL-0000000H4IS-0S40;
	Mon, 05 Aug 2024 19:46:47 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb3dK-0000000H3Yo-44ix
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 19:44:44 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0bb206570aso12019678276.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 12:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722887081; x=1723491881; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGlP+W+E1rzo+Hc23sUegbyHJcwAQCTmYUNWikKKi2I=;
        b=NqNH6Hw1V3A5ATM7MO3K2Kzrc6MQU6fzH9epH0FNQDJJIwT0ImNfbnXYYGzOZ3coxQ
         zE6Jb4MQ/E/g1AIgFbz7Sy4DIGHoCm9ikJ5I8clm4NI8Y2QzEZ79mA05KqVkvXxWmGe/
         WzVr+Glm9IUM36g3RF0ZRjTIyk26DrJkiD/4cwKUP0FD2MSKzhWJcm6LhU8+GkSuofWF
         Qszor6fg2s7ZBshHuRS4A6QshimtiG+g00QJ5D3VPwn0m3B1g7r5sXRLXUnQGk2v7o42
         uJZRK5OPuvJ8CTvIZfaXPlqnyVKFf6UNQcfL7UPH1u32DpHkuvYFgpjaCR7hWiZwek1K
         sj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722887081; x=1723491881;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NGlP+W+E1rzo+Hc23sUegbyHJcwAQCTmYUNWikKKi2I=;
        b=skxI88F+1cgIS8TGt7QY5ZhmPwNE6Y9FnCyWZZMCFNBNLECKROgoTxDAE11nul2Dpk
         ZGJdTizm0fVAYJrdbP4Byxb/4hrANVnZNFCHUlopaWaMRFFtDYe+QIdcPJd/9c6tpPgn
         8clDnxtr86Wv2S3al3bnd0QJD/al1rVSpb5Boe/I2Ufv0XqtXAXqjE3JP/kVSk0waFeh
         BsnBjnkRs/0KShLyQWP19imUhr8vyXKhtrZoUJQmX9KieeU8ZGYZ1nw4V29A+f2AxyxL
         CiUz2UP2U6GNAV72c/Byk1ZISyrV+O9giqxbgZLyUEwcLx8Mq6iOnctZijINlUHWLxgD
         XMuA==
X-Forwarded-Encrypted: i=1; AJvYcCVtYj7uwVqD0DsiSBc8aTBxHhFflyARfpSkhbLVHXuvVd9o0/E3+tB3R9zBpDsb2CIAOlfvkc0jbQo+UOvDWPaVRr73jNHQCrnlteNgjnn0
X-Gm-Message-State: AOJu0YyxqLl635VtzwaDneDXurxIrKDeVpM7BXo+kzUWIe0LzDd8+FoO
	c1NJXb1rNVBVGV3pdwH91toqtNHys136KD6A2B+V0pdOJ6vDHT4kKR5me4hCUvJmdzOHDK+ppRU
	o9QwN3g==
X-Google-Smtp-Source: AGHT+IE+AeucgMIyAO3Z0FES/ae0JgHq8LbXGHTnVeU3bAh9HD4a6vZXuMVuSJRiYYFv5skWk5Mgq+Gnxr3N
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:1f65:8dc8:61d0:4b08])
 (user=irogers job=sendgmr) by 2002:a05:6902:705:b0:e0e:3f14:c29d with SMTP id
 3f1490d57ef6-e0e3f14cae8mr166124276.4.1722887081584; Mon, 05 Aug 2024
 12:44:41 -0700 (PDT)
Date: Mon,  5 Aug 2024 12:44:24 -0700
In-Reply-To: <20240805194424.597244-1-irogers@google.com>
Message-Id: <20240805194424.597244-5-irogers@google.com>
Mime-Version: 1.0
References: <20240805194424.597244-1-irogers@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Subject: [PATCH v1 5/5] perf jevents.py: Ensure event names aren't duplicated
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
X-CRM114-CacheID: sfid-20240805_124443_120543_B6EC55F9 
X-CRM114-Status: UNSURE (   9.87  )
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

Duplicate event names break invariants in perf list. Assert that an
event name isn't duplicated so that broken json won't build.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/jevents.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index fcf0158438b5..1d96b2204e52 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -503,8 +503,11 @@ def print_pending_events() -> None:
 
   first = True
   last_pmu = None
+  last_name = None
   pmus = set()
   for event in sorted(_pending_events, key=event_cmp_key):
+    if last_pmu and last_pmu == event.pmu:
+      assert event.name != last_name, f"Duplicate event: {last_pmu}/{last_name}/ in {_pending_events_tblname}"
     if event.pmu != last_pmu:
       if not first:
         _args.output_file.write('};\n')
@@ -516,6 +519,7 @@ def print_pending_events() -> None:
       pmus.add((event.pmu, pmu_name))
 
     _args.output_file.write(event.to_c_string(metric=False))
+    last_name = event.name
   _pending_events = []
 
   _args.output_file.write(f"""
-- 
2.46.0.rc2.264.g509ed76dc8-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

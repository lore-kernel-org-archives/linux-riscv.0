Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162BCCFB42C
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 20:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNi5bMIKdFbPrP69eX46DHyf/Lgpl2YY8DVaVhheJOs=; b=ZGUNmFBR20jQ9J
	jiLekusPMxYuk6ifU9NYKbziqGncmpQ7pPg0eqtHSEOWxL8TAVffvNAdzdJMmAgZE0hAEtKKlLo2e
	HqMDW8FxGjaotLYKJ4v95cG3cAuTk5G9qBVsJVykFroWv14JW/46+9xPUt2XdffvMlannfpxQ1VSg
	U+bmMIcOkQMP9lvhF4HtaKA1s2y4xionhZpdGftqrWDFjy6y48s8u3E+5Wtpsr8JGb3v30EjcpTSK
	Bv2L99DoFRTlQw2EMtT+JD7aX3sYH2jTNENWiU2e5goDZjiWO3XvwripuJoWt6DyJ8FirOaEpBaq+
	tyWy7Hd511KRuSTzRhrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxB3H-0000000Fscn-0Eoq;
	Sat, 05 Oct 2024 20:06:55 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAsz-0000000FpyQ-3PLF
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:19 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e2317d1cb7so50293987b3.3
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158176; x=1728762976; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fgt0lsBTAjEFCZBom0GI4KzA9aiVHAzByTiPs2bLNH0=;
        b=ACXr25muAk19rQWEPsKFb5Kd87BmKXAzoSh3omELRe3KfkZDBq9sWmG7NCHOEkztOg
         F8VrEhyCpKZkkSm5ffjkiCDqGHOPST+Skdk0XYhqeTVUXoapO3rkmu6ZXXN9dxqZL/gS
         G4n6T0N625LjwLZZ1ANjqkc2VQp0P2VjB3vCyoz9EYQvnT2m0ZvysEG7K/vF7JXwJdnR
         Vye2rrSHBUFg8paoEClecVqhbYzsqneJexye8zvYBbHQexb/LJnQhnhtQU3mZtQxsH1j
         fa0NVzm/f5irr3aTzlyvfi4p9mg73CMeRkdM7vcPXMyuUy9GRK0WeZd8VIoDq9h74xfg
         YdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158176; x=1728762976;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fgt0lsBTAjEFCZBom0GI4KzA9aiVHAzByTiPs2bLNH0=;
        b=eRt7uGtiQqn3t14L1q3VCtE4UK5a2Ous5Grjw4lzkGV5OH3p9NjUq0vAflCyIXQYmJ
         kJDAsODryR3hPuFVlGADq9i5cBawnSCD2JsZcNztcMAhbV8gDxbJ2o4qF/xH+mR9O6eg
         NPusrI9nPuVNWedkzIL05xAyC+GDchDoYiC5U4N7jWbOwGkSfACM7yPM8i/qMRtTaJ/N
         Jf12IgpPIG/62WbKCtovzTWKYIC74QzGG4/6c26OL7kjhLfTDgMF59cwo0aC1djtqMt9
         LsgvADo/rZqjBrW4pegjlP0kn2aG2WjIKf7NN15v/GgmGSbcjA0f6otS49eIproQmXLw
         J4xA==
X-Forwarded-Encrypted: i=1; AJvYcCUKD350KLE6sBt90JQTKT4SSGirOb6Ilr1mvQPfjf60yFgqUNiD98u+ZSN3IjiNUvo+VLPvn7azUdVKGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuY7i9hy34tFz7CuOLC5ypimIynJUwIaZyLrdbd9ZavMThiW1x
	FBjEn29xSclRCHdn9lbQj3+NNQjEuTjLFP3CejPbMxnIVs1hDyzAmDBHKdSatt+Ov2MnS42XpUc
	lzonEhQ==
X-Google-Smtp-Source: AGHT+IFA6H6s3G571F/veS3qfEggY+9ZaK9DeEUkrcK8nWDGOpnAk500UyqK+1gwSyAo/S2IwW08+pvNJZfj
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a81:ad1a:0:b0:62d:1142:83a5 with SMTP id
 00721157ae682-6e2c72a6f27mr784467b3.8.1728158176294; Sat, 05 Oct 2024
 12:56:16 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:18 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-9-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 08/31] perf probe: Move elfutils support check to libdw check
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Guilherme Amadio <amadio@gentoo.org>, Changbin Du <changbin.du@huawei.com>, 
	Daniel Bristot de Oliveira <bristot@kernel.org>, Daniel Wagner <dwagner@suse.de>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Shenlin Liang <liangshenlin@eswincomputing.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Yury Norov <yury.norov@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_125617_877703_F5A703B4 
X-CRM114-Status: GOOD (  15.91  )
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

The test _ELFUTILS_PREREQ(0, 142) is false for elfutils before
2009-06-13, but that is 15 years ago and very unlikely. Add a test to
test-libdw.c and assume the libdw version is at least 0.142 to
simplify the build logic.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/feature/test-libdw.c | 10 +++++++++-
 tools/perf/util/probe-finder.c   |  2 --
 tools/perf/util/probe-finder.h   |  2 --
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/tools/build/feature/test-libdw.c b/tools/build/feature/test-libdw.c
index 71c6f8e3b0ee..2fb59479ab77 100644
--- a/tools/build/feature/test-libdw.c
+++ b/tools/build/feature/test-libdw.c
@@ -41,8 +41,16 @@ int test_libdw_getcfi(void)
 	return dwarf_getcfi(dwarf) == NULL;
 }
 
+int test_elfutils(void)
+{
+	Dwarf_CFI *cfi = NULL;
+
+	dwarf_cfi_end(cfi);
+	return 0;
+}
+
 int main(void)
 {
 	return test_libdw() + test_libdw_unwind() + test_libdw_getlocations() +
-	       test_libdw_getcfi();
+	       test_libdw_getcfi() + test_elfutils();
 }
diff --git a/tools/perf/util/probe-finder.c b/tools/perf/util/probe-finder.c
index 78f34fa0c391..7434b38596b9 100644
--- a/tools/perf/util/probe-finder.c
+++ b/tools/perf/util/probe-finder.c
@@ -1379,10 +1379,8 @@ int debuginfo__find_trace_events(struct debuginfo *dbg,
 	if (ret >= 0 && tf.pf.skip_empty_arg)
 		ret = fill_empty_trace_arg(pev, tf.tevs, tf.ntevs);
 
-#if _ELFUTILS_PREREQ(0, 142)
 	dwarf_cfi_end(tf.pf.cfi_eh);
 	dwarf_cfi_end(tf.pf.cfi_dbg);
-#endif
 
 	if (ret < 0 || tf.ntevs == 0) {
 		for (i = 0; i < tf.ntevs; i++)
diff --git a/tools/perf/util/probe-finder.h b/tools/perf/util/probe-finder.h
index 3add5ff516e1..f0149d72310c 100644
--- a/tools/perf/util/probe-finder.h
+++ b/tools/perf/util/probe-finder.h
@@ -63,12 +63,10 @@ struct probe_finder {
 	struct intlist		*lcache;	/* Line cache for lazy match */
 
 	/* For variable searching */
-#if _ELFUTILS_PREREQ(0, 142)
 	/* Call Frame Information from .eh_frame */
 	Dwarf_CFI		*cfi_eh;
 	/* Call Frame Information from .debug_frame */
 	Dwarf_CFI		*cfi_dbg;
-#endif
 	Dwarf_Op		*fb_ops;	/* Frame base attribute */
 	unsigned int		machine;	/* Target machine arch */
 	struct perf_probe_arg	*pvar;		/* Current target variable */
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

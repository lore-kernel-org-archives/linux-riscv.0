Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815DDC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 18:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbnRmtLlcR1JQ9PNoqZlplfREVSlnQ0/vOY3Qr8yyQI=; b=JDSFaFVAbDXVrh
	HSS262OYiCaRhyJuX3IpL30TD4SMY5Zf584tcJrz2v9DcEsIIaHkDe86eAgayiTIqN2TVejfOgKwn
	MvnfCHZv/4uy/sSVwjbCJTolBe3MyFzUuUevBJd2cuaLfmdcafLVlhKq/zetxssduw3A5ZPDrhL0i
	J+sWqG+g26I3XNOtNwH+wyLKmlSt1DoLMdEDAdfgXyCBuhCYcbp4uij4wuoTGtq8kXx+zZfmNwiy7
	lHEOJSYrZWAz1EUgMOGjNpzjLePYx8IBi8AHeWiGSDP2EPis52ZFRykglosWqw1JJ+e+uqbXtk5Gp
	qwT+QHKwf0y3VGqFHCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHSnC-0000000DkPV-2zVN;
	Wed, 12 Jun 2024 18:33:54 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHSmt-0000000Dk9o-2Xop
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 18:33:37 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dfa5743655eso291988276.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 11:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718217211; x=1718822011; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5Va0kqcQZC3C24SRwLWszsblcvKrIdDi6DATMgrSLY=;
        b=DN65UwbbK/j0QEtwgcOkqJG1QddF6tNVaEiL+Mi/sMd39owJ070Zl/R7BHfPPmCnMn
         rJXGxBxpxgXpBnXU4tHazUAuBk/Ev2XrzkxvYAdvfs0TkVaXsXPK3Oaclb/z5G5TIk98
         urYf7mUQ/4u5hcvOIBiPK3/3JPeIt2KDKqWiPFs3KqnN1q91Dxyi/nhYkvB08aiW/jcz
         +1KPRRCo466+iKhaPPL9I48dA5Fri6bjzCQIpQ2VfhGztzC5qbAF1bat2LAZpsFT0tsc
         q7EwXl8hHliGWdcWPQiPPvn29Uk8xw4iNt3v65EKbwwxj0wHjaXLozZ3BuXuZIKJMqDX
         l9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718217211; x=1718822011;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5Va0kqcQZC3C24SRwLWszsblcvKrIdDi6DATMgrSLY=;
        b=U5HItgEqydiKac+7MZn8ZSxKgfyYXvMXcQxAWgQlSV047ORKd9UiyCH4lWp+w9JkGM
         S5u1vBDFaUpL7m6Hcu/iVwzuMbVZbmwD2jSL2dWwoef9ig0zal87XShWeoa+XEnwokO6
         r2cY9Y9hHNHOCZrvyJL52wla4LLCjIsFX5kcFJMvG9r1xTa48wh9xvNayp5IxNTzXi3s
         HygwtNLUV3kNFiot9Av9noXBm810KF/P4FFa6AAa5d6zQ1AJSqC+jEot4VFNQvsKMhaa
         K9NVR/L38x4pY6HrEXlYxaN/KQW79Qh9AYPc3dcS46PIrv/ol6zxwthcc0VcJIyyvLTR
         TdEw==
X-Forwarded-Encrypted: i=1; AJvYcCUZJNpe1L/Lkk0qgl6J22PHKY+ec1Rl8EpLklh0eVhD5nuI6pYPOxmialR42YdH5eQ0bPvrc2/snf/D1F23PHUWgQO2JYAzwVlA1z/nvbcJ
X-Gm-Message-State: AOJu0Yxlm9ufOJiCdCU8dhHSmy6YjObeelcucsLyKJBnGFenFEu7YJOI
	2ZPPsxJhN6CZKDOtWHv9RLfjLPI4hLnDgnfEvvWeMwlIYQ/27mDn0mexwM4im7aX8cdb4DhAEFB
	l9B2ffw==
X-Google-Smtp-Source: AGHT+IFUjDHCGs84lPZNlYc/Q/ZUwcsW2T3rfw8kPPl4R6rItL56LbKeXSgs9qEESLh60H5wgpjHWSuTCdXt
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:959d:4302:db0e:d12a])
 (user=irogers job=sendgmr) by 2002:a05:6902:2b8a:b0:dfa:849d:3a59 with SMTP
 id 3f1490d57ef6-dfe68d0a82bmr656820276.13.1718217211451; Wed, 12 Jun 2024
 11:33:31 -0700 (PDT)
Date: Wed, 12 Jun 2024 11:32:00 -0700
In-Reply-To: <20240612183205.3120248-1-irogers@google.com>
Message-Id: <20240612183205.3120248-3-irogers@google.com>
Mime-Version: 1.0
References: <20240612183205.3120248-1-irogers@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Subject: [PATCH v1 2/7] perf pmu-events: Make pmu-events a library
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
X-CRM114-CacheID: sfid-20240612_113335_707731_B629A503 
X-CRM114-Status: GOOD (  10.98  )
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

Make pmu-events into a library so it may be linked against things like
the python module and not built from source.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.perf | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 350b65088fc1..ff1ff1e739b7 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -428,11 +428,14 @@ export PERL_PATH
 LIBPERF_UI_IN := $(OUTPUT)perf-ui-in.o
 LIBPERF_UI := $(OUTPUT)libperf-ui.a
 
+LIBPMU_EVENTS_IN := $(OUTPUT)pmu-events/pmu-events-in.o
+LIBPMU_EVENTS := $(OUTPUT)libpmu-events.a
+
 PERFLIBS = $(LIBAPI) $(LIBPERF) $(LIBSUBCMD) $(LIBSYMBOL)
 ifdef LIBBPF_STATIC
   PERFLIBS += $(LIBBPF)
 endif
-PERFLIBS += $(LIBPERF_UI)
+PERFLIBS += $(LIBPERF_UI) $(LIBPMU_EVENTS)
 
 # We choose to avoid "if .. else if .. else .. endif endif"
 # because maintaining the nesting to match is a pain.  If
@@ -721,8 +724,6 @@ strip: $(PROGRAMS) $(OUTPUT)perf
 	$(STRIP) $(STRIP_OPTS) $(PROGRAMS) $(OUTPUT)perf
 
 PERF_IN := $(OUTPUT)perf-in.o
-
-PMU_EVENTS_IN := $(OUTPUT)pmu-events/pmu-events-in.o
 export NO_JEVENTS
 
 build := -f $(srctree)/tools/build/Makefile.build dir=. obj
@@ -730,18 +731,21 @@ build := -f $(srctree)/tools/build/Makefile.build dir=. obj
 $(PERF_IN): prepare FORCE
 	$(Q)$(MAKE) $(build)=perf
 
-$(PMU_EVENTS_IN): FORCE prepare
+$(LIBPMU_EVENTS_IN): FORCE prepare
 	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=pmu-events obj=pmu-events
 
+$(LIBPMU_EVENTS): $(LIBPMU_EVENTS_IN)
+	$(QUIET_AR)$(RM) $@ && $(AR) rcs $@ $<
+
 $(LIBPERF_UI_IN): FORCE prepare
 	$(Q)$(MAKE) $(build)=perf-ui
 
 $(LIBPERF_UI): $(LIBPERF_UI_IN)
 	$(QUIET_AR)$(RM) $@ && $(AR) rcs $@ $<
 
-$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN)
+$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN)
 	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) \
-		$(PERF_IN) $(PMU_EVENTS_IN) $(LIBS) -o $@
+		$(PERF_IN) $(LIBS) -o $@
 
 $(GTK_IN): FORCE prepare
 	$(Q)$(MAKE) $(build)=gtk
-- 
2.45.2.505.gda0bf45e8d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

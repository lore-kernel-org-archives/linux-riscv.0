Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773EBC27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 23:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UF7kNtTb5+rRsKOi10UfljbLURklM9ibV6c1EsVvfsc=; b=PkdBUOMKnqPmCZ
	+zUXulXqMDPA7/FHtlAv3XNqCmWkcZ+U+2Lrx9KOmlRNhdBTSbJPyt0Eu0FRAtKW7FrOeVCLTe4bs
	6JynlHZxAB3J7xaxv/Fa2ZsN6rrnbiyhpOdYQMPpGq23Y6lIbCbXmBYDajI1EhQN76W+Yu1duZmbs
	9jcd7Pnh15BohLNNW7UZSGQkv7RySJjZ7fWKUkPBFRN4gOAMDUveyRnSGFL/LcP++boI/kW0DE8ey
	o0N8prlIoG2rcFIr8n9/moLAtsd9fcHl3AYZXbi8wfxFgkT3/TLTbT1UEGExMNYhKg6DSw3zw5ExJ
	afjRDIyo8dWo3DX2oR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHtvF-00000000llP-1pEO;
	Thu, 13 Jun 2024 23:32:01 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHtv4-00000000lbF-0XxK
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 23:31:51 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dfdfe3d9fc8so2906124276.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 16:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718321506; x=1718926306; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CxA/uxqQnuEGimdVVLwjMbl2Ju2kVgaw0AA0enSCOv4=;
        b=Y/UAA4kBEM8aMQtbUtNTkoOoM7NfWpobHRs5g+yxmmfKbRlMnvaok+dudcnGsRHFwC
         L3vyK8iZ5gc3LFW0aoSVjMmQdHfT99zr/DD3VxyWE1dvorZ6ek4bLbvmMjmmA5M2GkFU
         flZgKAtbSRyDOo5rULKMNLg3KS7FU5aLZj0JW1WrU3WkLBkeMJ3POBPvaMDQ6RnMQbyI
         x6GkfE0fbJz8T7bql8Pd4oLh+S1Gwr2J+zfzpmX0HslVBn0Z3T3fzJ4Egi4MkwhSz3mO
         UDKOWeB/OhK+Aa2mDJ10zYsG2OTHUSVpdAWIG4eWqP7gmFZ0AiYuo7Ouj/eKryaC5Ss/
         SP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718321506; x=1718926306;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxA/uxqQnuEGimdVVLwjMbl2Ju2kVgaw0AA0enSCOv4=;
        b=mrnwD2xwMaHxKi9cPr1nhWD2ZGbc6v696BPofBQFEtADHjdp8fc7EYkLc1DgsaPIRc
         dZh/mCSrxuvnXjaG7b+JhJ1Fm6nZlr3RahTX4fuQf1nlAErc4wpVwxgJCLwyDRUZ7jm6
         2KxQpLSJN9lZEw/v2AYJCoRkABy9zIucSK9ZWVzt+SZzVcGhhgpbeiy2FgMM4jcDA5So
         l6eJySty0PpyE2uLbV+XYTbqrel+99u3J/B03gw7v0S26p22YwS96yHTILe1xJ2KbINs
         CCiulqycFUcHspSGb1sJEgyOEPwwwGoQomlTfH0tokcLftd83RaccY6kzPmyn24xt3Ef
         WhNg==
X-Forwarded-Encrypted: i=1; AJvYcCVBQtBGt98qcsKB+8VZNJ51SrsLv2cXq3Wjtq0kX7MMv38y9c7WkaKyRXM7J9FZzHIsVjrtwNF+WnWYznCqnQ00W1oifOwn5bzieh3bHkAC
X-Gm-Message-State: AOJu0YzdWe+ec8lR4M/VrWNBBtjiq2euagd6FpcQ/IxOrrrWc6JMO8vp
	Lti/fwzXYIf66w7O9t0oaY+11SYUV9IBFrvOIxMNbEnqcxtVdB93dtsqOCnecy9QDyOySzKIXXZ
	ZaaiCcw==
X-Google-Smtp-Source: AGHT+IG0QxtJ2klO/2YXDc0iBujvmja2VH2aEZOp3HvulIB/G5oRb8rNfXRnL0OTcbZ0KYmVBuD4OITIspBw
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:96dd:26a6:1493:53c8])
 (user=irogers job=sendgmr) by 2002:a05:6902:1109:b0:df7:9609:4cd8 with SMTP
 id 3f1490d57ef6-dff150d9a54mr275213276.0.1718321506207; Thu, 13 Jun 2024
 16:31:46 -0700 (PDT)
Date: Thu, 13 Jun 2024 16:31:17 -0700
In-Reply-To: <20240613233122.3564730-1-irogers@google.com>
Message-Id: <20240613233122.3564730-4-irogers@google.com>
Mime-Version: 1.0
References: <20240613233122.3564730-1-irogers@google.com>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Subject: [PATCH v3 3/8] perf pmu-events: Make pmu-events a library
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
X-CRM114-CacheID: sfid-20240613_163150_225490_7DF4C89F 
X-CRM114-Status: GOOD (  10.86  )
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
Reviewed-by: James Clark <james.clark@arm.com>
---
 tools/perf/Makefile.perf | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index c5a027381c55..9640c6ae1837 100644
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
2.45.2.627.g7a2c4fd464-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

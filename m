Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B826AC27C75
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 23:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/kpGWnzSj08M0eS2UZ+9iezKaMPSRzfgemhRYU3g18=; b=fTn/mFxeRDbNMc
	HnhkwqiO2bTIu3H1wVy09iqmptYWAPMIxC5a8lRO2fu6jYEUdIMQ27MahBQR3Gn/Yv/mgSvRVHckv
	2nPQTsjdpZag5A/qiIg8yp+QoJmj6L4yrgAhCP52lj5tAXyyLUPiVDNNy893l7Vne1qei3R65FQD2
	Zzeza6CqrYnvYbqUB5c8EOC+z5eA/26CBtcQUiRZCCYWM/XmRfFjbudCm5+v8tSaqClV4CiWb5/3K
	44qhJ6jPCtlDfTocIDhKnTrsSeMwlPQ7pQMnADRCk84t6GIbiq1xVto4ie2fDHJTUIfnChxeKhLDW
	yvwz80U4XIS7MvosxGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHtv2-00000000lci-46TA;
	Thu, 13 Jun 2024 23:31:48 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHtuz-00000000lYq-0WLb
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 23:31:46 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-632591a256bso2762637b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 16:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718321501; x=1718926301; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbSOB/P6de3ygMIG7fdBTW+eS92Yyh1ZhXc/HewO9bA=;
        b=cK/NkdwLV+PaXHb4Fm7KmtDGf0dYe3gQeM+ha0a/b4AWXS++LQBn8ZmuSx0ZlIHxE6
         QMH65Bvpu63d57YvMU06Fe54ZfEW9fRKCzlZeqgJbP5JITtwGxFJGxnSBBvV7DEYgyaL
         rLnDIwGSLVTqnbBMdciy01aWjxSdYvI6UDs/fWgQlVJZL2AFSIdQpMNAYGUXvoBImg7e
         gGtFE1sHS6rDwA2zioTuIrdaUsJnn3NanJc/BzqmqBaNp9mSBAibbJmB5pLwNz6MnMqG
         P5++gQF0T6kJW9NfaV77t2Ap6y+xiRNwD+Y1G7hbaaHKn5C4tuq1CP2iJiUXKCWVO4br
         Gedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718321501; x=1718926301;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbSOB/P6de3ygMIG7fdBTW+eS92Yyh1ZhXc/HewO9bA=;
        b=dTbpG6mQbNYCFm+b6gqEzaD9x6j68/on4/3ULHjcPIMWKrvLEbwsQ2v4RTiemcbcgr
         7aQ2caObacbzubobZEECmevMr17kjiWyA7OOO6tsQpHnPSrkbtrY4GX7xJwS63fV0JMH
         S9PXqOz9EH92cBreaFf9zqUWRr8/IzbOnbntyUbU/C4Xyz179Cqx1GW2gK9F9uBxZ5Ta
         sieDdzJZa8LYwd0O4HQKIuqEJ+GP0NggyIYhPwST7DrlzZ/idBIRg91YT7/KlnZLqg2T
         JN35JcDF80et7Ix44hOnegFpAXFmtprrFJ+tDjYNPJCd3Sq0DWTO73nluniiti8uItIh
         gz8g==
X-Forwarded-Encrypted: i=1; AJvYcCUmR2VT3TY3DBft1UExgrwzAgLrf/5KR+8bGdZpk2mlF4I3rVtvEHqnEzEmjEcG8Q+C+lfvkpNnTLtadyhArE1uBtWoYxXPmL/CniooUSIg
X-Gm-Message-State: AOJu0YzZ0nNv2NZ44dmu+ctbPlWVzD0/Jj9V09w8BvdTjKbNwXxQcJ73
	UQ2A/bw/P8+5MCFPnSJk+pCid3cJjxXLRhTx8SkET+uuasdZ+MPrY8S3MqX/0duPNTh6BG5WDrJ
	c1A/2tg==
X-Google-Smtp-Source: AGHT+IHE5wM91COFyENsSJs6TdkrEyube8x5jVXFZVcONmu94l5YziFn9V2oVKc/3BzWS0BiAYO2r5J5dtvN
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:96dd:26a6:1493:53c8])
 (user=irogers job=sendgmr) by 2002:a05:690c:d1b:b0:61d:ece5:2bf with SMTP id
 00721157ae682-6322265e839mr3417667b3.4.1718321500762; Thu, 13 Jun 2024
 16:31:40 -0700 (PDT)
Date: Thu, 13 Jun 2024 16:31:15 -0700
In-Reply-To: <20240613233122.3564730-1-irogers@google.com>
Message-Id: <20240613233122.3564730-2-irogers@google.com>
Mime-Version: 1.0
References: <20240613233122.3564730-1-irogers@google.com>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Subject: [PATCH v3 1/8] perf build: Add '*.a' to clean targets
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
X-CRM114-CacheID: sfid-20240613_163145_229220_1FF118CD 
X-CRM114-Status: GOOD (  10.19  )
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

Fix some excessively long lines by deploying '\'.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.perf | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 5c35c0d89306..acc41a6717db 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -1201,12 +1201,19 @@ endif # CONFIG_PERF_BPF_SKEL
 bpf-skel-clean:
 	$(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS) $(SKEL_OUT)/vmlinux.h
 
-clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(LIBPERF)-clean arm64-sysreg-defs-clean fixdep-clean python-clean bpf-skel-clean tests-coresight-targets-clean
-	$(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
-	$(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete -o -name '*.shellcheck_log' -delete
+clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(LIBPERF)-clean \
+		arm64-sysreg-defs-clean fixdep-clean python-clean bpf-skel-clean \
+		tests-coresight-targets-clean
+	$(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive \
+		$(OUTPUT)perf-iostat $(LANG_BINDINGS)
+	$(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '*.a' -delete -o \
+		-name '\.*.cmd' -delete -o -name '\.*.d' -delete -o -name '*.shellcheck_log' -delete
 	$(Q)$(RM) $(OUTPUT).config-detected
-	$(call QUIET_CLEAN, core-progs) $(RM) $(ALL_PROGRAMS) perf perf-read-vdso32 perf-read-vdsox32 $(OUTPUT)$(LIBJVMTI).so
-	$(call QUIET_CLEAN, core-gen)   $(RM)  *.spec *.pyc *.pyo */*.pyc */*.pyo $(OUTPUT)common-cmds.h TAGS tags cscope* $(OUTPUT)PERF-VERSION-FILE $(OUTPUT)FEATURE-DUMP $(OUTPUT)util/*-bison* $(OUTPUT)util/*-flex* \
+	$(call QUIET_CLEAN, core-progs) $(RM) $(ALL_PROGRAMS) perf perf-read-vdso32 \
+		perf-read-vdsox32 $(OUTPUT)$(LIBJVMTI).so
+	$(call QUIET_CLEAN, core-gen)   $(RM)  *.spec *.pyc *.pyo */*.pyc */*.pyo \
+		$(OUTPUT)common-cmds.h TAGS tags cscope* $(OUTPUT)PERF-VERSION-FILE \
+		$(OUTPUT)FEATURE-DUMP $(OUTPUT)util/*-bison* $(OUTPUT)util/*-flex* \
 		$(OUTPUT)util/intel-pt-decoder/inat-tables.c \
 		$(OUTPUT)tests/llvm-src-{base,kbuild,prologue,relocation}.c \
 		$(OUTPUT)pmu-events/pmu-events.c \
-- 
2.45.2.627.g7a2c4fd464-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

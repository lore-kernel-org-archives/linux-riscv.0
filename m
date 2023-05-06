Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4980DC77B7D
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 02:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oKGHvcoJHf3WJtFz+vmKkfjpi+QHcx7doAlWcKh3QpM=; b=kVkKyd7mMEG8z3
	MEK1fv08EbUpXtcGdPBKd2wEfvDsCWwI2NDKNHAhOHfY3qxHNIZafaJuQWmzMyogiPhmS8oSbe+Sr
	+cqrVZSmYx8Gqfp0lKI+z3mSCp+gye8G2znhrC0/Yfv7U9qK7Z3YTHEB1ti4jKmCrwdqh7O5FmDNv
	rajw42aNak9BjaEJjDQaf6Xd8Ph+1UAHFEkq4h9SNEGoA8AlO4hzFIYsFHmvLddExpCZfzzXV0PMr
	r/2FwPtNNOrpIBVsAAGO7Rft7ye2iJBIgaPnvkk6S4opQCm0ggeZnmQvf1HwiAw5YoIvY+a0WVnsd
	32RNNKA43F25HwEMMUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv7S4-00CKVA-0o;
	Sat, 06 May 2023 02:15:12 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pv7S1-00CKUQ-2S
	for linux-riscv@lists.infradead.org;
	Sat, 06 May 2023 02:15:11 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-b9a75194eebso3041326276.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 May 2023 19:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683339305; x=1685931305;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pJf4bwuwk+xW5YFYNv2ihAkRZ7CiJDxHsIhFi1q/46E=;
        b=Ti63042aDcnZkRbwB60td25AhQmPK47NkWC4qIEwqnfJdGnj0R04pdJ2Hmgfnm0P9x
         pnr53iBTBqHhMz2a1cjdh1lJqGEd5NO4jdoPES1QWLOzDszwUDRuyE4gKQQMKrzAdbQT
         GWNLK3lHqXnKx1gm7p/uEzOZnR6dbIOScU4gUUyzFaULBVNQLD01x1ht1EjMgDk3zer0
         CrIFaKj0/OeOYRjv2KXodKeX6aLlthx7d9iJuEd8xAbtDgONnObWblpk0L8UPOopVPgi
         tU5oRk2o8taGUXAsOx5REh74Eus7puNDh4VdSRLZvmaZKJKRfnaUz0JG52z6+kCQYJVk
         g+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683339305; x=1685931305;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJf4bwuwk+xW5YFYNv2ihAkRZ7CiJDxHsIhFi1q/46E=;
        b=B1h+H7PdpLPn2siAPzBEJeIbAGdKTL+hLZYRgK06uz/HiAN11pdyL1Yd1A8PdPflmJ
         xROAbeT5ugnb3S+9bq+NwJdioplMuS+sO8M9Ekwpl9NV9iMHEQk2j+y+5u6Ke9QvT6JS
         ZhKcoyjl8i6mK6+a7S7luWcW2kLBIZl/uU4Lxe5uleUlSni4EXptEZHNt589HTm+exov
         CTi8JU53q9cxlY4BKSscReAvDNk69Rd8sED9pd0mmYtEGlxODxFxrsrBY3k5P6B8xh2H
         n3wakXx93zZezlFFWnUswEnx7FBPXK8+P2oo8rYgspayScct5ptRBUOV8lbk6LHIAuC8
         HRpA==
X-Gm-Message-State: AC+VfDwh1iG1sEwvO9IvHWUm25vqWh/p5rMIA6LwxzvXCc4RHnB3bnDQ
	uKXhiRFd9CfhwXCpRyjfX5ez5soJWX+O
X-Google-Smtp-Source: ACHHUZ7fCEmGVZcSm742KT0Xx/0ZWwbb5eOxYd/8GGeWHCsrV/oXhwWrE0VcUJkh0NBstgJVs6bMKgnnycng
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:4715:8e64:29b7:6c4])
 (user=irogers job=sendgmr) by 2002:a81:e206:0:b0:55a:3532:2fd5 with SMTP id
 p6-20020a81e206000000b0055a35322fd5mr2078640ywl.8.1683339305504; Fri, 05 May
 2023 19:15:05 -0700 (PDT)
Date: Fri,  5 May 2023 19:14:50 -0700
Message-Id: <20230506021450.3499232-1-irogers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Subject: [PATCH v1] perf build: Add system include paths to BPF builds
From: Ian Rogers <irogers@google.com>
To: Song Liu <songliubraving@meta.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Andrii Nakryiko <andrii.nakryiko@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_191509_840120_24D5BA93 
X-CRM114-Status: GOOD (  10.47  )
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

There are insufficient headers in tools/include to satisfy building
BPF programs and their header dependencies. Add the system include
paths from the non-BPF clang compile so that these headers can be
found.

This code was taken from:
tools/testing/selftests/bpf/Makefile

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.perf | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 61c33d100b2b..37befdfa8ac8 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -1057,7 +1057,25 @@ $(SKEL_TMP_OUT) $(LIBAPI_OUTPUT) $(LIBBPF_OUTPUT) $(LIBPERF_OUTPUT) $(LIBSUBCMD_
 
 ifndef NO_BPF_SKEL
 BPFTOOL := $(SKEL_TMP_OUT)/bootstrap/bpftool
-BPF_INCLUDE := -I$(SKEL_TMP_OUT)/.. -I$(LIBBPF_INCLUDE)
+
+# Get Clang's default includes on this system, as opposed to those seen by
+# '-target bpf'. This fixes "missing" files on some architectures/distros,
+# such as asm/byteorder.h, asm/socket.h, asm/sockios.h, sys/cdefs.h etc.
+#
+# Use '-idirafter': Don't interfere with include mechanics except where the
+# build would have failed anyways.
+define get_sys_includes
+$(shell $(1) $(2) -v -E - </dev/null 2>&1 \
+	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }') \
+$(shell $(1) $(2) -dM -E - </dev/null | grep '__riscv_xlen ' | awk '{printf("-D__riscv_xlen=%d -D__BITS_PER_LONG=%d", $$3, $$3)}')
+endef
+
+ifneq ($(CROSS_COMPILE),)
+CLANG_TARGET_ARCH = --target=$(notdir $(CROSS_COMPILE:%-=%))
+endif
+
+CLANG_SYS_INCLUDES = $(call get_sys_includes,$(CLANG),$(CLANG_TARGET_ARCH))
+BPF_INCLUDE := -I$(SKEL_TMP_OUT)/.. -I$(LIBBPF_INCLUDE) $(CLANG_SYS_INCLUDES)
 
 $(BPFTOOL): | $(SKEL_TMP_OUT)
 	$(Q)CFLAGS= $(MAKE) -C ../bpf/bpftool \
-- 
2.40.1.521.gf1e218fcd8-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

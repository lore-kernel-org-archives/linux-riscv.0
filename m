Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DC4C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 18:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsiHCm1m0OnvjGavU0THMqkTBoZBfXWOCrymVjpCs9Y=; b=TpWYANz8vko35R
	0bO+Nt9P02XD8cmGdsfMr4xKpGybcnUcWIAoprZMFSgbw89M5BFPeURHXmRbfH75cyM2uUxwyb3G4
	gfzPfMBZLTvZe6p5FXiJ9+bZynIPPmXKe3G6CKMD2H2LPlyx3NMlGyP7MPt5VpnQa8mFgNF0RgBee
	yIcrEY4roZ1acreLvi76gxOLTE/ulbRKynJyoTESg0H7+zktOwvKM9YkmD2/9YqOdpPITjJdKNPVV
	Kpd/3e5IolyXEiCFE5SPL0+Lljh3pFup1btLclDnlg6BXw81aaSg02nOkWZpp+Vclv6fVA+iHb8j8
	yL5LD4FXqcYOoVpGxpwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHSnK-0000000DkVH-2d9T;
	Wed, 12 Jun 2024 18:34:02 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHSn4-0000000DkGu-44go
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 18:33:50 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-627dd6a56caso2717017b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 11:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718217223; x=1718822023; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcvOQ2AYZ7WMCcNf48y0Z4WIFFdDS7XM+Tp2DrQsPX4=;
        b=02UId2WVF/BTnoGtcbM5Pbcvx29n2tqp9lNEyx7defiZYg+hbQaQhmiDW3wuUrMld6
         76X2uIJDuVk+moxxfBCEKshrcbac8OGmYxFjtNsXBtECgNzqGMai2zsV16uBMNuPInOm
         nlCjm4ag5lu1q91ONlfsguBlM8Q78eqboMMiuYDVeRXlfkN+lhCi40IFXiubX3y/gBAw
         ei/qG1LL8GSH9Shf0HNg1eXPlbCG4fQ9887LZAR658nJ7vtk2pFYrkmczXjw5YA2qJoP
         31Gq4MQ3s7l2+ZQaSutm2KsQaN0ZlE3fjTZidXmkZfiwY5ttW0WwIsJQ5JeZvfJlGloQ
         uFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718217223; x=1718822023;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcvOQ2AYZ7WMCcNf48y0Z4WIFFdDS7XM+Tp2DrQsPX4=;
        b=vO2phu5qBLxU4eSZiQ14ID/y+zX3D7XDbwhGyoV/iAYFVudwTDhLzs6WqsAWlmjp/E
         zPDIQvMmN1e+ya5CjdNi11Cos0I7X1GyzNFoLHfS1GWq5FEdAjhRvdnLEHFx9s9rzvwt
         Ftr56Nfl4+Gn2kcLPtvs/gENufkgSqfG2o5WLV0U9zSPZYrt7buF7Vr+UiWlarL4Wn4b
         WYahJQx6xpsKYYhnDZUqCr1wsRbrxJVz9DWbV6PwVeGBnJKQ42IpEgSB4Qw+97PyUZGk
         4EMOZIS5g8zXhLi/q6YiE0pk6UCs+k79Rk9WQ1RFe7q0fURj1eDJcCcqS4QbOJa9Mvyh
         xk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1sXXVUD8xBdHCp8J+8loho3xMKYHpOX02jgtXeEKSnaM9lODyS/fHbGoojoXzomYUUmze8USZIcjCi9qrrxWGnnThttDIiyY0JlL8pkBy
X-Gm-Message-State: AOJu0YzAVBB3+Oy4xPBrBuxkMaI0SSI2YEVT02PhOsRyjjou5pQUfaQA
	4xF4Cldf6vO3kCyG+pmFHGXb3+WKMYuGcwx/WN4vc1FcgFi2l61I8D7yZOFUdFpRXqfPKw92D3I
	uNx7C0w==
X-Google-Smtp-Source: AGHT+IEdZtuxFCkd4xeaZMVA0551v1r2/AOz8THV3+MN9PWe9shK7np3c1wiSt7RmdoT82E3zDdATSpfd0ve
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:959d:4302:db0e:d12a])
 (user=irogers job=sendgmr) by 2002:a05:690c:88:b0:62f:22cd:7082 with SMTP id
 00721157ae682-62fbb7f3b47mr6200647b3.5.1718217222801; Wed, 12 Jun 2024
 11:33:42 -0700 (PDT)
Date: Wed, 12 Jun 2024 11:32:05 -0700
In-Reply-To: <20240612183205.3120248-1-irogers@google.com>
Message-Id: <20240612183205.3120248-8-irogers@google.com>
Mime-Version: 1.0
References: <20240612183205.3120248-1-irogers@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Subject: [PATCH v1 7/7] perf python: Clean up build dependencies
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
X-CRM114-CacheID: sfid-20240612_113347_199322_1194E577 
X-CRM114-Status: GOOD (  14.32  )
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

The python build now depends on libraries and doesn't use
python-ext-sources except for the util/python.c dependency. Switch to
just directly depending on that file and util/setup.py. This allows
the removal of python-ext-sources.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.perf           | 10 +-----
 tools/perf/util/python-ext-sources | 53 ------------------------------
 2 files changed, 1 insertion(+), 62 deletions(-)
 delete mode 100644 tools/perf/util/python-ext-sources

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 6f66d3a7ffb2..918b851b2e0d 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -380,14 +380,6 @@ python-clean := $(call QUIET_CLEAN, python) $(RM) -r $(PYTHON_EXTBUILD) $(OUTPUT
 # Use the detected configuration
 -include $(OUTPUT).config-detected
 
-ifeq ($(CONFIG_LIBTRACEEVENT),y)
-  PYTHON_EXT_SRCS := $(shell grep -v ^\# util/python-ext-sources)
-else
-  PYTHON_EXT_SRCS := $(shell grep -v ^\#\\\|util/trace-event.c\\\|util/trace-event-parse.c util/python-ext-sources)
-endif
-
-PYTHON_EXT_DEPS := util/python-ext-sources util/setup.py $(LIBAPI)
-
 SCRIPTS = $(patsubst %.sh,%,$(SCRIPT_SH))
 
 PROGRAMS += $(OUTPUT)perf
@@ -715,7 +707,7 @@ all: shell_compatibility_test $(ALL_PROGRAMS) $(LANG_BINDINGS) $(OTHER_PROGRAMS)
 # Create python binding output directory if not already present
 $(shell [ -d '$(OUTPUT)python' ] || mkdir -p '$(OUTPUT)python')
 
-$(OUTPUT)python/perf$(PYTHON_EXTENSION_SUFFIX): $(PYTHON_EXT_SRCS) $(PYTHON_EXT_DEPS) $(PERFLIBS)
+$(OUTPUT)python/perf$(PYTHON_EXTENSION_SUFFIX): util/python.c util/setup.py $(PERFLIBS)
 	$(QUIET_GEN)LDSHARED="$(CC) -pthread -shared" \
         CFLAGS='$(CFLAGS)' LDFLAGS='$(LDFLAGS) $(LIBS)' \
 	  $(PYTHON_WORD) util/setup.py \
diff --git a/tools/perf/util/python-ext-sources b/tools/perf/util/python-ext-sources
deleted file mode 100644
index 1bec945f4838..000000000000
--- a/tools/perf/util/python-ext-sources
+++ /dev/null
@@ -1,53 +0,0 @@
-#
-# List of files needed by perf python extension
-#
-# Each source file must be placed on its own line so that it can be
-# processed by Makefile and util/setup.py accordingly.
-#
-
-util/python.c
-../lib/ctype.c
-util/cap.c
-util/evlist.c
-util/evsel.c
-util/evsel_fprintf.c
-util/perf_event_attr_fprintf.c
-util/cpumap.c
-util/memswap.c
-util/mmap.c
-util/namespaces.c
-../lib/bitmap.c
-../lib/find_bit.c
-../lib/list_sort.c
-../lib/hweight.c
-../lib/string.c
-../lib/vsprintf.c
-util/thread_map.c
-util/util.c
-util/cgroup.c
-util/parse-branch-options.c
-util/rblist.c
-util/counts.c
-util/print_binary.c
-util/strlist.c
-util/trace-event.c
-util/trace-event-parse.c
-../lib/rbtree.c
-util/string.c
-util/symbol_fprintf.c
-util/units.c
-util/affinity.c
-util/rwsem.c
-util/hashmap.c
-util/perf_regs.c
-util/fncache.c
-util/rlimit.c
-util/perf-regs-arch/perf_regs_aarch64.c
-util/perf-regs-arch/perf_regs_arm.c
-util/perf-regs-arch/perf_regs_csky.c
-util/perf-regs-arch/perf_regs_loongarch.c
-util/perf-regs-arch/perf_regs_mips.c
-util/perf-regs-arch/perf_regs_powerpc.c
-util/perf-regs-arch/perf_regs_riscv.c
-util/perf-regs-arch/perf_regs_s390.c
-util/perf-regs-arch/perf_regs_x86.c
-- 
2.45.2.505.gda0bf45e8d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86CFD2F7D8
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 00:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKsi+PISDBND4rHa/ud3P31pzkyg6ugS6F/WCXyhrlk=; b=bW6RG2ik0VXsD+
	ugaScED3gs7rpvI1xTR77EVp8saFNgI5iZ1y20IkNpfuB+w6k6AKdHOFRnjKrzptbq2dqahH5acV+
	fIb2sR8E3I2WUDomAPIMr8Ydv4n1S9P4SfowfnlDJX8uUVxlDalqoHbWiNTmzT9ukCaISU1bV2utR
	MpyyyMMw2CW75TkgLFBQoww550GnZNMjEzSnTIxPT+QbrXU0QiCb09/s0sxibxMx0tZbktOxFMpYl
	rV81jzEjSrAipq+4jsl+/DM0+Ic2n6g5DgLbE8uMdIOLH/rF6h42gdWt0Xdyafqx7lyCtULC7npID
	ik6qxBGHN4wN1ntGClGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ESq-0000000DMP8-2vEK;
	Thu, 17 Oct 2024 00:34:04 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1E9g-0000000DIDk-3sRc
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:14:18 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e3c638cc27so10012017b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124055; x=1729728855; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XruooYYEp4qZm36/rBHba0zUOpJtUJVrKsk9Et8lqQs=;
        b=jvC5JGZKv5ZYpDweBhPW+SIF1eipmYHgWA0dIAZmWT2kQ9bt9dpnZ1bnEaJKLnNMoo
         7vgJfqbV0f//lqmoEiKfpsg+P1NYrBqwF3NUFnoQI5tKT2B0rnqV/Lu9eJEDXgfTkj06
         rIX4kBA/G4f68AsnUovVSY5y43t+FWl2bb1eKkH95fUBLV+vGauewohc9HT8dEtXh3VJ
         /avavaopIVzg9bwGP2pZd95xAXU4Meciviu3ewu6u+TJjlRDlmWNi4lO3z2nRzqevERU
         5R48pR2Ztnk5unaFjGCDMxfx6x0U8j0KBJtXw1bfbT/D3WbqmuvAGw/FXyLVj1nDus7c
         VvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124055; x=1729728855;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XruooYYEp4qZm36/rBHba0zUOpJtUJVrKsk9Et8lqQs=;
        b=SVISsQGRhNi7CDenShRe2AjhMgdc2r3jKDP6XESkNzOElxNapWXiGu2xg5mbc7LxuV
         eCj/t5m/8sXYuSODImJUI3JkYJRCzlWgTrDwPodfg4R8pGXhHgBM4sC0vKTsOD45J838
         7la2oCERT+sSGPK/oCGp6IT38Mz7WBUK++SKmkATQ4KVWU0QMiIOLZPC7gK6iW2SW39s
         PHBuwOZzBglWrDjqwDrfWZzil2YpJuzUaK4GJwrDV2v7oUgFrheZThI36NVh66XFZLWM
         +cYGLU4VuGJMdgZoaYfsFHm7EejDQtWkgS3FXIXQAEzde4Sth17VT/gMUT8zfbEeoAaR
         pd+g==
X-Forwarded-Encrypted: i=1; AJvYcCVeZw1/TQpz4Em3GIgBK0IqJpvnnfdGCDKafEYIEXEzJH69gy0yd6xrp6ZA3NB9/5p/TtSywokEa06Qtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK9y+d2HIQHKpg0qLdLfluRjgF7LRmHjqMEEYj4uHSgj1cxQ+A
	czd5Osad3rKuX/42JwLWaq6Vs3g1uxYB+24rt46lR4cxTssNEd1wpoTcLS5MdsM55JHGK0rChc+
	BrB5mlA==
X-Google-Smtp-Source: AGHT+IEWSf9KTS25YKU/OuIukGw6sWQXoPw62GyskrXeRoMByAlrcshBkd7RuFz+z1QPDU6BnqyVlH2IKX9F
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a25:2e0b:0:b0:e0b:f69b:da30 with SMTP id
 3f1490d57ef6-e2978571005mr6949276.9.1729124055304; Wed, 16 Oct 2024 17:14:15
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:13:48 -0700
In-Reply-To: <20241017001354.56973-1-irogers@google.com>
Message-Id: <20241017001354.56973-6-irogers@google.com>
Mime-Version: 1.0
References: <20241017001354.56973-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 05/11] perf build: Combine libdw-dwarf-unwind into libdw
 feature tests
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
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Changbin Du <changbin.du@huawei.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_171416_995784_AFD6D0A8 
X-CRM114-Status: GOOD (  16.36  )
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

Support in libdw has been present for 10 years so let's simplify the
build logic with a single feature test.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/Makefile.feature                  |  2 --
 tools/build/feature/Makefile                  |  4 ----
 tools/build/feature/test-all.c                |  5 -----
 tools/build/feature/test-libdw-dwarf-unwind.c | 14 --------------
 tools/build/feature/test-libdw.c              | 19 ++++++++++++++++++-
 tools/perf/Makefile.config                    |  8 --------
 6 files changed, 18 insertions(+), 34 deletions(-)
 delete mode 100644 tools/build/feature/test-libdw-dwarf-unwind.c

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 6025810cc346..db3695ec5f83 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -60,7 +60,6 @@ FEATURE_TESTS_BASIC :=                  \
         reallocarray                    \
         stackprotector-all              \
         timerfd                         \
-        libdw-dwarf-unwind              \
         zlib                            \
         lzma                            \
         get_cpuid                       \
@@ -133,7 +132,6 @@ FEATURE_DISPLAY ?=              \
          libpython              \
          libcrypto              \
          libunwind              \
-         libdw-dwarf-unwind     \
          libcapstone            \
          llvm-perf              \
          zlib                   \
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 7a1c028ce40b..18f8fef5e843 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -52,7 +52,6 @@ FILES=                                          \
          test-pthread-barrier.bin		\
          test-stackprotector-all.bin            \
          test-timerfd.bin                       \
-         test-libdw-dwarf-unwind.bin            \
          test-libbabeltrace.bin                 \
          test-libcapstone.bin			\
          test-compile-32.bin                    \
@@ -317,9 +316,6 @@ $(OUTPUT)test-backtrace.bin:
 $(OUTPUT)test-timerfd.bin:
 	$(BUILD)
 
-$(OUTPUT)test-libdw-dwarf-unwind.bin:
-	$(BUILD) # -ldw provided by $(FEATURE_CHECK_LDFLAGS-libdw-dwarf-unwind)
-
 $(OUTPUT)test-libbabeltrace.bin:
 	$(BUILD) # -lbabeltrace provided by $(FEATURE_CHECK_LDFLAGS-libbabeltrace)
 
diff --git a/tools/build/feature/test-all.c b/tools/build/feature/test-all.c
index d60e072b6eca..863c82516433 100644
--- a/tools/build/feature/test-all.c
+++ b/tools/build/feature/test-all.c
@@ -98,10 +98,6 @@
 # include "test-stackprotector-all.c"
 #undef main
 
-#define main main_test_libdw_dwarf_unwind
-# include "test-libdw-dwarf-unwind.c"
-#undef main
-
 #define main main_test_zlib
 # include "test-zlib.c"
 #undef main
@@ -202,7 +198,6 @@ int main(int argc, char *argv[])
 	main_test_numa_num_possible_cpus();
 	main_test_timerfd();
 	main_test_stackprotector_all();
-	main_test_libdw_dwarf_unwind();
 	main_test_zlib();
 	main_test_pthread_attr_setaffinity_np();
 	main_test_pthread_barrier();
diff --git a/tools/build/feature/test-libdw-dwarf-unwind.c b/tools/build/feature/test-libdw-dwarf-unwind.c
deleted file mode 100644
index ed03d9505609..000000000000
--- a/tools/build/feature/test-libdw-dwarf-unwind.c
+++ /dev/null
@@ -1,14 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include <elfutils/libdwfl.h>
-
-int main(void)
-{
-	/*
-	 * This function is guarded via: __nonnull_attribute__ (1, 2).
-	 * Passing '1' as arguments value. This code is never executed,
-	 * only compiled.
-	 */
-	dwfl_thread_getframes((void *) 1, (void *) 1, NULL);
-	return 0;
-}
diff --git a/tools/build/feature/test-libdw.c b/tools/build/feature/test-libdw.c
index 8d474bd7371b..793f4ac49514 100644
--- a/tools/build/feature/test-libdw.c
+++ b/tools/build/feature/test-libdw.c
@@ -1,11 +1,28 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dwarf.h>
 #include <elfutils/libdw.h>
+#include <elfutils/libdwfl.h>
 #include <elfutils/version.h>
 
-int main(void)
+int test_libdw(void)
 {
 	Dwarf *dbg = dwarf_begin(0, DWARF_C_READ);
 
 	return (long)dbg;
 }
+
+int test_libdw_unwind(void)
+{
+	/*
+	 * This function is guarded via: __nonnull_attribute__ (1, 2).
+	 * Passing '1' as arguments value. This code is never executed,
+	 * only compiled.
+	 */
+	dwfl_thread_getframes((void *) 1, (void *) 1, NULL);
+	return 0;
+}
+
+int main(void)
+{
+	return test_libdw() + test_libdw_unwind();
+}
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index f1e24c4ae123..fa59ecce4470 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -164,8 +164,6 @@ ifeq ($(findstring -static,${LDFLAGS}),-static)
 endif
 FEATURE_CHECK_CFLAGS-libdw := $(LIBDW_CFLAGS)
 FEATURE_CHECK_LDFLAGS-libdw := $(LIBDW_LDFLAGS) $(DWARFLIBS)
-FEATURE_CHECK_CFLAGS-libdw-dwarf-unwind := $(LIBDW_CFLAGS)
-FEATURE_CHECK_LDFLAGS-libdw-dwarf-unwind := $(LIBDW_LDFLAGS) $(DWARFLIBS)
 FEATURE_CHECK_CFLAGS-dwarf_getlocations := $(LIBDW_CFLAGS)
 FEATURE_CHECK_LDFLAGS-dwarf_getlocations := $(LIBDW_LDFLAGS) $(DWARFLIBS)
 FEATURE_CHECK_CFLAGS-dwarf_getcfi := $(LIBDW_CFLAGS)
@@ -467,12 +465,6 @@ else
       endif
     endif
   else
-    ifndef NO_LIBDW_DWARF_UNWIND
-      ifneq ($(feature-libdw-dwarf-unwind),1)
-        NO_LIBDW_DWARF_UNWIND := 1
-        $(warning No libdw DWARF unwind found, Please install elfutils-devel/libdw-dev >= 0.158 and/or set LIBDW_DIR)
-      endif
-    endif
     ifneq ($(feature-libdw), 1)
       ifndef NO_LIBDW
         $(warning No libdw.h found or old libdw.h found or elfutils is older than 0.138, disables dwarf support. Please install new elfutils-devel/libdw-dev)
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

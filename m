Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259D9CFB42C
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 20:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sQFjJZGNFFxDccr6iVJugrUgd/0Axl8aGt0mXPKziA=; b=Ml9fc4g9JLDAps
	JwGVXix8YOxy4GXbkKKB59CGgq1TjEA6Ua9lshF9FKYDsoVvi9tEavzmHURBhFXjyQRd2dqlcT4kQ
	iLFLKcNHvy8tntcISlwZqlImfhuMMZFYhE1XspMGTEhWje5rdS/03/sj+W+2yZGaGm7pWD0Q4bwNN
	EMYp0zJGPV+nkhXGQVCqEmjCmuSMd9T0+x/8sQW8cmsM5wSTBXOzDgLNxyXsY+u5WGTxcBBvpACgn
	W+62VPhqQsH5l9uRdazL3E11LPOTLLut3MRfXCqGzQFXfFRKDXIUQgPZ+ks5GD7Ablz/PJhfPxvWH
	NEEAVlwfPqUpQuM/cjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxB0b-0000000FsEd-3gEl;
	Sat, 05 Oct 2024 20:04:09 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAsv-0000000FpvM-2KRT
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:15 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e2317d1cb7so50293347b3.3
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158172; x=1728762972; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5T5tCPOGyJCvNBSpHWk2GY1SqD0ik3fhg7b1kYtWk8k=;
        b=JcbPolUkkEMwB9YbRWzlh8b6et+tZ1b37pM0pawwBw61HfVJb+ZGKbMKOqfb0ZGjSf
         lN+eKt5OkirTlv0DIfVSmJFXDki0Di9Z+gJ94QGqWoGRgv5aY3TgbcMbi0XCs84lNmJs
         fEoSb6wbY858l2gQWPGv34aYEJHhqdYvHrxzslkA6q4mjls7ydDcXJqdiUJUeI32H2Va
         8dBKFLgLw/aG2CF8RjQVbFFDfYfQg/6IgdIRb7liQug/IxnelGjk6tmaBJxUvc4KQhdL
         W90/QbK2NcHrwP9ZtmAVmbZoFcfpBmfO34Y6o5A3nEI/o34VKo6Gab66kcCUXFmlCTjx
         AkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158172; x=1728762972;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5T5tCPOGyJCvNBSpHWk2GY1SqD0ik3fhg7b1kYtWk8k=;
        b=AV6cpSamWptTR489oaSNp3FVao7iUm9Gc4X+RZbyr9qxrlos6XI2D7TdFwDlBl8Nzg
         KxPqYM0PDMprZo66ZKanpMVvYnSQNwUK2euUJoTml5Q7vavRPzTh8kWbCN6pmD1QUMGX
         OYHxmpEYoA2k0Wg0CKbM/e1smucRDjIfKes3A9udUxMXPXnCNkD6aAZ3c1jEkK0fugHU
         Rpqrl9kpj8uXwH3wB7W0pKD9tLqF+CD7z2w5N/Fc4BZcRmV32IBNcJFWEO3Tq46sb28E
         48hjKTkLzaatU5vnFfEBTv51IpJ61S7Q2NqrUmJpfHSXnnJGUl5kspr+hYDmzv3eau67
         H1hg==
X-Forwarded-Encrypted: i=1; AJvYcCUf7/qZJUILeqfKqqUh7tm1joUmMO1woF/JVm4Qo5HVfewoIILl1DHZ63Fpg7BJjdfb3OyVMT63I4qzmg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3p9LXvovrqp1E2L2pOYSADR7sOlGk/0ypxnNEFOnedmnzn6i5
	K6vL8j+fotXl2gdmWo/w2NxHbT4tThbBCJIgSiA+cWkL0T4EcZzFcQtZjn1vVEyDI6PM4GMm7Bk
	ikAv1vw==
X-Google-Smtp-Source: AGHT+IFUof9q2cilWVpyDs4oVP+nAlyKWLNvJCEvU13NF2KeKjgTJ+lCLvaeS32rFGhkBh06FROgvfGUuw0Q
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a05:690c:3581:b0:6e2:6f2:efc with SMTP id
 00721157ae682-6e2c7290b3emr1498087b3.5.1728158171884; Sat, 05 Oct 2024
 12:56:11 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:16 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-7-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 06/31] perf build: Combine test-dwarf-getlocations into test-libdw
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
X-CRM114-CacheID: sfid-20241005_125613_830494_781ED3A6 
X-CRM114-Status: GOOD (  14.17  )
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

dwarf_getlocations support in libdw is more than 10 years old. Make
libdw imply dwarf_getlocations support and simplify build logic.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/Makefile.feature                  |  2 --
 tools/build/feature/Makefile                  |  4 ----
 tools/build/feature/test-all.c                |  5 -----
 tools/build/feature/test-dwarf_getlocations.c | 13 -------------
 tools/build/feature/test-libdw.c              | 14 +++++++++++++-
 tools/perf/Makefile.config                    | 10 ++--------
 6 files changed, 15 insertions(+), 33 deletions(-)
 delete mode 100644 tools/build/feature/test-dwarf_getlocations.c

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index db3695ec5f83..cf6a967575ea 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -31,7 +31,6 @@ endef
 FEATURE_TESTS_BASIC :=                  \
         backtrace                       \
         libdw                           \
-        dwarf_getlocations              \
         dwarf_getcfi                    \
         eventfd                         \
         fortify-source                  \
@@ -120,7 +119,6 @@ endif
 
 FEATURE_DISPLAY ?=              \
          libdw                  \
-         dwarf_getlocations     \
          glibc                  \
          libbfd                 \
          libbfd-buildid		\
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 7bb409c1f7e6..7683d171f744 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -6,7 +6,6 @@ FILES=                                          \
          test-backtrace.bin                     \
          test-bionic.bin                        \
          test-libdw.bin                         \
-         test-dwarf_getlocations.bin            \
          test-dwarf_getcfi.bin                  \
          test-eventfd.bin                       \
          test-fortify-source.bin                \
@@ -185,9 +184,6 @@ endif
 $(OUTPUT)test-libdw.bin:
 	$(BUILD) $(DWLIBS)
 
-$(OUTPUT)test-dwarf_getlocations.bin:
-	$(BUILD) $(DWLIBS)
-
 $(OUTPUT)test-dwarf_getcfi.bin:
 	$(BUILD) $(DWLIBS)
 
diff --git a/tools/build/feature/test-all.c b/tools/build/feature/test-all.c
index 863c82516433..59ef3d7fe6a4 100644
--- a/tools/build/feature/test-all.c
+++ b/tools/build/feature/test-all.c
@@ -42,10 +42,6 @@
 # include "test-libdw.c"
 #undef main
 
-#define main main_test_dwarf_getlocations
-# include "test-dwarf_getlocations.c"
-#undef main
-
 #define main main_test_eventfd
 # include "test-eventfd.c"
 #undef main
@@ -184,7 +180,6 @@ int main(int argc, char *argv[])
 	main_test_gettid();
 	main_test_glibc();
 	main_test_libdw();
-	main_test_dwarf_getlocations();
 	main_test_eventfd();
 	main_test_libelf_getphdrnum();
 	main_test_libelf_gelf_getnote();
diff --git a/tools/build/feature/test-dwarf_getlocations.c b/tools/build/feature/test-dwarf_getlocations.c
deleted file mode 100644
index 78fb4a1fa68c..000000000000
--- a/tools/build/feature/test-dwarf_getlocations.c
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <stdlib.h>
-#include <elfutils/libdw.h>
-
-int main(void)
-{
-	Dwarf_Addr base, start, end;
-	Dwarf_Attribute attr;
-	Dwarf_Op *op;
-        size_t nops;
-	ptrdiff_t offset = 0;
-        return (int)dwarf_getlocations(&attr, offset, &base, &start, &end, &op, &nops);
-}
diff --git a/tools/build/feature/test-libdw.c b/tools/build/feature/test-libdw.c
index 793f4ac49514..83ea5d5f235d 100644
--- a/tools/build/feature/test-libdw.c
+++ b/tools/build/feature/test-libdw.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <stdlib.h>
 #include <dwarf.h>
 #include <elfutils/libdw.h>
 #include <elfutils/libdwfl.h>
@@ -22,7 +23,18 @@ int test_libdw_unwind(void)
 	return 0;
 }
 
+int test_libdw_getlocations(void)
+{
+	Dwarf_Addr base, start, end;
+	Dwarf_Attribute attr;
+	Dwarf_Op *op;
+	size_t nops;
+	ptrdiff_t offset = 0;
+
+	return (int)dwarf_getlocations(&attr, offset, &base, &start, &end, &op, &nops);
+}
+
 int main(void)
 {
-	return test_libdw() + test_libdw_unwind();
+	return test_libdw() + test_libdw_unwind() + test_libdw_getlocations();
 }
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 93fd6bd74d20..903de48c140d 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -161,8 +161,6 @@ ifeq ($(findstring -static,${LDFLAGS}),-static)
 endif
 FEATURE_CHECK_CFLAGS-libdw := $(LIBDW_CFLAGS)
 FEATURE_CHECK_LDFLAGS-libdw := $(LIBDW_LDFLAGS) $(DWARFLIBS)
-FEATURE_CHECK_CFLAGS-dwarf_getlocations := $(LIBDW_CFLAGS)
-FEATURE_CHECK_LDFLAGS-dwarf_getlocations := $(LIBDW_LDFLAGS) $(DWARFLIBS)
 FEATURE_CHECK_CFLAGS-dwarf_getcfi := $(LIBDW_CFLAGS)
 FEATURE_CHECK_LDFLAGS-dwarf_getcfi := $(LIBDW_LDFLAGS) $(DWARFLIBS)
 
@@ -464,15 +462,11 @@ else
   else
     ifneq ($(feature-libdw), 1)
       ifndef NO_LIBDW
-        $(warning No libdw.h found or old libdw.h found or elfutils is older than 0.138, disables dwarf support. Please install new elfutils-devel/libdw-dev)
+        $(warning No libdw.h found or old libdw.h found or elfutils is older than 0.157, disables dwarf support. Please install new elfutils-devel/libdw-dev)
         NO_LIBDW := 1
       endif
     else
-      ifneq ($(feature-dwarf_getlocations), 1)
-        $(warning Old libdw.h, finding variables at given 'perf probe' point will not work, install elfutils-devel/libdw-dev >= 0.157)
-      else
-        CFLAGS += -DHAVE_DWARF_GETLOCATIONS_SUPPORT
-      endif # dwarf_getlocations
+      CFLAGS += -DHAVE_DWARF_GETLOCATIONS_SUPPORT
       ifneq ($(feature-dwarf_getcfi), 1)
         $(warning Old libdw.h, finding variables at given 'perf probe' point will not work, install elfutils-devel/libdw-dev >= 0.142)
       else
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

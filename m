Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F324CD2F7D8
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 00:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMbrP16KAt8cwzCPu//TBYJfTccMvAzU6hQPY0iJTkM=; b=Ae5rzHBQzBIoOf
	WOOGolcZGXIRNnm0UxYbBYByRaiXpm5029PZ3vlW5uxRnb4r8ZQHVOtSbU2rkOv9kKxB2mO4kjilc
	1L5CZF9OjXO3JcWOEv2WxGW2MYq7fFQJ4JoZ/Ms6ZmXcKR7mdR3kxG6rQ5oS/xAW7l8srItH4U4Ze
	P8yaMY17Ivqj/PN68fS5uhYvQebh1OcjECrV/vN0GLOyg+CJjVxoU1Yr3ED8l+ItxQYXM08oavV+z
	Y/KGgi65JakoPumUstHrAXxC4NczNlaOEdcL1da3kBuJXaSvvZw4d0vvnuJu/NoJpO6BLbgSCtbEv
	xXAiLpVFC+VNvoNos4dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EYZ-0000000DN7A-3DnE;
	Thu, 17 Oct 2024 00:39:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1E9o-0000000DIHV-0Sh4
	for linux-riscv@bombadil.infradead.org;
	Thu, 17 Oct 2024 00:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	References:Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gv4rC21EH5vKyMLFGXp6RuMwHEpZG+2xqNlyQiSYUJM=; b=lZFKjC4+Zs4B6Vuc/cRZi6K3jQ
	SK2U2MYfVPEe/emx3cbwDkbD4zYmyBbIZeEaYCH2yDFLrBo7oXtudG97pDj+xi7h9mHu7ifcLAi1B
	hDmShxvvX2twsdiQ2dgI7ntu/3AKHwIEERVDVvQ9GSmJ5w58LidIiDFbjs90YwXxpZ56IF/YZIJoS
	b3a7HBP5JvsixngS2ZS4rELaYtgcQKlX2q0G+vzfwqd6NGsUAlxVezvKDMQ2fQXTzORl4in49cIjF
	ykNLh1SKvulOtjZ2xxhO0OMljCN7rN+22JnH4LHCUnbJoOOj8n7vl65hVv5rhupEyMHGpG3swaXxn
	97Pq0YMw==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1E9i-00000006y99-2w4S
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:14:22 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e24a31ad88aso516421276.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124053; x=1729728853; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gv4rC21EH5vKyMLFGXp6RuMwHEpZG+2xqNlyQiSYUJM=;
        b=nPfnXvlsRJJWQxpTuNphbbOcT7YJuN6fhK6pm4zPjM8k6ArBUPkmycrUXbPgWPC3TC
         nnO/4VpsQEfAIERopmGpDpoFFWxt40Ue04HtwMvzhvWakanEuXUXzeXTxfAONireDdGz
         CVoDSIfseGq44Cuhn/BAHJGVE33RMK7kKXMSCDiiMf+lCYjy78cW/jSiNhX58TbOuJc0
         PRQr0QVsJTOhfKaVTFvsaLs40jyt5Y81zHlTzgnm5BmtEjjR9eoxGhoDtuAKNRJ2xsa4
         f5RvH2XLg5iEeBPBRJo65Bv4hOcNlI2GLjGH48jK6bw5Y/NEJmTAPqM18hi3krqZH06f
         Ct/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124053; x=1729728853;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gv4rC21EH5vKyMLFGXp6RuMwHEpZG+2xqNlyQiSYUJM=;
        b=ebinnj8cltWAXbyzQ2GpZO+XWmZDURTTFpEWt7SI0K1gM9VM24TR/WydJBSffAuyh2
         KuyMv42fUTFUdGqKeQC0OLtS9sFPcxBUKsGMJzc+r7T5KzSfH1wSYIVf0KxJAbKaoUYB
         ua9U87HfOf0LqIqWtV5zwm8Gc46qtu2wu1kPEyGYXNgnsLfPRodo+lVTqOwjxZQ+eItC
         0XLKcL65Yp3rpwhAItwCVEOy40GEOyrK96rWM1O3B11ehAWCXv6PouX2w8hqHWHNMwPj
         vIlAjVc0txJBeSsnySS09UnoJ1cK+8FdvYsoM8Jm4wAa0Tf3fL82Wu5lA07P5vNWNSYW
         Rnlw==
X-Forwarded-Encrypted: i=1; AJvYcCVXT+7Dxz4mfs/6DGrDZw14lExkZn15UwyEG2XLI/+hSyvVQUJvbSjoFPCcRP+X/8BwD8HXv8LnkKx35g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw895mcY+BD7B7Xrxc6D6hY25JmjcRuFPyF6CB+mgTvdm1mwbuJ
	ewdKSRqslRhRhDaOOEiKZgiG4Pubeu0avHv9FIzwnfoVgH10ncvv0omw36DbRzj1IXv9Kkxc2DK
	taJ/gxA==
X-Google-Smtp-Source: AGHT+IGzsdwJDBoPyKd/XtgGR0BEXokuFHhXrbu1xDLmXdK+oi96DfZVdRcJHcGkPuy4Owl251BGxQBLx/5T
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a25:ad64:0:b0:e16:68fb:f261 with SMTP id
 3f1490d57ef6-e297830baadmr2824276.5.1729124052807; Wed, 16 Oct 2024 17:14:12
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:13:47 -0700
In-Reply-To: <20241017001354.56973-1-irogers@google.com>
Message-Id: <20241017001354.56973-5-irogers@google.com>
Mime-Version: 1.0
References: <20241017001354.56973-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 04/11] perf build: Rename test-dwarf to test-libdw
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
X-CRM114-CacheID: sfid-20241017_011418_946498_95D003CC 
X-CRM114-Status: GOOD (  12.03  )
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

Be more intention revealing that the dwarf test is actually testing
for libdw support.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/Makefile.feature                     |  6 +++---
 tools/build/feature/Makefile                     | 16 ++++++++--------
 tools/build/feature/test-all.c                   |  6 +++---
 .../build/feature/{test-dwarf.c => test-libdw.c} |  0
 tools/perf/Makefile.config                       |  6 +++---
 5 files changed, 17 insertions(+), 17 deletions(-)
 rename tools/build/feature/{test-dwarf.c => test-libdw.c} (100%)

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index ffd117135094..6025810cc346 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -30,7 +30,7 @@ endef
 #
 FEATURE_TESTS_BASIC :=                  \
         backtrace                       \
-        dwarf                           \
+        libdw                           \
         dwarf_getlocations              \
         dwarf_getcfi                    \
         eventfd                         \
@@ -120,7 +120,7 @@ ifeq ($(FEATURE_TESTS),all)
 endif
 
 FEATURE_DISPLAY ?=              \
-         dwarf                  \
+         libdw                  \
          dwarf_getlocations     \
          glibc                  \
          libbfd                 \
@@ -233,7 +233,7 @@ endef
 
 #
 # generates feature value assignment for name, like:
-#   $(call feature_assign,dwarf) == feature-dwarf=1
+#   $(call feature_assign,libdw) == feature-libdw=1
 #
 feature_assign = feature-$(1)=$(feature-$(1))
 
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 1658596188bf..7a1c028ce40b 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -5,7 +5,7 @@ FILES=                                          \
          test-all.bin                           \
          test-backtrace.bin                     \
          test-bionic.bin                        \
-         test-dwarf.bin                         \
+         test-libdw.bin                         \
          test-dwarf_getlocations.bin            \
          test-dwarf_getcfi.bin                  \
          test-eventfd.bin                       \
@@ -168,9 +168,9 @@ $(OUTPUT)test-libopencsd.bin:
 	$(BUILD) # -lopencsd_c_api -lopencsd provided by
 		 # $(FEATURE_CHECK_LDFLAGS-libopencsd)
 
-DWARFLIBS := -ldw
+DWLIBS := -ldw
 ifeq ($(findstring -static,${LDFLAGS}),-static)
-  DWARFLIBS += -lelf -lz -llzma -lbz2 -lzstd
+  DWLIBS += -lelf -lz -llzma -lbz2 -lzstd
 
   LIBDW_VERSION := $(shell $(PKG_CONFIG) --modversion libdw).0.0
   LIBDW_VERSION_1 := $(word 1, $(subst ., ,$(LIBDW_VERSION)))
@@ -179,21 +179,21 @@ ifeq ($(findstring -static,${LDFLAGS}),-static)
   # Elfutils merged libebl.a into libdw.a starting from version 0.177,
   # Link libebl.a only if libdw is older than this version.
   ifeq ($(shell test $(LIBDW_VERSION_2) -lt 177; echo $$?),0)
-    DWARFLIBS += -lebl
+    DWLIBS += -lebl
   endif
 
   # Must put -ldl after -lebl for dependency
   DWARFLIBS += -ldl
 endif
 
-$(OUTPUT)test-dwarf.bin:
-	$(BUILD) $(DWARFLIBS)
+$(OUTPUT)test-libdw.bin:
+	$(BUILD) $(DWLIBS)
 
 $(OUTPUT)test-dwarf_getlocations.bin:
-	$(BUILD) $(DWARFLIBS)
+	$(BUILD) $(DWLIBS)
 
 $(OUTPUT)test-dwarf_getcfi.bin:
-	$(BUILD) $(DWARFLIBS)
+	$(BUILD) $(DWLIBS)
 
 $(OUTPUT)test-libelf-getphdrnum.bin:
 	$(BUILD) -lelf
diff --git a/tools/build/feature/test-all.c b/tools/build/feature/test-all.c
index 6f4bf386a3b5..d60e072b6eca 100644
--- a/tools/build/feature/test-all.c
+++ b/tools/build/feature/test-all.c
@@ -38,8 +38,8 @@
 # include "test-glibc.c"
 #undef main
 
-#define main main_test_dwarf
-# include "test-dwarf.c"
+#define main main_test_libdw
+# include "test-libdw.c"
 #undef main
 
 #define main main_test_dwarf_getlocations
@@ -187,7 +187,7 @@ int main(int argc, char *argv[])
 	main_test_get_current_dir_name();
 	main_test_gettid();
 	main_test_glibc();
-	main_test_dwarf();
+	main_test_libdw();
 	main_test_dwarf_getlocations();
 	main_test_eventfd();
 	main_test_libelf_getphdrnum();
diff --git a/tools/build/feature/test-dwarf.c b/tools/build/feature/test-libdw.c
similarity index 100%
rename from tools/build/feature/test-dwarf.c
rename to tools/build/feature/test-libdw.c
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index dd5468b8b5de..f1e24c4ae123 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -162,8 +162,8 @@ ifeq ($(findstring -static,${LDFLAGS}),-static)
   # Must put -ldl after -lebl for dependency
   DWARFLIBS += -ldl
 endif
-FEATURE_CHECK_CFLAGS-dwarf := $(LIBDW_CFLAGS)
-FEATURE_CHECK_LDFLAGS-dwarf := $(LIBDW_LDFLAGS) $(DWARFLIBS)
+FEATURE_CHECK_CFLAGS-libdw := $(LIBDW_CFLAGS)
+FEATURE_CHECK_LDFLAGS-libdw := $(LIBDW_LDFLAGS) $(DWARFLIBS)
 FEATURE_CHECK_CFLAGS-libdw-dwarf-unwind := $(LIBDW_CFLAGS)
 FEATURE_CHECK_LDFLAGS-libdw-dwarf-unwind := $(LIBDW_LDFLAGS) $(DWARFLIBS)
 FEATURE_CHECK_CFLAGS-dwarf_getlocations := $(LIBDW_CFLAGS)
@@ -473,7 +473,7 @@ else
         $(warning No libdw DWARF unwind found, Please install elfutils-devel/libdw-dev >= 0.158 and/or set LIBDW_DIR)
       endif
     endif
-    ifneq ($(feature-dwarf), 1)
+    ifneq ($(feature-libdw), 1)
       ifndef NO_LIBDW
         $(warning No libdw.h found or old libdw.h found or elfutils is older than 0.138, disables dwarf support. Please install new elfutils-devel/libdw-dev)
         NO_LIBDW := 1
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

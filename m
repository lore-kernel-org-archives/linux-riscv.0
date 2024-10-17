Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA449D2F7D7
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 00:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2ggq/5XlftYrrtEpuv6KNmcrrhSxQZPoNsh0IYErl0=; b=Xd/5bv9IQFlXdz
	YRi8fDYJxXUIJP5DcA6ov3kdPxM6Z0kZPE61NhidOCQ07dXqC8il1U/I68CqC57x3dwV/p3y/cqao
	XSNkoKpL2lkHiombOj3rWMFOVoT4NL2pNBNmvw2Mukl6NRaXCDi6i8xKrfdA2n6M1Lggu+Taqx7oD
	O8484f6WPzfAsIuCobk121VWL0QwWuCFKEfcxug3/qm3cSyAUnVxgYjdi+uHIWiK7QyIRkI+Q3141
	NCZRMlTGKU5zWLA/5HxH89VmnNQ+jrHiV5A11f8FJv6b4XyBYETLw+0Mo5CI21qyp8EQOj0lyRlfq
	aGhdKDN6Fi/ecCpN8Ayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EZz-0000000DNIS-0Kge;
	Thu, 17 Oct 2024 00:41:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1E9q-0000000DIIc-37nE
	for linux-riscv@bombadil.infradead.org;
	Thu, 17 Oct 2024 00:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	References:Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tad0E7gcGFVieZCra5vDET9AmRJVsC8ZllrVS3JLUH0=; b=nOBcha1ivoPgNJWTrVl5J03PZ6
	NHHjAEQJL8/fuUXKAxqFvfpE1hqeihE0X3jAENfAk58Jw/1rrq41T9+HKZ5/eIw+3p4eunzEtrfiu
	z9kDz0QqpayQt3PJShtuUNfJHCCzCUCOMLFhaGdGYCi1cI+kYca9Bmb793rUdyQwNiQjCKcDcad1E
	ZCLXJc47zSnSM4LdyXcoV8Y32fXVDNXQ7vlMdhfusMOuicVIHtTdG8BDAQ3In9Z7c0AvJpAy9ct7B
	5qtKO1I1tavIdpLrGedwJJFysmjYhjY+Z0OWlLa52arB58pQD/XKvlYBgkehuVOXDTMZRaKCaQjGM
	s1B5Pm5A==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1E9m-00000006yA0-1Y6h
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:14:24 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e02b5792baaso571288276.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124060; x=1729728860; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tad0E7gcGFVieZCra5vDET9AmRJVsC8ZllrVS3JLUH0=;
        b=QtW2CkpQv3IBf0FmlCtJYLVB34c6lrKtCogQLdiP/zfu8Y7eSVnSSYPxmphBoCQ3Aa
         NFAPRioefSW5sQLJnhhPlXIArXOvio4uiZ2VMzzuO/siqT2gUiXWa0R8JNkwj5AObhbX
         U2Fq1hCjyg6258MKHDLs5eCb4zJIjXHStoTABLgbAbmZxECC9KjRGkCNbXVhPwcBlwsX
         vrNLGWa2HaV9T7GY6ZirrZiASjfFJ25ejbkbNHkplSMp3NwC61CiukBSocIoj/PzEDFm
         4uNYMDKhz2G7jNUqfBK2fRxTojOvaVxc5widIKCfudyft51bIDNebcMvYVZqMJiymBJX
         v+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124060; x=1729728860;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tad0E7gcGFVieZCra5vDET9AmRJVsC8ZllrVS3JLUH0=;
        b=M0j7WAXoHhlJGNXEkB/oyo5/zCjZUiLvdsAi0BmsUuDRS6Lz3Tm2hKjoEaCGTPMYqY
         m22YgDQf+Btlu9UuumqNiWTjS+W3a3FBE5Da4kCdb+umQTO0AS7kNoPcz89rLh2pYqqy
         mfoMQ7LZJagAGaj5VdZJZSlf4KnU6Uqd1cgwXs8eoroyThpDkWgdb0zMlHm5RsdUzwao
         1Rra/9+MHJW0WHgueodVcLRP8mgQeCucDz60K39Sl1ynRd4KlbJVpuZfk7iz4uOb8RBp
         jNdJBs9jnlhiC8u4KKXSBKPHc8qhB/XYWwsRKMSMKhK387DRkrO73p6V9CBXGE6RCoqe
         uQ2A==
X-Forwarded-Encrypted: i=1; AJvYcCUWmi9oM+sfPIIMFMb1OYLKsRC9aYfbcIimAOztrBta4XGyuHvmUc/BYd0Xk/5JnFo5PPRj7qubkA/mhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxS2eM3HtVBkOo3Sl3kIlLk9HRsvQLYlA9+GKukIp06m0vDKej6
	9k7g1/HwXecHy+EXvenpgMEHmVVrWVjSZMvUQAwRLo8z9Y8ojvmzchCAkK3nz4WPOTyEoObxDGE
	h6wdLCA==
X-Google-Smtp-Source: AGHT+IGePwSgVpWBgHdlZAEHvgtdZU4v9XTpwRgCq9JMZeuOMFSyMOIR6zQOqhOB1mh8mXpAaT7pdZ4G4iD7
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a25:dc4e:0:b0:e28:f231:1aa8 with SMTP id
 3f1490d57ef6-e29782bbb03mr7701276.2.1729124060026; Wed, 16 Oct 2024 17:14:20
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:13:50 -0700
In-Reply-To: <20241017001354.56973-1-irogers@google.com>
Message-Id: <20241017001354.56973-8-irogers@google.com>
Mime-Version: 1.0
References: <20241017001354.56973-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 07/11] perf build: Combine test-dwarf-getcfi into test-libdw
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
X-CRM114-CacheID: sfid-20241017_011422_834757_F1E86929 
X-CRM114-Status: GOOD (  13.88  )
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

dwarf_getcfi support in libdw is 15 years old. Make libdw imply
dwarf_getcfi support and simplify build logic.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/Makefile.feature            |  1 -
 tools/build/feature/Makefile            |  4 ----
 tools/build/feature/test-dwarf_getcfi.c |  9 ---------
 tools/build/feature/test-libdw.c        | 10 +++++++++-
 tools/perf/Makefile.config              |  8 +-------
 5 files changed, 10 insertions(+), 22 deletions(-)
 delete mode 100644 tools/build/feature/test-dwarf_getcfi.c

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index cf6a967575ea..ef72aae3dd49 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -31,7 +31,6 @@ endef
 FEATURE_TESTS_BASIC :=                  \
         backtrace                       \
         libdw                           \
-        dwarf_getcfi                    \
         eventfd                         \
         fortify-source                  \
         get_current_dir_name            \
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 0af3e0255fed..d28ad7672a27 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -6,7 +6,6 @@ FILES=                                          \
          test-backtrace.bin                     \
          test-bionic.bin                        \
          test-libdw.bin                         \
-         test-dwarf_getcfi.bin                  \
          test-eventfd.bin                       \
          test-fortify-source.bin                \
          test-get_current_dir_name.bin          \
@@ -187,9 +186,6 @@ endif
 $(OUTPUT)test-libdw.bin:
 	$(BUILD) $(DWLIBS)
 
-$(OUTPUT)test-dwarf_getcfi.bin:
-	$(BUILD) $(DWLIBS)
-
 $(OUTPUT)test-libelf-getphdrnum.bin:
 	$(BUILD) -lelf
 
diff --git a/tools/build/feature/test-dwarf_getcfi.c b/tools/build/feature/test-dwarf_getcfi.c
deleted file mode 100644
index 50e7d7cb7bdf..000000000000
--- a/tools/build/feature/test-dwarf_getcfi.c
+++ /dev/null
@@ -1,9 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <stdio.h>
-#include <elfutils/libdw.h>
-
-int main(void)
-{
-	Dwarf *dwarf = NULL;
-	return dwarf_getcfi(dwarf) == NULL;
-}
diff --git a/tools/build/feature/test-libdw.c b/tools/build/feature/test-libdw.c
index 83ea5d5f235d..71c6f8e3b0ee 100644
--- a/tools/build/feature/test-libdw.c
+++ b/tools/build/feature/test-libdw.c
@@ -34,7 +34,15 @@ int test_libdw_getlocations(void)
 	return (int)dwarf_getlocations(&attr, offset, &base, &start, &end, &op, &nops);
 }
 
+int test_libdw_getcfi(void)
+{
+	Dwarf *dwarf = NULL;
+
+	return dwarf_getcfi(dwarf) == NULL;
+}
+
 int main(void)
 {
-	return test_libdw() + test_libdw_unwind() + test_libdw_getlocations();
+	return test_libdw() + test_libdw_unwind() + test_libdw_getlocations() +
+	       test_libdw_getcfi();
 }
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index fefa779041a0..6378811f2568 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -164,8 +164,6 @@ ifeq ($(findstring -static,${LDFLAGS}),-static)
 endif
 FEATURE_CHECK_CFLAGS-libdw := $(LIBDW_CFLAGS)
 FEATURE_CHECK_LDFLAGS-libdw := $(LIBDW_LDFLAGS) $(DWARFLIBS)
-FEATURE_CHECK_CFLAGS-dwarf_getcfi := $(LIBDW_CFLAGS)
-FEATURE_CHECK_LDFLAGS-dwarf_getcfi := $(LIBDW_LDFLAGS) $(DWARFLIBS)
 
 # for linking with debug library, run like:
 # make DEBUG=1 LIBBABELTRACE_DIR=/opt/libbabeltrace/
@@ -470,11 +468,7 @@ else
       endif
     else
       CFLAGS += -DHAVE_DWARF_GETLOCATIONS_SUPPORT
-      ifneq ($(feature-dwarf_getcfi), 1)
-        $(warning Old libdw.h, finding variables at given 'perf probe' point will not work, install elfutils-devel/libdw-dev >= 0.142)
-      else
-        CFLAGS += -DHAVE_DWARF_CFI_SUPPORT
-      endif # dwarf_getcfi
+      CFLAGS += -DHAVE_DWARF_CFI_SUPPORT
     endif # Dwarf support
   endif # libelf support
 endif # NO_LIBELF
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790B4E7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 00:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atTT+UDlfDl79NfC2TFXfv2N2fNCnGAhnl47hLnWlto=; b=h7U3Q8vpcdumtD
	ktAkubbhH/N9cQypcTkst6Dkru3WAQ05kRYDNWW5rEF+uhnGfPI1nMoBL6CX0EfWXWRNRpFw0KOQq
	TaI2a3/oMh+5D5FM7lCogkSoG7sD3cZxfzt8wEN8U4ViluO2wqICPNBVTHlzrF0MlrUs/m7r9Kt3d
	9oJqkRvUM9UPKlI6joV6JLqSNpJvRWruHwUI+0pyKEtheRU02vpH48NYeD0hlrYNCY7a22y1HLpxC
	dJ4kUk2KvyZ/+BK51bEfk1TRXh60/dTrbsTb2IEPyLCXhekatjLtulMbYV1vBW6NmdyvzYrxZTeUL
	UuQKlE4grfG++JB804yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtou-00000002KwP-11dP;
	Fri, 13 Dec 2024 00:46:16 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtch-00000002IEu-30AO
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 00:33:41 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7fd4c0220bbso1193724a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 16:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734050019; x=1734654819; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkBpGiJJV1xZfjJsAMeOkH46KtRGtX/VgJPGRtgwU6w=;
        b=NjODZCMVePioE4v6So6piFQfHOovC7tuGJlrqioiUW9pDjono4kM96jMaOTSrqGcP/
         wDV0EfO0XgREcElyCXDmV43K9mS+CyFS5NnWTneM+nTFuqxPiQy55G8Ikxrl7UiQ3oKS
         /MTRq+hDJeQPbfcstwdhZCwu5aKBcXCsefIxxw/Na5zjx3JBrMRrjGx1DhDrejOR04yD
         1U12e4LqDS49jPugKF+U9Wl4h1kaI67WO+WhfnSdCt+QQ0EX6NjBitEh1mGNx6lieJZO
         d/xoXJqktmEy9P2qf9W2A9N0jNFc8EIeuUBfYNYYANKEyPDMXocldlpcU62zuQUrMn0D
         wQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734050019; x=1734654819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkBpGiJJV1xZfjJsAMeOkH46KtRGtX/VgJPGRtgwU6w=;
        b=qUz+cTN75smvlPxkyqkJcECM5wE0E7z1TgkO9fP7UXifhI/PU1Jj+H31Iqnfi9NGhA
         +vGwe+yVC9NcJH/3GdcmBQ+B67SxJMbQCVGifM9xSJiH5oi0XDkTLXUIcMKLCj+C06Rd
         sjQsyjfjZYQ/wRKNlf7MlD4A1oT/e3ILPHJ26q6+6fPYNDyBgSWLLGIapIyR1REI4HSC
         s9cRHfjyjj/Pn98njKDOSv3fyICyyh+y+kYMDzNaSuSeOifsx8hv6ZJrGXIC5Z3iD211
         iQ1HASUTqpAXfWPLkcibUjURlI/So53O9LrJjZ1prrmMIntmVX1Ua2VGTqnFZLV1mC9s
         QcnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6fU0vCr3yfBc4wHj3CnwAeq1mfTUSCr47NTCte808jcz447GySW8sOYL54etOp+u+i+Ag/xcOh3Z/kw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+DKuY2UdisCHPJHrEQagHIcEtOwT1JfLcdZO7YboFsxsZ9VEf
	lrs9jyias7+hfRlBL7wmyqAyD9cvO7vvdo/jT8vsusdU/nPlLWdyXCk4WCdC3v0=
X-Gm-Gg: ASbGncsdLDbsex8tIDfLjkdwwWT/l50jmRxMewC/jSrW4KegZ0ADOnZ8RZmqoLxQkUf
	CWVqmFJKYzlxNJY03QFnXOwfWe4jr0TRx5cYHTKPlyTFjtYXirisPDgwTgWoMNGqWiV8RXyL7Z8
	lxkEWMCfDEItrjQYpAcu8oainmvFG6QKGCCuk60Ao1pEA56zJKlRJCz/7iMmvJr/LRUQ9BqvJzs
	sxDb5oAm7W36JsZ5NqX9roeUzu78n6Xt4DkleJaQlxonsW7lGeyODEAMDW+bvA+kM8a6xNd
X-Google-Smtp-Source: AGHT+IEmO14yRzV89oAAj+86B3/3giiM5XjE+fq4YvWiIgXAskruD2olv5GrMtWghrbv8f8V9rlHTQ==
X-Received: by 2002:a17:90b:1810:b0:2ee:ab29:1482 with SMTP id 98e67ed59e1d1-2f28fb68bbcmr1241837a91.16.1734050019164;
        Thu, 12 Dec 2024 16:33:39 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142e0ce50sm1934462a91.39.2024.12.12.16.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:33:38 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 12 Dec 2024 16:33:02 -0800
Subject: [PATCH v2 12/16] perf tools: loongarch: Use syscall table
MIME-Version: 1.0
Message-Id: <20241212-perf_syscalltbl-v2-12-f8ca984ffe40@rivosinc.com>
References: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
In-Reply-To: <20241212-perf_syscalltbl-v2-0-f8ca984ffe40@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Leo Yan <leo.yan@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6826; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=vnr7cWoZFfQ0KvHH41RaqWCLqYQBec4e5YesLO6WOkY=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3p0w4HTye2XcxtrZ6/5XW1/pLfSpiWjrXlBk6B+w4br7
 DEsIbYdpSwMYhwMsmKKLDzXGphb7+iXHRUtmwAzh5UJZAgDF6cATETsN8MfzqMn9+TkLWL+ImUd
 xxD7bN3Prven/tfWNv4V7Q0r90/QZfin5P/Xmv/m57/LV6u62Gypl79zQ5Vjh+edycdmFSVn+/W
 wAgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_163339_790879_3D5F5A88 
X-CRM114-Status: GOOD (  15.19  )
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

loongarch uses a syscall table, use that in perf instead of using unistd.h.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                         |  5 +--
 tools/perf/Makefile.perf                           |  2 +-
 tools/perf/arch/loongarch/Makefile                 | 22 -----------
 tools/perf/arch/loongarch/entry/syscalls/Kbuild    |  2 +
 .../loongarch/entry/syscalls/Makefile.syscalls     |  3 ++
 .../arch/loongarch/entry/syscalls/mksyscalltbl     | 45 ----------------------
 tools/perf/arch/loongarch/include/syscall_table.h  |  2 +
 tools/perf/util/syscalltbl.c                       |  4 --
 8 files changed, 10 insertions(+), 75 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index aefcbed7cdfac7c2a5d8db5cb111513f2d7c74ed..84ed266ce54f5291af5c59c02ccb06bfe17d840f 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -31,12 +31,12 @@ $(call detected_var,SRCARCH)
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc s390 mips loongarch))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc s390 mips))
     NO_SYSCALL_TABLE := 0
   endif
 
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch))
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)/tools/perf/arch/$(SRCARCH)/include/generated
@@ -75,7 +75,6 @@ ifeq ($(SRCARCH),arm64)
 endif
 
 ifeq ($(SRCARCH),loongarch)
-  CFLAGS += -I$(OUTPUT)arch/loongarch/include/generated
   LIBUNWIND_LIBS = -lunwind -lunwind-loongarch64
 endif
 
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 6a287f15fa1da5e8957558ee0a73b297d347f00d..7fefeea1799231af61e77c9372318e025bed078a 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64))
+ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch))
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
 include Makefile.config
diff --git a/tools/perf/arch/loongarch/Makefile b/tools/perf/arch/loongarch/Makefile
index 52544d59245bab5a0fb2baa1e962b2ad4bf25332..087e099fb453a9236db34878077a51f711881ce0 100644
--- a/tools/perf/arch/loongarch/Makefile
+++ b/tools/perf/arch/loongarch/Makefile
@@ -1,25 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 PERF_HAVE_JITDUMP := 1
 HAVE_KVM_STAT_SUPPORT := 1
-
-#
-# Syscall table generation for perf
-#
-
-out    := $(OUTPUT)arch/loongarch/include/generated/asm
-header := $(out)/syscalls.c
-incpath := $(srctree)/tools
-sysdef := $(srctree)/tools/arch/loongarch/include/uapi/asm/unistd.h
-sysprf := $(srctree)/tools/perf/arch/loongarch/entry/syscalls/
-systbl := $(sysprf)/mksyscalltbl
-
-# Create output directory if not already present
-$(shell [ -d '$(out)' ] || mkdir -p '$(out)')
-
-$(header): $(sysdef) $(systbl)
-	$(Q)$(SHELL) '$(systbl)' '$(CC)' '$(HOSTCC)' $(incpath) $(sysdef) > $@
-
-clean::
-	$(call QUIET_CLEAN, loongarch) $(RM) $(header)
-
-archheaders: $(header)
diff --git a/tools/perf/arch/loongarch/entry/syscalls/Kbuild b/tools/perf/arch/loongarch/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..9a41e3572c3afd4f202321fd9e492714540e8fd3
--- /dev/null
+++ b/tools/perf/arch/loongarch/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls b/tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..47d32da2aed8d67a7ac026271600e84723031a6b
--- /dev/null
+++ b/tools/perf/arch/loongarch/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_64 +=
diff --git a/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl b/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl
deleted file mode 100755
index c10ad3580aef25e48ff0682eca4217cbafdfa333..0000000000000000000000000000000000000000
--- a/tools/perf/arch/loongarch/entry/syscalls/mksyscalltbl
+++ /dev/null
@@ -1,45 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-#
-# Generate system call table for perf. Derived from
-# powerpc script.
-#
-# Author(s):  Ming Wang <wangming01@loongson.cn>
-# Author(s):  Huacai Chen <chenhuacai@loongson.cn>
-# Copyright (C) 2020-2023 Loongson Technology Corporation Limited
-
-gcc=$1
-hostcc=$2
-incpath=$3
-input=$4
-
-if ! test -r $input; then
-	echo "Could not read input file" >&2
-	exit 1
-fi
-
-create_sc_table()
-{
-	local sc nr max_nr
-
-	while read sc nr; do
-		printf "%s\n" "	[$nr] = \"$sc\","
-		max_nr=$nr
-	done
-
-	echo "#define SYSCALLTBL_LOONGARCH_MAX_ID $max_nr"
-}
-
-create_table()
-{
-	echo "#include \"$input\""
-	echo "static const char *const syscalltbl_loongarch[] = {"
-	create_sc_table
-	echo "};"
-}
-
-$gcc -E -dM -x c -I $incpath/include/uapi $input \
-	|awk '$2 ~ "__NR" && $3 !~ "__NR3264_" {
-		sub("^#define __NR(3264)?_", "");
-		print | "sort -k2 -n"}' \
-	|create_table
diff --git a/tools/perf/arch/loongarch/include/syscall_table.h b/tools/perf/arch/loongarch/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..9d0646d3455cdaf1a3db8c8565af8eba9a8df8c6
--- /dev/null
+++ b/tools/perf/arch/loongarch/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscall_table_64.h>
diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index b7c0a4b9245a94b3b245fea59af79081b1f91081..3001386e13a502be5279aa6e4742af0b96202b35 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -30,10 +30,6 @@ static const char *const *syscalltbl_native = syscalltbl_powerpc_32;
 #include <asm/syscalls_n64.c>
 const int syscalltbl_native_max_id = SYSCALLTBL_MIPS_N64_MAX_ID;
 static const char *const *syscalltbl_native = syscalltbl_mips_n64;
-#elif defined(__loongarch__)
-#include <asm/syscalls.c>
-const int syscalltbl_native_max_id = SYSCALLTBL_LOONGARCH_MAX_ID;
-static const char *const *syscalltbl_native = syscalltbl_loongarch;
 #elif defined(GENERIC_SYSCALL_TABLE)
 #include <syscall_table.h>
 const int syscalltbl_native_max_id = SYSCALLTBL_MAX_ID;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

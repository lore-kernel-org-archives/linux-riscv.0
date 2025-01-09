Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1B1E77199
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 02:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c43yG7gocs40jTgvbywdSEIY6Se9u3Wg2MwCaZFpYmk=; b=pgyyVTTaQMdSZj
	rEI7VjcSibWsd1fc4oL5b1Cd1teNaIhWFcFv6RBPkGW/3TVnCU12+r7niOJDLENVD00a1NbgXalhx
	N9g2jgSIeWOB8PKKq0Gg0dL+tcGV54T8Yfrr83iRuWhGG2rHe9FtRIlTzt+ir+J/e9ZDDoWdJSpt1
	JAr32DO0V8YcCWn3huaPajM69+PX2ncwLlKW4qg2/3Tan4Jrgl33c9sK5RB5RyrOjuCpJlmDpjV/T
	Sn179crc01kuGNa8uJ6dDVs5ZP5jEXJjudTrebEVHmAVzQlfVmYRa00V+MU4t0jQDYZ/W8gj6Y0Xl
	jMlRqiydz7R7uIkmTOEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVifJ-0000000AWPz-1gzg;
	Thu, 09 Jan 2025 02:52:57 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tViQ2-0000000ASVu-0WBr
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 02:37:11 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso767192a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jan 2025 18:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736390229; x=1736995029; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8uNJ/vXA7NGF0yxSiSP2RkC1jPs5fLciqUxBAB6Mg4=;
        b=Q39DDgU0HehtDi0+A8VxQr8+vlRO2cjKABODvrpOoBUJwe6v6W45f4Fu1FAlr/T9NG
         M90B3gvk9sQCaoKpNP1yFA9BPpjAUWDl9aVf0zxwzuwlaJVj+1f3C7P7YPTuKkLykvDz
         3wZpHlZFAQny5AjY3S3sYTvJFgdfKZEPnbgRWZqUXLRJWTFRavR6ABuU8Ut+98Py8mqW
         8du+G1gOd6pzceZhMoZQzpYzM0hbfBe9LhKWY9x5kG6Kw9bf1Gnr0loU0+qJYD7bPBpV
         f2kaPimJ4qRQ0VoT6BpvlFMd4Ki1BecXcMd13S9DXtEp2eE/F6R4AOOkh2pXPhFlyLXz
         mBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736390229; x=1736995029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8uNJ/vXA7NGF0yxSiSP2RkC1jPs5fLciqUxBAB6Mg4=;
        b=Kqv2GgAUkjsNJBKcZB6peROrpxYJowIKoAQU0RdZmjM+qkLTzmbw2/OAt+IcXAEj68
         oheSziQqNflj6eGA5yMS+gyVUj86oysYEMHYJqR1w4CXTTye63O2GEdg8/WQ3bmOnX/w
         znGxSIIWZkRvWaLCymRw0bW20U1RhoPF5FyuPDG89LReqXswvbwp46nWfH9mND0WBBoc
         rIyUfRqc4YkfWn1crDylLF+0vzCw5w0/BnGJ54/nrrDEPxBH4VD93/MFGw8oJGV81OHB
         sRbroUbz5uI+HDXb8me/slhcgkKvPNzpwoxhP7EHwuXFHPGIgs8vNOH3E7i+iQTYgZaV
         Y9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXfZ3Wwe/HjKeex0wygy9eM5CVzbmuBgwedh32v9d2rwqo/FO0T/KDHDZ8bRKCJH8pIDgF3Rlr1EWOarw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/PmWSp/FdmBIOK6pnsDDDUubf4OfFSFy3l0tEmCcHPbuGzMAj
	gBnBAVXdB9kKv5X3rBN8f+2kBuBgGSponYidJJf/UdJisl7K4pPBcs1E/UxFAyw=
X-Gm-Gg: ASbGncuVQ8QfmFx+2cwvL4ljcrBqS9BeKY1BuiiZHcLQQQL/bllQt3/7MghWhCXVoGl
	8TXtxEPhOtCkcVhDBUHBqpxuLDD9ShMrCR7u+Ge2kyHwZdAw65P3eF9F1/6qt3eO/cMV5jCDNtn
	oxgnHqcubn/028Tq5hOHVq53UaR0e53iDxonHCmgyE56pKKFWbm3wz9MbewdIQ4d7RFO+gWnUvs
	Xys6AjteD8Sy3+7s/oPOWcOctyRs/d+1CPtvxDuTKktVwneMVSf0o/MZyxWz5R0esExM8bk
X-Google-Smtp-Source: AGHT+IGVzuij+AKiFn6JZ/AhNKkDrzNH0Ndanr6WScQLIgsjOR9DqwmkL0oU+ZNwTPU4nKFihV6eJw==
X-Received: by 2002:a17:90b:2e0b:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-2f548ea07d8mr7124415a91.6.1736390229221;
        Wed, 08 Jan 2025 18:37:09 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9176bed6sm1434365ad.12.2025.01.08.18.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 18:37:08 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 08 Jan 2025 18:36:28 -0800
Subject: [PATCH v6 13/16] perf tools: mips: Use generic syscall scripts
MIME-Version: 1.0
Message-Id: <20250108-perf_syscalltbl-v6-13-7543b5293098@rivosinc.com>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
In-Reply-To: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
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
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5143; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=1DxWrtrDP0aS/Gfe9epTRxAlgriq5hGWv0IFvaoNd/w=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3q9md7W00duOmWFLr12xKZyhs8KW/ZH1Zd1NdcdrvCYb
 cuSNTGko5SFQYyDQVZMkYXnWgNz6x39sqOiZRNg5rAygQxh4OIUgIn0bGH4n97N/vg+xwXHJm6m
 L2wzxDw25bEqd7/8dCN7WUs2h/DFdkaGzh73v3MtkmLNQ84Jt7rEf3DftWTO6q2fOCKyNry/t2c
 HDwA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_183710_160733_F1A19F2F 
X-CRM114-Status: GOOD (  14.96  )
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

Use the generic scripts to generate headers from the syscall table for
mips.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                         |  3 +-
 tools/perf/Makefile.perf                           |  2 +-
 tools/perf/arch/mips/entry/syscalls/Kbuild         |  2 ++
 .../arch/mips/entry/syscalls/Makefile.syscalls     |  5 ++++
 tools/perf/arch/mips/entry/syscalls/mksyscalltbl   | 32 ----------------------
 tools/perf/arch/mips/include/syscall_table.h       |  2 ++
 tools/perf/util/syscalltbl.c                       |  4 ---
 7 files changed, 11 insertions(+), 39 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 8b0595da9402c7d69aef1e120e815d320ecf006c..e053a2304f40f6cd06a9fd022ba863b5bf2efa5e 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -31,7 +31,7 @@ $(call detected_var,SRCARCH)
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc s390 mips))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc s390))
     NO_SYSCALL_TABLE := 0
   endif
 
@@ -95,7 +95,6 @@ ifeq ($(ARCH),s390)
 endif
 
 ifeq ($(ARCH),mips)
-  CFLAGS += -I$(OUTPUT)arch/mips/include/generated
   ifndef NO_LIBUNWIND
     LIBUNWIND_LIBS = -lunwind -lunwind-mips
   endif
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 558f1425a09d536c3b85798840e173067c3da463..84d23f147365d5a57c83fe16a2faedf45f4e2f70 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch
+generic_syscall_table_archs := riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips
 ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
diff --git a/tools/perf/arch/mips/entry/syscalls/Kbuild b/tools/perf/arch/mips/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..9a41e3572c3afd4f202321fd9e492714540e8fd3
--- /dev/null
+++ b/tools/perf/arch/mips/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_64.h
diff --git a/tools/perf/arch/mips/entry/syscalls/Makefile.syscalls b/tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..9ee914bdfb05860fdd37a49f1ced03fcf2c9ed78
--- /dev/null
+++ b/tools/perf/arch/mips/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_64 += n64
+
+syscalltbl = $(srctree)/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
diff --git a/tools/perf/arch/mips/entry/syscalls/mksyscalltbl b/tools/perf/arch/mips/entry/syscalls/mksyscalltbl
deleted file mode 100644
index c0d93f959c4e1b8c12edcb5624bbc131231df7e3..0000000000000000000000000000000000000000
--- a/tools/perf/arch/mips/entry/syscalls/mksyscalltbl
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-#
-# Generate system call table for perf. Derived from
-# s390 script.
-#
-# Author(s):  Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
-# Changed by: Tiezhu Yang <yangtiezhu@loongson.cn>
-
-SYSCALL_TBL=$1
-
-if ! test -r $SYSCALL_TBL; then
-	echo "Could not read input file" >&2
-	exit 1
-fi
-
-create_table()
-{
-	local max_nr nr abi sc discard
-
-	echo 'static const char *const syscalltbl_mips_n64[] = {'
-	while read nr abi sc discard; do
-		printf '\t[%d] = "%s",\n' $nr $sc
-		max_nr=$nr
-	done
-	echo '};'
-	echo "#define SYSCALLTBL_MIPS_N64_MAX_ID $max_nr"
-}
-
-grep -E "^[[:digit:]]+[[:space:]]+(n64)" $SYSCALL_TBL	\
-	|sort -k1 -n					\
-	|create_table
diff --git a/tools/perf/arch/mips/include/syscall_table.h b/tools/perf/arch/mips/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..b53e31c15805319a01719c22d489c4037378b02b
--- /dev/null
+++ b/tools/perf/arch/mips/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_64.h>
diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index 3001386e13a502be5279aa6e4742af0b96202b35..675702d686d0d1b53dd3ee2017cc9695686b9c63 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -26,10 +26,6 @@ static const char *const *syscalltbl_native = syscalltbl_powerpc_64;
 #include <asm/syscalls_32.c>
 const int syscalltbl_native_max_id = SYSCALLTBL_POWERPC_32_MAX_ID;
 static const char *const *syscalltbl_native = syscalltbl_powerpc_32;
-#elif defined(__mips__)
-#include <asm/syscalls_n64.c>
-const int syscalltbl_native_max_id = SYSCALLTBL_MIPS_N64_MAX_ID;
-static const char *const *syscalltbl_native = syscalltbl_mips_n64;
 #elif defined(GENERIC_SYSCALL_TABLE)
 #include <syscall_table.h>
 const int syscalltbl_native_max_id = SYSCALLTBL_MAX_ID;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E1DE7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 02:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ieIzw4gmmuz6BK3S3+OGpQQ75TbWvxesPFfFysc7sgs=; b=K5ssEo9W8zkrmb
	uBaShsIX+nvdoy52RWO5PXVZRXgDD9hjganRxlK8bnK6EgsV+bE5cYcJS7o/QKN5iwqGvd2Dbgotr
	hEksqq1bivCCkvsTXfSbxnHKSc7ZtajU2IVN9vBDdk36uE//wSjP7jpaAr+YYL6FIocb9u0xA8Uas
	dDqJixHfTSOvTZsINh+x5Su7JVrJ3Km9BQmxpMq9P4dtf64U7HadQ2yt/+jdAiJoQPMcm67Y3+BUu
	vXj0LVEa3zw0x7S1nKNypkeJjAT73llS7rmBR7pM0idhFSmii1J2/Xta12c4Nd+eqrZryriQvhIcz
	YD19GOJDOHctKAI4y1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLuyp-00000002Sai-3DEn;
	Fri, 13 Dec 2024 02:00:35 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtck-00000002IGn-2gbe
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 00:33:44 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so950701a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 16:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734050022; x=1734654822; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2idtNdPI7nInDelrf+RzTQSMc2p9eCa1XxS9I9D/38=;
        b=y1PTd5IRdwWYWn7xOSGZ6rg+LnB4samF+uhPQID3/b/WiK9l3ZxrUhW3HVnLnTh+J9
         fKqIwybN79gQ2qzoaCwsyaXjbyQYWXrIxLTcpYs0PjZOUsGxtI36z88ghrMgutsI6apb
         VwCV9c04mxKhUoKwUB0tcBx6tSwSKPN8EAlzctOqe5INFkg7YQE4vIX7UTaTULE1k0/k
         WVM42IHXnbG2OzaRh7/i70EwNYh0ChKz0dkhe4YUamuT5LKFRyjd/EzrV5qldBXZ/Cim
         fxBA0ihtSrUpseGjxc1rXUCC1TR6hK7wYT40Rmf7Fe1mUCBa6NaBmVxU0tQUDNyGvFET
         FOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734050022; x=1734654822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2idtNdPI7nInDelrf+RzTQSMc2p9eCa1XxS9I9D/38=;
        b=ZyY5JsQw4lNwmXYpCLFrAR2lG28VH/erESxCY47aG48HnqHir1e4Y9dhWbTf0RzOmQ
         fgcBd2HxJr0LUyZmPbQTVHmijNp+f0gEhZhkCBohdsgJm18Rsv3t/1nYWB0lZQ4O/Pxy
         G5MzoMFs7nqJN5sE8zP++xO/pGn0dIXARDvEcX5tikhCFWkGhPpUyR0khZoydBxAzsQT
         GABh4q8t6cHxWqH/ri2Yc/xakezSyEPoBcC+n4fHAstyO+5YTKaU5VeSPRvUeTbz/Vlz
         EVnGPwL95VzRMcIwEkGeJ4iRX7nYNO3uSXIkjzZHcqk64PkXHtZGGGt3UefO3XSAXnDW
         NMZg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Ox/j0yN0eD+HLwI76jxKr+CMvhtFjNNBGM3zZr2NcuQW9yOMlKxq8sjetN0WlGgcXSjOQx0d9aOXow==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF4+KhrAUNEELtuF1CPRh88V6LGCjvsgkfh56Z3+/O6Bnr7CFe
	a4/zXxsNdb9IOrVYV1aGAPcyqVvKQzWadzkHzPDABCk01u+YWeP70cszsk3I5Ms=
X-Gm-Gg: ASbGncu/G+I0nGe/pN8xbJ8gZiJLCOxGbOSXF57n6Fia95hj3DHAiuPKMF7cpOpgoOu
	d7YkMiRcSS0DY0etVd4NdRrRVsJzj6Gqx7/S5o0cspS4Yyc7fzOKTElrCl0n6wHtQ2tEzJw2AQy
	vXPpM63FE2g6c+mAKjMVGxAZzCZRXEQWuygXfcGelhutx0p3f0eujLTgS6ADwXW56X/XRZ5nhPr
	4nqlLGxWBvXskjHq0G1tX30sHtRaGKI/Pom+ngf31iAAPGdCxx44eguVWnhkd6ex9qS/wys
X-Google-Smtp-Source: AGHT+IF6BURL1n4KGxBBXYaFHFvEAEgkwIEbZP9XzYad/neAWQoyVE5vKYzrvukdADh1RKZudrbbcA==
X-Received: by 2002:a17:90b:2f8d:b0:2ee:cd83:8fe7 with SMTP id 98e67ed59e1d1-2f2901b268bmr1191557a91.35.1734050021702;
        Thu, 12 Dec 2024 16:33:41 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142e0ce50sm1934462a91.39.2024.12.12.16.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:33:40 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 12 Dec 2024 16:33:03 -0800
Subject: [PATCH v2 13/16] perf tools: mips: Use generic syscall scripts
MIME-Version: 1.0
Message-Id: <20241212-perf_syscalltbl-v2-13-f8ca984ffe40@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5531; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=8jL6WlIkbrQRkhOaXlyZOazSVy7Wwmif0Dswgn5tqQU=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3p0wwFOt/4g6/kMAhbTf/8p13DiuffjIdMmf8fMKR5qZ
 SlxdVkdpSwMYhwMsmKKLDzXGphb7+iXHRUtmwAzh5UJZAgDF6cATGSvFiPD212lr27ftpdsPifR
 Ef5Q+pvhdVM5l8BJ7wXVKuY0xcw9zPC/sO3c7qj53Gbyb47WB7C1z36z1awvRqT10478lo3GiT8
 ZAA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_163342_672856_BE328E48 
X-CRM114-Status: GOOD (  14.74  )
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
 tools/perf/Makefile.config                         |  5 ++--
 tools/perf/Makefile.perf                           |  2 +-
 tools/perf/arch/mips/entry/syscalls/Kbuild         |  2 ++
 .../arch/mips/entry/syscalls/Makefile.syscalls     |  5 ++++
 tools/perf/arch/mips/entry/syscalls/mksyscalltbl   | 32 ----------------------
 tools/perf/arch/mips/include/syscall_table.h       |  2 ++
 tools/perf/util/syscalltbl.c                       |  4 ---
 7 files changed, 12 insertions(+), 40 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 84ed266ce54f5291af5c59c02ccb06bfe17d840f..09c4bb713648a9ca3c5223910bd7634fe8234e52 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -31,12 +31,12 @@ $(call detected_var,SRCARCH)
 ifneq ($(NO_SYSCALL_TABLE),1)
   NO_SYSCALL_TABLE := 1
 
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc s390 mips))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),powerpc s390))
     NO_SYSCALL_TABLE := 0
   endif
 
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips))
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)/tools/perf/arch/$(SRCARCH)/include/generated
@@ -83,7 +83,6 @@ ifeq ($(ARCH),s390)
 endif
 
 ifeq ($(ARCH),mips)
-  CFLAGS += -I$(OUTPUT)arch/mips/include/generated
   LIBUNWIND_LIBS = -lunwind -lunwind-mips
 endif
 
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 7fefeea1799231af61e77c9372318e025bed078a..b5a5f04a373e174269fe5ae8a7e8707e0b7e5835 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch))
+ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky arm sh sparc xtensa x86 alpha parisc arm64 loongarch mips))
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
 include Makefile.config
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

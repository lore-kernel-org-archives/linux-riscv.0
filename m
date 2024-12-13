Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81993E77182
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 01:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=437Cr1ACQ96sgJ8LdsDVxZglu2CUZFvh6tDoQZlalMA=; b=Pbs3E52kLT3xS5
	OQWpvkTJiCtZ9a+797NZ1FHQi/4J+ZR9a1+lp2VT3WTg5QWvMITZR/4zEeasoWDzJAkEHoreg90c5
	PKJLpDSUkBl0r8De/dWyWIlXiHNb4dueOKowZHF0heeL067G8CKlH+oc+n7LlJVUQsbR8P7nVILVb
	bixMbCk5E6Vtj3QIMBBSGBa2UWtygpQAOjS6xANxbCLbMPccA6VwrwI9ItDu7GyLiko7L2X0xD/UE
	QHG0xVbVI+TeV5qtq58/wsarPdNdewNunWa63id1QLsIvEIiw9/4IkYk/ImxBBELUVEbt5RSE2BeG
	aISgGSDbV+XvNwtbTxgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLukJ-00000002RAy-1pgz;
	Fri, 13 Dec 2024 01:45:35 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLtcK-00000002HzA-3Mnm
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 00:33:18 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so1017223a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 16:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734049996; x=1734654796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rp8FO0OCSZ/qUCDzOjOMxVbbH2AtMi4o4J4InXgU+q8=;
        b=cZvD9q3j+ZDsjbqxc7kjoRRcfsWK4kAr9ickamG3DEJ7RpT0RYI2KyhlPpfqqhMhaI
         8ippQHaVzwnGC/E10128A6A7dCmSeadIK6koEwW+GlNFz8gLeFgTPjsiMXpLk1EBiJHK
         WUJGjXiGg80mdv+ifqzNOHOZNVuU0lAFj5oY97W7ET4C8/OB5oEQ4a/20ai7J4KEiE6l
         awrbbUPg1mv2fyReYTDcPInltcA3dZWrKe772GD6teFCzZzzP5HABZdIdQnZ+5grdz9L
         k82dYx4OoIt66H5rOecwSeJH/Bxzm3rg0+fn/bYDAl9DhM2O9G79lpBvIryXUDJGnLVe
         ALGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734049996; x=1734654796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rp8FO0OCSZ/qUCDzOjOMxVbbH2AtMi4o4J4InXgU+q8=;
        b=gDOKH4bnKpITL4B8eMsNbo/q24ICNTjMR7vNZ7PhQvrouJccyoHw+1h1L6aZBaXzYw
         LnpR4rFci1U7qBeVT/hizs3I7YrNqtpuBv7vtzHICZEItcK2Eo9T1GFOwF0J8RhTGmiN
         rIj/Ycn8szZPNM7da/3LMg7kdyKJoARi7L7XtWkZKdDVio1rtJFqFyyWN2pNNqN9RHeF
         /bcR34giZF1pffmgqDwx+qR0HgBsXD+97XDs6Tn8C9TXP2c/Yny7mUrw4ABC5RtJZTGZ
         Uq2fYznJhhkZI3+/VYKOWX+lAPQ7O4U4DfVYekwoL+6OxJJwlgxqAXXBYCP8j0eO3+jh
         5RwA==
X-Forwarded-Encrypted: i=1; AJvYcCXz9QVVY3NAL0/b/Krm2exfLLtvGNsPsjlmmOzaiWo2fa8qWmCEU6lTldsi+eMYpAvxO/gpJZryRtZ8dA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn0QFgeh8sRdjMu+MnJ20JN0RnKOxaYH6fMiy72C50JsKGZPvf
	R4/VsYP7SF75icHZjvgL1Zdk53Z6iNxTTlurjc1PDaQBllZfPusjDfSyjYT39iY=
X-Gm-Gg: ASbGncuT/Y2arVM+N/RP0aY/jVFYI/cH+RlTaZtG/nQiHieI8BZT4UASh4zIqWjJRX4
	LFqmHByFYr2Yb140r6uzMF8PQSL9W3ohZJ145ejmx0A2CGGrbDgCxnpya3VESwgbRzBZf0LoLCV
	fXzTiYx9h0x1zQrh07/RZ0VO6a/i0GBbIsVc8dcSlATp/3SGlp6R4TCIDJN/eE6f8QgjhGyBFwN
	MGTFFE3PYYB+jaP+JyUj3MgeY4jtNSvLv5543sBoDgYBWu4aVONO1zJjc/6pFwwPfzqCh8u
X-Google-Smtp-Source: AGHT+IG4gRsZLG4Vx2a1/zZIKlGxZhkfrJbfitUgDX8Uz2b6ouZp8VypnAWgqiCZsMeD1Is8X9jPmw==
X-Received: by 2002:a17:90b:4a04:b0:2ea:3d2e:a0d7 with SMTP id 98e67ed59e1d1-2f28fb67655mr1250703a91.15.1734049995974;
        Thu, 12 Dec 2024 16:33:15 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142e0ce50sm1934462a91.39.2024.12.12.16.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 16:33:15 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 12 Dec 2024 16:32:53 -0800
Subject: [PATCH v2 03/16] perf tools: csky: Support generic syscall headers
MIME-Version: 1.0
Message-Id: <20241212-perf_syscalltbl-v2-3-f8ca984ffe40@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2834; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=s+YOevH5qJpXQeBMeav5HfEhx0qMLUBz1Ow99oWav84=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3p0w967bHUGluV/JWs/VJgacMaueH7pVN/r1WWOmRVbW
 yJiw191lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMBHFOkaG90lu90Vq035fnTjJ
 XfEzd/a/jKDIJxaK19sYPf9kMSjdYvifO7dMZILE251LdOYfVm4MklfMfhnaeM7s/SK92aqF0zK
 5AQ==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_163316_839718_5639EC6E 
X-CRM114-Status: GOOD (  13.45  )
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

csky uses the generic syscall table, use that in perf instead of
requiring libaudit.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                            | 2 +-
 tools/perf/Makefile.perf                              | 2 +-
 tools/perf/arch/csky/entry/syscalls/Kbuild            | 2 ++
 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls | 3 +++
 tools/perf/arch/csky/include/syscall_table.h          | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 3959a9c9972999f6d1bb85e8c1d7dc5dce92fd09..6fcaa051a47621b818b4c9d967eeed050056e400 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -36,7 +36,7 @@ ifneq ($(NO_SYSCALL_TABLE),1)
   endif
 
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))
+  ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky))
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)/tools/perf/arch/$(SRCARCH)/include/generated
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 3b463b42b0e3982e74056e672b2ee6adad5a3f0e..407f589046e032c4103c3b6b82c9d044560c5bac 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc))
+ifeq ($(SRCARCH),$(filter $(SRCARCH),riscv arc csky))
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
 include Makefile.config
diff --git a/tools/perf/arch/csky/entry/syscalls/Kbuild b/tools/perf/arch/csky/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..11707c481a24ecf4e220e51eb1aca890fe929a13
--- /dev/null
+++ b/tools/perf/arch/csky/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..ea2dd10d0571df464574a9c0232ada0ac1f79a3f
--- /dev/null
+++ b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += csky time32 stat64 rlimit
diff --git a/tools/perf/arch/csky/include/syscall_table.h b/tools/perf/arch/csky/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..4c942821662d95216765b176a84d5fc7974e1064
--- /dev/null
+++ b/tools/perf/arch/csky/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_32.h>

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

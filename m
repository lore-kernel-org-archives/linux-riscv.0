Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C50E77199
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 02:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqknOje8nRZLpI5HaV27AQ0iKfYgeu9dypBSNFaT8lg=; b=MAomNHeW1XJ0UW
	LiZo74+8V+Pb2yzkKQ0nhTm2lgJHXpgTIr2JKxS6rv3v3X9a5Lfbuw5nfvuwwn4xcxFUMJ0RxNdpt
	686IP+mAFTlKGmIfPLgo7YE/EWjRe8qAGKK0t8RoC6z7kAuGpUt56Igxgpdniwxz2k//MFdeZ1j5s
	2LuyPUAZjmfupLDXZnZFAcNBBItvPzTuFQrb5qjvnOVlJTSE4+6IBv+8x+yDmP6foehJMS7bPYlDM
	UIW/JS8Hw6DDhN1Aezvu6hu1KB5+o3Hl009DMg2OcUYO5GjRGYS4oy5oagfznpqQfezeSdhANuASo
	/yVGLDGKviC7Lq5iNKaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLWz-00000006pc0-3y9Y;
	Wed, 08 Jan 2025 02:10:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLUT-00000006ohl-0ymE
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 02:08:15 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21654fdd5daso222436575ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jan 2025 18:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736302092; x=1736906892; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10LmYqKv19aje8sntIFV/R2i9EqxMFmjtiwpp8rrMlU=;
        b=ChggnNKffJtOWFCxrQp17Iel00+fdJ3g30penh10SL1VwnSmA0M4hU4F8EyU3emgYp
         5B/m/8qVHD7nZKmScsa3juPlCLnaQIctpFsiVTiy3kU3xBk+Jgn2UduuQO/qWaucGTVH
         ibGrjzebIDajbx9efYqmQjWCizuaPaBAlZ+N+vsP/WtFqNKZiLjjz+OPJRFLLQhv4zqO
         m3cmmIDLhysQUZBEO9J5YdeN7e7kno3BeFYjl1Sc8MBL2xyI2uq/PIc9OfIerwB3V3FO
         IwtuaJZ9+q0PcvMEyTCe87A07VmfyQTeB7HUh4CuyKYk8f/fGVhj5AHTL/1nagZu+oov
         QbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736302092; x=1736906892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10LmYqKv19aje8sntIFV/R2i9EqxMFmjtiwpp8rrMlU=;
        b=I+k38FYljumvvJMMaHRXx0NfpKPGq/1ysW6e0CsGC77oRfdJ9m5P8XgOPX1rTKfXq1
         ymSpW+0BSt5Zwf5L/e2HPc7QjZLuNVSNcjF+aJloQSsuy1VW3r8sM3U8la/I8gbc0Qpe
         ZkTGESUTymi/JIk+SDR/bIqHjwZ9fKGmp9B03K1/gGEUbbpQgXg1JJ2oMyrgGDJjqbCJ
         qIpQiq8Nb4RuW5euCnd6YQqQPpmBVWWBcyxAeIfQu1c1c1iYaNbCWE15vdqL1txhNIMS
         n+8toHgQHRTgxkwTusKj0fpN1hGZZfEJ6F03eLVaFyJK6PePyqWk2JzDS6RjtXo2ihmb
         w9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVUdCKiHZZCRr584gNz+Aw/NsUvMvjyC/FvZ1TOeanG6bCg79tKthh41JhbYa1IcE5P7XtH1LnL0yBkFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDQ2sfhbhg6uQ/eWw67tpwK1UC09xK83TjjCzIpY2Wo9GquN6k
	A93TIAedN7KjQTkcLVgjPzlkjawqxSCBmtyxvkAZdTWPqfAqd1VGzo5tTMRpxyU=
X-Gm-Gg: ASbGnctllG8a9Q+cdr1dpQ7ByzO3/Ci9V0bFRaBxgJpfBofV8/D/Jyomm+HJdCkJiPw
	yGrQuIOdkmmyHjuJeArLJLB1/MWoqCuw6DwdkqXiF4R4IPZ2YlRKApyYkB2MHvnzCAzaNlHWmYx
	GrJ1c5ZuNf040M6QC1yhuRjizG0ElvIyW4B9Aodw2Cq52UEI92kjUqq03s0GHOmY7mWx2N6MZv3
	yfUaASMq+NvPHJfYxTm7oQk2mV1WLVZiAgGbYszRJ5IIlkxOCFU26bUXb74lMy+Ib4deBy2
X-Google-Smtp-Source: AGHT+IEofSRP/rbAD1y/Csx4ENQMqaTL0WI/3zDA2H7TL6yv9dR01QAT8JELG079U4b/zZPbnpn11Q==
X-Received: by 2002:a17:902:f546:b0:216:51b0:6600 with SMTP id d9443c01a7336-21a83f691eamr17725355ad.24.1736302092587;
        Tue, 07 Jan 2025 18:08:12 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca0282fsm316662405ad.259.2025.01.07.18.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 18:08:11 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 07 Jan 2025 18:07:50 -0800
Subject: [PATCH v5 02/16] perf tools: arc: Support generic syscall headers
MIME-Version: 1.0
Message-Id: <20250107-perf_syscalltbl-v5-2-935de46d3175@rivosinc.com>
References: <20250107-perf_syscalltbl-v5-0-935de46d3175@rivosinc.com>
In-Reply-To: <20250107-perf_syscalltbl-v5-0-935de46d3175@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2826; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=In4WKSPDuGrXSsW1qi6BwC8Z5UQ8yZH/Gn59zCTgjRk=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rtPYbJF9PnLLZt76psZFr7QUrcLVOV2ddpylubxgOZk
 5KLr1p3lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMBHNTEaGrxbaUd35NzKnN99Z
 lr25n+tbUk/GlH+rxb7Xl+fO+pN4kuG/64xvX+/oLW7eunPepZM19WdDvJ+8ez3R6q3xh5vRXZJ
 H+AA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_180813_276172_894261AB 
X-CRM114-Status: GOOD (  13.81  )
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

Arc uses the generic syscall table, use that in perf instead of
requiring libaudit.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.config                           | 2 +-
 tools/perf/Makefile.perf                             | 3 ++-
 tools/perf/arch/arc/entry/syscalls/Kbuild            | 2 ++
 tools/perf/arch/arc/entry/syscalls/Makefile.syscalls | 3 +++
 tools/perf/arch/arc/include/syscall_table.h          | 2 ++
 5 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 6d66a7bad30d184d871ef85b09091e2720d09787..4e05dd2e9596e87cdd0dc91f4c5b071b4545c574 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -36,7 +36,7 @@ ifneq ($(NO_SYSCALL_TABLE),1)
   endif
 
   # architectures that use the generic syscall table scripts
-  ifeq ($(SRCARCH),riscv)
+  ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
     NO_SYSCALL_TABLE := 0
     CFLAGS += -DGENERIC_SYSCALL_TABLE
     CFLAGS += -I$(OUTPUT)arch/$(SRCARCH)/include/generated
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index bf0516e328aa4f8a251b4f3eb172fd191772b00a..44b9e33b9568f638ba12ad688833fdb661c16c16 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,8 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-ifeq ($(SRCARCH),riscv)
+generic_syscall_table_archs := riscv arc
+ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
 include Makefile.config
diff --git a/tools/perf/arch/arc/entry/syscalls/Kbuild b/tools/perf/arch/arc/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..11707c481a24ecf4e220e51eb1aca890fe929a13
--- /dev/null
+++ b/tools/perf/arch/arc/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls b/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..391d30ab7a831b72d2ed3f2e7966fdbf558a9ed7
--- /dev/null
+++ b/tools/perf/arch/arc/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += arc time32 renameat stat64 rlimit
diff --git a/tools/perf/arch/arc/include/syscall_table.h b/tools/perf/arch/arc/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..4c942821662d95216765b176a84d5fc7974e1064
--- /dev/null
+++ b/tools/perf/arch/arc/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_32.h>

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

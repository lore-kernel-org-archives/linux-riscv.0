Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D263C9830D
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 05:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/U7BI2/7TpRII5DcXMXo78mwCA0uEhgP+0ndu2pkW8=; b=E1TZXTe5ysdvyy
	XYNYuBtR5h6s+bq5EU+PFdhwy3LmtzWAOoCIyIBGNh3av8dhJJqYM5yhcLx0eOf5hP8P7TkFIsRHH
	skFskdaw4m7M6HQ1Mu1nRlLTZdhNv6ZYkmjLN2Gs+xr8Lc77Hp/rFo7RKD90W4IV5Tb9s0u+Ae6o4
	vHcKX24w2pkrMTOFNeNFTeuhJsZguauOT6FEeoR3BljQkmtaiDYDnOyffpHOj8fRFQbH37z9ci0s1
	7TBIdyUPrgImu72VPZJEt83m/bgcaqcddzJP4iUE/ETxk7fedNGxaa1H1PGFo7LOfc+nDOjwRUdaQ
	o+HPOzcpyqXREv1AC90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgytS-0000000FFeq-0dLF;
	Sat, 17 Jan 2026 05:30:38 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysc-0000000FEgJ-46jH
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:55 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-11b94abc09dso5088620c88.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 21:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627785; x=1769232585; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+mdebosKkRDkwjrbfsOd2ME6cbYys2wY/+PUeL1P9Rc=;
        b=0FWas52KmmW1YQjFGUcCpa22HsU1NhdwSjCJVkGUE7UVzzgWpoH0PPJf/wgAsUMdDK
         Yhkiz9I9reo+34yDl8tWRYs5E6fjivVrsk3ixsVfFtJyowDXKsrSHM2UL2IZHFM0vYi+
         slDoneEFazeJ/4a4vTsJtoCuU7Ecu5sWHArr1frJDWJsMmC68EMJD0GqD3Fi11j9GMp8
         tGqZXIRl0Abngjn7l50pjwXzOCIWgCAEMZfZtfRf29rLe2p4EPz9wAmrb3se21O8P1F9
         Q7BB7fcqDD9BUx03XA4y4J1O0/IeY20/2rgSKSWcAvou8zZRnY1kx9B7p3nCRL5zXsz3
         KONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627785; x=1769232585;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mdebosKkRDkwjrbfsOd2ME6cbYys2wY/+PUeL1P9Rc=;
        b=adI+mF+ZIzxSlbmd52PWnGlqleo7PrXTE9VhI78BZdy6VixCGsVlxVfayBcKLMKKFO
         CFNav6tmYonTWc2TCFkpR/syQfFYRDNwHZMfFa6aTgmpO7hom3UutN5WkPzRdeBJlu2D
         ou/P93MLJye8LfnUq3jUXaGOePN/60zrpLTrY2DtN3mG6+8QUc2lNo6l7+rUdLFhmAVk
         Q6O6SGu0fd6roXT9zmszM07Jvh5L/f5B0LCNu8SgKe7ObJ8JW9dAUyyNlL2UEm7F17MU
         tOYe8k0Qdr8aXMvYrsBfictR77VSDKL2y2KgXDkz5ywlNZaULe9QXr9L7S2YQbZtsA6L
         ZgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCo2jrIVwqrx758FH3d8NW1avwzhhlUetdl8YWPUYgpTVsAe2LDLkjZ302JlBQ4Y5Ts7dNEvlhVINk/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZd2df973Fi/N7Xe7fO42hEBJEPPeDzqDcq28qispaIPHGoWAP
	cgLpteOvXR2v3JWmWcvfRB3TWNmD+vsFJWQ1vnPRI7NzAzSe4Ll9nabZ6Y/51xfgE81rJiwkcT/
	Gw32zGyM8gA==
X-Received: from dlag22.prod.google.com ([2002:a05:701b:2516:b0:124:4ff9:fb25])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:90b:b0:119:e56c:18a0
 with SMTP id a92af1059eb24-1244a71467dmr4281835c88.8.1768627785240; Fri, 16
 Jan 2026 21:29:45 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:40 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-15-irogers@google.com>
Subject: [PATCH v1 14/23] perf dwarf-regs: Add ARM perf to dwarf register
 number mapping functions
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_212947_184539_8733F138 
X-CRM114-Status: GOOD (  19.30  )
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

These functions allow the generic initial register state code in
unwind-libdw to be used.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dwarf-regs-arch/Build         |  2 +
 .../util/dwarf-regs-arch/dwarf-regs-arm.c     | 12 ++++
 .../util/dwarf-regs-arch/dwarf-regs-arm64.c   | 12 ++++
 tools/perf/util/dwarf-regs.c                  |  6 ++
 tools/perf/util/include/dwarf-regs.h          |  3 +
 tools/perf/util/unwind-libdw-arch/Build       |  2 -
 .../util/unwind-libdw-arch/unwind-libdw-arm.c | 39 ------------
 .../unwind-libdw-arch/unwind-libdw-arm64.c    | 61 -------------------
 tools/perf/util/unwind-libdw.c                |  8 +--
 tools/perf/util/unwind-libdw.h                |  2 -
 10 files changed, 36 insertions(+), 111 deletions(-)
 create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-arm.c
 create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c
 delete mode 100644 tools/perf/util/unwind-libdw-arch/unwind-libdw-arm.c
 delete mode 100644 tools/perf/util/unwind-libdw-arch/unwind-libdw-arm64.c

diff --git a/tools/perf/util/dwarf-regs-arch/Build b/tools/perf/util/dwarf-regs-arch/Build
index 98bec0032606..3f19a9ec47c7 100644
--- a/tools/perf/util/dwarf-regs-arch/Build
+++ b/tools/perf/util/dwarf-regs-arch/Build
@@ -1,3 +1,5 @@
+perf-util-$(CONFIG_LIBDW) += dwarf-regs-arm64.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs-arm.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-csky.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-powerpc.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-x86.o
diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm.c
new file mode 100644
index 000000000000..42c6c0635612
--- /dev/null
+++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <errno.h>
+#include <dwarf-regs.h>
+#include "../../../arch/arm/include/uapi/asm/perf_regs.h"
+
+int __get_dwarf_regnum_for_perf_regnum_arm(int perf_regnum)
+{
+	if (perf_regnum < 0 || perf_regnum >= PERF_REG_ARM_MAX)
+		return -ENOENT;
+
+	return perf_regnum;
+}
diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c
new file mode 100644
index 000000000000..593ca7d4fccc
--- /dev/null
+++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-arm64.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <errno.h>
+#include <dwarf-regs.h>
+#include "../../../arch/arm64/include/uapi/asm/perf_regs.h"
+
+int __get_dwarf_regnum_for_perf_regnum_arm64(int perf_regnum)
+{
+	if (perf_regnum < 0 || perf_regnum >= PERF_REG_ARM64_MAX)
+		return -ENOENT;
+
+	return perf_regnum;
+}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index dffa0c8bdd14..c472ec5e4d1a 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -196,6 +196,12 @@ int get_dwarf_regnum_for_perf_regnum(int perf_regnum, unsigned int machine,
 	case EM_386:
 		reg = __get_dwarf_regnum_for_perf_regnum_i386(perf_regnum);
 		break;
+	case EM_ARM:
+		reg = __get_dwarf_regnum_for_perf_regnum_arm(perf_regnum);
+		break;
+	case EM_AARCH64:
+		reg = __get_dwarf_regnum_for_perf_regnum_arm64(perf_regnum);
+		break;
 	default:
 		pr_err("ELF MACHINE %x is not supported.\n", machine);
 		return -ENOENT;
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index a120c97a5fac..a52df8d1b138 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -105,6 +105,9 @@ int __get_dwarf_regnum_x86_64(const char *name);
 int __get_dwarf_regnum_for_perf_regnum_i386(int perf_regnum);
 int __get_dwarf_regnum_for_perf_regnum_x86_64(int perf_regnum);
 
+int __get_dwarf_regnum_for_perf_regnum_arm(int perf_regnum);
+int __get_dwarf_regnum_for_perf_regnum_arm64(int perf_regnum);
+
 /*
  * get_dwarf_regnum - Returns DWARF regnum from register name
  * name: architecture register name
diff --git a/tools/perf/util/unwind-libdw-arch/Build b/tools/perf/util/unwind-libdw-arch/Build
index 5b5682029953..79c3bbdc2dee 100644
--- a/tools/perf/util/unwind-libdw-arch/Build
+++ b/tools/perf/util/unwind-libdw-arch/Build
@@ -1,5 +1,3 @@
-perf-util-y += unwind-libdw-arm.o
-perf-util-y += unwind-libdw-arm64.o
 perf-util-y += unwind-libdw-csky.o
 perf-util-y += unwind-libdw-loongarch.o
 perf-util-y += unwind-libdw-powerpc.o
diff --git a/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm.c b/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm.c
deleted file mode 100644
index 56e9b5975bcc..000000000000
--- a/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm.c
+++ /dev/null
@@ -1,39 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <elfutils/libdwfl.h>
-#include "../arch/arm/include/uapi/asm/perf_regs.h"
-#include "util/unwind-libdw.h"
-#include "util/perf_regs.h"
-#include "util/sample.h"
-
-bool libdw_set_initial_registers_arm(Dwfl_Thread *thread, void *arg)
-{
-	struct unwind_info *ui = arg;
-	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
-	Dwarf_Word dwarf_regs[PERF_REG_ARM_MAX];
-
-#define REG(r) ({						\
-	Dwarf_Word val = 0;					\
-	perf_reg_value(&val, user_regs, PERF_REG_ARM_##r);	\
-	val;							\
-})
-
-	dwarf_regs[0]  = REG(R0);
-	dwarf_regs[1]  = REG(R1);
-	dwarf_regs[2]  = REG(R2);
-	dwarf_regs[3]  = REG(R3);
-	dwarf_regs[4]  = REG(R4);
-	dwarf_regs[5]  = REG(R5);
-	dwarf_regs[6]  = REG(R6);
-	dwarf_regs[7]  = REG(R7);
-	dwarf_regs[8]  = REG(R8);
-	dwarf_regs[9]  = REG(R9);
-	dwarf_regs[10] = REG(R10);
-	dwarf_regs[11] = REG(FP);
-	dwarf_regs[12] = REG(IP);
-	dwarf_regs[13] = REG(SP);
-	dwarf_regs[14] = REG(LR);
-	dwarf_regs[15] = REG(PC);
-
-	return dwfl_thread_state_registers(thread, 0, PERF_REG_ARM_MAX,
-					   dwarf_regs);
-}
diff --git a/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm64.c b/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm64.c
deleted file mode 100644
index 29b6833e036c..000000000000
--- a/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm64.c
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <elfutils/libdwfl.h>
-#include "../arch/arm64/include/uapi/asm/perf_regs.h"
-#include "util/unwind-libdw.h"
-#include "util/perf_regs.h"
-#include "util/sample.h"
-
-bool libdw_set_initial_registers_arm64(Dwfl_Thread *thread, void *arg)
-{
-	struct unwind_info *ui = arg;
-	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
-	Dwarf_Word dwarf_regs[PERF_REG_ARM64_MAX], dwarf_pc;
-
-#define REG(r) ({						\
-	Dwarf_Word val = 0;					\
-	perf_reg_value(&val, user_regs, PERF_REG_ARM64_##r);	\
-	val;							\
-})
-
-	dwarf_regs[0]  = REG(X0);
-	dwarf_regs[1]  = REG(X1);
-	dwarf_regs[2]  = REG(X2);
-	dwarf_regs[3]  = REG(X3);
-	dwarf_regs[4]  = REG(X4);
-	dwarf_regs[5]  = REG(X5);
-	dwarf_regs[6]  = REG(X6);
-	dwarf_regs[7]  = REG(X7);
-	dwarf_regs[8]  = REG(X8);
-	dwarf_regs[9]  = REG(X9);
-	dwarf_regs[10] = REG(X10);
-	dwarf_regs[11] = REG(X11);
-	dwarf_regs[12] = REG(X12);
-	dwarf_regs[13] = REG(X13);
-	dwarf_regs[14] = REG(X14);
-	dwarf_regs[15] = REG(X15);
-	dwarf_regs[16] = REG(X16);
-	dwarf_regs[17] = REG(X17);
-	dwarf_regs[18] = REG(X18);
-	dwarf_regs[19] = REG(X19);
-	dwarf_regs[20] = REG(X20);
-	dwarf_regs[21] = REG(X21);
-	dwarf_regs[22] = REG(X22);
-	dwarf_regs[23] = REG(X23);
-	dwarf_regs[24] = REG(X24);
-	dwarf_regs[25] = REG(X25);
-	dwarf_regs[26] = REG(X26);
-	dwarf_regs[27] = REG(X27);
-	dwarf_regs[28] = REG(X28);
-	dwarf_regs[29] = REG(X29);
-	dwarf_regs[30] = REG(LR);
-	dwarf_regs[31] = REG(SP);
-
-	if (!dwfl_thread_state_registers(thread, 0, PERF_REG_ARM64_MAX,
-					 dwarf_regs))
-		return false;
-
-	dwarf_pc = REG(PC);
-	dwfl_thread_state_register_pc(thread, dwarf_pc);
-
-	return true;
-}
diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
index 055dab921442..8f291f9f9469 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -292,8 +292,6 @@ static const Dwfl_Thread_Callbacks callbacks_generic = {
 	.set_initial_registers = libdw_set_initial_registers_generic,
 };
 
-DEFINE_DWFL_THREAD_CALLBACKS(arm);
-DEFINE_DWFL_THREAD_CALLBACKS(arm64);
 DEFINE_DWFL_THREAD_CALLBACKS(csky);
 DEFINE_DWFL_THREAD_CALLBACKS(loongarch);
 DEFINE_DWFL_THREAD_CALLBACKS(powerpc);
@@ -302,11 +300,7 @@ DEFINE_DWFL_THREAD_CALLBACKS(s390);
 
 static const Dwfl_Thread_Callbacks *get_thread_callbacks(const char *arch)
 {
-	if (!strcmp(arch, "arm"))
-		return &callbacks_arm;
-	else if (!strcmp(arch, "arm64"))
-		return &callbacks_arm64;
-	else if (!strcmp(arch, "csky"))
+	if (!strcmp(arch, "csky"))
 		return &callbacks_csky;
 	else if (!strcmp(arch, "loongarch"))
 		return &callbacks_loongarch;
diff --git a/tools/perf/util/unwind-libdw.h b/tools/perf/util/unwind-libdw.h
index 496e5898e7ef..fe3ae2a768ad 100644
--- a/tools/perf/util/unwind-libdw.h
+++ b/tools/perf/util/unwind-libdw.h
@@ -9,8 +9,6 @@ struct machine;
 struct perf_sample;
 struct thread;
 
-bool libdw_set_initial_registers_arm(Dwfl_Thread *thread, void *arg);
-bool libdw_set_initial_registers_arm64(Dwfl_Thread *thread, void *arg);
 bool libdw_set_initial_registers_csky(Dwfl_Thread *thread, void *arg);
 bool libdw_set_initial_registers_loongarch(Dwfl_Thread *thread, void *arg);
 bool libdw_set_initial_registers_mips(Dwfl_Thread *thread, void *arg);
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

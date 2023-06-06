Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C561C77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 01:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/pCgDa7pRTKnfyFic+I0ZPCupoalZRDxk90fvh74wk=; b=S1sCwaoujjh/ew
	BGZnY+hrErRZ3aL1jswxvl/DCuh40HjnI3GAQakRQiCnt0eQEjeKQerE9alwT5gjdwhLtqBlAOZjh
	4MpOWm/z3lgXdyQQWpc3qhonVe8pNx2hK83xamobCdj+LKV6OcC1v3rXj7bE+id/oYMFtUZmT2jBQ
	O+9Xs25fhOsqTXBytl+qyti4uSX0hV7vfky5jwTxfdquxhDfT1ZGw7wRxpSc2d8TzeVFdbjFwVXE3
	YsC/w/MyubSfeg1D/FzL8Y/YI8S7WKneLJ1VwNtHb1oNH4OJUo6vkfk4R4DBBhGLjTs9Dx2zb2dZO
	lZd3I9dvMH6e75g9SYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Lmk-00HMci-0v;
	Tue, 06 Jun 2023 01:46:58 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Lmg-00HMXz-08
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 01:46:56 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-39ab96e6aefso1621566b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 18:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686016011; x=1688608011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7kgseUXiqm8OHEmt4GpdUCX9jazYyufG5WLCKEVTEQ=;
        b=hyoeOw9HAqlYOARkWcpMVmuBrEGpMNRSAgMPNXBezgwElahnxMBhJyflBWWwoHeie5
         J3v7iNocUi0pz+7VQpPFwd3SY7AqA108vhrCUpE1xEonhGuSRKmHWmfeIUZFzNJajU6P
         9pzK45GvTdDU2KjlQ+28MFiaD4U6+hQq/XJqGqeyhLFQN0O+fwM06axopoZIyEEs3Kso
         NPCF7SK9Mhxd83bb/F3rzy7Vbs1hMbPnfLOxc78m7uZT1ou5hMLt+4tlKR0tCKo59XY2
         q5X+HvFKprS7GPvgmlHlHXcdCfdD5i81ubFi1azx/v4RGSab+Pxri3538F0zfo2kxjQS
         DQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686016011; x=1688608011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7kgseUXiqm8OHEmt4GpdUCX9jazYyufG5WLCKEVTEQ=;
        b=RJSR9pSBfyEy7BlmOukaZtWGrLUgY4wg9nhr7NEyFbwGj5TN5IC/mTdbX/Xn03R/bb
         ecVI0HHOYwrBrfYEWtr3J5k0ILw1/u6bzKmd8wtshzL8w3Z1F9maeM6maH3Tgn4VNv2/
         1VtsPIZK7GAYuf5TwhFT0TO7wPWoryKohZrBmUbE9ZvPVDq4gHuMV0p/Tr3qhGYmknFu
         +aEJapbG5+oM5mZkCb3/yWwFKu9rg8GuwAvJNCeRsezv7wI1Z53o2vlgGNuZZnkUMvW9
         nyCMh+5FNrNAmXxUkkShgbSXeWX6P5HKt7youUsBrLIo8Mb3bJPirZAbwiE0Anwr9fvW
         tjww==
X-Gm-Message-State: AC+VfDwGhFydd7Xz7PiUPRREWM83YjlukI0dCyjiooElJ92G+R2btog6
	C5E8ns6e19jY765E3viGoRW1Jw==
X-Google-Smtp-Source: ACHHUZ73zGfBNYAx6+fLOTJK5NxdyNQwuUL1qytYu6eID3sRTAVK29FbrUoVE9ImXoQjwuYYC4DROQ==
X-Received: by 2002:aca:1204:0:b0:397:fbe7:a0fb with SMTP id 4-20020aca1204000000b00397fbe7a0fbmr548006ois.18.1686016010965;
        Mon, 05 Jun 2023 18:46:50 -0700 (PDT)
Received: from leoy-huanghe.lan ([240e:389:8603:ad00:6600:a29f:6ab:1788])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902a50a00b001a64851087bsm7197805plq.272.2023.06.05.18.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 18:46:50 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>,
	Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Ivan Babrou <ivan@cloudflare.com>,
	Fangrui Song <maskray@google.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 3/6] perf unwind: Use perf_arch_reg_{ip|sp}() to substitute macros
Date: Tue,  6 Jun 2023 09:45:56 +0800
Message-Id: <20230606014559.21783-4-leo.yan@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606014559.21783-1-leo.yan@linaro.org>
References: <20230606014559.21783-1-leo.yan@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_184654_076009_5DB27199 
X-CRM114-Status: GOOD (  14.06  )
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

We use perf_arch_reg_ip() and perf_arch_reg_sp() to substitute macros
for obtaining the register numbers of SP and IP.  This modification
enables cross analysis in the unwinding, therefore, the unwinding is
not restricted to the predefined values by the macros.

Consequently, the macros LIBUNWIND__ARCH_REG_{IP|SP} are removed since
they are no longer used.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 tools/perf/util/libunwind/arm64.c        | 2 --
 tools/perf/util/libunwind/x86_32.c       | 2 --
 tools/perf/util/unwind-libdw.c           | 7 +++++--
 tools/perf/util/unwind-libunwind-local.c | 6 ++++--
 tools/perf/util/unwind.h                 | 8 --------
 5 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/tools/perf/util/libunwind/arm64.c b/tools/perf/util/libunwind/arm64.c
index 014d82159656..37ecef0c53b9 100644
--- a/tools/perf/util/libunwind/arm64.c
+++ b/tools/perf/util/libunwind/arm64.c
@@ -18,8 +18,6 @@
  * defined before including "unwind.h"
  */
 #define LIBUNWIND__ARCH_REG_ID(regnum) libunwind__arm64_reg_id(regnum)
-#define LIBUNWIND__ARCH_REG_IP PERF_REG_ARM64_PC
-#define LIBUNWIND__ARCH_REG_SP PERF_REG_ARM64_SP
 
 #include "unwind.h"
 #include "libunwind-aarch64.h"
diff --git a/tools/perf/util/libunwind/x86_32.c b/tools/perf/util/libunwind/x86_32.c
index b2b92d030aef..1697dece1b74 100644
--- a/tools/perf/util/libunwind/x86_32.c
+++ b/tools/perf/util/libunwind/x86_32.c
@@ -18,8 +18,6 @@
  * defined before including "unwind.h"
  */
 #define LIBUNWIND__ARCH_REG_ID(regnum) libunwind__x86_reg_id(regnum)
-#define LIBUNWIND__ARCH_REG_IP PERF_REG_X86_IP
-#define LIBUNWIND__ARCH_REG_SP PERF_REG_X86_SP
 
 #include "unwind.h"
 #include "libunwind-x86.h"
diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
index bdccfc511b7e..bb034438cb8f 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -153,12 +153,14 @@ static bool memory_read(Dwfl *dwfl __maybe_unused, Dwarf_Addr addr, Dwarf_Word *
 			void *arg)
 {
 	struct unwind_info *ui = arg;
+	const char *arch = perf_env__arch(ui->machine->env);
 	struct stack_dump *stack = &ui->sample->user_stack;
 	u64 start, end;
 	int offset;
 	int ret;
 
-	ret = perf_reg_value(&start, &ui->sample->user_regs, PERF_REG_SP);
+	ret = perf_reg_value(&start, &ui->sample->user_regs,
+			     perf_arch_reg_sp(arch));
 	if (ret)
 		return false;
 
@@ -236,6 +238,7 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 		.max_stack	= max_stack,
 		.best_effort    = best_effort
 	};
+	const char *arch = perf_env__arch(ui_buf.machine->env);
 	Dwarf_Word ip;
 	int err = -EINVAL, i;
 
@@ -252,7 +255,7 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 	if (!ui->dwfl)
 		goto out;
 
-	err = perf_reg_value(&ip, &data->user_regs, PERF_REG_IP);
+	err = perf_reg_value(&ip, &data->user_regs, perf_arch_reg_ip(arch));
 	if (err)
 		goto out;
 
diff --git a/tools/perf/util/unwind-libunwind-local.c b/tools/perf/util/unwind-libunwind-local.c
index 83dd79dcd597..c104e3b792c4 100644
--- a/tools/perf/util/unwind-libunwind-local.c
+++ b/tools/perf/util/unwind-libunwind-local.c
@@ -543,6 +543,7 @@ static int access_mem(unw_addr_space_t __maybe_unused as,
 		      int __write, void *arg)
 {
 	struct unwind_info *ui = arg;
+	const char *arch = perf_env__arch(ui->machine->env);
 	struct stack_dump *stack = &ui->sample->user_stack;
 	u64 start, end;
 	int offset;
@@ -555,7 +556,7 @@ static int access_mem(unw_addr_space_t __maybe_unused as,
 	}
 
 	ret = perf_reg_value(&start, &ui->sample->user_regs,
-			     LIBUNWIND__ARCH_REG_SP);
+			     perf_arch_reg_sp(arch));
 	if (ret)
 		return ret;
 
@@ -700,6 +701,7 @@ static void _unwind__finish_access(struct maps *maps)
 static int get_entries(struct unwind_info *ui, unwind_entry_cb_t cb,
 		       void *arg, int max_stack)
 {
+	const char *arch = perf_env__arch(ui->machine->env);
 	u64 val;
 	unw_word_t ips[max_stack];
 	unw_addr_space_t addr_space;
@@ -707,7 +709,7 @@ static int get_entries(struct unwind_info *ui, unwind_entry_cb_t cb,
 	int ret, i = 0;
 
 	ret = perf_reg_value(&val, &ui->sample->user_regs,
-			     LIBUNWIND__ARCH_REG_IP);
+			     perf_arch_reg_ip(arch));
 	if (ret)
 		return ret;
 
diff --git a/tools/perf/util/unwind.h b/tools/perf/util/unwind.h
index b2a03fa5289b..9f7164c6d9aa 100644
--- a/tools/perf/util/unwind.h
+++ b/tools/perf/util/unwind.h
@@ -42,14 +42,6 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 #define LIBUNWIND__ARCH_REG_ID(regnum) libunwind__arch_reg_id(regnum)
 #endif
 
-#ifndef LIBUNWIND__ARCH_REG_SP
-#define LIBUNWIND__ARCH_REG_SP PERF_REG_SP
-#endif
-
-#ifndef LIBUNWIND__ARCH_REG_IP
-#define LIBUNWIND__ARCH_REG_IP PERF_REG_IP
-#endif
-
 int LIBUNWIND__ARCH_REG_ID(int regnum);
 int unwind__prepare_access(struct maps *maps, struct map *map, bool *initialized);
 void unwind__flush_access(struct maps *maps);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

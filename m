Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51336C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 02:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVkIJLC4OoVuUce4YIC5CMMUcgBD334DI3m4MZ8jyZg=; b=iK3nHkUjrQdX2g
	Njma6d7V6/oRwjMvWIsvu6lsv3P+60tdGexgPbawAwQtgY6SJs2Jghr7zsiqnDKFIFvABKsewkKgx
	QHIcOdVUuyQEMiJcSFD4zZ9OCfMwNMqNiMuzhqgA/gwSv9SGtYkHjisher+74h4C8kkM9eVnSfXDV
	X7MZIwKBImsOpvlIa2CSAnR3w18cGBhUMPMqE9f97adb1DQz0Kf/G6skhK0KMeXBRA2xyBATZ/s6z
	hkRbRW64K74WyBYo7BqBXPTlZ3RoO/rAKMSWMwk+Gsd3N1fKmm7rwZE23+5J3SKbZVmNX21AWex91
	k3kaGBl20ypJ50yO/qQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0Clc-000VOE-1s;
	Sat, 20 May 2023 02:56:24 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0ClY-000VKL-0X
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 02:56:22 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-528dd896165so2786132a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 19:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684551378; x=1687143378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uc0lA0AW4Q3eFnWblFZp+IJC3lYp35rK+7HthCqAKBc=;
        b=oxIdU7RsJr+CzhKg2lMfRvtTTCMXBLvWLOB1cjwEpVGlsY9MuRPClI58CzjcVgH3aG
         CrhMD47stR+t54Bl8ZfpJjGVJBDvMDfvIOnO7mYN81jdRjOJ27XshayAz0N4NsnSwf0K
         7fNquZ/rDq+XiFdXg7ZDOwON+7OVJau/k6ALPMAUWz1DFQKt/MJ4c544EK9o6L6oihfA
         XKkP9UpwPVDr172d5EcfK8qynxthuKR9IevllmGDMl8dSB9NNQ7GXebIBAc+GcVaAFsf
         NK+3mVkMsC/coegKVzfiMWQW65udxiKzVxysUz5K5k795kyeTN3uN8lbULiWLAvHyycG
         xGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684551378; x=1687143378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uc0lA0AW4Q3eFnWblFZp+IJC3lYp35rK+7HthCqAKBc=;
        b=DsXoAbGrMHvAkeihbZ1nCSm4gTP0JzOhTm2pwEUPl6QRBFrBEspSkLpmxX+K4c3XuE
         g1PxtUttiHfYdJ6fKS2OerHcgE1DZrUPTwCsUM/OR/RK0cAkEQIplXTnPmwopTS4xRKu
         ErchL+rXPCxCqnN53BgVKIdNnSTzavyeHob474XhSJ+gPYrLMhgIuQi4JVLC+woJIKcI
         aFiuGF67SxNPMmRfGZl3gbHVQsOY5A6inQ/pw+e2iTeONImIUCvlmtms2eIskpIqLgfb
         TdjBnmbjN26JGDzreD0znwlYHxsBDn1hhb3M8RVQUPoCkQeyXzOezYgGSkiSWhfn3i3P
         Pagg==
X-Gm-Message-State: AC+VfDzGu98ewwub1HFwTdVI8TrmrNgeiXrkCMK8XJ9rkd6Ehbz49/Xo
	I+G6BsNOY4R0Odof4pfd6gJJ/w==
X-Google-Smtp-Source: ACHHUZ6OtWm7XeatAw76dszDrlBSRPFK3zsm7i/2RsLh1c8PCZ//JFFQM1G0YWMlx4bnl/ZpDtbitw==
X-Received: by 2002:a17:902:a706:b0:1ae:2e08:bacb with SMTP id w6-20020a170902a70600b001ae2e08bacbmr4646622plq.10.1684551378418;
        Fri, 19 May 2023 19:56:18 -0700 (PDT)
Received: from leoy-yangtze.lan ([156.59.236.113])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902d50600b001a95aef9728sm346100plg.19.2023.05.19.19.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 19:56:18 -0700 (PDT)
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
	Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Qi Liu <liuqi115@huawei.com>,
	Sandipan Das <sandipan.das@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v1 4/5] perf parse-regs: Remove PERF_REGS_{MAX|MASK} from common code
Date: Sat, 20 May 2023 10:55:36 +0800
Message-Id: <20230520025537.1811986-5-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520025537.1811986-1-leo.yan@linaro.org>
References: <20230520025537.1811986-1-leo.yan@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_195620_226661_9F5B1BA0 
X-CRM114-Status: GOOD (  15.41  )
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

The macros PERF_REGS_MAX and PERF_REGS_MASK are architecture specific,
let's remove them from the common file util/perf_regs.c.

As a side effect, the weak functions arch__intr_reg_mask() and
arch__user_reg_mask() just return zeros, every arch defines its own
functions in the 'arch' folder for returning right values.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 tools/perf/arch/arm/util/perf_regs.c     | 10 ++++++++++
 tools/perf/arch/arm64/util/perf_regs.c   |  5 +++++
 tools/perf/arch/csky/util/perf_regs.c    | 10 ++++++++++
 tools/perf/arch/mips/util/perf_regs.c    | 10 ++++++++++
 tools/perf/arch/powerpc/util/perf_regs.c |  5 +++++
 tools/perf/arch/riscv/util/perf_regs.c   | 10 ++++++++++
 tools/perf/arch/s390/util/perf_regs.c    | 10 ++++++++++
 tools/perf/arch/x86/util/perf_regs.c     |  5 +++++
 tools/perf/util/evsel.c                  |  2 +-
 tools/perf/util/perf_regs.c              |  4 ++--
 tools/perf/util/perf_regs.h              |  4 +---
 11 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/tools/perf/arch/arm/util/perf_regs.c b/tools/perf/arch/arm/util/perf_regs.c
index 37aa3a2091bd..0d669dba08c4 100644
--- a/tools/perf/arch/arm/util/perf_regs.c
+++ b/tools/perf/arch/arm/util/perf_regs.c
@@ -5,6 +5,16 @@ const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
 
+uint64_t arch__intr_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
 uint64_t arch__reg_ip(void)
 {
 	return PERF_REG_ARM_PC;
diff --git a/tools/perf/arch/arm64/util/perf_regs.c b/tools/perf/arch/arm64/util/perf_regs.c
index dbe7f00b222b..4490c1b5ea51 100644
--- a/tools/perf/arch/arm64/util/perf_regs.c
+++ b/tools/perf/arch/arm64/util/perf_regs.c
@@ -139,6 +139,11 @@ int arch_sdt_arg_parse_op(char *old_op, char **new_op)
 	return SDT_ARG_VALID;
 }
 
+uint64_t arch__intr_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
 uint64_t arch__user_reg_mask(void)
 {
 	struct perf_event_attr attr = {
diff --git a/tools/perf/arch/csky/util/perf_regs.c b/tools/perf/arch/csky/util/perf_regs.c
index d230d7e640fd..35755811316e 100644
--- a/tools/perf/arch/csky/util/perf_regs.c
+++ b/tools/perf/arch/csky/util/perf_regs.c
@@ -5,6 +5,16 @@ const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
 
+uint64_t arch__intr_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
 uint64_t arch__reg_ip(void)
 {
 	return PERF_REG_CSKY_PC;
diff --git a/tools/perf/arch/mips/util/perf_regs.c b/tools/perf/arch/mips/util/perf_regs.c
index 64882ebc9287..2d2bfbb96182 100644
--- a/tools/perf/arch/mips/util/perf_regs.c
+++ b/tools/perf/arch/mips/util/perf_regs.c
@@ -5,6 +5,16 @@ const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
 
+uint64_t arch__intr_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
 uint64_t arch__reg_ip(void)
 {
 	return PERF_REG_MIPS_PC;
diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
index c84cd79986a8..e48622d1bc59 100644
--- a/tools/perf/arch/powerpc/util/perf_regs.c
+++ b/tools/perf/arch/powerpc/util/perf_regs.c
@@ -227,6 +227,11 @@ uint64_t arch__intr_reg_mask(void)
 	return mask;
 }
 
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
 uint64_t arch__reg_ip(void)
 {
 	return PERF_REG_POWERPC_NIP;
diff --git a/tools/perf/arch/riscv/util/perf_regs.c b/tools/perf/arch/riscv/util/perf_regs.c
index 13bbddd139d0..a2aaa46ef741 100644
--- a/tools/perf/arch/riscv/util/perf_regs.c
+++ b/tools/perf/arch/riscv/util/perf_regs.c
@@ -5,6 +5,16 @@ const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
 
+uint64_t arch__intr_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
 uint64_t arch__reg_ip(void)
 {
 	return PERF_REG_RISCV_PC;
diff --git a/tools/perf/arch/s390/util/perf_regs.c b/tools/perf/arch/s390/util/perf_regs.c
index 9b2297471090..8d79f8c50f4c 100644
--- a/tools/perf/arch/s390/util/perf_regs.c
+++ b/tools/perf/arch/s390/util/perf_regs.c
@@ -5,6 +5,16 @@ const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
 
+uint64_t arch__intr_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
 uint64_t arch__reg_ip(void)
 {
 	return PERF_REG_S390_PC;
diff --git a/tools/perf/arch/x86/util/perf_regs.c b/tools/perf/arch/x86/util/perf_regs.c
index c752a6e9cba6..a7e21f2a8964 100644
--- a/tools/perf/arch/x86/util/perf_regs.c
+++ b/tools/perf/arch/x86/util/perf_regs.c
@@ -313,6 +313,11 @@ uint64_t arch__intr_reg_mask(void)
 	return PERF_REGS_MASK;
 }
 
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
 uint64_t arch__reg_ip(void)
 {
 	return PERF_REG_X86_IP;
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 356c07f03be6..bef415072a27 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -933,7 +933,7 @@ static void __evsel__config_callchain(struct evsel *evsel, struct record_opts *o
 		if (!function) {
 			evsel__set_sample_bit(evsel, REGS_USER);
 			evsel__set_sample_bit(evsel, STACK_USER);
-			if (opts->sample_user_regs && DWARF_MINIMAL_REGS != PERF_REGS_MASK) {
+			if (opts->sample_user_regs && DWARF_MINIMAL_REGS != arch__user_reg_mask()) {
 				attr->sample_regs_user |= DWARF_MINIMAL_REGS;
 				pr_warning("WARNING: The use of --call-graph=dwarf may require all the user registers, "
 					   "specifying a subset with --user-regs may render DWARF unwinding unreliable, "
diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
index 334c9a2b785d..6698b9d2b32a 100644
--- a/tools/perf/util/perf_regs.c
+++ b/tools/perf/util/perf_regs.c
@@ -12,12 +12,12 @@ int __weak arch_sdt_arg_parse_op(char *old_op __maybe_unused,
 
 uint64_t __weak arch__intr_reg_mask(void)
 {
-	return PERF_REGS_MASK;
+	return 0;
 }
 
 uint64_t __weak arch__user_reg_mask(void)
 {
-	return PERF_REGS_MASK;
+	return 0;
 }
 
 uint64_t __weak arch__reg_ip(void)
diff --git a/tools/perf/util/perf_regs.h b/tools/perf/util/perf_regs.h
index 0a1460aaad37..43b5a6d40e58 100644
--- a/tools/perf/util/perf_regs.h
+++ b/tools/perf/util/perf_regs.h
@@ -48,10 +48,8 @@ const char *__perf_reg_name_s390(int id);
 const char *__perf_reg_name_x86(int id);
 
 #else
-#define PERF_REGS_MASK	0
-#define PERF_REGS_MAX	0
 
-#define DWARF_MINIMAL_REGS PERF_REGS_MASK
+#define DWARF_MINIMAL_REGS 0
 
 static inline const char *perf_reg_name(int id __maybe_unused, const char *arch __maybe_unused)
 {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

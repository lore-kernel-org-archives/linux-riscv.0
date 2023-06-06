Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CBFC7EE2C
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 01:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgvEPno+fZtPIP9+i4dSo+Q0J9AlVy7HFAvzd2LMLek=; b=y722V4MVTa5KiQ
	atillqNv9AjQQr/d/WANCutOMLwOvF+GCntEr2hQBsdaGRSr87XOeHIlYfyeexqZdrTxcC0pWXDj8
	Dsk3gKBQ7CQZIp2qEAPs6Fc3GtxLpy0VN1YKGca8KfeMGD1875JAidn4JBGUl4x7pL9LYya3PZbGI
	yaFKwk/aK/wexoTjPdhGBLyBNU0GHDSt3FLQP7yfhro1EQ/c4SLWrD/ZAm9oyeRTvCVhBTunN1507
	+nehsQ8JSel5k3Q8oor3341ZSfWIR7GFID9bvnTiaa5XgTZQrkHvNAx9xOcVUv0R2/BPJZITe0Ahq
	vcxpyFoL3PNU2uOVQuog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ln5-00HMs4-2C;
	Tue, 06 Jun 2023 01:47:19 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ln0-00HMkW-3C
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 01:47:17 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-652699e72f7so2817091b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 18:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686016029; x=1688608029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ylfp5U+Rw+0ciEeObZVOvaNvPaHxneFv3r/KNOp+14Y=;
        b=besWrg6jIi3BU2mZQvtK9Tis0EGvn14LUAamTS8tfJqUAvVLvcXUnSm9AsGo9TU2dU
         QG9gt4IoL3XDP5kn+8dmErThJbDV0YErJzqBq9EDZEZAuy5GWcmM/wx/9Ev7FsazThoV
         NNx7YRArBJYJaAHd9mubkDW46wDzhfdAy4AxXz7G9Tg4ahjyK0u3DTKSVHW+EFnFBHb4
         fYVhT03xDeKFCcU6k6VWwxAMO/D3KjqAHNPhdJXEpNiSCOCRKmDtZRSxWwjXGnyYNXV4
         xGex9PtuPKjkVNYHESQb+aCvOeVYmDOBA+fGiwV5t6YPZ4chl40Z9fD5ufrel6vtRPjn
         +y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686016029; x=1688608029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ylfp5U+Rw+0ciEeObZVOvaNvPaHxneFv3r/KNOp+14Y=;
        b=iW03G0lLhQ5V38tUDaonW4wEd3twR93k67ejohMo4c8rWLumb7v1xcyuY3xq3QbDwG
         QcfYRlrx4ByHkCZcxwHDgRxZSvXgLZvB1URv0D3ijEzzdxKPZCUODvp7bh0/+sHTcwSP
         4gU3aTwfrna+A0yxQTWnXCzMw241TZ7vxyU5YTOUK+LG/fhv11G7651bXuTgG9qgi69B
         Q5P70ovdMkF7k28ysVzp03svQqPK0lhX4kxwHJlMGh+pVufzAQ61yIvf6mMHOyAvhYUV
         gEiWyaxBk7LSdWmndtPTxJcKWBaZqwf4gmI1uWoYiIkDTJsslV99AW9Ix1NpIVqoruKh
         4aaA==
X-Gm-Message-State: AC+VfDxmekdxcmzHj+3DlqxDB49r3g/yTwy17mhidkbLWfHYfqtvQad/
	ik8qOcjWgy0WK6D2bbMx1w+9X3YTqkqZ3VP2xuzRVAMx
X-Google-Smtp-Source: ACHHUZ5RemvveV8/HJWovfoC4uBNxGUeXiqgOI3a/RWUlgY6hK/kQsTs+NhYdXqCSS24+aVdkagBdw==
X-Received: by 2002:a05:6a20:a109:b0:113:fe95:da8c with SMTP id q9-20020a056a20a10900b00113fe95da8cmr671561pzk.14.1686016028652;
        Mon, 05 Jun 2023 18:47:08 -0700 (PDT)
Received: from leoy-huanghe.lan ([240e:389:8603:ad00:6600:a29f:6ab:1788])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902a50a00b001a64851087bsm7197805plq.272.2023.06.05.18.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 18:47:08 -0700 (PDT)
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
Subject: [PATCH v2 5/6] perf parse-regs: Remove PERF_REGS_{MAX|MASK} from common code
Date: Tue,  6 Jun 2023 09:45:58 +0800
Message-Id: <20230606014559.21783-6-leo.yan@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606014559.21783-1-leo.yan@linaro.org>
References: <20230606014559.21783-1-leo.yan@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_184715_028892_1CD1A27A 
X-CRM114-Status: GOOD (  16.03  )
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

Note, we don't need to return intr/user register masks dynamically, this
is because these two functions are invoked during recording phase but
not decoding phase, they are always invoked on the native environment,
thus we don't need to parse them dynamically.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 tools/perf/arch/arm/util/perf_regs.c       | 10 ++++++++++
 tools/perf/arch/arm64/util/perf_regs.c     |  5 +++++
 tools/perf/arch/csky/util/perf_regs.c      | 10 ++++++++++
 tools/perf/arch/loongarch/util/perf_regs.c | 10 ++++++++++
 tools/perf/arch/mips/util/perf_regs.c      | 10 ++++++++++
 tools/perf/arch/powerpc/util/perf_regs.c   |  5 +++++
 tools/perf/arch/riscv/util/perf_regs.c     | 10 ++++++++++
 tools/perf/arch/s390/util/perf_regs.c      | 10 ++++++++++
 tools/perf/arch/x86/util/perf_regs.c       |  5 +++++
 tools/perf/util/evsel.c                    |  2 +-
 tools/perf/util/perf_regs.c                |  4 ++--
 tools/perf/util/perf_regs.h                |  4 +---
 12 files changed, 79 insertions(+), 6 deletions(-)

diff --git a/tools/perf/arch/arm/util/perf_regs.c b/tools/perf/arch/arm/util/perf_regs.c
index 2833e101a7c6..d9d4777bf7f9 100644
--- a/tools/perf/arch/arm/util/perf_regs.c
+++ b/tools/perf/arch/arm/util/perf_regs.c
@@ -4,3 +4,13 @@
 const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
+
+uint64_t arch__intr_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
diff --git a/tools/perf/arch/arm64/util/perf_regs.c b/tools/perf/arch/arm64/util/perf_regs.c
index 006692c9b040..76e2e30702cd 100644
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
index 2864e2e3776d..b17fc30abb29 100644
--- a/tools/perf/arch/csky/util/perf_regs.c
+++ b/tools/perf/arch/csky/util/perf_regs.c
@@ -4,3 +4,13 @@
 const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
+
+uint64_t arch__intr_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
diff --git a/tools/perf/arch/loongarch/util/perf_regs.c b/tools/perf/arch/loongarch/util/perf_regs.c
index 2833e101a7c6..d9d4777bf7f9 100644
--- a/tools/perf/arch/loongarch/util/perf_regs.c
+++ b/tools/perf/arch/loongarch/util/perf_regs.c
@@ -4,3 +4,13 @@
 const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
+
+uint64_t arch__intr_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
diff --git a/tools/perf/arch/mips/util/perf_regs.c b/tools/perf/arch/mips/util/perf_regs.c
index 2864e2e3776d..b17fc30abb29 100644
--- a/tools/perf/arch/mips/util/perf_regs.c
+++ b/tools/perf/arch/mips/util/perf_regs.c
@@ -4,3 +4,13 @@
 const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
+
+uint64_t arch__intr_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
index 8d07a78e742a..1d264bf55955 100644
--- a/tools/perf/arch/powerpc/util/perf_regs.c
+++ b/tools/perf/arch/powerpc/util/perf_regs.c
@@ -226,3 +226,8 @@ uint64_t arch__intr_reg_mask(void)
 	}
 	return mask;
 }
+
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
diff --git a/tools/perf/arch/riscv/util/perf_regs.c b/tools/perf/arch/riscv/util/perf_regs.c
index 2864e2e3776d..b17fc30abb29 100644
--- a/tools/perf/arch/riscv/util/perf_regs.c
+++ b/tools/perf/arch/riscv/util/perf_regs.c
@@ -4,3 +4,13 @@
 const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
+
+uint64_t arch__intr_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
diff --git a/tools/perf/arch/s390/util/perf_regs.c b/tools/perf/arch/s390/util/perf_regs.c
index 2864e2e3776d..b17fc30abb29 100644
--- a/tools/perf/arch/s390/util/perf_regs.c
+++ b/tools/perf/arch/s390/util/perf_regs.c
@@ -4,3 +4,13 @@
 const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
+
+uint64_t arch__intr_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
+
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
diff --git a/tools/perf/arch/x86/util/perf_regs.c b/tools/perf/arch/x86/util/perf_regs.c
index 8ad4112ad10c..218747a8b039 100644
--- a/tools/perf/arch/x86/util/perf_regs.c
+++ b/tools/perf/arch/x86/util/perf_regs.c
@@ -317,3 +317,8 @@ uint64_t arch__intr_reg_mask(void)
 
 	return PERF_REGS_MASK;
 }
+
+uint64_t arch__user_reg_mask(void)
+{
+	return PERF_REGS_MASK;
+}
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index dfba2bc79cfc..4168996c7a02 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -878,7 +878,7 @@ static void __evsel__config_callchain(struct evsel *evsel, struct record_opts *o
 			evsel__set_sample_bit(evsel, REGS_USER);
 			evsel__set_sample_bit(evsel, STACK_USER);
 			if (opts->sample_user_regs &&
-			    DWARF_MINIMAL_REGS(arch) != PERF_REGS_MASK) {
+			    DWARF_MINIMAL_REGS(arch) != arch__user_reg_mask()) {
 				attr->sample_regs_user |= DWARF_MINIMAL_REGS(arch);
 				pr_warning("WARNING: The use of --call-graph=dwarf may require all the user registers, "
 					   "specifying a subset with --user-regs may render DWARF unwinding unreliable, "
diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
index 23584efd4886..e2275856b570 100644
--- a/tools/perf/util/perf_regs.c
+++ b/tools/perf/util/perf_regs.c
@@ -13,12 +13,12 @@ int __weak arch_sdt_arg_parse_op(char *old_op __maybe_unused,
 
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
 
 #ifdef HAVE_PERF_REGS_SUPPORT
diff --git a/tools/perf/util/perf_regs.h b/tools/perf/util/perf_regs.h
index 790c1a26bbfe..8583c52572b1 100644
--- a/tools/perf/util/perf_regs.h
+++ b/tools/perf/util/perf_regs.h
@@ -68,10 +68,8 @@ uint64_t __perf_reg_ip_x86(void);
 uint64_t __perf_reg_sp_x86(void);
 
 #else
-#define PERF_REGS_MASK	0
-#define PERF_REGS_MAX	0
 
-#define DWARF_MINIMAL_REGS(arch)	PERF_REGS_MASK
+#define DWARF_MINIMAL_REGS(arch)	0
 
 static inline const char *perf_reg_name(int id __maybe_unused, const char *arch __maybe_unused)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

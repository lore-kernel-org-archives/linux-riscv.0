Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BEDC48BC1
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 11:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMBYFBLyjWGnco2OE0eGJOSHoy/DlrfukqDMRABQNqE=; b=VjWdolMQU6G4hj
	ys0X5BvQqZJus5FIBmuMH2TTugoAEq285QutOEjxho9MikbUMvltVVzqt7cs3stUvN23JL6/SBgDI
	/FfqyXdt+26N5tIb8ANv1w1NynPSG9hKPD/XbFqrJpZRPDJOB1chDDgqZUQx8Qnyg29jdGMzPkO52
	zwkk463pSyX0hTM/bPwKigqY81iRNQBBLe5HTJ2RlTdBt/XjyVe86yz+61LKmbpsCHeb3phEoD7ci
	I4L7aJjA6BYoKVvwxNVZPa9JeIJnkCBIdGOv6hGHhRtauLTh8NnpRK/DZ8anVXQtphH9oFk1c1n7l
	R9d4OSULnzV9yqZ4lKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raDd0-0000000ChtE-04BR;
	Wed, 14 Feb 2024 11:40:38 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raDcx-0000000Chra-0uio
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 11:40:36 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1707910833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6q0ZJ+/QgkBKiu+7vLI7Vww0Q4/7AWcn0562kHI25UM=;
	b=k16JtjQ0Q0Cfr3s5i9zroS0QYD++HZIYliM0Vf8VwADRosR3o9l8gytGbENg/ogRvDx20Y
	2ZC7z2tOdU9mPIG6hl0ru8vOVRqy2xwLV+u7bGQeT9SXDGrjpnkCHUQ5q2+oS+JLH7KqYP
	U7JdUdz/pZUY23oE++pJXZyUFNzF9+0=
From: Leo Yan <leo.yan@linux.dev>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>,
	Kan Liang <kan.liang@linux.intel.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Leo Yan <leo.yan@linux.dev>
Subject: [PATCH v1 3/4] perf parse-regs: Introduce a weak function arch__sample_reg_masks()
Date: Wed, 14 Feb 2024 19:39:46 +0800
Message-Id: <20240214113947.240957-4-leo.yan@linux.dev>
In-Reply-To: <20240214113947.240957-1-leo.yan@linux.dev>
References: <20240214113947.240957-1-leo.yan@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_034035_582111_7BA5AB50 
X-CRM114-Status: GOOD (  13.70  )
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

Every architecture can provide a register list for sampling. If an
architecture doesn't support register sampling, it won't define the data
structure 'sample_reg_masks'. Consequently, any code using this
structure must be protected by the macro 'HAVE_PERF_REGS_SUPPORT'.

This patch defines a weak function, arch__sample_reg_masks(), which will
be replaced by an architecture-defined function for returning the
architecture's register list. With this refactoring, the function always
exists, the condition checking for 'HAVE_PERF_REGS_SUPPORT' is not
needed anymore, so remove it.

Signed-off-by: Leo Yan <leo.yan@linux.dev>
---
 tools/perf/arch/arm/util/perf_regs.c       | 7 ++++++-
 tools/perf/arch/arm64/util/machine.c       | 2 ++
 tools/perf/arch/arm64/util/perf_regs.c     | 7 ++++++-
 tools/perf/arch/csky/util/perf_regs.c      | 7 ++++++-
 tools/perf/arch/loongarch/util/perf_regs.c | 7 ++++++-
 tools/perf/arch/mips/util/perf_regs.c      | 7 ++++++-
 tools/perf/arch/powerpc/util/perf_regs.c   | 7 ++++++-
 tools/perf/arch/riscv/util/perf_regs.c     | 7 ++++++-
 tools/perf/arch/s390/util/perf_regs.c      | 7 ++++++-
 tools/perf/arch/x86/util/perf_regs.c       | 7 ++++++-
 tools/perf/util/parse-regs-options.c       | 8 ++------
 tools/perf/util/perf_regs.c                | 9 +++++++++
 tools/perf/util/perf_regs.h                | 3 +--
 13 files changed, 68 insertions(+), 17 deletions(-)

diff --git a/tools/perf/arch/arm/util/perf_regs.c b/tools/perf/arch/arm/util/perf_regs.c
index 2c56e8b56ddf..f94a0210c7b7 100644
--- a/tools/perf/arch/arm/util/perf_regs.c
+++ b/tools/perf/arch/arm/util/perf_regs.c
@@ -2,7 +2,7 @@
 #include "perf_regs.h"
 #include "../../../util/perf_regs.h"
 
-const struct sample_reg sample_reg_masks[] = {
+static const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
 
@@ -15,3 +15,8 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
+
+const struct sample_reg *arch__sample_reg_masks(void)
+{
+	return sample_reg_masks;
+}
diff --git a/tools/perf/arch/arm64/util/machine.c b/tools/perf/arch/arm64/util/machine.c
index ba1144366e85..aab1cc2bc283 100644
--- a/tools/perf/arch/arm64/util/machine.c
+++ b/tools/perf/arch/arm64/util/machine.c
@@ -12,5 +12,7 @@
 
 void arch__add_leaf_frame_record_opts(struct record_opts *opts)
 {
+	const struct sample_reg *sample_reg_masks = arch__sample_reg_masks();
+
 	opts->sample_user_regs |= sample_reg_masks[PERF_REG_ARM64_LR].mask;
 }
diff --git a/tools/perf/arch/arm64/util/perf_regs.c b/tools/perf/arch/arm64/util/perf_regs.c
index 1b79d8eab22f..09308665e28a 100644
--- a/tools/perf/arch/arm64/util/perf_regs.c
+++ b/tools/perf/arch/arm64/util/perf_regs.c
@@ -16,7 +16,7 @@
 #define HWCAP_SVE	(1 << 22)
 #endif
 
-const struct sample_reg sample_reg_masks[] = {
+static const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG(x0, PERF_REG_ARM64_X0),
 	SMPL_REG(x1, PERF_REG_ARM64_X1),
 	SMPL_REG(x2, PERF_REG_ARM64_X2),
@@ -175,3 +175,8 @@ uint64_t arch__user_reg_mask(void)
 	}
 	return PERF_REGS_MASK;
 }
+
+const struct sample_reg *arch__sample_reg_masks(void)
+{
+	return sample_reg_masks;
+}
diff --git a/tools/perf/arch/csky/util/perf_regs.c b/tools/perf/arch/csky/util/perf_regs.c
index c0877c264d49..6b1665f41180 100644
--- a/tools/perf/arch/csky/util/perf_regs.c
+++ b/tools/perf/arch/csky/util/perf_regs.c
@@ -2,7 +2,7 @@
 #include "perf_regs.h"
 #include "../../util/perf_regs.h"
 
-const struct sample_reg sample_reg_masks[] = {
+static const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
 
@@ -15,3 +15,8 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
+
+const struct sample_reg *arch__sample_reg_masks(void)
+{
+	return sample_reg_masks;
+}
diff --git a/tools/perf/arch/loongarch/util/perf_regs.c b/tools/perf/arch/loongarch/util/perf_regs.c
index 2c56e8b56ddf..f94a0210c7b7 100644
--- a/tools/perf/arch/loongarch/util/perf_regs.c
+++ b/tools/perf/arch/loongarch/util/perf_regs.c
@@ -2,7 +2,7 @@
 #include "perf_regs.h"
 #include "../../../util/perf_regs.h"
 
-const struct sample_reg sample_reg_masks[] = {
+static const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
 
@@ -15,3 +15,8 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
+
+const struct sample_reg *arch__sample_reg_masks(void)
+{
+	return sample_reg_masks;
+}
diff --git a/tools/perf/arch/mips/util/perf_regs.c b/tools/perf/arch/mips/util/perf_regs.c
index c0877c264d49..6b1665f41180 100644
--- a/tools/perf/arch/mips/util/perf_regs.c
+++ b/tools/perf/arch/mips/util/perf_regs.c
@@ -2,7 +2,7 @@
 #include "perf_regs.h"
 #include "../../util/perf_regs.h"
 
-const struct sample_reg sample_reg_masks[] = {
+static const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
 
@@ -15,3 +15,8 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
+
+const struct sample_reg *arch__sample_reg_masks(void)
+{
+	return sample_reg_masks;
+}
diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
index b38aa056eea0..e8e6e6fc6f17 100644
--- a/tools/perf/arch/powerpc/util/perf_regs.c
+++ b/tools/perf/arch/powerpc/util/perf_regs.c
@@ -17,7 +17,7 @@
 #define PVR_POWER9		0x004E
 #define PVR_POWER10		0x0080
 
-const struct sample_reg sample_reg_masks[] = {
+static const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG(r0, PERF_REG_POWERPC_R0),
 	SMPL_REG(r1, PERF_REG_POWERPC_R1),
 	SMPL_REG(r2, PERF_REG_POWERPC_R2),
@@ -232,3 +232,8 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
+
+const struct sample_reg *arch__sample_reg_masks(void)
+{
+	return sample_reg_masks;
+}
diff --git a/tools/perf/arch/riscv/util/perf_regs.c b/tools/perf/arch/riscv/util/perf_regs.c
index c0877c264d49..6b1665f41180 100644
--- a/tools/perf/arch/riscv/util/perf_regs.c
+++ b/tools/perf/arch/riscv/util/perf_regs.c
@@ -2,7 +2,7 @@
 #include "perf_regs.h"
 #include "../../util/perf_regs.h"
 
-const struct sample_reg sample_reg_masks[] = {
+static const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
 
@@ -15,3 +15,8 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
+
+const struct sample_reg *arch__sample_reg_masks(void)
+{
+	return sample_reg_masks;
+}
diff --git a/tools/perf/arch/s390/util/perf_regs.c b/tools/perf/arch/s390/util/perf_regs.c
index c0877c264d49..6b1665f41180 100644
--- a/tools/perf/arch/s390/util/perf_regs.c
+++ b/tools/perf/arch/s390/util/perf_regs.c
@@ -2,7 +2,7 @@
 #include "perf_regs.h"
 #include "../../util/perf_regs.h"
 
-const struct sample_reg sample_reg_masks[] = {
+static const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG_END
 };
 
@@ -15,3 +15,8 @@ uint64_t arch__user_reg_mask(void)
 {
 	return PERF_REGS_MASK;
 }
+
+const struct sample_reg *arch__sample_reg_masks(void)
+{
+	return sample_reg_masks;
+}
diff --git a/tools/perf/arch/x86/util/perf_regs.c b/tools/perf/arch/x86/util/perf_regs.c
index b813502a2727..12fd93f04802 100644
--- a/tools/perf/arch/x86/util/perf_regs.c
+++ b/tools/perf/arch/x86/util/perf_regs.c
@@ -13,7 +13,7 @@
 #include "../../../util/pmu.h"
 #include "../../../util/pmus.h"
 
-const struct sample_reg sample_reg_masks[] = {
+static const struct sample_reg sample_reg_masks[] = {
 	SMPL_REG(AX, PERF_REG_X86_AX),
 	SMPL_REG(BX, PERF_REG_X86_BX),
 	SMPL_REG(CX, PERF_REG_X86_CX),
@@ -276,6 +276,11 @@ int arch_sdt_arg_parse_op(char *old_op, char **new_op)
 	return SDT_ARG_VALID;
 }
 
+const struct sample_reg *arch__sample_reg_masks(void)
+{
+	return sample_reg_masks;
+}
+
 uint64_t arch__intr_reg_mask(void)
 {
 	struct perf_event_attr attr = {
diff --git a/tools/perf/util/parse-regs-options.c b/tools/perf/util/parse-regs-options.c
index a4a100425b3a..cda1c620968e 100644
--- a/tools/perf/util/parse-regs-options.c
+++ b/tools/perf/util/parse-regs-options.c
@@ -46,22 +46,18 @@ __parse_regs(const struct option *opt, const char *str, int unset, bool intr)
 
 			if (!strcmp(s, "?")) {
 				fprintf(stderr, "available registers: ");
-#ifdef HAVE_PERF_REGS_SUPPORT
-				for (r = sample_reg_masks; r->name; r++) {
+				for (r = arch__sample_reg_masks(); r->name; r++) {
 					if (r->mask & mask)
 						fprintf(stderr, "%s ", r->name);
 				}
-#endif
 				fputc('\n', stderr);
 				/* just printing available regs */
 				goto error;
 			}
-#ifdef HAVE_PERF_REGS_SUPPORT
-			for (r = sample_reg_masks; r->name; r++) {
+			for (r = arch__sample_reg_masks(); r->name; r++) {
 				if ((r->mask & mask) && !strcasecmp(s, r->name))
 					break;
 			}
-#endif
 			if (!r || !r->name) {
 				ui__warning("Unknown register \"%s\", check man page or run \"perf record %s?\"\n",
 					    s, intr ? "-I" : "--user-regs=");
diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
index 64724eb58dd5..44b90bbf2d07 100644
--- a/tools/perf/util/perf_regs.c
+++ b/tools/perf/util/perf_regs.c
@@ -21,6 +21,15 @@ uint64_t __weak arch__user_reg_mask(void)
 	return 0;
 }
 
+static const struct sample_reg sample_reg_masks[] = {
+	SMPL_REG_END
+};
+
+const struct sample_reg * __weak arch__sample_reg_masks(void)
+{
+	return sample_reg_masks;
+}
+
 const char *perf_reg_name(int id, const char *arch)
 {
 	const char *reg_name = NULL;
diff --git a/tools/perf/util/perf_regs.h b/tools/perf/util/perf_regs.h
index 7fd0c7b4cec1..f2d0736d65cc 100644
--- a/tools/perf/util/perf_regs.h
+++ b/tools/perf/util/perf_regs.h
@@ -26,8 +26,7 @@ enum {
 int arch_sdt_arg_parse_op(char *old_op, char **new_op);
 uint64_t arch__intr_reg_mask(void);
 uint64_t arch__user_reg_mask(void);
-
-extern const struct sample_reg sample_reg_masks[];
+const struct sample_reg *arch__sample_reg_masks(void);
 
 const char *perf_reg_name(int id, const char *arch);
 int perf_reg_value(u64 *valp, struct regs_dump *regs, int id);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

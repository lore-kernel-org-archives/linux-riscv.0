Return-Path: <SRS0=CAot=X2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962AAC32792
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2019 00:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 611DC20842
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2019 00:36:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q3T0YenX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="S6QQmPoW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 611DC20842
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vSOvcqE2AeUlszNB8YDxjjQ3WeiErpOvvLn0iBBXvJs=; b=Q3T0YenX+uXn3n
	zUHrGGdNvTO/uLkkj6T5i4jdbHexzxmzQatnWb4SL0fH72v5dMQ5NnjON1oaHrP9agxPKhDOklQ2O
	SrraO6D7cXoVqgeUjVWJ5Amm/rHJ5oGsdonK2Nzcx4cTZQNi+N6t+BCarkshnGQL71pRsCDMdm0iA
	jzTODdPnIo5LX6FqT5YspIGzwYIQ53p163OfIle73UnRFxXUMZhRJo+tWPuRMc71bXoEaJX/+K1pl
	ndhcnKZexRklO0lOTCQZniRL8XMTPYH1Ct/yK/U/OxzvcnAZq+0P03MD9ER+ud8R4LVWkgQ/ioSVy
	jIpEUl9Ri6mLM5M5L1ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iF69c-000368-0h; Tue, 01 Oct 2019 00:36:36 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iF69W-00035A-QH
 for linux-riscv@lists.infradead.org; Tue, 01 Oct 2019 00:36:35 +0000
Received: by mail-pg1-x54a.google.com with SMTP id j7so7135564pgj.5
 for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2019 17:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=oYTZkEy3W0e4PbVAv1y8KLAY8k3Oo31VP2ah/jDHFQc=;
 b=S6QQmPoWzrubPfcSOzsPiCJN+1qgZf2c+tv54+BwWz3BOhH+o6DLSk94EpJDZulwdi
 cf62/OFFED0jodTOpXul/eDJLQnhjyGlA+KVhjpWKR/LMkD1x9/W5xeg2Pu2L7y4eJjC
 828GsKA6m6lBmPEwWKFmgsUZhafbEW0Rsy8I84ZV01jVFUT7MaAE72bxo7B5RNlPvJNJ
 pn+VaqPEJ296uKcbV9RisrNjsXhcWQBD5G4ml1W09e1XL065Bqi/KerQ+/WMsEKM+0UI
 TmGQG05ckKsuBd01WE5gulVp/gi4zz09TxO6RghoTcBlNvnbBQFK7RJ/ldsT80Ch16Mk
 ps3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=oYTZkEy3W0e4PbVAv1y8KLAY8k3Oo31VP2ah/jDHFQc=;
 b=FaOenHq+zrAqIWza4zE7l0Ua9vX3dfeKYqE2hCP1fK3cbQEvcJp4h1A64PsiwId45/
 bLLF4RxY7qtGLkxjuQkyK1Gf+pglqYqmf+e2WwzAfsmPwKc0UUtm6ZI0kALtgpCzv6yl
 1M15KCqiQqjVlhpt346DX9K0SLD3R1vjAtKBa3RODWZFXiZb75/84UA040rP5WkFRvvm
 SHPsSFnWNDCsFKAE1r3Bd54n/z323g9tOAdEIUwt3g4a6zwSu9gguYs1cQzGIbV72df7
 Pq0ca8Flc1Sdtly/gj1I9gPgLS9Me6IlmElDBr3R0VFeF9umU46nFtjNT/n4ZAHSXVS0
 rbkg==
X-Gm-Message-State: APjAAAWqm4vbjpFTsNaeNBUjiHZDANoBGrtlD9nw9vlY5G2CmjnYyHok
 5E12F33F3xprWupYiCRBE/PNFz6CLt3c
X-Google-Smtp-Source: APXvYqxEf6p8EFkn50B2WuAFuiRJs9BmPF7hf7xcWLiIo8vZoaIoSfyVQqr4/mWtHqiBU295sRtCGdTmc3bu
X-Received: by 2002:a65:6102:: with SMTP id z2mr26922306pgu.391.1569890187818; 
 Mon, 30 Sep 2019 17:36:27 -0700 (PDT)
Date: Mon, 30 Sep 2019 17:36:23 -0700
In-Reply-To: <20190927214341.170683-1-irogers@google.com>
Message-Id: <20191001003623.255186-1-irogers@google.com>
Mime-Version: 1.0
References: <20190927214341.170683-1-irogers@google.com>
X-Mailer: git-send-email 2.23.0.444.g18eeb5a265-goog
Subject: [PATCH v3] perf tools: avoid sample_reg_masks being const + weak
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, 
 Namhyung Kim <namhyung@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Mao Han <han_mao@c-sky.com>, 
 Kan Liang <kan.liang@linux.intel.com>, Andi Kleen <ak@linux.intel.com>, 
 Alexey Budankov <alexey.budankov@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_173630_983232_4FE9C6E2 
X-CRM114-Status: GOOD (  15.80  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Ian Rogers <irogers@google.com>, Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Being const + weak breaks with some compilers that constant-propagate
from the weak symbol. This behavior is outside of the specification, but
in LLVM is chosen to match GCC's behavior.

LLVM's implementation was set in this patch:
https://github.com/llvm/llvm-project/commit/f49573d1eedcf1e44893d5a062ac1b72c8419646
A const + weak symbol is set to be weak_odr:
https://llvm.org/docs/LangRef.html
ODR is one definition rule, and given there is one constant definition
constant-propagation is possible. It is possible to get this code to
miscompile with LLVM when applying link time optimization. As compilers
become more aggressive, this is likely to break in more instances.

Move the definition of sample_reg_masks to the conditional part of
perf_regs.h and guard usage with HAVE_PERF_REGS_SUPPORT. This avoids the
weak symbol.

Fix an issue when HAVE_PERF_REGS_SUPPORT isn't defined from patch v1.
In v3, add perf_regs.c for architectures that HAVE_PERF_REGS_SUPPORT but
don't declare sample_regs_masks.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm/util/Build         | 2 ++
 tools/perf/arch/arm/util/perf_regs.c   | 6 ++++++
 tools/perf/arch/arm64/util/Build       | 1 +
 tools/perf/arch/arm64/util/perf_regs.c | 6 ++++++
 tools/perf/arch/csky/util/Build        | 2 ++
 tools/perf/arch/csky/util/perf_regs.c  | 6 ++++++
 tools/perf/arch/riscv/util/Build       | 2 ++
 tools/perf/arch/riscv/util/perf_regs.c | 6 ++++++
 tools/perf/arch/s390/util/Build        | 1 +
 tools/perf/arch/s390/util/perf_regs.c  | 6 ++++++
 tools/perf/util/parse-regs-options.c   | 8 ++++++--
 tools/perf/util/perf_regs.c            | 4 ----
 tools/perf/util/perf_regs.h            | 4 ++--
 13 files changed, 46 insertions(+), 8 deletions(-)
 create mode 100644 tools/perf/arch/arm/util/perf_regs.c
 create mode 100644 tools/perf/arch/arm64/util/perf_regs.c
 create mode 100644 tools/perf/arch/csky/util/perf_regs.c
 create mode 100644 tools/perf/arch/riscv/util/perf_regs.c
 create mode 100644 tools/perf/arch/s390/util/perf_regs.c

diff --git a/tools/perf/arch/arm/util/Build b/tools/perf/arch/arm/util/Build
index 296f0eac5e18..37fc63708966 100644
--- a/tools/perf/arch/arm/util/Build
+++ b/tools/perf/arch/arm/util/Build
@@ -1,3 +1,5 @@
+perf-y += perf_regs.o
+
 perf-$(CONFIG_DWARF) += dwarf-regs.o
 
 perf-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind.o
diff --git a/tools/perf/arch/arm/util/perf_regs.c b/tools/perf/arch/arm/util/perf_regs.c
new file mode 100644
index 000000000000..2864e2e3776d
--- /dev/null
+++ b/tools/perf/arch/arm/util/perf_regs.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "../../util/perf_regs.h"
+
+const struct sample_reg sample_reg_masks[] = {
+	SMPL_REG_END
+};
diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/util/Build
index 3cde540d2fcf..0a7782c61209 100644
--- a/tools/perf/arch/arm64/util/Build
+++ b/tools/perf/arch/arm64/util/Build
@@ -1,4 +1,5 @@
 perf-y += header.o
+perf-y += perf_regs.o
 perf-y += sym-handling.o
 perf-$(CONFIG_DWARF)     += dwarf-regs.o
 perf-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
diff --git a/tools/perf/arch/arm64/util/perf_regs.c b/tools/perf/arch/arm64/util/perf_regs.c
new file mode 100644
index 000000000000..2864e2e3776d
--- /dev/null
+++ b/tools/perf/arch/arm64/util/perf_regs.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "../../util/perf_regs.h"
+
+const struct sample_reg sample_reg_masks[] = {
+	SMPL_REG_END
+};
diff --git a/tools/perf/arch/csky/util/Build b/tools/perf/arch/csky/util/Build
index 1160bb2332ba..7d3050134ae0 100644
--- a/tools/perf/arch/csky/util/Build
+++ b/tools/perf/arch/csky/util/Build
@@ -1,2 +1,4 @@
+perf-y += perf_regs.o
+
 perf-$(CONFIG_DWARF) += dwarf-regs.o
 perf-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/csky/util/perf_regs.c b/tools/perf/arch/csky/util/perf_regs.c
new file mode 100644
index 000000000000..2864e2e3776d
--- /dev/null
+++ b/tools/perf/arch/csky/util/perf_regs.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "../../util/perf_regs.h"
+
+const struct sample_reg sample_reg_masks[] = {
+	SMPL_REG_END
+};
diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 1160bb2332ba..7d3050134ae0 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1,2 +1,4 @@
+perf-y += perf_regs.o
+
 perf-$(CONFIG_DWARF) += dwarf-regs.o
 perf-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/riscv/util/perf_regs.c b/tools/perf/arch/riscv/util/perf_regs.c
new file mode 100644
index 000000000000..2864e2e3776d
--- /dev/null
+++ b/tools/perf/arch/riscv/util/perf_regs.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "../../util/perf_regs.h"
+
+const struct sample_reg sample_reg_masks[] = {
+	SMPL_REG_END
+};
diff --git a/tools/perf/arch/s390/util/Build b/tools/perf/arch/s390/util/Build
index 22797f043b84..3d9d0f4f72ca 100644
--- a/tools/perf/arch/s390/util/Build
+++ b/tools/perf/arch/s390/util/Build
@@ -1,5 +1,6 @@
 perf-y += header.o
 perf-y += kvm-stat.o
+perf-y += perf_regs.o
 
 perf-$(CONFIG_DWARF) += dwarf-regs.o
 perf-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/s390/util/perf_regs.c b/tools/perf/arch/s390/util/perf_regs.c
new file mode 100644
index 000000000000..2864e2e3776d
--- /dev/null
+++ b/tools/perf/arch/s390/util/perf_regs.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "../../util/perf_regs.h"
+
+const struct sample_reg sample_reg_masks[] = {
+	SMPL_REG_END
+};
diff --git a/tools/perf/util/parse-regs-options.c b/tools/perf/util/parse-regs-options.c
index ef46c2848808..e687497b3aac 100644
--- a/tools/perf/util/parse-regs-options.c
+++ b/tools/perf/util/parse-regs-options.c
@@ -13,7 +13,7 @@ static int
 __parse_regs(const struct option *opt, const char *str, int unset, bool intr)
 {
 	uint64_t *mode = (uint64_t *)opt->value;
-	const struct sample_reg *r;
+	const struct sample_reg *r = NULL;
 	char *s, *os = NULL, *p;
 	int ret = -1;
 	uint64_t mask;
@@ -46,19 +46,23 @@ __parse_regs(const struct option *opt, const char *str, int unset, bool intr)
 
 			if (!strcmp(s, "?")) {
 				fprintf(stderr, "available registers: ");
+#ifdef HAVE_PERF_REGS_SUPPORT
 				for (r = sample_reg_masks; r->name; r++) {
 					if (r->mask & mask)
 						fprintf(stderr, "%s ", r->name);
 				}
+#endif
 				fputc('\n', stderr);
 				/* just printing available regs */
 				return -1;
 			}
+#ifdef HAVE_PERF_REGS_SUPPORT
 			for (r = sample_reg_masks; r->name; r++) {
 				if ((r->mask & mask) && !strcasecmp(s, r->name))
 					break;
 			}
-			if (!r->name) {
+#endif
+			if (!r || !r->name) {
 				ui__warning("Unknown register \"%s\", check man page or run \"perf record %s?\"\n",
 					    s, intr ? "-I" : "--user-regs=");
 				goto error;
diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
index 2774cec1f15f..5ee47ae1509c 100644
--- a/tools/perf/util/perf_regs.c
+++ b/tools/perf/util/perf_regs.c
@@ -3,10 +3,6 @@
 #include "perf_regs.h"
 #include "event.h"
 
-const struct sample_reg __weak sample_reg_masks[] = {
-	SMPL_REG_END
-};
-
 int __weak arch_sdt_arg_parse_op(char *old_op __maybe_unused,
 				 char **new_op __maybe_unused)
 {
diff --git a/tools/perf/util/perf_regs.h b/tools/perf/util/perf_regs.h
index 47fe34e5f7d5..e014c2c038f4 100644
--- a/tools/perf/util/perf_regs.h
+++ b/tools/perf/util/perf_regs.h
@@ -15,8 +15,6 @@ struct sample_reg {
 #define SMPL_REG2(n, b) { .name = #n, .mask = 3ULL << (b) }
 #define SMPL_REG_END { .name = NULL }
 
-extern const struct sample_reg sample_reg_masks[];
-
 enum {
 	SDT_ARG_VALID = 0,
 	SDT_ARG_SKIP,
@@ -27,6 +25,8 @@ uint64_t arch__intr_reg_mask(void);
 uint64_t arch__user_reg_mask(void);
 
 #ifdef HAVE_PERF_REGS_SUPPORT
+extern const struct sample_reg sample_reg_masks[];
+
 #include <perf_regs.h>
 
 #define DWARF_MINIMAL_REGS ((1ULL << PERF_REG_IP) | (1ULL << PERF_REG_SP))
-- 
2.23.0.444.g18eeb5a265-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

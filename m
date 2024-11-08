Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875C6D64076
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Nov 2024 01:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mo1aODpt19jAgcvUueo2veS52uNru+dpz5L4qmSdWv0=; b=MHmes2P1QZsHAe
	reRLiURI6UI+8hiOFtaaD7cjSkxfTVWhSm8BszWeG0cUQ8FKyz/N8xgD01C3Q6R2tHdZGF5RGU3xZ
	gn22dLPV2T2Rp0DlPt35LtnCsrJOs/+kWDH10fAP0eUQCwoBS80VycDg7N8Q7plmpyimQc4zLqs1W
	vkjo5ernfmGbWTlkYMk9eAOs/L/DgJLc9dIbXJno73ZyBTkkEM7gye0XiYH7Qb7mC3rxuALUoLVHZ
	u26NnGTjem4WVyGAhRyy2FZBNFW2MesPyXlkTA7z2cZgyFcuwr2vLOvMA0NoQQlzsGF2/t+Z45VZ1
	CoW/BFUJ2yLiCkjGXWWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9a60-0000000CQ7C-3W4K;
	Sat, 09 Nov 2024 01:17:00 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YgU-0000000CF8O-2H6A
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 23:46:36 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e38fabff35so572837b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 15:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731109593; x=1731714393; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PwSQD5rPF8FyaIrPq7KuguhdmexCo6TmzlSGry04ok=;
        b=OxzT3GJKz1TUkgO78NuB/v0yJmbD4FZxo6ChYDdDM7Z0J9tz0GX8Jz+bpMHZ+cR+VU
         LNwxqFR3ISYK6sUqvUpEN6uFn1a9qlHZ33C/7ysHPpiy01auqfaEHPUUtzTxW51yqlLU
         9F/6z2NqLdPxTIs82hlJpfqmF1UTqSIqhY4I7PnNVaXWMQG72cawTXmx6nVSjid3WUY7
         rq/fDZmEz/ewR3Kwi9lEZDxi2RVznEM3quFxBGO3V2suW9vHHM5mGAVSxVUjX5YfwF/t
         RLruVFOrG+P805kIGxyiBqeVqFsnpWF6o7cvAH+RmGVS1La0bsIab7mDC+6E+bYUQzn+
         VKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731109593; x=1731714393;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PwSQD5rPF8FyaIrPq7KuguhdmexCo6TmzlSGry04ok=;
        b=fwfHKFeBAZnK2YtDNgAyiJDs4YTNGzkgK0navZqgejhoGOekzhixOljXXpdJNguZbN
         vwNavSnF20UwRvFkW3XSKAnroycgifb735sXJ7Ise06bkNC99ckD5Hpx0B1CdgVP+AyO
         XkvRo/Ds1hHOuE6tPPpaFx9je21+J/wftvlNgow1D3lXZYfG0t9SRSC/+9Fi0uXiZhIs
         VOgq5l99ohXX5WPP+1YCUP7IbXWfHX29k9eJVqYu0PlkMOjw0XKsZyLl4sqhEeDBkJtl
         fwR6LARPDrBja3D5Qr3ywdwUi1eTVKkwutPPeBEDBRsxZK16OVCmE3hRkDvyu59zCWUa
         ZXOA==
X-Forwarded-Encrypted: i=1; AJvYcCUsayjOLCZ4m8CZ9dZ1OMUra1Meufc6EHb9E2hl8VFV53Tx3YeizccBFl8trf6b/AmMkrgTM2GLqxqSrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ1y05cu31M7BQkWOOJzKXLNmO5Gc1ppLDBw+3HAxg5Aatejtv
	nfESt3QSgdXHqb1UQG0rSELXanzExk0qkrxNukibXfUnGc1wOvaZozYc6GiDbxgwAvOoBOfM4Jc
	cx/vzxQ==
X-Google-Smtp-Source: AGHT+IHBYZ/o09AHQKMYb06lTJXmOE6GhHv0V4FjCIxjCSvh+yJRbzHl2yi0vhbJNIkRxA6ZAQm1zUkIswk5
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:6fd2:1e36:6d8c:7c49])
 (user=irogers job=sendgmr) by 2002:a05:690c:34c1:b0:6db:c6eb:bae9 with SMTP
 id 00721157ae682-6eaddd75f78mr475957b3.2.1731109593320; Fri, 08 Nov 2024
 15:46:33 -0800 (PST)
Date: Fri,  8 Nov 2024 15:45:55 -0800
In-Reply-To: <20241108234606.429459-1-irogers@google.com>
Message-Id: <20241108234606.429459-11-irogers@google.com>
Mime-Version: 1.0
References: <20241108234606.429459-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Subject: [PATCH v4 10/20] perf dwarf-regs: Move csky dwarf-regs out of arch
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Changbin Du <changbin.du@huawei.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_154634_696306_6A170B8D 
X-CRM114-Status: GOOD (  14.83  )
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

Move arch/csky/util/dwarf-regs.c to util/dwarf-regs-csky.c and compile
in unconditionally. To avoid get_arch_regstr being duplicated, rename
to get_csky_regstr and add to get_dwarf_regstr switch.

Update #ifdefs to allow ABI V1 and V2 tables at the same
time. Determine the table from the ELF flags.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/csky/util/Build               |  1 -
 tools/perf/util/Build                         |  1 +
 .../dwarf-regs.c => util/dwarf-regs-csky.c}   | 19 ++++++++++---------
 tools/perf/util/dwarf-regs.c                  | 11 +++++++----
 tools/perf/util/include/dwarf-regs.h          |  2 ++
 5 files changed, 20 insertions(+), 14 deletions(-)
 rename tools/perf/{arch/csky/util/dwarf-regs.c => util/dwarf-regs-csky.c} (74%)

diff --git a/tools/perf/arch/csky/util/Build b/tools/perf/arch/csky/util/Build
index 1325310cab6a..5e6ea82c4202 100644
--- a/tools/perf/arch/csky/util/Build
+++ b/tools/perf/arch/csky/util/Build
@@ -1,4 +1,3 @@
 perf-util-y += perf_regs.o
 
-perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 4c615611b9d7..99ae4e2802b8 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -203,6 +203,7 @@ endif
 perf-util-$(CONFIG_LIBDW) += probe-finder.o
 perf-util-$(CONFIG_LIBDW) += dwarf-aux.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs-csky.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-x86.o
 perf-util-$(CONFIG_LIBDW) += debuginfo.o
 perf-util-$(CONFIG_LIBDW) += annotate-data.o
diff --git a/tools/perf/arch/csky/util/dwarf-regs.c b/tools/perf/util/dwarf-regs-csky.c
similarity index 74%
rename from tools/perf/arch/csky/util/dwarf-regs.c
rename to tools/perf/util/dwarf-regs-csky.c
index ca86ecaeacbb..d38ef1f07f3e 100644
--- a/tools/perf/arch/csky/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs-csky.c
@@ -5,9 +5,8 @@
 #include <stddef.h>
 #include <dwarf-regs.h>
 
-#if defined(__CSKYABIV2__)
-#define CSKY_MAX_REGS 73
-const char *csky_dwarf_regs_table[CSKY_MAX_REGS] = {
+#define CSKY_ABIV2_MAX_REGS 73
+const char *csky_dwarf_regs_table_abiv2[CSKY_ABIV2_MAX_REGS] = {
 	/* r0 ~ r8 */
 	"%a0", "%a1", "%a2", "%a3", "%regs0", "%regs1", "%regs2", "%regs3",
 	/* r9 ~ r15 */
@@ -26,9 +25,9 @@ const char *csky_dwarf_regs_table[CSKY_MAX_REGS] = {
 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
 	"%epc",
 };
-#else
-#define CSKY_MAX_REGS 57
-const char *csky_dwarf_regs_table[CSKY_MAX_REGS] = {
+
+#define CSKY_ABIV1_MAX_REGS 57
+const char *csky_dwarf_regs_table_abiv1[CSKY_ABIV1_MAX_REGS] = {
 	/* r0 ~ r8 */
 	"%sp", "%regs9", "%a0", "%a1", "%a2", "%a3", "%regs0", "%regs1",
 	/* r9 ~ r15 */
@@ -41,9 +40,11 @@ const char *csky_dwarf_regs_table[CSKY_MAX_REGS] = {
 	NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
 	"%epc",
 };
-#endif
 
-const char *get_arch_regstr(unsigned int n)
+const char *get_csky_regstr(unsigned int n, unsigned int flags)
 {
-	return (n < CSKY_MAX_REGS) ? csky_dwarf_regs_table[n] : NULL;
+	if (flags & EF_CSKY_ABIV2)
+		return (n < CSKY_ABIV2_MAX_REGS) ? csky_dwarf_regs_table_abiv2[n] : NULL;
+
+	return (n < CSKY_ABIV1_MAX_REGS) ? csky_dwarf_regs_table_abiv1[n] : NULL;
 }
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index fd21f9e90e40..9a76f83af62c 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -29,17 +29,18 @@
 #define __get_dwarf_regstr(tbl, n) (((n) < ARRAY_SIZE(tbl)) ? (tbl)[(n)] : NULL)
 
 /* Return architecture dependent register string (for kprobe-tracer) */
-const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
-			     unsigned int flags __maybe_unused)
+const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags)
 {
-#if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM
+#if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
+    || EM_HOST == EM_CSKY
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
 	}
 #endif
 	switch (machine) {
-#if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM
+#if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
+    && EM_HOST != EM_CSKY
 	case EM_NONE:	/* Generic arch - use host arch */
 		return get_arch_regstr(n);
 #endif
@@ -51,6 +52,8 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
 		return __get_dwarf_regstr(arm_regstr_tbl, n);
 	case EM_AARCH64:
 		return __get_dwarf_regstr(aarch64_regstr_tbl, n);
+	case EM_CSKY:
+		return get_csky_regstr(n, flags);
 	case EM_SH:
 		return __get_dwarf_regstr(sh_regstr_tbl, n);
 	case EM_S390:
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 3652f9d98fe4..0641c2942b01 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -93,6 +93,8 @@
 const char *get_arch_regstr(unsigned int n);
 #endif
 
+const char *get_csky_regstr(unsigned int n, unsigned int flags);
+
 /**
  * get_dwarf_regstr() - Returns ftrace register string from DWARF regnum.
  * @n: DWARF register number.
-- 
2.47.0.277.g8800431eea-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

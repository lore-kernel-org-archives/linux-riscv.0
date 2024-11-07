Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD3BD43379
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XR72d+kGfrouasbc5atVJYW+lGvaKdca2mxxtrXqSWs=; b=ILrL3ZiVmMJV8aJpwkpKihLnGs
	ydPenElhxh+CW0Je9YrvJoxuuSIytmiId3jF7WhRwih188TdbjgeMUW157LfD/EbA3AbBpzM/rCvF
	/ULCFqpVYCNvv313PnPXGCKK2FhSJ8v7R0NcAkzUduO3ztxw5/uHli5/ia7NHSD1/iBNMrjPHJIF/
	1k/pCGmkHsBDmBinbGhonIWHkEoA9pn30E7JMNRmHphuEYrqSCYCC8yFCiJNje29J/B4JS1OcwiLM
	RuWQfmikvoBP/4Oyw1qvhfxvLLM+IU9qCsaD0BOY6ndQ+Z/cBNTrKtzHog3DZLokjCByO43RgQPz4
	sb0PZFLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95Ox-00000007eQ8-0IKw;
	Thu, 07 Nov 2024 16:30:31 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95FU-00000007ba2-0GrS
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 16:20:45 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e7e7568ed3so29038157b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2024 08:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730996443; x=1731601243; darn=lists.infradead.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Zi7/BGIzk4kmPbaIIn5N5Q89D8reWg5dpAnu28NGJw=;
        b=4eZEb5YKOsCuVJyP/wxLUOH7Ob6tr1iB2puKnruaAd6sUngRbq1OaCk43BvEt98ENw
         2TOR5CqjZAkMpHcz2kNeKsh6aDZwe1+R8YIghZ+s7E2MSLkCbZr9EAf4xqaBAKk9AOPR
         NMAH34lGSPLmqhCI8sWyXw+GcOFdcwbxHZD2Q6Mqs6211JV12ffNZAs022/dmuPyZlFZ
         7jOkEfGQzlEiqwHj4yit2JcQNQXSanINrIikTyvmPZWYLVm8ahQ5LlPYODGZMNnkovg3
         suPE24g99z4NBWUxzhlws0/J0+9h8Y58D7cevCIJ+Bys+u00Hu69ktufnfs6DaS2Z8E2
         458g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730996443; x=1731601243;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Zi7/BGIzk4kmPbaIIn5N5Q89D8reWg5dpAnu28NGJw=;
        b=JUL8fewmXl6QdkJ1znhlz0eYtd5OVj1ixfKt/e9WZQQgKAlJ1Ak3afgExYaVEkzlMi
         IR75JWs9Hz8tnajRfTZtVF2VAq9saJzst23iIi62IHPfDsW2JjfIS10LnWkKOHGFStp6
         mltwZ9psBZiRmTr+90vTOQ5KJpY/m8KtJZUcrqRFNTW0yzrYdRrkDz3FmSz7HYvbEtrI
         u/QksbDnEBzJwmi/kyRl6CVtdW+OrCUD9tPlJ1YdCcj0Mg1G6Ajlrsb1CEDdulQMJp2F
         A+b4GPLBn4JbTFTA7tkVVtJN3WvDgPsmQbyvHFmuj42gRSNOCrIHYnefVIg0lQlva+Jd
         MK4w==
X-Forwarded-Encrypted: i=1; AJvYcCXfXEIphs/k9AeVHCute3uddKkAnS1rWFAlh7UCDTddAqg8uDzVM5nXkgcawlYsVe9h+gTEUagyIdzo5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxD/Joh7PQt3LaNWjj22UndpRDPSgL+emcBMcCV9EtUUG7/qm+V
	NEGu5SoZjIzpSlUhp+vEc1NU2pdu/zwKeReEquHZLFEO9oH9yKrmgeDU4abLP00bCG4t5/oW0iX
	lgqQ7jw==
X-Google-Smtp-Source: AGHT+IH0/hEWrV52DVmrj7Z6n0WIT9Ut3IVouygX8jmB/XLHKPkNRIO9up6ksFd2vuXYZmCZkrEILwBAMRRP
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:acc7:bda:7167:18d8])
 (user=irogers job=sendgmr) by 2002:a25:d843:0:b0:e29:7454:e773 with SMTP id
 3f1490d57ef6-e337e1d738cmr33276.5.1730996442881; Thu, 07 Nov 2024 08:20:42
 -0800 (PST)
Date: Thu,  7 Nov 2024 08:20:28 -0800
In-Reply-To: <20241107162035.52206-1-irogers@google.com>
Message-Id: <20241107162035.52206-2-irogers@google.com>
Mime-Version: 1.0
References: <20241107162035.52206-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v2 1/8] perf jevents: fix breakage when do perf stat on system metric
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das <sandipan.das@amd.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, 
	"=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=" <clement.legoffic@foss.st.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Cc: stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_082044_196311_FBAA86E3 
X-CRM114-Status: GOOD (  15.24  )
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

From: Xu Yang <xu.yang_2@nxp.com>

When do perf stat on sys metric, perf tool output nothing now:
$ perf stat -a -M imx95_ddr_read.all -I 1000
$

This command runs on an arm64 machine and the Soc has one DDR hw pmu
except one armv8_cortex_a55 pmu. Their maps show as follows:

const struct pmu_events_map pmu_events_map[] = {
{
	.arch = "arm64",
	.cpuid = "0x00000000410fd050",
	.event_table = {
		.pmus = pmu_events__arm_cortex_a55,
		.num_pmus = ARRAY_SIZE(pmu_events__arm_cortex_a55)
	},
	.metric_table = {
		.pmus = NULL,
		.num_pmus = 0
	}
},

static const struct pmu_sys_events pmu_sys_event_tables[] = {
{
	.event_table = {
		.pmus = pmu_events__freescale_imx95_sys,
		.num_pmus = ARRAY_SIZE(pmu_events__freescale_imx95_sys)
	},
	.metric_table = {
		.pmus = pmu_metrics__freescale_imx95_sys,
		.num_pmus = ARRAY_SIZE(pmu_metrics__freescale_imx95_sys)
	},
	.name = "pmu_events__freescale_imx95_sys",
},

Currently, pmu_metrics_table__find() will return NULL when only do perf
stat on sys metric. Then parse_groups() will never be called to parse
sys metric_name, finally perf tool will exit directly. This should be a
common problem. To fix the issue, this will keep the logic before commit
f20c15d13f01 ("perf pmu-events: Remember the perf_events_map for a PMU")
to return a empty metric table rather than a NULL pointer. This should
be fine since the removed part just check if the table match provided
metric_name. Without these code, the code in parse_groups() will also
check the validity of metrci_name too.

Fixes: f20c15d13f01 ("perf pmu-events: Remember the perf_events_map for a PMU")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Acked-by: Ian Rogers <irogers@google.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/empty-pmu-events.c | 12 +-----------
 tools/perf/pmu-events/jevents.py         | 12 +-----------
 2 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-events/empty-pmu-events.c
index 2b7516946ded..b8719dab264d 100644
--- a/tools/perf/pmu-events/empty-pmu-events.c
+++ b/tools/perf/pmu-events/empty-pmu-events.c
@@ -585,17 +585,7 @@ const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pm
         if (!map)
                 return NULL;
 
-        if (!pmu)
-                return &map->metric_table;
-
-        for (size_t i = 0; i < map->metric_table.num_pmus; i++) {
-                const struct pmu_table_entry *table_pmu = &map->metric_table.pmus[i];
-                const char *pmu_name = &big_c_string[table_pmu->pmu_name.offset];
-
-                if (pmu__name_match(pmu, pmu_name))
-                           return &map->metric_table;
-        }
-        return NULL;
+	return &map->metric_table;
 }
 
 const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 6e71b09dbc2a..70f4fd5395fb 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -1101,17 +1101,7 @@ const struct pmu_metrics_table *perf_pmu__find_metrics_table(struct perf_pmu *pm
         if (!map)
                 return NULL;
 
-        if (!pmu)
-                return &map->metric_table;
-
-        for (size_t i = 0; i < map->metric_table.num_pmus; i++) {
-                const struct pmu_table_entry *table_pmu = &map->metric_table.pmus[i];
-                const char *pmu_name = &big_c_string[table_pmu->pmu_name.offset];
-
-                if (pmu__name_match(pmu, pmu_name))
-                           return &map->metric_table;
-        }
-        return NULL;
+	return &map->metric_table;
 }
 
 const struct pmu_events_table *find_core_events_table(const char *arch, const char *cpuid)
-- 
2.47.0.199.ga7371fff76-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

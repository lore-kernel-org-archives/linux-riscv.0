Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA16FCCFA00
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oqmHJuRqz4e8Vlfu6bJyUGeMWT7ukhxSffdMoAgCnSk=; b=xuwUlqUhXZXMSJ
	Jv5IdgvvWdxUzzEThVlfPi2WBghc991kBuV3uN1O3t+RoaeqejcFgOTPHV6lOIzFPX1R4o2Q+WPQk
	QL2TqCSwYXy61slyIOUFa6Crhs5bp4usee5fZmOsyezsrffd9Bh6BGmATTB4n0TRYHtGBm3NFb2Tq
	CR1AoUqcjCVWnJ7kQWQFvQkqfoMX5myzRN+cNFcVWIM70V64j0hGd+dBRpIhdxHmkeCgGcRl4XvtG
	BcftLe8sh84CnVe3xQedyaQrn1gd785ZG8lOpwtwALoqtDoZMUbjz3/j6u5CG4LPuHTXtmRksWlPx
	8MnkuJQDeeNRCGeO9Vsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDmH-00000007tMB-2GzZ;
	Sat, 01 Nov 2025 15:44:29 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDmF-00000007tKQ-0LJg
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 15:44:28 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-27d3540a43fso32333895ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 01 Nov 2025 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762011866; x=1762616666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XnFRCS+sTtRhexwba7Np0dAUXiR2aGYN+xgEcH1cxk=;
        b=RA6Uvits3+sctrYQ+cqoA+BY8YBgBg0u6H9D9WAwINU6eBCzrW5Uzi81gVt7SEecXM
         g6XpuYPCyjiYY4zi6Md1BxmDCSt8gihb96gNxbg9eh0P4RFSNRmTG031KDE28v3q7Fqj
         c1mTpjzB/vx+N3NCZ2ULEUJmpqdxOA2OzrhzSapAEJk0s5keiYmjul3w2fzEi9ylOKO2
         7/ikiMOrmN7p6TXwJZUJx85SSOwtNY7Vvjj+l87Yhe5aTLiHczwELJpqzA7niphe9P+t
         d8l5foq+7GVJxhH7eIQcw2OAEIOj3LPJRLCUYCBMZIB4M5q1kdr6vqqszwLfSEHA47RE
         6urA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011866; x=1762616666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XnFRCS+sTtRhexwba7Np0dAUXiR2aGYN+xgEcH1cxk=;
        b=wVnwt9lAYpJ18rqypmXlDmpi9t8v2OTMya2s7u1bbP4sWOGHVIt45e6ldP5n7puVb4
         DCvtPhgi4NrmV4JswqW1+ZYZpWN9QdAofnzGxmkXLJCTUakc2eofYdk3j7HZCPVMSmzm
         cqALqn7Rj8HKaW/rKSTsnFeEMyQcJOu3uFAWHx0iqAQINJz0w6cuiS0sSk/SX4ayxadb
         i4OC5jgWie/G/4/mUHjLH5HZ+U/4eoh6qA0TrGl5kemAIWU9lLYRd/F4du+0EDc430gV
         /gSjUTImU9bGYu7TKmI5iUOxrGKgj3TmbmYHFQ+i5DsnRazmmwINnpgpB22rHTGYuw1t
         oWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkIKZfE+BJP1QGqYhqKJWDdm4RCJ9CnUNHK54Hm1hCtISNSAqU1eKW6j0X3NSqJYWaBenWoA1afaL55A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOc5UicxIV0UVldJZ6y9/BPBYQGyiZDgSRdnrXIN67hMW2k/nh
	VjNcn9FcDUKoaw4rs7BstO1I8UKlswLjVGSgSXdC3IhgboXv3tsTEJB9J1lZbEtESaE=
X-Gm-Gg: ASbGncvJ9u6erdMrSL1VzsD5iF8r9O/mNubOdJ0JBgTWhxHEzD0Um+DvM9pZwLVs6jE
	75VWFzhiAEKl8YCmXeBKL7KKrKfAPtOfZ0K77wrFxenjWq+TUJPaPXv9a6hdo3NLIrj6X/XFHaq
	qDdInYmj7cEvT2ybBB8Bl2A2jR75Fkw5OZlxuLWlROpng7m5IoxRoWY7LjxTrvkDtJCe2BfcPqo
	BLP8MloFQtVFnTItvvTNQhsrqCu+otbCT8w0mVyRmQZhSCni2hIddqnX8S6ph/ewo2WEIzEgZCJ
	eP2WVaUCbeL7O507HgIU7lhyGHC5IugRTetKUGw+1yUNgaFPNbEsH/OeMbFIBVpbpP0dncgxlD1
	OtlRV1Kx0bdnlAdSM1dfBuV7b4fe3wtRap9AsAiKszvIRI95pWy2CZNwjLtGqmGjFAzQpL3NM5N
	ZUF18Ag4RYM15Ps5UHXpHVclOQNcMaYog1oLEVBCMvDA==
X-Google-Smtp-Source: AGHT+IHqSK+MBUN/GAqGdH+BeccrIifT4o6CYolTjikOEjgbWEPinm6+JP4k2LJ8ohbiCjztsZFCQA==
X-Received: by 2002:a17:902:ce81:b0:295:5945:2930 with SMTP id d9443c01a7336-29559452c6emr26600735ad.2.1762011866181;
        Sat, 01 Nov 2025 08:44:26 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269bd2fesm59990105ad.105.2025.11.01.08.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 08:44:25 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH v2 10/12] perf tools: Add RISC-V trace PMU record capabilities
Date: Sat,  1 Nov 2025 21:12:43 +0530
Message-ID: <20251101154245.162492-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101154245.162492-1-apatel@ventanamicro.com>
References: <20251101154245.162492-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_084427_136782_17C6077A 
X-CRM114-Status: GOOD (  22.16  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Liang Kan <kan.liang@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mayuresh Chitale <mchitale@ventanamicro.com>

Introduce the required auxiliary API functions allowing the perf core
to interact with RISC-V trace perf driver.

Co-developed-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 tools/perf/arch/riscv/util/Build      |   1 +
 tools/perf/arch/riscv/util/auxtrace.c | 218 ++++++++++++++++++++++++++
 tools/perf/util/auxtrace.c            |   1 +
 tools/perf/util/auxtrace.h            |   1 +
 tools/perf/util/rvtrace.h             |  18 +++
 5 files changed, 239 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
 create mode 100644 tools/perf/util/rvtrace.h

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 58a672246024..2ba1fb98a0ad 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -3,3 +3,4 @@ perf-util-y += header.o
 
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
+perf-util-$(CONFIG_AUXTRACE) += auxtrace.o
diff --git a/tools/perf/arch/riscv/util/auxtrace.c b/tools/perf/arch/riscv/util/auxtrace.c
new file mode 100644
index 000000000000..adc86bd38998
--- /dev/null
+++ b/tools/perf/arch/riscv/util/auxtrace.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Risc-V E-Trace support
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/bitops.h>
+#include <linux/log2.h>
+#include <linux/zalloc.h>
+#include <time.h>
+
+#include <internal/lib.h> // page_size
+#include "../../../util/auxtrace.h"
+#include "../../../util/cpumap.h"
+#include "../../../util/debug.h"
+#include "../../../util/event.h"
+#include "../../../util/evlist.h"
+#include "../../../util/evsel.h"
+#include "../../../util/rvtrace.h"
+#include "../../../util/pmu.h"
+#include "../../../util/record.h"
+#include "../../../util/session.h"
+#include "../../../util/tsc.h"
+
+#define RVTRACE_PMU_NAME "rvtrace"
+#define KiB(x) ((x) * 1024)
+#define MiB(x) ((x) * 1024 * 1024)
+
+struct rvtrace_recording {
+	struct auxtrace_record	itr;
+	struct perf_pmu *rvtrace_pmu;
+	struct evlist *evlist;
+};
+
+static size_t rvtrace_info_priv_size(struct auxtrace_record *itr __maybe_unused,
+				     struct evlist *evlist __maybe_unused)
+{
+	return RVTRACE_AUXTRACE_PRIV_SIZE;
+}
+
+static int rvtrace_info_fill(struct auxtrace_record *itr, struct perf_session *session,
+			     struct perf_record_auxtrace_info *auxtrace_info, size_t priv_size)
+{
+	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
+	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
+
+	if (priv_size != RVTRACE_AUXTRACE_PRIV_SIZE)
+		return -EINVAL;
+
+	if (!session->evlist->core.nr_mmaps)
+		return -EINVAL;
+
+	auxtrace_info->type = PERF_AUXTRACE_RISCV_TRACE;
+	auxtrace_info->priv[0] = rvtrace_pmu->type;
+
+	return 0;
+}
+
+static int rvtrace_set_auxtrace_mmap_page(struct record_opts *opts)
+{
+	bool privileged = perf_event_paranoid_check(-1);
+
+	if (!opts->full_auxtrace)
+		return 0;
+
+	if (opts->full_auxtrace && !opts->auxtrace_mmap_pages) {
+		if (privileged) {
+			opts->auxtrace_mmap_pages = MiB(16) / page_size;
+		} else {
+			opts->auxtrace_mmap_pages = KiB(128) / page_size;
+			if (opts->mmap_pages == UINT_MAX)
+				opts->mmap_pages = KiB(256) / page_size;
+		}
+	}
+
+	/* Validate auxtrace_mmap_pages */
+	if (opts->auxtrace_mmap_pages) {
+		size_t sz = opts->auxtrace_mmap_pages * (size_t)page_size;
+		size_t min_sz = KiB(8);
+
+		if (sz < min_sz || !is_power_of_2(sz)) {
+			pr_err("Invalid mmap size : must be at least %zuKiB and a power of 2\n",
+			       min_sz / 1024);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int rvtrace_recording_options(struct auxtrace_record *itr, struct evlist *evlist,
+				     struct record_opts *opts)
+{
+	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
+	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
+	struct evsel *evsel, *rvtrace_evsel = NULL;
+	struct evsel *tracking_evsel;
+	int err;
+
+	ptr->evlist = evlist;
+	evlist__for_each_entry(evlist, evsel) {
+		if (evsel->core.attr.type == rvtrace_pmu->type) {
+			if (rvtrace_evsel) {
+				pr_err("There may be only one " RVTRACE_PMU_NAME "x event\n");
+				return -EINVAL;
+			}
+			evsel->core.attr.freq = 0;
+			evsel->core.attr.sample_period = 1;
+			evsel->needs_auxtrace_mmap = true;
+			rvtrace_evsel = evsel;
+			opts->full_auxtrace = true;
+		}
+	}
+
+	err = rvtrace_set_auxtrace_mmap_page(opts);
+	if (err)
+		return err;
+	/*
+	 * To obtain the auxtrace buffer file descriptor, the auxtrace event
+	 * must come first.
+	 */
+	evlist__to_front(evlist, rvtrace_evsel);
+	evsel__set_sample_bit(rvtrace_evsel, TIME);
+
+	/* Add dummy event to keep tracking */
+	err = parse_event(evlist, "dummy:u");
+	if (err)
+		return err;
+
+	tracking_evsel = evlist__last(evlist);
+	evlist__set_tracking_event(evlist, tracking_evsel);
+
+	tracking_evsel->core.attr.freq = 0;
+	tracking_evsel->core.attr.sample_period = 1;
+	evsel__set_sample_bit(tracking_evsel, TIME);
+
+	return 0;
+}
+
+static u64 rvtrace_reference(struct auxtrace_record *itr __maybe_unused)
+{
+	return rdtsc();
+}
+
+static void rvtrace_recording_free(struct auxtrace_record *itr)
+{
+	struct rvtrace_recording *ptr =
+			container_of(itr, struct rvtrace_recording, itr);
+
+	free(ptr);
+}
+
+static struct auxtrace_record *rvtrace_recording_init(int *err, struct perf_pmu *rvtrace_pmu)
+{
+	struct rvtrace_recording *ptr;
+
+	if (!rvtrace_pmu) {
+		*err = -ENODEV;
+		return NULL;
+	}
+
+	ptr = zalloc(sizeof(*ptr));
+	if (!ptr) {
+		*err = -ENOMEM;
+		return NULL;
+	}
+
+	ptr->rvtrace_pmu = rvtrace_pmu;
+	ptr->itr.recording_options = rvtrace_recording_options;
+	ptr->itr.info_priv_size = rvtrace_info_priv_size;
+	ptr->itr.info_fill = rvtrace_info_fill;
+	ptr->itr.free = rvtrace_recording_free;
+	ptr->itr.reference = rvtrace_reference;
+	ptr->itr.read_finish = auxtrace_record__read_finish;
+	ptr->itr.alignment = 0;
+
+	*err = 0;
+	return &ptr->itr;
+}
+
+static struct perf_pmu *find_pmu_for_event(struct perf_pmu **pmus,
+					   int pmu_nr, struct evsel *evsel)
+{
+	int i;
+
+	if (!pmus)
+		return NULL;
+
+	for (i = 0; i < pmu_nr; i++) {
+		if (evsel->core.attr.type == pmus[i]->type)
+			return pmus[i];
+	}
+
+	return NULL;
+}
+
+struct auxtrace_record *auxtrace_record__init(struct evlist *evlist, int *err)
+{
+	struct perf_pmu	*rvtrace_pmu = NULL;
+	struct perf_pmu *found_etm = NULL;
+	struct evsel *evsel;
+
+	if (!evlist)
+		return NULL;
+
+	rvtrace_pmu = perf_pmus__find(RVTRACE_PMU_NAME);
+	evlist__for_each_entry(evlist, evsel) {
+		if (rvtrace_pmu && !found_etm)
+			found_etm = find_pmu_for_event(&rvtrace_pmu, 1, evsel);
+	}
+
+	if (found_etm)
+		return rvtrace_recording_init(err, rvtrace_pmu);
+
+	*err = 0;
+	return NULL;
+}
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 1539c1dc823c..c905563e0d8a 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -1394,6 +1394,7 @@ int perf_event__process_auxtrace_info(struct perf_session *session,
 	case PERF_AUXTRACE_VPA_DTL:
 		err = powerpc_vpadtl_process_auxtrace_info(event, session);
 		break;
+	case PERF_AUXTRACE_RISCV_TRACE:
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/auxtrace.h b/tools/perf/util/auxtrace.h
index e0a5b39fed12..1c89a281a06c 100644
--- a/tools/perf/util/auxtrace.h
+++ b/tools/perf/util/auxtrace.h
@@ -51,6 +51,7 @@ enum auxtrace_type {
 	PERF_AUXTRACE_S390_CPUMSF,
 	PERF_AUXTRACE_HISI_PTT,
 	PERF_AUXTRACE_VPA_DTL,
+	PERF_AUXTRACE_RISCV_TRACE,
 };
 
 enum itrace_period_type {
diff --git a/tools/perf/util/rvtrace.h b/tools/perf/util/rvtrace.h
new file mode 100644
index 000000000000..93c041db8660
--- /dev/null
+++ b/tools/perf/util/rvtrace.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(C) 2015 Linaro Limited. All rights reserved.
+ * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
+ */
+
+#ifndef INCLUDE__UTIL_PERF_RVTRACE_H__
+#define INCLUDE__UTIL_PERF_RVTRACE_H__
+
+#include "debug.h"
+#include "auxtrace.h"
+#include "util/event.h"
+#include "util/session.h"
+#include <linux/bits.h>
+
+#define RVTRACE_AUXTRACE_PRIV_SIZE	sizeof(u64)
+
+#endif
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

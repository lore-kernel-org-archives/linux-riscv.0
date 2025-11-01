Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0A5CCFA03
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 15:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XomlClO5k+wtvH0mtNwJlWI2BAiESc4ITFqrx/Vs94g=; b=dNh61fNVpzVjug
	WtDzNi36i0uXFkdRsZ3WozKS8GW8jQilxe9HZUGL9+db9gv/mZ+7xvRSQg+pcMeNmCXfSXqSBpYB6
	rLcL3OczsV02njQ49zKD4LniNQmAVSDmlCFsTnRsaT6LcuQVV5Y45qBbJUQglwuwoTan612EpRPEk
	Mqhu9srO8Ked42+ZbTUW1QfGOT4ErdMN4i8BpPnpu+x0SvbNzdEdqd1+SBbKR7ngg7GCdyneWbyvk
	moMcuiPQF1iAhCwQZMMu8hbgBikSYV6Mq7FyCY5ZcJEVNFuUhghrc0T7p1s7MJXLTPl07NyyDWkAs
	U4tX54bGqAjotft7H/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDmP-00000007tR8-3fzV;
	Sat, 01 Nov 2025 15:44:37 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDmN-00000007tPW-3KGB
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 15:44:36 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b550eff972eso2246374a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 01 Nov 2025 08:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762011875; x=1762616675; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/d8QkW3fcCXd7CklfrCHDzxbpDgi3QraTb9WZel9ANQ=;
        b=bpzdelmUDOh3NWNMdKn7gpsoaIYMdRPCvB41Bk51eKxdSqWgs54LaExeb+sTo9EMa3
         9LTgdxkDj+0+EJxBHkdPsV62KW1rs4tCq6ELDSqn7MALb9GbVQO73hX2qU2CjI2+GSxR
         gvnKZ5/j4scjDup0Ricn12LW8jm5j55qRuj4aAVH7Pa3HKCYCouBDcZbX5tm5c3bmsUy
         UlJ2RG+i0lAcNQarKL3i2NhdEBipk38V1yZuyYoSTUUpZJGJLi7b57tiNRM5DcrOdH4V
         sl928Jb0Fbj3F6OaTD42Uls1dTcWxxBlGKI86jfq5g03wu4FRWqraO0sCw/Wz0Zhpj0B
         ToYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011875; x=1762616675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/d8QkW3fcCXd7CklfrCHDzxbpDgi3QraTb9WZel9ANQ=;
        b=AoM90b3r2RRj5scfk1hMkYV2/g2/pFgEMlTtBzGGRjRWojWUKIafNVW1lueS/HJ4/Y
         y10dCEzLy+JbS16b9Qw6IhXcYdw7MuYP3iISJyql6aFB53Hw9x0ANfp5FCTqj28ovtTJ
         JHA1yYxpMfuY+88xACmfdNlrfozmB/qJNlG9lFHuHoSr/wUQAAMIFrkbMlD3cAVQQ1O8
         JrYvfPx5Fr4riOeQQS/xuu7TQbEb4qmScYM5Tvsm/IR3O+pL/LU/Xy3WkDpYtQNKya/P
         ZNpefZJD+ogUpdNGyr8cGOJY1uKyoeCkbO5WSTcA3VrcAmniUc6CkhMPk0mqQKEVlH54
         +maA==
X-Forwarded-Encrypted: i=1; AJvYcCV+ZU3wclGmK95GJ1yX0aykDYHI++Qj9Pikf+HtVRPaSeTvVHQ6JN87A+Qe4U3V/IYF737l4LVUE5QVig==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGJtFQCd6txeob6QkiHbzxx2X1FIkihqqGFuH75J5krlOxcBSc
	ZHVw7Ua+jUza09OWbN0ctx3tHz7fYFWzAUliFs5ir5X86MmTLEP7vobCl+Z/EqOlkM4=
X-Gm-Gg: ASbGncuu3CkIXGZWInUF9FDjppj7dSlZfnXCozmCRNtBaPSURqCV5QXnG2d27mPiC7F
	5IXB5ORWd2XPMdXlLWRwZVFPt9Su8gLup4cO17O3TcYziAxuez9BGAHda81IcnjMPyH9rj3yCQ6
	Rg4AUZiNw64qlRWUNIb3HyQKIc1M9rkRweorJvmz0r/qTx0fm6fHLksLyvHRVDn9wW7Ti4Hzk7K
	IN/LCQbzB5BGiTYHw5+Y3QME0s7TO8stD7Ef8ygD/z2nGmjiamJg2QfDYcfzpxLXFhU5RkJ5/Qt
	0v4wztM83/OdMnLXcB+vlF/BTofiku1pK6N5wH503VNyHWCPod3zBLDXVGckN6GWm8cKCcCFKBu
	446geVrz8gjyfyM6rG/Lppmpxgw9nqxFUFQt4VZz5eV/ocC6/5BeXMrrjSXl6pU20lboJBY9IQY
	VcPD9MS7MUDjrDfxMG6MYt9PUtIMIdRgiKgYsPaNCBgA==
X-Google-Smtp-Source: AGHT+IGqcfZVcMgWLUG0d9hDZlQu23GscfETgA3I9ETT6Ty8Q0IVDNoUtgE/qtgar49rN37Arqj0Gw==
X-Received: by 2002:a17:902:e552:b0:294:f1fa:9097 with SMTP id d9443c01a7336-2951a55b71emr107166325ad.34.1762011875095;
        Sat, 01 Nov 2025 08:44:35 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269bd2fesm59990105ad.105.2025.11.01.08.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 08:44:34 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH v2 11/12] perf tools: Initial support for RISC-V trace decoder
Date: Sat,  1 Nov 2025 21:12:44 +0530
Message-ID: <20251101154245.162492-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101154245.162492-1-apatel@ventanamicro.com>
References: <20251101154245.162492-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_084435_899181_1C9A1F26 
X-CRM114-Status: GOOD (  18.95  )
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

Add bare bones support for RISC-V trace decoder so that the data received
from the hardware by the RISC-V trace perf driver can be written to the
perf record output file.

Co-developed-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 tools/perf/util/Build             |  1 +
 tools/perf/util/auxtrace.c        |  3 +
 tools/perf/util/rvtrace-decoder.c | 91 +++++++++++++++++++++++++++++++
 tools/perf/util/rvtrace.h         |  2 +
 4 files changed, 97 insertions(+)
 create mode 100644 tools/perf/util/rvtrace-decoder.c

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 4be313cd115a..f736cea51fd8 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -145,6 +145,7 @@ perf-util-$(CONFIG_AUXTRACE) += cs-etm.o
 perf-util-$(CONFIG_AUXTRACE) += cs-etm-decoder/
 endif
 perf-util-$(CONFIG_AUXTRACE) += cs-etm-base.o
+perf-util-$(CONFIG_AUXTRACE) += rvtrace-decoder.o
 
 perf-util-y += parse-branch-options.o
 perf-util-y += dump-insn.o
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index c905563e0d8a..299991d5d305 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -54,6 +54,7 @@
 #include "arm-spe.h"
 #include "hisi-ptt.h"
 #include "s390-cpumsf.h"
+#include "rvtrace.h"
 #include "util/mmap.h"
 #include "powerpc-vpadtl.h"
 
@@ -1395,6 +1396,8 @@ int perf_event__process_auxtrace_info(struct perf_session *session,
 		err = powerpc_vpadtl_process_auxtrace_info(event, session);
 		break;
 	case PERF_AUXTRACE_RISCV_TRACE:
+		err = rvtrace__process_auxtrace_info(event, session);
+		break;
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/rvtrace-decoder.c b/tools/perf/util/rvtrace-decoder.c
new file mode 100644
index 000000000000..58db5ca62c1a
--- /dev/null
+++ b/tools/perf/util/rvtrace-decoder.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RISC-V trace Decoder
+ */
+
+#include <errno.h>
+#include <inttypes.h>
+#include "evlist.h"
+#include <internal/lib.h>
+#include "rvtrace.h"
+
+struct rvtrace_decoder {
+	struct auxtrace auxtrace;
+	u32 auxtrace_type;
+	struct perf_session *session;
+	struct machine *machine;
+	u32 pmu_type;
+};
+
+static int rvtrace_process_event(struct perf_session *session __maybe_unused,
+				 union perf_event *event __maybe_unused,
+				 struct perf_sample *sample __maybe_unused,
+				 const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static int rvtrace_process_auxtrace_event(struct perf_session *session __maybe_unused,
+					  union perf_event *event __maybe_unused,
+					  const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static int rvtrace_flush(struct perf_session *session __maybe_unused,
+			 const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static void rvtrace_free_events(struct perf_session *session __maybe_unused)
+{
+}
+
+static void rvtrace_free(struct perf_session *session)
+{
+	struct rvtrace_decoder *ptr = container_of(session->auxtrace, struct rvtrace_decoder,
+					    auxtrace);
+
+	session->auxtrace = NULL;
+	free(ptr);
+}
+
+static bool rvtrace_evsel_is_auxtrace(struct perf_session *session,
+				      struct evsel *evsel)
+{
+	struct rvtrace_decoder *ptr = container_of(session->auxtrace,
+						   struct rvtrace_decoder, auxtrace);
+
+	return evsel->core.attr.type == ptr->pmu_type;
+}
+
+int rvtrace__process_auxtrace_info(union perf_event *event,
+				   struct perf_session *session)
+{
+	struct perf_record_auxtrace_info *auxtrace_info = &event->auxtrace_info;
+	struct rvtrace_decoder *ptr;
+
+	if (auxtrace_info->header.size < RVTRACE_AUXTRACE_PRIV_SIZE +
+	    sizeof(struct perf_record_auxtrace_info))
+		return -EINVAL;
+
+	ptr = zalloc(sizeof(*ptr));
+	if (!ptr)
+		return -ENOMEM;
+
+	ptr->session = session;
+	ptr->machine = &session->machines.host;
+	ptr->auxtrace_type = auxtrace_info->type;
+	ptr->pmu_type = auxtrace_info->priv[0];
+
+	ptr->auxtrace.process_event = rvtrace_process_event;
+	ptr->auxtrace.process_auxtrace_event = rvtrace_process_auxtrace_event;
+	ptr->auxtrace.flush_events = rvtrace_flush;
+	ptr->auxtrace.free_events = rvtrace_free_events;
+	ptr->auxtrace.free = rvtrace_free;
+	ptr->auxtrace.evsel_is_auxtrace = rvtrace_evsel_is_auxtrace;
+	session->auxtrace = &ptr->auxtrace;
+
+	return 0;
+}
diff --git a/tools/perf/util/rvtrace.h b/tools/perf/util/rvtrace.h
index 93c041db8660..fdf2e5866c85 100644
--- a/tools/perf/util/rvtrace.h
+++ b/tools/perf/util/rvtrace.h
@@ -15,4 +15,6 @@
 
 #define RVTRACE_AUXTRACE_PRIV_SIZE	sizeof(u64)
 
+int rvtrace__process_auxtrace_info(union perf_event *event, struct perf_session *session);
+struct auxtrace_record *rvtrace_record_init(int *err);
 #endif
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282B3CAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 06:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzOud4uIeHpmxNxJkp3H8teKFpduey8m1vkzS7v+p/Y=; b=1r6LhtHPl/qFWd
	9sSq/VYD8TcEHlsdrG0mK6wERR479ANYYsssuQuEnxzQviDcy9SE0I4wQafCygXcWzX9ZxRBT38Ry
	rduOKgySt0pw6E6AC9iGUPaMAOVvmdEeWUITPzzG3RirshJ3KysbRZ0tav+ORMHukQ23agZf926In
	hd05vTARW0SXP50wfosUAJcVQ95piHTDGW7KatEk783Xb86jsG1IrIb0Sd5pEK3QKLGwtn5RxRbAa
	U/ziRazeirrg8XN6xMXYxG3rK+EKz/FYWez8qno5ata+jUgHV3NNPOiKN3A1ed6y2yoQB9Mrgi6SW
	xkmDsYxZ6CuISSVlzWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CVc-00000009hjx-1xR1;
	Thu, 02 Oct 2025 06:09:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CVb-00000009hjE-0SU7
	for linux-riscv@bombadil.infradead.org;
	Thu, 02 Oct 2025 06:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8zmmvMMm35WfJWJCu/rbPWUzK6j6v7Igidp5p7E+6WY=; b=JURQk/rpc+ZmZ1LwmrHy5mKPqt
	djmmSHrYoZMv/Cdjz+HTOKMF+QwjIL0zymFrK1XSNH8MY9f/z5dgIkuzQ6ZWP6+bNKvJgCu7buSiM
	6S0zBwGk/GlPY4LXY8ALHgJd3nGU274N9jJfdPnHsw5Y7ZYOsyMUwaWTaGvAftaa13VV9i14S6KFZ
	nXeRPzK8euV2ovGGI50TeMmPLJ7V/gjcoHuyMzB3+6nBoFusfhyM8+PwC6Mw2YApYYVw7wtstFC0B
	7I9fAzVfTpOvg9IHSia+SPH3o/IvqVzFwXGm1fbh5oBcEiPuG3jusvPGl5g6Mx8xMGVnEfRaS22Sl
	eN/olT3g==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CVU-0000000DsYh-0V9z
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 06:09:42 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so488614b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 23:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759385370; x=1759990170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zmmvMMm35WfJWJCu/rbPWUzK6j6v7Igidp5p7E+6WY=;
        b=FauhZOxZLWrYDJyyre37kyUoJzSlGocRYV53P1X89jNMGBelnrebd/ZyNpTtX2dnfe
         t79Fx2qw1+u7ZyF74x9lMlFZZmPihrT7+upisj0gftOYSSEH+fGiwwj0OpeXAVexQ6pS
         CcrXvfh8w86IGT8bvpD7Re0f2nj46+hoj+e5/jDj9RHwClz7ZFY0YmgBZ3DlBU2iDaGl
         ojUFjKQ9qdfyek0qYsL/p8yyGhpIRsqzLcHRnPuRLAtObEQ8vsjktwf264zyP+/rpg1F
         rkgUvKiLg/udwWLxBTJ7aXdNysZ2QejP7+3R+D2ze3M45itPxS3GBpJpHDrlK0zoDB78
         lW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759385370; x=1759990170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zmmvMMm35WfJWJCu/rbPWUzK6j6v7Igidp5p7E+6WY=;
        b=A9QZgS3LNttCvYJQPtjWCyoBsYIMV70Kk2YeSbaFkrPkt9plfd4kGdy5Y9h2kuT591
         FgrQxMErJMXNkiDAPZpEM2idx2C3lI3B4f/RPZrHGNviSY7DSR5iD4mVv5a59ax/mE2G
         FMRTWkUYx3p/NfTy629/YIV7ScvHVfqqgoYXwd9fPXVlS9K5NcQDAJZApyVjA9TIXEsE
         ZLuooq50jBABWosgQk6QXzuUSuWSZ+gYprfd7yVsuu8kvfk+FtQ+0PSiJDxQKxG5Hh70
         0Coj9hSQfe/v9ZZdPxi00vABEqmXJ1f8ATvBr9a7w/qC/GFIcQhoaQYmiwJ62QhR1B0l
         GJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCVGh5s6EzIdUhn1Wn7vV1t/kJLuaxPg8VKgz/ZZt1uUxIwPWCReU5tpejC+UumVJuEk+2wfMnkC6FRvMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdL0DrMb0WwDuWkdbRfkCQc8NH/HXzVPmtW64nQRacgF7AcmR6
	CTKgMTHlf66+V+noJXW7KuZQoOgUqHfdtpipfJ0KxzdzzgyMUAkfSAIkvLEctRqQIGU=
X-Gm-Gg: ASbGncutGHNEp9g+f5do7vQvnR5KinFBB5mtxF1rOkN4GUp92GvzTAr9jDDn1Cw+LEX
	gDbN743Q0TirKKiVUQcbsCriSlUvcAZomcN9CCyeVEVfGLIFaLCLh5ORlxiQliEuaEU8OQbKIkh
	wqLYwqbrRLfj9C89G4GQC+zLMm12o1Zrji+262ZNcZC44VgbicuOgftV1akUd5MgjT+4/jMtNNd
	OGvHN86GEYNCs6UgKgbN0xYUMx7P9obsBYWWUwVfC0OABz1YYniSHcDCz9V/kCTkCrrX9fGXgy7
	Yu2iECIgx84CA5UxpTbHnk+dk4rs5ComA29QMObtEdJAzZ68HaOScrwNb05MAot8hcvzXAdltCw
	c/u2uE3IM2uqHh53U/kgRcpreXdnj+NVT9Q49jwRxRPTv5KQD2UMadHimkrw97s3CV5JfCl0u05
	EOFXM=
X-Google-Smtp-Source: AGHT+IF+YSzJ58uViX8Nc9sdQwacWiEzaK5CydbflVdamOordFViOPRH4V5+hIAsR14420tWtxw0Bw==
X-Received: by 2002:a05:6a21:3943:b0:243:78a:82c4 with SMTP id adf61e73a8af0-32a261f188amr2830964637.25.1759385370384;
        Wed, 01 Oct 2025 23:09:30 -0700 (PDT)
Received: from localhost.localdomain ([122.171.19.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f594afsm1205029a12.37.2025.10.01.23.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 23:09:29 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH 10/11] perf tools: Initial support for RISC-V trace decoder
Date: Thu,  2 Oct 2025 11:37:31 +0530
Message-ID: <20251002060732.100213-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002060732.100213-1-apatel@ventanamicro.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_070937_415596_DCF55CBF 
X-CRM114-Status: GOOD (  18.63  )
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
index 4959e7a990e4..2305638283c4 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -142,6 +142,7 @@ perf-util-$(CONFIG_AUXTRACE) += cs-etm.o
 perf-util-$(CONFIG_AUXTRACE) += cs-etm-decoder/
 endif
 perf-util-$(CONFIG_AUXTRACE) += cs-etm-base.o
+perf-util-$(CONFIG_AUXTRACE) += rvtrace-decoder.o
 
 perf-util-y += parse-branch-options.o
 perf-util-y += dump-insn.o
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 735f6c360064..5ccb5f3d9af8 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -54,6 +54,7 @@
 #include "arm-spe.h"
 #include "hisi-ptt.h"
 #include "s390-cpumsf.h"
+#include "rvtrace.h"
 #include "util/mmap.h"
 
 #include <linux/ctype.h>
@@ -1394,6 +1395,8 @@ int perf_event__process_auxtrace_info(struct perf_session *session,
 		err = hisi_ptt_process_auxtrace_info(event, session);
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

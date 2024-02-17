Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE17C48BF5
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 00:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rcfQpY4lU/jO8rK1b+HVAX7lxVyNlFgm6yVtIa5YiI=; b=Y9j92JFeaYLvgK
	hk5Hirk7ejd4gqcbEg0qYIdXJ0b2P8IOf+MbJaP/Pr62xDxnLRzzEEVnC4+hdFrp5QRwlBu/ifuq9
	T3EZ9R9QnLohq88tIkahzzgrjBZSlekl8RfSHqxk9gt/o8mgQYP0FHXbqpYs/ephG8bRksTbUO8f5
	0Yf1vUkfHQq7VkfnT/VS7B4JVRf+mwIrSOBWUYm/sklWZne4stnaIoe4b6DH8xw7CNWwLMeazpZQG
	3ZyQzL7jxxlrtL27S+YT9X2qH4sAVNfKzCGoK0VXLGA/S+DioK3vBpenIWYa6oKyjan1mz+TM1TAD
	I5eDPC5vS18a/dMQ8xUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb939-00000004Isx-46Uf;
	Sat, 17 Feb 2024 00:59:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92q-00000004Ib5-2gmX
	for linux-riscv@bombadil.infradead.org;
	Sat, 17 Feb 2024 00:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EtMupTUIOKSWIiS3+KSauzncMWOa0iz/fT9+70O+xec=; b=oU//fNl0V7wdZcimINZyiX5l6s
	W0hOGiQOUKPKc3Zj8V6fIDr5BulqGtqED5pNCHJR4m7O2y/oCt5AJVZx77ehVQxoiOywzWYEVgdWt
	SYbHlfzMkIH9r+3uCudBMufbYOIdeAw0VQJKLExr+i0T4usAgqRa3G3u7mCZLN+KQEUGLsK3AqRL7
	LVIPUahfTTvIDPKhXnPemyL3uAafphbJwAfP21oAy9EMLJ9oZ7Ln4HN9Lb5foTENxfL4nQYr7679+
	AVcuEavXOWAFkOu7k0Hmr3ZQbW9jdbkhqKOPiwHtfon+50LVBJrOz0lfBoq0cjdl0rNdivAChG9tG
	KI2a9Y+A==;
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92l-000000066Vq-1Ict
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:59:07 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-59fb5b09cc2so17020eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131535; x=1708736335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtMupTUIOKSWIiS3+KSauzncMWOa0iz/fT9+70O+xec=;
        b=v6G6/ZkxRVLKYPQcRUv7QT+wN5bVNOawpaTJg3MVppLx0FGPAXrm1L6/HHSrzmzL4O
         APP82krbnyE1uKx9IJS9EGKOeYlV6TrQpx3/36gxsdCpBm162FthSRpBxwasRNgM8aqP
         bYtTrXy6e0M9SVzD78V8nVe0Sgo38uVPn01NdngKpMDmefu6G+M+riHJqXuELgoeEPiR
         ckD5pKHn5Esq83kgqvfl47yz5i6pyBEnjlmoV0DXtkYqmKlok0n7R52v8etZLgainPcp
         ljc989JgP4n6l6ochtd6a99K9yKx2/AlCDfA5yCxvi7ACJGKifRVT8tct8I3d8JDoYGe
         U0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131535; x=1708736335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtMupTUIOKSWIiS3+KSauzncMWOa0iz/fT9+70O+xec=;
        b=S0CyN8/2qZWKGLMf6pBEUpDQwCEhrNtMVHzloM5fcKkFOYDPpqfQR/O2+gGSLWTrKB
         WXcdZVQTVBm2Hf3Ft53mg2L6gb1kVbIn065hiw4muwsGE2bIYbiL5W/+iwAVYV+/x0ox
         UZ/lFKeQlYOdOjCZVjLnHPCEwCDj4wydkq4CBccKSUgIuCVAC5wqkavRnEXnJuAioQmB
         kNetTiJA5ZSZvQyismKlPda2/47FSJ0gCZM73Cc2ILKwmIrZADZLPTvQXRwkE85ZE3tC
         VzQY8FqfFh37RWoyZ9mg89UZ4HHRYZNoJ+BgLxCq0GheVPl3ugn49hmsfB08CVEuqugI
         D5JA==
X-Forwarded-Encrypted: i=1; AJvYcCXuaI7m2yn03f+l+UVdZKuNVciHOLU3xVxgEu98ll7wnz47rxie8en1+B7iae3G72GgP/prDoR177D2OagJ1nBpBMgRk3SOW2NYj4yB9MzR
X-Gm-Message-State: AOJu0YxjBng5NdSZI7ikQVR6LDl/rKlLEgEysCGRJI+faJ0HeK6VL6Ri
	qDGdotiLWu1X2JCd48BJHiqE8FDAM0zXtCIVSpAu+UL0yEnoqo1faA3ZPJTOVXU=
X-Google-Smtp-Source: AGHT+IGNbIUzWm0Nd5NFQVXMQHrTszP1TZWkXMNIGjnbL/tst4Vl5kEoxiI6rU6dM0tRW8yXxuE6PQ==
X-Received: by 2002:a05:6358:2913:b0:177:afce:b12 with SMTP id y19-20020a056358291300b00177afce0b12mr6399019rwb.31.1708131533554;
        Fri, 16 Feb 2024 16:58:53 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:58:53 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 15/20] tools/perf: Add arch hooks to override perf standard events
Date: Fri, 16 Feb 2024 16:57:33 -0800
Message-Id: <20240217005738.3744121-16-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_005904_820235_D1F3D847 
X-CRM114-Status: GOOD (  23.91  )
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

RISC-V doesn't have any standard event encoding defined in the
ISA. Cycle/instruction event is defined in the ISA but lack of
event encoding allow vendors to choose their own encoding scheme.
These events directly map to perf cycle/instruction events which
gets decoded as per perf definitions. An arch hooks allows the
RISC-V implementation to override the encodings if a vendor has
specified the encodings via Json file at runtime.

The alternate solution would be define vendor specific encodings in
the driver similar to other architectures. However, these will grow
over time to become unmaintainable as the number of vendors in RISC-V
can be huge.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/arch/riscv/util/Build              |  1 +
 tools/perf/arch/riscv/util/evlist.c           | 59 +++++++++++++++++++
 tools/perf/builtin-record.c                   |  3 +
 tools/perf/builtin-stat.c                     |  2 +
 tools/perf/builtin-top.c                      |  3 +
 .../pmu-events/arch/riscv/arch-standard.json  | 10 ++++
 tools/perf/pmu-events/jevents.py              |  6 ++
 tools/perf/util/evlist.c                      |  6 ++
 tools/perf/util/evlist.h                      |  6 ++
 9 files changed, 96 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/evlist.c
 create mode 100644 tools/perf/pmu-events/arch/riscv/arch-standard.json

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 603dbb5ae4dc..b581fb3d8677 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1,5 +1,6 @@
 perf-y += perf_regs.o
 perf-y += header.o
+perf-y += evlist.o
 
 perf-$(CONFIG_DWARF) += dwarf-regs.o
 perf-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/riscv/util/evlist.c b/tools/perf/arch/riscv/util/evlist.c
new file mode 100644
index 000000000000..9ad287c6f396
--- /dev/null
+++ b/tools/perf/arch/riscv/util/evlist.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <stdio.h>
+#include "util/pmu.h"
+#include "util/pmus.h"
+#include "util/evlist.h"
+#include "util/parse-events.h"
+#include "util/event.h"
+#include "evsel.h"
+
+static int pmu_update_cpu_stdevents_callback(const struct pmu_event *pe,
+					     const struct pmu_events_table *table __maybe_unused,
+					     void *vdata)
+{
+	struct evsel *evsel = vdata;
+	struct parse_events_terms terms;
+	int err;
+	struct perf_pmu *pmu = perf_pmus__find("cpu");
+
+	if (pe->event) {
+		parse_events_terms__init(&terms);
+		err = parse_events_terms(&terms, pe->event, NULL);
+		if (err)
+			goto out_free;
+		err = perf_pmu__config_terms(pmu, &evsel->core.attr, &terms,
+					     /*zero=*/true, /*err=*/NULL);
+		if (err)
+			goto out_free;
+	}
+
+out_free:
+	parse_events_terms__exit(&terms);
+	return 0;
+}
+
+int arch_evlist__override_default_attrs(struct evlist *evlist, const char *pmu_name)
+{
+	struct evsel *evsel;
+	struct perf_pmu *pmu = perf_pmus__find(pmu_name);
+	static const char *const overriden_event_arr[] = {"cycles", "instructions",
+							  "dTLB-load-misses", "dTLB-store-misses",
+							  "iTLB-load-misses"};
+	unsigned int i, len = sizeof(overriden_event_arr) / sizeof(char *);
+
+	if (!pmu)
+		return 0;
+
+	for (i = 0; i < len; i++) {
+		if (perf_pmus__have_event(pmu_name, overriden_event_arr[i])) {
+			evsel = evlist__find_evsel_by_str(evlist, overriden_event_arr[i]);
+			if (!evsel)
+				continue;
+			pmu_events_table__find_event(pmu->events_table, pmu,
+						     overriden_event_arr[i],
+						     pmu_update_cpu_stdevents_callback, evsel);
+		}
+	}
+
+	return 0;
+}
diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index 86c910125172..305c2c030208 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -4152,6 +4152,9 @@ int cmd_record(int argc, const char **argv)
 			goto out;
 	}
 
+	if (arch_evlist__override_default_attrs(rec->evlist, "cpu"))
+		goto out;
+
 	if (rec->opts.target.tid && !rec->opts.no_inherit_set)
 		rec->opts.no_inherit = true;
 
diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
index 5fe9abc6a524..a0feafc5be2c 100644
--- a/tools/perf/builtin-stat.c
+++ b/tools/perf/builtin-stat.c
@@ -2713,6 +2713,8 @@ int cmd_stat(int argc, const char **argv)
 
 	if (add_default_attributes())
 		goto out;
+	if (arch_evlist__override_default_attrs(evsel_list, "cpu"))
+		goto out;
 
 	if (stat_config.cgroup_list) {
 		if (nr_cgroups > 0) {
diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
index 5301d1badd43..7e268f239df0 100644
--- a/tools/perf/builtin-top.c
+++ b/tools/perf/builtin-top.c
@@ -1672,6 +1672,9 @@ int cmd_top(int argc, const char **argv)
 			goto out_delete_evlist;
 	}
 
+	if (arch_evlist__override_default_attrs(top.evlist, "cpu"))
+		goto out_delete_evlist;
+
 	status = evswitch__init(&top.evswitch, top.evlist, stderr);
 	if (status)
 		goto out_delete_evlist;
diff --git a/tools/perf/pmu-events/arch/riscv/arch-standard.json b/tools/perf/pmu-events/arch/riscv/arch-standard.json
new file mode 100644
index 000000000000..96e21f088558
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/arch-standard.json
@@ -0,0 +1,10 @@
+[
+  {
+    "EventName": "cycles",
+    "BriefDescription": "cycle executed"
+  },
+  {
+    "EventName": "instructions",
+    "BriefDescription": "instruction retired"
+  }
+]
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 81e465a43c75..30934a490109 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -7,6 +7,7 @@ from functools import lru_cache
 import json
 import metric
 import os
+import re
 import sys
 from typing import (Callable, Dict, Optional, Sequence, Set, Tuple)
 import collections
@@ -388,6 +389,11 @@ class JsonEvent:
     if arch_std:
       if arch_std.lower() in _arch_std_events:
         event = _arch_std_events[arch_std.lower()].event
+        if eventcode:
+          event = re.sub(r'event=\d+', f'event={llx(eventcode)}', event)
+        if configcode:
+          event = re.sub(r'config=\d+', f'event={llx(configcode)}', event)
+
         # Copy from the architecture standard event to self for undefined fields.
         for attr, value in _arch_std_events[arch_std.lower()].__dict__.items():
           if hasattr(self, attr) and not getattr(self, attr):
diff --git a/tools/perf/util/evlist.c b/tools/perf/util/evlist.c
index 55a300a0977b..f8a5640cf4fa 100644
--- a/tools/perf/util/evlist.c
+++ b/tools/perf/util/evlist.c
@@ -357,6 +357,12 @@ __weak int arch_evlist__add_default_attrs(struct evlist *evlist,
 	return __evlist__add_default_attrs(evlist, attrs, nr_attrs);
 }
 
+__weak int arch_evlist__override_default_attrs(struct evlist *evlist __maybe_unused,
+					       const char *pmu_name __maybe_unused)
+{
+	return 0;
+}
+
 struct evsel *evlist__find_tracepoint_by_id(struct evlist *evlist, int id)
 {
 	struct evsel *evsel;
diff --git a/tools/perf/util/evlist.h b/tools/perf/util/evlist.h
index cb91dc9117a2..705b6643b558 100644
--- a/tools/perf/util/evlist.h
+++ b/tools/perf/util/evlist.h
@@ -109,9 +109,15 @@ int arch_evlist__add_default_attrs(struct evlist *evlist,
 				   struct perf_event_attr *attrs,
 				   size_t nr_attrs);
 
+
 #define evlist__add_default_attrs(evlist, array) \
 	arch_evlist__add_default_attrs(evlist, array, ARRAY_SIZE(array))
 
+int arch_evlist__override_default_attrs(struct evlist *evlist, const char *pmu_name);
+
+#define evlist__override_default_attrs(evlist, pmu_name) \
+	arch_evlist__override_default_attrs(evlist, pmu_name)
+
 int arch_evlist__cmp(const struct evsel *lhs, const struct evsel *rhs);
 
 int evlist__add_dummy(struct evlist *evlist);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

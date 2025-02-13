Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9547BC021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 22:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HqJOYZPjHTNO4NFvdUCwXtzjK0qxTAg1LXpmf+m0bw=; b=X77lUgwKlS15cx
	D51G40cnD+LSsKfTnEXzJ2LY6L+c9ix7+iu/+Za02RJIYMqbTryj+MqJLMMOj6xculLvk3XnKHi5h
	ZksRpPCMYz+ODAyi2R08/elRonj+X7zMeAq+gZwuZ8TCHyaASgrFSF9Y1ENL68DhJI4lJ4bHEt9ah
	kfxvky3LVCuOL+DBMVFlyP0kOrAWa7F8W9dQJa6Ib5mj2UazpKlPOVRt68+Ad7tmWLH1UnEcmd5W2
	lx5jeSOT4OKn4EFqzSlJpSfnyyx7JsdQ6gRJfDNHgbSziLeLM1RuW5aOgF6qHFXL+GuV3sbT7CUPq
	y3kaykzMFpL9cF5rYAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJI-0000000ClWn-25Th;
	Thu, 13 Feb 2025 22:03:52 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJG-0000000ClUI-0jsi
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 22:03:51 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f44e7eae4so25677635ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 14:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1739484229; x=1740089029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/XRmolauA8HsXL+HjHSdxsYuvck1P5cD8Pp1VwoHlc=;
        b=SEivPpykx3Hj7rzZx98QlhdK9i/paurXgKDlYyJf4vxmpb7cnsxDl9vWl9PSOUOXtc
         B8AHfxwO3Opx1JECmlRNDDEpIedRRrlVF5vq1pqHCfemnZ2kbd5SxnRcsQIMloXQyiNS
         6X/y1UPm4HjChWq6ogf3CipfYvHSzso94Z1DbAFhOZq/b5eiXfP74jL4if7X0jTmVmGT
         ng2C+s9xw4IUbdlSKJTgOwFWubz0/wI5G5FrC5Lkxhgr0V7fJMiz+DsGvpBuLjXusj6d
         WBls2Fy2y27VthIESBN5qgL5+spDX/mD1MhTavZbyTurpzvxAVhPQwQoQJFCOy30XgU0
         NB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739484229; x=1740089029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/XRmolauA8HsXL+HjHSdxsYuvck1P5cD8Pp1VwoHlc=;
        b=t25mqW+6rM5tnRlhacaJpicJGwOCbAxlPDf2wZJydv43jywQwpUV/2GTb63/brqA1x
         N6+VzNf7XI8DMxWH5DVnu4CuPpOz3CB3bzU8S9WVrgQcuE0sx0xtym0Wp8X8unV/rORQ
         pW6fpCcOjpEVGu1XjLilfV82JqR0Ht+EFAy8263EHt1t96MNVXZMqq2d7FRCpbRV77ze
         boXDvnnso/pjIcMUI1/F5eDiU6yRet4a5P4qXJ4HbZBwKi+DvzjTsHxPAMs9c1cmmzY3
         LsKikjf5UvM5MnprTK3utvD1dwExqtTFQKlRaq1TMNFATX/DH14Pt2knmIN4uQoBOpUC
         N3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCU1FaUxaQf23JrM0WXqAV/iyYqZNHOew5rYa0QOtD37Bp8zMyO6h9cdjlJ61O/gdupGh3docOG7eT2YWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvpvkJ/zPfjotriaKVpYzhsFm8xdO7+pipVaXa14tH4w0rdGKS
	m1ZX/CVZG397pHPXr6wlXEOGJrt25571BJyqe6FQ9Pr85Xc+dTGyQaA8x0vKgP4=
X-Gm-Gg: ASbGncuO/BsrmUIyGtYsVC1jtaeVrBI44lPKDVs7EuVktmv1fPUBG9jBuxW61yCn+UK
	YhCnkbizC3AL2r608vXK3Awo7QF2cR5lbZfGCRGGkxBykjlkrD9uGShzbsZKvKUgHVYVUzy9WU5
	MkrmOrQz1u2AF/VzjiPV4Q33EeXytgl45rUOEmxjnwXlyIrPPT/OF+3e8rj0Wd8kw2/r8R6VTlJ
	lSGP+czO7aAn9R9PNCJ7ApPpB9bGz/8GMnjzapaLCGWl3ualBvq3h2xMYv4lZBC0hA9DohQBXSV
	phWIgcI9Jd0aX5oT4imLCSgjThwm9Jhvp399pA==
X-Google-Smtp-Source: AGHT+IFr5642PZ4S4cAQu565jWRyFkBlnbXCXSsluhdUxLUrOkhRXXGZABXTDLwLTypE1Yp85dnzGQ==
X-Received: by 2002:a05:6a00:848:b0:730:8d25:4c31 with SMTP id d2e1a72fcca58-7322c38506cmr15085587b3a.8.1739484229334;
        Thu, 13 Feb 2025 14:03:49 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e438sm1847491b3a.94.2025.02.13.14.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:03:49 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Jiri Olsa <jolsa@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Eric Lin <eric.lin@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RESEND PATCH 4/7] perf vendor events riscv: Add SiFive Bullet version 0x07 events
Date: Wed, 12 Feb 2025 17:21:37 -0800
Message-ID: <20250213220341.3215660-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250213220341.3215660-1-samuel.holland@sifive.com>
References: <20250213220341.3215660-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_140350_219697_F0D2C46E 
X-CRM114-Status: GOOD (  17.06  )
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

From: Eric Lin <eric.lin@sifive.com>

SiFive Bullet microarchitecture cores with mimpid values starting with
0x07 or greater add new PMU events to support debug, trace, and counter
sampling and filtering (Sscofpmf).

All other PMU events are unchanged from earlier Bullet cores.

Signed-off-by: Eric Lin <eric.lin@sifive.com>
Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 tools/perf/pmu-events/arch/riscv/mapfile.csv  |  1 +
 .../cycle-and-instruction-count.json          | 12 ++++
 .../arch/riscv/sifive/bullet-07/firmware.json |  1 +
 .../riscv/sifive/bullet-07/instruction.json   |  1 +
 .../arch/riscv/sifive/bullet-07/memory.json   |  1 +
 .../riscv/sifive/bullet-07/microarch.json     | 62 +++++++++++++++++++
 .../riscv/sifive/bullet-07/watchpoint.json    | 42 +++++++++++++
 7 files changed, 120 insertions(+)
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/cycle-and-instruction-count.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/firmware.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/instruction.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/memory.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/microarch.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/bullet-07/watchpoint.json

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index 521f416b0006..8706d289215e 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -15,6 +15,7 @@
 #
 #MVENDORID-MARCHID-MIMPID,Version,Filename,EventType
 0x489-0x8000000000000007-0x[[:xdigit:]]+,v1,sifive/bullet,core
+0x489-0x8000000000000[1-9a-e]07-0x[78ac][[:xdigit:]]+,v1,sifive/bullet-07,core
 0x5b7-0x0-0x0,v1,thead/c900-legacy,core
 0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
 0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/cycle-and-instruction-count.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/cycle-and-instruction-count.json
new file mode 100644
index 000000000000..5c8124cfe926
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/cycle-and-instruction-count.json
@@ -0,0 +1,12 @@
+[
+  {
+    "EventName": "CORE_CLOCK_CYCLES",
+    "EventCode": "0x165",
+    "BriefDescription": "Counts core clock cycles"
+  },
+  {
+    "EventName": "INSTRUCTIONS_RETIRED",
+    "EventCode": "0x265",
+    "BriefDescription": "Counts instructions retired"
+  }
+]
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/firmware.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/firmware.json
new file mode 120000
index 000000000000..34e5c2870eee
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/firmware.json
@@ -0,0 +1 @@
+../bullet/firmware.json
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/instruction.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/instruction.json
new file mode 120000
index 000000000000..62eacc2d7497
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/instruction.json
@@ -0,0 +1 @@
+../bullet/instruction.json
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/memory.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/memory.json
new file mode 120000
index 000000000000..df50fc47a5fe
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/memory.json
@@ -0,0 +1 @@
+../bullet/memory.json
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/microarch.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/microarch.json
new file mode 100644
index 000000000000..de8efd7b8b34
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/microarch.json
@@ -0,0 +1,62 @@
+[
+  {
+    "EventName": "ADDRESSGEN_INTERLOCK",
+    "EventCode": "0x101",
+    "BriefDescription": "Counts cycles with an address-generation interlock"
+  },
+  {
+    "EventName": "LONGLATENCY_INTERLOCK",
+    "EventCode": "0x201",
+    "BriefDescription": "Counts cycles with a long-latency interlock"
+  },
+  {
+    "EventName": "CSR_INTERLOCK",
+    "EventCode": "0x401",
+    "BriefDescription": "Counts cycles with a CSR interlock"
+  },
+  {
+    "EventName": "ICACHE_BLOCKED",
+    "EventCode": "0x801",
+    "BriefDescription": "Counts cycles in which the instruction cache was not able to provide an instruction"
+  },
+  {
+    "EventName": "DCACHE_BLOCKED",
+    "EventCode": "0x1001",
+    "BriefDescription": "Counts cycles in which the data cache blocked an instruction"
+  },
+  {
+    "EventName": "BRANCH_DIRECTION_MISPREDICTION",
+    "EventCode": "0x2001",
+    "BriefDescription": "Counts mispredictions of conditional branch direction (taken/not taken)"
+  },
+  {
+    "EventName": "BRANCH_TARGET_MISPREDICTION",
+    "EventCode": "0x4001",
+    "BriefDescription": "Counts mispredictions of the target PC of control-flow instructions"
+  },
+  {
+    "EventName": "PIPELINE_FLUSH",
+    "EventCode": "0x8001",
+    "BriefDescription": "Counts flushes of the core pipeline. Common causes include fence.i and CSR accesses"
+  },
+  {
+    "EventName": "REPLAY",
+    "EventCode": "0x10001",
+    "BriefDescription": "Counts instruction replays"
+  },
+  {
+    "EventName": "INTEGER_MUL_DIV_INTERLOCK",
+    "EventCode": "0x20001",
+    "BriefDescription": "Counts cycles with a multiply or divide interlock"
+  },
+  {
+    "EventName": "FP_INTERLOCK",
+    "EventCode": "0x40001",
+    "BriefDescription": "Counts cycles with a floating-point interlock"
+  },
+  {
+    "EventName": "TRACE_STALL",
+    "EventCode": "0x80001",
+    "BriefDescription": "Counts cycles in which the core pipeline is stalled due to backpressure from the Trace Encoder"
+  }
+]
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/watchpoint.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/watchpoint.json
new file mode 100644
index 000000000000..aa7a12818521
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet-07/watchpoint.json
@@ -0,0 +1,42 @@
+[
+  {
+    "EventName": "WATCHPOINT_0",
+    "EventCode": "0x164",
+    "BriefDescription": "Counts occurrences of watchpoint 0 with action=8"
+  },
+  {
+    "EventName": "WATCHPOINT_1",
+    "EventCode": "0x264",
+    "BriefDescription": "Counts occurrences of watchpoint 1 with action=8"
+  },
+  {
+    "EventName": "WATCHPOINT_2",
+    "EventCode": "0x464",
+    "BriefDescription": "Counts occurrences of watchpoint 2 with action=8"
+  },
+  {
+    "EventName": "WATCHPOINT_3",
+    "EventCode": "0x864",
+    "BriefDescription": "Counts occurrences of watchpoint 3 with action=8"
+  },
+  {
+    "EventName": "WATCHPOINT_4",
+    "EventCode": "0x1064",
+    "BriefDescription": "Counts occurrences of watchpoint 4 with action=8"
+  },
+  {
+    "EventName": "WATCHPOINT_5",
+    "EventCode": "0x2064",
+    "BriefDescription": "Counts occurrences of watchpoint 5 with action=8"
+  },
+  {
+    "EventName": "WATCHPOINT_6",
+    "EventCode": "0x4064",
+    "BriefDescription": "Counts occurrences of watchpoint 6 with action=8"
+  },
+  {
+    "EventName": "WATCHPOINT_7",
+    "EventCode": "0x8064",
+    "BriefDescription": "Counts occurrences of watchpoint 7 with action=8"
+  }
+]
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

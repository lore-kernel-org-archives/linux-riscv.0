Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8849C25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 02:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=faKTNB37SG4I9gDFjpKAGY+rQnwEv4AgObCJEeBFFnw=; b=ihrVMgeZIxf1N4
	4PqF5a7Om4WxZYNER4B+3KzkMA1GccEEV6NR0YpTsAW5Oh0NrFpB0QYythdKy7H7ZI46n62FP/WOj
	GryZoU9mQ5EYLBmGbk60ukIeQyE1A2R1dml/h5/Xp4/OIe7iK7forgPwlaRE2IkDTGdamxwAnECqz
	GNa6nZn4qj831Tr2V9wCqmAc5sqZuzfNzBFPbPaBma3fu6RFVkyM7xJ8UtLwJPKXd3nVL99EhFnCO
	gdbuUaO59OzKYBuEhxfV60N3RdSgs0aGkiZP6LGS5+w7qMQoDGmq4FbDSUPpYkpWF/rxeUs9dyaXK
	chFWEuXfjFl+crXVCt/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tK1-000000003QL-3zh5;
	Thu, 09 May 2024 02:15:49 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tJu-000000003JK-3cJA
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 02:15:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1ecddf96313so2697495ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 19:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715220939; x=1715825739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsqnhxaQmP+8s5AUmhtjZOLCmUrK+sfDqwiHe1ZPGJs=;
        b=ANRDbx6RT+z4x8EceoR4TD1EIEy/TRKrC+Y5iqyA3AfbuOmjrrssf6rYrfFoxXQ6bk
         cI4gGp9lkuXV8guF8xQSEXd6JlXGjOxYpV2FUheAC0syjkxLDjbaqYslpiYl3HJvfOh0
         R34h2XywDdmJ1aJ18/h3ipSs/g1UiHw1e1LIArzST2uITtqU5MBcTWMeJT9mzLs3w3Ub
         /iYOZXpCIU2+EIUn5jIOVOKMP9JARU/4tz8Hhf7hm3RvolqssyHu1j9ZujPvX3LTY2lT
         qxyAxr+dYzCwtdohc7tyVJndu/Xq82H43tswAge9l3zXp4xehth+bfxD/06pI/W69Zz7
         mv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715220939; x=1715825739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsqnhxaQmP+8s5AUmhtjZOLCmUrK+sfDqwiHe1ZPGJs=;
        b=NLph8hqBpy7Ec26MklIqXPVCvbXPKricsIWWfNOFjx9vqGmSY29xhDj+bUDVT3Tngk
         sTUhZABKMb3Tmqj8bqQZLjdGogqwyyr9fAQobDATa5KCyL+AZPWPWKoX28SkpnuvfEQK
         3NkDROySmXl3fUcX+L5EKGI9sh2K5F4PZtGvptSrlVB9kmkrdE9BynDs0x7bcp8+B/8e
         S5DUPy00BKC+EGsSHADcJ2unrJkCkF7Cs0DJ4EgUBNGwrEx6OHgBHqXLnhjBduMiSaWe
         0I823zeEJ5O+sXc0O8HhvuUM4EUukp9j4znexjN6H6iZ7UfF0uooZqzSa5Q2/eHAxe2k
         5I3A==
X-Forwarded-Encrypted: i=1; AJvYcCUg67j2Qmf5hSm1HBU2bjj8HemERB5cjl9vZX2iMPe2c6S9DLM91k27ABnRvFmYFD/wzhIUgzqgLiUlxJTHoe+gkWAQKjyN1b2DocqwHwot
X-Gm-Message-State: AOJu0Yy0rHi8ZxlnXqHDijIzNkNlAfLDFlvw53QOXvSHc35GZaOc0cla
	6Q+ZdK85363Ft/R1a4IOnfU8q7KkCq8WMEDj9R4ynGOrG6K13tPcH63kzLzdTNc=
X-Google-Smtp-Source: AGHT+IFggpqzp2voiW6Dn5QX5CcCPey3mFBNvNVLgEW7f6Fdb3zuwjAxPItMpaPovLTf+PBcqAQ7Kg==
X-Received: by 2002:a17:902:8486:b0:1eb:77ed:8fba with SMTP id d9443c01a7336-1eeb01a63f6mr46134765ad.17.1715220939401;
        Wed, 08 May 2024 19:15:39 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d176fsm2339115ad.58.2024.05.08.19.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 19:15:39 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Eric Lin <eric.lin@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 4/7] perf vendor events riscv: Add SiFive Bullet version 0x07 events
Date: Wed,  8 May 2024 19:14:57 -0700
Message-ID: <20240509021531.680920-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509021531.680920-1-samuel.holland@sifive.com>
References: <20240509021531.680920-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_191543_127802_CD1A840E 
X-CRM114-Status: GOOD (  18.10  )
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

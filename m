Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B56AC021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ijvioFhj4BRWPl/eAgiseGhyj3vRHjHPVNZALR+o9Q=; b=NyMFRb8plG1kzv
	uU8uGvY2E6Ps4/JuOdoLNorwocFp5uWifSdo3ya7NXZsHccy4ROU+rmiDxDlZJCY6dqjlsL6jlKO4
	GRSw/OLMHZ6fM/ezUoourDpOFpHwbXvd6FicGtzkqyj8aO4Tm4h/DOXG1qCfKPkL5vrLUEjwBIr9E
	82KVoYageF7S60emaGs6vgqevk7GOzu2jVfgfhOLuX22EKT6teK9MMMBvfekU6MAcaYMMxZ3Yg/n6
	J11uWxnCzNkmI2tKZ5UuJpc8dvED3lGO6OyMlYjyQiOA9KfOgb0aDwf3p6s+RWv+/OzO5vm36MujG
	0j4fVcITx2/DLo0/8BtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJN-0000000Clb0-01uC;
	Thu, 13 Feb 2025 22:03:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJJ-0000000ClWs-0dtV
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 22:03:54 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-220d39a5627so19615025ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 14:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1739484232; x=1740089032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18UWmkwgQnETzvo0Aj9eOHJgSlzdNFYfZZtF5VBdI4M=;
        b=hs2pTp+2/cigxrfb3AJzFcJLE3MTyL5eH3YEL8if+XODPPlqi+qHDd9hBRO3iibXA6
         4fK5WiHzBuUtfTXc0eG5JDx8zJOauybo/tDL006Pe0e+8BEbRMVo281u7oGUtzN7Lf+J
         XwvMnI269+e6e3yU/We94rTp+4//bGhAwo+Bpoes3Vbk6RYI8MJTOWTXIjunu/wgzrBh
         Qfduaa/KZ2c4XJAvlw36B2I2NBEJWbLxs32PZV801rAGAtcBwM1vxg6zPd/HUiMG6FFt
         mqQgXeZyDxvkaRqNCB2pDkiOjmkEMrteLzFHNKNIU0T7C9rN3/9OTVPFVhJbLqkEBUG1
         1+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739484232; x=1740089032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18UWmkwgQnETzvo0Aj9eOHJgSlzdNFYfZZtF5VBdI4M=;
        b=l7kyUG25dCEBeCBpo1DGko8XRTHuLG7X96G817iZaGmCvd0Rpfmp6cpJ6jmYQsyj3r
         2VTfh1H/6n3jwz5HvHIBbPuycM10EdBxDfb102XnlAz6q/dapYGv1oIKULCOIg0hBvyr
         cGDsx6XnDYSnmivYCrr0LCfI/RSUNVK6BTyFmWBsBIKy0zmGPrQtG0/OXc+BN35E/Txk
         JDeNZr+lavkIUFL+54z++y8EdVslGZ7o15deOjR/kUlKEAZOJK0LcYET7Sma3Q3sA401
         9LCtL7uweFwkEuaFvkCEd5mHzz4s9u7WKJDNp+eJW8Xu1h4wUKD0dr+fgejoFDy7LXcp
         OV+g==
X-Forwarded-Encrypted: i=1; AJvYcCUqmjqEDES/RJn3+5ZnedpKj+FjjwjVIjLyfXQISzwHL5/DWDqttdIb8b2HV9i/e5SR/wrJ3wSrv4vtIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrNNJwiSE8y9CtfN5jPgB0//+y9LZLx70evvks0bedl7o9Ed/F
	mocO2O7l2ED4vdhjByOhfOyz6JOp2gc5x64iaWoa72n3jbBCNopszjK+gWGfPUI=
X-Gm-Gg: ASbGncvuxIxbe8nVGTrcke11xIFJ7goHKYOGCqV5YMGCk/h5ZsX8ZXPaPDnS2FIbwbL
	mXprFlfkBYpo5aKl2fAWDvkPywu628AhVOdXraZgdwbx6Jcm0od5Uv9rNeQsLXHZvaWqJB6uM4H
	I6OXqyVSY/Itv0Aq+WO+vMzrd3/gJbRNEIjijIBSXr9pX7vOMB08h3PJ1gmCHHwTzLV1VhhwPHc
	YwvnutdkKVvmFtry7nnRLe4Svo02skYjfQhD2f1luMhrUkOKmq3MGlXCM9nYF5gVeGNEKM+TtJO
	srqHB8kmT8xWMpMvBpz/V7Gkqm5FJJZpQNKCow==
X-Google-Smtp-Source: AGHT+IGLTppNEBIeBL2TiGhJ2DPAD3uNJTiM4rrl/8BgBXGEKYmmklPnZ313IiR6VvxKReIiceuQYA==
X-Received: by 2002:a05:6a21:10c:b0:1ed:a6d7:3c07 with SMTP id adf61e73a8af0-1ee5e530dbdmr14915863637.4.1739484232128;
        Thu, 13 Feb 2025 14:03:52 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e438sm1847491b3a.94.2025.02.13.14.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:03:51 -0800 (PST)
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
Subject: [RESEND PATCH 6/7] perf vendor events riscv: Add SiFive P550 events
Date: Wed, 12 Feb 2025 17:21:39 -0800
Message-ID: <20250213220341.3215660-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250213220341.3215660-1-samuel.holland@sifive.com>
References: <20250213220341.3215660-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_140353_186246_DB4E9A88 
X-CRM114-Status: GOOD (  14.31  )
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

The SiFive Performance P550 core features an out-of-order
microarchitecture which exposes the same PMU events as Bullet,
plus events for UTLB hits and PTE cache misses/hits.

Add support for specifying these events using symbolic names.

Signed-off-by: Eric Lin <eric.lin@sifive.com>
Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 tools/perf/pmu-events/arch/riscv/mapfile.csv  |  1 +
 .../arch/riscv/sifive/p550/firmware.json      |  1 +
 .../arch/riscv/sifive/p550/instruction.json   |  1 +
 .../arch/riscv/sifive/p550/memory.json        | 47 +++++++++++++++++++
 .../arch/riscv/sifive/p550/microarch.json     |  1 +
 5 files changed, 51 insertions(+)
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p550/firmware.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p550/instruction.json
 create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/p550/memory.json
 create mode 120000 tools/perf/pmu-events/arch/riscv/sifive/p550/microarch.json

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index 9e9bd7ac0ebe..a301e9dbfd5a 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -17,6 +17,7 @@
 0x489-0x8000000000000007-0x[[:xdigit:]]+,v1,sifive/bullet,core
 0x489-0x8000000000000[1-9a-e]07-0x[78ac][[:xdigit:]]+,v1,sifive/bullet-07,core
 0x489-0x8000000000000[1-9a-e]07-0xd[[:xdigit:]]+,v1,sifive/bullet-0d,core
+0x489-0x8000000000000008-0x[[:xdigit:]]+,v1,sifive/p550,core
 0x5b7-0x0-0x0,v1,thead/c900-legacy,core
 0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
 0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/p550/firmware.json b/tools/perf/pmu-events/arch/riscv/sifive/p550/firmware.json
new file mode 120000
index 000000000000..34e5c2870eee
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/p550/firmware.json
@@ -0,0 +1 @@
+../bullet/firmware.json
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/p550/instruction.json b/tools/perf/pmu-events/arch/riscv/sifive/p550/instruction.json
new file mode 120000
index 000000000000..62eacc2d7497
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/p550/instruction.json
@@ -0,0 +1 @@
+../bullet/instruction.json
\ No newline at end of file
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/p550/memory.json b/tools/perf/pmu-events/arch/riscv/sifive/p550/memory.json
new file mode 100644
index 000000000000..8393f81b2cf0
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/p550/memory.json
@@ -0,0 +1,47 @@
+[
+  {
+    "EventName": "ICACHE_MISS",
+    "EventCode": "0x102",
+    "BriefDescription": "Counts instruction cache misses"
+  },
+  {
+    "EventName": "DCACHE_MISS",
+    "EventCode": "0x202",
+    "BriefDescription": "Counts data cache misses"
+  },
+  {
+    "EventName": "DCACHE_RELEASE",
+    "EventCode": "0x402",
+    "BriefDescription": "Counts writeback requests from the data cache"
+  },
+  {
+    "EventName": "ITLB_MISS",
+    "EventCode": "0x802",
+    "BriefDescription": "Counts Instruction TLB misses caused by instruction address translation requests"
+  },
+  {
+    "EventName": "DTLB_MISS",
+    "EventCode": "0x1002",
+    "BriefDescription": "Counts Data TLB misses caused by data address translation requests"
+  },
+  {
+    "EventName": "UTLB_MISS",
+    "EventCode": "0x2002",
+    "BriefDescription": "Counts Unified TLB misses caused by address translation requests"
+  },
+  {
+    "EventName": "UTLB_HIT",
+    "EventCode": "0x4002",
+    "BriefDescription": "Counts Unified TLB hits for address translation requests"
+  },
+  {
+    "EventName": "PTE_CACHE_MISS",
+    "EventCode": "0x8002",
+    "BriefDescription": "Counts Page Table Entry cache misses"
+  },
+  {
+    "EventName": "PTE_CACHE_HIT",
+    "EventCode": "0x10002",
+    "BriefDescription": "Counts Page Table Entry cache hits"
+  }
+]
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/p550/microarch.json b/tools/perf/pmu-events/arch/riscv/sifive/p550/microarch.json
new file mode 120000
index 000000000000..ba5dd2960e9f
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/sifive/p550/microarch.json
@@ -0,0 +1 @@
+../bullet/microarch.json
\ No newline at end of file
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

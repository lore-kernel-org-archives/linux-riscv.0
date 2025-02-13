Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE2AC021A4
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 22:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjiuD3FiGujzfbHhRMlB9cTye6w+hUMEALXE/FGFPws=; b=SdhhQ586ZmvpS+
	V+1kctC0rZXI+A6038DBZ9pwu0sKhJeMptR8yskXjKfvGSbXkIkZcNBAwP2wrdeym0GTYljZnjKnu
	cMNfkt90+l/pOkFkpKIBg8Ah8LbPXZP5N8pX7S4hXv+URYLuYqhd2LQrywGg4HptMyDtcV5O3LujL
	8gFinnM/uCegnEMti6vFBaxCJ0P/dFcQ9oyMPxJpqfZrgvdyFm64vgXq2to3tA4P6bIgPGi/uaIIX
	Xm20zw4Ibh72KSuN+FGh9m22Vawxv19etPEEHI1MYKnjOTZD4tAwiGt6HzhLezkAgO0Qq187AOOEh
	4pAIQ9CVaqqS3zxwnpWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJH-0000000ClVj-38cO;
	Thu, 13 Feb 2025 22:03:51 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihJF-0000000ClT0-0GH4
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 22:03:50 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2fc292b3570so701960a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 14:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1739484228; x=1740089028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeNVoNYpyWmAYcTXSWgq1Wck1u4KyPy10iVrXroX1W0=;
        b=b7bzXSBQphF508d0r9CeZn6XxFmHG60qxiuTP+cT8FWPFtocgezT2cjgaccaMvRVkw
         NkY5r33zPsYylN9kAqTq4REwZqEXrivKr5nqNpY6opK7FlNP0A3nUPkGrZVJpceZ7ezW
         noRr136kpLkjZ/bPlVoUQTx6xotdW5seSN33TpvKFjI3iV1XUSOvbtimzTQs1KYhOW+q
         C/3WcKpKXiKFMJWEbOI7mJrTymta/EeG/w7uegczfiqBKqcGCAfvHoHsjL7hZ4JLS5zt
         aPqmmW/1kERU4LFFuviahxbThqT65afV1PK9FvsnQoIlfxQ1THbGiPZSi2s+z496yoWs
         D24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739484228; x=1740089028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xeNVoNYpyWmAYcTXSWgq1Wck1u4KyPy10iVrXroX1W0=;
        b=MoedTD/broyhfkc7kdiVwFe8d/qhTy4XfsehbybBEkO0U0KU3mQa5GGP4CJXJB//30
         vhN4paXMPERU0qyRylbokYcCQYhZZlsQrWqQjLu1sPadg/mvZmjPXPAClV9Ri+8UfRIh
         VH4nVUoYrmco0G6gIWde7t367kg1JnCYiWN0gpBjKxHuoC6GlPKW9ADLTfxKw6KyVx4m
         GrGmkWFpO3BLE7czIZrele9K878rclFWiYK3iOHsHJEi7I92NEQuze7BvRYEOUoWyh3D
         PtZBDgvvKacJ6YYe0KibEDjWizWWHcBYpdarVXXt1Ll7fGSPCuniZ0BuRGP+AQjEXI0x
         Cm0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDZ0KXLycLr0QSboC8b2IlgCce/01fcripfKhNupmSkonJDCZ0osoI/Nov9kUf1OUMRsneVUMHScRaKw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+EDKiaIqNwROpFVgrTMpHfR4bEf5O0uE71IqS5LxXvrT4+29+
	bvuAfLYudsPI6y5nS436tPNxlX/l+Ltcf07RSzYyxTALuKRe8vDc1W5hh3GZwsU=
X-Gm-Gg: ASbGncvawIhRzSaCcmG0OiMax4rOUc2ZWK3S4SgvLPwLdOpUzpYJLjXasu2zy7IvMKO
	nTvsgHpfL43nG5TVLamjDvmGhCdCnoAeM9zSGwHxKrd9Bnd9MHoEFS4yX3/rv7iNBnwKrsZTlyz
	mMTIacQLs2pjTv8BlfPsNk9itlrxA/7ChM3dTJ/5yykfeiGa9Vxvq2pcN6l52nG90qjr6rJmqcR
	0ZpAOaNjj+/SEq+M6gxVnsNWJ1Ga1Bjts7y3b2JcW00QNxQYWORgrtn5vRLAtqVXF9P/Nz0HilM
	RAssjVsC/xXpYc3SuIYxg4qt2WhFeqxOpEstPQ==
X-Google-Smtp-Source: AGHT+IHnuVlNMFPAoL0Y+6j/6cimg69Ufm3HsDZD07eMDnYdRVpW30E9B1x9uqsr06kWIo67J880Og==
X-Received: by 2002:a05:6a00:aa8e:b0:725:ea30:aafc with SMTP id d2e1a72fcca58-7323c1059f6mr6695686b3a.5.1739484227953;
        Thu, 13 Feb 2025 14:03:47 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e438sm1847491b3a.94.2025.02.13.14.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:03:47 -0800 (PST)
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
Subject: [RESEND PATCH 3/7] perf vendor events riscv: Update SiFive Bullet events
Date: Wed, 12 Feb 2025 17:21:36 -0800
Message-ID: <20250213220341.3215660-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250213220341.3215660-1-samuel.holland@sifive.com>
References: <20250213220341.3215660-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_140349_119487_450E96DC 
X-CRM114-Status: GOOD (  10.88  )
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

Regenerate the event lists from the original hardware description. This
makes them consistent with the event lists for newer versions of the
hardware, allowing most files to be reused across hardware versions.

Signed-off-by: Eric Lin <eric.lin@sifive.com>
Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 .../arch/riscv/sifive/bullet/instruction.json | 44 +++++++++----------
 .../arch/riscv/sifive/bullet/memory.json      | 24 +++++-----
 .../arch/riscv/sifive/bullet/microarch.json   | 38 ++++++++--------
 3 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet/instruction.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet/instruction.json
index d5c370f70819..284e4c1566e0 100644
--- a/tools/perf/pmu-events/arch/riscv/sifive/bullet/instruction.json
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet/instruction.json
@@ -2,91 +2,91 @@
   {
     "EventName": "EXCEPTION_TAKEN",
     "EventCode": "0x100",
-    "BriefDescription": "Exception taken"
+    "BriefDescription": "Counts exceptions taken"
   },
   {
     "EventName": "INTEGER_LOAD_RETIRED",
     "EventCode": "0x200",
-    "BriefDescription": "Integer load instruction retired"
+    "BriefDescription": "Counts integer load instructions retired"
   },
   {
     "EventName": "INTEGER_STORE_RETIRED",
     "EventCode": "0x400",
-    "BriefDescription": "Integer store instruction retired"
+    "BriefDescription": "Counts integer store instructions retired"
   },
   {
     "EventName": "ATOMIC_MEMORY_RETIRED",
     "EventCode": "0x800",
-    "BriefDescription": "Atomic memory operation retired"
+    "BriefDescription": "Counts atomic memory instructions retired"
   },
   {
     "EventName": "SYSTEM_INSTRUCTION_RETIRED",
     "EventCode": "0x1000",
-    "BriefDescription": "System instruction retired"
+    "BriefDescription": "Counts system instructions retired (CSR, WFI, MRET, etc.)"
   },
   {
     "EventName": "INTEGER_ARITHMETIC_RETIRED",
     "EventCode": "0x2000",
-    "BriefDescription": "Integer arithmetic instruction retired"
+    "BriefDescription": "Counts integer arithmetic instructions retired"
   },
   {
     "EventName": "CONDITIONAL_BRANCH_RETIRED",
     "EventCode": "0x4000",
-    "BriefDescription": "Conditional branch retired"
+    "BriefDescription": "Counts conditional branch instructions retired"
   },
   {
     "EventName": "JAL_INSTRUCTION_RETIRED",
     "EventCode": "0x8000",
-    "BriefDescription": "JAL instruction retired"
+    "BriefDescription": "Counts jump-and-link instructions retired"
   },
   {
     "EventName": "JALR_INSTRUCTION_RETIRED",
     "EventCode": "0x10000",
-    "BriefDescription": "JALR instruction retired"
+    "BriefDescription": "Counts indirect jump instructions (JALR) retired"
   },
   {
     "EventName": "INTEGER_MULTIPLICATION_RETIRED",
     "EventCode": "0x20000",
-    "BriefDescription": "Integer multiplication instruction retired"
+    "BriefDescription": "Counts integer multiplication instructions retired"
   },
   {
     "EventName": "INTEGER_DIVISION_RETIRED",
     "EventCode": "0x40000",
-    "BriefDescription": "Integer division instruction retired"
+    "BriefDescription": "Counts integer division instructions retired"
   },
   {
     "EventName": "FP_LOAD_RETIRED",
     "EventCode": "0x80000",
-    "BriefDescription": "Floating-point load instruction retired"
+    "BriefDescription": "Counts floating-point load instructions retired"
   },
   {
     "EventName": "FP_STORE_RETIRED",
     "EventCode": "0x100000",
-    "BriefDescription": "Floating-point store instruction retired"
+    "BriefDescription": "Counts floating-point store instructions retired"
   },
   {
-    "EventName": "FP_ADDITION_RETIRED",
+    "EventName": "FP_ADD_RETIRED",
     "EventCode": "0x200000",
-    "BriefDescription": "Floating-point addition retired"
+    "BriefDescription": "Counts floating-point add instructions retired"
   },
   {
-    "EventName": "FP_MULTIPLICATION_RETIRED",
+    "EventName": "FP_MUL_RETIRED",
     "EventCode": "0x400000",
-    "BriefDescription": "Floating-point multiplication retired"
+    "BriefDescription": "Counts floating-point multiply instructions retired"
   },
   {
-    "EventName": "FP_FUSEDMADD_RETIRED",
+    "EventName": "FP_MULADD_RETIRED",
     "EventCode": "0x800000",
-    "BriefDescription": "Floating-point fused multiply-add retired"
+    "BriefDescription": "Counts floating-point fused multiply-add instructions retired"
   },
   {
     "EventName": "FP_DIV_SQRT_RETIRED",
     "EventCode": "0x1000000",
-    "BriefDescription": "Floating-point division or square-root retired"
+    "BriefDescription": "Counts floating point divide or square root instructions retired"
   },
   {
     "EventName": "OTHER_FP_RETIRED",
     "EventCode": "0x2000000",
-    "BriefDescription": "Other floating-point instruction retired"
+    "BriefDescription": "Counts other floating-point instructions retired"
   }
-]
\ No newline at end of file
+]
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet/memory.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet/memory.json
index ba3168f8a4cd..70441a55dd66 100644
--- a/tools/perf/pmu-events/arch/riscv/sifive/bullet/memory.json
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet/memory.json
@@ -1,32 +1,32 @@
 [
   {
-    "EventName": "ICACHE_RETIRED",
+    "EventName": "ICACHE_MISS",
     "EventCode": "0x102",
-    "BriefDescription": "Instruction cache miss"
+    "BriefDescription": "Counts instruction cache misses"
   },
   {
-    "EventName": "DCACHE_MISS_MMIO_ACCESSES",
+    "EventName": "DCACHE_MISS",
     "EventCode": "0x202",
-    "BriefDescription": "Data cache miss or memory-mapped I/O access"
+    "BriefDescription": "Counts data cache misses"
   },
   {
-    "EventName": "DCACHE_WRITEBACK",
+    "EventName": "DCACHE_RELEASE",
     "EventCode": "0x402",
-    "BriefDescription": "Data cache write-back"
+    "BriefDescription": "Counts writeback requests from the data cache"
   },
   {
-    "EventName": "INST_TLB_MISS",
+    "EventName": "ITLB_MISS",
     "EventCode": "0x802",
-    "BriefDescription": "Instruction TLB miss"
+    "BriefDescription": "Counts Instruction TLB misses caused by instruction address translation requests"
   },
   {
-    "EventName": "DATA_TLB_MISS",
+    "EventName": "DTLB_MISS",
     "EventCode": "0x1002",
-    "BriefDescription": "Data TLB miss"
+    "BriefDescription": "Counts Data TLB misses caused by data address translation requests"
   },
   {
     "EventName": "UTLB_MISS",
     "EventCode": "0x2002",
-    "BriefDescription": "UTLB miss"
+    "BriefDescription": "Counts Unified TLB misses caused by address translation requests"
   }
-]
\ No newline at end of file
+]
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/bullet/microarch.json b/tools/perf/pmu-events/arch/riscv/sifive/bullet/microarch.json
index 8036e72fb0d4..d9cdb7d747ee 100644
--- a/tools/perf/pmu-events/arch/riscv/sifive/bullet/microarch.json
+++ b/tools/perf/pmu-events/arch/riscv/sifive/bullet/microarch.json
@@ -2,56 +2,56 @@
   {
     "EventName": "ADDRESSGEN_INTERLOCK",
     "EventCode": "0x101",
-    "BriefDescription": "Address-generation interlock"
+    "BriefDescription": "Counts cycles with an address-generation interlock"
   },
   {
-    "EventName": "LONGLAT_INTERLOCK",
+    "EventName": "LONGLATENCY_INTERLOCK",
     "EventCode": "0x201",
-    "BriefDescription": "Long-latency interlock"
+    "BriefDescription": "Counts cycles with a long-latency interlock"
   },
   {
-    "EventName": "CSR_READ_INTERLOCK",
+    "EventName": "CSR_INTERLOCK",
     "EventCode": "0x401",
-    "BriefDescription": "CSR read interlock"
+    "BriefDescription": "Counts cycles with a CSR interlock"
   },
   {
-    "EventName": "ICACHE_ITIM_BUSY",
+    "EventName": "ICACHE_BLOCKED",
     "EventCode": "0x801",
-    "BriefDescription": "Instruction cache/ITIM busy"
+    "BriefDescription": "Counts cycles in which the instruction cache was not able to provide an instruction"
   },
   {
-    "EventName": "DCACHE_DTIM_BUSY",
+    "EventName": "DCACHE_BLOCKED",
     "EventCode": "0x1001",
-    "BriefDescription": "Data cache/DTIM busy"
+    "BriefDescription": "Counts cycles in which the data cache blocked an instruction"
   },
   {
     "EventName": "BRANCH_DIRECTION_MISPREDICTION",
     "EventCode": "0x2001",
-    "BriefDescription": "Branch direction misprediction"
+    "BriefDescription": "Counts mispredictions of conditional branch direction (taken/not taken)"
   },
   {
     "EventName": "BRANCH_TARGET_MISPREDICTION",
     "EventCode": "0x4001",
-    "BriefDescription": "Branch/jump target misprediction"
+    "BriefDescription": "Counts mispredictions of the target PC of control-flow instructions"
   },
   {
-    "EventName": "PIPE_FLUSH_CSR_WRITE",
+    "EventName": "PIPELINE_FLUSH",
     "EventCode": "0x8001",
-    "BriefDescription": "Pipeline flush from CSR write"
+    "BriefDescription": "Counts flushes of the core pipeline. Common causes include fence.i and CSR accesses"
   },
   {
-    "EventName": "PIPE_FLUSH_OTHER_EVENT",
+    "EventName": "REPLAY",
     "EventCode": "0x10001",
-    "BriefDescription": "Pipeline flush from other event"
+    "BriefDescription": "Counts instruction replays"
   },
   {
-    "EventName": "INTEGER_MULTIPLICATION_INTERLOCK",
+    "EventName": "INTEGER_MUL_DIV_INTERLOCK",
     "EventCode": "0x20001",
-    "BriefDescription": "Integer multiplication interlock"
+    "BriefDescription": "Counts cycles with a multiply or divide interlock"
   },
   {
     "EventName": "FP_INTERLOCK",
     "EventCode": "0x40001",
-    "BriefDescription": "Floating-point interlock"
+    "BriefDescription": "Counts cycles with a floating-point interlock"
   }
-]
\ No newline at end of file
+]
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

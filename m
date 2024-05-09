Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FD3C25B4F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 02:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sscq4MZWxX+04t2SpBwdDOg95Kx3r7Dqm/w/LXkXFGU=; b=ldh4ZxwJJQ93Yi
	Fov1cQr7uc6ntZ4ou8ekwYb4x5fVze47IqoANVmExxpowmdh254KQ0IEO21LW+2o/8DdvSuOhComL
	07IxEEMi5Cr3fJCWnt87y7bV0ps7oD4SdgGNBr9maLZ6JcN8MsGYswN9AYJ4rovzAE4gPCTsOroei
	b/UYroyGVAIEBxthgb748O028tm3//qyMQJSbxRV1qAdqbgiA6/bvvAzEIzrvNu6C5Zr6CDee39kr
	8hkBCVKuFDlHTmvSIArJKT1NY8P/TiPDuGkOiGgqqCgZ/4kacsTpEQz436w2t5PdHuztbT4yy+ld8
	y7baxLjwTL2M2r/MmN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tK3-000000003R2-3fmx;
	Thu, 09 May 2024 02:15:51 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tJv-000000003LN-10RR
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 02:15:48 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e3c3aa8938so2241005ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 19:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715220942; x=1715825742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87E4iSRmo9mrgwWJanbsXZLAcY2dYepbAJhcT3XMrhE=;
        b=kkC4oY7LD/c9IeeRvSDA1E2RuJLPGZaAJviRGv6BDkQeYz6mG8lyl7NdUbjObTEzlT
         wTKcioiSM4/UEyeP8+IpBfUwGFbQHlb4NssOx678Wy8XvCxXH0i7MTm4wCEcbJg1O3sN
         AjUwv1nba3GtEmeOm1TKZ7K/WbVQ5FGZGiga67DlDKFOmmyS7x2t8B7I5ynX2aP6rx8v
         rDLOpMUF/dH0cPDHpfMEGeL7OUBnfRZAzZ7HvpA6KNeMfAxYgU+zPbxTFegJd6AXBt7y
         IFo/0ylZ4QGB1pLMVCLMGc/vGJyblkF8QFihyv1fm9L2AH+7sepk+NbKcVHbKsfXX+O9
         xIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715220942; x=1715825742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87E4iSRmo9mrgwWJanbsXZLAcY2dYepbAJhcT3XMrhE=;
        b=lGUWkMiJsltVDsfniWJk3nMV2AuQjoa1DV/YUP0Qd2IaYrNNwjefR8VsSemmZJTcmS
         FFnr6nuQREVpLrFdeiirMUgf5GBd0y/YgK6neaMoYDuYjSEfK5LWbd09uFN0x+u6osjK
         SNbNLJ3nCh7oFcw6tpoOPDU8i+d2sdm9BEluk/tTTOlEWkPxUO8N7cIW5b0SnOv/Cj4x
         OjAhzapPmgXwEu/9wsWd5Yy6+3SZ5On/SY+69zchyh7DPkEvkvNm92VMK+IKzTNDE03l
         SMLgRjctdWMa9WvNP3ef0IIlD2FmkYYzCxHvzQgB3a9x2jZ3PQroHhu7YRlphYWPxAyB
         fq1A==
X-Forwarded-Encrypted: i=1; AJvYcCUb/qi5jOB+dsd4jjwXf1xxQVm909LjboNEr3BjXQ4D/0+TUK3KYC3PSc3pl8NJ+Hw/kCY7+zuaSjjXjtTZpUtn4JDndOkTUzBmf1ikwOyI
X-Gm-Message-State: AOJu0Yw8yYIHNlSs/Gdmyx3kKLgV3L79OlHKP5qc36o6bCPgnQBUhVmT
	VFayVeodsUV/clsFEptbm6LenWv8Y/baPdCD98WMYT3KVb7Jq07ruv+1qgfDKsM=
X-Google-Smtp-Source: AGHT+IHsVW6mAhGNlmhstEPNjmMVMS6IDZM08cHLd8W2dyhnJB0vPhFCSwQ0a8gQZNg3Ah0DLaRzzg==
X-Received: by 2002:a17:902:e801:b0:1e4:31e9:83ba with SMTP id d9443c01a7336-1eeb049b32emr55875905ad.1.1715220942625;
        Wed, 08 May 2024 19:15:42 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d176fsm2339115ad.58.2024.05.08.19.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 19:15:42 -0700 (PDT)
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
Subject: [PATCH 6/7] perf vendor events riscv: Add SiFive P550 events
Date: Wed,  8 May 2024 19:14:59 -0700
Message-ID: <20240509021531.680920-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509021531.680920-1-samuel.holland@sifive.com>
References: <20240509021531.680920-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_191543_576613_32D81BEA 
X-CRM114-Status: GOOD (  15.45  )
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

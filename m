Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156DDC02196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmaPGs8e8DXPfSsLgC7dscvDm4DoJQrSkcIY8tVmfec=; b=LMIgkbKmS4dOy8
	o427KV88NoigJv2cqh1InUyk5m7kAiEMkE0DTvR7eOKUy+p72ELRPUzcfOMDzxhqLlpywDTDfpvJp
	yV0TbxovlU1CZJNjJtXKRYxqS7a9uxd2VVcUnYv39LBLOs1dZcXnMAiITtvwIHRhwTyUg8rOVl0sq
	pwqkj0pJAahuD+K8KJLdH2unKluP2l9nwTfy7f6IL3tRH351qYG1hTYI1Tn3RIdyuYoSGxJJ4LpBz
	yPJXHIW80K2JAcMUmSz2QW0vsTZbxfBDMNbpvQl9mFWtF9bHr2eo3JQwen4HM7z6d4M27pK2CnLUV
	hLY5nKm2Wrwpz/rmiy0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwcb-00000005e0I-2R3X;
	Thu, 06 Feb 2025 07:48:25 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEk-00000005YNh-35JO
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:47 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2f42992f608so812976a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826626; x=1739431426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0m90EFTzPOvQUeRyWgUOuFclvonVx+b+5YG0+Kl+Is=;
        b=25mAzrR6G6+LR9cot68yLUitPle0Lr9Oi67+cZSAQEQp5wvOtMg2HfuxNj/rc01F/i
         Jrpwz7Uk+8tWFRvMCiz91MuGosP7aGrTbwDocXBUUMetw1tEp9WdV+UNfG6Na5EYtxKP
         x9tDM8VaBdy4LVTjbeK/8GCCHP7PWULP4XcVxUfYKn2A9Ww367XmQO5ozUexaZvZFxAV
         xs0xUGi5m9/kPjGYXIau+EvkR+HU86HhqX/GgB30Eo9D1gBXZRH6va4sEWINT5M7HHF1
         6tqwCGRvD9ieaJald3Z60cDJBH/lkRoDUevZ348Qjhf4cI4WLrzVRa3pkSy2nangNWOm
         pKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826626; x=1739431426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0m90EFTzPOvQUeRyWgUOuFclvonVx+b+5YG0+Kl+Is=;
        b=e4YDcPwcyFgDcZSFcHmuNMOAf0y+mNVfDiqLtglMM13EBQbTp6+BT/A0R4eWzrbre/
         8EOMoXCtqsgeUB6ofPOysTOy9OyHLFfg6n+tuCgAXTjzwpA+pzLQ9WzQD1VNeGgZ0kO1
         o+xp/4uGn961cQJc9HF4g7F9yyUuQv9iNstKk3dIKeemt3qIRAbebZuBhMVyFFpNMxb/
         Bay0wJlGa1sdNNcE2KR0YW9ZrHl0+1hDSp7nss6Uq6CXYVsaFg3MJE5UqSNguYzTkR6A
         SpZUHbMagNTGkjoOuWBZhFn72s6sn53Aao95QaQjFQgmYiNgoSuL1C5HMVGpXvjAML6S
         F0fw==
X-Gm-Message-State: AOJu0Ywb8GyPZfB/H8GM3mg+D/OeeFSFbh5orVSaQiqo/B4SbzJGUrEb
	VhXzTgjtJZ5+F0wjaNoBe++7srcCuwKhk9N1gr/O1zLcX2aZF6dTUCuireJzOuY=
X-Gm-Gg: ASbGncuq2lFVABGWTaNFJiT6Lz1ATSSVpyfztpL4wb8ECXfBuhCweiKJYlhMjeZvmUn
	BuDSQFDFbDqqiEM6PRN2Bv7CNYnvjtoA+Nxf9kNrUAXzqY9/JFp+FK8Fbybp6PFeU2GMIrCncV0
	kuAqGp+Kvw2DDlhsxCNgPm96rCLE6vc8B6hDx7Wam6JL0cNRGfMz2GeSlA5eKZFLCWOXfO6HzYG
	u1JrARIpE0YFRgvLRIuvhyYSlawjbMsXtY6184z7vDVSN/hJWihf5BIe3TJ2wt1agQ/bvmXepPD
	L/x9A9wn1N0/o2rKI3RRFmmGfiLK
X-Google-Smtp-Source: AGHT+IEr4tlm3eTboE2LI3UyhaNgjHemEhg+pKT/VKS7IwKjrB4u5O4IbJdLoprF/7S1D0FzPib5Yg==
X-Received: by 2002:a17:90b:1e4d:b0:2f6:be57:49cd with SMTP id 98e67ed59e1d1-2f9e080012dmr8950112a91.25.1738826626207;
        Wed, 05 Feb 2025 23:23:46 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:45 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:24 -0800
Subject: [PATCH v4 19/21] tools/perf: Support event code for arch standard
 events
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-19-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_232346_800966_0540AEAF 
X-CRM114-Status: GOOD (  15.89  )
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

RISC-V relies on the event encoding from the json file. That includes
arch standard events. If event code is present, event is already updated
with correct encoding. No need to update it again which results in losing
the event encoding.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/arch/riscv/arch-standard.json | 10 ++++++++++
 tools/perf/pmu-events/jevents.py                    |  4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)

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
index 5fd906ac6642..28acd598dd7c 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -417,7 +417,9 @@ class JsonEvent:
       self.long_desc += extra_desc
     if arch_std:
       if arch_std.lower() in _arch_std_events:
-        event = _arch_std_events[arch_std.lower()].event
+        # No need to replace as evencode would have updated the event before
+        if not eventcode:
+          event = _arch_std_events[arch_std.lower()].event
         # Copy from the architecture standard event to self for undefined fields.
         for attr, value in _arch_std_events[arch_std.lower()].__dict__.items():
           if hasattr(self, attr) and not getattr(self, attr):

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

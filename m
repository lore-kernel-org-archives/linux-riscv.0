Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93287C36011
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 20:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DbQtxFZx3QGzKPAYVC6tYHzxEoWOpZyjox6lR1znVo=; b=dwgcwFBoc4yZHR
	9jt1wa8pUq2g/McC6YygvLNZEjUbU5CxSpw7Ey9CT5p00YTJyttXUn7oTThDqhNgPhoTvaOFZ/359
	p3x+7Ti2m7RxR+W0uU4X2R145xZoePLlK6XqdXL7ZdvOzW/+z6Mp6/eSlqcUfqAQAbJSisFCmY2UG
	OjWI1VqQjLpwZTFSKbLGhh0fxI/xdKFsstK4L2UU0ljhM1sNdu4sk2Z+B2K9/+VUkI+K9iajaHkZ6
	REOlSQ1q1ZwdoSWPa3xtLGUroc3/IAa+TIYfxZXBjuQ+7Noi2uiNh3ddXCeYbJKsc7w+NC7bPm+UH
	Jh07UkpOkDH+Hpm0F0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtWe-0000000Bvv9-1TzF;
	Thu, 27 Mar 2025 20:08:28 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1v-0000000Bptr-2DBB
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:44 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-301493f45aeso2159015a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104203; x=1743709003; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJwNDXXlYjKjGqwwgKGhwlhZINc8dMq3L7uwB92VzFc=;
        b=sQgCXLjTEAE2+6HEm+4A28fu/v2yXiOunANhBXneopH/0tTx8gbKQDDdXbyDET5wZs
         KRWB6jwXgnpPjx1KYWGxaO4oU6bkCHKaCRGcjjKy4oyCJf0kTj0hBimzf4wWKLBbUqLs
         D+DR4uaB9lK97OhqZWPoXFKxzZORgKEGAQS+ZyfnKf7meHlen+Fb7yioSWtUQi8H3mn2
         amDWnmb0o9MVcG3nW99tJXgqGW4oU5xHi+wfLiR7kfk4nkMYAFBSRRxap46T+pnTHx0M
         DCMfDA76tE83M7pofxDdK8AuinpHWnMNqV4ciXLc4FFbhuwU14VwuNlGoCXeYOsMDS5t
         ERug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104203; x=1743709003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJwNDXXlYjKjGqwwgKGhwlhZINc8dMq3L7uwB92VzFc=;
        b=H/1yhINpXv/gSadG7csiNIHu616MubdWudnNoY4thw/MtK0d3cuyZerStMG714CrZM
         yI3aLfpwYQBo2BLcahNq/aOV4d6dj91sDfQ3w6PX+1Hvm4yIUF1okayA5nSjqjWyXVGq
         jTFYy9DVOUw5hyJcKW0IXtavXSQZ3pK0z9H+hVeeNWrEnKgzX/IOpyzWLG7baGF1OwpU
         xU4tjIt5CCwhZecAKZ6dyiJ0i7jnLNvWf8/bNTyBp/CFSKGo+ouWIlTVrywseEcOP1w/
         YNG1DYA79lKfxfFiAjpbjs/Qc6pGiqrfoNEFrFlCfdTRtb1tfTEl0q4JFeTunJQtozJb
         5hLQ==
X-Gm-Message-State: AOJu0Yx/o8+OHx3jtwb7KSv1pCaxGSyTLd7ZXVHB3MKC6PZs10DyIUZm
	nI+P0rZZKHJpTZzRNHaqIdaUJh4Zw44lPZIQ92ucU/H+3MF2LRmuUdnY81yAGLo=
X-Gm-Gg: ASbGnct++yMSi2rkiHg+tgohezc4BmsOadoHKsbC+8CcRELmx/BgHGjuw5/ZWs69Xox
	DKp6qoTRwp8xZ2LRD2WiDjmCZFQryUKRQftO/28PUaPwb+PJP5DQOS5ikyhhpaF2Nj/V0Pnoxfa
	6/y6zgpcz8y5M48sdF6hLQk6479VO1fpN//ufLNMOXbabRZ0jo0J1zMazcO/upstV9Y9YPN/eCt
	QwUas90iHeBAvPMnPtFAch7LD1xm5ArSxP/YjJGXKCPxTODgiZ6QsxJkGuUKyFk1XeYDr6cx/Cs
	zLgYQch5oYPHFF5zu5FY/H1nmIKSCJ5fCYVjM0bhVIsIZkwHPyQ6hpqJoA==
X-Google-Smtp-Source: AGHT+IHr9lkacen5G6bNal8x27vd0zlzKk1gXvQpJoZ6ZU4fSbwcKifIx6nJFU8JTt0ZbyyT81dbnQ==
X-Received: by 2002:a17:90b:4d05:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-303a7c5b9eemr7219789a91.2.1743104202835;
        Thu, 27 Mar 2025 12:36:42 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:42 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:36:00 -0700
Subject: [PATCH v5 19/21] tools/perf: Support event code for arch standard
 events
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-19-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
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
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123643_574893_CE276338 
X-CRM114-Status: GOOD (  15.80  )
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
index fa7c466a5ef3..fdb7ddf093d2 100755
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

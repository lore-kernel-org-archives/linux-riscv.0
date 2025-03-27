Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E244C36011
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fPHdtIxli4fHPeU9+h294u8EHdg+eyxy0DAoZd8eew=; b=1CFm/lvjmhj2G5
	F00siOIv3jRVDj/nLM/F0pO6xU8akX/kfKV4u9+i9vd1GAfKhhL4M86Jk0GM6gnLwjAM9maRrN4Yr
	Uknefymsz1+LnWtnCOzqgDH5MmGenjYM+cme15Kd1CnUnKkHnpJZ57C1QzzPJ+8ZuL0UMuzOvNc91
	D9xDeTynskgk6qBQub0Te7P9KJ01IL7NoHEBegpYl0KgD97TCmdobe7UeogW8NBopeYjsQ+MQZYYZ
	9sNBZnr6xcwSwx9L7O+h4lRn7IGueWOp2IdKxSYtnVip4tPnasQEcp5BA8vS5FpW+iJ5tdxAF1OXo
	KeR53GbkHgquxDpWkrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtYM-0000000BwAo-3re2;
	Thu, 27 Mar 2025 20:10:14 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1x-0000000Bpvm-0bln
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:46 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-30332dfc821so2018190a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104204; x=1743709004; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prlp5XqgI/Khif6kUiv5FMK3OMCI6nzVA7nLGH/Y3s4=;
        b=WmT5DqthND+pjKic26cmthSC3RR9tqQHHwX1OQ+ci6w4D5MYoW2aYccRDknpClMV8R
         AON28wGSOdyADemHRVeM1jnaRjukuRyJDQ9RCe/SvInFiiKqAGZmgCtGYSDyM45jSlZ7
         dWpTCcl2vzq+A0tyBICfyadWhCF0L4sYsqjE7XkqzbbeDBEMjy3ctSr7D8Sfdni5UQ7A
         EhAXIL4kVDHAfyKTEN1Shr083uLOJKuiSTMCmxcvmXgQ/kVt3iKdjM+qSA7z6YI70quY
         Oua+HtTEmcAZ/t/KGQtC67ptUsnnQfFpuXGH/AA+Fq3zlOyZdfPgTO3sybWOMsMEzJk7
         ZxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104204; x=1743709004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prlp5XqgI/Khif6kUiv5FMK3OMCI6nzVA7nLGH/Y3s4=;
        b=BG8cxJoqmyBWDHQQIPyUAGH2IqOxYwroOJZ0fWABOvCvpIGDdzSes3b+XnA1olx1IH
         NJ5hR3Bjb2YtIhlPNKuC0VX3nYTqyU+h3b27TJ3dfGlHVGqfu5MRFHjqhJCUysnkb6CN
         VBmYdom71KYCHrEmKhO5ABEgNwulYiunRBNsCKCGwCHB4TwLerhYMzfJrOD46GF6DmdF
         UsXi15wnBKI+JJRIgQHY85PiskUJJBGg/K/MQSFnyiG9VTfbG2sNmYjOLIrJ9ycUMmgn
         MYYET356gsof68YAYUx+p7s039W5ly8KqyToGWLsTHwvTzZ3iyQivegbGE9ipZi8lDs/
         kH2Q==
X-Gm-Message-State: AOJu0YyqqcywL1g8BZ0bvoKaaoz7Q2HJ3xR2w12zetzp98zDC9rQ+UAf
	ra7RbTaO3X5kAL7TDByPsjdFlBj6VLy8QBguSIWo9Y1M5ZftaBOgarywMRNFBCA=
X-Gm-Gg: ASbGnctv+bpKkVrLYAXHUpDS6H5eXksr9iMKW3DMp/8uLVtKzCE8wfBGuaGNmfjQoEu
	V5j5FE/jNrHAPwMlPxa8VrwINTkWFyFP+StJjrbRRr0FaSiWkTtBwfUFE/7+ZhsDp7QFRi6jJIv
	b/J0G1frljxEqDgjDnGPnd4HIlEbedfQxtCvbGDskrsxA7w5QuW3cvDjr2v5T2N4cN1pCLriYMv
	T/O3Rkq0OunhUcKre0OXrCO8hqMB4XmlVyAL92EoShRYnVEffwMc0OwRuN0ljBovIHlNgrAXFe/
	0jrc1lsnImAkg1W9ZZaFlE7sK9OacfGsiWPi6aHmxs9Kn24CAtjXbUm/EMN3eByBR24y
X-Google-Smtp-Source: AGHT+IE9RAtJmcVuiq+zzbza3XZnuj5S63rmVXq5BX9kQPkvxkIEVWCCAKOhZGnJte5v86VybNNn7Q==
X-Received: by 2002:a17:90b:2dd2:b0:2f6:d266:f45e with SMTP id 98e67ed59e1d1-303a7d5b6b6mr8384578a91.2.1743104204412;
        Thu, 27 Mar 2025 12:36:44 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:44 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:36:01 -0700
Subject: [PATCH v5 20/21] tools/perf: Pass the Counter constraint values in
 the pmu events
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-20-1ee538468d1b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250327_123645_218228_3E45F599 
X-CRM114-Status: GOOD (  11.75  )
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

RISC-V doesn't have any standard event to counter mapping discovery
mechanism in the ISA. The ISA defines 29 programmable counters and
platforms can choose to implement any number of them and map any
events to any counters. Thus, the perf tool need to inform the driver
about the counter mapping of each events.

The current perf infrastructure only parses the 'Counter' constraints
in metrics. This patch extends that to pass in the pmu events so that
any driver can retrieve those values via perf attributes if defined
accordingly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/jevents.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index fdb7ddf093d2..f9f274678a32 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -274,6 +274,11 @@ class JsonEvent:
         return fixed[name.lower()]
       return event
 
+    def counter_list_to_bitmask(counterlist):
+      counter_ids = list(map(int, counterlist.split(',')))
+      bitmask = sum(1 << pos for pos in counter_ids)
+      return bitmask
+
     def unit_to_pmu(unit: str) -> Optional[str]:
       """Convert a JSON Unit to Linux PMU name."""
       if not unit or unit == "core":
@@ -427,6 +432,10 @@ class JsonEvent:
       else:
         raise argparse.ArgumentTypeError('Cannot find arch std event:', arch_std)
 
+    if self.counters['list']:
+      bitmask = counter_list_to_bitmask(self.counters['list'])
+      event += f',counterid_mask={bitmask:#x}'
+
     self.event = real_event(self.name, event)
 
   def __repr__(self) -> str:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

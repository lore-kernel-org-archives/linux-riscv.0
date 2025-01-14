Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A64E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9LFqnUJVLmpCon7oKdaFk2P3yk+EyQ1j7qOlWchhWg=; b=nsl362PbUXQyyy
	FiwSK8k96eTj84GATzELlXJBKYK0H/rVURMbTAoXsmBmjd355F7q7t/Rg+QUgGC9QUem9fdlfkHHS
	Ab+vSqJdX/GjuBdYwh+0+Uol/jZI82DSV1eTGJUwwm9haiXIltkfTfPovWFMsyypuZNqn9WxWMvaF
	mXAAd8evCKGnzbf9nK0v4GQ+2Qwc/IFQzmH0wIdq6HOCINOUwMdqej8j+KgMGQzxru4FDrOdVqeq3
	zBggm+iBBI0tRs4fAA8ZvwRgt+YxowpeZiCdYUSJ+A/PrL6U+XwC3kTotNP1fhtCnI2lLYG8FVEx2
	ZRxN3hD87AaoHPuIWdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqFx-0000000A5lf-3VTn;
	Tue, 14 Jan 2025 23:23:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXps6-0000000A0Eo-0IRu
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:55 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2163b0c09afso111548175ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895533; x=1737500333; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Msmauk788mzUDGMUfQ29+G0+6TVWgLFLPWjnpzGrxFY=;
        b=If/asOY1B7EePBH9ENIfCTLweb3W0bfmJ7VOYFUCEaRHibiUCKFPB/aAr0eSqKmA9C
         PvK51VsEVp9JDpBROJAQxRyYQwcHRv9wulKq/V1U1uRZg2dCNeGKGzDisS4kcrPOZEZF
         SPu1RLDiDW2o8UPOUVCXHFNz5qCpgfHDy5165ia/9IN/aAt5+BvLDq83dHgBeKlH0rtT
         AVl5GxNOw2b3wKm3/DLs8q5KRiwJ98hFPU2bR7NseQdosGxt88oEld1x65qNata+DfFo
         jL4SIUH6ZUHjZhbJ7DcoGD5G/Ys7NmzfXt/HqC0AANI8D1vTxRvD6p4X3QEvCoP4VRBL
         ZjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895533; x=1737500333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Msmauk788mzUDGMUfQ29+G0+6TVWgLFLPWjnpzGrxFY=;
        b=TGBSsrk+oFdKOkmW/tvMfVqbrMzgbPWdAeo/t3NcDXxehSozDP4dT2dZg3bP5EwsWK
         TDgxKtlHc4SsrUYahT9/HUopHCu02ywQHdySOc5LBsH+ndqQhiNB3ydTlfM8edw/lTt1
         ReDc4U7of+SE5Tl0TMAcjr8sEwKSbw9W4U+0GL0jrAtpCbhjjT6gP6+JtePRwsj10Gt9
         bxztXrGO6/w0d41uRqpzvbeqYAJ5iSkI7EH/lD7FkkggDzARgrmq5LatN27SPmfPHbVl
         hVmH9K/BDXNIjnZTwG0mWhylohy6KqXzqChiiPBqNwlZCpkbD+aDhK6JqnYZ7Jc7Q55n
         d2Og==
X-Gm-Message-State: AOJu0Yzpool4HwcFtKvRIqZ2XQZ8MLuYQm+XkiXP4yk2odCkhp3RuSit
	kHTBxHCPJZCrYH7TIXylW906H8mQk3GreUdGKU2wC2zZX3JG+uC1W58qUWsP0QI=
X-Gm-Gg: ASbGncvJ+TlJD7sgmD8+LdMeQlXcpUdnUVAPYJKwPRROhxg3flFUwztk3Vx7wBf0geS
	7slwyo2Xok2nylOd5KFKNXmZO61QmKz0EbrokG06VgT477M7lUnBLS3WqYPtqgUc+eLLsxK4Otm
	uwg7J5mT8PK7DVGZwhikHehmzDJw+k3y3ZZ9AmFY8BxIb6AsHXuLFcyIoysNWnzhvrrkHS+8jOV
	ez0QrX7QdU+EoxAvYeaiaequo/C7qBT7kObhAV6S7hzMjm/+tkBTXOoR+WPT9rgB2aj/w==
X-Google-Smtp-Source: AGHT+IHVlOGIv+9Uh+Dng9Z5glMQS7vdErpemdoZ1TuQIxVK5mxZMQQK+rAFLrYfNXcGXxNvYIFeiA==
X-Received: by 2002:a17:903:1cf:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-21a83f4cd36mr432431955ad.23.1736895533476;
        Tue, 14 Jan 2025 14:58:53 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:53 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:45 -0800
Subject: [PATCH v2 20/21] tools/perf: Pass the Counter constraint values in
 the pmu events
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-20-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145854_146917_E31AFEC0 
X-CRM114-Status: GOOD (  12.18  )
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
index 28acd598dd7c..c21945238469 100755
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

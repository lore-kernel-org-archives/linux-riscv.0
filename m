Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1FBC02190
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9LFqnUJVLmpCon7oKdaFk2P3yk+EyQ1j7qOlWchhWg=; b=cj3D6pJ8GjTpej
	9gSy2DvNL37GEvtU3eef0yBNe0rWy1O9qxSjz3tiWzun4PXUjiNSjvDseHasZCBNGA7F5X45F8cux
	b9GQ78miYKMEgWp08+tm0R7UGRAPxVPIZ44Qy9m2l2mH8y1PFfo1r4HAt0FTrpwI5czCXIsWvKnLR
	GBHZeK67hJrY7kZyX7kK3d12haQFkEulCP1cUvuIvjBQ2JdY+4Y+9z9uarnN6BPsjQ648DYaKk5X8
	UnCV12fvU+ArECmTsEoDqepyuwnxdQfzdJXCxvCdHXuBgzwT3rGj+8PlxyuM2l7bh/tgKZH1khx8E
	yYK5cpt2xgUojGV1qmIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcfCR-00000004DjN-2RmX;
	Tue, 28 Jan 2025 06:35:51 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdi2-000000044rg-2aIe
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:24 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so9188344a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040422; x=1738645222; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Msmauk788mzUDGMUfQ29+G0+6TVWgLFLPWjnpzGrxFY=;
        b=Fd6RRH35xTMwRghRyCqklr2bdaACnJ+g0/XiolIzCe6XGySH1WGWS+MRF0AXmBm+v2
         CdDbOxBC7cSQGR28Kdf7UUJl2EUibpmXrmKdtBGJo3VMmk/tD2vuoafDQgMf9o8amQym
         3Ul2NFm3pp7LwMHelpmpXRipEbl6ooQabjlPOda7EhYvDVEIIG24Y1ZI8Sfh8oNyAW3x
         dGXZamyuzRafbw8+xA0q+k2F3V+HPFJHexfAdGfk0lK1P5Uzjj89T+9O65rBHJNKy1Lf
         wSD1xrZwr3mnlEghY2Hw2Mu+ikU/wwdqFw5DaAkiOOJd3UnL0EN5+cn77MMTMtfgJVaV
         cg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040422; x=1738645222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Msmauk788mzUDGMUfQ29+G0+6TVWgLFLPWjnpzGrxFY=;
        b=wlm4C77sbpnQkraJ0OPeKYFpE8G+2C1n16n2zLblcqcksE1WMWmF2eBz3NejJhNAsV
         nJqu7mtlEivuhRrRF7PbrBTHfBZbwo0M8DvGWnpgdUu7gLwfJk35/48YhocOzReoXbfa
         gdx5cwjXMqWNr7xvg87G8zQm2fPHyma+/AOBo3v5A5xhvPmYuTKsMuP/DNAwx7wj/X9E
         ef6FW6Bmk1Fi7SzErqthumXljxiZdMgqws5D16abPiMlp71lRqJS9nurAfCKOvGv63YA
         lF3Y5iwJHK8I3uXekjwMfBH82/RVETbVZ3U5tILOuhaTqbtfIdsSeQQJra/LbUdrNIFp
         YJfQ==
X-Gm-Message-State: AOJu0Yw5jU83JAzK4yuZhoTc/0SHaMLxEQT6GYuz6QJL3UUIXq1MWsH/
	KOmScK92GQXupKqgPjgHPt2A0rtrXW1bYH3W9k+KXYz/rCdoMvY4wrornXMOwZU=
X-Gm-Gg: ASbGncvv9X9goWYBNOr8/UpwxkUhdYRarihnngM8JSLUMt763lI4oH5+GhcAoYpeIIr
	YYLlW4qnV47wAurIIPhxVPyFtFWkPpSU2jW51OFic163MrzubbpqoBlEwHrZHAcQzfcE4LSAYAc
	xzIeiQPsxQWuGBjzoyHL1NyYmvWEpeuXOJbvZvbsOMvOZlxVwqiNKrPs8F4WEvoNoJzY24vveTP
	pNL+/+k+39KmgTYVQBkL44SHA6zlGpcwIv2mkBi2BZofRqXJtXFtgQL8hMeDORYy6M2cKVMEd2T
	G1q0AEDri7q6WLjnH+HmnsxhmW2J
X-Google-Smtp-Source: AGHT+IELryn7Li8G6uRsK1ux9a/8YArLklBlMT1VjVPaGUmGZLNmSMTAlEJHZzc25zLYxiYqH+BJ4A==
X-Received: by 2002:a17:90b:1f8a:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-2f782c94b50mr63592948a91.13.1738040422123;
        Mon, 27 Jan 2025 21:00:22 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:21 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 21:00:01 -0800
Subject: [PATCH v3 20/21] tools/perf: Pass the Counter constraint values in
 the pmu events
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-20-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250127_210022_719155_DDB76FA4 
X-CRM114-Status: GOOD (  12.35  )
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

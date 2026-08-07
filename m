Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EF9C5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 08:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvIUHaHAh6gHlczfUfSOGaBMbkddC/mKe7rYA6iZovI=; b=mkXWBPE/IerW0h
	A4HFaDbS/wuORj42h3E1XrNuSXEshjeCncsbyUyMHgG/62JC+cHfbb5e+/RaYuA2Eao+8IAj0jZFZ
	Jn0756dLKT7NuLfPp+r/Cru4nIJiwUIRKer2AfQSktebSr0wPI5bswDW6jAa17gK57tMhnjl6P6A2
	//MxdPV7kaXgjEn2RScVdl/8/YyJoyDI0aSlULe8llJYkuCogMblU9nXhd7xw6CTXOlI8+JPLA2b6
	qGIIAQgIdxS5//3w3Kyqm59IWgXYTu3dxwRNpY/6SaIAlkpISsDXZr2gvYH8c9stXxisHKdhsI8Op
	oSwEX9aB2yKTg2ojF4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFfY-00000007NMn-0eEZ;
	Fri, 07 Aug 2026 08:11:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFfW-00000007NKN-1YJF
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=skcFgrDrxZ6+DyRGwONJh0xEp2yNo2u6zqgzqw3g46I=; b=pRi9EkIsW+KyM/p5cPIsQWcBrf
	TBzaZARHa2evsXGYJneXBQUxWsnHsNrbklSaAIghRfpgUi63C9I44lyY7SrL+tu3w9nAUG0JCryvi
	MEC20NFsiarkIn3rseL/CI1LroU+gkkq2a/u1QBYnk+cX+8jftOqGFLjOPYO1F7x26hy+LeCRvgPo
	tLq5bAxTBbkw/GYaHUUhMTR/3Jbw34RovzccD+YsUFTj3R2sEKybqEievom+ZveWJGTmGBVHsZhRm
	nRuSJL4neA5Zo8VTlPmF7uQjhA2J2MVwLvw2HMVsPBzcRPPHDxLS5tc+6hdOH/L9U2qfvIV2iGkR2
	YLvG7VBw==;
Received: from out-175.mta1.migadu.com ([95.215.58.175])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFfQ-0000000CB5O-2LUu
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 08:11:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=skcFgrDrxZ6+DyRGwONJh0xEp2yNo2u6zqgzqw3g46I=;
	b=qdJLcQ2pXzogTF+VR1RyTUzTCLAs7XYMlH2k5MGk9344bDSEaNI57LbwiNFIq0zmXEXHlG
	zjSjGj8On+F8bGyVEVDtHHowtnQVfmTQRtVLg/6PZfasW7FutJHEyPqILPJSkJwVGIL2No
	9hIxarCbnD6ejV2sjqlDPygNW7lf6+M=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:09:15 -0700
Subject: [PATCH v9 20/20] tools/perf: Add RISC-V CounterIDMask event field
MIME-Version: 1.0
Message-Id: <20260807-counter_delegation-v9-20-58658104e487@meta.com>
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
To: Will Deacon <will@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Ian Rogers <irogers@google.com>, 
 Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091103_256278_68D06E60 
X-CRM114-Status: GOOD (  10.49  )
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

From: Atish Patra <atishp@rivosinc.com>

Counter delegation lets supervisor mode choose the hpmcounter for an event,
but the hardware may only allow a given event on a subset of counters. Add
a RISC-V specific "CounterIDMask" json event field, handled like the other
arch-specific entries in event_fields[], that carries the allowed-counter
bitmask through to the driver's existing counterid_mask (config2:0-31)
format.

The value is the bitmask directly so no counter-list to bitmask
conversion is needed, and because the field is RISC-V specific it is a
no-op for every other architecture's events (unlike the shared "Counter"
field).

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/jevents.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index e9c6b7990880..e79143af6aa0 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -396,6 +396,7 @@ class JsonEvent:
         ('EnAllSlices', 'enallslices='),
         ('SliceId', 'sliceid='),
         ('ThreadMask', 'threadmask='),
+        ('CounterIDMask', 'counterid_mask='),
     ]
     for key, value in event_fields:
       if key in jd and not is_zero(jd[key]):

-- 
2.53.0-Meta


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

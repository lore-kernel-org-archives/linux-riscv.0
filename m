Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C00F36B9A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 02:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C5U/OQEEARGNN/sNRVb+AcDTR/9Fk27aFcnDixknP1A=; b=g+mIafyf7TMFvQ
	EFNo+xY6ewVkTvzdSN8D/zBtuiVmFg/nUaLBN4LEsALRPV654gBIXlpAYMZWsGBfafqH0RwzoVdvT
	vBk3DHVkZsPuPJY3EM74EqUHQT4bNBhzC9tACHzV8snsY9F5zYRlxwQS92Nwu5Ik11MRlwfpLnZMA
	j539mlF6s7W/h9nAC7R1CemkQrv8/ZAKuwHxPg+993OYPEl3Ei8ug8n5jzJFH5+j5kEU/15eaIUMD
	jus1Ge5MNbAtqNkHN/1wxIcXenfs1uh0VJiUr4m0xbeChxN+fx11+Uq6wgmR1hQGvrn0LAjZLArFA
	okKptYUy0hMy411fzY7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1wg-0000000BUVd-1biy;
	Fri, 10 Apr 2026 02:50:10 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB1wd-0000000BUVC-3xxF
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 02:50:09 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-79827d28fc4so16838227b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Apr 2026 19:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1775789406; x=1776394206; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Rgttfa1m4ZfTGDBdLpI4DYVvSN/lXYcgorvzMEJ+8s=;
        b=X2WHUn0M7bdMWXAXe5HC+AfODdvip+P7pgUtB9GjW/iPbtfXImiwqSJrGcGdJUU0nr
         W/q7Q3KAmvCqnNllb5m2SMnp9OvjV78qntSEVNnIKfWuRZHMVoHdyYVxiUxZPvmmL8UO
         zFkXO9PGvjnMtQPhFZAGXzslNbQef9bLWckYMg4SA/fRQMuWR8/cRGx2b1SaNK5ZCKl+
         U//PgN5EgA7RY2KjCP3qKPgAiUHio7fsNxCfq0dQmX67XUCv1EOH/lj55EtON0CX4Uaw
         CjD7EDURK5qN3er+7yM8ZjblDpUAo9pOYEbqml+tPzIyOgkoGryc6FIdjOJZm1jDgjF9
         MObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775789406; x=1776394206;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Rgttfa1m4ZfTGDBdLpI4DYVvSN/lXYcgorvzMEJ+8s=;
        b=Hs7xI6Bt0EGqymnOFBX2AoZ3uD+UJTJo1NZYMO7XXT1GCn+QDwf4rZOi9fO0yJR6Mz
         267k4tCIihIUXV0q3LNgPH9AO+dvySNeCxGrFH4tA9or00tcdF7/St6u7Yl2ldvkzYhz
         nqdFqDddXfrN+CO3Q12WNIs6yjGqdrBZH1vM5qn+IXwZWWcjXN+QNtWie7xAWbfGAdYX
         qqmZCLSdpxO+lnWWbkL8ifBynymO/ydSG4s/vBpcB1kdBbUnSb9Hpd3pNSKDe5BXV2ie
         3qEraXNjrsqazd3J404aEt99aL8iR3d7t//nk3nmvPddPnA/18FNUvbfA0zWgudN5F0C
         54Ug==
X-Gm-Message-State: AOJu0Yw+GNT5THh1wjB9rM4ANx6dVJ/jlZXW4B4DSxs26uPIduDmnu/e
	uVp5R4LGj6gO7aqrGVQAYh/47v4ZYVqEJYsHdMv3hYwmq/gY5UjGlGnNwq42bA3Bsxx46ZPCvdN
	TWF2Z
X-Gm-Gg: AeBDiesKkqo4RyPZdyP5hE3kabvjyDyZU9kcXZvY12NyVr8OkDdCU7AR7n6cAmPXMHt
	/ZMx+LZ4GclN6+5rxwYBqdnfbPbNihbK1i6/Eco72pwTnX5xMXtd1Gf22pomNh2L+JeQ9RwrkRS
	NY6qV+qI5weqCqoJ/tjCJWC+hhuy+sApvNum0XO/GUcTOhIJznWFoMKpQK6gtVNE9zgUdutnVPA
	vcSUUEtFjTsf7TYzq22oJzNhYc5dd479psO1gdDD2k4WiITbBN0RhGRSL7L1gN3tBwtPhM3LvD2
	eYMwnbWnkCdz9bPykY1K4O6kdPHH2pasu6ds6Ngu1+K209zjQwrc7/1QUtJCSD1XDbtbwoQjg9s
	5Oj6092WzdooIZTjG7EypvNgB7iJlk4nLA1hAzsTrUtoseX/lATHDYoENP5JKL3z5UInSPJU6C0
	XgBdldkB67f1h764E5yPERe3Q4+9YasCc4MOEywTcr94WiQV2y39ynD+r/YGUQYQe5C4T23bcsA
	GgNesw=
X-Received: by 2002:a05:690c:f04:b0:79a:c40d:b701 with SMTP id 00721157ae682-7af6f9fe059mr16671887b3.13.1775789406232;
        Thu, 09 Apr 2026 19:50:06 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:8dbd:dff7:b592:b476])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65197c4e65fsm624675d50.19.2026.04.09.19.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 19:50:05 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 09 Apr 2026 21:49:59 -0500
Subject: [PATCH] riscv: dts: tenstorrent: Add PMU node to blackhole for
 Linux perf support
MIME-Version: 1.0
Message-Id: <20260409-blackhole_pmu-v1-1-01a34bf46a1c@oss.tenstorrent.com>
X-B4-Tracking: v=1; b=H4sIAFZl2GkC/yXMWw6DIBRF0akYvkvDS7BOpTENXi6V1FdBTRPj3
 Evr5z7JWTtJGAMmUhc7ibiFFKYxB78UBDo7PpEGl5sIJjRT7Ebb3sKrm3p8zMNKrbNeIWpVSU3
 yZ47ow+fv3ZuzI77XzC7nSGa7QJfRulACkRknS19KgdwIq7QC0UrDHYLRzljglec/t7UJKUzDE
 Ja62MyV0QicNMfxBYFYE0zBAAAA
X-Change-ID: 20260409-blackhole_pmu-adaf4ee64836
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Neuling <mikey@neuling.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_195008_021214_AA719D07 
X-CRM114-Status: GOOD (  10.17  )
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

From: Michael Neuling <mikey@neuling.org>

Add a riscv,pmu device tree node with SBI PMU event mappings for the
SiFive X280 hardware performance counters. This enables OpenSBI to
expose the SBI PMU extension, allowing Linux perf to use the 4
programmable counters (mhpmcounter3-6) across 3 event classes:
instruction commit, microarchitectural, and memory system events.

Event encodings are derived from the SiFive Tenstorrent X280 MC Manual
(21G3.04.00) Table 13, section 3.10.5.

Assisted-by: Claude:claude-opus-4-6[1m]
Signed-off-by: Michael Neuling <mikey@neuling.org>
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
Added a dependency of [1] to b4 so that checkpatch doesn't complain
about the Assisted-by tag

[1] https://lore.kernel.org/all/20260311152039.254244-1-sashal@kernel.org/
---
 arch/riscv/boot/dts/tenstorrent/blackhole.dtsi | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi b/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi
index 6408810d8d80d..5f709e45d9b28 100644
--- a/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi
+++ b/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi
@@ -77,6 +77,54 @@ cpu3_intc: interrupt-controller {
 		};
 	};
 
+	pmu {
+		compatible = "riscv,pmu";
+		riscv,event-to-mhpmevent =
+			/* SBI_PMU_HW_CPU_CYCLES -> CPU cycles */
+			<0x00001 0x00000000 0x0001>,
+			/* SBI_PMU_HW_INSTRUCTIONS -> Instructions executed */
+			<0x00002 0x00000000 0x0004>,
+			/* SBI_PMU_HW_CACHE_REFERENCES -> I-cache/ITIM busy | D-cache/DTIM busy */
+			<0x00003 0x00000000 0x1801>,
+			/* SBI_PMU_HW_CACHE_MISSES -> I-cache miss | D-cache miss */
+			<0x00004 0x00000000 0x0302>,
+			/* SBI_PMU_HW_BRANCH_INSTRUCTIONS -> Conditional branch retired */
+			<0x00005 0x00000000 0x4000>,
+			/*
+			 * SBI_PMU_HW_BRANCH_MISSES ->
+			 * Branch direction misprediction | Branch/jump target misprediction
+			 */
+			<0x00006 0x00000000 0x6001>,
+			/* L1D_READ_MISS -> Data cache miss or MMIO access */
+			<0x10001 0x00000000 0x0202>,
+			/* L1D_WRITE_ACCESS -> Data cache write-back */
+			<0x10002 0x00000000 0x0402>,
+			/* L1I_READ_MISS -> Instruction cache miss */
+			<0x10009 0x00000000 0x0102>,
+			/* LL_READ_MISS -> UTLB miss */
+			<0x10011 0x00000000 0x2002>,
+			/* DTLB_READ_MISS -> Data TLB miss */
+			<0x10019 0x00000000 0x1002>,
+			/* ITLB_READ_MISS -> Instruction TLB miss */
+			<0x10021 0x00000000 0x0802>;
+		riscv,event-to-mhpmcounters =
+			<0x00001 0x00001 0x01>,
+			<0x00002 0x00002 0x04>,
+			<0x00003 0x00006 0x78>,
+			<0x10001 0x10002 0x78>,
+			<0x10009 0x10009 0x78>,
+			<0x10011 0x10011 0x78>,
+			<0x10019 0x10019 0x78>,
+			<0x10021 0x10021 0x78>;
+		riscv,raw-event-to-mhpmcounters =
+			/* Class 0: Instruction Commit Events, bits 8-25 variant */
+			<0x0 0x0 0xffffffff 0xfc0000ff 0x78>,
+			/* Class 1: Microarchitectural Events, bits 8-18 variant */
+			<0x0 0x1 0xffffffff 0xfff800ff 0x78>,
+			/* Class 2: Memory System Events, bits 8-13 variant */
+			<0x0 0x2 0xffffffff 0xffffc0ff 0x78>;
+	};
+
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;

---
base-commit: 559f264e403e4d58d56a17595c60a1de011c5e20
change-id: 20260409-blackhole_pmu-adaf4ee64836
prerequisite-patch-id: 42ee07d35f532e172a464c2b371dec76d7ac18f1

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

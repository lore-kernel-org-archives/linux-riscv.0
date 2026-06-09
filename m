Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A31ACD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEUD7evtcj3QJ+ymDDrSSPCTCYFgA/RIeSH3R8lvbbw=; b=l8H7qV2mXsnsRh
	/QPrQOu796qVD4Tp/sXq0H+LL4UoZZ85InElFhu2yP8optOEjimLXAP6sCoUVINBURUWTO5YmMXJy
	ar9dEP2KaZRbQsvjkYGhlfWYCxFNhs7fkJs1iTwgm8k5cTnobB62sYQ/gKWnFRo5qRaJDly21k3DZ
	LnfLdA5YlAv1uwr4acuZW8u3Rhswhr2J1rKuFiw1/eFLyVDUn7XKxd7tjLKEsbEugFTlQ+QAVTeKs
	0/cu0vpMcnEIq7FAcHzJTShOD/smRYFog6GsxqXLDFl7q+CL1/eYyoTZ19490TwMHxt9cdDTiTpUG
	Fa/jWprzhtdwm4OnALlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpYS-00000004oE1-3y0z;
	Tue, 09 Jun 2026 06:03:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpYR-00000004oAk-2b05
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 Jun 2026 06:03:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CeVq8nIFWuQTYTDv2nXLX/gfQ3GPv2/MmaJpRnKjBUM=; b=VSPZ+8WfZ3KfQ0BVn5EdEvzE11
	bPdbQ9H0P1h8GUX7fO+aUlDV/URY9DxMKyPQciUdjfFSxHNBaJVwIxqwnZkVU2CJplH96TEZFWCVS
	1a+yAkY09SN6TK4SMC6t6foThtblcRWUJvgnW6r8tJoH0b/Xv2m5seIVgaTg/lOXTOIQlN+DxtyRS
	iB7CWDL2cRZiCEafT5HVEcSQ86nPGRCnuQjC3KnoMoZJqULbGo/oV6JZBnicT7veXoZ4j/XrGt8S1
	ti4c6yvIApe1A1IsRiS3C/bCN2aFKcRiDMgWLG/jl//EfJExZQMylEOiCVKppEd2uxJ0Q0lItxz4V
	0WpV+jww==;
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWpYN-000000020C5-3fw4
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 06:03:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780984990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CeVq8nIFWuQTYTDv2nXLX/gfQ3GPv2/MmaJpRnKjBUM=;
	b=T4cVLiBKpub52d9V/sOMY+nhHhBdp+01hm4SMjSruiz278dhwElAEu3t5HWnq2fP/MYHOU
	LR0NxNlDcXAU5jpTOY9CKWBMlGdRjf9cL9rL2xrH0a/LXTVo+a3bi+OedYecR9sFeiMUyA
	LIUS7sF025t5x1y9+yM2oMFOyCMI1sQ=
From: Atish Patra <atish.patra@linux.dev>
Date: Mon, 08 Jun 2026 23:01:34 -0700
Subject: [PATCH v6 20/21] TEST(do-not-upstream): fake qemu-virt PMU events
 for cdeleg counter-mask testing
MIME-Version: 1.0
Message-Id: <20260608-counter_delegation-v6-20-285b72ed65a9@meta.com>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
In-Reply-To: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
To: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ian Rogers <irogers@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_070312_747562_F5F08FF4 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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

From: Atish Patra <atishp@meta.com>

Adds fake-any/fake-ctr3/fake-ctr34 (event codes 0xF0x QEMU doesn't model) with
counterid_masks, to exercise the counter-delegation allocation + counter-mask
constraint in QEMU (events read 0 = allocated/programmed, vs 'not supported').

Signed-off-by: Atish Patra <atishp@meta.com>
---
 drivers/perf/riscv_pmu_sbi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 74acac54328e..3c0829c0a42a 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -476,6 +476,12 @@ RVPMU_EVENT_CMASK_ATTR(instructions, instructions, 0x02, 0xFFFFFFF8);
 RVPMU_EVENT_CMASK_ATTR(dTLB-load-misses, dTLB_load_miss, 0x10019, 0xFFFFFFF8);
 RVPMU_EVENT_CMASK_ATTR(dTLB-store-misses, dTLB_store_miss, 0x1001B, 0xFFFFFFF8);
 RVPMU_EVENT_CMASK_ATTR(iTLB-load-misses, iTLB_load_miss, 0x10021, 0xFFFFFFF8);
+/*
+ * FAKE events for cdeleg mechanism testing: event codes QEMU does NOT model.
+ */
+RVPMU_EVENT_CMASK_ATTR(fake-any, fake_any, 0xF00, 0xFFFFFFF8);
+RVPMU_EVENT_CMASK_ATTR(fake-ctr3, fake_ctr3, 0xF01, 0x8);
+RVPMU_EVENT_CMASK_ATTR(fake-ctr34, fake_ctr34, 0xF02, 0x18);
 
 static struct attribute *qemu_virt_event_group[] = {
 	RVPMU_EVENT_ATTR_PTR(cycles),
@@ -483,6 +489,9 @@ static struct attribute *qemu_virt_event_group[] = {
 	RVPMU_EVENT_ATTR_PTR(dTLB_load_miss),
 	RVPMU_EVENT_ATTR_PTR(dTLB_store_miss),
 	RVPMU_EVENT_ATTR_PTR(iTLB_load_miss),
+	RVPMU_EVENT_ATTR_PTR(fake_any),
+	RVPMU_EVENT_ATTR_PTR(fake_ctr3),
+	RVPMU_EVENT_ATTR_PTR(fake_ctr34),
 	NULL,
 };
 

-- 
2.53.0-Meta


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

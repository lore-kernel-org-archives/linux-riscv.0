Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690FBCF8855
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 13:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MikrrOVPbvVwjnIEFUidB2ge24hsLroxR4XYzyRDIxU=; b=4TEHfnFUoCwV+g
	+bGuAXFr4+Uu3U7JfK9BEPT+xupO4PO7YwyGTpNSV3U5/AyWqS8Mvmo9yAnHMKN0nHfL1FTvlmuz+
	5+G2uV6asknYLDyLrqGqTrmI6V9LX3HOsPTHxf74qBf6gTHOkcOO8QQ4OgC88+tal7lGvRnYh/5Pz
	v8OzNeVJA/1kbB8nC7lnpvaRCTKMx6sTHAy4oQbIJvYj401dMTMbYDtsYNYhiayhJcITq5Lb2Q9qO
	Fo2nplikDnrPqX7W8wcF75G0I/naDbJRCX1DCDpBHRxR6fCEJrbtdQaOzCLbklW9ljYJfj0E6+aQU
	8jlRhQn2VrZgAQk+H1Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4Xd-00000006iVb-0mbi;
	Thu, 20 Nov 2025 13:17:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4Xc-00000006iUm-0iCl
	for linux-riscv@bombadil.infradead.org;
	Thu, 20 Nov 2025 13:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MYSgN5w0D1hjp7V+UEVTCIwZSJHPUtS6HG0oLeFcfcM=; b=Ufu0uHcKW9HsPOIjruIGJv055S
	r1FJUarMB2weQmj+N+qaLME4BKChBYBQuMYqBLKHKW/JGj/LRvlqtS7yFcDgkjLlBbmex72kxniGL
	V1BqIMOKJcVW8RvEhcYLWsT1PlWG4zz4iV1nsJQBCQEBm1ai+JZJpyAoufomArbgR0bnq3UtRhyv8
	mMYEuSG0QtvQkKDW3zLXyqnPc+JtKI4RnfSeetKGfgBllXRaIx0JHQ9jx1lGfDR1rrLQlON4zJxhy
	cIxzVan9kvkWAYpWb3VRmfqXlty3afMN1m7OCKhpc6cuzwArhf8lIQzH6qLRZ+jgnyDxoKgrCpUkY
	Bs5RZhtw==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3fg-0000000EY1i-3NsX
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 12:22:13 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0C6962617B;
	Thu, 20 Nov 2025 14:17:15 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPVi9DDBgPin; Thu, 20 Nov 2025 14:17:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644634; bh=rzsceNVsLgNTO+X00rj3Tf+eMe4kMyO3UMkIeEbat4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hvu/z7cMM9B466fCNUlVTJJ+1uxXSmsnHKCwjPlaWNy3Q67leBSvyfLkAnO46Crrm
	 4WyXMBl9RniFGROU0WXmQQ0jjpDIoI8BrAr7SKyd5lTZSVY8ACxuo3FXFJ8OK+9elt
	 75F+5pGPX+Gyj8PAC+Equ6yaGDEJrXRBciCMP6IqGkvcnkXj+HrsXhqNPUn4ohLPpU
	 VhbXeoqQq5qvn/BYvS/ya3foz9SJNa+Ge5bBlmSWmBYUOg63t8MemJBao8NIbdYIl/
	 +TC1O1C26J79C0OkR+iKa2/y7KKz7/x5pGPgxmDfPkaUqDX31TJZbkZZzhxAVCtWYS
	 8YHyWOdnZZnHw==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 7/7] [Not For Upstream] riscv: dts: thead: Add CPU clock and OPP table for TH1520
Date: Thu, 20 Nov 2025 13:14:16 +0000
Message-ID: <20251120131416.26236-8-ziyao@disroot.org>
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
References: <20251120131416.26236-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_122212_206680_59A60387 
X-CRM114-Status: UNSURE (   8.86  )
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

Add operating point table for CPU cores, and wire up clocks for CPU
nodes.

This patch isn't intended for upstreaming but only for testing purpose,
since the PMIC driver for scaling CPU voltage isn't ready yet. Only
operating points whose voltage is satisified by Lichee Module 4A's PMIC
default, i.e. <= 1.5GHz, are enabled.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index bd5d33840884..6020d568ad7c 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -38,6 +38,8 @@ c910_0: cpu@0 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache>;
 			mmu-type = "riscv,sv39";
+			operating-points-v2 = <&cpu_opp>;
+			clocks = <&clk CLK_C910>;
 
 			cpu0_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -65,6 +67,8 @@ c910_1: cpu@1 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache>;
 			mmu-type = "riscv,sv39";
+			operating-points-v2 = <&cpu_opp>;
+			clocks = <&clk CLK_C910>;
 
 			cpu1_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -92,6 +96,8 @@ c910_2: cpu@2 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache>;
 			mmu-type = "riscv,sv39";
+			operating-points-v2 = <&cpu_opp>;
+			clocks = <&clk CLK_C910>;
 
 			cpu2_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -119,6 +125,8 @@ c910_3: cpu@3 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache>;
 			mmu-type = "riscv,sv39";
+			operating-points-v2 = <&cpu_opp>;
+			clocks = <&clk CLK_C910>;
 
 			cpu3_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -137,6 +145,33 @@ l2_cache: l2-cache {
 		};
 	};
 
+	cpu_opp: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <600000>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			opp-microvolt = <700000>;
+		};
+
+		opp-1500000000 {
+			opp-hz = /bits/ 64 <1500000000>;
+			opp-microvolt = <800000>;
+		};
+
+/*
+		opp-1848000000 {
+			opp-hz = /bits/ 64 <1848000000>;
+			opp-microvolt = <1000000>;
+		};
+ */
+	};
+
 	pmu {
 		compatible = "riscv,pmu";
 		riscv,event-to-mhpmcounters =
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

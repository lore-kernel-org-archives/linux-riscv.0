Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EADC606A558
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 22:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bKW/ubsf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Si1YQPIi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LR+PIDgwJAtGgffMqCmUvigQPD5+MZG0+lPT4lirbcw=; b=bKW/ubsfygnDX8bf6X/eelc3SA
	eba1nf48owAKGg290pdB+Bgy7fQv9FDsyZYdGJclkN9WQLXSXKKXDWtBg9jHg5Fn1Z6E+q2iTbYs9
	Kl3L04tJg+TMD6ZQGEs+Tsd0roMPDbusoGDxqjW+JUrLGRNx6fWmrH6i5rvw1y37A2Mt1IOo2fsF4
	bElq/GoYJ/6qexobKZuM1lIcDvXRaLe11yhMKjzMJIQ1CSx0NqvFyUMm3iY3XXmfRaMyyu5QZC+3n
	iIczRiTn2V1lsgx/FDqxxFKxYfRanTOHf2vXWE5DBilS/V0Lo3V8ez3znHU4+7vfZuRE7yFE9iMoh
	s7nrC28A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzqq-0000000EjGY-1Kea;
	Fri, 13 Nov 2026 22:34:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzq6-0000000Ehtc-3mJ2;
	Fri, 13 Nov 2026 22:33:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42B3162411;
	Fri, 13 Nov 2026 22:33:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794609226;
	b=u7WsHHvDdl5qnZDs26Flt1iIg5HOYE1yBSHu6Pc6OUKdRn0/fKVSn7Rn1jdrNr4cxMxH
	 jQ/t9Ft+c7E1Q+lcE1lHmP+91Om5KpSRaGyq/dC9aS0L2XqiGFUwVAoHHOXd6VAYq1a8G
	 vBUEys45q6r3lsM9jQeYPvJdJjXnWbc7YruZvXinlfBjntN/BT0RFczSXCMZuD1ZT2EPW
	 Fszq+52RfBJq24ZnvfME34cMpcu/d6v1hLm6TzNZa/TJWLDLGzHkX57U3moPGTvsQweV2
	 xn2zIH5PeBC6EbInCnaZ0L7M+zsSjvg5H+Ut0M2f04q0oGNE9//3QhyBni9nyVVIIhg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794609226;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DOxML222XmvL+DQT7TqgyzdlYBmAoo3ZeZbVK+z7caI=;
	b=FQRuxepSbIC65jGX6U0m2sE34mjW5sKjSWo+lFOYl0qwMEOp7aIbu7wV0p+1GEL1KUl6
	 peU8M/qy+umHKnQq8DkU5dN8z0DyldSL73kWje3PMn1fq/QQMvBlP+RZi5wmj4CsaN1/t
	 vSESao+4O7/8QBuJiuIxHYjwq0me9BnLUfHY8m9uBDcDH/S15oG+jtDc06/J/b6umQecY
	 HonamVyD6xfz3fJZjriAs2hTsWzR3gNNYYvU0le+yn/A7HDJ4uTCXaUd7SWpCeKAptQyu
	 qHeDY89IBRTk5vUAQsTFC72mjs0Tos3wyzWhGIany4GERyNOg844F7SrbFaQksZYomA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8BDF1F0182C;
	Fri, 13 Nov 2026 22:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794609225;
	bh=DOxML222XmvL+DQT7TqgyzdlYBmAoo3ZeZbVK+z7caI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Si1YQPIiFo35Y4t5bymDfMNz84lejIvPobizIkdyRlboRMXCBmVo3l2ed2EQg5wB+
	 PpFyJKbnjHErVW/Iytdm42aVqpZytIQgUh8QJ33OpMb/4/W7XD6+IcPW6V+BSPuStJ
	 nSP9Plk4Z59vk9LsErhygovdY0lTPUBkJrAZQUQBv1zY0tVG3xaWOr4cAh45l2cCy8
	 XZ71SrAl6Pl8OcQtJVnujFfCebDGjsYTlmKWhJfiBFYoBf8r0VPlPtTtvWdgFJC0MS
	 FFbBrtDNsXNBIkKzc147UvoR8pfHYpVxttNTV2uQiv4y6raqVJ+TtyVssJxulKcY7M
	 KzSCuUhC7NjaQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E7F9C49B93;
	Fri, 13 Nov 2026 22:33:33 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 14 Nov 2026 06:33:42 +0800
Subject: [PATCH 16/19] riscv: dts: allwinner: add the Allwinner V861 SoC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261114-v861-v1-16-eb71ec3ee523@iscas.ac.cn>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Han Gao <gaohan@iscas.ac.cn>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794609209; l=10397;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=I8wnVF/DxQ+OwPzKUk/zbleMxuzgspwkeJdPCkKcyAI=;
 b=XbE5JqKc/+xicVaxMpURs2OAsP30uKgCVuEGNLvpjV1/qMGyJEQsGJqL5Vkjv64UiYtdMrdQk
 kfuyEydjd9YB+W+cJRNAlUu2rx9g6dTgHRTPm2wELTS4q3j4Bl+DDc0
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Add the V861 SoC with its two C907 harts, PLIC, CLINT, clock
controllers, RTC, pin controllers and UART0.

The cache geometry and PMU events come from the V861 and C907 manuals.
Zcb, Zbkc and Zvfh were also checked to work on the hardware.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/allwinner/sun252i-v861.dtsi | 272 ++++++++++++++++++++++++
 1 file changed, 272 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun252i-v861.dtsi b/arch/riscv/boot/dts/allwinner/sun252i-v861.dtsi
new file mode 100644
index 000000000000..7a18b973ee32
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/sun252i-v861.dtsi
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/* Copyright (c) 2026 Han Gao <gaohan@iscas.ac.cn> */
+
+#include <dt-bindings/clock/sun252i-v861-ccu.h>
+#include <dt-bindings/clock/sun252i-v861-r-ccu.h>
+#include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/reset/sun252i-v861-ccu.h>
+#include <dt-bindings/reset/sun252i-v861-r-ccu.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <24000000>;
+
+		cpu0: cpu@0 {
+			compatible = "csky,c907", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <16384>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <16384>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&l2_cache>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v",
+				"zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+				"zicsr", "zifencei", "zihintntl", "zihintpause",
+				"zihpm", "zawrs", "zfa", "zfbfmin", "zfh",
+				"zca", "zcb", "zcd", "zba", "zbb", "zbc", "zbkc",
+				"zbs", "zkt", "zvfbfmin", "zvfbfwma", "zvfh",
+				"sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "csky,c907", "riscv";
+			device_type = "cpu";
+			reg = <1>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <16384>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <16384>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&l2_cache>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v",
+				"zicbom", "zicbop", "zicboz", "zicntr", "zicond",
+				"zicsr", "zifencei", "zihintntl", "zihintpause",
+				"zihpm", "zawrs", "zfa", "zfbfmin", "zfh",
+				"zca", "zcb", "zcd", "zba", "zbb", "zbc", "zbkc",
+				"zbs", "zkt", "zvfbfmin", "zvfbfwma", "zvfh",
+				"sscofpmf", "sstc", "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <128>;
+			cache-size = <131072>;
+			cache-unified;
+		};
+	};
+
+	osc24M: osc24M-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc24M";
+	};
+
+	pmu {
+		compatible = "riscv,pmu";
+		riscv,event-to-mhpmcounters =
+			<0x00003 0x00006 0x0007fff8>,
+			<0x00008 0x00009 0x0007fff8>,
+			<0x10000 0x10003 0x0007fff8>,
+			<0x10008 0x10009 0x0007fff8>,
+			<0x10019 0x10019 0x0007fff8>,
+			<0x1001b 0x1001b 0x0007fff8>,
+			<0x10021 0x10021 0x0007fff8>,
+			<0x10028 0x10029 0x0007fff8>;
+		riscv,event-to-mhpmevent =
+			<0x00003 0x00000000 0x000000a5>,
+			<0x00004 0x00000000 0x000000a6>,
+			<0x00005 0x00000000 0x00000036>,
+			<0x00006 0x00000000 0x00000038>,
+			<0x00008 0x00000000 0x00000027>,
+			<0x00009 0x00000000 0x00000028>,
+			<0x10000 0x00000000 0x0000000c>,
+			<0x10001 0x00000000 0x0000000d>,
+			<0x10002 0x00000000 0x0000000e>,
+			<0x10003 0x00000000 0x0000000f>,
+			<0x10008 0x00000000 0x00000001>,
+			<0x10009 0x00000000 0x00000002>,
+			<0x10019 0x00000000 0x000000a4>,
+			<0x1001b 0x00000000 0x000000a3>,
+			<0x10021 0x00000000 0x00000003>,
+			<0x10028 0x00000000 0x00000036>,
+			<0x10029 0x00000000 0x00000038>;
+		riscv,raw-event-to-mhpmcounters =
+			<0x00000000 0x00000001 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000002 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000003 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000005 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000006 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000007 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000008 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000009 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000000b 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000000c 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000000d 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000016 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000001b 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000001c 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000001d 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000001f 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000020 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000021 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000023 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000025 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000027 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000028 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000029 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000002a 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000030 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000036 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x00000038 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000009b 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000009c 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x0000009e 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x000000a3 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x000000a4 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x000000a5 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x000000a6 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x000000a7 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x000000a8 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x000000a9 0xffffffff 0xffffffff 0x0007fff8>,
+			<0x00000000 0x000000aa 0xffffffff 0xffffffff 0x0007fff8>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&plic>;
+		ranges;
+		dma-noncoherent;
+
+		pio: pinctrl@2000000 {
+			compatible = "allwinner,sun252i-v861-pinctrl";
+			reg = <0 0x02000000 0 0x400>;
+			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>, <71 IRQ_TYPE_LEVEL_HIGH>,
+				     <73 IRQ_TYPE_LEVEL_HIGH>, <75 IRQ_TYPE_LEVEL_HIGH>,
+				     <77 IRQ_TYPE_LEVEL_HIGH>, <79 IRQ_TYPE_LEVEL_HIGH>,
+				     <81 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_APB0>, <&osc24M>, <&rtc CLK_OSC32K>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			uart0_ph_pins: uart0-ph-pins {
+				pins = "PH9", "PH10";
+				function = "uart0";
+				allwinner,pinmux = <5>;
+				bias-pull-up;
+			};
+		};
+
+		r_pio: pinctrl@2000540 {
+			compatible = "allwinner,sun252i-v861-r-pinctrl";
+			reg = <0 0x02000540 0 0x60>;
+			interrupts = <85 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_APB0>, <&osc24M>, <&rtc CLK_OSC32K>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		ccu: clock-controller@2001000 {
+			compatible = "allwinner,sun252i-v861-ccu";
+			reg = <0 0x02001000 0 0x1000>;
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>;
+			clock-names = "hosc", "losc", "iosc";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		uart0: serial@2500000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0 0x02500000 0 0x400>;
+			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART0>;
+			resets = <&ccu RST_BUS_UART0>;
+			status = "disabled";
+		};
+
+		r_ccu: clock-controller@7010000 {
+			compatible = "allwinner,sun252i-v861-r-ccu";
+			reg = <0 0x07010000 0 0x400>;
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
+				 <&ccu CLK_PLL_PERIPH0_200M>;
+			clock-names = "hosc", "losc", "iosc", "pll-periph";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		rtc: rtc@7090000 {
+			compatible = "allwinner,sun252i-v861-rtc",
+				     "allwinner,sun50i-r329-rtc";
+			reg = <0 0x07090000 0 0x400>;
+			interrupts = <138 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_RTC>, <&osc24M>,
+				 <&r_ccu CLK_R_AHB>;
+			clock-names = "bus", "hosc", "ahb";
+			#clock-cells = <1>;
+		};
+
+		plic: interrupt-controller@30000000 {
+			compatible = "allwinner,sun252i-v861-plic", "thead,c900-plic";
+			reg = <0 0x30000000 0 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
+					      <&cpu1_intc 11>, <&cpu1_intc 9>;
+			riscv,ndev = <150>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+		};
+
+		clint: timer@34000000 {
+			compatible = "allwinner,sun252i-v861-clint", "thead,c900-clint";
+			reg = <0 0x34000000 0 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>;
+		};
+	};
+};

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B22960A2626
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 19:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BtIuHM70;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DJ0byY0U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gARIU0DexkMnV1w+KErwofQX7nzf+3PGR9fP2powOPg=; b=BtIuHM70NF69PZG6Blj2BM3jJj
	82QBH6T1RUhmfV4DSCnGf+HERjgCibNLvbAvlZOUeWpKo7JNR9jM2ws7eYlBOQ2pnyXGLtS/nxNpG
	AZlqSnsItKK92yO5YXAuBr27JqQP4l8FFJBEfZcOmn2JXvGCPD4rND1qOtx+caBxWajiaXe9wnofK
	bVL+w2ptPupuTPqAMhLKNI9fD/dT3Fy8th+G9LBFW2YMBMG8ETBoO7VwwQI+bMYNjdbdY377TQbOZ
	bR0EdXOn05Hvb22Nh12i4WfplFts5/P7EgASOD5cV/odBTIG1ijMyUvUAXKSC8VYiIEFwsDbNXgYu
	lDue8NPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6X-0000000G2Qd-2aVo;
	Fri, 20 Nov 2026 19:17:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6I-0000000G2Ek-3nDf
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 19:16:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AADF62603;
	Fri, 20 Nov 2026 19:16:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795202205;
	b=VQjKnP7jqoMq3Nwr+xu87jgBSif3mmT+jrItbu6BD+x+FsYTwqOUF/DWpF+Az5HODCru
	 TueefBdY4iQX8o2Ql+uQptaYnUS59XB8asWAIb2zb9gxUomc6c2LOhxcR4STI025EXP2h
	 zXrKZ8Dy2enfFFaGdrLsLFrg4IaSA9oqmHS8zQKuf7Id1UFwrXwWiXRDjpUmNpyHgXbrp
	 aucWBocKwwc6x4lv4gpOIV5krDfOM9uA+D8cegAZi4ldGnP+uv2GMada64s6taEcuHawZ
	 6mV8J0c1VbVsExWD0/uJjvDGJBkouHsRN1Xkxd3ALY/UT4dxusS6rh6CxB8UCkZrADw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795202205;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=HCevdgKhZ1dtmLEq1ewUS61fsbNjRbofrSTx7Caf4Qk=;
	b=jc8MmnrbLyNjxXSE9lKeL+HilXOmSd2Is43aOA5hYZLasK0YoKDTq3LaV2A21wYzIRha
	 EegM/RHiHAQcFR0444Jc8bF4X6inIRPsPoBp0zeAPSZPy6gEAlqIVJeWl71rqPyyOjeXg
	 bS2I+sde/alKeuJn+2evADmHf76E6Xk0ZmL1AlEYtbh3k44UeLkHgd7G6uKpuvsi1+ZpZ
	 rmmikJki4k8WcR2BUp1MGI/4/DZWnwVXQU31rap/YU4ir+z0/bSm362pvsibBDMpqmmt4
	 S2gUMxOrEIm462tPaeApxLDCkvn4ctDz4cakiJdqJWv2Mc2dLFy7s+zrupcnqAy8AVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A65D1F000F4;
	Fri, 20 Nov 2026 19:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202205;
	bh=HCevdgKhZ1dtmLEq1ewUS61fsbNjRbofrSTx7Caf4Qk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DJ0byY0UuMPxI60pCks4qo/73vLqNiypPJUNwRk/tNXn++ixVhHUw6DoqQJcNEpUM
	 p92+9XYBYvol353KBDTEZ79nmnknp571QGhErLFbYU6MiOlTgLaSA/CoJOhcapqWth
	 BFXWWDzbIAyl9KeTyYA+fuHiz2f2N67BUkS2bn/Y1Jlv63oFHfA/y5lSZ+0UPlOlnG
	 7EZ2QSci0fRd09Th+ZZwiN1eTcasD9YH4DFkFj52FzEUwo8r8N/P54WPw7j/dHDnfK
	 JHhWxGaKE3bNnnBYY4VfsFKCqrUwP012Jp8qSAV197hq7M7awT4f0huGJukG3cT56x
	 yaa2lpo6rYtHw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D88A04B9D6;
	Fri, 20 Nov 2026 19:16:24 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 21 Nov 2026 03:15:54 +0800
Subject: [PATCH v4 08/13] riscv: dts: zhihe: add A210 core support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-a210-scmi-v4-8-4a795a0a9fc9@iscas.ac.cn>
References: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
In-Reply-To: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Yao Zi <me@ziyao.cc>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-serial@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795202181; l=13974;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=wsHXRZzE1H1FcZ7onMSASIN86IiBKu2NSrwlOGeTJL0=;
 b=CwX8i6g/hOZ8Q/U6RQ0QEwOhNLRRrt7iqZA0qWjGE6un8hVX3iYQ2ZAeqWiNVOZ9gtrSS3pwf
 oCULS98cPCODxi7TMS5puFX0oUDizNqFrpk7jyMo34bZmJEngllP/2H
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Describe the CPU clusters, interrupt controllers and pad controllers.
Use SCMI clock and reset services through the E902 mailbox, with a
second mailbox channel for firmware notifications.

The SCMI clock and reset IDs are assigned by the E902 firmware, so they
live in headers next to the DTS rather than in dt-bindings.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/zhihe/a210-clock.h |  15 ++
 arch/riscv/boot/dts/zhihe/a210-reset.h |  13 +
 arch/riscv/boot/dts/zhihe/a210.dtsi    | 433 +++++++++++++++++++++++++++++++++
 3 files changed, 461 insertions(+)

diff --git a/arch/riscv/boot/dts/zhihe/a210-clock.h b/arch/riscv/boot/dts/zhihe/a210-clock.h
new file mode 100644
index 000000000000..d57e99dfd3e3
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210-clock.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef __A210_CLOCK_H
+#define __A210_CLOCK_H
+
+/* SCMI clock IDs as numbered by the E902 firmware */
+#define A210_CLK_UART_SCLK(n) (n)
+#define A210_CLK_UART_PCLK(n) (10 + (n))
+#define A210_CLK_PERI1_PAD 20
+#define A210_CLK_PERI2_PAD 21
+#define A210_CLK_PERI3_PAD 22
+#define A210_CLK_AON_SYS 23
+#define A210_CLK_AON_I2C1_IC 24
+#define A210_CLK_AON_I2C1_PCLK 25
+
+#endif
diff --git a/arch/riscv/boot/dts/zhihe/a210-reset.h b/arch/riscv/boot/dts/zhihe/a210-reset.h
new file mode 100644
index 000000000000..3f8eaf0fc17b
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210-reset.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef __A210_RESET_H
+#define __A210_RESET_H
+
+/* SCMI reset IDs as numbered by the E902 firmware */
+#define A210_RESET_UART_SRST(n) (n)
+#define A210_RESET_UART_PRST(n) (10 + (n))
+#define A210_RESET_PERI1_PAD 20
+#define A210_RESET_PERI2_PAD 21
+#define A210_RESET_PERI3_PAD 22
+#define A210_RESET_AON_I2C1 23
+
+#endif
diff --git a/arch/riscv/boot/dts/zhihe/a210.dtsi b/arch/riscv/boot/dts/zhihe/a210.dtsi
new file mode 100644
index 000000000000..6d85d94f0af1
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210.dtsi
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2021 Alibaba Group Holding Limited.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "a210-clock.h"
+#include "a210-reset.h"
+
+/ {
+	compatible = "zhihe,a210";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <24000000>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&c908_0>;
+				};
+
+				core1 {
+					cpu = <&c908_1>;
+				};
+
+				core2 {
+					cpu = <&c908_2>;
+				};
+
+				core3 {
+					cpu = <&c908_3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&c920_4>;
+				};
+
+				core1 {
+					cpu = <&c920_5>;
+				};
+
+				core2 {
+					cpu = <&c920_6>;
+				};
+
+				core3 {
+					cpu = <&c920_7>;
+				};
+			};
+		};
+
+		c0_l2_cache: l2-cache0 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <512>;
+			cache-size = <524288>;
+			cache-unified;
+		};
+
+		c1_l2_cache: l2-cache1 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-sets = <1024>;
+			cache-size = <1048576>;
+			cache-unified;
+		};
+
+		c908_0: cpu@0 {
+			device_type = "cpu";
+			compatible = "thead,c908", "riscv";
+			reg = <0>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <32768>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c0_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c908_1: cpu@1 {
+			device_type = "cpu";
+			compatible = "thead,c908", "riscv";
+			reg = <1>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <32768>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c0_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c908_2: cpu@2 {
+			device_type = "cpu";
+			compatible = "thead,c908", "riscv";
+			reg = <2>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <32768>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c0_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c908_3: cpu@3 {
+			device_type = "cpu";
+			compatible = "thead,c908", "riscv";
+			reg = <3>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <32768>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c0_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c920_4: cpu@4 {
+			device_type = "cpu";
+			compatible = "thead,c920", "riscv";
+			reg = <4>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <65536>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c1_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c920_5: cpu@5 {
+			device_type = "cpu";
+			compatible = "thead,c920", "riscv";
+			reg = <5>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <65536>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c1_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c920_6: cpu@6 {
+			device_type = "cpu";
+			compatible = "thead,c920", "riscv";
+			reg = <6>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <65536>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c1_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu6_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		c920_7: cpu@7 {
+			device_type = "cpu";
+			compatible = "thead,c920", "riscv";
+			reg = <7>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <512>;
+			i-cache-size = <65536>;
+			mmu-type = "riscv,sv39";
+			next-level-cache = <&c1_l2_cache>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "b", "v", "sscofpmf", "sstc",
+					       "svpbmt", "zba", "zbb", "zbc",
+					       "zbs", "zicbom", "zicbop",
+					       "zicboz", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu7_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+	};
+
+	firmware {
+		scmi {
+			compatible = "arm,scmi";
+			mboxes = <&mbox_e902 0>, <&mbox_e902 1>;
+			mbox-names = "tx", "rx";
+			shmem = <&scmi_shmem>, <&scmi_notification_shmem>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+
+			scmi_reset: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		dma-noncoherent;
+		#size-cells = <2>;
+
+		mbox_e902: mailbox@320000 {
+			compatible = "zhihe,a210-ap-mailbox";
+			reg = <0 0x00320000 0 0x2000>,
+			      <0 0x00311000 0 0x1000>;
+			reg-names = "local", "remote";
+			interrupt-parent = <&intc>;
+			interrupts = <336 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
+		peri1_padctrl: pinctrl@2026000 {
+			compatible = "zhihe,a210-peri1-pinctrl";
+			reg = <0x0 0x02026000 0x0 0x1000>;
+			clocks = <&scmi_clk A210_CLK_PERI1_PAD>;
+			clock-names = "pclk";
+			resets = <&scmi_reset A210_RESET_PERI1_PAD>;
+
+			status = "disabled";
+		};
+
+		peri2_padctrl: pinctrl@8411000 {
+			compatible = "zhihe,a210-peri2-pinctrl";
+			reg = <0x0 0x08411000 0x0 0x1000>;
+			clocks = <&scmi_clk A210_CLK_PERI2_PAD>;
+			clock-names = "pclk";
+			resets = <&scmi_reset A210_RESET_PERI2_PAD>;
+
+			status = "disabled";
+		};
+
+		intc: interrupt-controller@18000000 {
+			compatible = "zhihe,a210-plic", "thead,c900-plic";
+			reg = <0x0 0x18000000 0x0 0x04000000>;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
+					      <&cpu1_intc 11>, <&cpu1_intc 9>,
+					      <&cpu2_intc 11>, <&cpu2_intc 9>,
+					      <&cpu3_intc 11>, <&cpu3_intc 9>,
+					      <&cpu4_intc 11>, <&cpu4_intc 9>,
+					      <&cpu5_intc 11>, <&cpu5_intc 9>,
+					      <&cpu6_intc 11>, <&cpu6_intc 9>,
+					      <&cpu7_intc 11>, <&cpu7_intc 9>;
+			riscv,ndev = <351>;
+		};
+
+		clint0: clint@1c000000 {
+			compatible = "zhihe,a210-clint", "thead,c900-clint";
+			reg = <0x0 0x1c000000 0x0 0x0000d800>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
+					      <&cpu1_intc 3>, <&cpu1_intc 7>,
+					      <&cpu2_intc 3>, <&cpu2_intc 7>,
+					      <&cpu3_intc 3>, <&cpu3_intc 7>,
+					      <&cpu4_intc 3>, <&cpu4_intc 7>,
+					      <&cpu5_intc 3>, <&cpu5_intc 7>,
+					      <&cpu6_intc 3>, <&cpu6_intc 7>,
+					      <&cpu7_intc 3>, <&cpu7_intc 7>;
+		};
+
+		aon_padctrl: pinctrl@30848000 {
+			compatible = "zhihe,a210-aon-pinctrl";
+			reg = <0x0 0x30848000 0x0 0x2000>;
+			clocks = <&scmi_clk A210_CLK_AON_SYS>;
+			clock-names = "pclk";
+
+			status = "disabled";
+		};
+
+		sram@30907c00 {
+			compatible = "mmio-sram";
+			reg = <0 0x30907c00 0 0x200>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x30907c00 0x200>;
+
+			scmi_shmem: scp-sram@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0 0x100>;
+			};
+
+			scmi_notification_shmem: scp-sram@100 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x100 0x100>;
+			};
+		};
+	};
+};

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3DD606A33B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zY11nlae
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/7LkgPPS454KIDqPKdqfWNNe1nODCq8tv2DCVHLmHc=; b=zY11nlaeIDLpYj
	C0Kg81p7O1Y3nlSiolpnEsy4rXJxzEuxKkNKkcWQux00peOnen2HebCbLoOQvZzW9h7DPOMc9Agub
	Ry1iaEtBG7i7jZ2feHdL5vZ1ScVDL4FNoFkl2JySlFoGZmOvEJTqllhXtFjans6yFimMQfuV3Q0av
	CGs7CZvKKceyOFh6xqtgWWCHVG+5BYJ4WAz42PPpiIlsxdhIXmU3iIWSoAx2VZSESrZMNr6dXOqQP
	3VPfYrujqF2SFKbXzF2xZOcnimFPbDuORkj/RlZZFVNdB8ATyFj7yEKEvCdrPagCMFqe3DX/d8oES
	XN+UR1tBmhip4NGrVCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcIf-0000000Cl4v-3q50;
	Wed, 21 Oct 2026 19:48:37 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcId-0000000Cl3F-12cV
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 19:48:36 +0000
Received: from [127.0.1.1] (unknown [223.166.93.48])
	by APP-03 (Coremail) with SMTP id rQCowAB3gT_6Ftlqxu5hCw--.4480S15;
	Thu, 22 Oct 2026 03:48:25 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 22 Oct 2026 03:48:21 +0800
Subject: [PATCH 13/18] riscv: dts: zhihe: add A210 core support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-a210-init-v1-13-09fb4d99da65@iscas.ac.cn>
References: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
In-Reply-To: <20261022-a210-init-v1-0-09fb4d99da65@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-CM-TRANSID: rQCowAB3gT_6Ftlqxu5hCw--.4480S15
X-Coremail-Antispam: 1UD129KBjvAXoWfGw1DZrW3Gry7uF4rCFy3urg_yoW8JF48Zo
	WayrZ5Zw18Ka48Aas7AFWfGw1rG3s7Wa1agw4qy34fJw4YgrWrJryrt3W5Xr1aqry0yr1v
	y3409a9rKa1Iyr1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUO-7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s0DM28Irc
	Ia0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
	84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJV
	WxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWx
	Jr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxV
	A2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
	6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_
	Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JbIYCTnIWIevJa73UjIFyTuYvjTR_nYFDUUUU
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBggHDGrYxtWX3wAAss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_124835_875853_28173F82 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add the A210 CPU clusters, caches, interrupt controllers and control
blocks.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/zhihe/a210.dtsi | 495 ++++++++++++++++++++++++++++++++++++
 1 file changed, 495 insertions(+)

diff --git a/arch/riscv/boot/dts/zhihe/a210.dtsi b/arch/riscv/boot/dts/zhihe/a210.dtsi
new file mode 100644
index 000000000000..bbad51a3edb0
--- /dev/null
+++ b/arch/riscv/boot/dts/zhihe/a210.dtsi
@@ -0,0 +1,495 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (C) 2021 Alibaba Group Holding Limited.
+ */
+
+#include <dt-bindings/clock/zhihe,a210-clk.h>
+#include <dt-bindings/clock/zhihe,a210-aon-clk.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/reset/zhihe,a210-resets.h>
+
+/ {
+	compatible = "zhihe,a210";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aon_rc: clock-aon-rc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	osc_24m: clock-osc-24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc-24m";
+	};
+
+	osc_32k: clock-osc-32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "osc-32k";
+	};
+
+	aon_110m: clock-osc-110m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <110000000>;
+		clock-output-names = "aon-110m";
+	};
+
+	rc_24m: clock-rc-24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "rc-24m";
+	};
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
+			clocks = <&clk C908_CPU_TO_CDE_CLK_MUX>;
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
+			clocks = <&clk C920_CPU_TO_CDE_CLK_MUX>;
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
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		dma-noncoherent;
+		#size-cells = <2>;
+
+		clk: clock-controller@260000 {
+			compatible = "zhihe,a210-clk";
+			reg = <0x0 0x00260000 0x0 0x1000>,
+			      <0x0 0x00250000 0x0 0x1000>,
+			      <0x0 0x10141600 0x0 0x100>,
+			      <0x0 0x10141400 0x0 0x100>,
+			      <0x0 0x04810000 0x0 0x1000>,
+			      <0x0 0x05810000 0x0 0x1000>,
+			      <0x0 0x04900000 0x0 0x1000>,
+			      <0x0 0x20250000 0x0 0x1000>,
+			      <0x0 0x10140000 0x0 0xe00>;
+			reg-names = "pll-wrap", "top-crg", "cpu-ss-clk-sysreg",
+				    "cpu-ss-cpu-pll", "ddr0-sysreg",
+				    "ddr1-sysreg", "slc-dual-sysreg",
+				    "top-crg-t", "cpu-ss-ccu";
+			#clock-cells = <1>;
+			clocks = <&osc_32k>, <&osc_24m>, <&rc_24m>;
+			clock-names = "osc-32k", "osc-24m", "rc-24m";
+		};
+
+		clk_peri: clock-controller@300200 {
+			compatible = "zhihe,a210-peri-clk";
+			reg = <0x0 0x00300200 0x0 0x4>,
+			      <0x0 0x02010200 0x0 0x8>,
+			      <0x0 0x08400200 0x0 0x8>,
+			      <0x0 0x00540200 0x0 0x4>,
+			      <0x0 0x27420200 0x0 0x200>;
+			reg-names = "peri0-sysreg", "peri1-sysreg",
+				    "peri2-sysreg", "peri3-sysreg", "tee-crg";
+			#clock-cells = <1>;
+		};
+
+		peri3_padctrl: pinctrl@542000 {
+			compatible = "zhihe,a210-peri3-pinctrl";
+			reg = <0x0 0x00542000 0x0 0x1000>;
+			clocks = <&clk_peri PERI3_PAD_CTRL_PCLK_EN>;
+			clock-names = "pclk";
+
+			status = "disabled";
+		};
+
+		rst_peri1: reset-controller@2010400 {
+			compatible = "zhihe,a210-peri1-reset";
+			reg = <0x0 0x02010400 0x0 0x200>;
+			#reset-cells = <1>;
+		};
+
+		peri1_padctrl: pinctrl@2026000 {
+			compatible = "zhihe,a210-peri1-pinctrl";
+			reg = <0x0 0x02026000 0x0 0x1000>;
+			clocks = <&clk_peri PERI1_PAD_CTRL_PCLK_EN>;
+			clock-names = "pclk";
+
+			status = "disabled";
+		};
+
+		rst_peri2: reset-controller@8400400 {
+			compatible = "zhihe,a210-peri2-reset";
+			reg = <0x0 0x08400400 0x0 0x200>;
+			#reset-cells = <1>;
+		};
+
+		peri2_padctrl: pinctrl@8411000 {
+			compatible = "zhihe,a210-peri2-pinctrl";
+			reg = <0x0 0x08411000 0x0 0x1000>;
+			clocks = <&clk_peri PERI2_PAD_CTRL_PCLK_EN>;
+			clock-names = "pclk";
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
+			interrupts-extended = <&cpu0_intc 0xffffffff>,
+					      <&cpu0_intc 9>,
+					      <&cpu1_intc 0xffffffff>,
+					      <&cpu1_intc 9>,
+					      <&cpu2_intc 0xffffffff>,
+					      <&cpu2_intc 9>,
+					      <&cpu3_intc 0xffffffff>,
+					      <&cpu3_intc 9>,
+					      <&cpu4_intc 0xffffffff>,
+					      <&cpu4_intc 9>,
+					      <&cpu5_intc 0xffffffff>,
+					      <&cpu5_intc 9>,
+					      <&cpu6_intc 0xffffffff>,
+					      <&cpu6_intc 9>,
+					      <&cpu7_intc 0xffffffff>,
+					      <&cpu7_intc 9>;
+			riscv,ndev = <351>;
+		};
+
+		clint0: clint@1c000000 {
+			compatible = "zhihe,a210-clint", "thead,c900-clint";
+			reg = <0x0 0x1c000000 0x0 0x0000d800>;
+			interrupts-extended = <&cpu0_intc 3>,
+					      <&cpu0_intc 7>,
+					      <&cpu1_intc 3>,
+					      <&cpu1_intc 7>,
+					      <&cpu2_intc 3>,
+					      <&cpu2_intc 7>,
+					      <&cpu3_intc 3>,
+					      <&cpu3_intc 7>,
+					      <&cpu4_intc 3>,
+					      <&cpu4_intc 7>,
+					      <&cpu5_intc 3>,
+					      <&cpu5_intc 7>,
+					      <&cpu6_intc 3>,
+					      <&cpu6_intc 7>,
+					      <&cpu7_intc 3>,
+					      <&cpu7_intc 7>;
+		};
+
+		clk_aon: clock-controller@30844000 {
+			compatible = "zhihe,a210-aon-clk";
+			reg = <0 0x30844000 0 0x1c>;
+			#clock-cells = <1>;
+			clocks = <&aon_110m>, <&osc_24m>, <&aon_rc>, <&osc_32k>;
+			clock-names = "high", "osc", "rc", "rtc";
+		};
+
+		aon_padctrl: pinctrl@30848000 {
+			compatible = "zhihe,a210-aon-pinctrl";
+			reg = <0x0 0x30848000 0x0 0x2000>;
+			clocks = <&clk_aon A210_AON_SYS_CLK>;
+			clock-names = "pclk";
+
+			status = "disabled";
+		};
+	};
+};

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

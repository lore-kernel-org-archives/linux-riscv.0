Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823BECD1284
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 01:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dADL81KJwdetsBsFjr3Hmt4XOlaZZocn6akuQ4RxVmo=; b=wfDA0yT6GqW1rM
	X8XSHT3Zvhm5pDKHRbLOecYzkOI/K824650RDZIa4MOFXbKB11816m8lym/o2/FxdmC7Bcf8l/gxu
	6a9guzrhZrRtdhQifPyIgqwHjxwMFwUaRKkOtq/aVROJ9pMRFXazTviWe+rQvv0uuWlZrg0zMXZD+
	EZiUfk+IKLHeH1dVCpA4C494MiumxLhmfkGE8HeQLYfRAg1PteutJdtlGl7fHp3MIUZ0EmLGfHYGN
	X/GOFmCKbMH2v2TWuJOsGtf5gU55+z5YP3WgwLLcC3Ute8wBevVc/aS4vvwWYb0laftD4HCLxmvAg
	zrc6dreGTFDRsIa1CkFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHMJ-0000000BOQJ-3dw1;
	Sun, 07 Apr 2024 01:30:11 +0000
Received: from out203-205-251-73.mail.qq.com ([203.205.251.73])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHMG-0000000BON2-0oYh
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 01:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712453404; bh=9oqU6VEHh8jBFFwTptwV+5ypJiPWZBgEpxz6YMVsWGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rz7ontIl0+py/Ih7saNo6u69RUzXFPSkpwgMcKrebY+fVpJlTJd0yLIFyPcatfn+V
	 obLtKHlgNkev/1IeXwUhi+8Da2JFlIkpyQZ89y9mBWS7fZkCv88kL/vFTMEXFiaVdt
	 NKP9hhKD7mhAJEt1QwUSNbcuo+fITeVO9jclaMUk=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 7741FE3D; Sun, 07 Apr 2024 09:29:52 +0800
X-QQ-mid: xmsmtpt1712453401tnvu9pu78
Message-ID: <tencent_908920ACB69763132E434C42087423169F06@qq.com>
X-QQ-XMAILINFO: NBOcPERDMH3ATP86RoJ0eiigWldsy1UtTtYHsz/PiHnDL0euTNJ/L5/JYUpOb+
	 ff/YnsKDi2AEsYNU8eYYH8IzHbvF9mRYbgkcUN0tvAmEAgK1O/7QR3xzkbzcBDvXN7wDgHTcH7EH
	 IQ6DR/lREdd49GnJVzF6pJ/ZNTgT7DcNKN3kWxav9EeCJ+/hfJ2sKkAaIjU2uHHVgMNRo2cBZNwO
	 Gqa5xtTDI8uTaSoS2ESw1fvxtrKzxeWrg8+tQXhgnopmY1Rawa/Xli4mLiGr1E3JyOjc7FwD/jud
	 j+hIVvXxQ6cdPRaNWhqp7pIwptlm+fxA0HyriXNlBeMJSMC3ZQjC8qiJsayC/cU6L0Cgw2hRas+A
	 V361UnbyRCyo3QBErjfHFjBSwtC8yegz+7Shgx9T+mOvGT0J4OWmovSLl8021CR3XgnMZ8j905Mx
	 DaGneYPl7OxCgWeZKgObLAWrfy1VxjK+w56uM/a05FpHbBw6BkD8TYYBLNm5btzL/i8Og8XUG8Fl
	 3LW0li+9Ezg42AuxJdEoOdhd2NEe1Vsdusc81b20MZNhztkOaGA6BlWsBNQfidZ+WQ3ge19CarYq
	 PoDvAka0itCJuxG382crB95iChen/0/WK05ZCf3aICdx4ANeleYC+eahGqAURirFftaolAM45zr4
	 GGOFv5pOObTHdoFj9weeHRrlsccdvuzXl57QBMA4ipu6r+O7EZDtoCqH77t9f5th+qF6USkvARF+
	 /TaWljkRBQKWW546zrLq1wpmQ04fEdSllR3VeJQIV0COhqaxdUy3AXyViEkNqy9Ywq/odYAlaUqf
	 sIK3y38zOdk9XuhLn+VOKbHnaTcvF8+P7+4tLd1U2WONpA3cEHPN0tlx60GtYetVJMtBX74HQibG
	 Pqj/1pNvdRSvWKBkBgmhcM9OqhdVa/Pluu2xxXyoHEXeW67QBdZWX7+sjXh+kb3SV3mKCx4vlzSO
	 r7ajkLZ2mNrW3JXBYkMG6O313Pmh824131S/4uc6xkOJrG8PwSkWsYSlxVDPbPMGcE9s7aZ9Knm7
	 hxOjAQU3BZjj5mneYZVZugMfGiFpHqWIznZn5no4kT5g50wONz/O8dB+gMcwg=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v8 5/6] riscv: dts: add initial canmv-k230 and k230-evb dts
Date: Sun,  7 Apr 2024 09:29:43 +0800
X-OQ-MSGID: <20240407012944.2996666-5-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
References: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_183008_589644_C0E9D551 
X-CRM114-Status: GOOD (  22.71  )
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

Add initial dts for CanMV-K230 and K230-EVB powered by Canaan Kendryte
K230 SoC [1].

Some key consideration:

- Only place BigCore which is 1.6GHz RV64GCBV

The existence of cache coherence between the two cores remains unknown
since they have dedicated L2 caches. And the factory SDK uses it for
other OS by default. I don't know whether the two CPUs on K230 SoC
can be used in one system. So only place BigCore here.

Meanwhile, although docs from Canaan said 1.6GHz Core with Vector is
CPU1, the CSR.MHARTID of this core is 0.

- Support for "zba" "zbb" "zbc" "zbs" are tested by hand

The user manual of C908 from T-Head does not document it specifically.
It just said it supports B extension V1.0. [2]

I have tested it by using this [3] which attempts to execute "add.uw",
"andn", "clmulr", "bclr" and they doesn't traps on K230. But on JH7110,
"clmulr" and "bclr" will trap.

- Support for "zicbom" is tested by hand

Have tested with some out-of-tree drivers from [4] that need DMA and they
do not come to the dts currently.

- Support for "zicboz" is tested by hand

Have tested with my own bare mental M-Mode program [5] which tries to use
zicboz to clear a 64B aligned block and got output[6] shows it supports
zicboz.

- Cache parameters are inferred from T-Head docs [2] and Canaan docs [1]

L1i: 32KB, VIPT 4-Way set-associative, 64B Cacheline
L1d: 32KB, VIPT 4-Way set-associative, 64B Cacheline
L2: 256KB, PIPT 16-way set-associative, 64B Cacheline

The numbers of cache sets are calculated from these parameters.

- MMU only supports Sv39

The T-Head docs [2] say the C908 core can be configured to support Sv48 and
Sv39 or only Sv39. On K230, I tried to write "riscv,sv48" on mmu-type in
dts and boot the mainline kernel. However, it failed during the kernel
probe and fell back to Sv39. I also tested it on M-Mode software, writing
Sv48 to satp.mode will not trap but will leave the CSR unchanged. While
writing Sv39, it will take effect. It shows that this CPU does not support
Sv48.

- Svpbmt and T-Head MAEE both supported

T-Head C908 does support both Svpbmt and T-Head MAEE for page-based memory
attributes and is controlled by BIT(21) on CSR.MXSTATUS. The Svpbmt is used
here for mainline kernel support for K230. If the kernel wants to use
Svpbmt, the M-Mode software should unset BIT(21) of CSR.MXSTATUS before
entering the S-Mode kernel. Otherwise, the kernel will not boot, as 0 on
T-Head MAEE is NonCachable Memory. Once the kernel switches from bare metal
to Sv39, It will lose dirty cache line modifications that haven't been
written back to the memory.

[1] https://developer.canaan-creative.com/k230/dev/zh/00_hardware/K230_datasheet.html#chapter-1-introduction
[2] https://occ-intl-prod.oss-ap-southeast-1.aliyuncs.com/resource//1699268369347/XuanTie-C908-UserManual.pdf
[3] https://github.com/cyyself/rvb_test
[4] https://github.com/cyyself/linux/tree/k230-mainline
[5] https://github.com/cyyself/simple-sw-workbench/commit/32657d807d64217323a80cb04ce114671e51ed60
[6] https://gist.github.com/cyyself/aa98b07b8c77bb1d53b5a4c5e67a37cf

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/boot/dts/canaan/Makefile       |   2 +
 arch/riscv/boot/dts/canaan/k230-canmv.dts |  24 ++++
 arch/riscv/boot/dts/canaan/k230-evb.dts   |  24 ++++
 arch/riscv/boot/dts/canaan/k230.dtsi      | 142 ++++++++++++++++++++++
 4 files changed, 192 insertions(+)
 create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230-evb.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230.dtsi

diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
index 987d1f0c41f0..7d54ea5c6f3d 100644
--- a/arch/riscv/boot/dts/canaan/Makefile
+++ b/arch/riscv/boot/dts/canaan/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_CANAAN) += canaan_kd233.dtb
 dtb-$(CONFIG_ARCH_CANAAN) += k210_generic.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += k230-canmv.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += k230-evb.dtb
 dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_bit.dtb
 dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_dock.dtb
 dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_go.dtb
diff --git a/arch/riscv/boot/dts/canaan/k230-canmv.dts b/arch/riscv/boot/dts/canaan/k230-canmv.dts
new file mode 100644
index 000000000000..9565915cead6
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/k230-canmv.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ */
+
+#include "k230.dtsi"
+
+/ {
+	model = "Canaan CanMV-K230";
+	compatible = "canaan,canmv-k230", "canaan,kendryte-k230";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	ddr: memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x20000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/canaan/k230-evb.dts b/arch/riscv/boot/dts/canaan/k230-evb.dts
new file mode 100644
index 000000000000..f898b8e62368
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/k230-evb.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ */
+
+#include "k230.dtsi"
+
+/ {
+	model = "Kendryte K230 EVB";
+	compatible = "canaan,k230-usip-lp3-evb", "canaan,kendryte-k230";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	ddr: memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x20000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
new file mode 100644
index 000000000000..95c1a3d8fb11
--- /dev/null
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/dts-v1/;
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	compatible = "canaan,kendryte-k230";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <27000000>;
+
+		cpu@0 {
+			compatible = "thead,c908", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			riscv,isa = "rv64imafdcv_zba_zbb_zbc_zbs_zicbom_zicbop_zicboz_svpbmt";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zba", "zbb",
+					       "zbc", "zbs", "zicbom", "zicbop", "zicboz",
+					       "zicntr", "zicsr", "zifencei", "zihpm", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <128>;
+			d-cache-size = <32768>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv39";
+
+			cpu0_intc: interrupt-controller {
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
+			cache-size = <262144>;
+			cache-sets = <256>;
+			cache-unified;
+		};
+	};
+
+	apb_clk: apb-clk-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <50000000>;
+		clock-output-names = "apb_clk";
+		#clock-cells = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&plic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-noncoherent;
+		ranges;
+
+		plic: interrupt-controller@f00000000 {
+			compatible = "canaan,k230-plic" ,"thead,c900-plic";
+			reg = <0xf 0x00000000 0x0 0x04000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <208>;
+		};
+
+		clint: timer@f04000000 {
+			compatible = "canaan,k230-clint", "thead,c900-clint";
+			reg = <0xf 0x04000000 0x0 0x00010000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+
+		uart0: serial@91400000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x91400000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart1: serial@91401000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x91401000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart2: serial@91402000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x91402000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart3: serial@91403000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x91403000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart4: serial@91404000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x91404000 0x0 0x1000>;
+			clocks = <&apb_clk>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

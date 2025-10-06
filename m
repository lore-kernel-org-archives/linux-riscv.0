Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F381CAC5B8
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJyL2RTpJ0GGnd+Fom/U0JmIPc/c3K68KW6Vt/3jVNs=; b=GJmSEIegcW3BQj
	mylHCV+j4Awux3YRdw9751DPN1V1r1AoS0v3PCk4JZV2ihnM8rjWY0j26d88UXKfjnM4HAByZAnVK
	Xzs6KYK5hBGKfSGJTolaTtISVtg+ISgAamu9qmj6Pq8JGxEx+ta5cIjowTMSb8EBJ5bG/CKUW8pDF
	/cJ5sWZz4A1+2nLBW1nBoRDPBgBDQME6Lnr/vcGnrRTluO4DMlI4r1YZnw+jFhrGsPnk4w7xPKkfm
	4wccfJ4iH4/6/A1cxRWVSz/lIoPw/lOZTAWLcFgTmGTmf4qYqOKQp8TsqbdyoP+Z41ulD3EBp9yiD
	TXgXJPL0pSFhon3Ft4KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5sec-00000000pjV-3nLF;
	Mon, 06 Oct 2025 21:21:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5sea-00000000pgc-3PIH
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 21:21:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C3A16116E;
	Mon,  6 Oct 2025 21:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35984C16AAE;
	Mon,  6 Oct 2025 21:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759785715;
	bh=R9/7hG6aF5xZXcW9J/lRCeYTAkE1zKBimFrhmMeKqm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OLzA4JuASBUMjb260cjE3E+KIThjpuacCBDVSMizXG/RfX4VeG/ETdKi+QUeXrNgX
	 lyV/XpKoK61SIQJxgSkpWZnAdNwXfFwzBzamAtG2TxM394kxFceCVZzV/oKHHwxc/m
	 S111co9Xb3XSiOmnIsTVOVaNv8u4ak0KmsN2D15aWbc95aTZMKuC4Xd5YhvYlARJLT
	 xw1QU1UbnqUAwE+vaoawABkz72+l4da+Em0C7IkjjwlYZya2XONMwybsMdDPBqvczV
	 HK/e2UOWOgYtvY/Cumgg8iHbLAwcI8X6IdbQlSdWMsZaI7baUhQEqP7OvuwTTLWwlH
	 9CeKy9S/E9sug==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 06 Oct 2025 14:21:46 -0700
Subject: [PATCH v2 6/8] riscv: dts: Add Tenstorrent Blackhole SoC PCIe
 cards
MIME-Version: 1.0
Message-Id: <20251006-tt-bh-dts-v2-6-ed90dc4b3e22@oss.tenstorrent.com>
References: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
In-Reply-To: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@oss.tenstorrent.com>
X-Mailer: b4 0.14.2
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

From: Drew Fustini <dfustini@oss.tenstorrent.com>

Add device tree source describing the Tenstorrent Blackhole SoC and the
Blackhole P100 and P150 PCIe cards. There are no differences between
the P100 and P150 cards from the perspective of an OS kernel like Linux
running on the X280 cores.

Link: https://github.com/tenstorrent/tt-isa-documentation/blob/main/BlackholeA0/
Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 MAINTAINERS                                        |   1 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/tenstorrent/Makefile           |   2 +
 arch/riscv/boot/dts/tenstorrent/blackhole-card.dts |  14 +++
 arch/riscv/boot/dts/tenstorrent/blackhole.dtsi     | 104 +++++++++++++++++++++
 5 files changed, 122 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 125b5498c3bf8e689adc665fc6e975b05a484abf..b3a2a347f835da952c33b0faf09d560eb1285c32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21748,6 +21748,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
+F:	arch/riscv/boot/dts/tenstorrent/
 
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 3b99e91efa25be2d6ca5bc173342c24a72f87187..0624199867065dbb5eb62d660f950b4aa3a7abd7 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -8,4 +8,5 @@ subdir-y += sifive
 subdir-y += sophgo
 subdir-y += spacemit
 subdir-y += starfive
+subdir-y += tenstorrent
 subdir-y += thead
diff --git a/arch/riscv/boot/dts/tenstorrent/Makefile b/arch/riscv/boot/dts/tenstorrent/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..2c81faaba46235821470b077392ebfebd37ef55a
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_TENSTORRENT) += blackhole-card.dtb
diff --git a/arch/riscv/boot/dts/tenstorrent/blackhole-card.dts b/arch/riscv/boot/dts/tenstorrent/blackhole-card.dts
new file mode 100644
index 0000000000000000000000000000000000000000..c595f7eddcf860d18193d6b18eb4fd1c0c6c684d
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/blackhole-card.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "blackhole.dtsi"
+
+/ {
+	model = "Tenstorrent Blackhole SoC PCIe card";
+	compatible = "tenstorrent,blackhole-card", "tenstorrent,blackhole";
+
+	memory@400030000000 {
+		device_type = "memory";
+		reg = <0x4000 0x30000000 0x1 0x00000000>;
+	};
+};
diff --git a/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi b/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..dc6ac953c34b1efeec231b339251058fac5172d5
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+// Copyright 2025 Tenstorrent AI ULC
+/dts-v1/;
+
+/ {
+	compatible = "tenstorrent,blackhole";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+		timebase-frequency = <50000000>;
+
+		cpu@0 {
+			compatible = "sifive,x280", "sifive,rocket0", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			mmu-type = "riscv,sv57";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicsr",
+					       "zifencei", "zfh", "zba", "zbb", "sscofpmf";
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu@1 {
+			compatible = "sifive,x280", "sifive,rocket0", "riscv";
+			device_type = "cpu";
+			reg = <1>;
+			mmu-type = "riscv,sv57";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicsr",
+					       "zifencei", "zfh", "zba", "zbb", "sscofpmf";
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu@2 {
+			compatible = "sifive,x280", "sifive,rocket0", "riscv";
+			device_type = "cpu";
+			reg = <2>;
+			mmu-type = "riscv,sv57";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicsr",
+					       "zifencei", "zfh", "zba", "zbb", "sscofpmf";
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu@3 {
+			compatible = "sifive,x280", "sifive,rocket0", "riscv";
+			device_type = "cpu";
+			reg = <3>;
+			mmu-type = "riscv,sv57";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicsr",
+					       "zifencei", "zfh", "zba", "zbb", "sscofpmf";
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		clint0: timer@2000000 {
+			compatible = "tenstorrent,blackhole-clint", "sifive,clint0";
+			reg = <0x0 0x2000000 0x0 0x10000>;
+			interrupts-extended = <&cpu0_intc 0x3>, <&cpu0_intc 0x7>,
+					      <&cpu1_intc 0x3>, <&cpu1_intc 0x7>,
+					      <&cpu2_intc 0x3>, <&cpu2_intc 0x7>,
+					      <&cpu3_intc 0x3>, <&cpu3_intc 0x7>;
+		};
+
+		plic0: interrupt-controller@c000000 {
+			compatible = "tenstorrent,blackhole-plic", "sifive,plic-1.0.0";
+			reg = <0x0 0x0c000000 0x0 0x04000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
+					      <&cpu1_intc 11>, <&cpu1_intc 9>,
+					      <&cpu2_intc 11>, <&cpu2_intc 9>,
+					      <&cpu3_intc 11>, <&cpu3_intc 9>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			riscv,ndev = <128>;
+		};
+	};
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

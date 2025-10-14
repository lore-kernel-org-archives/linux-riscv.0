Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1B0CCD192
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 03:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fZyiFkna7FAtSdX0eLDS4+YWoIfNLeH7P3RbolubhM=; b=vXzPzOxyhU41vb
	qZH72dtmBVcavGQqvak4rpnpptedic0ZSnb/teLv4Y2yoYEYZqmYkWHjfBCD69L6n2t2mJildiL0F
	T8b2CcvJGRS/OioWIef15aUTIzbLkgjNiEWnNuvuq/ZhFg2U6oPBON2z4fEW+BMdeSf7X9ofFv9gx
	lE8ITzZpYa4pIePfpySVbO3T/GFewHXW/rMpc/3ooftwrxUNd1zcAJMKa2awlGw4RIDajt7wlsXpz
	LFTYwOfcmpjuJkVbpq8Fvvehy+5xoqe34YBxaIL78/HFW6A9m4V1HQtqs03mAGTCcP8E2Qn0qQWeE
	MsPP8b6Ln/7AfxjC2Dnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSe-0000000F1Jj-17St;
	Tue, 14 Oct 2025 03:12:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VSb-0000000F1GM-1EJ7
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 03:12:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED5424326F;
	Tue, 14 Oct 2025 03:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01B5C19421;
	Tue, 14 Oct 2025 03:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760411544;
	bh=v2BADzYfnq+K1fzHmT4PyhtQoFp+N4lgGjYFoXj/QVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E50wZMvzN6UGn8W9qOicIH0YvZaqDqUdd4BX4DHzU97/21FlZJ1kyq1xyRTudcUSX
	 gPooprxqPRwcl0PNSnm2SLCP4KmqxKe0lU1rwNFPtE1LGGPSkmA/XfgSIIiEs5V9TC
	 3hMErI01ION6gD9oEBJny35BII8ATn6uVSv2g0yjn+aZuZIchmCZCmSZ3V2ZyRYTKO
	 hMX/wrdgymKSF4T1UBzT8q1iJlugNMOOhqr2wVRitzwECLlbF1yEUVU+Y/X169jHDN
	 k/3pYBdFx/F6mA/QkSXfChqYwJw9V3Q5zZ6AfHAqVxKSA6WBzF8Ndw37Hhzbtzmq1c
	 dGRNcUyYGD6/g==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 13 Oct 2025 20:11:58 -0700
Subject: [PATCH v3 6/8] riscv: dts: Add Tenstorrent Blackhole SoC PCIe
 cards
MIME-Version: 1.0
Message-Id: <20251013-tt-bh-dts-v3-6-9f058d4bbbda@oss.tenstorrent.com>
References: <20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com>
In-Reply-To: <20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>, 
 Joel Stanley <jms@oss.tenstorrent.com>, 
 Nicholas Piggin <npiggin@oss.tenstorrent.com>, 
 Michael Neuling <mikey@neuling.org>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Drew Fustini <dfustini@oss.tenstorrent.com>, Paul Walmsley <pjw@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_201225_391078_95FA66EA 
X-CRM114-Status: GOOD (  14.63  )
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

There is a virtual UART implemented in OpenSBI firmware that allows a
console program on the PCIe host to communicate through shared memory
with Linux running on the Blackhole card. CONFIG_HVC_RISCV_SBI needs to
be enabled. The boot script on the host adds 'console=hvc0' so that the
full boot output appears in the console program on the host.

Link: https://github.com/tenstorrent/opensbi/
Link: https://github.com/tenstorrent/tt-bh-linux
Reviewed-by: Joel Stanley <jms@oss.tenstorrent.com>
Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 MAINTAINERS                                        |   1 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/tenstorrent/Makefile           |   2 +
 arch/riscv/boot/dts/tenstorrent/blackhole-card.dts |  14 +++
 arch/riscv/boot/dts/tenstorrent/blackhole.dtsi     | 108 +++++++++++++++++++++
 5 files changed, 126 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5a29636b2df010296cabead26a6f9e557747928a..b49471cc31397cd0f21ea363ea0af50baf5b9eaf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22165,6 +22165,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
+F:	arch/riscv/boot/dts/tenstorrent/
 
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 3763d199c70ac659d00948241f4263dec62c548c..cf179c6253ce223b5e909691b42fdbd16f846d57 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -9,4 +9,5 @@ subdir-y += sifive
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
index 0000000000000000000000000000000000000000..f53667ce73a947051816ed35ce3b78189b8aacb7
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/blackhole-card.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "blackhole.dtsi"
+
+/ {
+	model = "Tenstorrent Blackhole";
+	compatible = "tenstorrent,blackhole-card", "tenstorrent,blackhole";
+
+	memory@400030000000 {
+		device_type = "memory";
+		reg = <0x4000 0x30000000 0x1 0x00000000>;
+	};
+};
diff --git a/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi b/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..6408810d8d80d230e7cbaf2744bbfce1788499ee
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/blackhole.dtsi
@@ -0,0 +1,108 @@
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
+		#address-cells = <1>;
+		#size-cells = <0>;
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
+
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
+
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
+
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
+
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6B4CD6E4A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tipNKUELnZO36UoIaVapXf+BIT6Qg9BOxzOf4ehwnA=; b=joh4pfdQqFIqI8
	yoPmzAI5IGmTWn1n4Jy0uhZbGg/Zs7malO69A+vhecvm4rKZ365cpufGpIF119vP2+W/7dxO7zrDj
	gVq35Kt4Y46i1IkzujpR3g2Isik2B7EGNWjN+bOMwoaId8931PjbNvrV2tywB+plccqWi5uTKDL6x
	ut7H74hYzs56/J9iYkYDu0O78M0zciIpCHWIDaiC9vkrrVBbGTtXZG4n34+FAROluUrOw+Z+mjtXw
	MOG87Ruoh6+zPuFHKjzlL6rIUVsuKlXntIpwEp1DTehioRm3HBvS3YoY5e3QXl/cUimRzr8xKTbzO
	hgQYsuJYcNGS15w2Q3Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgGA-0000000EVID-10ah;
	Wed, 03 Jun 2026 07:43:30 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgG8-0000000EVGr-1RdI
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:43:29 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-842307473b5so2676098b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472607; x=1781077407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQ19xHdzzWeLsFwfgT0pxhD3NoA/aGXvqfgrIFTG8NE=;
        b=F32Cm//0vPOmUKUSNen3JP32eCaCPiVYA63mR1BmDP0WqHXFlfEtxODzC/XEW9Fs5+
         wd2GxtFOEJvifPUWmS6p6hXjRniuETDBP3REPfXiLJv9fmUyAiK6y8gwKzvc/fUFd1+n
         BS+It8R62dJHFZU8kEf0trzWSDFZdpRyiiUusFmek4NrMGfgBFOUGpWfFu3C/k/G59kh
         2IlRL/yz/U/2hwoQIx0RH3xkkLMuOGm5z4pmyF9nxBdGkWnfaxQbjk0zszuh2bQkhk3b
         gZmHrwDjYgSvE5XKrOuJe9vol8VK8FrCLRBZCqDWjVNGX7RLP3qa1isdu1n54rb7Jrbn
         RQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472607; x=1781077407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ19xHdzzWeLsFwfgT0pxhD3NoA/aGXvqfgrIFTG8NE=;
        b=OJDCMHZtLVhJ8LuTDZ93P85u/CQ8aIbVqliyCPQT4yxOo9+/+1O1ZJSb4QmpSOnSGL
         8PvjGMX+qrh0EQrhy+HjUl/hqbDn1MsBOy9jAen0EDOYTnLNmKVCIoSXeakizbti3NXq
         +D2RN4YrndGHTicDlE29lk96squuMLhR9VcSNuE4/Rnks2HxEHs7J1CnrBmLkGVstce1
         DWh9wvtb9qpJIFD8u4BLwXkIiBazBVS5D5Yzasf9t1Lz5ilP/rhqJt2TBDPDL4Jgl2p/
         lRaDADt5PnvbhHsh7sDVNvPhpWHdPi1JibF/wEqBPTnyHZqEIdHhlA/4u7xa0Gq773tJ
         h3hg==
X-Forwarded-Encrypted: i=1; AFNElJ8HhQPp6K5EoafbDxJBhxG0SqiIkUYl6w6VZI0sEWkKOX/XiSoxto/hazWnbpAPwEiQck3E0aMpf0xRaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhwTcJxQjfrhDlfFqFqTXMyYGzj1tXyIhMPqfY331Rl8tcMSPE
	CWTO2OSI6jF2oBh8bZfnUxr+Rhpd307heUp0hvwoYG5jfpTRdR9bB7GC
X-Gm-Gg: Acq92OERxFVyhCnBVVLT13tG8XCDR2JguStJztHjESXxzTMlR6qXfrkE14/wUt3QzKx
	iBqU1M8q/qtX1qMvXcGN+1TV1xPhPCCoWKu8M9NIeol1ot2q+AefSJbr+6lf2cQ4zyRBlffKlwx
	sXEvlJMHbnBnV0uM2aZiFTOpGhvNcapEvZ/HM58ifoyM+x77cCVYLxZ1MojCsZm2iqQQ9/yGwdv
	If+iiX/bE5kX71eb4nU+WfpKCjalq4uWLhxgOhi0WJ6E7D3vhg/FhTOQoKr1gHKmRcgs2kPi7R/
	F+Wv42weUjmG/p9dt2w8dRym3nL4/y5TN7u8jd12lJvWPRE7ym/u5Xr5WFI4vX00y1R8F7EIns1
	xDZkONYa0t81iGJ6iH6a8Vg0ChVhdSpftZavVjChp8mj57q0HSX8NyoeZEZ9nE6MavoPiV8Z+vq
	FHAcsz095CP/adM/K0wNSYj24YhYuNAI1BqhAlUvhjcu+6YT7pWs8oU27wcXU8ngOXlpaTfsIgH
	3Zyf8fGu3ccHgv3oT/anqXQJg8ueeNgKKqZ6xPm0QusUS580M/zzxJ1Z2Y7bkKH
X-Received: by 2002:a05:6a00:c84:b0:842:4f22:f387 with SMTP id d2e1a72fcca58-84284f347bamr2216992b3a.49.1780472607454;
        Wed, 03 Jun 2026 00:43:27 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:43:27 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 7/7] riscv: dts: tenstorrent: Add Atlantis platform
Date: Wed,  3 Jun 2026 17:12:19 +0930
Message-ID: <20260603074222.593243-8-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603074222.593243-1-joel@jms.id.au>
References: <20260603074222.593243-1-joel@jms.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_004328_413297_C590D04C 
X-CRM114-Status: GOOD (  13.55  )
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

Add initial support for the Tenstorrent Atlantis platform, based on the
Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.

The evb machine represents an internal bringup vehicle with just the
interrupt controllers and a UART. This will be replaced in time with a
full featured machine once details are available.

Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
 .../boot/dts/tenstorrent/atlantis-evb.dts     |  31 ++
 .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 470 ++++++++++++++++++
 3 files changed, 502 insertions(+)
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi

diff --git a/arch/riscv/boot/dts/tenstorrent/Makefile b/arch/riscv/boot/dts/tenstorrent/Makefile
index 2c81faaba462..92d8bb1a683f 100644
--- a/arch/riscv/boot/dts/tenstorrent/Makefile
+++ b/arch/riscv/boot/dts/tenstorrent/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_TENSTORRENT) += blackhole-card.dtb
+dtb-$(CONFIG_ARCH_TENSTORRENT) += atlantis-evb.dtb
diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
new file mode 100644
index 000000000000..28576b87d300
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include "atlantis-soc.dtsi"
+
+/ {
+	model = "Tenstorrent Atlantis development platform";
+	compatible = "tenstorrent,atlantis-evb", "tenstorrent,atlantis";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0x80000000>,
+		      <0x1 0x80000000 0x0 0x80000000>;
+	};
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		bootargs = "earlycon console=ttyS0";
+		stdout-path = "serial0";
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi b/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi
new file mode 100644
index 000000000000..1e312b1363f8
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi
@@ -0,0 +1,470 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h>
+
+/ {
+	model = "Tenstorrent Atlantis";
+	compatible = "tenstorrent,atlantis";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <1000000000>;
+
+		cpu0: cpu@0 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu1: cpu@1 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <1>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu2: cpu@2 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <2>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu3: cpu@3 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <3>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu4: cpu@4 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <4>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu5: cpu@5 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <5>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu6: cpu@6 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <6>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu6_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		cpu7: cpu@7 {
+			compatible = "tenstorrent,ascalon-xg", "tenstorrent,ascalon", "riscv";
+			device_type = "cpu";
+			reg = <7>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "h",
+					       "zicbom", "zicbop", "zicboz", "ziccamoa", "ziccif",
+					       "zicclsm", "ziccrse", "zicntr", "zicond", "zicsr",
+					       "zifencei", "zihintntl", "zihintpause", "zihpm",
+					       "zimop", "za64rs", "zawrs", "zfa", "zfbfmin", "zfh",
+					       "zfhmin", "zca", "zcb", "zcmop", "zba", "zbb",
+					       "zbs", "zkr", "zkt", "zvbb", "zvbc", "zvfbfmin",
+					       "zvfbfwma", "zvfh", "zvfhmin", "zvkt", "sha",
+					       "shcounterenw", "shgatpa", "shtvala", "shvsatpa",
+					       "shvstvala", "shvstvecd", "smaia", "smmpm", "smnpm",
+					       "smrnmi", "smstateen", "ssaia", "ssccptr",
+					       "sscofpmf", "sscounterenw", "ssnpm", "ssstateen",
+					       "sstc", "sstvala", "sstvecd", "ssu64xl", "svade",
+					       "svinval", "svnapot", "svpbmt";
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+			i-cache-block-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <128>;
+			d-cache-block-size = <64>;
+			d-cache-size = <0x40000>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_cache>;
+			mmu-type = "riscv,sv57";
+
+			cpu7_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <0xc00000>;
+			cache-sets = <512>;
+			cache-unified;
+		};
+	};
+
+	clocks {
+		osc_24m: clock-24m {
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			clock-output-names = "osc_24m";
+			#clock-cells = <0>;
+		};
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		interrupt-parent = <&aplic_s>;
+		ranges;
+
+		imsic_m: interrupt-controller@a0000000 {
+			compatible = "tenstorrent,atlantis-imsics", "riscv,imsics";
+			riscv,num-ids = <255>;
+			riscv,guest-index-bits = <6>;
+			reg = <0x0 0xa0000000 0x0 0x200000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>,
+					      <&cpu2_intc 11>, <&cpu3_intc 11>,
+					      <&cpu4_intc 11>, <&cpu5_intc 11>,
+					      <&cpu6_intc 11>, <&cpu7_intc 11>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <0>;
+		};
+
+		mtimer: timer@a2180000 {
+			compatible = "tenstorrent,atlantis-aclint", "riscv,aclint-mtimer";
+			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
+					      <&cpu2_intc 7>, <&cpu3_intc 7>,
+					      <&cpu4_intc 7>, <&cpu5_intc 7>,
+					      <&cpu6_intc 7>, <&cpu7_intc 7>;
+			reg = <0x0 0xa2180000 0x0 0x8000 0x00 0xa2188000 0x0 0x8000>;
+		};
+
+		imsic_s: interrupt-controller@a4000000 {
+			compatible = "tenstorrent,atlantis-imsics", "riscv,imsics";
+			riscv,num-ids = <255>;
+			riscv,guest-index-bits = <6>;
+			reg = <0x0 0xa4000000 0x0 0x200000>;
+			interrupts-extended = <&cpu0_intc 9>, <&cpu1_intc 9>,
+					      <&cpu2_intc 9>, <&cpu3_intc 9>,
+					      <&cpu4_intc 9>, <&cpu5_intc 9>,
+					      <&cpu6_intc 9>, <&cpu7_intc 9>;
+			msi-controller;
+			#msi-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <0>;
+		};
+
+		aplic_m: interrupt-controller@cc000000 {
+			compatible = "tenstorrent,atlantis-aplic", "riscv,aplic";
+			msi-parent = <&imsic_m>;
+			riscv,delegation = <&aplic_s 1 96>;
+			riscv,children = <&aplic_s>;
+			riscv,num-sources = <96>;
+			reg = <0x0 0xcc000000 0x0 0x4000000>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+		};
+
+		prcm_rcpu: clock-controller@d0000000 {
+			compatible = "tenstorrent,atlantis-prcm-rcpu";
+			reg = <0x00 0xd0000000 0x00 0x10000>;
+			clocks = <&osc_24m>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			assigned-clocks = <&prcm_rcpu CLK_RCPU_ROOT>, <&prcm_rcpu CLK_NOCC_CLK>;
+			assigned-clock-parents = <&prcm_rcpu CLK_RCPU_ROOT>, <&prcm_rcpu CLK_NOC_PLL>;
+		};
+
+		uart0: serial@d4100000 {
+			compatible = "snps,dw-apb-uart";
+			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART0_PCLK>;
+			reg = <0x0 0xd4100000 0x0 0x10000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart1: serial@d4110000 {
+			compatible = "snps,dw-apb-uart";
+			interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART1_PCLK>;
+			reg = <0x0 0xd4110000 0x0 0x10000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart2: serial@d4120000 {
+			compatible = "snps,dw-apb-uart";
+			interrupts = <40 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART2_PCLK>;
+			reg = <0x0 0xd4120000 0x0 0x10000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart3: serial@d4130000 {
+			compatible = "snps,dw-apb-uart";
+			interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART3_PCLK>;
+			reg = <0x0 0xd4130000 0x0 0x10000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart4: serial@d4140000 {
+			compatible = "snps,dw-apb-uart";
+			interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART4_PCLK>;
+			reg = <0x0 0xd4140000 0x0 0x10000>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		aplic_s: interrupt-controller@e8000000 {
+			compatible = "tenstorrent,atlantis-aplic", "riscv,aplic";
+			msi-parent = <&imsic_s>;
+			riscv,num-sources = <96>;
+			reg = <0x0 0xe8000000 0x0 0x4000000>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+		};
+	};
+};
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

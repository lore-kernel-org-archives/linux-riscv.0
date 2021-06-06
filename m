Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149E3C4743D
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 09:05:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D192361420
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 09:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D192361420
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QJ618da5LRFgNtG/+DEFVd6kWEY8Xw4F+pIpJfpLX0=; b=aGfZsD2uDqpCGJ
	Hlab45FtTjQUWC+rOano7BzC2pccMhnu5aQC/76c2E/zKjT/NqDObYyKJON427G2dH1F6jl8uuOpv
	0jlhyuS3tmrfvQVQMSLvuV/u0VTfFgr8a5bXXJgBTCTF9SGqQZ8b/kMLBoell/eT3akvBg6Gl0nKO
	6bb0GKcCkvTwXnnpyUKY038Vcemc/F3LLzc0K1GXlMftoaNo17lj7FkMUHUP5dzoFR11YclAzEOy4
	OZVG9AvFFOLSUkRnB4Sf5zQQ/+ZZ0vUTV4+zop0MPucMp3nlx1Sq4mv8FvLRiSzfiExPQ37nFSh6J
	6i6slKmOYvYKgDeASvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpoj4-0002rx-1T; Sun, 06 Jun 2021 09:05:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpoj0-0002qD-H3
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 09:05:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B57B61420;
 Sun,  6 Jun 2021 09:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622970342;
 bh=Pb26qSYgqSZkgm2+zHaeL+r+s/hn8Bf6c5rxTNsuaCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pO2juAnBpF7yiE0t7aIO90ePSpqdhI7gcpnWC1++7th2o9PoOhVgjOSCey0J7AUG5
 I/ZFlE3E5mQwv7TKidIVJPYdUKyQJIZ7H3ymMwuyOUgyBp28rWyt8yQMKCGCKaJCbZ
 jYmjRe0GwrGR822mCzNlVrNEt7Uag2jEHIaw4RuXEEjyhhPUYKcov6DWNeTHrU2CsB
 xjw2Wl06knkGRwnIqNWFULCRMm8ZVRCbyOLUYWJoI64nm/FAhURvwcJH7B55ZgRbE8
 A7YJ1ZyVxpBtIEUtFPYkuKdjEhSiyyscNmJUtKeZ3tC8jxEwwsL2qXeLtkfCIhi99X
 vycihnlCzvfYg==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, drew@beagleboard.org,
 liush@allwinnertech.com, lazyparser@gmail.com, wefu@redhat.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Atish Patra <atish.patra@wdc.com>,
 Christoph Hellwig <hch@lst.de>
Subject: [RFC PATCH v2 09/11] riscv: soc: Initial DTS for Allwinner D1 NeZha
 board
Date: Sun,  6 Jun 2021 09:04:07 +0000
Message-Id: <1622970249-50770-13-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622970249-50770-1-git-send-email-guoren@kernel.org>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_020542_619634_1374DE24 
X-CRM114-Status: GOOD (  13.45  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Add initial DTS for Allwinner D1 NeZha board having only essential
devices (uart, dummy, clock, reset, clint, plic, etc).

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-Developed-by: Liu Shaohua <liush@allwinnertech.com>
Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Drew Fustini <drew@beagleboard.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Wei Fu <wefu@redhat.com>
Cc: Wei Wu <lazyparser@gmail.com>
---
 arch/riscv/boot/dts/Makefile                       |  1 +
 arch/riscv/boot/dts/allwinner/Makefile             |  2 +
 .../boot/dts/allwinner/allwinner-d1-nezha-kit.dts  | 29 ++++++++
 arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi    | 84 ++++++++++++++++++++++
 4 files changed, 116 insertions(+)
 create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
 create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index fe996b8..3e7b264 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -2,5 +2,6 @@
 subdir-y += sifive
 subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
 subdir-y += microchip
+subdir-y += allwinner
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
new file mode 100644
index 00000000..4adbf4b
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_SUNXI) += allwinner-d1-nezha-kit.dtb
diff --git a/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts b/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
new file mode 100644
index 00000000..cd9f7c9
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "allwinner-d1.dtsi"
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "Allwinner D1 NeZha Kit";
+	compatible = "allwinner,d1-nezha-kit";
+
+	chosen {
+		bootargs = "console=ttyS0,115200";
+		stdout-path = &serial0;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0x0 0x20000000>;
+	};
+
+	soc {
+	};
+};
+
+&serial0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi b/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
new file mode 100644
index 00000000..11cd938
--- /dev/null
+++ b/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "Allwinner D1 Soc";
+	compatible = "allwinner,d1-nezha-kit";
+
+	chosen {
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <2400000>;
+		cpu@0 {
+			device_type = "cpu";
+			reg = <0>;
+			status = "okay";
+			compatible = "riscv";
+			riscv,isa = "rv64imafdcv";
+			mmu-type = "riscv,sv39";
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
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
+		reset: reset-sample {
+			compatible = "thead,reset-sample";
+			plic-delegate = <0x0 0x101ffffc>;
+		};
+
+		clint: clint@14000000 {
+			compatible = "riscv,clint0";
+			interrupts-extended = <
+				&cpu0_intc  3 &cpu0_intc  7
+				>;
+			reg = <0x0 0x14000000 0x0 0x04000000>;
+			clint,has-no-64bit-mmio;
+		};
+
+		plic: interrupt-controller@10000000 {
+			#interrupt-cells = <1>;
+			compatible = "riscv,plic0";
+			interrupt-controller;
+			interrupts-extended = <
+				&cpu0_intc  0xffffffff &cpu0_intc  9
+				>;
+			reg = <0x0 0x10000000 0x0 0x04000000>;
+			reg-names = "control";
+			riscv,max-priority = <7>;
+			riscv,ndev = <200>;
+		};
+
+		dummy_apb: apb-clock {
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			clock-output-names = "dummy_apb";
+			#clock-cells = <0>;
+		};
+
+		serial0: serial@2500000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x02500000 0x0 0x400>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			interrupt-parent = <&plic>;
+			interrupts = <18>;
+			clocks = <&dummy_apb>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

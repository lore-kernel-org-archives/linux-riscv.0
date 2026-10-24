Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0845660A2606
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2026 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e5Sy92kx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ihDXwyWp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=c82xx8aP3Vw1fHnoBxkVvcjtlC/eYK/YPl7D+CTJjV4=; b=e5Sy92kx3lgmlVUtG4HJESIgRY
	dor8F2XrrXSGEbZNYVs3xa4IKz/5PJFHFAZ1H/Y2j5WI4LBorq88AGq43aXdUH6F+bOHrD0a+i9Kk
	0fjbMtOsaPKYJOAI1weKMPKRSXABlvwGRW73pDQjGg1XKNoATr2FquLYRqFwNV/1vHoHYyZ47Fw+3
	ATo9Kz8JhNCvrekiGNUG2PXaqOZ/L6IROl+mBVNr+X2gu8QF0Leonf1Dz9WB/ItucN9RohMyLaPxr
	GCwC3X2oA+4qJX1WKxeATZVWWE7XHT3F1UH3hriKyjY/2t/tUqjs2+d2aBqU3Z7N4XIH3jngEhtc5
	2CrAqPPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKY36-000000003MY-0oW1;
	Sat, 24 Oct 2026 09:28:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKY2z-000000003F2-2HX4
	for linux-riscv@lists.infradead.org;
	Sat, 24 Oct 2026 09:28:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D1F84450A;
	Sat, 24 Oct 2026 09:28:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792834097;
	b=A6HP0kAhi8VHh+sUO0ncAoj8H8k8jOdWRd5Umyz3gdzalrFY/KtgakM38w66Oap9ezmn
	 0vVQAvtPf43DhsojktL6BHfdPgqiIBUVJ+bQuBXoAHi8IbMVgqM2RjEzl8H/S1msRxslU
	 JE+3OEgZfrEFRuQi15NtJ9Ton6yGcaZW7PNWPXaoceWHO3D1bOrHFPJI6HyYXCqhiLfQJ
	 39lk0kkr1wIelP4lc+mDmyfuSGhib6ZDCIzslGXEhSijWvJBOxXA7+bxvkQvSsfUnYRkC
	 T2RSHvOTONLTsdBQRnTkIUGXVvtDuCs8r1QZmKwqa2xdBvErM2bZg4cPQpVi0sjw0bQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792834097;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=V5lqdPqCPN272NcF/vLIYVouZ2O2E58b40Pu4yFO7TY=;
	b=TVDPS3SeYCew2leamQIMVCh8eRZmnN1y7LbyCCGTiJv0+yrkV5pmp0j+jQLf4xEmsMlU
	 H7An9X0bG+D2DTM+XMqoN3FEb643T/4BRXXTOFvIQ29MDnx4cnZLZCaEI3B4TdNesX/4C
	 P61fYQy+2jIgmwCHEKlgUqULIoUIApCqWfPZTdKF69s3eyb8EPoNi90h3SdKQ0GOxgMfx
	 vNzhsN1rUYrWkiMxEsfwVTFcAKoeghdr2JMci8aksw2exzo/69PrehxkiLSbjosJQLKUn
	 9sE9O4Svy76ANnzP0E567lCC8iGcJefUUqsYnKi28DzPNN1NTs+/3Qc0Hflo+EORoUw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6283B1F031EC;
	Sat, 24 Oct 2026 09:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792834097;
	bh=V5lqdPqCPN272NcF/vLIYVouZ2O2E58b40Pu4yFO7TY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ihDXwyWpukhI5uLDr/nY0hbUG2GJtHTQFcmra8IkSJN0BscmqL3eCmdiNBerOKKkg
	 PJ+vfUoGYYBOISfOBS3HGNtOdFORwfrDNdhNm6DgQ0sCb/HQIQVWaS9gw4XGiwyrgi
	 edSC11GdnkoPOKVuhTSQshVDJlYis2qwe2M84Dj6z2pSUBXuKnrn9ReClYBbtWAwKH
	 T5bJWnOCd2e/IaAyumypJluaGwnqZOhoVeNm7s+PR59hohGpwlyfHchhwL7TN0V5Zm
	 oGwEU3F78EdrhM7qdn5a9SfAR+T3FvTYdHTIhaC8JYEdL4Qzz8271YhdaxUdNSCXau
	 103h6YFJmT2sQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C9BBE4478B;
	Sat, 24 Oct 2026 09:28:10 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Sat, 24 Oct 2026 17:27:55 +0800
Subject: [PATCH v6 5/7] riscv: dts: ultrarisc: Add initial device tree for
 UltraRISC DP1000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261024-ultrarisc-dts-v6-5-c62994d8a114@ultrarisc.com>
References: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
In-Reply-To: <20261024-ultrarisc-dts-v6-0-c62994d8a114@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792834086; l=26229;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=5L1mYBMO2gkwEfqen87uYipHf9DOrnNHRqjD6l0uSIY=;
 b=hpJ8eNJck6VQcGj85i15WQcwOZXCo5neK+nhQImPSOChZ/Jzrue28Qg61wHpaJStxxDWkiRfk
 7UOyDKFdpYQCfTNOXuP9/4mbBkQKmUp1rFiUkVx1bEFESLBimNsaBcd
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: jixincheng@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jia Wang <wangjia@ultrarisc.com>

Add the base device tree for the UltraRISC DP1000 SoC. It describes
eight CP100 CPU cores, their cache topology, and essential peripherals
including CLINT, PLIC, the clock controller, pinctrl, GPIO, UART, SPI,
I2C, PCIe, GMAC, and the DMA controller.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>
---
 MAINTAINERS                               |   1 +
 arch/riscv/boot/dts/ultrarisc/dp1000.dtsi | 865 ++++++++++++++++++++++++++++++
 2 files changed, 866 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7eb1b2971bea..a97926dadba4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23645,6 +23645,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Supported
 T:	git https://github.com/ultrarisc/linux.git
 F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml
+F:	arch/riscv/boot/dts/ultrarisc/
 
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
new file mode 100644
index 000000000000..f8f29df1801f
--- /dev/null
+++ b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
@@ -0,0 +1,865 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/clock/ultrarisc,dp1000-clk.h>
+
+/ {
+	compatible = "ultrarisc,dp1000";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <10000000>;
+
+		cpu0: cpu@0 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x0>;
+			device_type = "cpu";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/*
+			 * L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache0>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+
+		};
+
+		cpu1: cpu@1 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x1>;
+			device_type = "cpu";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/*
+			 * L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache1>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+
+		};
+
+		cpu2: cpu@2 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x2>;
+			device_type = "cpu";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/*
+			 * L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache2>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu2_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+
+		};
+
+		cpu3: cpu@3 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x3>;
+			device_type = "cpu";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/*
+			 * L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache3>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu3_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+
+		};
+
+		cpu4: cpu@10 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x10>;
+			device_type = "cpu";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/*
+			 * L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache4>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu4_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+
+		};
+
+		cpu5: cpu@11 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x11>;
+			device_type = "cpu";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/*
+			 * L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache5>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu5_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+
+		};
+
+		cpu6: cpu@12 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x12>;
+			device_type = "cpu";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/*
+			 * L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache6>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu6_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+
+		};
+
+		cpu7: cpu@13 {
+			compatible = "ultrarisc,cp100", "riscv";
+			reg = <0x13>;
+			device_type = "cpu";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "h",
+					       "zba", "zbb", "zbc", "zbs", "zicntr",
+					       "zicsr", "zifencei", "zihpm", "ziccif",
+					       "ziccrse", "ziccamoa", "za64rs", "zicbom",
+					       "zicbop", "zicboz", "zkt", "svade",
+					       "ssccptr", "sstvecd", "sscounterenw",
+					       "shcounterenw", "shtvala", "shvstvecd",
+					       "shvsatpa", "svvptc";
+			mmu-type = "riscv,sv48";
+			clock-frequency = <2000000000>;
+			/*
+			 * L1 I-cache and D-cache:
+			 * block-size 64B
+			 * 4-way set associative, size 64KB
+			 * per-core.
+			 */
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x10000>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x10000>;
+			next-level-cache = <&l2_cache7>;
+			riscv,cbom-block-size = <64>;
+			riscv,cbop-block-size = <64>;
+			riscv,cboz-block-size = <64>;
+
+			cpu7_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+
+		};
+
+		/*
+		 * Per-core L2 caches are unified, 8-way set associative, and 512KB
+		 * with 64-byte cache lines.
+		 */
+		l2_cache0: l2-cache0 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <0x80000>;
+			cache-sets = <1024>;
+			cache-unified;
+			next-level-cache = <&cluster0_l3>;
+		};
+
+		l2_cache1: l2-cache1 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <0x80000>;
+			cache-sets = <1024>;
+			cache-unified;
+			next-level-cache = <&cluster0_l3>;
+		};
+
+		l2_cache2: l2-cache2 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <0x80000>;
+			cache-sets = <1024>;
+			cache-unified;
+			next-level-cache = <&cluster0_l3>;
+		};
+
+		l2_cache3: l2-cache3 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <0x80000>;
+			cache-sets = <1024>;
+			cache-unified;
+			next-level-cache = <&cluster0_l3>;
+		};
+
+		l2_cache4: l2-cache4 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <0x80000>;
+			cache-sets = <1024>;
+			cache-unified;
+			next-level-cache = <&cluster1_l3>;
+		};
+
+		l2_cache5: l2-cache5 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <0x80000>;
+			cache-sets = <1024>;
+			cache-unified;
+			next-level-cache = <&cluster1_l3>;
+		};
+
+		l2_cache6: l2-cache6 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <0x80000>;
+			cache-sets = <1024>;
+			cache-unified;
+			next-level-cache = <&cluster1_l3>;
+		};
+
+		l2_cache7: l2-cache7 {
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <2>;
+			cache-size = <0x80000>;
+			cache-sets = <1024>;
+			cache-unified;
+			next-level-cache = <&cluster1_l3>;
+		};
+
+		cpu-map {
+			cluster0: cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1: cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+
+				core1 {
+					cpu = <&cpu5>;
+				};
+
+				core2 {
+					cpu = <&cpu6>;
+				};
+
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cluster0_l3: l3-cache0 {
+			/*
+			 * L3 cache:
+			 * cache-unified, block-size 64B
+			 * 16-way set associative, size 4MB
+			 * per-cluster.
+			 */
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <3>;
+			cache-size = <0x400000>;
+			cache-sets = <0x1000>;
+			cache-unified;
+			next-level-cache = <&l4_cache>;
+		};
+
+		cluster1_l3: l3-cache1 {
+			/*
+			 * L3 cache:
+			 * cache-unified, block-size 64B
+			 * 16-way set associative, size 4MB
+			 * per-cluster.
+			 */
+			compatible = "cache";
+			cache-block-size = <64>;
+			cache-level = <3>;
+			cache-size = <0x400000>;
+			cache-sets = <0x1000>;
+			cache-unified;
+			next-level-cache = <&l4_cache>;
+		};
+	};
+
+	l4_cache: l4-cache {
+		/*
+		 * L4 cache:
+		 * cache-unified, block-size 64B
+		 * 16-way set associative, size 16MB
+		 * shared by the SoC.
+		 */
+		compatible = "cache";
+		cache-block-size = <64>;
+		cache-level = <4>;
+		cache-size = <0x1000000>;
+		cache-sets = <0x4000>;
+		cache-unified;
+	};
+
+	osc_24m: clock-24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		clint: timer@8000000 {
+			compatible = "ultrarisc,dp1000-clint", "sifive,clint0";
+			reg = <0x0 0x8000000 0x0 0x100000>;
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
+		plic: interrupt-controller@9000000@9000000 {
+			compatible = "ultrarisc,dp1000-plic", "ultrarisc,cp100-plic";
+			reg = <0x0 0x9000000 0x0 0x4000000>;
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>, <&cpu0_intc 10>,
+					      <&cpu1_intc 11>, <&cpu1_intc 9>, <&cpu1_intc 10>,
+					      <&cpu2_intc 11>, <&cpu2_intc 9>, <&cpu2_intc 10>,
+					      <&cpu3_intc 11>, <&cpu3_intc 9>, <&cpu3_intc 10>,
+					      <&cpu4_intc 11>, <&cpu4_intc 9>, <&cpu4_intc 10>,
+					      <&cpu5_intc 11>, <&cpu5_intc 9>, <&cpu5_intc 10>,
+					      <&cpu6_intc 11>, <&cpu6_intc 9>, <&cpu6_intc 10>,
+					      <&cpu7_intc 11>, <&cpu7_intc 9>, <&cpu7_intc 10>;
+			riscv,ndev = <160>;
+		};
+
+		clkc: clock-controller@11080000 {
+			compatible = "ultrarisc,dp1000-clk";
+			reg = <0x0 0x11080000 0x0 0x1000>;
+			clocks = <&osc_24m>;
+			#clock-cells = <1>;
+		};
+
+		pinctrl: pinctrl@11081000 {
+			compatible = "ultrarisc,dp1000-pinctrl";
+			reg = <0x0 0x11081000 0x0 0x1000>;
+		};
+
+		gpio: gpio@20200000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x0 0x20200000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-names = "bus", "db";
+			clocks = <&clkc DP1000_CLK_SUBSYS>,
+				 <&clkc DP1000_CLK_SUBSYS>;
+
+			gpio_a: gpio-port@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <16>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&plic>;
+				interrupts = <34>;
+				gpio-ranges = <&pinctrl 0 0 16>;
+			};
+
+			gpio_b: gpio-port@1 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <1>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <8>;
+				gpio-ranges = <&pinctrl 0 16 8>;
+			};
+
+			gpio_c: gpio-port@2 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <2>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <8>;
+				gpio-ranges = <&pinctrl 0 24 8>;
+			};
+
+			gpio_d: gpio-port@3 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <3>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <8>;
+				gpio-ranges = <&pinctrl 0 32 8>;
+			};
+		};
+
+		uart0: serial@20300000 {
+			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
+			reg = <0x0 0x20300000 0x0 0x10000>;
+			interrupt-parent = <&plic>;
+			interrupts = <17>;
+			clocks = <&clkc DP1000_CLK_UART0>,
+				 <&clkc DP1000_CLK_SUBSYS>;
+			clock-names = "baudclk", "apb_pclk";
+			reg-io-width = <4>;
+			reg-shift = <2>;
+		};
+
+		uart1: serial@20310000 {
+			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
+			reg = <0x0 0x20310000 0x0 0x10000>;
+			interrupt-parent = <&plic>;
+			interrupts = <18>;
+			clocks = <&clkc DP1000_CLK_UART1>,
+				 <&clkc DP1000_CLK_SUBSYS>;
+			clock-names = "baudclk", "apb_pclk";
+			reg-io-width = <4>;
+			reg-shift = <2>;
+		};
+
+		uart2: serial@20400000 {
+			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
+			reg = <0x0 0x20400000 0x0 0x10000>;
+			interrupt-parent = <&plic>;
+			interrupts = <25>;
+			clocks = <&clkc DP1000_CLK_UART2>,
+				 <&clkc DP1000_CLK_SUBSYS>;
+			clock-names = "baudclk", "apb_pclk";
+			reg-io-width = <4>;
+			reg-shift = <2>;
+		};
+
+		uart3: serial@20410000 {
+			compatible = "ultrarisc,dp1000-uart", "snps,dw-apb-uart";
+			reg = <0x0 0x20410000 0x0 0x10000>;
+			interrupt-parent = <&plic>;
+			interrupts = <26>;
+			clocks = <&clkc DP1000_CLK_UART3>,
+				 <&clkc DP1000_CLK_SUBSYS>;
+			clock-names = "baudclk", "apb_pclk";
+			reg-io-width = <4>;
+			reg-shift = <2>;
+		};
+
+		spi0: spi@20320000 {
+			compatible = "ultrarisc,dp1000-spi", "snps,dw-apb-ssi";
+			reg = <0x0 0x20320000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkc DP1000_CLK_SPI0>,
+				 <&clkc DP1000_CLK_SUBSYS>;
+			clock-names = "ssi_clk", "pclk";
+			interrupt-parent = <&plic>;
+			interrupts = <19>;
+			num-cs = <3>;
+		};
+
+		spi1: spi@20420000 {
+			compatible = "ultrarisc,dp1000-spi", "snps,dw-apb-ssi";
+			reg = <0x0 0x20420000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkc DP1000_CLK_SPI1>,
+				 <&clkc DP1000_CLK_SUBSYS>;
+			clock-names = "ssi_clk", "pclk";
+			interrupt-parent = <&plic>;
+			interrupts = <27>;
+			num-cs = <4>;
+		};
+
+		i2c0: i2c@20330000 {
+			compatible = "ultrarisc,dp1000-i2c", "snps,designware-i2c";
+			reg = <0x0 0x20330000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <400000>;
+			clocks = <&clkc DP1000_CLK_I2C0>,
+				 <&clkc DP1000_CLK_SUBSYS>;
+			clock-names = "ref", "pclk";
+			interrupt-parent = <&plic>;
+			interrupts = <20>;
+		};
+
+		i2c1: i2c@20340000 {
+			compatible = "ultrarisc,dp1000-i2c", "snps,designware-i2c";
+			reg = <0x0 0x20340000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <400000>;
+			clocks = <&clkc DP1000_CLK_I2C1>,
+				 <&clkc DP1000_CLK_SUBSYS>;
+			clock-names = "ref", "pclk";
+			interrupt-parent = <&plic>;
+			interrupts = <21>;
+		};
+
+		i2c2: i2c@20430000 {
+			compatible = "ultrarisc,dp1000-i2c", "snps,designware-i2c";
+			reg = <0x0 0x20430000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <400000>;
+			clocks = <&clkc DP1000_CLK_I2C2>,
+				 <&clkc DP1000_CLK_SUBSYS>;
+			clock-names = "ref", "pclk";
+			interrupt-parent = <&plic>;
+			interrupts = <28>;
+		};
+
+		i2c3: i2c@20440000 {
+			compatible = "ultrarisc,dp1000-i2c", "snps,designware-i2c";
+			reg = <0x0 0x20440000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clock-frequency = <400000>;
+			clocks = <&clkc DP1000_CLK_I2C3>,
+				 <&clkc DP1000_CLK_SUBSYS>;
+			clock-names = "ref", "pclk";
+			interrupt-parent = <&plic>;
+			interrupts = <29>;
+		};
+
+		pcie_x16: pcie@21000000 {
+			compatible = "ultrarisc,dp1000-pcie";
+			reg = <0x0 0x21000000 0x0 0x1000000>,
+			      <0x0 0x4fff0000 0x0 0x10000>;
+			reg-names = "dbi", "config";
+			clocks = <&clkc DP1000_CLK_PCIEX16_CORE>,
+				 <&clkc DP1000_CLK_PCIE_DBI>,
+				 <&clkc DP1000_CLK_PCIE_AUX>;
+			clock-names = "core", "dbi", "aux";
+			ranges = <0x81000000 0x0 0x00000000 0x0 0x4fbf0000 0x0 0x00400000>,
+				 <0x82000000 0x0 0x40000000 0x0 0x40000000 0x0 0x0fbf0000>,
+				 <0xc3000000 0x40 0x00000000 0x40 0x00000000 0xd 0x00000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			device_type = "pci";
+			dma-coherent;
+			bus-range = <0x0 0xff>;
+			num-lanes = <16>;
+			interrupt-parent = <&plic>;
+			interrupts = <43>, <44>, <45>, <46>, <47>;
+			interrupt-names = "msi", "inta", "intb", "intc", "intd";
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &plic 44>,
+					<0x0 0x0 0x0 0x2 &plic 45>,
+					<0x0 0x0 0x0 0x3 &plic 46>,
+					<0x0 0x0 0x0 0x4 &plic 47>;
+
+			status = "disabled";
+		};
+
+		pcie_x4a: pcie@23000000 {
+			compatible = "ultrarisc,dp1000-pcie";
+			reg = <0x0 0x23000000 0x0 0x1000000>,
+			      <0x0 0x6fff0000 0x0 0x10000>;
+			reg-names = "dbi", "config";
+			clocks = <&clkc DP1000_CLK_PCIEX4_CORE>,
+				 <&clkc DP1000_CLK_PCIE_DBI>,
+				 <&clkc DP1000_CLK_PCIE_AUX>;
+			clock-names = "core", "dbi", "aux";
+			ranges = <0x81000000 0x0 0x00000000 0x0 0x6fbf0000 0x0 0x00400000>,
+				 <0x82000000 0x0 0x60000000 0x0 0x60000000 0x0 0x0fbf0000>,
+				 <0xc3000000 0x80 0x00000000 0x80 0x00000000 0xd 0x00000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			device_type = "pci";
+			dma-coherent;
+			bus-range = <0x0 0xff>;
+			num-lanes = <4>;
+			interrupt-parent = <&plic>;
+			interrupts = <63>, <64>, <65>, <66>, <67>;
+			interrupt-names = "msi", "inta", "intb", "intc", "intd";
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &plic 64>,
+					<0x0 0x0 0x0 0x2 &plic 65>,
+					<0x0 0x0 0x0 0x3 &plic 66>,
+					<0x0 0x0 0x0 0x4 &plic 67>;
+
+			status = "disabled";
+		};
+
+		pcie_x4b: pcie@24000000 {
+			compatible = "ultrarisc,dp1000-pcie";
+			reg = <0x0 0x24000000 0x0 0x1000000>,
+			      <0x0 0x7fff0000 0x0 0x10000>;
+			reg-names = "dbi", "config";
+			clocks = <&clkc DP1000_CLK_PCIEX4_CORE>,
+				 <&clkc DP1000_CLK_PCIE_DBI>,
+				 <&clkc DP1000_CLK_PCIE_AUX>;
+			clock-names = "core", "dbi", "aux";
+			ranges = <0x81000000 0x0 0x00000000 0x0 0x7fbf0000 0x0 0x00400000>,
+				 <0x82000000 0x0 0x70000000 0x0 0x70000000 0x0 0x0fbf0000>,
+				 <0xc3000000 0xc0 0x00000000 0xc0 0x00000000 0xd 0x00000000>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			device_type = "pci";
+			dma-coherent;
+			bus-range = <0x0 0xff>;
+			num-lanes = <4>;
+			interrupt-parent = <&plic>;
+			interrupts = <73>, <74>, <75>, <76>, <77>;
+			interrupt-names = "msi", "inta", "intb", "intc", "intd";
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &plic 74>,
+					<0x0 0x0 0x0 0x2 &plic 75>,
+					<0x0 0x0 0x0 0x3 &plic 76>,
+					<0x0 0x0 0x0 0x4 &plic 77>;
+
+			status = "disabled";
+		};
+
+		ethernet: ethernet@38000000 {
+			compatible = "ultrarisc,dp1000-gmac", "snps,dwmac-5.20";
+			reg = <0x0 0x38000000 0x0 0x1000000>;
+			clocks = <&clkc DP1000_CLK_GMAC>;
+			clock-names = "stmmaceth";
+			interrupt-parent = <&plic>;
+			interrupts = <84>;
+			interrupt-names = "macirq";
+			snps,txpbl = <8>;
+			snps,rxpbl = <8>;
+
+			status = "disabled";
+		};
+
+		dmac: dma-controller@39000000 {
+			compatible = "ultrarisc,dp1000-axi-dma", "snps,axi-dma-1.01a";
+			reg = <0x0 0x39000000 0x0 0x1000000>;
+			clocks = <&clkc DP1000_CLK_SYSPLL_DIV2>,
+				 <&clkc DP1000_CLK_SUBSYS>;
+			clock-names = "core-clk", "cfgr-clk";
+			#dma-cells = <1>;
+			dma-channels = <8>;
+			interrupt-parent = <&plic>;
+			interrupts = <152>, <153>, <154>, <155>,
+				     <156>, <157>, <158>, <159>;
+			snps,dma-masters = <1>;
+			snps,data-width = <4>;
+			snps,block-size = <512 512 512 512 512 512 512 512>;
+			snps,priority = <0 1 2 3 4 5 6 7>;
+			snps,axi-max-burst-len = <256>;
+		};
+	};
+};

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

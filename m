Return-Path: <SRS0=MTom=OY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA50C43612
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89EC920645
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Dec 2018 05:22:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nGH+XqLZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OuvlVLDA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89EC920645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYFdGmdJZgxUFuvR1B/8VnEmJshwgqgghBjgvKacyFI=; b=nGH+XqLZCj/FrX
	+l9ve/AOtIbfBoqqeePLn+dUyo+al6b5/jHfD+t2yEcZ+kKz8fGRMCyBQs31RsnBZTxCEDjStAtJh
	WXVjQjEO0eFN/grasstrIl+SBTZbWUvGDl8t+tmBK7aOhrFnyEQRuWuqnNDwTmJPZo55BVprG/a32
	OdJXDHTDiLmLUCUZgIN8+RiL5ZESpkgwBZY6XHdYrWZ/Ois9QEN4wHrOMqLNFTyEH2oZqiURtzW+N
	WIewIU0XJx+W16yLxy/SVNlt5AECiRKqq+K57i17//uR+sFiQuoeFw/7NN2Gw6ehLq0MWxz+gcTZ4
	wPHYOSKttS23LyHFu70w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gY2Pa-0004lF-Rc; Sat, 15 Dec 2018 05:22:50 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY2PU-0004YW-8Q
 for linux-riscv@lists.infradead.org; Sat, 15 Dec 2018 05:22:46 +0000
Received: by mail-pl1-x643.google.com with SMTP id e11so3007235plt.11
 for <linux-riscv@lists.infradead.org>; Fri, 14 Dec 2018 21:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HglKz8vxjs8qk+QhBpX1zrDNuVp/Iy4W2AY8RJaIkaA=;
 b=OuvlVLDAhJ7VQb9hbQZn+VYOpb6hAWY59+Lh6uMuWXsNygmDv4L2BYuA4MJgomYWSP
 p24i1QJNxXzD74fUs0mzOLM4sc2Qs3jILUBOpb7Ec8WfCNsaxHrgJ393Y3bDWa6KTyMw
 PY+UGprhe4kL1S+ZzMY648DPyk5JBtK/laIX9ul+JPJ2UEB7+lz9yeoegSVxq92o7Ful
 5MKEPyHRVVyTC16aY47EXPTWtmaTN703897axMbf/bULJNSs0SAk2T4/oSZtVo/IY/P/
 dLjyBB8mzTGWZ5Q6mpnHeHY2MXZrG85/E745gk3vPmnfK6gm4Z23WQnU9Abt2g6P6+El
 MUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HglKz8vxjs8qk+QhBpX1zrDNuVp/Iy4W2AY8RJaIkaA=;
 b=N0B94j+tf63iy1qiObL2AYtVyS1bPH3Ih4zM+JPnlTUQllGRP6NhFi99FUNZmWtnko
 cwMAyuD9zT9LaYJWCzWBYTKHEGPZ3xxNlP2AwcTjTLpsNU1gwrYWcdz7UNPdeEmqsH7V
 3d7PpgyMlxbuYqxobW80rYjdpkT6W5QbCfoLUMtcevLhHbEtx239G3OiCDdNN/PkMgl7
 UdYq0ir1NmT0toAEXfSTosChbDALogSUu8R6YdeEvUDHa9bukigkww3/We3JFfB6V4Tm
 ClHySHFCK3/C5Ps0+JbdjfDkEarGKgwe0gUujjDzm528JwoVqR1xUaAKjQYZlhQ9heFT
 PUuA==
X-Gm-Message-State: AA+aEWZJ5yLzLHVfuFDLeeYO9nP4/vz8tjQUGjUWZ7998W+yyvEvC1aT
 Nn/oJaZSPcV/jdB0DoB6A4Ohbg==
X-Google-Smtp-Source: AFSGD/UTWmZNfv2PFLtZZsmKhpzdzEoWC2JDXZZzOaSXk2HpNwjCgYE8zp8PsTCKF60OUhljPHuLJA==
X-Received: by 2002:a17:902:29ab:: with SMTP id
 h40mr5364984plb.238.1544851353465; 
 Fri, 14 Dec 2018 21:22:33 -0800 (PST)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z127sm11351282pfb.80.2018.12.14.21.22.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Dec 2018 21:22:32 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 5/7] riscv: dts: add initial support for the SiFive FU540-C000
 SoC
Date: Fri, 14 Dec 2018 21:21:52 -0800
Message-Id: <20181215052154.24347-6-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20181215052154.24347-1-paul.walmsley@sifive.com>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_212244_560344_022A50A2 
X-CRM114-Status: GOOD (  13.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add initial support for the SiFive FU540-C000 SoC.  This is a 28nm SoC
based around the SiFive U54-MC core complex and a TileLink
interconnect.

This file is expected to grow considerably as more device drivers are
added to the kernel.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 182 +++++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sifive/fu540-c000.dtsi

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
new file mode 100644
index 000000000000..0ef314cf17b6
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: Apache-2.0
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2018 SiFive, Inc */
+/* See the file LICENSE for further information */
+
+/dts-v1/;
+
+#include <linux/clk/sifive-fu540-prci.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	compatible = "sifive,fu540-c000", "sifive,fu540";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
+	chosen {
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <1000000>;
+		cpu0: cpu@0 {
+			clock-frequency = <0>;
+			compatible = "sifive,e51", "sifive,rocket0";
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <16384>;
+			reg = <0>;
+			riscv,isa = "rv64imac";
+			status = "okay";
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu1: cpu@1 {
+			clock-frequency = <0>;
+			compatible = "sifive,u54-mc", "sifive,rocket0";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <1>;
+			riscv,isa = "rv64imafdc";
+			status = "okay";
+			tlb-split;
+			cpu1_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu2: cpu@2 {
+			clock-frequency = <0>;
+			compatible = "sifive,u54-mc", "sifive,rocket0";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <2>;
+			riscv,isa = "rv64imafdc";
+			status = "okay";
+			tlb-split;
+			cpu2_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu3: cpu@3 {
+			clock-frequency = <0>;
+			compatible = "sifive,u54-mc", "sifive,rocket0";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <3>;
+			riscv,isa = "rv64imafdc";
+			status = "okay";
+			tlb-split;
+			cpu3_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+		cpu4: cpu@4 {
+			clock-frequency = <0>;
+			compatible = "sifive,u54-mc", "sifive,rocket0";
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			reg = <4>;
+			riscv,isa = "rv64imafdc";
+			status = "okay";
+			tlb-split;
+			cpu4_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+	};
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "sifive,fu540-c000", "sifive,fu540", "simple-bus";
+		ranges;
+		prci: prci@10000000 {
+			compatible = "sifive,fu540-c000-prci";
+			reg = <0x0 0x10000000 0x0 0x1000>;
+			clocks = <&hfclk>, <&rtcclk>;
+			#clock-cells = <1>;
+		};
+		uart0: serial@10010000 {
+			compatible = "sifive,fu540-c000-uart", "sifive,uart0";
+			interrupt-parent = <&plic0>;
+			interrupts = <4>;
+			reg = <0x0 0x10010000 0x0 0x1000>;
+			clocks = <&prci PRCI_CLK_TLCLK>;
+		};
+		uart1: serial@10011000 {
+			compatible = "sifive,fu540-c000-uart", "sifive,uart0";
+			interrupt-parent = <&plic0>;
+			interrupts = <5>;
+			reg = <0x0 0x10011000 0x0 0x1000>;
+			clocks = <&prci PRCI_CLK_TLCLK>;
+		};
+		plic0: interrupt-controller@c000000 {
+			#interrupt-cells = <1>;
+			compatible = "riscv,plic0";
+			interrupt-controller;
+			interrupts-extended = <
+				&cpu0_intc 11
+				&cpu1_intc 11 &cpu1_intc 9
+				&cpu2_intc 11 &cpu2_intc 9
+				&cpu3_intc 11 &cpu3_intc 9
+				&cpu4_intc 11 &cpu4_intc 9>;
+			reg = <0x0 0xc000000 0x0 0x4000000>;
+		};
+	};
+};
-- 
2.20.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

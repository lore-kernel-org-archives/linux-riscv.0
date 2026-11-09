Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60278606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 05:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3dcERWRm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qsy8h98J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4iB5AH4XTbVXSHyiodDji0dFdQ73zrK0g2B2+02/fC8=; b=3dcERWRmkb0+fUYdfUq0EW0MBL
	qHT94cnuFN9L+XK06Ru2apCItTpMt6Qpju0tJi4haXpWvunv+nn56xZhVTRfF485ba/TA3LDLyQGp
	q0fZ13dYF+XKbAIl+aLu5+2zo70vvR5CLbsfXRT3g38zHkIQLz6/ncIWLV/iTL/saxEOxrjzcA+nf
	Glxmj8sSwGtYjeFtac8sdk/FEGjn7PkwOVpOAR2Sc5r//2g6R9kshtDS1VZKFZmmkkpXdQ/YGQ5u2
	zhXsWFDTIEvjXQtRjQ+TDDZHpsNduwtM+lWybKHbVRxtnua/j8wfaHUr/O7f+dtuddRdc+dYXENZb
	gelilGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHfW-0000000HNmP-3CDv;
	Mon, 09 Nov 2026 05:11:46 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHfT-0000000HNjf-2N3z
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 05:11:45 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc758830601so250332a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 21:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201102; x=1794805902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1sFiIXdYvIMEEVDfpTbotRJnqNCeZpgzlN3EY6gBPm8=;
        b=Qsy8h98JL/Htf6WxCEavwzVatOOqVcbnQWt8/iMmr0gaOp8lVj5+FQM8rOUppt2nO0
         tSY86rOBNA9RQnDobzzCPRUdVybkh57ysQd6iuNq4F6aPyF41Qh3yzqzEXqfTfbHNXyq
         k1BMV287rprwKvQf0558QE2/0uJE8ORWZatLhuX8xAXJA8/6sruemEZ4anUZkIJCVabE
         Le1bF/UNwgHbC8lqfw7dyw/qe3QdohhcPtj403/K5xR2u2W3p2iqyw/f+IrbkOcJKbb7
         7lTZuf4qC61w3OWiaTjM2871z0p3mWinau0Rg4CVcMJRmNXhDXXOgTlGZl2pN/luuPCr
         qG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201102; x=1794805902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1sFiIXdYvIMEEVDfpTbotRJnqNCeZpgzlN3EY6gBPm8=;
        b=2YMV25ILzN6WVNj2Zvzvz4KY6o0IobK6rfdW5do3TjN7Zn6G7YyYyU4T8vjpZ7Sdzd
         W2Us/QRBkS741d32+S5e4AQybRy23U8LAwWRhaLTlW3Df4tkm5T2XnJaiTGWc95WxNX+
         ADWekrMVjqeGna4OWqAqzYC82yvMAWvLKMOByfmK1Bmd8C5w4URjbwZ7qO0KWyJGINVs
         4p1UG3gbwBOdN+ItVVe08R3LcNqVmNK7gZbOveqbHIYNP9SPA1Hbj+f5iMYs4tP70m/n
         f8zxBpWQHCoQ4UHvLxD/CaiaVEg4P0ivwF6fybJ7c282Q5/x5wRFhAwX0IGCYz2WlChN
         Er0g==
X-Forwarded-Encrypted: i=1; AL+hErEmCGI8zBABXCN1tKfVdtDC7UItwtqSCOHALr7Ku/+TJ1zXKYZ4lICjozIqJU2FP8lSvkf/UJf2Kyn5DA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9OcXdFCHLAb4J0o63nZwN4q8vTlUVeS3p8rgNCPs09BwY9XMgv
	CZleZzJsNWhe+Lf/dKcJVfblYJ/Yu/x1bHoMvn6BnD077+KLB2ytzdSN
X-Gm-Gg: AYBFou3c0JO1StxDN97OW23IGyXPRKoaYRQ0+HU3eKUohDPmroMAI8CqHAXuhjr/38G
	DLp9W7euJjZousOv8U20FQnfU/g9B1kWqK8gN9ZIgCePQ69qzQ1kWWYH5P/d0b/JjHUkjCo6wCH
	QxvcjDb9tKMQYlxyBQIYEF2U5jjwqxwQkwDcpFNigBIX3H8x0wkrZAlU4DNBpBxwPcAq2gDmSdc
	a0QcaEMeQbtXI8V/z6NT0/4J2K/u0ZPJaJ4kGmXtexzLHOJslf6YFv88Ius43uv/Khhh4YEZSED
	hHUQxg9U25AUVZYfUBsbz4pdVtsh6GudGjBApNVvIJBG7FFKIZqF3/uMCX3S8fGo1gHW/oNEOd2
	b7WSWjVHa0TMPh1PkNrSCpx9xPCv1RM/jj0/qUCBtKmgqEzyQodGmwSga4AFIhf+A7lGJUwhn+a
	eOMHSM0xdBq4VEvZ1XWMJQKHkTFymAXbSrpFUNU0iQeT1g7zCFfb7dcQFByEm5P1OQ0ykyBcHhH
	/mMog+W4KEO47mJPXDvmmaxuGtnZko4OOEWsFweChMx/J4ncYKk4Ka5YPTRszDsxzyKVGCzPywM
	hQWiOo+h/hMsNWIHZuOSAPD32CIuUXKj+wIQ5BaAcQsc2TjPsrWsvZDK6675ohPkjX62vDiohdB
	PvfYTrY7B/lbevkC/y20FvcUN/hN/cy3RvhQH2JRZmXKkJtmfW+eWOR+O6Q==
X-Received: by 2002:a17:90b:2805:b0:3ad:eb4c:26fb with SMTP id 98e67ed59e1d1-3b12d3c8af6mr2603277a91.23.1794201102472;
        Sun, 08 Nov 2026 21:11:42 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:42 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 7/7] riscv: dts: tenstorrent: Add Atlantis platform
Date: Mon,  9 Nov 2026 15:40:47 +1030
Message-ID: <20261109051050.105623-8-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051050.105623-1-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_211143_662715_ED04D21C 
X-CRM114-Status: GOOD (  15.89  )
X-Spam-Score: -1.7 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add initial support for the Tenstorrent Atlantis platform, based on the
Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.

The evb machine represents an internal bringup vehicle with just the
interrupt controllers and a UART. This will be updated in time with a
full featured machine once details are available.

The chosen node sets bootargs to earlycon=sbi to aid debugging early
boot, as the platform may not have a bootloader to fill out the chosen
node.

The m-mode IMSIC setting riscv,guest-index-bits looks strange, as m-mode
devices don't have guest interrupt files. The spacing (stride) between
m-mode files is the same 256KB as s-mode on Atlantis, so we set the
property so software (eg OpenSBI) can derive the layout.

The SoC has a 8-way 64KB L1I, 4-way 256KB L1D, and a 24-way 12MB last
level cache shared across all cores.

Co-developed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3:
 - Fix prcm_rcpu parent
 - Delegate all aplic irqs
 - Drop uart1 clock override
 - Use earlycon=sbi, document rationale
 - Fix mistakes in cache info

v2:
 - Update mtimer compatible
 - Add Drew's co-developed-by
 - Correct aplic num-sources count
---
 arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
 .../boot/dts/tenstorrent/atlantis-evb.dts     |  29 ++
 .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 473 ++++++++++++++++++
 3 files changed, 503 insertions(+)
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
index 000000000000..839a63dc9507
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+// Copyright 2026 Tenstorrent
+/dts-v1/;
+
+#include "atlantis-soc.dtsi"
+
+/ {
+	model = "Tenstorrent Atlantis development platform";
+	compatible = "tenstorrent,atlantis-evb", "tenstorrent,atlantis";
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
+		bootargs = "earlycon=sbi";
+		stdout-path = "serial0:115200";
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi b/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi
new file mode 100644
index 000000000000..085b0ab90bbe
--- /dev/null
+++ b/arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi
@@ -0,0 +1,473 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+// Copyright 2026 Tenstorrent
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
+			reg = <0>;
+			device_type = "cpu";
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
+			d-cache-sets = <1024>;
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
+			reg = <1>;
+			device_type = "cpu";
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
+			d-cache-sets = <1024>;
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
+			reg = <2>;
+			device_type = "cpu";
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
+			d-cache-sets = <1024>;
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
+			reg = <3>;
+			device_type = "cpu";
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
+			d-cache-sets = <1024>;
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
+			reg = <4>;
+			device_type = "cpu";
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
+			d-cache-sets = <1024>;
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
+			reg = <5>;
+			device_type = "cpu";
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
+			d-cache-sets = <1024>;
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
+			reg = <6>;
+			device_type = "cpu";
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
+			d-cache-sets = <1024>;
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
+			reg = <7>;
+			device_type = "cpu";
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
+			d-cache-sets = <1024>;
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
+			cache-sets = <8192>;
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
+			reg = <0x0 0xa0000000 0x0 0x200000>;
+			riscv,num-ids = <255>;
+			riscv,guest-index-bits = <6>;
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
+			compatible = "tenstorrent,atlantis-aclint-mtimer", "riscv,aclint-mtimer";
+			reg = <0x0 0xa2180000 0x0 0x8000>, <0x0 0xa2188000 0x0 0x8000>;
+			reg-names = "mtime", "mtimecmp";
+			interrupts-extended = <&cpu0_intc 7>, <&cpu1_intc 7>,
+					      <&cpu2_intc 7>, <&cpu3_intc 7>,
+					      <&cpu4_intc 7>, <&cpu5_intc 7>,
+					      <&cpu6_intc 7>, <&cpu7_intc 7>;
+		};
+
+		imsic_s: interrupt-controller@a4000000 {
+			compatible = "tenstorrent,atlantis-imsics", "riscv,imsics";
+			reg = <0x0 0xa4000000 0x0 0x200000>;
+			riscv,num-ids = <255>;
+			riscv,guest-index-bits = <6>;
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
+			reg = <0x0 0xcc000000 0x0 0x4000000>;
+			msi-parent = <&imsic_m>;
+			riscv,delegation = <&aplic_s 1 128>;
+			riscv,children = <&aplic_s>;
+			riscv,num-sources = <128>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+		};
+
+		prcm_rcpu: clock-controller@d0000000 {
+			compatible = "tenstorrent,atlantis-prcm-rcpu";
+			reg = <0x0 0xd0000000 0x0 0x10000>;
+			clocks = <&osc_24m>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			assigned-clocks = <&prcm_rcpu CLK_RCPU_ROOT>, <&prcm_rcpu CLK_NOCC_CLK>;
+			assigned-clock-parents = <&prcm_rcpu CLK_RCPU_PLL>,
+						 <&prcm_rcpu CLK_NOC_PLL>;
+		};
+
+		uart0: serial@d4100000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0xd4100000 0x0 0x10000>;
+			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART0_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart1: serial@d4110000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0xd4110000 0x0 0x10000>;
+			interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART1_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart2: serial@d4120000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0xd4120000 0x0 0x10000>;
+			interrupts = <40 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART2_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart3: serial@d4130000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0xd4130000 0x0 0x10000>;
+			interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART3_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		uart4: serial@d4140000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0xd4140000 0x0 0x10000>;
+			interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&prcm_rcpu CLK_UART4_PCLK>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			status = "disabled";
+		};
+
+		aplic_s: interrupt-controller@e8000000 {
+			compatible = "tenstorrent,atlantis-aplic", "riscv,aplic";
+			reg = <0x0 0xe8000000 0x0 0x4000000>;
+			msi-parent = <&imsic_s>;
+			riscv,num-sources = <128>;
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

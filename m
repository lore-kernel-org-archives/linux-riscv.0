Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A2660A2615
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lOFnEDDY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ewiAfQZX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5+cpukZtGjWcjhSeG0c5/RK5DivVu/Wm8mqDa+IRFdM=; b=lOFnEDDY4CyaGrs7G4WrPhZtS4
	zfHsde5iKB38TCYYzRYpuSNI8MyCLYvWG0t4G5PGAVvdYIeYkm4IIsoZWR7XX8aRw9o+4QWOMZVh4
	p2EHXiSk9G5NHpS5jdvLfkYyghbfuEF0pkiqfeefCTUU4yyfWLeDHc76PwHCctyaSTy8Q4ZzhPHXK
	t9nruKM4bC+hpb2kzRt6UWO+di1TxW8fXvxi9nVqZ2jwlz4DHtRjLWr6rl3vak1r/hT9AdRVNe/Ip
	YhaEOa6t0O5lakVK515lz76YJqPq+mxO4fy29g12ZHpk8CrcKtx3tjQCzPPOy4nsTMGqG59FTEEXh
	R6jWKYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsHM-0000000D9kZ-10GR;
	Fri, 13 Nov 2026 14:29:24 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsHI-0000000D9hb-3UH8
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 14:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794580112;
	bh=8q1dLdGBdAfkIvfenu2Vg5xpuwfd5kL9Ag8F1LUDLpY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=ewiAfQZXaJxMEIX0+80fmfN/2n2PxpNihxeP0x/rJJYefMqvbNvLej6bYekwMpWvN
	 wsz8pUzzsTQWZt9bKI2Y+mlOZdCDB5zDLjB7KVeIjz4Q/0nz48w8XDmtAgbdj21dd/
	 j+agiJVg/BpduABCj5ZXZDvyihnLkOjroclah02s=
X-QQ-mid: zesmtpsz6t1794580110tec0edc50
X-QQ-Originating-IP: fm2reiAJdB/qKeHxN8b5HNcE21EWPuyjAf9GRpjPJT8=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 22:28:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12388474241626902925
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 13 Nov 2026 14:28:18 +0000
Subject: [PATCH v2 2/2] riscv: dts: spacemit: Add K3 BS01DCMA RV2768
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-k3-bs01dcma-v2-2-3f0de4a3e1ca@linux.spacemit.com>
References: <20261113-k3-bs01dcma-v2-0-3f0de4a3e1ca@linux.spacemit.com>
In-Reply-To: <20261113-k3-bs01dcma-v2-0-3f0de4a3e1ca@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8322;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=nCCoCoekgN3BBRerDuOB9sOLgeAx7z94qOfQTO91zLc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnf5ZrFEmYmpvx+INE992XMy5jwO98dUnlidEX/htaoV
 Z49Vvezo5SFQYyLQVZMkaX7Ac+2Ap8o2wKBQl+YOaxMIEMYuDgFYCKdlxl+s11m9GYsbmNmmuNz
 UMux42vt7A+2Zk+u27xlfmpTI3wwguGv+PWSx2ue3YliKP0v8meS7K/nN0Xc/n21+b7zn/3Ce6e
 qWQE=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MXHph1aUIgabg0MMLg/B6ImXXFPNyO6bl5zBts2tUBuuTTKukWq8uRP5
	JGIS64lRsQRsb15u/vGKto6m/P6LSfa00T6t5FvbYSI7KeVIctK1z1j7/ElDM/QvEZc5Da+
	zqIVSKFvlZvjOilojxnJHe2I3JL+UDjKLEKekKERnp9/Td71HP4KeN191WyHUioRRAk6n2L
	Mt/5KLnG9PliFioyLEwo9wxccGIsJqJLeE4bwq2w8bzNu/xIjN5Sn87Wo9wB21k6w5TKykB
	jCawkkjbbXnAa7f1AlP7047SoGWS42bM5ZWqWesyE/IbVfGzTu4Swie6aHZvGnXRaZAOWRV
	TmZ79mvy0Bi+B/07UDSqvMaHUZVlIcOklc6E6UkTShBdeeDuRPzTQWz7M7vie3zevdfka0Q
	MazOErnbqeiXeeUF3/FH4ChAy/+/N/o7UNYkISnRveY7/U8N3WTfslE7hnVyWXKfoCNYWGd
	XH3JpsdWSLbTNWiDETy7LDgct3y1uMe15LG7YccINr7E82FWrLrDtiW/oCOzWf7Bd6AkJer
	WxVCMFj3xOlbnV34i63L/mxqCmISbTfNLkIMENKI+HtXtzHbln0j9Z6LOZRvhUC7jT6U4mP
	PrPq6d+pW5YPapCcI4e8ZAgNdHRU+4ViNWYVhsVLFypAA5zpi4H3hGW9oOFh0LG9KJzw2d9
	8Lt6HFAIDoBqeELx0oEaum4Cyq3wUWiI8jgd04nK9MT9QXWlalUF9zy1AwINrRaUGxpbUp1
	wwuL9Tz/rFu8JnSUp8jIO1dV1MCecV/SHRag/M8eiqDymzTEsvYRsbBIQnLBxhFUILRKQ65
	OciFOZHUTZ3sB2rBIxEt/Q8sXjmq6f7kwEDuIz2dP+zUO3NQjp9jAUskPrln31IF0Afj42e
	3mN+zIUWAlZZCRJXagkECsg2c5xeCIHVh4ik+uukWDIvDTeJWIVVPlgFxcY05ZQvRNwNZu2
	B6uSZDhNA9UtZXi7LlgKQGo9vEQiA6z5Bt98s0WbsHT4LQOKt0AG/bY0w2L2ckzYlGoNRQz
	oNSQogFX97dFpEk2Tjr8Hge/JmzK8b5v6YbELIDkrhoWu3CIGxzx0PJTK5WZWAtnrbYEOHL
	z4hhekgCkv19nArpw0lYxzMwI6+0jm5y2hONQIhSP8I7wfeIHqPnn4=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_062921_878749_C9570674 
X-CRM114-Status: GOOD (  14.34  )
X-Spam-Score: -2.1 (--)
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

BS01DCMA is a compute module carrying two independent K3 nodes. Each
node has a SpacemiT K3 SoC, 16 GiB of LPDDR5 memory, a P1 PMIC, an
EEPROM and QSPI NOR flash. The SpacemiT Cluster Server RV2768 hosts
several BS01DCMA modules; its carrier only connects them to PCIe
network cards.

Add a dtsi for the module with the serial console, EEPROM, PMIC and
QSPI NOR flash, and a dts for a K3 node in the RV2768.

The NOR flash is a 1.8 V part powered from the PMIC_VCC1V8_QSPI rail,
which is ALDO2 of the P1 PMIC. Its partitions follow the layout of the
SpacemiT boot firmware. U-Boot and EDK2 both go into the partition at
0x210000; EDK2 keeps its UEFI variable store at the fixed offset
0x700000, so that partition ends below it and the store is described
as a separate read-only partition.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 .../riscv/boot/dts/spacemit/k3-bs01dcma-rv2768.dts |  19 ++
 arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi      | 264 +++++++++++++++++++++
 3 files changed, 284 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 851b701e5da4..a00c31a2c3e6 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-bs01dcma-rv2768.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-bs01dcma-rv2768.dts b/arch/riscv/boot/dts/spacemit/k3-bs01dcma-rv2768.dts
new file mode 100644
index 000000000000..5b0449314d64
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-bs01dcma-rv2768.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
+ */
+
+#include "k3-bs01dcma.dtsi"
+
+/ {
+	model = "SpacemiT K3 RV2768 Cluster Server";
+	compatible = "spacemit,k3-bs01dcma-rv2768", "spacemit,k3-bs01dcma", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi b/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi
new file mode 100644
index 000000000000..0f9375c38e40
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
+ */
+
+#include "k3.dtsi"
+#include "k3-pinctrl.dtsi"
+
+/ {
+	model = "SpacemiT K3 BS01DCMA Module";
+	compatible = "spacemit,k3-bs01dcma", "spacemit,k3";
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x4 0x00000000>;
+	};
+
+	reg_5v_sys: regulator-5v-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "P5V0_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_1_cfg>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <8>;
+		read-only;
+		size = <256>;
+		status = "okay";
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			product-name {
+			};
+
+			serial-number {
+			};
+		};
+	};
+};
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
+		vin1-supply = <&reg_5v_sys>;
+		vin2-supply = <&reg_5v_sys>;
+		vin3-supply = <&reg_5v_sys>;
+		vin4-supply = <&reg_5v_sys>;
+		vin5-supply = <&reg_5v_sys>;
+		vin6-supply = <&reg_5v_sys>;
+		aldoin-supply = <&reg_5v_sys>;
+		dldoin1-supply = <&buck4>;
+		dldoin2-supply = <&buck4>;
+
+		regulators {
+			buck1: buck1 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2: buck2 {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3: buck3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4: buck4 {
+				regulator-min-microvolt = <2100000>;
+				regulator-max-microvolt = <2100000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5: buck5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6: buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <500000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo2: aldo2 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			aldo3: aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4: aldo4 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo1: dldo1 {
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo2: dldo2 {
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo3: dldo3 {
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo4: dldo4 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo5: dldo5 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo6: dldo6 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			dldo7: dldo7 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+		};
+	};
+};
+
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&aldo2>; /* PMIC_VCC1V8_QSPI */
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x20000>;
+			};
+
+			fsbl@20000 {
+				reg = <0x20000 0x80000>;
+			};
+
+			env@a0000 {
+				reg = <0xa0000 0x10000>;
+			};
+
+			esos@b0000 {
+				reg = <0xb0000 0x100000>;
+			};
+
+			opensbi@1b0000 {
+				reg = <0x1b0000 0x60000>;
+			};
+
+			uboot@210000 {
+				reg = <0x210000 0x4f0000>;
+			};
+
+			var@700000 {
+				reg = <0x700000 0xc0000>;
+				read-only;
+			};
+		};
+	};
+};
+
+&qspi_cfg {
+	qspi-pins {
+		power-source = <1800>;
+	};
+
+	qspi-cs0-pins {
+		power-source = <1800>;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_0_cfg>;
+	status = "okay";
+};

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

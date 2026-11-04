Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDCB606A328
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 06:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kaPSuR+5;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=TSie7opF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5j1sQtL2Ayt2xTfIC6yEePCrB9Ydizdj7evOz/M+yYQ=; b=kaPSuR+5BtN/fQIYrT5EKHMtyU
	3x4uGz9mqscnQnOJu5h5UMZgE+Y1R5BYPixh7hNxWqjdSkpTe540Exr+S9SjTii4iwCirIBYblrjN
	mkWPe9qmd7O9hUW5Q4+VevHDcD7Nw6EhrHXPmJMraS9mwT4A4nBoNNZqcJrnik6vbgLkghmOMa4iF
	MexbL4b0SgMI9pDJD+QRftmcPINHxbJPltOF/ra3XB/utWcn343naJCUl/xrC0OBHbHC7wQsAXdJV
	EpIEfAk3F0MaiaGnkDtKhhVCZ3rJPFsaU21Ec2sIa6Xk+GGPOkzsNt67T/cku/OU4v5jGBN8pCcuY
	Q2fuI3kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUOi-00000004P7t-1g0D;
	Wed, 04 Nov 2026 06:23:00 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUOf-00000004P6J-2IBl
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 06:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793773330;
	bh=9PKHtdpFEFOH9mE7ZMeSyTP1BlMEKj3lvBaNGnj2fkc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=TSie7opFQ9dRDxp1TsrpWoTpsoQCCEGzwcLBpu8Zzt/bm9AW51UQJzMQzyTAx5Sae
	 xnKYWehODoMbR7twN3PS8ed5FD/jk5gEodaza2Pl500+o+hrTOG9AK67OaXQ1ETbk2
	 6LJXi7igH1zDKobWLA9a9NJ560pKNm8uM79vnlvc=
X-QQ-mid: zesmtpsz5t1793773328t132ddf6f
X-QQ-Originating-IP: 8CaA/fdFjmQn/Wma+2pUZUIypAHN9+lMxI7DmPHCLJw=
Received: from = ( [183.48.245.66])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Nov 2026 14:22:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16598904818912466911
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 04 Nov 2026 06:21:51 +0000
Subject: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
In-Reply-To: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6940;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=4JHu1HEc/BfR9PcAoEAwhMMbAz5mXB+iuDd66YkyMQU=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmvzrOcefbOe0dfw9o/SsEmjwwjRN1SI5O1fJ9z+EesP
 Kfw4YViRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwETK9zP8d3rFbRbvW3ZQOWpN
 ru57h5L02VtmhNgmqq4/6Xjvj6mLF8NPxuiCpZzLu48vKbgQvds0YztDM+ey4+W/M9rTd/MFe7j
 zAwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NxBUFebUJrFWPnv6RJhEy5ivJykJ0NX4nUR0JXcyq+3UQWY3VNKv18St
	IrCOgX6FaDJnWdIOULlvz1kkR9qggCJ//7K9oAwDdxzoBb0PMiVhw8EtwJkNqNMQuuTXAin
	AC7FsHQiolGepW6g8O51mh/0LXN7R82YNTGKWw0QXnwaoIHle1itoIJojaEs/Rz03fsiH37
	KTtaEG3V4xZ0uikGII3SWmsitLfYKONXYYD9Z8oSZTTA/JGfSkZ8jVqewdZQsBXUnBfVaR1
	vS6uSITGG9YjM9FQW9aF3BhqrcfNyv6AblLM4+jjhuQshRgsFQ7x4mZ6tk5/1PIiYSgWOOq
	kHtdIT9FbZVGH4/0L3PhRJMfl/bCUtVfmbo1F0V36jc+W60YF7f8/W9FYw2uZkQjP1neE4w
	zmmMOLpNv3kVKhWLthO8NI2w8R11Skc1j8mnidPqW/KDBxQSqLH+HjacRVQjlMYN8dh7J9s
	pkuGE/fV5xdPLod+eDuLWWG+8jdxffwtqtgzGWTWAuaRSFn2GOm1ZMISuoXhUCLRJZCKQWO
	AZZw9Ymm1POFxKgyS2jvu+ORngAfE8rl2fhEPClVqgQeEIjMEZ9c5Q5+54paW4WWHHSnyHp
	E4Ejl6Z9rjUIoc+nTbt5xU6vstyOyT27zSFHuLFA9pgLgkHwyYsxtq+otPMdlWPj2ZpEIVY
	lA91kmxrR9EA3Qn6HQBqOrMnZGAB6sLhbMP9xbOx90y056zf9tTiVgtUtGq0jUyVV5OUo4g
	MLIvcAics2iMxJffsM4myKvyEsaFhudNK8MJ36S0b4IJ4dyAqbTmEpJIHCOSnYCQY7oNcRI
	3lbpMayfHMq8wvBL5/RWh3Q9E3HivS6oCdGal4DBHVMylMorHsbs9gwmSFJQfmHmmt/tFGp
	vaSQ1cXGrwjEpeOWJ54WYlOIpDpqkK8AD2bJSt1opGHIilKemvgmYUoVRO4GfffVY6kBR3G
	LLF2w4sbhGa4xg6bVNMlhMAuiNWFTsBqAaaNc/5eQSzeozHlByyDgmGeaSdnnvwj/0GgjDs
	vzC3O5izHb+xey7cX+/58KgFJX1jg1gQRracPQqNsiLe5UOgRO5ogWv20DOdRdQuRUljGsR
	qVrMw0sZyv/nV+dEqQN8+dlEMxbfEWflBAGz/n/ATX9GO/WZ4vK4Tn7nf4u7jKB8MXmWDF2
	1JLrLymYjzTAHBbO/TtN8HwWhQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_222258_102682_580E1706 
X-CRM114-Status: GOOD (  10.80  )
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

K3 BS01DCMA is a board equipped with a SpacemiT K3 SoC, 16 GiB of LPDDR5
memory, a P1 PMIC, an EEPROM and QSPI NOR flash.

Add initial support for the serial console, EEPROM, PMIC and QSPI NOR
flash.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/Makefile        |   1 +
 arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts | 266 +++++++++++++++++++++++++++
 2 files changed, 267 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 851b701e5da4..09d17fef995d 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-bs01dcma.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-com260-ifx.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts b/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts
new file mode 100644
index 000000000000..0c3b4ccd105c
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts
@@ -0,0 +1,266 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
+ */
+
+#include "k3.dtsi"
+#include "k3-pinctrl.dtsi"
+
+/ {
+	model = "SpacemiT K3 BS01DCMA";
+	compatible = "spacemit,k3-bs01dcma", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
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
+				reg = <0x210000 0x5f0000>;
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3885D58CAB
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Mar 2026 20:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmHU8Gztsp4CDKr2xl6OxXGRgyQpaY0o6k5xCMhGr2w=; b=4RIyHIsGuc6RX/
	wup1q6ysehRQWvFk5BnXK9cGvBvmT/0svtMdUNvkGeN8axZbtKz2jN3c4I/EbUbfmAMqTHjFKms15
	KFtcxjmZteuQD3uLrSTlIze2ZNTr7O5u4P3x+5Is7Is7JmhyW8iK7dqNAr054J+vkkamhOtUHoUBa
	UVuGDIy2kx7I/x1Mv+KZJ1x33lt3VqlRvuH9NU9dP8ad7xSYPSTbFLoyZ8HwZKhtmZsPsxYPqXUfj
	xSVuwbG7MBAGdO99zHc8Vk7VzLVCpYY8KARSBadvf0qxOyMOi7vd+ZDybPTIaq0gEkWjA2kU8wFga
	8EDWDlq8Ds5P+WSKLvBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4PV3-0000000Fdyn-0OJC;
	Sun, 22 Mar 2026 20:34:17 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4PV0-0000000Fdw2-0zGN
	for linux-riscv@lists.infradead.org;
	Sun, 22 Mar 2026 20:34:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Q9zYMQ/+P5ZH+YqXhnTOnd4b/fagZS5108Ie9UShcTA=; b=dFcm5q/5A9pxnqsWTkpjpaDRmO
	oCbtuXQVCbxCSyU/oPISkI2KMBzZiqjXbXQPIHxNsYBxH1x8Qp4eyji/3P5+nugVPuYQsFr8FvlON
	YvZ5l0UYoRLIoIXGPrOirDP/2OsQ2+WsDoRTeQfPi2QdCkuR5kqYcHFw9VQ3mxAR69PsrODO1F1Mr
	FNc1Jm82EQZSc3JB7fB0zuwM9MkmkATebRYSfQIObVyV5QjFaDKufv/L3gBZS3e1l5GoUEhVK9Z3H
	GFHFS31YCj6QO9CBh5DaaSZgDmTm3gdzwTU1/3vu4ZhvE4h5PabvKxHvaUoFjLeZxARnmwWy0k1Ll
	dYEo1Wog==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w4PUy-0000000Aseo-0wcf;
	Sun, 22 Mar 2026 21:34:12 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 4/6] riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
Date: Sun, 22 Mar 2026 21:28:35 +0100
Message-ID: <20260322203356.2206927-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260322203356.2206927-1-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_133414_274283_F3E0D86B 
X-CRM114-Status: GOOD (  12.56  )
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

Add the QSPI controller node for the Milk-V Jupiter board and describe
the attached SPI NOR flash (GD25Q64E).

The flash supports a frequency up to 133MHz (80 MHz for reads), and the
SoC supports a frequency up to 104 MHz. However tests have shown that
the flash is not reliably detected above 26.5 MHz, consistent with
frequency used in the vendor kernel. Therefore, use this frequency.

The m25p,fast-read properties is taken from the vendor kernel.

Add a corresponding flash partition layout, matching the layout and the
names used in the vendor U-Boot.

Also add the bootph-pre-ram property to make the device tree usable by
early firmware/bootloaders without modification, as U-Boot is stored on
this NOR flash.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 836311c3f035c..05ab5df50be51 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -173,7 +173,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4_3v3: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -256,6 +256,48 @@ dldo7 {
 	};
 };
 
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
+		vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
+		m25p,fast-read;
+		bootph-pre-ram;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x10000>;
+			};
+			private@10000 {
+				reg = <0x10000 0x10000>;
+			};
+			fsbl@20000 {
+				reg = <0x20000 0x40000>;
+			};
+			env@60000 {
+				reg = <0x60000 0x10000>;
+			};
+			opensbi@70000 {
+				reg = <0x70000 0x30000>;
+			};
+			uboot@a00000 {
+				reg = <0xa0000 0x760000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

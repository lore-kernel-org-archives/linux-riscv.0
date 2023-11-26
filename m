Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C09C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 11:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oltE7hZGJZUVQBEqnDpPoMfbCmmBujkp8SEHtuSvRxE=; b=W9jInLXqvI01XU
	ia1C4F4jUwcRFlh/0OFr4iC+Alkf26+yyScDAaenL1zKlsJaFvNWxiqGyLsir8qReTRGmayTRa9sF
	S+EXAbar9XV4dNbnUzfnJV7D5+ChuzWY9fLhMsp7IDjtLDhnS44UNngTgq2byGT8Q27o/dXJd0je4
	BAW19NbmRiWW07i+8hm85dGjY90dEYb9fNdI0jDnlqAvA2wrlrZjtsD3SRbVtb5k3MRyBA1O5ARBb
	Gc9K++bohPfmX8nZNd+k6uxCkejqw+ZKgQ4vmbuXBq9wNJQqnOXfbx+nGODlP7NwvZ1t0uwh7XOFu
	5mHGnfEkV6kkIIZZ1pBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7DbJ-00AtaF-2X;
	Sun, 26 Nov 2023 11:47:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7DbE-00AtYK-31
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 11:47:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC25360B63;
	Sun, 26 Nov 2023 11:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686A8C433C7;
	Sun, 26 Nov 2023 11:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700999215;
	bh=h+cWxgD/VfvWOGVWC6TmQ+gufJQ44Y/1Y143cGVxv6s=;
	h=From:To:Cc:Subject:Date:From;
	b=pmX7scjAhVGpJcYan+Gkjbep64Sr7Q5NEhrjmR1CLGM65FHgkt4WsKb1bQN3rsh6y
	 tXhN8hBQUh9xfaaJjeKFMVAE/Pf/ncZNvxiryCP/wZBiO2EO5SCQNBJgfur0rav0Nu
	 zU8jTM5bskfzT183bruWJU6mFGVcCQEVSD8ZMYDzqA1pBY57sOEFqQLKHpnP6GS00L
	 xEd8VD2QdwlEKBxZvVNajOfZWdNKifu+QvImH9v7ahxzY4mSkW9yobgtQF1oSti+af
	 uPqP19MpgQ6QK3Av3CKc/Gwo9sDNs1apeQNv5zjo+qoEVAo5bV97UpwirgqdZ1jivz
	 +/UtD0DRDdqHw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v1] riscv: dts: microchip: move timebase-frequency to mpfs.dtsi
Date: Sun, 26 Nov 2023 11:45:49 +0000
Message-Id: <20231126-unlighted-favorably-4627f2361a59@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5443; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=JauXPYvqhxJx7+O0kui8jwXyUoCsQM0oZ8ueYplnmyU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnJ+q+9WA5Przkx3eEXk/nbiSt/8K2o/pq4Wr9Pco/7l n0MHbMYO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRWacZGfbuStzJ+Wvv5e0S +y7/OSN2deWv61ufCWS9zz62e2moO+sfRoYVjuXfVJaIxqzmfG5t5LZNY11yoFVk5MyQSta+g9n P9vACAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_034657_224995_E76F1CAB 
X-CRM114-Status: GOOD (  11.14  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The timebase-frequency on PolarFire SoC is not set by an oscillator on
the board, but rather by an internal divider, so move the property to
mpfs.dtsi.

This looks to be copy-pasta from the SiFive Unleashed as the comments
in both places were almost identical. In the Unleashed's case this looks
to actually be valid, as the clock is provided by a crystal on the PCB.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 7 -------
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts | 7 -------
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts | 7 -------
 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts    | 7 -------
 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts    | 7 -------
 arch/riscv/boot/dts/microchip/mpfs.dtsi           | 1 +
 6 files changed, 1 insertion(+), 35 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 90b261114763..dce96f27cc89 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -8,9 +8,6 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 
-/* Clock frequency (in Hz) of the rtcclk */
-#define RTCCLK_FREQ		1000000
-
 / {
 	model = "Microchip PolarFire-SoC Icicle Kit";
 	compatible = "microchip,mpfs-icicle-reference-rtlv2210", "microchip,mpfs-icicle-kit",
@@ -29,10 +26,6 @@ chosen {
 		stdout-path = "serial1:115200n8";
 	};
 
-	cpus {
-		timebase-frequency = <RTCCLK_FREQ>;
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
diff --git a/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
index 184cb36a175e..a8d623ee9fa4 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
@@ -10,9 +10,6 @@
 #include "mpfs.dtsi"
 #include "mpfs-m100pfs-fabric.dtsi"
 
-/* Clock frequency (in Hz) of the rtcclk */
-#define MTIMER_FREQ	1000000
-
 / {
 	model = "Aries Embedded M100PFEVPS";
 	compatible = "aries,m100pfsevp", "microchip,mpfs";
@@ -33,10 +30,6 @@ chosen {
 		stdout-path = "serial1:115200n8";
 	};
 
-	cpus {
-		timebase-frequency = <MTIMER_FREQ>;
-	};
-
 	ddrc_cache_lo: memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x40000000>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
index c87cc2d8fe29..ea0808ab1042 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
@@ -6,9 +6,6 @@
 #include "mpfs.dtsi"
 #include "mpfs-polarberry-fabric.dtsi"
 
-/* Clock frequency (in Hz) of the rtcclk */
-#define MTIMER_FREQ	1000000
-
 / {
 	model = "Sundance PolarBerry";
 	compatible = "sundance,polarberry", "microchip,mpfs";
@@ -22,10 +19,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	cpus {
-		timebase-frequency = <MTIMER_FREQ>;
-	};
-
 	ddrc_cache_lo: memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x2e000000>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
index 013cb666c72d..f9a890579438 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
@@ -6,9 +6,6 @@
 #include "mpfs.dtsi"
 #include "mpfs-sev-kit-fabric.dtsi"
 
-/* Clock frequency (in Hz) of the rtcclk */
-#define MTIMER_FREQ		1000000
-
 / {
 	#address-cells = <2>;
 	#size-cells = <2>;
@@ -28,10 +25,6 @@ chosen {
 		stdout-path = "serial1:115200n8";
 	};
 
-	cpus {
-		timebase-frequency = <MTIMER_FREQ>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
index e0797c7e1b35..d1120f5f2c01 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
@@ -11,9 +11,6 @@
 #include "mpfs.dtsi"
 #include "mpfs-tysom-m-fabric.dtsi"
 
-/* Clock frequency (in Hz) of the rtcclk */
-#define MTIMER_FREQ		1000000
-
 / {
 	model = "Aldec TySOM-M-MPFS250T-REV2";
 	compatible = "aldec,tysom-m-mpfs250t-rev2", "microchip,mpfs";
@@ -34,10 +31,6 @@ chosen {
 		stdout-path = "serial1:115200n8";
 	};
 
-	cpus {
-		timebase-frequency = <MTIMER_FREQ>;
-	};
-
 	ddrc_cache_lo: memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x30000000>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index a6faf24f1dba..266489d43912 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -13,6 +13,7 @@ / {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		timebase-frequency = <1000000>;
 
 		cpu0: cpu@0 {
 			compatible = "sifive,e51", "sifive,rocket0", "riscv";
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

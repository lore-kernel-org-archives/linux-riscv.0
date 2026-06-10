Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D85CD8CB2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 12:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2QioxEQJBIM7yDqF+0uQkjGXqx4581gHtWCJwZeAh5c=; b=maP5WilySMPBY9
	T57K8DI0hzInbbWNMJ75LXzDEe6QKmzgMtFj8qb3mFZBkXQ4c16otXxpuHdQhjBZmxo5G7Y9un0t/
	7L+MeYfW9oMeTRJQJg2kr51DxcbIdohVr42YSIrZjvdBEvSX0sbH4qpp7DM6cGSYVq8L5zYrDdfDx
	ZmGDASaCqE13N7SechjEplWptgSsif7/KJUWDUxkmoFc0HoTSvyzkcN8qRyei+DFbbjHBPmR2cGfY
	WdoZP7Bu3fXg8UAsGxQKwwGIna2Fp1UmlkyNOApz27cygbmuSx6Bho+lMUKYnJiGdMfRIraMJCcXV
	FAxUhQywguA7I+A1bMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXI8s-00000007eFl-2UUB;
	Wed, 10 Jun 2026 12:34:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXI8s-00000007eFb-0U4Z
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jun 2026 12:34:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E1286001D;
	Wed, 10 Jun 2026 12:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556F91F00898;
	Wed, 10 Jun 2026 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781094885;
	bh=ZaI6xM8qV9yj7Kk8/veyhQXGEM9b9uFkMLsDWbN/Mno=;
	h=From:Date:Subject:To:Cc;
	b=WAW7EbX3zLsR9uS+VOMh5DykdskbOLwyT8fEpY8eH1jPSkGFGlEGrrEkUq2MA8LEp
	 SUgchyz5j41en1mKBYTwskhxzorj56A9EFytSpAQtKttLCRG269Key+AMt6PHVSu4v
	 3acvLXzRaWjqJ8mu0d/G6S4TbjcOzRZ+6xvvsduRLhEiRm//djuoJGJUzuV46q5u7h
	 CS9GIoFYGOrK0KLH8Gvzs+vddsMWPU0qVgjBKY6dtxJqoOOnPaSnWcIXMI1hia0Hfm
	 H0Cru6rZX9PgF5JXX7fruidszfHXm6Ms/SIqTNJFmeuw91ArRYX2vSeqhExp0JR0XP
	 hKFZiAwL4Yf0Q==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 10 Jun 2026 12:34:32 +0000
Subject: [PATCH] riscv: dts: spacemit: k3: Enable SD card support
MIME-Version: 1.0
Message-Id: <20260610-07-k3-enable-sd-v1-1-196ae29bd091@kernel.org>
X-B4-Tracking: v=1; b=H4sIANdZKWoC/yXMSwqDQBBF0a1IjVNQGvC3lZCB2q+1TGhDl0pA3
 Hs6yfAM7j3IEBVGbXZQxK6mS0jILxkNUxdGsLpkKqQopZSGpeLHlRG6/gk2x8id89II6spTql4
 RXt+/4+3+t239jGH9bug8P50aqNBzAAAA
X-Change-ID: 20260609-07-k3-enable-sd-e1ddf090e87f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3734; i=dlan@kernel.org;
 h=from:subject:message-id; bh=APunAFCOhvnEPzJn8enVpgW8mKtpnQazcb7rHmyqvDI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqKVneuUjSmx5vCKm2/SFZfUIpAQ2MpJfBx6JSI
 VJxnUXRqWSJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCailZ3hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3HuQ/+P2iFsk7XJHMo45AkR6GasC+7AEF/qC+dAN1wf1ASvGjoe24mvYQ9z
 /hiJYhC3bqJ+Cgl1O9whbN4O8kIrfKaAgYbXj97QAo7IvF+97ooVC31IMdFJtit63lsLFXTSTRV
 Ezp9ddk/vbQ3bFDl8RhbT2mG4mst7+1UHeTN1evs9dRLIKYHzALeXegGr9ORwxYXG9NLIdKWWKj
 Eg7kIJuBkmTYnKivzaR9FygAPim/v9jSz9MouqWf/MAw8/1Iqcf4brp1Q3DEC00xLCUbVWfxAGq
 iOB+xH29bkuzqZgQ+kys1QGp3KIDRNnn3e0yomN5z5/64vNotuaYmy13qOfK0y86KXQemK1opAl
 wX0BovgoRef40Fc6LoZ06F71ErPPsTh7pBunoM4VrgQ9upgF8svHFNLHugIBS2l8a/Tho1pmRoK
 aOCit+zYjKwHnNjUCQ1j+EtXQ4TuQDxtvEsMHLgmK060OrvquHbUvLxzfdupF28rfBz8ih5XEvp
 4Db+j7BoHZ+2gf4v5/Kh1Dd3QH0qPghtLkFlCgmQm4UH8XgcrFLFvrVWh8rJRwObZ6X+mlLJLXh
 m28ryakiYGqHUfcqmNjfQvofHaqSpvyIb7CQ8gK4yEIfXld7ZbqFfHV/FuIxC3wR8FYqIJWbbO2
 3m+t66UJaB531DO//Uh522eqUGV7BM=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

Add the device tree node of SDHCI-0 controller which found on CoM260-IFX
board, it's currenty used for Micro SD card slot, and one GPIO pin is
configured as card insertion/removal detection pin, the slot use 4-bit
data bus, and up support to SDR104 speed mode.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 18 +++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 44 ++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi           | 13 ++++++++
 3 files changed, 75 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 238bb03d0e9e..e7f76cd24b90 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -19,3 +19,21 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default","uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&aldo4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..6b808f890a28 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -689,4 +689,48 @@ uart0-0-pins {
 			drive-strength = <25>;
 		};
 	};
+
+	mmc1_cfg: mmc1-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K3_PADCONF(132, 0)>,	/* mmc1 dat3 */
+				 <K3_PADCONF(133, 0)>,	/* mmc1 dat2 */
+				 <K3_PADCONF(134, 0)>,	/* mmc1 dat1 */
+				 <K3_PADCONF(135, 0)>,	/* mmc1 dat0 */
+				 <K3_PADCONF(136, 0)>;	/* mmc1 cmd */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+			power-source = <3300>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K3_PADCONF(137, 0)>;	/* mmc1 clk */
+
+			bias-pull-down;
+			drive-strength = <25>;
+			power-source = <3300>;
+		};
+	};
+
+	mmc1_uhs_cfg: mmc1-uhs-cfg {
+		mmc1-uhs-data-cmd-pins {
+			pinmux = <K3_PADCONF(132, 0)>,	/* mmc1 dat3 */
+				 <K3_PADCONF(133, 0)>,	/* mmc1 dat2 */
+				 <K3_PADCONF(134, 0)>,	/* mmc1 dat1 */
+				 <K3_PADCONF(135, 0)>,	/* mmc1 dat0 */
+				 <K3_PADCONF(136, 0)>;	/* mmc1 cmd */
+
+			bias-pull-up = <0>;
+			drive-strength = <21>;
+			power-source = <1800>;
+		};
+
+		mmc1-uhs-clk-pins {
+			pinmux = <K3_PADCONF(137, 0)>;	/* mmc1 clk */
+
+			bias-pull-down;
+			drive-strength = <21>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..dabb0d5e6bad 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1099,6 +1099,19 @@ pll: clock-controller@d4090000 {
 			#clock-cells = <1>;
 		};
 
+		sdhci0: mmc@d4280000 {
+			compatible = "spacemit,k3-sdhci";
+			reg = <0x0 0xd4280000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_SDH_AXI>,
+				 <&syscon_apmu CLK_APMU_SDH0>;
+			clock-names = "core", "io";
+			resets = <&syscon_apmu RESET_APMU_SDH_AXI>,
+				 <&syscon_apmu RESET_APMU_SDH0>;
+			reset-names = "axi", "sdh";
+			interrupts = <99 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k3-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;

---
base-commit: 38d5f73d1f5af60d87047b981736b89521e49213
change-id: 20260609-07-k3-enable-sd-e1ddf090e87f

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6EC10ED65C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mrWWTqhN7uqbGJCgMcBt29jAhi9JW3IgdAx68PkRNwc=; b=4sHnddN42M1rpK
	4tX4EiwzhgTyhxtINRzs13r63FbCljlZbopAtF4SlQqJt7TlDHzy7x5Kmd1O++yMFmMRL44VrL172
	xMHNDU3O/zak7KwjNPR7j6T5NTVNtUmHDPgGmLZGv74/MEsbCeU5QQ+h0p8C345w6EkAXUxxhkitQ
	QbRBSof5s/dYD6Lb89rFLiULbCKQW5+1AxUxQKjl7667bWCOB3mxazmNr6iWDGv9EmyW9jA7bIV6L
	R8/NSPQhjlVO2LlCzisuWs34ToWPvJP2X0FlofZQRdomK919NyyyJ1HnoL+Mrux0W1KEX1uHx+pmJ
	KeJeZbY9Jzphap5lC6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Ye-00000007Hmv-2VMf;
	Fri, 27 Mar 2026 11:40:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Yb-00000007HmS-3Kgg
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 11:40:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EE2A43CE5;
	Fri, 27 Mar 2026 11:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B869C19423;
	Fri, 27 Mar 2026 11:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611653;
	bh=oCaLqBZDaC93Q1Vr3h7PyfXZkIMecNbwtU337s35gvs=;
	h=From:Date:Subject:To:Cc:From;
	b=D7T6XwZ34zs9yQdyTVx0dkD2D8LWcYmheLcu1eaFFcd8P2ABrraru9d+cdKbdsbvm
	 pLJb3qbhlp5bB7gCVONxyDSV9SCeCx/MPpTTwemBTT4U/B8odquVD5PjjrcLY2UnSG
	 +SW+PZZ8jZDzwGIp0Wuni6I7s6VEIBmIGx5c5uTQEpnFAZYuQxaBp1+Xb5PrNr0SPY
	 AnwPdV7XUEBqFchognL/QUpPF5AyRfGGrwxopAGtJnLSNXlX2JkUQCozpMCUdHCQ/X
	 XnKt0/vfmODQlmArigfT08Vx46MLy+2P1HPyo84mg18ivEtb7meyU6ZCs68gNVU2jJ
	 Lyp1PuGOj5gxA==
From: Yixun Lan <dlan@kernel.org>
Date: Fri, 27 Mar 2026 11:40:40 +0000
Subject: [PATCH v2] dts: riscv: spacemit: k3: Add i2c nodes
MIME-Version: 1.0
Message-Id: <20260327-02-k3-i2c-v2-1-2119c0918868@kernel.org>
X-B4-Tracking: v=1; b=H4sIALdsxmkC/02NQQ6CMBBFr0JmbQ1M0wquvIdh0ZQBJhjQKRIN6
 d2taKLL9/Lz/gqBhCnAMVtBaOHA05gAdxn43o0dKW4SA+Zoc10UKkc1aMXolXWNQWOtq5yGtL8
 KtfzYWuf6w0K3e0rOP9lzmCd5bn9L8bbfNJq/9JJ+1KFssfKlbirnTwPJSJf9JB3UMcYXe8s6v
 7gAAAA=
X-Change-ID: 20260311-02-k3-i2c-6ad52566a9a3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5216; i=dlan@kernel.org;
 h=from:subject:message-id; bh=oCaLqBZDaC93Q1Vr3h7PyfXZkIMecNbwtU337s35gvs=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpxmy+UQIbB5rlbm6ksKYnrYxigUqoUiFclyNcr
 09u2qtkUwWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCacZsvhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0/thAAipoIdeviWuzI0rLj3aeIfJU13YQxnpu4NkAHDCwdJ2fPLLQAxWove
 xB9agc9Y4XFakaB+mSR/FWzdkf4rZScD675LOkbn7zZmLmWyNEVhJJo12O4yZvWwH9pGBlpVum3
 H/jKHemwUnG5kd0ujb9b09sxr3+Nn1u9KrznmaMe9kvepHVAWGX++/MlcTrwpwTXLvbn0diD9fu
 Q4m1Gkk5o51PrgVgc7MYo8i6ZE5rYB0Ene6+8YS9LO9Bd5uuXEypHZz+UB42B/QJ/q4DYM9sXi2
 46MnnPzpzyYHAlYvpWyAoXOzI/WTVRLzwpIbTt5zyrRnvBJlhvrXBG76kcp6L/fqL8V2NRt/h37
 M99S8r9lIrE47Y61ReI8EAwLgzRlUg3We522UQBWIrqWkiRBjBKbwfwCMoQ9fLW+Anl37VrFSEJ
 iK7TMslgU3Vtcup4rgNgYLIAg+KbI6ujK0wVqXdKo+j6rZ5AG5sRUIlWQQcrQUDrOTJC/bcJhoC
 x3HU4uQquVpHLrALeWoEn1QXADexzrfdmGh7/r8jRzjnQ/XzlqUnJtri3DVreqIcKTAfPvRZOrI
 CKSfQ6zhfuvon5wL3NigcsKK5+3jWdHJE+Q9+7xhlS84JRK51RVgVzqVNtHhYlweipJAukYZEl5
 8FlRf+1c+SXv1tvnxOOIoKIS93wcTg=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_044053_886107_7F2C4A4F 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

Populate all I2C devicetree nodes for SpacemiT K3 SoC. The controller of
i2c3 is reserved for secure domain, and not available from Linux. The
controller of i2c7 simply doesn't exist from hardware perspective, as
vendor directly name the i2c controller used for PMIC as i2c8.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
This series try to introduce a compatible string for the I2C
controller found in K3 SoC, and add all devicetree nodes .
---
Changes in v2:
- drop compatible binding patch which merged into i2c subsystem
- add comments about why no i2c3 and i2c7
- Link to v1: https://lore.kernel.org/r/20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index a3a8ceddabec..38e6e212fbf2 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -438,6 +438,76 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		i2c0: i2c@d4010800 {
+			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			reg = <0x0 0xd4010800 0x0 0x38>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon_apbc CLK_APBC_TWSI0>,
+				 <&syscon_apbc CLK_APBC_TWSI0_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_APBC_TWSI0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@d4011000 {
+			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			reg = <0x0 0xd4011000 0x0 0x38>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon_apbc CLK_APBC_TWSI1>,
+				 <&syscon_apbc CLK_APBC_TWSI1_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_APBC_TWSI1>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@d4012000 {
+			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			reg = <0x0 0xd4012000 0x0 0x38>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon_apbc CLK_APBC_TWSI2>,
+				 <&syscon_apbc CLK_APBC_TWSI2_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_APBC_TWSI2>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@d4012800 {
+			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			reg = <0x0 0xd4012800 0x0 0x38>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <40 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon_apbc CLK_APBC_TWSI4>,
+				 <&syscon_apbc CLK_APBC_TWSI4_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_APBC_TWSI4>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@d4013800 {
+			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			reg = <0x0 0xd4013800 0x0 0x38>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon_apbc CLK_APBC_TWSI5>,
+				 <&syscon_apbc CLK_APBC_TWSI5_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_APBC_TWSI5>;
+			status = "disabled";
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -564,6 +634,20 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		i2c6: i2c@d4018800 {
+			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			reg = <0x0 0xd4018800 0x0 0x38>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <70 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon_apbc CLK_APBC_TWSI6>,
+				 <&syscon_apbc CLK_APBC_TWSI6_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_APBC_TWSI6>;
+			status = "disabled";
+		};
+
 		gpio: gpio@d4019000 {
 			compatible = "spacemit,k3-gpio";
 			reg = <0x0 0xd4019000 0x0 0x100>;
@@ -582,6 +666,20 @@ gpio: gpio@d4019000 {
 				      <&pinctrl 3 0 96 32>;
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon_apbc CLK_APBC_TWSI8>,
+				 <&syscon_apbc CLK_APBC_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			resets = <&syscon_apbc RESET_APBC_TWSI8>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k3-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x1000>;
@@ -677,6 +775,8 @@ clint: timer@e081c000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		/* sec_i2c3: 0xf0614000, not available from Linux */
+
 		mimsic: interrupt-controller@f1000000 {
 			compatible = "spacemit,k3-imsics", "riscv,imsics";
 			reg = <0x0 0xf1000000 0x0 0x10000>;

---
base-commit: d72db7cc40947f208e77fbc6049f2da6ea6822f4
change-id: 20260311-02-k3-i2c-6ad52566a9a3

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

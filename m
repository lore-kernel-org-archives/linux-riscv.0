Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2289DC5DF88
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 16:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnvMjwIGpj7xhK94+cIzDnm+J5gV9Y358E9gxgO2euU=; b=xQgKBgWL0pPkBW
	lpfW1ViPRPeYD1dU4FvuH7HvsIheHVz4XgBrCg6U5jC3don7toiJeJ/tzLLa6UfHMGRSXz4peH8dc
	Src4dd9VJBPP9qECFsK/wDsRbt5EdakEbdFxCQ3pngfdRyH5uioseBOJqO8/1In5XfvYUhECBtKgy
	HsiE38aLhaDFhCPbB8eoTT1BzPGs8CXYLsCEslpmBvwMKRZ29p9Tv1zno8H58NZp0/yAzv9Z5DP1L
	99cF13MEKQnBS6Rlb+zXYOVevQ3WGjdcz9rtgO5B3V5lJLlZq1gq586mdgwp9LN/qyRWQIabRAF4q
	QAmdzHl52tugLrMj04OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwj2q-0000000AAJE-0GgC;
	Wed, 19 Aug 2026 16:21:40 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwj2m-0000000AAGT-3cj0
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 16:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=4344Z1O6P410+9Rw0PrnC8sQMpTkULdUUbmywnkl0ts=; b=dG00cBmDO0ZIYbfOEb0bj+5FF3
	TViICLQd6/n3IpTVK5zSzVj+DBEfswP+9rR5B9H2kGRXHy0wUG3Dk+nXg9iHqWdIlT1YAR+z5Wbta
	rb9oVRbeTH6lv71qXpsuRpSQni5dj8z+U3OxtFaiIFTQW6GptRdTjxU4RvU19BiAgVax6zDsaYzLw
	90BHruxK+EDRQLyXhbw7uaSO2yuBMJvQ0wH9guelMsJsCwpajt9BfjwOGyz4XrE14p0Myi4+4bZhp
	NF1CzHeTsnykpHGF7YV6egrg+ftep/4K8HNp4HtK/Xcii90PzryUewUXRzHcvAoiwWVnVqoXE36rp
	ANh3Uorw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wwj2c-0000000D4kh-0xUB;
	Wed, 19 Aug 2026 18:21:26 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v3 1/5] riscv: dts: spacemit: k3: move USB3 phy to board level
Date: Wed, 19 Aug 2026 18:15:42 +0200
Message-ID: <20260819162115.2252812-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819162115.2252812-1-aurelien@aurel32.net>
References: <20260819162115.2252812-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_092136_902997_9B295EA2 
X-CRM114-Status: GOOD (  12.78  )
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

On the SpacemiT K3 SoC, the combo phy provides 8 lines that can
either be used for PCIe or USB3, depending on its configuration
(spacemit,apmu). This configuration is defined at the board level, and
assigning a phy line to a USB3 controller while it is configured as PCIe
results in an "Invalid PHY mode" error.

Move the USB3 phy at the board level, the as it is done for the
submitted PCIe controller [1]. Keep the USB2 phy at the SoC level as
there is one phy per USB controller.

[1] https://lore.kernel.org/20260727094726.890179-3-inochiama@gmail.com/

Fixes: 46380e4b1534c1626cecd7f4d0abb5e0cce09af6 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
Cc: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 +++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 5 ++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b084a35aa00e..171bd2f40aa6 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -328,5 +328,8 @@ &usb3d_u2phy {
 };
 
 &usb3d {
+	phys = <&usb3d_u2phy>,
+	       <&combophy 4 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..3e24054d2084 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -452,9 +452,8 @@ usb3d: usb@81a00000 {
 				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
 				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
 			reset-names = "ahb", "vcc", "phy";
-			phys = <&usb3d_u2phy>,
-			       <&combophy 4 PHY_TYPE_USB3>;
-			phy-names = "usb2-phy", "usb3-phy";
+			phys = <&usb3d_u2phy>;
+			phy-names = "usb2-phy";
 			phy_type = "utmi";
 			snps,dis_enblslpm_quirk;
 			snps,dis_u2_susphy_quirk;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

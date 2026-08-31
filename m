Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DF9C61DD3
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 04:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3wNYKJU32tj5aD+vCdQtuMeZtTcCLL0gJT+6cfPgHo=; b=SGfuKSJitiBOhP
	8sxb3SYfYzqHlOKGYG36DvuBP/OG+CHqKkXgDsmlxO2ok/tI02g1sT+3m5MvFE1HKAm3sqjy+RMob
	f65vdLMNeb4eYyVA9H0J2L+/ECOOKefC2Hn9YBXlE0NtBpeRo9iYkJn29zhUf+S8nb9tkdRe1XVH9
	IdAS6QfWIdrNKWqqo1NK+UcyG8XjjYNHWS/X7tG5tXWdqYYg89WywhXvKjUxLzZCfMJfZFRT/Qgaw
	7knZwu0SDPBQQBomJ7l+2zbQjPS/3WleimZ+3olIparWnFGOdJrjCv3SqIGxqRvFpTxJySCmPeB32
	dn/kSM4p26e7vTEhm9rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tuD-00000008UiL-1KKm;
	Mon, 31 Aug 2026 04:46:01 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tu7-00000008Ufn-1ml7
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 04:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=FH55rKIqHtOn1EkYVy++NU/qfFm2EXAkDRDl+Cfo4uo=; b=VjOGjKEjCrQzQLGwVHw7bBVh1z
	d0pf0TtnbZl2k4+IHlvYSgH/ccgwqQ4rDHGjAwfrAXQmC9sGokW0pGen/rGd2M1FaYal075Glnx8F
	cbu7mPo5HnEi0+e5rCMKlJg8leAbF19ErwwHH8SvbS28EUX12qCxRyOU7FIDUaXGEsOiX21XJrkL8
	wcZOrdwzaPrwndvPJwRKIOUyGbPtjcOeiM2aA2aAD8eJmXUQMYbqC4K/TR6mgpUqfg9aWviYc08az
	0Is+Uby3fAV1aTLjkcyTEmOX4dof6cLpP6FkdEac//XL3fe4EM1Vrd6lHK46jmooH1MMzPpn/Pg6t
	ryjSMumw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0tu2-0000000Ape0-2Pci;
	Mon, 31 Aug 2026 06:45:50 +0200
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
Date: Mon, 31 Aug 2026 06:44:21 +0200
Message-ID: <20260831044540.3304350-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831044540.3304350-1-aurelien@aurel32.net>
References: <20260831044540.3304350-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_214555_480298_79BA581E 
X-CRM114-Status: GOOD (  12.70  )
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

Move the USB phy definitions at the board level, as it is done for the
submitted PCIe controller [1].

[1] https://lore.kernel.org/20260727094726.890179-3-inochiama@gmail.com/

Fixes: 46380e4b1534 ("riscv: dts: spacemit: k3: add USB controller and USB phy support")
Cc: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 ++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b084a35aa00e3..0a6f669d509a9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -328,5 +328,7 @@ &usb3d_u2phy {
 };
 
 &usb3d {
+	phys = <&usb3d_u2phy>, <&combophy 4 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c0..6f8d55eae6f6b 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -452,9 +452,6 @@ usb3d: usb@81a00000 {
 				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
 				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
 			reset-names = "ahb", "vcc", "phy";
-			phys = <&usb3d_u2phy>,
-			       <&combophy 4 PHY_TYPE_USB3>;
-			phy-names = "usb2-phy", "usb3-phy";
 			phy_type = "utmi";
 			snps,dis_enblslpm_quirk;
 			snps,dis_u2_susphy_quirk;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

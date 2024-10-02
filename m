Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1EECF31B4
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIlkMAX7rCjqFzPI9lcdNKUbR5WtZ9fDvyAXN4dNuQQ=; b=Cvt4xELFS1kBM/
	VTVq6XhGfBr12lpHwqqW5OlIcLJhODD95xSv563VI478EAB2AtSG8XmfbOs3hNplbBLyxNiu12jRo
	vB4JKifipo+90M+m157Y0Z8uxO0UuzCoJQkk5BgcfDzMDhc0/+aoJMvi1ihW9/kdxxguO47gYdA97
	WgoNX1G9yE08m5puw9RxZz5PiwAB7SjQIMGiBTmuBd99jwPDRfmlevY9HCpjh685ncT6cLkQdJYRC
	PxnBlZ6TAg1geHRfF9b6fN+hN4w7NHcZ3li8ACf81CiAKGfBrM1yGp01cGhx4V0JHxhTrbXIKRVOq
	DRxNG3A388mZnBIvZoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svx93-00000005b30-1lYN;
	Wed, 02 Oct 2024 11:03:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svwuj-00000005Y2U-1kBx;
	Wed, 02 Oct 2024 10:49:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C220B5C037D;
	Wed,  2 Oct 2024 10:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFBCC4CEC5;
	Wed,  2 Oct 2024 10:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727866140;
	bh=7OviCXFHffO2bkj/xL5xz0DArD3vTiDNKyE94fzpFII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U15x/gDfugw+t7bdXCeSi8WG8lT0ArCkTgk7oKatp1fDoXs2wjF9M8h3+2yYI1FrF
	 2Ya2d8KeEH6N8rRmiz/JiEGQd1RzWBHSrB20F4kI9SSDuXHi2r2eb+MN6a5FIFm7GW
	 spyLz01ZgmXAixriN4CaQUB4VEUdhJ82D/7tmiVf612cSOEnur9Cj4vEp9Hb8N3FpY
	 pm+hsoXoy3lNsS4fkbEd4ThPqWSoCzjw92jyCl5Vby2W1PiVkVhDuRHJGc7eHdLfwR
	 qmwSxqVsLlWr5jl8j2rq+0sIpY/yiwUIIDN1TSPwlzuOXiHQjMipdYbTyPsLkh7RW8
	 wSD+jn6eDeeIA==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 10/11] riscv: dts: microchip: fix mailbox description
Date: Wed,  2 Oct 2024 11:48:08 +0100
Message-ID: <20241002-finch-sugar-9958077e8c2b@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002-private-unequal-33cfa6101338@spud>
References: <20241002-private-unequal-33cfa6101338@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=DOFHAjKnf7tU+evTd+s0TtMPYvUr+DWExrkuybwEW5k=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGl/VR49cK83bXR/GN0r4v+xyLctOOfQcn9l1mg7N5FZB 7ceEnvWUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgImYtDEy7E9N8BHdYnf1N/8L pucOvlfebVlXf674PkfolY1NSe+2BjD8U37rVnVGl8O8ri1oXvp2dgmu/q7jAUW7HQ6cr+5cvy2 fHwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_034901_580769_226F1A83 
X-CRM114-Status: GOOD (  12.80  )
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

When the binding for the mailbox on PolarFire SoC was originally
written, and later modified, mistakes were made - and the precise
nature of the later modification should have been a giveaway, but alas
I was naive at the time.

A more correct modelling of the hardware is to use two syscons and have
a single reg entry for the mailbox, containing the mailbox region. The
two syscons contain the general control/status registers for the mailbox
and the interrupt related registers respectively. The reason for two
syscons is that the same mailbox is present on the non-SoC version of
the FPGA, which has no interrupt controller, and the shared part of the
rtl was unchanged between devices.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 9883ca3554c50..f8a45e4f00a0d 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -259,6 +259,11 @@ clkcfg: clkcfg@20002000 {
 			#reset-cells = <1>;
 		};
 
+		sysreg_scb: syscon@20003000 {
+			compatible = "microchip,mpfs-sysreg-scb", "syscon";
+			reg = <0x0 0x20003000 0x0 0x1000>;
+		};
+
 		ccc_se: clock-controller@38010000 {
 			compatible = "microchip,mpfs-ccc";
 			reg = <0x0 0x38010000 0x0 0x1000>, <0x0 0x38020000 0x0 0x1000>,
@@ -521,10 +526,14 @@ usb: usb@20201000 {
 			status = "disabled";
 		};
 
-		mbox: mailbox@37020000 {
+		control_scb: syscon@37020000 {
+			compatible = "microchip,mpfs-control-scb", "syscon", "simple-mfd";
+			reg = <0x0 0x37020000 0x0 0x100>;
+		};
+
+		mbox: mailbox@37020800 {
 			compatible = "microchip,mpfs-mailbox";
-			reg = <0x0 0x37020000 0x0 0x58>, <0x0 0x2000318C 0x0 0x40>,
-			      <0x0 0x37020800 0x0 0x100>;
+			reg = <0x0 0x37020800 0x0 0x100>;
 			interrupt-parent = <&plic>;
 			interrupts = <96>;
 			#mbox-cells = <1>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

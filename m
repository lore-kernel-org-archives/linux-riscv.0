Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DFDC36002
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 17:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DTNPaWpvEVyTPd3WjVUGmnN4qHhVWezAiP3w+F2Fn2M=; b=rGuCmHgJ+5bLNL
	3UK2ucXLF52K8mhOChUJwdpChYepg/30tGd/Qa/X4kaTFQ/kbI8VFnYpM4IzpJMfYfFvTZJA83ElS
	NzYIpVN55thF8LDBoYmtFXwyZZS1bDd6/nlibF56AQ5Yj818q3fkSze2bA4IkoqK8wEPCwO5i5wxc
	HW6OQt0HSRR6u4aEQSXePzGlc6ATGi1xAzFqWBeZ+kF8OWP58uo2JnUYSX7FdcY5OY9d5P1bR8b/h
	XpG6rP77cTXyY+Y5L7p3eXGvk6VgjjYPzsd1rYoE4lRsZuoM/IrjtUQf2bp6IXgdg2ShkouqoIXzB
	jkp3AUMKZDvSmGvWI6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvg5q-0000000FgjA-0Da3;
	Fri, 21 Mar 2025 17:23:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvg5m-0000000FggG-3g4W
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 17:23:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CCC943BA2;
	Fri, 21 Mar 2025 17:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD39C4CEEA;
	Fri, 21 Mar 2025 17:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742577814;
	bh=js28aTzobaVq0lLOj3miTgsiXAxIDM2wJUkCtN7LbIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pvNJ4VMYMELWa8gkQccAfXnjCKHIiI95QI9gzYRLw42/AGzTGFxi8VCz8msVY1geP
	 GYKjj4AFA+dZOjRsV8H3KGw2GKkwox4tMRZo5w7VVv0x3grhBEzIGJYrffO70D0Ds9
	 hOVKZwnRkUcgeJ+E1DpdwRypVunhb5wUjAolv19ac1cdy9UNbRCEot5UEmotjtokVQ
	 pMS0Ni50085baM0UTuVCEvdqq5tBlliM5t0wQIbjO5kfCbrbxw2cQpl8DEG31R38z4
	 dFVH+QCA2sa0MM05klnCnzOteN09QUyRGva/Tt5PIQM+cKLou0AIE+h7GHzF409C9R
	 DjPrQbpaC4Erg==
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 6/9] riscv: dts: microchip: fix mailbox description
Date: Fri, 21 Mar 2025 17:22:39 +0000
Message-ID: <20250321-culminate-greyhound-941bce25856e@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250321-cuddly-hazily-d0ab1e1747b5@spud>
References: <20250321-cuddly-hazily-d0ab1e1747b5@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=oTMuiGOOhhC3GQAioxBkdjP6pkdPZ7VZK2gf4k/K1jo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOl3F0QtOfF2kcD7Uq3DrTMvtatOSIj4e3y/4EPvR+923 r/H9afIvqOUhUGMg0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQAT6XjE8E/z2W/nFP5vO96s P+F6WjYh++/TExZz+t8sbN65pMOLYf8kRoYpN6bYKni84//1/qt5xVbvjDnTk8TWcPBvl1367fS E0685AA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_102334_954523_2701536B 
X-CRM114-Status: GOOD (  12.03  )
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
index 9883ca3554c5..f9d6bf08e717 100644
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
+			compatible = "microchip,mpfs-control-scb", "syscon";
+			reg = <0x0 0x37020000 0x0 0x100>;
+		};
+
+		mbox: mailbox@37020800 {
 			compatible = "microchip,mpfs-mailbox";
-			reg = <0x0 0x37020000 0x0 0x58>, <0x0 0x2000318C 0x0 0x40>,
-			      <0x0 0x37020800 0x0 0x100>;
+			reg = <0x0 0x37020800 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <96>;
 			#mbox-cells = <1>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

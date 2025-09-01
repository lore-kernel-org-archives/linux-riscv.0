Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46295CA1008
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+J8/C8TVXf0svlXPt0/6VPLG5TwySGUTlD5agfF270=; b=kwWTd8AFX6SicU
	nBThQ9R4XnCe09QjRBzbv8tgICrxikNlEvPOSSD59tMY+0+yyiA+92Cdj7khnG99pMsQzElG6ToYP
	NUh4DtOPfFkGWhhB/OeUg12t6jNHFeRziDxOgP7KNRGxv3BnqyWwqAkR0Y07qM9WEC520XuQiljIL
	4CqGSpxh7stvfzrdPKpGqpOw0C/LV75WPL3J2+dNIc42rDcfCNsNrze4/FBSKX2feu5RKIeG8Vxyr
	QvnLqsSnNRWzEJh3/wKuB1arnRJYj9Gz8I1eeVaT5mb0da+OSW3JNdgJYfzav63NmlngHjGOQqAOj
	GQw1s2b7gjBDxrzhyvAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4DW-0000000CckX-1FLF;
	Mon, 01 Sep 2025 13:05:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2Lf-0000000BzXx-2fmK
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 11:05:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6125541AE2;
	Mon,  1 Sep 2025 11:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC49C4CEF9;
	Mon,  1 Sep 2025 11:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756724719;
	bh=HhAxMhzIWpGbIo7jKoWEEEwRf9Ce/jHp1L+yBzRh2ZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uGScmK/6FpuRVuYSYAd6H6szvYlh2nSs0IA7N+Ncc2fnGUMVkEdTtVjENWPfVGVRS
	 4qbLR+Le8ZEveB/z70SfVlv9Yy0Ri3HX3v/FAuPFsQKUyKbspxbcwt1hHe0dsQxzq9
	 nyz8hVihxaZY8TgqG+tttHlyK36S1rHzb4a/dGiMZ3gH593Rqbg2F8sxYf2ULaVMoO
	 1t6OwdWVto3F1hHV5LyAWyR5Ret/9C7vEmUwsXDeuDcbPIpVhgSxmRPlllrs7uwiph
	 /Z39zX0vrH8NDBqPVMo4SJ8fBNTzQfA9ps1lMcJC7qOVMpRHpYoj1eBCrB7CkeZNtp
	 mBETgy49T7S9A==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
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
	linux-kernel@vger.kernel.org,
	Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: [PATCH v4 6/9] riscv: dts: microchip: fix mailbox description
Date: Mon,  1 Sep 2025 12:04:18 +0100
Message-ID: <20250901-excretion-employed-1e497728e00e@spud>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901-rigid-sacrifice-0039c6e6234e@spud>
References: <20250901-rigid-sacrifice-0039c6e6234e@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=s6ZIEUHnNiMIErq0YtoV3qkwNiLtaSKSNvr8gxSu+hU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlba9edPD9/Mc+5Kx3zlG/fMfXzPBt6qU8g3awxVilSn HmzQ3FuRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbiVsfwz/LLfq+Yu9djX4u+ SnzXcbyTXUbauqfk1ze/N/mNDctmzGRk6K3bf/KKB/9OX6cDb0WUms8++7Yqw1br5pOY6QGMjrK rGQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_040519_719801_652E34EC 
X-CRM114-Status: GOOD (  12.26  )
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
index 9883ca3554c50..f9d6bf08e7170 100644
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
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

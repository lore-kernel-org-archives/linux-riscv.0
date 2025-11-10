Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2ADCCFA13
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hpiISppTtMKYf03eLC0nU1b88QQHNbv7Ur6MSveSXo=; b=KXQRxtQWJiFHcw
	JiTLZtH9gCm1cDmoq5jDxsnXcaqAGX+6AXLBUH/RxNOoL9Dtvz5BmsC80Nxs/t4papwX+FnlSKqIl
	vOrOcO86YNq9iDQ78nPoum7YdeulJpjYQxdATs5nswhW+MhJ7qm4AbrCpVP5JIch8pWqFSU5hu6v5
	kXwp2ugV6oA7kX/5COmNHwdKTq1Tr0J5VpRbaTUnlvcQ3ZgvSmU+CYIUoYV2yI+S4Ugj8ZxGSjyPw
	IWP7J7u1dQJcZkrE2cSElw4d4GcBp3LCZz8J9d5NjCSlLJIYlJM5tWpGobWEDYWn1YeKEYkPfahB6
	oD6JNUsdPXnITFxXcAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ0J-00000005Ik1-37V2;
	Mon, 10 Nov 2025 11:24:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQ0I-00000005Ijk-3Ifx
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 11:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0DF5601A4;
	Mon, 10 Nov 2025 11:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA67C4CEFB;
	Mon, 10 Nov 2025 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762773849;
	bh=yx40n6aW+7axlHFIv+/k4z1XcQ+4QDorszZ6b/jKM44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F59LTQtQ/T46ZHPhSBD6fAl/2N80oWK7OmmcQRc9LG6mbzvxSs/Wxjg5BBaqiXr7j
	 4UO4qcU2x7S+N+5lhfigGP1Pt6tzqhuLxTEuV+qcwNwjQcumnCPndDp7lDzBJP3N7c
	 sM8dZJPvNPGA8XTxsDGknW8hKbQfBIoY3Wr5uDUxjfjf/5kBfrYbTmF7Nl6xjQqgy+
	 rwDZfw1AosKhCT92iKWFPYMJfVfWfhKvG9ZLXV4Fvbm0IC14CxQ5+3B7b6Va0F2LJr
	 nUNeKwVJMe8gfSiuBpfG10S8CqgWHZd9Y1yNvbrdKyUH1wTaylH6MuQaR8ZWRdaC8T
	 D7DrVCbh/VoYg==
From: Conor Dooley <conor@kernel.org>
To: claudiu.beznea@tuxon.dev
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/5] riscv: dts: microchip: fix mailbox description
Date: Mon, 10 Nov 2025 11:23:51 +0000
Message-ID: <20251110-rockiness-sank-c22fa8a3bafb@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110-zookeeper-femur-68a0ae346397@spud>
References: <20251110-zookeeper-femur-68a0ae346397@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=CJ93zZ/gwT2VF26tXat2Gljwq2Roq9NVUZwBFI4dODQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmCp92P6z3eFjfpFded7KLe80fbPaf6daxL2FJwXkZit sLlCdMedpSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi/PcY/qkoHKi4fah5gljy sQkTIzUWyhq+DRfdqSlcNf9lxkP3jA0M/1Sf9KYyzH0zq6rp1tq5jpJsr8/F9RlUxP3u/Rjx8FB WIz8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

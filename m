Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48900CEFCE1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 17:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0NZ4/zd7J4KGUTdPnVSvwd5JyipfkMOtaCcO67LX6Sg=; b=Kno42TIbO5oU76
	VXY9mzaVUmo3I1kNCeTV/dUNiHTIUf4/zv4GjGHjY/ReXX0wIXBwN4fRQPzltUz1xeIveCrRMw0J3
	ahbZRrzy0JfGk6XrOZH/Qitqp8mK9XMYpYmyP1EFrj2aHn9RDZojEOc9K9FTswzbS6dFFUpRBDf23
	ygjqWZ5+WqBOwgI13f3daAEgXWLnLMqbB7p0DHWR/tpclRBgR7jIDCbhnvOvZCaIQvhitADE7kV0F
	lq+Z4JVbbbTI63JUSxR3ZRGFLFfTGLR+wasVsReh6t1vxLl7X7C+YeY8ciC+JA4WSq9o7N5cvme/P
	rEqUmCqiggdE3p9l6tbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAdF-0000000DYSn-2Tq5;
	Tue, 06 Jan 2026 17:14:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAdC-0000000DYRu-1O5D
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 17:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BB834026B;
	Tue,  6 Jan 2026 17:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AC7C116C6;
	Tue,  6 Jan 2026 17:14:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] riscv: dts: renesas: r9a07g043f: Move interrupt-parent to top node
Date: Tue,  6 Jan 2026 18:14:01 +0100
Message-ID: <97d3d70e42832f4ffa3888bec792b692a7ab700f.1767719409.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_091406_388665_47CBCE0F 
X-CRM114-Status: UNSURE (   9.66  )
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

Move the "interrupt-parent = <&plic>" property from the soc node to the
top node, for consistency with
arch/arm64/boot/dts/renesas/r9a07g043u.dtsi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.20.

v2:
  - Drop RFC, as commit 1b1f04d8271e7ba7 ("of/irq: Ignore interrupt
    parent for nodes without interrupts") is upstream as of v6.19-rc1.
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index a8bcb26f42700644..571de3cafa8214e4 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -12,6 +12,8 @@
 #include <arm64/renesas/r9a07g043.dtsi>
 
 / {
+	interrupt-parent = <&plic>;
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -52,7 +54,6 @@ &pinctrl {
 
 &soc {
 	dma-noncoherent;
-	interrupt-parent = <&plic>;
 
 	irqc: interrupt-controller@110a0000 {
 		compatible = "renesas,r9a07g043f-irqc";
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

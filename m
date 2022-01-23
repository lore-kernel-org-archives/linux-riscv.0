Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0155C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jan 2022 00:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnhBNOjlA1ncNCdj6Bbl+dMSHn1E/BxUNZvxaCvz+lA=; b=qmo5QNlM61y8Wj
	rMYiaEyXGWJ3tErOQQzw2pPh/8dSErnQvBPdRoAOVALzfo4mlBDOBMBYPYXEL5oHxzdC9JqJhYx/7
	NbiONt63Q0fQ1ifSPlYrzoY35kNDyXreDJ7XXKS/bd/Df/+HE8NGywEIOsNCPPJ+/vj8WmXut+dZ4
	VItjb21Q3D6EeTQqoWMClD0wo9ywKyCgWB1i9KYwSTeF7QKwZ2KXLrVgCa/zWs+OtHueymK3EIR/X
	exRzw5Deudit+LqcHE+cSSBx4vg7pFBKn4K1jHZIVZ9MbG4mzu9skrCiq3gNPNjz1hbfXk1kGy90G
	/UPYqgB0cUP+Z3+3jm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBQUt-0008ih-9k; Sun, 23 Jan 2022 00:12:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBQUq-0008hS-5P
 for linux-riscv@lists.infradead.org; Sun, 23 Jan 2022 00:12:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C0AC9CE0920;
 Sun, 23 Jan 2022 00:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC6FC004E1;
 Sun, 23 Jan 2022 00:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642896751;
 bh=3gLQh3f3+oWaMhkGHsFQqoHKnRNIrxUNODuNRihVYVw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hz8vRJCj0pP7A4PTqJsYeWT56Nm7qT4zKZhMXubDGUFgQIPgl2rj1x4VrWtHI8sAD
 sO+AWm5TMAu6GPMiv0xzzsX/YSXJ2zufn6NEhAHQcdB59HNX8r1RSS2SwCktMnBK/z
 UQkCA7Ds4FO03v+c3SnJrlCoa4x2EkOwVhWxn1aNEW3XObXjBcNMOR+b0hzQWsEOnk
 kSfpzLERDVGUqUGd855VLC4SqvdSwfm+v6DHDkSWc6qzWqw9RmLawZH5bWHaK15+Ft
 Rxtj08Z7I3mLf/hUaPNKC+bD/6Qa/4XJa2IncTyxBBCEAmsvCmdD72FdkMJ1EuJlj8
 Z4MGdSrTyM2mQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, bin.meng@windriver.com, atishp@atishpatra.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 04/16] riscv: dts: microchip: mpfs: Fix reference
 clock node
Date: Sat, 22 Jan 2022 19:12:03 -0500
Message-Id: <20220123001216.2460383-4-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123001216.2460383-1-sashal@kernel.org>
References: <20220123001216.2460383-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_161240_577604_961499B4 
X-CRM114-Status: GOOD (  11.75  )
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

From: Geert Uytterhoeven <geert@linux-m68k.org>

[ Upstream commit 9d7b3078628f591e4007210c0d5d3f94805cff55 ]

"make dtbs_check" reports:

    arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: soc: refclk: {'compatible': ['fixed-clock'], '#clock-cells': [[0]], 'clock-frequency': [[600000000]], 'clock-output-names': ['msspllclk'], 'phandle': [[7]]} should not be valid under {'type': 'object'}
	From schema: dtschema/schemas/simple-bus.yaml

Fix this by moving the node out of the "soc" subnode.
While at it, rename it to "msspllclk", and drop the now superfluous
"clock-output-names" property.
Move the actual clock-frequency value to the board DTS, since it is not
set until bitstream programming time.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../boot/dts/microchip/microchip-mpfs-icicle-kit.dts |  4 ++++
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi    | 12 +++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index cce5eca31f257..4b69ab4ff30a2 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -40,6 +40,10 @@ soc {
 	};
 };
 
+&refclk {
+	clock-frequency = <600000000>;
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index b12fd594e7172..18ccbdbe86d99 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -142,6 +142,11 @@ cpu4_intc: interrupt-controller {
 		};
 	};
 
+	refclk: msspllclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -191,13 +196,6 @@ dma@3000000 {
 			#dma-cells = <1>;
 		};
 
-		refclk: refclk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-			clock-frequency = <600000000>;
-			clock-output-names = "msspllclk";
-		};
-
 		clkcfg: clkcfg@20002000 {
 			compatible = "microchip,mpfs-clkcfg";
 			reg = <0x0 0x20002000 0x0 0x1000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

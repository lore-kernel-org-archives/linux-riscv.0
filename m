Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D01C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 21:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6xDx5lsrJTL9jkKl7LFzSJYgm0fHVIPxupXpZkMZjI=; b=yrLBxCqvheFlM8
	zz4ZQNGZ9CxNY2Zm+PeOUnSscPy3nhZikpCYJOHMckdzr5XDCVgukl1YwxkVnslJxb/AC8JD9deMB
	F2urI6KDfExFrmnIuiNs+BYa4Y6Uxlku3M0mQWg+33YrSP+givvdI1TOaTGc3Bd537us4859RIGD4
	l6NN7Bn4KPD15tcVkv2NMbXx6mID6Ik/Hn3Om+LSW9zzKj2TCq+Me0ZOmAB68rmisissIEYoHV6tj
	1i001JFgRucPMFh1e6M/eaY8I/imUUdzemjTzGkToG2KfYsrLAUVapSY5lClfpp9u/FBcYcb7uzp1
	T5y0KTHxoH64PnY5U2hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pejyi-00DsLx-1b;
	Tue, 21 Mar 2023 21:57:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pejyF-00Ds51-0w;
	Tue, 21 Mar 2023 21:56:44 +0000
Received: from localhost (unknown [188.24.179.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 962C566030E5;
	Tue, 21 Mar 2023 21:56:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679435798;
	bh=JQqVAql/b8lfHBRY2dfjEmOJ6R42cKTw5nJB8IbERcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OrWD7eS5eHKkF4roA1WuJnkTZmgbA4XGwGyshEv6hiavNLOZpgg3HnvskW1qdpVXr
	 NlwI89bNcvHnL1AJrr1se3DO/uwwHBSvONkP3WzGUCpJa8YmJ/ctkhKKOscWbF0PjN
	 QnEdB56yPKMyzEg2J9m/PJN40J8JsIb/QIvs3NeyGgZ+zCZbEg9bfQfjQ0JkU844jC
	 vCnHCVngezBzfzXLWHEQU9xr7DcNWbveQVBBSPys/1QiPQGOJdi2qX0ss0uD/K7w3W
	 7q7TkerSbs+pDOJHUzINIDCc6Hpt4lVZW6QB+Q7BiWHq/sqwHF71cucBFFZ93HeMXT
	 K6ntiQauyQwvg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 03/10] ARM: dts: sun8i: a23/a33: Switch dma-names order for snps,dw-apb-uart nodes
Date: Tue, 21 Mar 2023 23:56:17 +0200
Message-Id: <20230321215624.78383-4-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
References: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_145643_495782_9E8643C2 
X-CRM114-Status: GOOD (  14.26  )
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

Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
dma-names properties") documented dma-names property to handle Allwinner
D1 dtbs_check warnings, but relies on the rx->tx ordering, which is the
reverse of what a bunch of different boards expect.

The initial proposed solution was to allow a flexible dma-names order in
the binding, due to potential ABI breakage concerns after fixing the DTS
files. But luckily the Allwinner boards are not affected, since they are
using a shared DMA channel for rx and tx.

Hence, the first step in fixing the inconsistency was to change
dma-names order in the binding to tx->rx.

Do the same for the snps,dw-apb-uart nodes in the DTS file.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm/boot/dts/sun8i-a23-a33.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index f630ab55bb6a..4aa9d88c9ea3 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -490,7 +490,7 @@ uart0: serial@1c28000 {
 			clocks = <&ccu CLK_BUS_UART0>;
 			resets = <&ccu RST_BUS_UART0>;
 			dmas = <&dma 6>, <&dma 6>;
-			dma-names = "rx", "tx";
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -503,7 +503,7 @@ uart1: serial@1c28400 {
 			clocks = <&ccu CLK_BUS_UART1>;
 			resets = <&ccu RST_BUS_UART1>;
 			dmas = <&dma 7>, <&dma 7>;
-			dma-names = "rx", "tx";
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -516,7 +516,7 @@ uart2: serial@1c28800 {
 			clocks = <&ccu CLK_BUS_UART2>;
 			resets = <&ccu RST_BUS_UART2>;
 			dmas = <&dma 8>, <&dma 8>;
-			dma-names = "rx", "tx";
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -529,7 +529,7 @@ uart3: serial@1c28c00 {
 			clocks = <&ccu CLK_BUS_UART3>;
 			resets = <&ccu RST_BUS_UART3>;
 			dmas = <&dma 9>, <&dma 9>;
-			dma-names = "rx", "tx";
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -542,7 +542,7 @@ uart4: serial@1c29000 {
 			clocks = <&ccu CLK_BUS_UART4>;
 			resets = <&ccu RST_BUS_UART4>;
 			dmas = <&dma 10>, <&dma 10>;
-			dma-names = "rx", "tx";
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

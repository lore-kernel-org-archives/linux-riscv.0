Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AF9CA0FE8
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 10:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjvq6uH/HflapOoVMe/JIsjbIuXtxh+3Qyzgj1FX9Hk=; b=vwv5AoxM8Ilcwn
	A45acNsbUOZMAPFqR5dKtGdp3ZE8kI2GF+en8j9AlPAbS/EPZOLwG4XGrrXQqiXNlZmF9Tv4p/hCy
	IwWu6aVjhKjr0NCrPQQ/NNV9T5mqqGuz0tfUgLHm9jmgTqr7Hec10mx5xRiggsRBW2hfppb4FG2h5
	5lXg5zPpn3KOat2xOJg2ppY8MseKPuok6GAWvQdK15qdNTJ75o0QyQaprzech/ATmxpOiBeBs09Wj
	uKc6suTAWCk+n0LY/ZKduajcfLOJIZ4mA0pho3YX/64O3h/C1JteU40wsq3rxIpjMXVCcBLEhNt9/
	7BDg89cUTSSfPZ8fX1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplBR-00000004bCo-00JY;
	Sat, 23 Aug 2025 10:09:13 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upl5n-00000004ajw-240S
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 10:03:24 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id ED278B4E1E2E;
	Sat, 23 Aug 2025 12:03:18 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v3 2/3] riscv: dts: starfive: jh7110: add DMC memory controller
Date: Sat, 23 Aug 2025 03:01:42 -0700
Message-ID: <20250823100159.203925-3-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823100159.203925-1-e@freeshell.de>
References: <20250823100159.203925-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_030323_694662_6F934C70 
X-CRM114-Status: UNSURE (   5.97  )
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

Add JH7110 SoC DDR external memory controller.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 0ba74ef04679..f3876660c07f 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -931,6 +931,18 @@ watchdog@13070000 {
 				 <&syscrg JH7110_SYSRST_WDT_CORE>;
 		};
 
+		memory-controller@15700000 {
+			compatible = "starfive,jh7110-dmc";
+			reg = <0x0 0x15700000 0x0 0x10000>,
+			      <0x0 0x13000000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_PLLCLK_PLL1_OUT>;
+			clock-names = "pll";
+			resets = <&syscrg JH7110_SYSRST_DDR_AXI>,
+				 <&syscrg JH7110_SYSRST_DDR_OSC>,
+				 <&syscrg JH7110_SYSRST_DDR_APB>;
+			reset-names = "axi", "osc", "apb";
+		};
+
 		crypto: crypto@16000000 {
 			compatible = "starfive,jh7110-crypto";
 			reg = <0x0 0x16000000 0x0 0x4000>;
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

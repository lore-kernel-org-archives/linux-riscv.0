Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E70DCA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 07:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cge3DTRnM5tsVBho9hu+9MDz4zNGKuITwsKVuU4jz0c=; b=3v2oSEkpX8V5aj
	UBeqifaLtOk2AYudUCnAZrTkrSuIqkIj6P4L6KZa1i4bmxO+uVVef9SoM75JJcwX2KTGSy8i49bpO
	6AL51sUqwFTbozum4Qyd97LfpFF5gD2o9/49OSN41Ntg2SUu1rF0hZ3MAPNN9iKzB/BDTtJblZbrJ
	+IG+gBj3JWKQOGM/DLHgjS6M/dxlbHzVx6D2VOp5FR5+7wCDmnqLAhpgxUQ6kekh1M2FfZyc5A4VP
	K9G6wFsZwifM7uwAHfHe0jwJwTstIO0X9dnJT+7kRVEyysjXPM/kZfYtbde2/bmtJ3dESmWPAOD8b
	OrtD7cYXB7TvmdGvKfBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ump59-00000001lli-0Hw8;
	Fri, 15 Aug 2025 07:42:35 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ump2t-00000001lVD-12Aa
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 07:40:16 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id E3717B4E0083;
	Fri, 15 Aug 2025 09:40:09 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/3] riscv: dts: starfive: jh7110: add DMC memory controller
Date: Fri, 15 Aug 2025 00:37:22 -0700
Message-ID: <20250815073739.79241-3-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250815073739.79241-1-e@freeshell.de>
References: <20250815073739.79241-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_004015_458985_6B9DCC37 
X-CRM114-Status: UNSURE (   6.83  )
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
index 0ba74ef04679..14df3d062a45 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -372,6 +372,18 @@ ccache: cache-controller@2010000 {
 			cache-unified;
 		};
 
+		memory-controller@15700000 {
+			compatible = "starfive,jh7110-dmc";
+			reg = <0x0 0x15700000 0x0 0x10000>,
+			      <0x0 0x13000000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_PLLCLK_PLL1_OUT>;
+			clock-names = "pll1_out";
+			resets = <&syscrg JH7110_SYSRST_DDR_AXI>,
+				 <&syscrg JH7110_SYSRST_DDR_OSC>,
+				 <&syscrg JH7110_SYSRST_DDR_APB>;
+			reset-names = "axi", "osc", "apb";
+		};
+
 		plic: interrupt-controller@c000000 {
 			compatible = "starfive,jh7110-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

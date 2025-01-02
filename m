Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC2AE77197
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 19:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqcp2QxjReYNI+T+nXgNt/ZfySLqW/RoOVlCvOi8ScI=; b=r0a7W62kC/0CSN
	4wMUWOHLltZmxzDAAOUEegN0U/Gglx9gEW/pZeTamsKVAqs7yj0RicjW0EEt/5XQdAFQo5hUVjAs/
	p5L0gED4ioXeEZuHqTS/g7YqVSUEgBUcSAFhef5ELoDWYwv3H8u+2rWAzHdCMZXQwUZd1RH5YsuKO
	8gAMygdtHmcriIPAAMDgKwsPRGPT+7TyitqdYviMrgzqHoXGoATSeB15G/5PmbFQaXH0vT71tq2bt
	VmYG8NdUlHO+ShM+A18wcjL8YQRLyNAdD6tRr7M1v+SvU3NfzhYh3SG7V6AOO7GJt7yaqHIRwAZxr
	SjUG9cPPsNKkgiWOkPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTR8q-0000000BIpH-1KGq;
	Thu, 02 Jan 2025 19:46:00 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTR8o-0000000BIoK-11kI
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 19:45:59 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id A104BB4B2B73;
	Thu,  2 Jan 2025 20:45:54 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/5] riscv: dts: starfive: jh7110-common: replace syscrg clock assignments
Date: Thu,  2 Jan 2025 11:45:07 -0800
Message-ID: <20250102194530.418127-2-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102194530.418127-1-e@freeshell.de>
References: <20250102194530.418127-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_114558_430133_89AE022F 
X-CRM114-Status: UNSURE (   6.54  )
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

Replace syscrg assignments of clocks, clock parents, and rates, for
compatibility with downstream boot loader SPL secondary program
loader.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 48fb5091b817..55c6743100a7 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -359,9 +359,15 @@ spi_dev0: spi@0 {
 };
 
 &syscrg {
-	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_CORE>,
-			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
-	assigned-clock-rates = <500000000>, <1500000000>;
+	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
+			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
+			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
+			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
+	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
+				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
+				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
+				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
+	assigned-clock-rates = <0>, <0>, <0>, <0>;
 };
 
 &sysgpio {
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

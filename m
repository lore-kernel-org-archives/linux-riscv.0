Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE34C3ABAA
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 10:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+X4zlnj+LukX+S4NAv5hRw+va3ArZU/KmxdpsOcpJM=; b=c5w1ipEPgRaR33
	u+rd+QpuwaXDryaaN1vPot38fTaK+6vl+fBsnGmn7TvByseyXisEW7pLFda7TxC+RfchLxSNg5uzI
	VtBPfUI5mj5Rhdz8B71YorgRIHEgZRjQsA2Z34yQhMSkjyYdFj+b3j+/p5nXQdrMKmrj39JR5CNKQ
	EZyoTCvmBoWHYn0f3w9wmprKvETPAhKY9IZ5moZ1KkEmISV9mNC3c4amIs6tZxQSrUJthlWWr1DL4
	MlPhei0dcr2+jadE3GIrXvacn69B52NTp6QUKiKciH1/AYV6JAPPfGmSgygSjznaEgGlmPKnIKbu1
	JBbJHqV9Lobfou+8xL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnhf-00000001bAa-20vT;
	Fri, 02 May 2025 10:33:11 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAng6-00000001aWH-2KQx
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 10:31:35 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 7CFCFB4C23FD;
	Fri,  2 May 2025 12:31:30 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	E Shattow <e@freeshell.de>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v3 2/4] riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2 cycles max 100MHz
Date: Fri,  2 May 2025 03:30:42 -0700
Message-ID: <20250502103101.957016-3-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502103101.957016-1-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_033134_733993_F4C00A0B 
X-CRM114-Status: GOOD (  10.11  )
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

Use qspi flash read-delay and spi-max-frequency settings compatible with
U-Boot bootloader.

Observations from testing on Pine64 Star64 hardware within U-Boot bootloader
and read-delay=2 are spi-max-frequency less than 49.8MHz fails to write,
corrupt data writes at 25MHz to 49.799999MHz, and valid data writes at
49.8MHz to 100MHz (not tested above 100MHz). No valid spi-max-frequency
was found for 1<read-delay<=3 and corrupt data with read-delay=3.

Looking around the Linux codebase it is common to see read-delay 2 cycles
with spi-max-frequency 100MHz and testing confirms this to work in both
U-Boot and Linux.

Signed-off-by: E Shattow <e@freeshell.de>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index f1489e9bb83e..5c525686c043 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -317,8 +317,8 @@ &qspi {
 	nor_flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		cdns,read-delay = <5>;
-		spi-max-frequency = <12000000>;
+		cdns,read-delay = <2>;
+		spi-max-frequency = <100000000>;
 		cdns,tshsl-ns = <1>;
 		cdns,tsd2d-ns = <1>;
 		cdns,tchsh-ns = <1>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

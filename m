Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE09DC53210
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 01:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RM0CYpgLiekSJEjgw67r5uNmsoq8fnNPEqIHNv2i81E=; b=IeZrXh55ZFGw+o
	a10+EA6Rf7UDdRkC6h0BOskMABUzpEwOBXWnbHp7xRR/E9E/4v4amZelRhrbNjCfLYyBzJHN8ZeBD
	J0GaAMYT+yEW0fVcYcqZwDcTDfYI9nMXrJA3y0Jy/MVmn7EJjqnO+EY4naSL/fOQxBDAGqMU6zpat
	unxCSD6rOTegNiXpCTNhvEmdl/+97aJmrQyydBw0wD/GlFWAo7uH/IFXznJ99DUK3Cw2Mbt16JSlT
	DkHT/GxgbLmyh5Zs2f8SVMxRm5Yl412iehB92W46aiSnJ3XREm1pulb40wrpSWJ5edcwa20CFoaTo
	cVTmJj0Gu5i2W76FU2/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCWCt-00FbyU-RN; Tue, 03 Jan 2023 01:35:11 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCWAA-00FbID-Qc
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 01:32:25 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DDBE324E035;
	Tue,  3 Jan 2023 09:31:51 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 3 Jan
 2023 09:31:51 +0800
Received: from ubuntu.localdomain (113.72.146.202) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 3 Jan
 2023 09:31:51 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/4] riscv: dts: starfive: jh7110: Add temperature sensor node
Date: Tue, 3 Jan 2023 09:31:44 +0800
Message-ID: <20230103013145.9570-4-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230103013145.9570-1-hal.feng@starfivetech.com>
References: <20230103013145.9570-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.146.202]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_173223_178984_960419D9 
X-CRM114-Status: UNSURE (   9.53  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

Add temperature sensor support for StarFive JH7110 SoC.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 64d260ea1f29..793ae26bf72d 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -353,6 +353,19 @@ uart5: serial@12020000 {
 			status = "disabled";
 		};
 
+		sfctemp: tmon@120e0000  {
+			compatible = "starfive,jh7110-temp";
+			reg = <0x0 0x120e0000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_TEMP_CORE>,
+				 <&syscrg JH7110_SYSCLK_TEMP_APB>;
+			clock-names = "sense", "bus";
+			resets = <&syscrg JH7110_SYSRST_TEMP_CORE>,
+				 <&syscrg JH7110_SYSRST_TEMP_APB>;
+			reset-names = "sense", "bus";
+			interrupts = <81>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		syscrg: clock-controller@13020000 {
 			compatible = "starfive,jh7110-syscrg";
 			reg = <0x0 0x13020000 0x0 0x10000>;
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

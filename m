Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3AC9EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlKzbjuQ1HQIqkZR94v5b3PLYt7YeZgRivONicUCY0g=; b=xkyU2c6UaGrrZ9
	j1uVnW1xZ/1ZNJjkRCBSDPQTR68+S6NSgQNobfn3Wp57Ek1ocwntt9DrXcteJ0mGI5zxHRqw5a2Zm
	mL+JJCal1NiHdenqNS/KDmfB4n4ntvW7yyFbRJPJc+j39bSLI0ImNL5yEBBTnQuEKH9FpNUecflSh
	5dD9uq/sDhnw5X+43p4mQZOyt/CWuiu+lCXOxU7/KhgifR+iZ7nScqu69Swovs6+WZbjUey8u7YYt
	lDWJbcpGYPwndme5oMT4iDNkoX7T7hlyRNorX9zgG+R4p09fPQObNtKJ6c5aEQoj88dbbIr/o7tQ6
	hjKrYbx3yQSSM1A+DSaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Kh-005Y88-2Y;
	Wed, 19 Jul 2023 06:06:43 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Kg-005Y6c-04
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wzZdBDaKDPmFwxxxRQuhsmNxqRJrtNdmSA2+pjPr1Xc=; b=Rj/ZeYofnXE2vIOOrURcaYM3NX
	msp0TPUd9Y7R0V0RByUTQfgreMZe6MMxAxJQbeWWW7uYfkbsWY1FhWu0i22J0h+9d4imY+h9MYxB3
	QHSM+i/7WQ21BpcHbXM0DV/o72/DtjYI7Z4VBfUp8bF2Jzsr79vK99dSDzqjovDY933MUVNeQu0zu
	xFKI+E1+CVQCL5CO2+Jyq2uFpSqxTeb+wm4ukda/fT2C2N+sSshgMsiqxbRlfd+2XhUoegkY4qc2B
	lgcaoMY8OqErY+eFjJ6l+5gWGWean2DE/KV3Vevsbl7xkLP9E5UUoVWSMOtjlQTje3+yv0J/YDgSh
	wKCsRcFQ==;
Received: from ex01.ufhost.com ([61.152.239.75])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLbkH-009zYo-0Z
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 03:51:38 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4FFFF24E26C;
	Tue, 18 Jul 2023 11:49:39 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 11:49:39 +0800
Received: from ubuntu.localdomain (113.72.147.86) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Jul
 2023 11:49:38 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/3] riscv: dts: starfive: jh7100: Add temperature sensor node and thermal-zones
Date: Tue, 18 Jul 2023 11:49:35 +0800
Message-ID: <20230718034937.92999-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230718034937.92999-1-hal.feng@starfivetech.com>
References: <20230718034937.92999-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.147.86]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_045129_807170_1F6E4FD9 
X-CRM114-Status: UNSURE (   9.63  )
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

Add temperature sensor and thermal-zones support for
the StarFive JH7100 SoC.

Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 4218621ea3b9..35ab54fb235f 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -80,6 +80,31 @@ core1 {
 		};
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <15000>;
+
+			thermal-sensors = <&sfctemp>;
+
+			trips {
+				cpu_alert0 {
+					/* milliCelsius */
+					temperature = <75000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit {
+					/* milliCelsius */
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	osc_sys: osc_sys {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -248,5 +273,17 @@ watchdog@12480000 {
 			resets = <&rstgen JH7100_RSTN_WDTIMER_APB>,
 				 <&rstgen JH7100_RSTN_WDT>;
 		};
+
+		sfctemp: temperature-sensor@124a0000 {
+			compatible = "starfive,jh7100-temp";
+			reg = <0x0 0x124a0000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_TEMP_SENSE>,
+				 <&clkgen JH7100_CLK_TEMP_APB>;
+			clock-names = "sense", "bus";
+			resets = <&rstgen JH7100_RSTN_TEMP_SENSE>,
+				 <&rstgen JH7100_RSTN_TEMP_APB>;
+			reset-names = "sense", "bus";
+			#thermal-sensor-cells = <0>;
+		};
 	};
 };
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

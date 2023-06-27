Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF5EEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 05:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KdsotG5eb0sMtXs27mEi0m8tpsFtH5dyf3D5iTF7J8=; b=tyGNxaYL45Omv7
	F+vnRCE/ZPhyh36QL5sOWMNNovndYjXicrNxB8cgkYwP9dT3L3KZELxMSLTTKmD6jAtizewIYT4qV
	d4K3usDHXMdfkVRBaX4qzaoT3anpHy0LVaOb0K9QFOWJR4rJYxVXUrHih7EHalhYTctblFmyLweHu
	6pFOv8Lju1kBs4zeU//cIi0Ap2CBG6YORSHYOfDLgkJ1/apPEASsoT9Fspf5FixFmJbqhRD9Rd7v+
	6ZWlEdG6Fg/ziQ5Op9Wf1TRziC2WXOkw2LLJeVVvYw+0caxlygky88wm7PLgZUi2VGrJOXjLaiFkh
	lc4++7xKZpV7XrAJdNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE1eF-00Bz9Y-39;
	Tue, 27 Jun 2023 05:53:55 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE1eC-00Bytn-24
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 05:53:54 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 08CEE8062;
	Tue, 27 Jun 2023 13:53:17 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 27 Jun
 2023 13:53:16 +0800
Received: from localhost.localdomain (183.27.97.206) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 27 Jun
 2023 13:53:16 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 3/3] riscv: dts: jh7110: starfive: Add timer node
Date: Tue, 27 Jun 2023 13:53:13 +0800
Message-ID: <20230627055313.252519-4-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627055313.252519-1-xingyu.wu@starfivetech.com>
References: <20230627055313.252519-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.206]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_225352_866483_34CCF3FD 
X-CRM114-Status: UNSURE (   9.97  )
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

Add the timer node for the Starfive JH7110 SoC.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 4c5fdb905da8..587aa6830c4b 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -469,6 +469,26 @@
 			#gpio-cells = <2>;
 		};
 
+		timer@13050000 {
+			compatible = "starfive,jh7110-timer";
+			reg = <0x0 0x13050000 0x0 0x10000>;
+			interrupts = <69>, <70>, <71> ,<72>;
+			clocks = <&syscrg JH7110_SYSCLK_TIMER_APB>,
+				 <&syscrg JH7110_SYSCLK_TIMER0>,
+				 <&syscrg JH7110_SYSCLK_TIMER1>,
+				 <&syscrg JH7110_SYSCLK_TIMER2>,
+				 <&syscrg JH7110_SYSCLK_TIMER3>;
+			clock-names = "apb", "ch0", "ch1",
+				      "ch2", "ch3";
+			resets = <&syscrg JH7110_SYSRST_TIMER_APB>,
+				 <&syscrg JH7110_SYSRST_TIMER0>,
+				 <&syscrg JH7110_SYSRST_TIMER1>,
+				 <&syscrg JH7110_SYSRST_TIMER2>,
+				 <&syscrg JH7110_SYSRST_TIMER3>;
+			reset-names = "apb", "ch0", "ch1",
+				      "ch2", "ch3";
+		};
+
 		aoncrg: clock-controller@17000000 {
 			compatible = "starfive,jh7110-aoncrg";
 			reg = <0x0 0x17000000 0x0 0x10000>;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

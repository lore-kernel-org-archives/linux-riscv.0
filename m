Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1431DC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 10:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5cMqNDxBkbFYDleNzECGXaXOEgYS03MPJ3M8LhWQPA=; b=cD8HCQD6aBrrN8
	A+WQMb73Cyh7uxnbeoOZG8RGT2Mt+OAO6fb3tN2nvj/+kWs0G0fEeaeiq/snU2dFnEJl1myVX4uHD
	iEOOUYKTn4etyq3sk1gUJqUBWN3dM+mQgJZPgGKfx9hec8UApNsHJL5J9/J6f8UZcw6jKguEyAPZj
	4r6LH4diDrK45bSg4V7PfxObr4+eyNW0hIyfWrs7Ls7L4kBHEgxQVCh6F44682GFWgKUH85G9kxFU
	iA3h/wqMSNlcDmF1eB0qLFx/qrZD+GaJTs1LEHSTnm1+/UNhkt8GT9TQLGCJgu4DVeD0hOwDlsFLZ
	cc/Rf7QwyfIl96EJUVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8fCp-006LSo-Be; Fri, 23 Dec 2022 10:23:11 +0000
Received: from [61.152.239.71] (helo=fd01.gateway.ufhost.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8efP-005wUW-2w
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 09:48:52 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2A1F624E102;
	Fri, 23 Dec 2022 17:48:05 +0800 (CST)
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 17:48:05 +0800
Received: from localhost.localdomain (183.27.97.120) by EXMBX161.cuchost.com
 (172.16.6.71) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 23 Dec
 2022 17:48:04 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/3] riscv: dts: jh7110: starfive: Add timer node
Date: Fri, 23 Dec 2022 17:48:01 +0800
Message-ID: <20221223094801.181315-4-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221223094801.181315-1-xingyu.wu@starfivetech.com>
References: <20221223094801.181315-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.120]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX161.cuchost.com
 (172.16.6.71)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_014839_543616_053A43A6 
X-CRM114-Status: UNSURE (   9.69  )
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
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index c22e8f1d2640..3936c7c0c962 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -356,6 +356,28 @@ gpioa: gpio@17020000 {
 			#gpio-cells = <2>;
 		};
 
+		timer: timer@13050000 {
+			compatible = "starfive,jh7110-timers";
+			reg = <0x0 0x13050000 0x0 0x10000>;
+			interrupts = <69>, <70>, <71> ,<72>;
+			interrupt-names = "timer0", "timer1", "timer2", "timer3";
+			clocks = <&syscrg JH7110_SYSCLK_TIMER0>,
+				 <&syscrg JH7110_SYSCLK_TIMER1>,
+				 <&syscrg JH7110_SYSCLK_TIMER2>,
+				 <&syscrg JH7110_SYSCLK_TIMER3>,
+				 <&syscrg JH7110_SYSCLK_TIMER_APB>;
+			clock-names = "timer0", "timer1",
+				      "timer2", "timer3", "apb";
+			resets = <&syscrg JH7110_SYSRST_TIMER0>,
+				 <&syscrg JH7110_SYSRST_TIMER1>,
+				 <&syscrg JH7110_SYSRST_TIMER2>,
+				 <&syscrg JH7110_SYSRST_TIMER3>,
+				 <&syscrg JH7110_SYSRST_TIMER_APB>;
+			reset-names = "timer0", "timer1",
+				      "timer2", "timer3", "apb";
+			clock-frequency = <24000000>;
+		};
+
 		uart0: serial@10000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x10000000 0x0 0x10000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

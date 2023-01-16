Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C850C54EBE
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jan 2023 07:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efsYWe7gWMZadTeoTfl6p6FSeCiV5WTVeivBulQA4cM=; b=nSgsney5lzNXsH
	C88bxhAUUj+xnoYer+fzkUvFZyBYwUSCrkdnILuZrjGIIuOdT7qiRxFFDrVEBkKlr0OooO0I0ivJU
	6HTN1n34L8AuUi4lbyoYuAjps9NFt94R2JnVw78dYV7dmMxdi3TIX6yvgWLKZTtRz5odSBRzTdiVR
	WjdNZUYRKTynmo+/onWMgJRVyGcUZQULL6n0o6Sk6kJGh0VxvEDx9iVLdzMvdkoL+oI8TJU7Yvxn9
	pjBd2k1acVGAsw+zOFKt4NyDm38A1aBrI7FqZA5+fUGzC+rrquI5LjdIaCcekfI0/ZRDZuQhd8nJ7
	+Tqykn3y3uoW1hTVrSrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHK9u-0091W8-B8; Mon, 16 Jan 2023 07:43:58 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHK9r-0091R7-TD
	for linux-riscv@lists.infradead.org; Mon, 16 Jan 2023 07:43:57 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 60DDA24E23E;
	Mon, 16 Jan 2023 15:43:12 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 16 Jan
 2023 15:43:12 +0800
Received: from localhost.localdomain (113.72.144.207) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 16 Jan
 2023 15:43:11 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/3] riscv: dts: starfive: add pmu controller node
Date: Mon, 16 Jan 2023 15:42:59 +0800
Message-ID: <20230116074259.22874-4-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230116074259.22874-1-walker.chen@starfivetech.com>
References: <20230116074259.22874-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.207]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_234356_109505_0CBC0357 
X-CRM114-Status: UNSURE (   9.98  )
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

Add the pmu controller node for the Starfive JH7110 SoC. The PMU needs
to be used by other modules such as VPU, ISP, etc.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 64d260ea1f29..d0d95ef7aa1a 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -407,5 +407,12 @@
 			gpio-controller;
 			#gpio-cells = <2>;
 		};
+
+		pwrc: power-controller@17030000 {
+			compatible = "starfive,jh7110-pmu";
+			reg = <0x0 0x17030000 0x0 0x10000>;
+			interrupts = <111>;
+			#power-domain-cells = <1>;
+		};
 	};
 };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

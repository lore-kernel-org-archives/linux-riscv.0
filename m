Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759AFC46CD4
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AD74jw0LuU7s8iGq0SHjrqLWjHCTJwvQMx+Fa7rGOrs=; b=mtPh8eSP/TUwp/
	AZim3w23NPqAL3bF4A+fjnN17f43ZZyYRP7rQhMGiWnZLlrP/3PtDSXQ1dWY+kVJEu4v7UzEonavy
	51FzetqHOJ6WLqCtFIVQF53rgY16oOLE7zwtY4KUO80k+vbybPhhhigYuIF3bPg9MIwBfcfKMYSwP
	qHzswcGsyx/pbz2qfl6FzeFiwYoWMDB1MR6LEb0lcwoW2VSjp92UEXTveyzLJR2ygraSS21Y+Hxv0
	yXdIPPXTIbo+EZYM0yLKQdcfHojjyEt/bfGKt0bdwhzrsIwH+137m1Zu2wVcXJjXC42MHgSrAHWMc
	T3sHUUO+YW6cGVBI+ZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEfw-0024Fo-0S;
	Thu, 21 Dec 2023 08:45:04 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEfs-0024B5-1K
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 08:45:01 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2B36E7FFE;
	Thu, 21 Dec 2023 16:44:36 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 16:44:36 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 21 Dec
 2023 16:44:29 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Samin Guo
	<samin.guo@starfivetech.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Ley Foon Tan
	<leyfoon.tan@starfivetech.com>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v5 2/2] riscv: dts: starfive: jh8100: Add watchdog node
Date: Thu, 21 Dec 2023 16:43:58 +0800
Message-ID: <20231221084358.3458713-3-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231221084358.3458713-1-jisheng.teoh@starfivetech.com>
References: <20231221084358.3458713-1-jisheng.teoh@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_004500_617467_64EF0B34 
X-CRM114-Status: UNSURE (   7.92  )
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

StarFive's JH8100 watchdog is based on JH7110, with JH8100 watchdog only
requiring one reset signal.

Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh8100.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh8100.dtsi b/arch/riscv/boot/dts/starfive/jh8100.dtsi
index 9863c61324a0..657d8b79e708 100644
--- a/arch/riscv/boot/dts/starfive/jh8100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh8100.dtsi
@@ -360,6 +360,15 @@ uart4: serial@121a0000  {
 			status = "disabled";
 		};
 
+		watchdog@12270000 {
+			compatible = "starfive,jh8100-wdt", "starfive,jh7110-wdt";
+			reg = <0x0 0x12270000 0x0 0x10000>;
+			clocks = <&syscrg_ne SYSCRG_NE_CLK_WDT_APB>,
+				 <&syscrg_ne SYSCRG_NE_CLK_WDT>;
+			clock-names = "apb", "core";
+			resets = <&syscrg_ne SYSCRG_NE_RSTN_WDT0>;
+		};
+
 		syscrg_ne: syscrg_ne@12320000 {
 			compatible = "starfive,jh8100-syscrg-ne";
 			reg = <0x0 0x12320000 0x0 0x10000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

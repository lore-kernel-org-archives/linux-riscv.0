Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEFBC6FD1D
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IAvjHdAtdvxMA2unu4Eu+vU5na7xPOjYSwHMIxEYKQ=; b=0INt7PnHRMTW6g
	YcJrEXDlJZF3SJ3q7Qp4QLnDH/KcENFoe1cP9ZsG6c0Iba20+lA0nesAaIw0q4mO4fR+FQuYBfLiH
	Eq54CgfzFF2gAyoZiCXKd26WdTHzRlq4i/Yt14RbdNrJ5xE5REdXSeAk1udC/1Ygqrio6uCU+rOHb
	0NGI1T8D3lFDKk42q/RXdMpXwfvD6CCbcqrPFlJoaZ+af7lJ9NFd07CluTFHa6LYXAzcA1VvEtZmB
	0xF4uBIYLQ57RheezlV6Rz7O7AHnAPcakS6TFpopnqfGLFK8xfiqY2rOZantKwQPhz6Re2xZUr1EK
	DLo+mOtGv1D5vcpd8dhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piZHx-00AFFJ-0i;
	Sat, 01 Apr 2023 11:20:53 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piZHt-00AFAK-1h
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 11:20:50 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9BF7224E197;
	Sat,  1 Apr 2023 19:19:58 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 1 Apr
 2023 19:19:58 +0800
Received: from ubuntu.localdomain (113.72.144.76) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 1 Apr
 2023 19:19:57 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v7 22/22] riscv: dts: starfive: jh7110: Correct the properties of S7 core
Date: Sat, 1 Apr 2023 19:19:34 +0800
Message-ID: <20230401111934.130844-23-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230401111934.130844-1-hal.feng@starfivetech.com>
References: <20230401111934.130844-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.76]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_042049_730553_3C97E9F3 
X-CRM114-Status: UNSURE (   6.74  )
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

The S7 core has no L1 data cache and MMU, so delete some
related properties.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index d484ecdf93f7..4c5fdb905da8 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -20,21 +20,12 @@ cpus {
 		S7_0: cpu@0 {
 			compatible = "sifive,s7", "riscv";
 			reg = <0>;
-			d-cache-block-size = <64>;
-			d-cache-sets = <64>;
-			d-cache-size = <8192>;
-			d-tlb-sets = <1>;
-			d-tlb-size = <40>;
 			device_type = "cpu";
 			i-cache-block-size = <64>;
 			i-cache-sets = <64>;
 			i-cache-size = <16384>;
-			i-tlb-sets = <1>;
-			i-tlb-size = <40>;
-			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imac_zba_zbb";
-			tlb-split;
 			status = "disabled";
 
 			cpu0_intc: interrupt-controller {
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

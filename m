Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4F1C83F15
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 02:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyVhJnnLZSB+eeedZO4AHnKATFhfs6MQEE17IT+57Us=; b=PCXjojR/C9WfD3
	22R0FJHCqxD1+j/hZUlCEVu9WDcIl3CkimF+NKObj3zoK6wYaUz9k/K5vfQ5gRXQRWkCaPg2l0vdi
	5prnaBng9BvkdcbyYJUCtFidn/cd1nQo9mGy0h7cCgGQaUXU14C/U2IJUYN9e8ZbUkoxYyHLTTbRq
	Ov+TMTuHhUJcM6McPD/kguZrPbK9x4kQ5C9e/WQXQo38wXJ/IPpDtil3lwp2BKNPcIo7IS/iTnvDX
	q3kTlDyd718JWgi5/AEQqmgPShZspRo+AyDAfVKmSsIaVwUH3nGVWmzCrWofGb9U1whhSbWY1CX6l
	RzXm3RxNRdX6cMjbI4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qao73-00Aav3-0F;
	Tue, 29 Aug 2023 02:05:49 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qao70-00AapK-1M
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 02:05:48 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 29B9B24E1EB;
	Tue, 29 Aug 2023 10:05:14 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Aug
 2023 10:05:13 +0800
Received: from ubuntu.localdomain (113.72.145.245) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Aug
 2023 10:05:13 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Hal Feng <hal.feng@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [-next v2 2/2] riscv: dts: starfive: visionfive 2: Fix uart0 pins sort order
Date: Tue, 29 Aug 2023 10:05:11 +0800
Message-ID: <20230829020511.26844-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230829020511.26844-1-hal.feng@starfivetech.com>
References: <20230829020511.26844-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.245]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_190546_741684_9B9D16E4 
X-CRM114-Status: UNSURE (   9.48  )
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

Node uart0_pins should be sorted alphabetically.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 48 +++++++++----------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 85f40df93f25..382dfb5e64e4 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -440,30 +440,6 @@ GPOEN_ENABLE,
 		};
 	};
 
-	uart0_pins: uart0-0 {
-		tx-pins {
-			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
-					     GPOEN_ENABLE,
-					     GPI_NONE)>;
-			bias-disable;
-			drive-strength = <12>;
-			input-disable;
-			input-schmitt-disable;
-			slew-rate = <0>;
-		};
-
-		rx-pins {
-			pinmux = <GPIOMUX(6, GPOUT_LOW,
-					     GPOEN_DISABLE,
-					     GPI_SYS_UART0_RX)>;
-			bias-disable; /* external pull-up */
-			drive-strength = <2>;
-			input-enable;
-			input-schmitt-enable;
-			slew-rate = <0>;
-		};
-	};
-
 	tdm_pins: tdm-0 {
 		tx-pins {
 			pinmux = <GPIOMUX(44, GPOUT_SYS_TDM_TXD,
@@ -497,6 +473,30 @@ GPOEN_DISABLE,
 			input-enable;
 		};
 	};
+
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
+					     GPOEN_ENABLE,
+					     GPI_NONE)>;
+			bias-disable;
+			drive-strength = <12>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pinmux = <GPIOMUX(6, GPOUT_LOW,
+					     GPOEN_DISABLE,
+					     GPI_SYS_UART0_RX)>;
+			bias-disable; /* external pull-up */
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
 };
 
 &tdm {
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E9CC352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 05:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLe7nU+JX+vAA3YsDJ0mgQmbCEyHtu87IrMSbD/IzfI=; b=tqbjacDidt5IOy
	DrB5Ell0yfDUFwOV109TrDg3jwF1SpLMj/sW2PjHdYS3j6z+ALaOnPQGb/kE5k/QnMOwXRnTkhdCW
	x/SHhEwLXqejwgtftIDH+roNgfa6kGmFmJZdlHevF8BjPgGS+8gPZOFAejezbo5HpEnLSygk56dwy
	v4X1RaKQQ1jJvYgaxiSLxKnJQ6fZ4ay5FGeW0psn0B3lQVfqrYD2DssUqNosCHh/EBj6QjcpvsNTP
	RQpJgGuSAV+3kPP+sDoQmZLCfw/WSEdZ6kK8wmtpIEllQQ/R6hPD9xPmwfHuvXLJN5vKZexQ6ARiZ
	omh3eU5XZiM1uaeE6lrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0G1q-00DaV8-8f; Wed, 30 Nov 2022 05:53:06 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0G1m-00DaMR-2d
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 05:53:03 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1925A24E31C;
	Wed, 30 Nov 2022 13:52:46 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 30 Nov
 2022 13:52:46 +0800
Received: from ubuntu.localdomain (202.188.176.82) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 30 Nov
 2022 13:52:42 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Jia Jie Ho
	<jiajie.ho@starfivetech.com>
Subject: [PATCH 6/6] riscv: dts: starfive: Add crypto and DMA node for VisionFive 2
Date: Wed, 30 Nov 2022 13:52:14 +0800
Message-ID: <20221130055214.2416888-7-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_215302_315045_6144B651 
X-CRM114-Status: UNSURE (   9.26  )
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

Adding StarFive crypto IP and DMA controller node
to VisionFive 2 SoC.

Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
---
 .../jh7110-starfive-visionfive-v2.dts         |  8 +++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 36 +++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
index 450e920236a5..da2aa4d597f3 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
@@ -115,3 +115,11 @@ &tdm_ext {
 &mclk_ext {
 	clock-frequency = <49152000>;
 };
+
+&sec_dma {
+	status = "okay";
+};
+
+&crypto {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 4ac159d79d66..745a5650882c 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -455,5 +455,41 @@ uart5: serial@12020000 {
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		sec_dma: sec_dma@16008000 {
+			compatible = "arm,pl080", "arm,primecell";
+			arm,primecell-periphid = <0x00041080>;
+			reg = <0x0 0x16008000 0x0 0x4000>;
+			reg-names = "sec_dma";
+			interrupts = <29>;
+			clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
+				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
+			clock-names = "sec_hclk","apb_pclk";
+			resets = <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
+			reset-names = "sec_hre";
+			lli-bus-interface-ahb1;
+			mem-bus-interface-ahb1;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
+			#dma-cells = <2>;
+			status = "disabled";
+		};
+
+		crypto: crypto@16000000 {
+			compatible = "starfive,jh7110-crypto";
+			reg = <0x0 0x16000000 0x0 0x4000>;
+			reg-names = "secreg";
+			clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
+				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
+			clock-names = "sec_hclk","sec_ahb";
+			resets = <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
+			reset-names = "sec_hre";
+			enable-side-channel-mitigation;
+			enable-dma;
+			dmas = <&sec_dma 1 2>,
+			       <&sec_dma 0 2>;
+			dma-names = "sec_m","sec_p";
+			status = "disabled";
+		};
 	};
 };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

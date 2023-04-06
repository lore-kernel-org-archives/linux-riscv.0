Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB8AC7618D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 10:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X83/HK8hxywD76W3yb9SDXgBYFisaAPlvsYP9PP5kt0=; b=BrrH8MExXnuV9q
	JlOFTCFAn0i/Vm4VbM3J78SAH/aAIuyqfUH1rwVCaUjRY5ZHwLFbkU7Eld+hgrCYsrM5KvfO5FKqN
	G96Dl3ZSfmIjaEHKbKdumeOtG8Po1Ne+B/LU+Ny9OfX2dFerEplSG1f+XdL171MoVZfLVGCFBvY5J
	vWS2xFzx7N6I2rr0UPH4fktFawbatBjO3sLz0NP5IGKnkhzvVeQLqCt+61Mp5Y0b/NTENt9JxFKuu
	P4O0RpLBzLi0I1v2CqxEGTR0kjvMJJbFFZrlzLKNrIFI4knlTm6uS9ql06bNeeZ6ED2KepfMd2Rig
	zt29buas7pniTCyqYU0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMw8-0073VZ-0V;
	Thu, 06 Apr 2023 10:33:48 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMw4-0073IW-0P
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 10:33:46 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C88AA24E31E;
	Thu,  6 Apr 2023 18:33:15 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 6 Apr
 2023 18:33:15 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 6 Apr 2023 18:33:15 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Emil
 Renner Berthing" <kernel@esmil.dk>, William Qiu
	<william.qiu@starfivetech.com>
Subject: [PATCH v7 2/2] riscv: dts: starfive: jh7110: Add syscon nodes
Date: Thu, 6 Apr 2023 18:33:08 +0800
Message-ID: <20230406103308.1280860-3-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406103308.1280860-1-william.qiu@starfivetech.com>
References: <20230406103308.1280860-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_033344_320672_14517F22 
X-CRM114-Status: UNSURE (   7.61  )
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

Add stg_syscon/sys_syscon/aon_syscon nodes for JH7110 Soc.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 4c5fdb905da8..f271c3184d3a 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -353,6 +353,11 @@ i2c2: i2c@10050000 {
 			status = "disabled";
 		};

+		stg_syscon: syscon@10240000 {
+			compatible = "starfive,jh7110-stg-syscon", "syscon";
+			reg = <0x0 0x10240000 0x0 0x1000>;
+		};
+
 		uart3: serial@12000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x12000000 0x0 0x10000>;
@@ -457,6 +462,11 @@ syscrg: clock-controller@13020000 {
 			#reset-cells = <1>;
 		};

+		sys_syscon: syscon@13030000 {
+			compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
+			reg = <0x0 0x13030000 0x0 0x1000>;
+		};
+
 		sysgpio: pinctrl@13040000 {
 			compatible = "starfive,jh7110-sys-pinctrl";
 			reg = <0x0 0x13040000 0x0 0x10000>;
@@ -486,6 +496,11 @@ aoncrg: clock-controller@17000000 {
 			#reset-cells = <1>;
 		};

+		aon_syscon: syscon@17010000 {
+			compatible = "starfive,jh7110-aon-syscon", "syscon", "simple-mfd";
+			reg = <0x0 0x17010000 0x0 0x1000>;
+		};
+
 		aongpio: pinctrl@17020000 {
 			compatible = "starfive,jh7110-aon-pinctrl";
 			reg = <0x0 0x17020000 0x0 0x10000>;
--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

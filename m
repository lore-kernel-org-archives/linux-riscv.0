Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900DFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 08:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXXk0B62VIXxn0bOXrovw7Ekx6AW3q2Bpp7iH8jhYVY=; b=ghQycBiImoxJhU
	gqeDknv0eOODIOkQBGgYGBHZo7x2IDVr888/Pt7aNDJ6OR3DtZ7cqTLvWS3iKt1wxF6+eYx1NzdoD
	mKLSkUHkZkZhUU5Nm9T3jyZ4cvSHtR+Px4xtc3EO2MpGO2xyA8nkqK4SRjoA3X3cm6HnBPsAkv4QF
	vgRBKucH8ko7wbysZ/ieKPeb17s07qPLKR3v+LuHKObKloP6RSD5yhEO8mFC92jD8CTYEJy5IRGW6
	xoH3pqz7YdLSSOTyeUHv6iosbCU9YudTnwISO1/GkaA94cHQUzXz2Zf7ziY/DaRKt7Q/FIr7+HnBE
	sZzXjSAwSyZ9SZXAR8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cdm-00AO1v-E4; Thu, 08 Dec 2022 08:52:26 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CXX-00AGnD-Br
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 08:46:00 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D3A7D24DFD7;
	Thu,  8 Dec 2022 16:45:36 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 16:45:36 +0800
Received: from localhost.localdomain (113.72.146.33) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Dec
 2022 16:45:35 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v2 3/3] riscv: dts: starfive: add pmu controller node
Date: Thu, 8 Dec 2022 16:45:23 +0800
Message-ID: <20221208084523.9733-4-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221208084523.9733-1-walker.chen@starfivetech.com>
References: <20221208084523.9733-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.146.33]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_004559_566553_2675BC7E 
X-CRM114-Status: UNSURE (   9.17  )
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

This adds the pmu controller node for the Starfive JH7110 SoC. The PMU
needs to be used by other modules such as ISP, VPU, etc.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index c22e8f1d2640..fa7b60b82d71 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -356,6 +356,13 @@
 			#gpio-cells = <2>;
 		};
 
+		pwrc: power-controller@17030000 {
+			compatible = "starfive,jh7110-pmu";
+			reg = <0x0 0x17030000 0x0 0x10000>;
+			interrupts = <111>;
+			#power-domain-cells = <1>;
+		};
+
 		uart0: serial@10000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x10000000 0x0 0x10000>;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

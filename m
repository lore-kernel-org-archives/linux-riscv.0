Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B469C77B73
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 03:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJ1MzOyhEKfMXaI2p5pKmr+fmJdKRtO4706KAQ5tPf4=; b=29h3LQx0YtdqQg
	gbfLtngMjHmF4+bwvcudfvLexcb+Ur6rSSXBk3xrqnoZG9FjizL2SKARLSDx2lPAi1eW+8Jc+qZJd
	eNmqiHqB5e2X+cVBTo5/wZBQRnQMFOSFc+bHTsS+E88v7ksko+4YHXnnzNKNR74K5uSGGvFHBcqUy
	REgyxOLf9gmN/3AbjrCzRCoPY1rrQUYcKwh2C5xrdXz2t7jWx8N+u+ML+jK7sutx69PEEjbKYi9kc
	IAHyBBWXf1SUO8msCqcu0U5V+IalafdDRbcq4KDxl75U/n1e417cC2lWp1X3gFtsqHba7bT9+n36W
	5cE/6cbgE41sKN3yr//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pphEp-009W60-2h;
	Fri, 21 Apr 2023 03:15:07 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pphEg-009W26-2X
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 03:15:02 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 07F0224E00A;
	Fri, 21 Apr 2023 11:14:34 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Apr
 2023 11:14:33 +0800
Received: from localhost.localdomain (113.72.144.253) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Apr
 2023 11:14:33 +0800
From: Mason Huo <mason.huo@starfivetech.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
CC: Shengyu Qu <wiagn233@outlook.com>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Mason Huo <mason.huo@starfivetech.com>
Subject: [PATCH v3 1/3] riscv: dts: starfive: Enable axp15060 pmic for cpufreq
Date: Fri, 21 Apr 2023 11:14:29 +0800
Message-ID: <20230421031431.23010-2-mason.huo@starfivetech.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230421031431.23010-1-mason.huo@starfivetech.com>
References: <20230421031431.23010-1-mason.huo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_201459_091865_940651AD 
X-CRM114-Status: UNSURE (   8.99  )
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

The VisionFive 2 board has an embedded pmic axp15060,
which supports the cpu DVFS through the dcdc2 regulator.
This patch enables axp15060 pmic and configs the dcdc2.

Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
---
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 2a6d81609284..cca1c8040801 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -114,6 +114,20 @@ &i2c5 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c5_pins>;
 	status = "okay";
+
+	axp15060: pmic@36 {
+		compatible = "x-powers,axp15060";
+		reg = <0x36>;
+
+		regulators {
+			vdd_cpu: dcdc2 {
+				regulator-always-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1540000>;
+				regulator-name = "vdd-cpu";
+			};
+		};
+	};
 };
 
 &i2c6 {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

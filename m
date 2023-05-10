Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36328C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 01:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xj6MMXxBEWfgnAU2OBDvVbP5vREei83y0DEWa+XWOLY=; b=oOtmNF88OYQoFs
	ukFM9IzVi8QuRO6XkghfBRnFPMCe4N2vCJ25uIEuUNbCjZShToUuCkXAp3FnRBd4MFBdebtA68rwP
	C0Jcv5tnvvrW133Y4BgfYD7Wjwi7O4DgXUdHMl2uyXim5KXJ1Z7ijX7X5Y4Cb/uaKYera/YRhT4dI
	izEW8zKw24Xcl5koxC4E2Ozg03jEs8AIfcb7qjxjA83h/ZV3sCAGCLn0nmiyCaZQ+sHFNI4bcdTeq
	/K8L35gpRMCmyOPONsmq1vCxenfTZ+SfVtLkOTeYboZ3Vqk5wxC9EoHZmRTFohJAXnsgPySFPIDjZ
	V+SL7nu+X1kkMEN4tcoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwZ1Y-004idN-1z;
	Wed, 10 May 2023 01:53:48 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwZ1U-004iaq-0U
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 01:53:46 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 33ECF7FFD;
	Wed, 10 May 2023 09:53:18 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 09:53:18 +0800
Received: from ubuntu.localdomain (183.27.98.219) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 09:53:17 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Walker Chen <walker.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 5/5] riscv: dts: starfive: jh7110: Add AON PMU node
Date: Tue, 9 May 2023 18:53:11 -0700
Message-ID: <20230510015311.27505-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230510015311.27505-1-changhuang.liang@starfivetech.com>
References: <20230510015311.27505-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_185344_356118_E630358B 
X-CRM114-Status: UNSURE (   9.33  )
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

Add AON PMU node to configure power. It can be used to turn on/off dphy
rx/tx power switch. It also can use syscon operation.

Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 4c5fdb905da8..d31257d4dcfc 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -486,6 +486,12 @@ aoncrg: clock-controller@17000000 {
 			#reset-cells = <1>;
 		};
 
+		aon_syscon: syscon@17010000 {
+			compatible = "starfive,jh7110-aon-syscon", "syscon";
+			reg = <0x0 0x17010000 0x0 0x1000>;
+			#power-domain-cells = <1>;
+		};
+
 		aongpio: pinctrl@17020000 {
 			compatible = "starfive,jh7110-aon-pinctrl";
 			reg = <0x0 0x17020000 0x0 0x10000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

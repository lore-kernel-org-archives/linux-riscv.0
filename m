Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E9FC77B78
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 03:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dP9K13deAiOZ6CwKrE87HANPbp/KcUjCVTNXW2lOjYk=; b=nvOi5zpGnaV0UY
	mtZ1hgEu4amiUm/g6HQm7lY+VFpLWiaXF7cFnNklGOEagAvB4BIW/bQHuZ948JeF1QNZOGAedilef
	MIgQzqgrJB/wBlGJAdxaiHGRUOG9DqYlzbzb/V6ihuss15/zZTlqUMb9IApgY/rb8JLvylp4SN3Ne
	zOJKHIM382ZEClIUncz3l32lebrBIXxFBPzmrVEINxQ5I3rH006rx/wj9npPUO934P5VhgQzOHsdK
	zsCwXf2hxX5aVuD3/roQj+CwCYC7yfbH+li+ZrF1dx6pbnTEXlm8YhTUnvOPXNPINMEXdPi+WLH5R
	7Sq4JJ8P45/UtRKG6hXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poywL-003vz0-1I;
	Wed, 19 Apr 2023 03:57:05 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poywJ-003vxb-00
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 03:57:04 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 488F124E246;
	Wed, 19 Apr 2023 11:56:54 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 11:56:54 +0800
Received: from ubuntu.localdomain (113.72.144.253) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 11:56:53 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Walker Chen <walker.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [RESEND v2 6/6] riscv: dts: starfive: jh7110: Add AON PMU node
Date: Tue, 18 Apr 2023 20:56:46 -0700
Message-ID: <20230419035646.43702-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_205703_199578_2E672138 
X-CRM114-Status: UNSURE (   9.12  )
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
rx/tx power switch.

Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 27f8ef37d029..3414edc877d5 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -509,6 +509,11 @@ aoncrg: clock-controller@17000000 {
 		aon_syscon: syscon@17010000 {
 			compatible = "starfive,jh7110-aon-syscon", "syscon", "simple-mfd";
 			reg = <0x0 0x17010000 0x0 0x1000>;
+
+			aon_pwrc: power-controller {
+				compatible = "starfive,jh7110-aon-pmu";
+				#power-domain-cells = <1>;
+			};
 		};
 
 		aongpio: pinctrl@17020000 {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

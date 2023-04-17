Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F30C77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 03:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5VR5Heegzq2mnMo2niPzEh4yDTvw+2zSuszeHJkBQxA=; b=brKsJxnPRGMvyA
	JjnUw0xB1C+FVcqa4ldDZGvTDcOG2I4VE7swSWCbYxab0cy5oEhDOuwIywfwo+1ITne3rhwsrgyn5
	ar3OUiBAqbo/r5H1CL0a+rYOSAjUjL26hCbAQq+z97CfcxWCdPdg7hgrZThtQCZc4Y2GGFm3poOPF
	pQ7BfD+dzRy/EmTb0NUqRl0kFSrPYKVQT6BC8q9AnHrBQkZUUumLGWjcG504tQ1lYMCQhY38O0Y7C
	yWNa/9ZgjLu7GtVD3nSl4ly82+zdgL6pTHEY5ZQjv/DXa7heRmmIicWLSYPmQesfzQbn6JyIsYJTW
	0+jjeky5HS8Sb6lXsV6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poFqr-00Enyi-0Y;
	Mon, 17 Apr 2023 03:48:25 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poFqn-00Enxs-2x
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 03:48:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 82D3224E1B2;
	Mon, 17 Apr 2023 11:47:30 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 17 Apr
 2023 11:47:30 +0800
Received: from SD-Server.starfivetech.com (183.27.97.249) by
 EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Mon, 17 Apr 2023 11:47:29 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Conor Dooley <conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Hal
 Feng" <hal.feng@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Walker Chen <walker.chen@starfivetech.com>
Subject: [PATCH v1] riscv: dts: starfive: Add PMU controller node
Date: Mon, 17 Apr 2023 11:47:28 +0800
Message-ID: <20230417034728.2670-1-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [183.27.97.249]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_204822_115728_A5B66436 
X-CRM114-Status: UNSURE (   9.07  )
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

Add the pmu controller node for the StarFive JH7110 SoC. The PMU needs
to be used by other modules, e.g. VPU,ISP,etc.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
This patch is based on:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=riscv-dt-for-v6.4&id=60bf0a39842eb042bbdc4539285c7e524011fc2d
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 4c5fdb905da8..30e1f34d5cf8 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -496,5 +496,12 @@
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFA4CA0ECA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fLzqQGWFPvkwySk5wormh1XtD7x0DFCBiQ65RlSIZgM=; b=oAysC6LoWExAOB
	Hn3eoVxTnK60w91J+LqFjmPEB2m6PsI9LRkRAUbfj4w/BUozlhJSRT5fEjF/o8uy4UFRygka5djzQ
	ANeV1nyeeNWYACzwQMNSP04a9sdPm5s3/cL+PIaooQySnK5fjPvLWSntSOKPPvgok6lj4126ZzWfx
	FCTAS2XD4r5yy0OVOHvtfRr8sGLmSdn8rryGIrfzwrk2T210uYesJO3u+EWf4xeXoEw9KnowlLkRO
	25uJyPLFSh6eZ45JbbgMZbCBH/8eS70w4RjKKjzPYSmHTrOCUY8mB7INZ7VoOwIvoP08DuA4UfoIG
	0zuVibq8lxdjkbL3HOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyXf-002XTa-0n;
	Tue, 12 Sep 2023 08:14:39 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyXb-002XOU-1x
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 08:14:37 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A64DA24E2FE;
	Tue, 12 Sep 2023 16:14:03 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Sep
 2023 16:14:03 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 12 Sep 2023 16:14:02 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-mmc@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, William Qiu
	<william.qiu@starfivetech.com>
Subject: [PATCH 1/3] dt-bindings: mmc: Remove properties from required
Date: Tue, 12 Sep 2023 16:13:56 +0800
Message-ID: <20230912081402.51477-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_011435_824033_5488F89A 
X-CRM114-Status: UNSURE (   9.58  )
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

Due to the change of tuning implementation, it's no longer necessary to
use the "starfive,sysreg" property in dts, so remove it from required.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
---
 Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
index 51e1b04e799f..553a75195c2e 100644
--- a/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
@@ -55,7 +55,6 @@ required:
   - clocks
   - clock-names
   - interrupts
-  - starfive,sysreg
 
 unevaluatedProperties: false
 
@@ -73,5 +72,4 @@ examples:
         fifo-depth = <32>;
         fifo-watermark-aligned;
         data-addr = <0>;
-        starfive,sysreg = <&sys_syscon 0x14 0x1a 0x7c000000>;
     };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6139C07CA9
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 01:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GyOcz9tX3oI4zbqwYhTpBQIp54Rd3087SYldlv9mFag=; b=df4OAd7HQCQbhY
	7ulMEGEFvx09xoCOgXuBigJNLGH6EvzLXVg6/RCEPBBVmCcAKMt2oACbNrVPdiIA3KnYrLyoMYetb
	psxTjVyvWPgEnhvXCg5h6PqhQnsKMzmIwh9rqZ6P+7eUGMgUq4fYW95SqTORW6clC6FaLwacaZrCp
	yg62EHh1bJuBq4gqdApcDU0zlGwwXMEYzPuE1Yef0WwPz+5ZJoTsBHnSPE6dOHSFBuAhzPerm69Le
	GrFMndZnCxsbAQftwAB7cMXMHioxQgNZu+VZuUHOdTcxsqb3KBaZ/r61XNK2A1vOav5rDFHrpith/
	1pvIXYoR2SbWVb+de1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7QYS-000IZf-13;
	Mon, 27 Nov 2023 01:36:56 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7QYQ-000IQG-0K
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 01:36:55 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A75607FE2;
	Mon, 27 Nov 2023 09:36:33 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Nov
 2023 09:36:34 +0800
Received: from jsia-virtual-machine.localdomain (202.188.176.82) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Mon, 27 Nov 2023 09:36:29 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<conor@kernel.org>, <kernel@esmil.dk>, <robh+dt@kernel.org>,
	<emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>
Subject: [PATCH 5/7] dt-bindings: xilinx: Add StarFive compatible string
Date: Mon, 27 Nov 2023 09:36:00 +0800
Message-ID: <20231127013602.253835-6-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231127013602.253835-1-jeeheng.sia@starfivetech.com>
References: <20231127013602.253835-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_173654_350068_F5FFE3BA 
X-CRM114-Status: UNSURE (   7.21  )
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

Add starfive,jh8100-uart compatible string

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
 Documentation/devicetree/bindings/serial/cdns,uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index e35ad1109efc..254373cb1ac7 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -20,6 +20,9 @@ properties:
         items:
           - const: xlnx,zynqmp-uart
           - const: cdns,uart-r1p12
+      - description: UART controller for StarFive JH8100 SoC
+        items:
+          - const: starfive,jh8100-uart
 
   reg:
     maxItems: 1
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

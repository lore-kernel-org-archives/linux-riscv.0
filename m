Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1851FC3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 03:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8BZ1kAsiC2dUMvut/4ZxqFltvAEDGbQPBbU7aB5XAzs=; b=dx/E+1FtSctOqz
	NcYUhz2qw6svfjrvY9Euim7MlPs9CnrqD5C2pOX1Eev7G75OEk6NWPbzngmdaMrpI5EoPoZ/xICrh
	fKVngda3r2xggroSyd3y8GAGbMIhURxRRmkdni8mQjfw3aOmMfbxuLxisznXyDnrOrlW6xCQi2p9B
	uE/YjZC6IxML16f4p483NYTfCk/8kF35YrN2qAFFC3WNDKv7sq3l9qRAD0hqt9I4WmDC/+lb6bjbo
	6DGzDIDcmuHQLuLSI2gyXwUbFOWG/WX2vel4aegg54UO0K1T3f4aY4hM12Cnr3C9EkdShnAqvp3Vf
	0sibXDWIKh+kgtnjQFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDcyS-00HMfG-Tn; Fri, 06 Jan 2023 03:00:52 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDcyQ-00HMOx-1d
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 03:00:51 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9130B24E1D3;
	Fri,  6 Jan 2023 11:00:05 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 6 Jan
 2023 11:00:05 +0800
Received: from wyh-VirtualBox.starfivetech.com (171.223.208.138) by
 EXMBX173.cuchost.com (172.16.6.93) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 6 Jan 2023 11:00:04 +0800
From: Yanhong Wang <yanhong.wang@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: [PATCH v3 2/7] dt-bindings: net: snps,dwmac: Update the maxitems number of resets and reset-names
Date: Fri, 6 Jan 2023 10:59:56 +0800
Message-ID: <20230106030001.1952-3-yanhong.wang@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230106030001.1952-1-yanhong.wang@starfivetech.com>
References: <20230106030001.1952-1-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_190050_271877_BF4613B0 
X-CRM114-Status: UNSURE (   9.77  )
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

Some boards(such as StarFive VisionFive v2) require more than one value
which defined by resets property, so the original definition can not
meet the requirements. In order to adapt to different requirements,
adjust the maxitems number definition.

Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   | 36 ++++++++++++++-----
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index e26c3e76ebb7..f7693e8c8d6d 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -132,14 +132,6 @@ properties:
         - pclk
         - ptp_ref
 
-  resets:
-    maxItems: 1
-    description:
-      MAC Reset signal.
-
-  reset-names:
-    const: stmmaceth
-
   power-domains:
     maxItems: 1
 
@@ -463,6 +455,34 @@ allOf:
             Enables the TSO feature otherwise it will be managed by
             MAC HW capability register.
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jh7110-dwmac
+
+    then:
+      properties:
+        resets:
+          minItems: 2
+          maxItems: 2
+        reset-names:
+          items:
+            - const: stmmaceth
+            - const: ahb
+      required:
+        - resets
+        - reset-names
+    else:
+      properties:
+        resets:
+          maxItems: 1
+          description:
+            MAC Reset signal.
+
+        reset-names:
+          const: stmmaceth
+
 additionalProperties: true
 
 examples:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

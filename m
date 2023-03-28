Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD28C76195
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 06:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bg4ZQat/ruvKhcye6CcOEi5jGIQKDib5pvX0Yo3G++g=; b=wtd7TvdDAEa19y
	FDIkXXpmGOAKH8HVEGd1+2WvgLVS6R3Hcveu8zJECiwWvYW0k+t2rqLsQJ1pN2FP24YKa6zhgT2Nw
	/QDyogYdBi6ncIDOrJUI3t2qJR7FyXBniwrcrUa+sSV0+0v5DVawb0FCFUB7gdx3c+sPTneLFOlOr
	yEn1+UZnx3tPHywEKAradl1zPIJTyzbcnEoSXx9WxuNLkriPDacxB+cPViyJeMsjnyH0315NRMTKC
	KlCPUuIamM37Ao73y9EQP4gh64WFvFipFrCuG2f9u0lH+Y4aVWPphQPYLeR/3gLXoCg8azzlvnxNK
	rylFagzugXzjmuZpavmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2hb-00DIJi-2B;
	Tue, 28 Mar 2023 06:21:03 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2hX-00DIDV-0H
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 06:21:00 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id ABF3B24E2C5;
	Tue, 28 Mar 2023 14:20:12 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Mar
 2023 14:20:12 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX162.cuchost.com (172.16.6.72) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 28 Mar 2023 14:20:11 +0800
From: Samin Guo <samin.guo@starfivetech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Jose Abreu <joabreu@synopsys.com>, Richard Cochran
	<richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [net-next v9 1/6] dt-bindings: net: snps,dwmac: Add dwmac-5.20 version
Date: Tue, 28 Mar 2023 14:20:04 +0800
Message-ID: <20230328062009.25454-2-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230328062009.25454-1-samin.guo@starfivetech.com>
References: <20230328062009.25454-1-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_232059_321025_D3C5B297 
X-CRM114-Status: UNSURE (   8.04  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

Add dwmac-5.20 IP version to snps.dwmac.yaml

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 16b7d2904696..01b056ab71f7 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -30,6 +30,7 @@ select:
           - snps,dwmac-4.10a
           - snps,dwmac-4.20a
           - snps,dwmac-5.10a
+          - snps,dwmac-5.20
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -87,6 +88,7 @@ properties:
         - snps,dwmac-4.10a
         - snps,dwmac-4.20a
         - snps,dwmac-5.10a
+        - snps,dwmac-5.20
         - snps,dwxgmac
         - snps,dwxgmac-2.10
 
@@ -575,6 +577,7 @@ allOf:
               - snps,dwmac-3.50a
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
+              - snps,dwmac-5.20
               - snps,dwxgmac
               - snps,dwxgmac-2.10
               - st,spear600-gmac
@@ -629,6 +632,7 @@ allOf:
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
               - snps,dwmac-5.10a
+              - snps,dwmac-5.20
               - snps,dwxgmac
               - snps,dwxgmac-2.10
               - st,spear600-gmac
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3465C77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 10:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1/tSkDteoWnHYpMEtp+507zbwQE6nYpAXa3Sam1QoY=; b=cudw1ybTUdIFig
	J2U+4pcz5UUWUPJYwnGH4N3GO3MqcNewAORew3cZIEykgc7tUHF8xhrH40Zf+Du5WiYLtYcdJvMbL
	uXTiV0xJrTXJqU4BHjO4VdKp6jqiHNBvYY8K1w7n0t6XHlwZVGF0U+lIBn4lkNpXQZ1O4D9g8HWSc
	4/Xd0YRWuvdHUVn4Kl9p27aDJ05uCICn2Z4booUzcRfJouEyLAG3Yh2b3CgZziM8rAfvJcpkDaQRu
	HlHqVTaW9wrXPs3m73Gi4pVx+65jieD5vRVDhXwFl/Uepi1DZXnw8SYTUaDP/GycKWHn75tS0Yiys
	d/d6qE3PFlyyiTKsQ3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLhq-00Ff5k-2p;
	Mon, 17 Apr 2023 10:03:30 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLhk-00Ff1C-1D
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:03:29 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1A0D324E287;
	Mon, 17 Apr 2023 18:02:57 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 17 Apr
 2023 18:02:56 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX162.cuchost.com (172.16.6.72) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Mon, 17 Apr 2023 18:02:55 +0800
From: Samin Guo <samin.guo@starfivetech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Pedro Moreira <pmmoreir@synopsys.com>, Richard Cochran
	<richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Samin Guo <samin.guo@starfivetech.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [-net-next v12 3/6] dt-bindings: net: snps,dwmac: Add 'ahb' reset/reset-name
Date: Mon, 17 Apr 2023 18:02:48 +0800
Message-ID: <20230417100251.11871-4-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230417100251.11871-1-samin.guo@starfivetech.com>
References: <20230417100251.11871-1-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_030324_551875_5CE30F15 
X-CRM114-Status: UNSURE (   9.30  )
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

According to:
stmmac_platform.c: stmmac_probe_config_dt
stmmac_main.c: stmmac_dvr_probe

dwmac controller may require one (stmmaceth) or two (stmmaceth+ahb)
reset signals, and the maxItems of resets/reset-names is going to be 2.

The gmac of Starfive Jh7110 SOC must have two resets.
it uses snps,dwmac-5.20 IP.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml          | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 01b056ab71f7..e4519cf722ab 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -133,12 +133,16 @@ properties:
         - ptp_ref
 
   resets:
-    maxItems: 1
-    description:
-      MAC Reset signal.
+    minItems: 1
+    items:
+      - description: GMAC stmmaceth reset
+      - description: AHB reset
 
   reset-names:
-    const: stmmaceth
+    minItems: 1
+    items:
+      - const: stmmaceth
+      - const: ahb
 
   power-domains:
     maxItems: 1
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

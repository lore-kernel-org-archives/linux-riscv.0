Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE3DC6FA92
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bh4D0O1AmlO8IfrOYCRJISZvA7EPFzD9nZ1cBBCFAA=; b=ersgD9pKrZb149
	fVLdY+srRyL8Bx8HzVksM18z7bOtXOApTwW+KWQiBaiHg0Hs5Tpyl5E0zjVtGtXSMI6Quz656ap97
	2Uiy909h4SJJSZqm1T/BAzPh8F8rVWjCu7sqWfsKQLYh9kQk3mXBMbsBrlOWcJ+gjiWfXZuD44I7w
	n3pe9AIrCVO6XirdevmJRhT8DhdM3mQVboCOKSlcvHWKslShjgLht5F3yFjmeSQUS4hcf4q7JbLG3
	Oi/D6oLwr+8wK70yanqamp6h2swhYkF6iLFGEF1eNZ0fANR1aAqlxvQSp9nSmo6IGwY45jZG9Nm/3
	yDEGt4f3dydU+hdpfTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8dG-00A9vR-9D; Tue, 27 Sep 2022 11:20:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8dC-00A9rQ-0j
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 11:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664277606; x=1695813606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6ALKWpCaagUTxOHH47NBdfK1d2p+/P9sFklIuGHcqd0=;
  b=twUIq3/6cBsngcDGmgMIZUlVUC8tdoxm6wGhCq6ennXWBqqF3T6KgIlu
   leA5fI6sPO+d7G6/2VGZ9uKpXFyNpWjzJyK8MUBBYi85/McOSRI+vqWF0
   +kLKXeBu9El9VBQxpARIyYX7bttwVVcvV5cICNGTeDGdOvDpZ4ZQICPzr
   jZ5iGPvgD8gjyv1rhLKfJW83UC+PwnSEuaKj9SzKXY7oHj1ZitSKjh4t+
   sG4pigvo9JrZYtInuyc3FXuvenfrLpVjhRWbKjzz1W6Nj6xIMbkbvuA5F
   PJ1tQn1JMKRUQslWGwspAkm7SyLtBUWOQJn2vCJ1RqzSjXfsTIrjcp93R
   A==;
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="182125421"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Sep 2022 04:20:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 27 Sep 2022 04:19:59 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 27 Sep 2022 04:19:57 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, Hugh Breslin <hugh.breslin@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 01/11] dt-bindings: riscv: microchip: document icicle reference design
Date: Tue, 27 Sep 2022 12:19:13 +0100
Message-ID: <20220927111922.3602838-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927111922.3602838-1-conor.dooley@microchip.com>
References: <20220927111922.3602838-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_042006_126688_98F4DF1A 
X-CRM114-Status: GOOD (  10.66  )
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

The icicle kit reference design's v2022.09 release made some changes
to the memory map - including adding the ability to read the fabric
clock controllers via the system controller bus & making the PCI
controller work with upstream Linux.

While the PCI was not working in the v2022.03 design, so nothing is
broken there in terms of backwards compatibility, the fabric clocks
used in the v2022.03 design were chosen by the individual run of the
synthesis tool. In the v2022.09 reference design, the clocks are fixed
to use the "north west" fabric Clock Conditioning Circuitry.

In the v2022.10 release, the memory map on the DDR side is also
changing, so to avoid making a breaking change here twice, jump over the
v2022.09 release and straight to the v2022.10 one.

Make use of a new compatible to denote that v2022.{09,10} reference
design releases are not backwards compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/microchip.yaml   | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 1aa7336a9672..5c1ad2108049 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -17,12 +17,18 @@ properties:
   $nodename:
     const: '/'
   compatible:
-    items:
-      - enum:
-          - microchip,mpfs-icicle-kit
-          - microchip,mpfs-icicle-reference-rtlv2203
-          - sundance,polarberry
-      - const: microchip,mpfs
+    oneOf:
+      - items:
+          - enum:
+              - microchip,mpfs-icicle-reference-rtlv2203
+              - microchip,mpfs-icicle-reference-rtlv2210
+          - const: microchip,mpfs-icicle-kit
+          - const: microchip,mpfs
+
+      - items:
+          - enum:
+              - sundance,polarberry
+          - const: microchip,mpfs
 
 additionalProperties: true
 
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

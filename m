Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF27C6FA8A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 11:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ux6o4dTt4McF6An8cUyun3P4Yp0A/3RYjNdd5ckLYa4=; b=WabRyVYcoV16NY
	GEU7Hxcf8tyf9giZ4R71mF0IhJu6FTbOtDKgFjjgJAD8vFIl0ochkZefx0xQWpxdwB0ldmdQtyXgA
	LFOrlet4qmMVp7TqEaM0UO5QdTIxggUiugGx+ynp2bolZ9ENVX07GUttxBgojXH1UV4S3pkH7rnDc
	pZ5932drRF1/fK1cRNIR8oyfuIkRY7vfsrMflxkKMlbPxrKaYtmlQui5W7nCI2UhdLe5eB2Fe4aTw
	0P+VublZtfCfm6McM/vdhfHjEVNYX81XhbAILOVbgyoK/5idxUUHCeiDdWo2oKqib4tU8YmW0UkOT
	O8rnsMB1nc/7h0oCEYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFXw-002dWw-6g; Thu, 08 Sep 2022 11:18:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFXs-002dSi-0Y
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 11:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662635887; x=1694171887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jmjzFPLTzirPRRdjytSXcGvB/NkyTEAOoOOffWQqE6s=;
  b=v5mWzuN0xnEXvn0pohnF0DwmrztOitCRf4RBDgStH8YAv+OnFAYgxUeT
   aI4TR6QtsHqWdi2frv1IDx/Dfe5bqcY51okK/GMIFMJhDkSodFRMAu/ei
   ZPzShJCtzKh5Xki/GpEOVPkWlHwz9NXANoqpFJFSQG0bkseC22/tvjfcf
   LdFw1F/Wf4ghs7A1NQ/i3g9TmM3AfaIzSdf0V+m1mLWdjS87hXZKrLDEs
   FcWJ8TJTjuSFIozJ0ECoT+JJr6LmMrkfXxLle6Efrcj28bqLjMVX+ykK4
   YvPALH0xPyMMJOyCninzXPEzlMQJu67mtRXHbWFtZnGQuPwhrLRzOTEWo
   A==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="112724601"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 04:18:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 04:18:01 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 8 Sep 2022 04:17:58 -0700
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
Subject: [PATCH v4 01/10] dt-bindings: riscv: microchip: document icicle reference design
Date: Thu, 8 Sep 2022 12:17:04 +0100
Message-ID: <20220908111712.665287-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220908111712.665287-1-conor.dooley@microchip.com>
References: <20220908111712.665287-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_041808_134494_7819A4E8 
X-CRM114-Status: UNSURE (   9.48  )
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

The icicle kit reference design's v2022.09 release,made some changes
to the memory map - including adding the ability to read the fabric
clock controllers via the system controller bus & making the PCI
controller work with upstream Linux.

While the PCI was not working in the v2022.03 design, so nothing is
broken there in terms of backwards compatibility, the fabric clocks
used in the v2022.03 design were chosen by the individual run of the
synthesis tool. In the v2022.09 reference design, the clocks are fixed
to use the "north west" fabric Clock Conditioning Circuitry.

Make use of a new compatible to denote that this is not backwards
compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/microchip.yaml   | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 1aa7336a9672..485981fbfb4b 100644
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
+              - microchip,mpfs-icicle-reference-rtlv2209
+          - const: microchip,mpfs-icicle-kit
+          - const: microchip,mpfs
+
+      - items:
+          - enum:
+              - sundance,polarberry
+          - const: microchip,mpfs
 
 additionalProperties: true
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

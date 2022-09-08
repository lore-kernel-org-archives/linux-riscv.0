Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305B9C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 11:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3etXuJUlKWMxLHfn4Es6AwD/fhIQe5oSoUdrIOz9JZQ=; b=r6OjwQwg49a1uG
	zvR+pKiLv/DF8CHFEebM4J57P5C/rfQLc28VJ8UIYt5qFcLUOKObE+8Cp5c+e2r1ciM6933Zf6gkX
	EHo2m+wAgFgqCj5R7cS1RTryxcU7UiUMOZSmUy0Zh7wuNGcbgeiVrOgQq8z6PzrRCrsrmW7C6IHlG
	XwIqLB7XSSJb+9IRNiHVkhlOSJ3WnpNzg8y8qJqNQRAwzcusBSZ0cNtZz62+FLBzTorV8NRJVG0cX
	2ZDjbWNvHhcvWHubHDunZeW7iiWBhUV7++Vrm79TOew0CFTS76Sjd5pEITW34E1UXm0J6VAQH6wiF
	9SUW057TQ2glP/L0cSuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFXz-002dZ2-LI; Thu, 08 Sep 2022 11:18:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFXv-002dWH-Ks
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 11:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662635892; x=1694171892;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VqcEjdujxakv3noDHpoHtBuaB79FIa784j+2h1ikqjc=;
  b=cgZKy+i1w6vSCHtWcsFAsRWmMMaY/sFz0WJLwQhf7dU1cm7wczFKawKb
   4E0w5mX5GAYpjyfaLcUqzj70aXJl3n2E5pMVwkE5CeaTwOe+Efe1mjVsk
   +jndXwmwhSp1WBA9YOjGUjV1E7xT4SFriskgM09IYjJ2togncuZrn/63i
   WEY6WnPDxFUIr+9ST7AaT+fmcFzt2AUcEB9OMnyNC3s28Bo+1QODGamUQ
   WezAh9QtRBPriQKek83cSiSYmr6nGj5kc8U6wDmDDRKsZuJ0qfGXAfo6Q
   uf8HDVKffKXYI7WCMD6LJcz2ZPs+SVCYW5oWmAa2+cacLIq0OW+Uf371b
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="172932944"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 04:18:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 04:18:07 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 8 Sep 2022 04:18:04 -0700
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
Subject: [PATCH v4 03/10] dt-bindings: riscv: microchip: document the sev kit
Date: Thu, 8 Sep 2022 12:17:06 +0100
Message-ID: <20220908111712.665287-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220908111712.665287-1-conor.dooley@microchip.com>
References: <20220908111712.665287-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_041811_770655_61E575C5 
X-CRM114-Status: UNSURE (   6.32  )
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

From: Shravan Chippa <shravan.chippa@microchip.com>

Update devicetree bindings document with PolarFire SoC Video Kit, known
by its "sev-kit" product code.

Link: https://onlinedocs.microchip.com/pr/GUID-404D3738-DC76-46BA-8683-6A77E837C2DD-en-US-1/index.html?GUID-065AEBEE-7B2C-4895-8579-B1D73D797F06
Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 630f82c85a0c..ab0a64cd5386 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -28,6 +28,7 @@ properties:
       - items:
           - enum:
               - aries,m100pfsevp
+              - microchip,mpfs-sev-kit
               - sundance,polarberry
           - const: microchip,mpfs
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

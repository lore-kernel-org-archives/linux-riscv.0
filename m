Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EE1C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 11:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcEyV8aJQT4G8htO0Kqp3rgSpTcvvGCgCEK/cjDfuqM=; b=OzX7W65mRtdEnP
	S7kmM1G2qhAqu/ECzqagEUouzMjx+93GV34RvOZmH9AuZ9TOHMvFMJHHpeJOMXK+mMurqO3BTJNhX
	d9QkCE3pOTFrPsx1eGyyi0tgj4lLkYfIBW2+nWVV3eoVlK9AVzOK07UYz4fxHBS/OdycARZv7bJ8J
	XUaBRidXdq8Lx+7LoutOtZigI1D27QbzpRlpUkPSyHJY8wcACoO9wW6zqdRd5u0+aku06P0YgMV2U
	aAM/jIyYUnXEhq9tuTwk9G3ijBpDYamJ1UKuV4SNXCztVxd0/Ke7jeAK72EQ9OD+yIGGBNfHCz7F6
	ZldvcyRvu2HbFzwpGVKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8dJ-00A9x8-JL; Tue, 27 Sep 2022 11:20:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8dD-00A9tu-Ak
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 11:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664277606; x=1695813606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fQJ1JnPi+K+cO2rIgBAMjqRRagg+fMzWNyG9+bWipSQ=;
  b=BCNA2HFnGJvaBDnG/TsmcPSTb+If+FRkkYxtvrZZDwblex0qM3VaUHv8
   eBZ3Fco19TYCCiLkov6UgIQGA+I6gLkbMlNwMYQidCmuQsoE2MFw+9LYy
   gvm49GV+BSKEnvzwu1ayTqvQVHiB/CmSSeNEpwMNvzlq2GPzXMcXz/YQQ
   Jn4pgVqGMhuYBEB4llj9qpUyfMM+WQUvTUYa/DQaVPuc+p80y/fhGPJeS
   Umof1mrYWWy7PbVJLhtvsq44iGJ66OYRRdCPu2RuBWIXQiGglnouDZ+sP
   EQ1WBiaN9lvc5DfHhhUvRf+Jo8Rek3qfkvQ7OTW8Mf6ZUlwss7fsOc1HH
   g==;
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="115596039"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Sep 2022 04:20:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 27 Sep 2022 04:20:02 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 27 Sep 2022 04:20:00 -0700
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
	<linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v6 02/11] dt-bindings: riscv: microchip: document the aries m100pfsevp
Date: Tue, 27 Sep 2022 12:19:14 +0100
Message-ID: <20220927111922.3602838-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927111922.3602838-1-conor.dooley@microchip.com>
References: <20220927111922.3602838-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_042007_446357_986DB64F 
X-CRM114-Status: UNSURE (   7.12  )
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

Add a compatible for the Aries Embedded M100PFSEVP SOM + EVK platform.

Link: https://www.aries-embedded.com/polarfire-soc-fpga-microsemi-m100pfs-som-mpfs025t-pcie-serdes
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 5c1ad2108049..681cedc5578f 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -27,6 +27,7 @@ properties:
 
       - items:
           - enum:
+              - aries,m100pfsevp
               - sundance,polarberry
           - const: microchip,mpfs
 
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

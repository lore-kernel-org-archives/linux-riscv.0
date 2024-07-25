Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CC1C3DA5D
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m17uP35rbTujex5mhiAW32YegwzRnGXunVJ4emfUMDA=; b=0AXqFOwrQz4r6X
	HetxH7ji5HriPx9g+uHUE76DbYMSlI4o6lJjgbbZclQcvsHfByC2L3ZUJAbdd94Or9HrjOJPqpyvk
	u2lz850aLFpU0JTXjsu49s/LDbgvdK1whRkSMQ5bwW1eKewKQYV19vYu5zhqGhosGesWzYiu9iKvk
	w3W/V/9ArOhSM8pE0nIaUObNikVDCewIzcIk6H+5a/39dvEbzHsWdj1Z4unl7On8NOnfblMpEdXf8
	RTUYNyAW0q5fD/uJDONk5bnOzVh0xzdL3GPft4NjMiv5Ola47FsdvKYo8EZXG5+JSM4PvLAUUxSGc
	VW41IFzMAdxrpxWOTsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyYb-000000015nW-2TVE;
	Thu, 25 Jul 2024 13:30:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxPS-00000000sU3-1Azn
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 12:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909846; x=1753445846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mY+VBekkdvm3m8aKNmi+5EnKvkkTMNNxWaHfQKqjgA8=;
  b=zqLlA4K1tFLQEgisVodY2CPx222rpNmlF4Yacx64TgLTXFZLccc8r7HI
   +KMlbQkybl9fXrgsvbVtVs86PmGnG+SQxUxoBqueiui5K38qXALwkstPq
   Ai5r6ZdIF1Mosq/9W0Yr/C7II+Ik5gWqEdByrZ0Kwub3v7NL/xDOt5MCe
   Hx0HqEsoAho0UTgUxOmosDMNjZkfWWKAAwI0NkcCbL1cliwTT5egljzq9
   vwRzXsstFRSEoDP0U/dGZlWOAkDg1Eqo+3xLgNr2fSd0VLuSLrgtzZbke
   MDrTwat4qkvpnKREflAkXCrUQ4uBQXaSqe3CW8+nLWCWnpbqDZE5aL3rD
   w==;
X-CSE-ConnectionGUID: Ik2C1p0ARZK1eWHd58n+Yg==
X-CSE-MsgGUID: 39dLW3JoSpiXV3qQ258VjQ==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="32460679"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:17:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:54 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:52 -0700
From: <pierre-henry.moussay@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 14/17] dt-bindings: soc: microchip: mpfs-sys-controller: Add PIC64GX compatibility
Date: Thu, 25 Jul 2024 13:16:06 +0100
Message-ID: <20240725121609.13101-15-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_051726_354601_1F3D206B 
X-CRM114-Status: UNSURE (   8.38  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX is compatible with mpfs-sys-controller driver without additional
feature

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../soc/microchip/microchip,mpfs-sys-controller.yaml        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index a3fa04f3a1bd..af89d5959747 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -24,7 +24,11 @@ properties:
     maxItems: 1
 
   compatible:
-    const: microchip,mpfs-sys-controller
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-sys-controller
+          - const: microchip,mpfs-sys-controller
+      - const: microchip,mpfs-sys-controller
 
   microchip,bitstream-flash:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

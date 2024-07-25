Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31479C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H5OIz+B0QVgivVue7JJVdHj+UWThnNvGaV1T+Gp5hkg=; b=xQtByGfCRgDggu
	Ezls6oNF35Ej39nx6wLNLD2yI+p3BhCycONH7pjXq1ZJbkvMqZrxdUKMCTVaT224qXUw6wekiSlRY
	w4RzzdP/dyLmxZMbWAcldX5M+M1hCWtl3KM50vTC9ErSBm9ZbVHA5K8t37XBdUKDu0euvrX6IYaSd
	mxgsegsu+vxnSY9/ELECFEvt7wmoVQzjH/V/mcwIevMAEUrwBtvYSSDxfceV1GSQSiwDxu+M6lKbI
	MKTbf3sWeAZKsVUMAfX3vvlAqtTqd2mIJ1gp9RNFRLAyASQcm5tpEeKpw5dZj8LV1cbLOVc8u1c7V
	u3ZsBPReOGOjwkffCknw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyYS-000000015fr-0SF2;
	Thu, 25 Jul 2024 13:30:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOW-00000000sGF-0jZu
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 12:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909788; x=1753445788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IuLnJUzwlgwiToJliiZ0CWSCmv+ilC3gJ0pkOAB6b30=;
  b=Iozl3EZLK40CiwEyjHTUla0FyMQzbqvnPvcbQzaRKtIpFr4m7jkA0ria
   TBCrrIwvHT3iTWSuLsV7X3nWgp9mCOqeb376u5jygTPZSscwExPe3C0C7
   amBaZVmcq9CrFxpLiNAJtDlr49vRPm2Fg4Oy5VCeD+F4Q9lu15Nl5qO65
   YXZgKH6Ko19gVW2/U8ZJv+g560YVGUGnBtYAg2y/j/gyUNprLZQXiCphv
   mRWFCfVURh7zSy3dOTaQ0QfG88Re+hhozsack3+gF10CXY/R6lLLOCNIX
   esU7ow9vr8bEr40noh/vrA2U4uRPTOqMQiD0TifrRATu+RtcdX1d0Xxr7
   w==;
X-CSE-ConnectionGUID: 8P89o1u9RvODQlJQJtKtAA==
X-CSE-MsgGUID: TMXqueRhR9229FVpXO3kBA==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="29678846"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:17 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:14 -0700
From: <pierre-henry.moussay@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-can@vger.kernel.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 01/17] dt-bindings: can: mpfs: add PIC64GX CAN compatibility
Date: Thu, 25 Jul 2024 13:15:53 +0100
Message-ID: <20240725121609.13101-2-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_051628_269810_D0E8E4DC 
X-CRM114-Status: UNSURE (   9.28  )
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

PIC64GX CAN is compatible with the MPFS CAN driver, so we just update
bindings

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../devicetree/bindings/net/can/microchip,mpfs-can.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
index 01e4d4a54df6..1219c5cb601f 100644
--- a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
+++ b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
@@ -15,7 +15,11 @@ allOf:
 
 properties:
   compatible:
-    const: microchip,mpfs-can
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-can
+          - const: microchip,mpfs-can
+      - const: microchip,mpfs-can
 
   reg:
     maxItems: 1
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

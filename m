Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95B1C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 08:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBlhwIA52wLjX4HLMK058QFOKmmjgmR9jpfXfXx6YmQ=; b=JKj79+SwXKvGuO
	/dl79NPpFwKlFdB+rIkiMuNpaFYSwq5rkf95+MO4PxoSbeRxC7ypx3bEwX5WbXt4aGbfYWfZ2BnRV
	x8j3s7sSVf7mcn3P5CLmIgw0yZwA4BhNg4N7+9t9UOhS50/KqzFwpTzKQztDVNl3eqAuL05g0QQb4
	dYG7iqiyb4/Og8KSaW/ZDk404bquSVED5x4pX+ssWObKxIGlaN3pj8W/wXnXTGOx2niDfb6kG3ZbF
	i4seR4Mlu97PZWSlSqCSHWGimGEODD0Gshf5bbL8Iqj91JXf6HGfCg/Cbv10Tz8xSZrb3h8ebHyoy
	LBXmt7Qo8641ixm47JzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pDB-00FujR-Jh; Thu, 30 Jun 2022 08:07:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pD6-00FuhN-5i
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 08:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656576456; x=1688112456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cI1dqkKKIpK4yOXV3RMLwr1JkszHV2K1qB9S3WRpgzc=;
  b=Z2B6gyECfWG2blMPuX8EANbDyILdIAMl2ATm84NlIvdoftjYtlyf6p47
   SpXXLchLWJO4AHNtvTtMIEA9kUxTe0x46Lg0y+QnxmAyJ9+CT123j+aw9
   JoZmr6ZhQ5gFhbIJ71ourWwOaUueCkgkZszyC5lUcE8AvEezsem30RpTA
   Qj3dBawyiPfooZYlYYG24BIJO0Fr+9aI7ePJpgY5+9I2kUNIqIS/azIMB
   DDS1wfnEKL4IhR+J7a1JmpP80IrKORHoWO4E8nI6q7ZSyAdN7RBoyJ22Y
   XkJ0zKq1Sd5PBsz/q9hwQSDJrnx/leZexfQ/u/+VNlVDN7CPXhOpgnh9e
   g==;
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="165782000"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 01:07:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 01:07:33 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 01:07:30 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"Daire McNamara" <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v1 02/14] dt-bindings: net: cdns,macb: document polarfire soc's macb
Date: Thu, 30 Jun 2022 09:05:21 +0100
Message-ID: <20220630080532.323731-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630080532.323731-1-conor.dooley@microchip.com>
References: <20220630080532.323731-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_010736_351556_F13C3A83 
X-CRM114-Status: UNSURE (   6.83  )
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

Until now the PolarFire SoC (MPFS) has been using the generic
"cdns,macb" compatible but has optional reset support. Add a specific
compatible which falls back to the currently used generic binding.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/net/cdns,macb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index 86fc31c2d91b..9c92156869b2 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - cdns,at91sam9260-macb # Atmel at91sam9 SoCs
               - cdns,sam9x60-macb     # Microchip sam9x60 SoC
+              - microchip,mpfs-macb   # Microchip PolarFire SoC
           - const: cdns,macb          # Generic
 
       - items:
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

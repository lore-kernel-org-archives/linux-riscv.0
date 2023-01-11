Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC58CC5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 12:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/fhjyhusjDg9G98BD6/PGQUQ1P9Va99YR8cA9nHs+M=; b=wiTFV0/VQhVabX
	SI0+Ojcnj4p7QjDngDSMzq7SvY5rMEEz8hWS9xxHDaU7LuMOxmr02goLV7CgRqarQcTt59FI71Hud
	79XlISYTQsaP1KvYvaP4jHLu3eQhWFfiXtWgHqJaMSZK/Ka0VeoKZhNNsLbAzletpxJ8sblQfm9y+
	A0ahS/Au4JGqoZB87al28f4GstJXwhVtEf+4xGzwSTzqotwuQ8MTKNMbABKWiZonWPQqPgDvInkyl
	h3fVvDstVEwt3e1uH+FvzoIQiYLFLZhUDPXd1n4y/FL0nyESJw8Zd1NgYcgcxwJiLGah3UHV74tke
	DXqSdwouA5FM0CmSvFBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaQu-00BKAn-BI; Wed, 11 Jan 2023 12:42:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaQq-00BK7Z-Cz
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 12:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673440936; x=1704976936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FeXSfRPGd8xhCAtzipIIL/gUED63SxlprpqjkBJE7SE=;
  b=ArVB43G0Vh/2v6X22abmADWPKWfO8ZdvaeS7A8wqi5bQOhaNwfj5d3Du
   8Et7d6Jdz5CypQWR2AmS20AWou3z1YgRqOJ7yKuJCwMoxenIfV83hnOzT
   MIuofIZhuuSL8I9dkDF0iiAx0K4SmfAqKmCDICJZfB3RcgCObmd57rguL
   RjbL5ZQC8lPU3wXJ1OD9kSevPdml7BMUmD7OW0weQUr5ho+w3obRlKqtL
   9olsYKuuqNrSRcMYUZHfFkeViXyTj5exj7r2B0cPsqykV5rYLyPpDnPIZ
   jwXC/lexIj02bHkuR0NmxI51OFDThMvZIr7ybTVhN5huNdcjqwhx/Ydtp
   A==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="207309527"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 05:42:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 05:42:11 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 05:42:10 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: riscv: microchip: document the Aldec TySoM
Date: Wed, 11 Jan 2023 12:41:06 +0000
Message-ID: <20230111124106.2417152-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111124106.2417152-1-conor.dooley@microchip.com>
References: <20230111124106.2417152-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_044216_511749_BF103B9C 
X-CRM114-Status: UNSURE (   7.57  )
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

The TySOM-M-MPFS250 is a compact SoC prototyping board featuring
a Microchip PolarFire SoC MPFS250T-FCG1152.
Document rev2 of this board.

Link: https://www.aldec.com/en/products/emulation/tysom_boards/polarfire_microchip/tysom_m_mpfs250
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- added rev2 to the compatible. I kept the ack as you can tell Krzysztof
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 714d0fcab399..4a29c890619a 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -27,6 +27,7 @@ properties:
 
       - items:
           - enum:
+              - aldec,tysom-m-mpfs250t-rev2
               - aries,m100pfsevp
               - microchip,mpfs-sev-kit
               - sundance,polarberry
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

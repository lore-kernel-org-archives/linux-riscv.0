Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CC8CF64A0
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGVK4PXGaxeYGB1lKSSw3C5vf2ct3Nat7SIANeAg6So=; b=EJv8UWtnVS0vkN
	fnQqZCqeh0KktOtj85YkdkL3nU8SEUJG9NNMuckGGQlTftyaTlLR2yaAv3MXBzloPvIM7dN3lBY2e
	fkdtfdybsJQqVE9XbAE+CqWPpBXvvDoyg+BZcXjA+krDVdPpOin1vLCGD5SmRNjChRYnO6lWRnQX5
	4BdOmnkDcZv8PBah4+p0Urkw6TMUGzz2zwfRFvNbMR1DC25HJs8LP525hPVcpKLnUyHnCoTw8p2Kx
	2fWyKAbbf1Yqt7+Tn6GqsTkvINox3vXppNVgS1/8xdtXxHqnGsPgB5sa1AMa/RcDoDjzSJTW/J687
	G6vmSFBl1hkotC0XeKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svENB-0000000Go7r-2gfy;
	Mon, 30 Sep 2024 11:15:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD8I-0000000Gb96-2qV3
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690158; x=1759226158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ZRkGoHJzGrFCvWkFUcZJD3opW6vCmsySFXJcbpAtNk=;
  b=TgSTEcY5T1Vad6/Bg9XfYmQ5n3crWWVGO4tEa+aF2z6dqtN9W/KCdO13
   oiaT4iobq4jteYNOCeOGvqjiyEpgwncEEnWsmHLKmqaZLeikZho8FXqpB
   13/4Ot3NcBYeMysY5Wl7Om6F4VYntcEasUypKa78/EAiFi74NCKa9HctI
   pBgRtoxxApu+OoNcjoVzoGjOxIsINntONjaSetso2hNtjzV0pxSAkuWDe
   C0b89+s+INernIspqfv2rTe7OzuLBaza+ett4A6aYYH3hzuBiQWfi85SR
   3bm4kVPkQUDtSjt5nplTFO4fGsPqk2AmIuOakZkIRAsIBJYeN41LCbgZt
   w==;
X-CSE-ConnectionGUID: jBRUFo6rTUOCd1OoCerG2A==
X-CSE-MsgGUID: RrHbUsdYQlKB4y5cHQBi9A==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="32997921"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:41 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:38 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Paul Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [linux][PATCH v2 15/20] dt-bindings: riscv: microchip: document the PIC64GX curiosity kit
Date: Mon, 30 Sep 2024 10:54:44 +0100
Message-ID: <20240930095449.1813195-16-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025558_875989_CA61321A 
X-CRM114-Status: UNSURE (   7.61  )
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

Update devicetree bindings document with PIC64GX Curiosity Kit, known
by its "Curiosity-GX1000" product code.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 78ce76ae1b6d..8fe9a2c7c949 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/riscv/microchip.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Microchip PolarFire SoC-based boards
+title: Microchip SoC-based boards
 
 maintainers:
   - Conor Dooley <conor.dooley@microchip.com>
   - Daire McNamara <daire.mcnamara@microchip.com>
 
 description:
-  Microchip PolarFire SoC-based boards
+  Microchip SoC-based boards
 
 properties:
   $nodename:
@@ -33,6 +33,9 @@ properties:
               - microchip,mpfs-sev-kit
               - sundance,polarberry
           - const: microchip,mpfs
+      - items:
+          - const: microchip,pic64gx-curiosity-kit
+          - const: microchip,pic64gx
 
 additionalProperties: true
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

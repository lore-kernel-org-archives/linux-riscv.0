Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C0BECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ropntR1AuzHjdWVyRFkBA94bybBqmspbMaEdR7q0fLg=; b=TVWlGkOB0wWf1z
	P3pXgDe0Y4r/CBXuLWaYUnGEf4f0kw4Ly/f4kPQkFe2UpGXVI4FpoMpWWO9NynHFNtZ9pJpngJNsE
	vlKYOpm/t3Peb/MAdwH/FEWs/n8oDOTiS7iLVhkOj4/RnZTzFk1SaGwTI7wT967jUUdwMK28qyBOT
	DM5gvXsCXK1zKD/Ib5JGtOwXAXpqCqt1UpEo77UBNb48LWSj+gWzBH+0yck8VmIF/2auXJEX0Lf9V
	BOtJDQmPKNacG/UQPV/BGVrHRDQqLBB7Lnh2ukYtgB2M/eGj6xfiBlBARPGuLGQBm9UCoSxi8jSRI
	6Gqqu/fuJK4+9QswKa7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRaKQ-006Ceq-4G; Fri, 26 Aug 2022 14:28:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRaKJ-006CTX-D4
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 14:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661524131; x=1693060131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7FfH98vN3G1c0zazEIRp+BvmsgR+SbY6HrQ2ERp2AsM=;
  b=uOgld4d0ubaPgW6miy7y2GWOWShytuPCkdWu0Gv7wGhYn/gJnqbke9Aw
   bDRcdgo1iEZA7qbZoIDWoFkciO2WYeT4YuNAE8a5rMuMyPL5y0n5yn3Vv
   EiVNZ/W7HIpgZxUoPKVWnwEmgvWfjFWBxEy0DLBvCefPJdUqrfxzAv1tS
   9cCuiFl+6tzbeTAwV6VMq5OFZAHdrVDAfU4ykk2ZoC50tD4ItvHmjgYAW
   85QWwSkzLBKul2sYnQIRqmE4VgGmxrm7szgllJ9KAuGBKpzoRA5+xa7cr
   LqgQXIOo0K1dXNdq1lPtumCxKjMiVA1DNnjnGkRVua9ygQK+vgaOj2Q6p
   w==;
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="110917571"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Aug 2022 07:28:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 26 Aug 2022 07:28:47 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 26 Aug 2022 07:28:44 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/9] dt-bindings: riscv: microchip: document the aries m100pfsevp
Date: Fri, 26 Aug 2022 15:28:00 +0100
Message-ID: <20220826142806.3658434-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220826142806.3658434-1-conor.dooley@microchip.com>
References: <20220826142806.3658434-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_072851_559239_B7AE2628 
X-CRM114-Status: UNSURE (   6.87  )
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

Add compatibles for both configurations of the Aries Embedded
M100PFSEVP SOM + EVK platform.

Link: https://www.aries-embedded.com/polarfire-soc-fpga-microsemi-m100pfs-som-mpfs025t-pcie-serdes
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 7cfc96c21ab0..04ebd48caaa7 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -26,9 +26,13 @@ properties:
           - const: microchip,mpfs
 
       - items:
-          - const: sundance,polarberry
+          - enum:
+              - aries,m100pfsevp-emmc
+              - aries,m100pfsevp-sdcard
+              - sundance,polarberry
           - const: microchip,mpfs
 
+
 additionalProperties: true
 
 ...
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

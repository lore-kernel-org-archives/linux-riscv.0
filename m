Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B92CA100D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 08:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1KeGdiQLXkPS3bz+4h85d3KhznQW0uWpolkETNelpI=; b=hfGVB4ktwY1qVu
	JhHhtVBPf7EINSpSkjWzH0tIzumXL7UTEH6WhKUJBQnlIeVUAynkZGq3s6fX/if8eLsxtGf31UYkJ
	sPOBzPxcaMVanGyQ0SOH4tWCnWI3b3BE9Mo6vUR9o1MiW0THMAAWK3mxBIUzRDdzQidyLbO1TvZuf
	bPYnkosYNbHb03ZyRV4R4hnmWKlq5gQLAPEpHsr8jHDpmfwfTNlOcs1kixrf/U4QOfSfpDEG7j0CN
	73N6Zube5EsQ5O+VV234YL6Apym3VCYW5Ghu9OFBzN3ie0jD0yaZW4W0Y1TN28/MLzK0Ii0bl7up+
	2a/j9HuRy9unbrYo1fSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utM5Y-0000000Fwnx-3Hcf;
	Tue, 02 Sep 2025 08:10:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLsk-0000000FrYt-1wT4
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 07:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756799807; x=1788335807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TAnyCLRfE3EQgtrPFVJVltgt/YNxdMV/5FZ7fdcJlJA=;
  b=162uPTZ8YRXGETFS9tcTV0/hty+1xcY0cxnnrqMxjSOqxDGMbSuTJb0H
   0DcGuWBfQDn/mcrhz2kiI2rfUi9xiaxJu238atnfFCbj76AMckW4Rlpd+
   Cl15/eNFIow0RRJloOytplto0d7QXwJWdTfT6MMcASu/7/yBGvz3YAZSI
   9gkhiCQeDaS8eDMMgmQCD7Kos110SuT9XGYNpKP4nA2qHyGcb8m1Hpee8
   O9h0/WC2lEn0HInfq6EG/QGfU2TBfFY/R8MwZAke665Or5RmrZxNVs9E0
   GdfNP6oYksrUpxlAmY6gFidF9+iqoW/6/dy/JOZCrMV1QuIxgwA3c93u/
   Q==;
X-CSE-ConnectionGUID: I0e7JmeXSliqGe+ljgjh1Q==
X-CSE-MsgGUID: JWvEiZzbTJ67xuX5JzQCRg==
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="45916749"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Sep 2025 00:56:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 2 Sep 2025 00:56:19 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 2 Sep 2025 00:56:16 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v2 4/5] dt-bindings: riscv: microchip: document Discovery Kit
Date: Tue, 2 Sep 2025 08:55:47 +0100
Message-ID: <20250902075548.1967613-5-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902075548.1967613-1-valentina.fernandezalanis@microchip.com>
References: <20250902075548.1967613-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_005646_567421_CE33DE96 
X-CRM114-Status: UNSURE (   7.04  )
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

The Discovery Kit (MPFS-DISCO-KIT) is a development board featuring
a Microchip PolarFire SoC MPFS095T.

Link: https://www.microchip.com/en-us/development-tool/mpfs-disco-kit
Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 8ddc5c02973e..381d6eb6672e 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -33,6 +33,11 @@ properties:
           - const: microchip,mpfs-icicle-kit
           - const: microchip,mpfs
 
+      - items:
+          - const: microchip,mpfs-disco-kit-reference-rtl-v2507
+          - const: microchip,mpfs-disco-kit
+          - const: microchip,mpfs
+
       - items:
           - enum:
               - aldec,tysom-m-mpfs250t-rev2
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

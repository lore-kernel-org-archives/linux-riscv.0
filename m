Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16870C531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 12:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzuMnl9Djv3PtpHMhrjUqJr+wR5KJzXfd0IlRmKrALo=; b=3Obpl1hXc2pLFa
	OhIsPH1Yji9Scucn6liL4RSyLRURvs+/My6OGPQNxpd4Xtv2qo7lPGml0g3tNvEcgY2PKbuL79gMF
	m/mWPNliNtOwQWDerRcqQlolZGBO8nSfn4ynRUp3coTCQ4tqZQCYfANWVwHM82KM0gIdMh7QNLEuD
	ktBK7mx3wRUAEY46GYESvhb/h4guMGJS1HVEg4Cg+KiXyHoDcl1hl8qOGYPDeLGJyiZ6gJSFb7ttJ
	lbrR73P19TY54JhyJ2fneGT865SwdfcwVhxvGlEqvXIm1m7GBAKlylMQl7OWW/fYObMgSkge3NBca
	4FgwqPWYDZ3s38Y9//PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shTOe-0000000Gh42-3Gdq;
	Fri, 23 Aug 2024 12:28:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shTOZ-0000000Gh1G-0q18
	for linux-riscv@lists.infradead.org;
	Fri, 23 Aug 2024 12:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1724416079; x=1755952079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AAJU18OBl8o8+iDmdG41Ki05MWpShLtTzqE+u3kWNwI=;
  b=Rzmgum9LXWohg4N8TKyAZIciL3v47SybuKAyu6tH6jOJjst5Y1rCMN72
   QQy/G2hqEqtaNUPugkzXOq7b5l+nVLt4e/rauvzLumkXIlO1zYwynC4ny
   mHG2KXRHM6q6ZHTIwaA34mm4EtzA0P19HvD1LtumVG6WgSVT/cWCsnwGJ
   jLEUcBfVIfvGfRCUmQuSbZFEg6LtP+ssVAmL8z4Mzx23m0DDlNQfRT4+O
   YVkHcP6SH9c/UbCNF2CIVsubKJVGxF5E+/TOST2qRkiaKkFkRPaX8HmqE
   zcgzMkyOzKNzRyAkPPAQxO0mYyWh1D0wJ0rEGV63P8i7KrQ4xZfWNoM2x
   w==;
X-CSE-ConnectionGUID: rDZOZxKYRGu2u+L6hg58hQ==
X-CSE-MsgGUID: j2lyweIKQPuiHDwPt1WV/g==
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="198251697"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Aug 2024 05:27:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Aug 2024 05:27:35 -0700
Received: from daire-X570.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 23 Aug 2024 05:27:33 -0700
From: <daire.mcnamara@microchip.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <daire.mcnamara@microchip.com>,
	<ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v9 3/3] dt-bindings: PCI: microchip,pcie-host: allow dma-noncoherent
Date: Fri, 23 Aug 2024 13:27:17 +0100
Message-ID: <20240823122717.1159133-4-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823122717.1159133-1-daire.mcnamara@microchip.com>
References: <20240823122717.1159133-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_052759_427375_E4158405 
X-CRM114-Status: UNSURE (   7.10  )
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

From: Conor Dooley <conor.dooley@microchip.com>

PolarFire SoC may be configured in a way that requires non-coherent DMA
handling. On RISC-V, buses are coherent by default & the dma-noncoherent
property is required to denote buses or devices that are non-coherent.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index 612633ba59e2..5f5f2b25d797 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -44,6 +44,8 @@ properties:
     items:
       pattern: '^fic[0-3]$'
 
+  dma-coherent: true
+
   ranges:
     minItems: 1
     maxItems: 3
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

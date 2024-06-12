Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F1DC2BA12
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 11:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YB/yYWae3rUcJLnmssT1HcYIPLQiLt2P7rfMo1EDqNs=; b=p6OMfSGfxTQ4aW
	ZlVs5PJMxj1bjCAO4kT0Ol3/qsYz4vBs+JjEBiatrgJZ36DOv97YUAY9JZpO7keudlgPN2ULtigoE
	34lOMYXKuuSrNtMBaRiB1jOBfjFV3S45WXhey6reqPn+1bbNiWshxv5UylPsB3xHNAtnCdgryT3o6
	2ztLXmQKeTD7jh2maOm9fe7UttbHeHP7Z4SwVFh/NKKuyaviXvk99GpwR9HYXzG0RK/CIVlFMKUPY
	kXAbwlWFinE+3tZhAFt2h3poGHfhAlsljPntvTmMovv2OaY7eMFEHyzO6ykXE3RTo7gREw2AkTOeZ
	dEPVVOVbJRYaV/X+bIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHM4k-0000000CQa8-36mQ;
	Wed, 12 Jun 2024 11:23:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHM4c-0000000CQU7-2Lol
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 11:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718191406; x=1749727406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eOM+rlNe4Ccmiqqj78VRC7CbyAJhediEgq9+gqUJt5c=;
  b=JbhamPEcIdt875NHfcEBHa+wvv5HQxKe2TN28JeduYXS/ek3glP5jCZW
   K/aZjQBq6OEKPnPfUK9W911E40DFlrYhMcbDiP3ZPw2L+yHTp9TvpdyIy
   Y92/eJHCTSKzfOcZ5BrPzmWbT1LemfaSKnXdutYPIFqf2Mq4fga8AYB9e
   ToTpsoLyP/uoayF6sR558MRNOigHgZ19WqNHiCcG/qfaJeBxADzaQPGOm
   UlROXcIc9kMrCJvTeeNBKMYkS1Hj4f15NZUdHBMTV8TBjO8scxeS5JxEI
   93eentn6xdgPcd6F/5cneZ/ON4RHobO/aSmXkNdxRicFGHOjLDTRV+dL2
   A==;
X-CSE-ConnectionGUID: hzPuRHFvRM+Wy8rrRTyffQ==
X-CSE-MsgGUID: jgaw45dBQPqiWppOjWLXvQ==
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="29761713"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jun 2024 04:23:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 12 Jun 2024 04:22:52 -0700
Received: from daire-X570.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 12 Jun 2024 04:22:49 -0700
From: <daire.mcnamara@microchip.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <daire.mcnamara@microchip.com>
Subject: [PATCH v3 3/3] dt-bindings: PCI: microchip,pcie-host: allow dma-noncoherent
Date: Wed, 12 Jun 2024 12:22:13 +0100
Message-ID: <20240612112213.2734748-4-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240612112213.2734748-1-daire.mcnamara@microchip.com>
References: <20240612112213.2734748-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_042326_792517_E741F07A 
X-CRM114-Status: UNSURE (   7.74  )
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
---
 Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index f7a3c2636355..c84e1ae20532 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -52,6 +52,8 @@ properties:
     items:
       pattern: '^fic[0-3]$'
 
+  dma-noncoherent: true
+
   interrupts:
     minItems: 1
     items:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

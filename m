Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F512D0D7BF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 15:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjGDZEgWF/+C6KpB2V8Wwwp0RTc5Cd7oTX8YcTVoP+E=; b=XHL8VG+FVHdz6Q
	yJGDERn6cWM3h6ZJs7v/+HuZUONOSW30XCNyJq7ZuQw+y+RVUm/TSOhIawkyxJAQwiH9x4wCdvmQO
	TvCFxCAaxvV2ILghDxg+3AXzrc/gQvOeYuKm/6uBgZTErkgqc1UCIJThH+J8pfu6tc7ORzUCx6xyi
	R0o+hFjWGPfo95zwm1ZXrkB1lBAq9RPrhOy/8dnTpBXHywg55G6rUAol9uYhcFSug+aWiAuPnMOfj
	oI+RvMzahT0vyz7W9wfDaCLcQECGcXyOa13pAMUa+ZL7Lo1J/CFdDO1/kjdl+oKLEF66yOIU5tKYJ
	UNnhLcZmJNDixOXh5R8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szHNe-0000000Gkag-1Q09;
	Fri, 11 Oct 2024 15:16:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szGDY-0000000GXQt-05Qz
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 14:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1728655328; x=1760191328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i/HxZYSj3x29bpukEzZcwPkb9qFoaouDs9iL1Ghkig8=;
  b=XLD5AvdNK7ZEOGhM9l4cXDNqL/YPXPq/1SKFQeYMolMlIUwL2pebM7lK
   a6uHcq9dSAuC5HM35nnGoCAUwvrE8VNAgM/GZoslwAr8LOd4oHjWgWr8k
   Yea2qH192nwwKKJ5vmTed+018T5JeNdAosn2Z+62Q9/Nj27fYa3BpiNN0
   afwZuMZY7akvNBvRmJrZb5k1Jivnk6riPmO7vv9LkSl7ta39IInrig0t9
   F+1fEtRB46+vMg67dDlKOGIuw75AiNxjgRVzyvv+S6ThZYAvQnKSPXjHJ
   z3o/rApaTDzfzkiugv9TKMo8mfKnO/cO+fY7Qd6MnGu6OfltZoLc49KmL
   g==;
X-CSE-ConnectionGUID: PBjGkC+SSZ+djG4FWi+TaQ==
X-CSE-MsgGUID: NA3T2Q4uRL6emXVb6Tl09A==
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="263956568"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Oct 2024 07:02:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 11 Oct 2024 07:01:42 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 11 Oct 2024 07:01:40 -0700
From: <daire.mcnamara@microchip.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <daire.mcnamara@microchip.com>,
	<ilpo.jarvinen@linux.intel.com>, <kevin.xie@starfivetech.com>
Subject: [PATCH v10 3/3] dt-bindings: PCI: microchip,pcie-host: allow dma-noncoherent
Date: Fri, 11 Oct 2024 15:00:43 +0100
Message-ID: <20241011140043.1250030-4-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20241011140043.1250030-1-daire.mcnamara@microchip.com>
References: <20241011140043.1250030-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_070208_097933_5C4004A5 
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

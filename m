Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FDAC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 10:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPt8lQBUOldLppnxdjFBCxdG7ySO8ixWarlF8kkCM/A=; b=OjML8LX1u/ZC4N
	hH5iPY2WkdEobL1RamKUhjyBURYVtG/NCHhPopKDsl1e37OvLG1SGURneCRSJPORZ9WZmIdEUksvD
	05UQGt1l/pDLjhy/wLmFQSih6Zi/vYHNiXvyc3nQmMLMadecB/bIEoWmx4a7hfCCkKgTt1TWi6+7g
	0+SJE5seam+XmGWcXPv4h7hHsG29YBKPcVFq+r+LGUjgN745R2csHJLXuHmoHaoF7nmnLZSbE/HLU
	ja6Yk1BDh82DrpY1YB9E64vh6NJrMAJiyeMQgZnzYIsVHx/HX1x39qGYuXEdjNrrVSyetjWYMQd7C
	WHj+E1g2MkpOjIXI7xew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqxL-0000000DW62-2jLR;
	Thu, 11 Jul 2024 10:23:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqxG-0000000DW37-1mKG
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 10:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1720693394; x=1752229394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jiUij3wRRe5sE48zPdwi6+NvzYyJIr+GpOYj/SVthjg=;
  b=wUpovwTYiOJIAxXBYzG8RebjT9ESTDuW0nod8BxIdMW9OjQ5mMNt6dKF
   adbF9zrhRVfsIlGeIa9jBxtg90AUQ99PHh/KUZCcu7W1FiJY4U2Currkd
   zfXahBoaQONOBeCEjqJXYxmB2qd9gP2ebqK3Q+/Ww+7KxOFD8g9M1nsWr
   +cp0uv4GhTuknYrafNFGffQdHK5vs57OejvKW3rYrqTeQu9J6mD4UbOsz
   j/tT/U2vOmiI2RaQTp469uKwxqSvVKIo9G2mbKWLTNNiMRAHrjBg88V/A
   eOUMBUJeroTNQsY2mWfsce3nS1mf/lhdLIM2T47zg+wGgqyO4wJEUbFxA
   w==;
X-CSE-ConnectionGUID: WkJ7eC8TQierunlUA02PGQ==
X-CSE-MsgGUID: S6X149yARRuVdHRhEe6r5w==
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="196511501"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jul 2024 03:23:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jul 2024 03:23:08 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 11 Jul 2024 03:23:05 -0700
From: <daire.mcnamara@microchip.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <daire.mcnamara@microchip.com>,
	<ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v7 3/3] dt-bindings: PCI: microchip,pcie-host: allow dma-noncoherent
Date: Thu, 11 Jul 2024 11:22:19 +0100
Message-ID: <20240711102218.2895429-5-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240711102218.2895429-2-daire.mcnamara@microchip.com>
References: <20240711102218.2895429-2-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_032314_555458_E7C49ED3 
X-CRM114-Status: UNSURE (   7.44  )
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

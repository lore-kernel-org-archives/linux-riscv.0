Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA436C3064D
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 12:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPt8lQBUOldLppnxdjFBCxdG7ySO8ixWarlF8kkCM/A=; b=1OgnKMJbArxuF/
	Al30PoK+JZ3WFqlSawxnoa3T6BpV7g/mzl8xme/SneBPkoDmwWWV0HfHajhl2CmjsfDYqnomoGqYz
	5rvs/TseWA/5YEFy8UZRA1B1BmXYtVOfxHKOk7Etn3OQCg1d/vryKYhnINvXeLy0wUDy7AyhcQedO
	hyjCPmyCUUdkj/PyUMeX//RtlvfQX0MIWHQXXE523ojcjgAbFPMRm9bDdlJ47308ygNxW4ysg4fw4
	AWX0shDKC+24ezt2TCO2chMyHcL3ZQ2tlgZYQCdrcGtYVhERiJpqR8uCh9H/VDXfJaytk4zauwsaM
	9bElPjg8hczpUqM+wFkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAGv-0000000DcCL-1mmU;
	Fri, 28 Jun 2024 12:00:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAGq-0000000Dc8e-3gi9
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 12:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719576005; x=1751112005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jiUij3wRRe5sE48zPdwi6+NvzYyJIr+GpOYj/SVthjg=;
  b=fnU25ytTjIV7buyNEcydSfbia5xiOOd5UuPtFFncKAbH6ebPfFQxg5id
   Crvw7bE5zf8JNX/7dV23/Ni0s4do55qihpToRB00g1J3TfT+Jfci5/IbM
   uY2e+rRcjU5hROKx78/aHV/xJ1GYvXJNoKdUun5+Z3QYQkgLon/3t63hc
   cQ4wBwtCmwZXrJABLwOvwvzcKAhrtW2nbglmiWs505obC2zXVXqTevU3c
   9CvUddNDhtwEQQuFs3rE7LyU1iZ49nS6fVHYGeqK9sOz8VBNEr57L7Nj5
   L9l9tmELdFGQzq4M5mPzqYisBlN+YAhDMzxc9n/NEf91xPSg8TDncosNp
   w==;
X-CSE-ConnectionGUID: fhzcQ281QiKf1QfzQI0hzg==
X-CSE-MsgGUID: R+AVEiQ/TTmD0N108NexvA==
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="259502562"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 05:00:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Jun 2024 04:59:34 -0700
Received: from daire-X570.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 28 Jun 2024 04:59:30 -0700
From: <daire.mcnamara@microchip.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <daire.mcnamara@microchip.com>,
	<ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v6 3/3] dt-bindings: PCI: microchip,pcie-host: allow dma-noncoherent
Date: Fri, 28 Jun 2024 12:59:23 +0100
Message-ID: <20240628115923.4133286-4-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240628115923.4133286-1-daire.mcnamara@microchip.com>
References: <20240628115923.4133286-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_050005_002078_472398BD 
X-CRM114-Status: UNSURE (   7.48  )
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

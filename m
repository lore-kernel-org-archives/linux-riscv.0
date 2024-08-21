Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1052C5321E
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 14:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzuMnl9Djv3PtpHMhrjUqJr+wR5KJzXfd0IlRmKrALo=; b=pqImXurEu4bZle
	B41/+FihVy6mzTkBX5ims4Hj1hNWPherV8C7F2pOXBNnOVSnqJ1Xx6OEYIKJq4eyXi6cEBFzP42f8
	YHWtMSOHVvlGCmyymkENEoUvrf62NsxrVjKv4GQIRMYSLx9uRB249Z5g85fChNtjHHiFIGgXCA/3H
	jczT7KC63bIhAtLGVYjkmH6Nka/X2s+EQO+PEy7qtooBIKFygDbsZHy7JNNFQQh4O6oQFa0X95QId
	Z8J5tnr2NWJvfcIOFll6HuwZLQnE5jo7CnH4dLd7Tpk8zVQEWW92v8GoYuR/o/fYWEBBkXx5O3duQ
	be8h65lKu/VD7xUnAfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgm7m-00000009Fhx-2Cpb;
	Wed, 21 Aug 2024 14:15:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgkzU-000000091K9-0hT0
	for linux-riscv@bombadil.infradead.org;
	Wed, 21 Aug 2024 13:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=daoGw4/cHGn/EvMbHNQbfB7jCXtnPLt5EGd/i7Bc11s=; b=MVd5zBC0AIuUsNUZrfahOLav4O
	DcD5NW5iIvi3iGU9HOKMbeki+VfeN5OX4BkCu3QAEacPAH/1+F3+LbkPJbtU+4wUvxcPnVmAyPCpi
	ORouPM1eMqkMHrygIrdHhaikSCiHNPsWB70WX6AbwI30EfD+4Z9yM8La0wCzvxYbov7HGKHV+c1rb
	Me6r+hx+P2m6ILiY3FNI7Aa9n6t7XnemQQEjbEsoIH0kLIYnNAQ+VkSG/VDdZ4Gn7SganfPjU8Ohn
	+LsEVrHG9BlwxJwZvVEdEWE8xxm1vPccoZJZfN8/xtKahIOdLaKKBInV2hfknRP0HaplO3OareLS7
	I87wYyVg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgkzQ-00000009X5T-1Ou7
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 13:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1724245384; x=1755781384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AAJU18OBl8o8+iDmdG41Ki05MWpShLtTzqE+u3kWNwI=;
  b=1kxK3EziZlzlHAKd9K7CP/AzGrj+ixOXH7UjQKwe3TNqM6NIPLmrwi7s
   vP7xgjhE5ucc4agjj9NYTrRBjNVFzYmhDMbh3ZrN6UAmXZqCZcnvU52ZC
   uTaj6NvRIVDclfzAft0hEtvrAfo4UDp5YBcXl9u0+HlMJ5NAWEuPtJor9
   rXxYWEBXImWbBwliQ5/3iMOA4T5D6pn749cIo6uPvpOkpIz5goW0GYYMB
   zjBYPdrUwUJaRF1qYn2VEzjtxRElxByVNU9oZCaD1lURmrx55OJklWgjW
   1F+q4IL5uhwRwByaufplB0vZy6HDR9GH/2fpjzdv7Tif8HXzrGMYjL3LJ
   A==;
X-CSE-ConnectionGUID: hYt9Btb/Rtq04w/yiOUfIw==
X-CSE-MsgGUID: lyWViQzjSR+R7G3o33eTUg==
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="30743856"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Aug 2024 06:02:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Aug 2024 06:02:38 -0700
Received: from daire-X570.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 21 Aug 2024 06:02:35 -0700
From: <daire.mcnamara@microchip.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <daire.mcnamara@microchip.com>,
	<ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v8 3/3] dt-bindings: PCI: microchip,pcie-host: allow dma-noncoherent
Date: Wed, 21 Aug 2024 14:02:17 +0100
Message-ID: <20240821130217.957424-4-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821130217.957424-1-daire.mcnamara@microchip.com>
References: <20240821130217.957424-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_140304_925195_9AF70625 
X-CRM114-Status: UNSURE (   8.33  )
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

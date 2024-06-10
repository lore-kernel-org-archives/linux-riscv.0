Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF06C27C65
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 12:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJsDCNaAOan+Llrn23g5qvKmtz5Z79HuXU8o5oA0bUU=; b=opj9LhYQahG642
	RKdlkuYMNTODVvJlr6A39t0/YlRHqdl2f1vHteM/4OqEZEx0aj4yxtOsG5KKbS92iXzK7JI+Vh78/
	Av15RaAj3LLc5Al9ODNMJU/uQAgXCVDP5oxK6UjjkKFNbJMa7aENjL2T7y3sUtxzd7TvjYrCLJq+B
	spePhEZlmooYMb6FQniDmtJ0LO5rWWSNPR6POHo8E2obdCBZhJFWfYfkSG3eZ0zMgdFBnmHsGvIVc
	2+gnkB+1FsDRqBT1mZ8cP/FMighMiptXL5ZK3ZT1rsiy3L8AUtYSqEmxcgRPrjt1hiZ/vDRX0eXC0
	/hEJcN/ySPiFq8llnh/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGdzW-00000004ySc-2ZaG;
	Mon, 10 Jun 2024 12:19:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGdzQ-00000004yQW-1tL1
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 12:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718021949; x=1749557949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qb9Up+t11DzcZW8H2Jjuu7ECFDelJkgS8AlOnO1SlWE=;
  b=kuVT4brVky/lfB2h6lbcCT7zr+iRy+ioCalVsxS1CxG9Bm2gUPX5lnai
   lHj1HAlpDysUoFmG7PSS4UBaZc7p6tc+5GtoO0hdEOxbzKPhA+/C+9hAU
   3GGSUgj9UYiDnHFR/Hyc8QY9kuqGNdV8uUk2AIQu9XAoYhaiKshXFV+S9
   aGr1c3i9fWiEOsyAyxbBo97xOATtfwg5Qr3FBlhJQVqZCxZMYvWo9QL5B
   89ylzztjtqbqvR1dkwydA8ujKSd6tfW/iaFRfRSntvf2j460UPCh0gW4N
   gwPVmxXxSqsRRmmypESshB/MFmeaLs6kJ+HRipNDb9roeB8f4CeWLupQT
   g==;
X-CSE-ConnectionGUID: nZYSrxyTSBy6GiOz7aIYFw==
X-CSE-MsgGUID: gcpetgnSQTuJ3BvErvJgGQ==
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="258056938"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 05:19:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 05:18:34 -0700
Received: from daire-X570.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Jun 2024 05:18:32 -0700
From: <daire.mcnamara@microchip.com>
To: <linux-pci@vger.kernel.org>
CC: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>
Subject: [PATCH v2 3/3] dt-bindings: PCI: microchip,pcie-host: allow dma-noncoherent
Date: Mon, 10 Jun 2024 13:18:22 +0100
Message-ID: <20240610121822.2636971-4-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610121822.2636971-1-daire.mcnamara@microchip.com>
References: <20240610121822.2636971-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_051908_522534_80EC4F8F 
X-CRM114-Status: UNSURE (   7.45  )
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

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96033C25B5C
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 14:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8VoABOHkhtW2en2sph/iy0ZLiQjrvl/eiSlSPZ3Ed2g=; b=yfiffkGrGndWD6
	CoeSZ8rdjtWOHBaYbSWzLJpThpLZ4U0H3ZTSEpzuWabVKfA8KaCpNWWFRLMlY3hgSiIzh83jMU0Sv
	fNBzOk/OcWxjGFTn+em79CvkHbeKYWlB5LFWwUnaCCNF8bjqoOvmRhEQ67kzRPEMqbFIKHbtBY2zp
	88aZmcQU6xcaRPCgmpLLvLDbz/hnBOoPrpcEe8bbTR3rYcukRAjObr4A6VnafVO1xLXmmky2uSes9
	idI58dGAe18cKzIjPG+XSZsHEQeJikwcgKkVi8GR270mDCn5C5AMppuFvsvCoaSzs94HGFzfg9Jq0
	NOQsEH+iJZthQbxyxgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2XWp-0000000Cvzg-0axs;
	Thu, 02 May 2024 14:35:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2XWm-0000000CvyM-1p05
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 14:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1714660516; x=1746196516;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cGtSLhV9PQy5AG+syvA12d07Ab6jKTZoOL5VxbTBicU=;
  b=euuwafgq76r0ehUIVdbNWXgd32giySL9sR2eiJTOXT/URyyDIqpGB8sy
   aHO5Rr4pWJ+AFP87WNvvJVt65NSfJ2/6wJoE7CsrI3qWxy1yI0H1D02nL
   WxyHI+1+CMpd1srUxnrQOgjcIcgdtUJVZbMCLPAhSzNtsOUglWs9bPqk6
   6+Mw5DTSRD8kS36QMxaPdeHRql8O7jBHqzJXntxePQzPuT/tOQ/4Whz1D
   yWmTkE+SGEHNlO/YhLEJxgW1Uor6gfBAs7RUhT0YnjWy6qpAQ6R/KSwj1
   G6MwwOPh83sRe7+6WVjA1Rzs6GDocaaVREF/2DUa3RoWwpBGAhPInyZNS
   A==;
X-CSE-ConnectionGUID: Qz8ca859QRGOvYnxkj1hIw==
X-CSE-MsgGUID: GIq4VhGQQ9+wxAv0D3gKJA==
X-IronPort-AV: E=Sophos;i="6.07,247,1708412400"; 
   d="scan'208";a="23373822"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 May 2024 07:35:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 07:34:07 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 2 May 2024 07:34:05 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, Prajna Rajendra Kumar
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH 0/3] Add support for GPIO based CS
Date: Thu, 2 May 2024 15:34:07 +0100
Message-ID: <20240502143410.12629-1-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_073516_560229_2502006D 
X-CRM114-Status: UNSURE (   6.60  )
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

The Microchip PolarFire SoC SPI controller supports multiple 
chip selects. However, only one chip select is connected in the MSS. 
Therefore, use GPIO descriptors to configure additional chip select 
lines.

Prajna Rajendra Kumar (3):
  spi: spi-microchip-core: Add support for GPIO based CS
  spi: dt-bindings: Add num-cs property for mpfs-spi
  spi: spi-microchip-core: Fix the number of chip selects supported

 .../bindings/spi/microchip,mpfs-spi.yaml      | 19 ++++++++++++++++---
 drivers/spi/spi-microchip-core.c              |  6 +++++-
 2 files changed, 21 insertions(+), 4 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

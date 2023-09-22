Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A556CD4F46
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/OrT4Qadyqwvai7DtKHtqsFzYb3PLsdWEhNP8PGh+b0=; b=YktK1hJ/jD6SVb
	rlylfjHMNlw1ovp+RonALr3tKA8+kNmFJz8ZKjL6sjsEOD7xnKY1zad4GQmhIHlyeMw/DW1y5Mvke
	7wjOweuUFmpKI6rUvG15WQOng9dW/iiF31ZOe4IIvXmvonuDXMt/4xLsrDVGeZLUn5ycxVtkn+PdZ
	Ku8iApk0ugxjpwgdz8lk5Otl1hAmnceOgaJm7KMjbeJXHwofuvU8+SXoEU1HrW3fCbogrADI5JNG8
	NtEpxRu7/ytOQXjR4mcNuetQIRTxZQAwwq9XI3FW0Jugc5vcw5wk2egob8AP6gNDTi16T2BDtNuTx
	0zNsC7LPWCOvzEPlmxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcnY-008dQD-0o;
	Fri, 22 Sep 2023 09:50:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcnV-008dPY-0o
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 09:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695376205; x=1726912205;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zeipEBhaXghXmN5oGpPDW5qjunGQZm56YlJ7LLJ5W1Q=;
  b=ErI2UfqrnnV+XETjH//ImB4B6Fbl8G56qm7WhmQXJtkF9Ma7fkx7Jl4x
   8MX2WBzGdi5OKOrAAJZxqnELWFYU34pQsekbyV5VeSFAQwG8Y/CThwaic
   /1UMQF+bFstHVcfa26ITgLhheh2qXey3uDJR/1vT93cRYVR/7FegEsWuL
   Z3EzuDjmJjfSmKI1BOA+ROAg1+bx5lKAMwfjRNc+FDRiCEq2WYeoDTLld
   hee0zCwetjGffmQ5H+j5qeX++5vVLGBDgBORAqb6La8EJqNy1yDBGBJWF
   iTLGnTx58ym7ryTiw8CWbGyAvMrNElM2UoWLcylUWeAOF7O26OThncKpV
   g==;
X-CSE-ConnectionGUID: fQsQIPFwSuS+RkzQs9lxqw==
X-CSE-MsgGUID: ce4PFu03SpK2T9raFQWtFg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="236602553"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Sep 2023 02:50:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 22 Sep 2023 02:49:57 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 22 Sep 2023 02:49:52 -0700
From: shravan chippa <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>, <palmer@sifive.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<nagasuresh.relli@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH v1 0/3] dma: sf-pdma: various sf-pdma updates for the mpfs platform
Date: Fri, 22 Sep 2023 15:20:36 +0530
Message-ID: <20230922095039.74878-1-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_025005_476431_3471469F 
X-CRM114-Status: UNSURE (   6.73  )
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

From: Shravan Chippa <shravan.chippa@microchip.com>

This series does the following
1. Adds a PolarFire SoC specific compatible and code to support for
out-of-order dma transfers 

2. Adds generic device tree bindings support by using 
of_dma_controller_register()

Shravan Chippa (3):
  dmaengine: sf-pdma: Support of_dma_controller_register()
  dt-bindings: dma: sf-pdma: add new compatible name
  dmaengine: sf-pdma: add mpfs-pdma compatible name

 .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 12 ++--
 drivers/dma/sf-pdma/sf-pdma.c                 | 68 ++++++++++++++++++-
 drivers/dma/sf-pdma/sf-pdma.h                 |  6 ++
 3 files changed, 79 insertions(+), 7 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

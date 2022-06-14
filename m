Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7D8C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 07:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yR+IAJvMum+mcrqqYHjYbV/MovKaSK7yS2o7WTA+r5g=; b=RMJnVcGsvgiwL0
	NM+Q8+ljl78fHrdFOeu4tkE19wUSO4OLkbK+N0CAVj+uQTVablRtWMrqTwz/p0zJ7qiao4GnLd1Pq
	w190735nVyS2rSLtGQqDMnyJnfuS0iKTxqjOTzM0uGWehqh4BtLWvx6DNUT21vLs4JTWg5UafExA1
	Ql87vxOkbAH/zqv6fzCx+25n/0snz5ixBnDzCYJJfIWG0rjGyAPc4pLcVMORIJqTfMobaY+TOeicb
	IPk8Nq5w/FjKOXGB2IY7KIN9KsCpHUaGMPMKpi7Ds65QhbI3MH8sW88syUFZrkAUshWUjxBjE805E
	CRarHz4X7A9KnEHTflOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o10XG-007RKp-Bl; Tue, 14 Jun 2022 07:00:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o10XC-007RIm-Ux
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 07:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655190018; x=1686726018;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T4nzZezDWWWUTOy8OMeuQhCOxOSUCA20xYUUYSUJEJ4=;
  b=lV+J5sAgdGFK+imtRYB4a52dZei3iRboHl312IWwNe+HIP+bYMOJfdJV
   AQyazpXiUs7msT0k+s0EOMVgWJhhT++zCGU1Df/3i3z6eWAtcPRO3wBFg
   aJ1fwZEy8tU5otIVHjGKm1uWwI6OLcjhqbURHZHkKtEeuM2AbY6EW+Lfr
   82DsKLItaCFB1MiTdA1GP91imzu3pJEK6TNPUONlXbFx4PSSHQ6hfMUJq
   CRsaIZlYRcNDu4KcHV+It3nZo9ldeIjG9wk8o1JC1P9bpASpIKW+nh1vp
   N1236QiLPf9Kbi7CnKTOID0ibXkQX4siI9zf0OAIRfhJZbOxUkWEhHr5A
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="99902883"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2022 00:00:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 14 Jun 2022 00:00:12 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 14 Jun 2022 00:00:10 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Lewis Hanly
	<lewis.hanly@microchip.com>, Conor Dooley <conor.dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] spi: microchip-core: fix potentially incorrect return from probe
Date: Tue, 14 Jun 2022 07:58:10 +0100
Message-ID: <20220614065809.1969177-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_000019_159864_2EC83D9E 
X-CRM114-Status: UNSURE (   9.34  )
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

If platform_get_irqi() returns 0, the error case will be triggered but
probe() will return 0 rather than an error. Ape the other drivers using
this pattern and return -ENXIO.

Reported-by: Yang Li <yang.lee@linux.alibaba.com>
Link: https://lore.kernel.org/linux-spi/20220609055533.95866-2-yang.lee@linux.alibaba.com/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/spi/spi-microchip-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index 5b22a1395554..856a68fd8e9f 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -541,7 +541,7 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 	spi->irq = platform_get_irq(pdev, 0);
 	if (spi->irq <= 0) {
 		dev_err(&pdev->dev, "invalid IRQ %d for SPI controller\n", spi->irq);
-		ret = spi->irq;
+		ret = -ENXIO;
 		goto error_release_master;
 	}
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

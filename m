Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9EDC6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9Yl6qbeDcsr4AyS/9dwk7ADiMJCSmkdgaDGq3oeClw=; b=gXiQrsCzMq30ei
	JNkR97BHRwVbRfIUKMY+8ZJi1FVtAtu/aaRb5Vjr3yFPMiw9jR4rAIT+p/RZgWTUAxL6IyQhtICo7
	5EvxGo/Xy1Cv5KfsGlR8LvF9y77q2pbIYGxqldjVBVqJW4oLrSa3SZP+DcNu+XuK6JOvOr+0vxFsh
	L8iGS0hT80iNlQelQ9dcv62fAQTZF7kl1Y5jdTRfciVNuHIpqx6VVZm84QvH2xpzOPTUWR8vQZUVD
	n92OlgsXPJ6pvJSHtaEj2epefxn6GYQ1hIbT/CZbqTJjFSbIK+OTF+P6kjch34Ab8ZQc1nb2jqxHH
	o6jajAtrPGNqggaCOsHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pev6A-00FWlr-0L;
	Wed, 22 Mar 2023 09:49:38 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pev66-00FWLb-2a
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 09:49:36 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0E07224E330;
	Wed, 22 Mar 2023 17:48:34 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Mar
 2023 17:48:33 +0800
Received: from localhost.localdomain (183.27.97.64) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Mar
 2023 17:48:33 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>, Walker Chen
	<walker.chen@starfivetech.com>
CC: <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v6 3/4] dmaengine: dw-axi-dmac: Increase polling time to DMA transmission completion status
Date: Wed, 22 Mar 2023 17:48:19 +0800
Message-ID: <20230322094820.24738-4-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230322094820.24738-1-walker.chen@starfivetech.com>
References: <20230322094820.24738-1-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_024935_117929_129193E7 
X-CRM114-Status: GOOD (  12.47  )
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

The bit DMAC_CHEN[0] is automatically cleared by hardware to disable the
channel after the last AMBA transfer of the DMA transfer to the
destination has completed. Software can therefore poll this bit to
determine when this channel is free for a new DMA transfer.
This time requires at least 40 milliseconds on JH7110 SoC, otherwise an
error message 'failed to stop' will be reported.

Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 6cfcb541d8c3..6937cc0c0b65 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1147,7 +1147,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	axi_chan_disable(chan);
 
 	ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
-					!(val & chan_active), 1000, 10000);
+					!(val & chan_active), 1000, 50000);
 	if (ret == -ETIMEDOUT)
 		dev_warn(dchan2dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

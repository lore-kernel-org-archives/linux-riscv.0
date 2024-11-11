Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC7BD2E9C6
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 15:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BN5NgHsLARbMxSWWI9v6ydQGUuq/4xMKOp/yHJJ+9Jk=; b=1YXBxrUlTpQ/4V
	nuvWc7uEBbXgZRXZmRYKG3o/myFqoVfe7pAii+8oPb08JX1TyqVm6TJGI1aISRPcCSBSD53d/lYKP
	afEakOpv+Xv0irR2SD5u837TXgWXsjmzIoR6phFBWpZGKoXauUwHkncmcnqgJwJavAjuBagi6z6cO
	i+fbeklVqxlps8sP7DJ/v2FSYJCYL47DlvZJ9WcPlBVJ3LU2eTANS00MtAnLO4NSWx69t2tC9UN3D
	mu0IBEN19p2OREi42eoOf9c8aQh7dWkfIYL0fv8bvEpzyD9++3srLu2yX2PgbqIucBOdULomAQiJO
	rIZ5QzPtMb+kOcsYGnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAWKU-00000000SNA-3r0l;
	Mon, 11 Nov 2024 15:27:50 +0000
Received: from mta-03.yadro.com ([89.207.88.253])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAWKS-00000000SLx-1tV9
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 15:27:50 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 281FFE0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1731338863; bh=P1q9YtQSiOCqCWqQ13Z64MtWTXxNj/Gk+WZ4mFy36To=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=NZD7j3EbhZUrhEI3fCVRI7mKo9V1WQY41wB+6jTbuTSZys6Ye9EwIKIBGnPyrReyP
	 d7SMs4cJtkTupFxCONdT7V8T/H0uAq+VBzxoMGG5zyHK9myNwX+w/H5C9RUhte6tzx
	 3RCdO5tDKJN4mlNHVnb83pQu51T5s0RVo0mBrabP0rKjGH+ADbLeF2NIHdEjew35gi
	 Addbt5vW6wJZ807Syh7ED3PnUieQ2J9ltK441Ug7qs8ygXYzgzgpT1YLp4HNcbt4YO
	 tXRahaemKIOFc6GvPepWaUTKdf4lHc3kT6thw94kHxCsOq6VXQoeogYVWjGIUKUJUz
	 8TSwOnKtF/x+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1731338863; bh=P1q9YtQSiOCqCWqQ13Z64MtWTXxNj/Gk+WZ4mFy36To=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=kK8j2+KplXPT874qyOY8nFPUgBfjlNBOTz/s9ep3t7rhYLcUGsmvVtn3Jp/Yha/Mu
	 rL/6I8+7GkpQpRr4U5xgyXZyvwRx2ZU8xvcbHdwZVVulKen+R4FfPeZWd0rJXqHCbM
	 jCDR/V+Mc9+7gpsapwqxE+JDvggC1bA9PVMMcyLdXspXzLstX9QNnpyZBgJVBwMmba
	 ZNo1a1CpsUCzAIKY8Qg8UpblZ3GzR04u8BULy8jbflLaV4paF1dWJVOZ7UjBsbmLCv
	 0QbW/NEotO4JcoiWP+48/fkB+xzUMWOIzWBrNe5dV2u0a8gKZY4UxCGaz6bWWF0Hu1
	 FjK788xN+F0+A==
From: Nikita Proshkin <n.proshkin@yadro.com>
To: Green Wan <green.wan@sifive.com>, Vinod Koul <vkoul@kernel.org>
CC: <dmaengine@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux@yadro.com>, Nikita Proshkin <n.proshkin@yadro.com>
Subject: [PATCH 0/2] dmaengine: sf-pdma: Fix dma transfers errors handling
Date: Mon, 11 Nov 2024 18:25:58 +0300
Message-ID: <20241111152600.146912-1-n.proshkin@yadro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-ClientProxiedBy: T-EXCH-10.corp.yadro.com (172.17.11.60) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_072749_207553_E99FB1E2 
X-CRM114-Status: UNSURE (   4.76  )
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

Fix several problems in the sf-pdma driver related to handling situations
when the dma transfer fails (for example, due to IOMMU activities).

Nikita Proshkin (2):
  dmaengine: sf-pdma: Fix dma descriptor status reporting
  dmaengine: sf-pdma: Fix possible double-free for descriptors

 drivers/dma/sf-pdma/sf-pdma.c | 106 ++++++++++------------------------
 drivers/dma/sf-pdma/sf-pdma.h |   3 -
 2 files changed, 32 insertions(+), 77 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

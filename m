Return-Path: <SRS0=AS9l=YG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB117C4360C
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 13 Oct 2019 13:05:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 800B62085B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 13 Oct 2019 13:05:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pvVmQhmD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 800B62085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxY2OsUHMmYu+GEOYb4RcThQxvLqaUaXYrOJ0CVDM3A=; b=pvVmQhmD6qbIoe
	MH0WnOQwLHqvZFXCGwJzNuA6rjsQIXJU40pB/g1mTYBTjDHGEZSo3msSvmwnSa+5sqvUETHGoQcAX
	IRiSMqUzKgoS75uHMn7iPD9j12puOC1MERabWsLDYWy4L5xswwvkuVUAXI2UjX1tgEFY9iVTBFn6H
	TQ39xfU3RncwCi4eOvKuBb4TjKA38nZHjvq6yR0zrg4SM7vfVDWXicEaiaMslzPhTntv2XIEik+MU
	8G7JzRXAOKR3XdpkG6DxyDvkVjvWz9mcXBik1a3ojhs59TBvlB2enWQsbkBZ5S7mfG6EnLeyMPPml
	UwoOozGYue/rEwu9skEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJdYZ-0007Ol-Iy; Sun, 13 Oct 2019 13:05:07 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJdYV-0006e9-Jm
 for linux-riscv@lists.infradead.org; Sun, 13 Oct 2019 13:05:05 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Oct 2019 06:04:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,292,1566889200"; d="scan'208";a="185243091"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 13 Oct 2019 06:04:55 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iJdYN-000Aof-A8; Sun, 13 Oct 2019 21:04:55 +0800
Date: Sun, 13 Oct 2019 21:04:47 +0800
From: kbuild test robot <lkp@intel.com>
To: Green Wan <green.wan@sifive.com>
Subject: [RFC PATCH] dmaengine: sf-pdma: sf_pdma_disclaim_chan() can be static
Message-ID: <20191013130447.2t2hbjcaatguytm3@332d0cec05f4>
References: <20191003090945.29210-4-green.wan@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003090945.29210-4-green.wan@sifive.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191013_060503_711016_17C73203 
X-CRM114-Status: GOOD (  13.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, "Paul E. McKenney" <paulmck@linux.ibm.com>,
 Vinod Koul <vkoul@kernel.org>, linux-hackers@sifive.com,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Green Wan <green.wan@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>, kbuild-all@lists.01.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Yash Shah <yash.shah@sifive.com>, dmaengine@vger.kernel.org,
 Bin Meng <bmeng.cn@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


Fixes: 31c3b98b5a01 ("dmaengine: sf-pdma: add platform DMA support for HiFive Unleashed A00")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 sf-pdma.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 70197ad95c1a6..973ed9d8cfa44 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -97,14 +97,14 @@ static void sf_pdma_fill_desc(struct sf_pdma_chan *chan,
 	writeq(src, regs->src_addr);
 }
 
-void sf_pdma_disclaim_chan(struct sf_pdma_chan *chan)
+static void sf_pdma_disclaim_chan(struct sf_pdma_chan *chan)
 {
 	struct pdma_regs *regs = &chan->regs;
 
 	writel(PDMA_CLEAR_CTRL, regs->ctrl);
 }
 
-struct dma_async_tx_descriptor *
+static struct dma_async_tx_descriptor *
 	sf_pdma_prep_dma_memcpy(struct dma_chan *dchan,
 				dma_addr_t dest,
 				dma_addr_t src,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

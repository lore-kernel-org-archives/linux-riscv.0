Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39F1C25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 10:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m7K6pTXjHJkrNkQXeQIsqMNA6YQukhomZQ0seCrVWWQ=; b=2avfVfDsY3O2Zh
	ZKwmYV+xXbGZ8UhjUXvIri4XM8r5ufB/6zZemJ4CYDqjNYEjYIaKyO52+uWaZ6UxhMsnHrO0/S7Zo
	G1Fp8RvDrsP4r/bXNg3srcECIarpdn4EGcxcJErDvwir8UaW3X0IhwGuLFo6dd6peVbW/lf1KgfQk
	Hbxic9B796pAqL7v0AlHXNURwGoNXJisSsbp3QwBO3kAXGA588zrJyS9zNYrMDMlYRXzuCnuIP2t+
	ZPrVSLN/iNvCyMWfU0zQSbTD4uE9enUcrUyu1vcUqZU7kqr4deEoZqQt9PAMr48ohC/9ltwhGsaYm
	kgUVZV193WYUj36CnWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoNA-009hdF-2T; Fri, 20 Jan 2023 10:11:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIoIL-009fXF-4H
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 10:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674209209; x=1705745209;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s8RVOfsWfXmS7vuK9YlhjZHo4/cTdmhqpji15rJG740=;
  b=LChK2G1xnufqLSZVdogPVNJp1GO+tokLctdRu3f2DZlf1Xd+JjZLY+Nl
   li2F7dKzFQQqWcrShSvxiDq6OwZpMfPARuEPGPu/pMhAaIyQahhRZhXYd
   lQ/4AzcZg8O5mR8dbqMr6MIQckx1N7NntFinFhJqATnID9GoaVyqpqQJy
   9b/F3xkRpZSJrxPmcVrBx96BXX1KqnGJv+1rg98KaIyD8Gs/j/9uXo4p4
   dGttlLKbpFR+HruwC0wf/Hejpag4vBCoeI5ZPlBdXj6Hvt2mDxT0quhdQ
   wBTw1QGpMXbzGdQqrzlBPwP6eJa2j6CgmMBEWzDhQTcwfPejlB6Whi206
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669100400"; 
   d="scan'208";a="196675868"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 03:06:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 03:06:47 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 03:06:44 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <green.wan@sifive.com>, <vkoul@kernel.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<dmaengine@vger.kernel.org>, <shravan.chippa@microchip.com>
Subject: [PATCH v1] dmaengine: sf-pdma: pdma_desc memory leak fix
Date: Fri, 20 Jan 2023 15:36:23 +0530
Message-ID: <20230120100623.3530634-1-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_020649_297804_106ED686 
X-CRM114-Status: GOOD (  11.62  )
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

Commit b2cc5c465c2c ("dmaengine: sf-pdma: Add multithread support for a
DMA channel") changed sf_pdma_prep_dma_memcpy() to unconditionally
allocate a new sf_pdma_desc each time it is called.

The driver previously recycled descs, by checking the in_use flag, only
allocating additional descs if the existing one was in use. This logic
was removed in commit b2cc5c465c2c ("dmaengine: sf-pdma: Add multithread
support for a DMA channel"), but sf_pdma_free_desc() was not changed to
handle the new behaviour.

As a result, each time sf_pdma_prep_dma_memcpy() is called, the previous
descriptor is leaked, over time leading to memory starvation:

  unreferenced object 0xffffffe008447300 (size 192):
  comm "irq/39-mchp_dsc", pid 343, jiffies 4294906910 (age 981.200s)
  hex dump (first 32 bytes):
    00 00 00 ff 00 00 00 00 b8 c1 00 00 00 00 00 00  ................
    00 00 70 08 10 00 00 00 00 00 00 c0 00 00 00 00  ..p.............
  backtrace:
    [<00000000064a04f4>] kmemleak_alloc+0x1e/0x28
    [<00000000018927a7>] kmem_cache_alloc+0x11e/0x178
    [<000000002aea8d16>] sf_pdma_prep_dma_memcpy+0x40/0x112

Add the missing kfree() to sf_pdma_free_desc(), and remove the redundant
in_use flag.

Fixes: b2cc5c465c2c ("dmaengine: sf-pdma: Add multithread support for a DMA channel")
Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 3 +--
 drivers/dma/sf-pdma/sf-pdma.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 6b524eb6bcf3..e578ad556949 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -96,7 +96,6 @@ sf_pdma_prep_dma_memcpy(struct dma_chan *dchan,	dma_addr_t dest, dma_addr_t src,
 	if (!desc)
 		return NULL;
 
-	desc->in_use = true;
 	desc->dirn = DMA_MEM_TO_MEM;
 	desc->async_tx = vchan_tx_prep(&chan->vchan, &desc->vdesc, flags);
 
@@ -290,7 +289,7 @@ static void sf_pdma_free_desc(struct virt_dma_desc *vdesc)
 	struct sf_pdma_desc *desc;
 
 	desc = to_sf_pdma_desc(vdesc);
-	desc->in_use = false;
+	kfree(desc);
 }
 
 static void sf_pdma_donebh_tasklet(struct tasklet_struct *t)
diff --git a/drivers/dma/sf-pdma/sf-pdma.h b/drivers/dma/sf-pdma/sf-pdma.h
index dcb3687bd5da..5c398a83b491 100644
--- a/drivers/dma/sf-pdma/sf-pdma.h
+++ b/drivers/dma/sf-pdma/sf-pdma.h
@@ -78,7 +78,6 @@ struct sf_pdma_desc {
 	u64				src_addr;
 	struct virt_dma_desc		vdesc;
 	struct sf_pdma_chan		*chan;
-	bool				in_use;
 	enum dma_transfer_direction	dirn;
 	struct dma_async_tx_descriptor *async_tx;
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

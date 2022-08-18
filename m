Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C5CC00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 17:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QUfK52DbSQQ7MGwVp56RE+/7OOLlFPx46/LmyCiXZNc=; b=pml/qKBxvJiyU3
	O02XPdkcIcY9FOa8EasffNUMNjYDVTTx1W1VDHwlOd+EbrWlZsiwssPLcpZ+JhooNPHvDuNUT0pcz
	GLAJRa3ckqDY0eAcacg0Xxz00MCxfoNJSc1F3x//hn4d41f6Q3Rv4swTwASRwhSe6+EHsPQcbGY24
	TnkFCRpVjTaK8YTT/FLuTvzbRxx6yB+u3RXEwtcH47tZqPAb93P9gv/77owNfAg2mSqKScl74RRr9
	GlT4jXclLLR0yaM7l2QdVK7sMIVkt+VNBSls42Ez61zNLEl8gd69Tt3f5dwBLMUwwxBKIj8PPTNbf
	2Q19PNxBpdZzSzsCZa6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOite-007Mp5-C8; Thu, 18 Aug 2022 17:01:30 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOikr-007HYI-CG
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 16:52:27 +0000
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id B29CA4357D;
	Thu, 18 Aug 2022 16:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-type:content-type:content-transfer-encoding:mime-version
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received:received:received; s=mta-01; t=1660841522; x=
	1662655923; bh=md5JFpnkVl7HHH6Kay+e0eL0WmCL9HLNwA8+YmwCHyY=; b=Y
	LxeZOgkPkOzMs7lCl1IF/6uBM0EeKt1orLOzPc4xYzfpsQRX1On5DCs3tXYtv4Jf
	8JEoIVFBZCpBk8ra3PyZeHGEGPpBhw7Tnx7/raINh5EvlZ/cFrVVHwMi6BjBYU6d
	uO3CNj9rKcfbOeB01s5/5kFcljR7CqFMdDiO9Vy1fs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1JBDA0UCKGZ; Thu, 18 Aug 2022 19:52:02 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id E1CD6435AC;
	Thu, 18 Aug 2022 19:51:45 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 18 Aug 2022 19:51:45 +0300
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 18 Aug
 2022 19:51:45 +0300
From: Sergei Miroshnichenko <s.miroshnichenko@yadro.com>
To: Heiko Stuebner <heiko@sntech.de>, Samuel Holland <samuel@sholland.org>
CC: <linux-riscv@lists.infradead.org>, <linux@yadro.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Sergei Miroshnichenko <s.miroshnichenko@yadro.com>
Subject: [PATCH] riscv: dma-mapping: Use conventional cache operations for dma_sync*()
Date: Thu, 18 Aug 2022 19:51:05 +0300
Message-ID: <20220818165105.99746-1-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Originating-IP: [172.17.15.136]
X-ClientProxiedBy: T-EXCH-02.corp.yadro.com (172.17.10.102) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_095225_817270_66588D16 
X-CRM114-Status: GOOD (  15.09  )
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

Support of arch_sync_dma_for_{device,cpu}() for RISC-V was added recently.

Currently, for_cpu(FROM_DEVICE) uses the flush (writeback plus invalidate)
cache operation, which can overwrite the data (received from a device via
DMA) with dirty cache lines. Replace it with the inval to avoid data
corruptions.

The same goes for for_cpu(BIDIRECTIONAL), it was also flushing the cache,
but it is called after the device had owned the buffer. So in order to not
loose the received data, stick to the inval here as well.

As of for_device(FROM_DEVICE), according to the inspirational discussion
about matching the DMA API and cache operations [1], the inval or a no-op
should be here, and this would resonate with most other arches. But in a
later discussion [2] it was decided that the clean (which is used now) is
indeed preferable and safer, though slower. The arm64 has been recently
changed in the same way [3].

[1] dma_sync_*_for_cpu and direction=TO_DEVICE
Link: https://lkml.org/lkml/2018/5/18/979

[2] Cache maintenance for non-coherent DMA in arch_sync_dma_for_device()
Link: https://lore.kernel.org/all/20220606152150.GA31568@willie-the-truck/

[3] commit c50f11c6196f ("arm64: mm: Don't invalidate FROM_DEVICE buffers at start of DMA transfer")

Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
Signed-off-by: Sergei Miroshnichenko <s.miroshnichenko@yadro.com>
---
 arch/riscv/mm/dma-noncoherent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index cd2225304c82..2a8f6124021f 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -45,7 +45,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		break;
 	case DMA_FROM_DEVICE:
 	case DMA_BIDIRECTIONAL:
-		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
 		break;
 	default:
 		break;
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

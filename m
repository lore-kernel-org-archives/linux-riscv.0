Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4C9C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 06:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEhG3UDBGrF9eozrBYTSaHt+vmJr2YMKurIIREQ2kgc=; b=KP8HEcBgmOiaHi
	UJzTeH0Y7JuqEGN47roMP5SGE8iAsJQFdwTJVeiRd2PIUc7RJqMt2Z5NvYIg2aMxjfsKlAJhqfIBg
	SVfGR+4IMbPHdrHXxz+7RYCyIM/jjiMRuQdkDV+jhUFPyjA2ydTLPdMQnGrm1rzCy1ULWz4ZtLuBZ
	oTO4UZcP1u1/nDP7rCGIqTNjRh7yN7FpWiYcKb2C4YwrLTQijZutKN1Py9BhsMwLcUPqoCOR3FPy6
	8AgjDa6WJjmQbWflSv0vc8PeUUfVQ3TMSz0D2GvX846oxSG1yxE/8H12lwECKQrk2Pb9Q2+jgA/RU
	AGR0QIB6WbAPcOWbMHyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nofkA-005Pfx-I2; Wed, 11 May 2022 06:22:42 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nofk7-005PcO-HQ
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 06:22:40 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id F317F68BEB; Wed, 11 May 2022 08:22:32 +0200 (CEST)
Date: Wed, 11 May 2022 08:22:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Conor.Dooley@microchip.com
Cc: hch@lst.de, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: linux-next: Tree for May 3
Message-ID: <20220511062232.GA32524@lst.de>
References: <20220503172926.08215c77@canb.auug.org.au>
 <3f94c9a8-c927-5cc0-7d67-4b21c3d9dbaf@microchip.com>
 <9a424be9-380f-f99c-4126-25a00eba0271@microchip.com>
 <20220509141122.GA14555@lst.de>
 <dd946220-eaf6-773a-06b4-307cda466c9c@microchip.com>
 <505d41d1-1bc8-c8bc-5ebb-8a2b7934f3de@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <505d41d1-1bc8-c8bc-5ebb-8a2b7934f3de@microchip.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_232239_785520_827CE37B 
X-CRM114-Status: UNSURE (   8.34  )
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

Can you try this patch?

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index e2ef0864eb1e5..856179f27f608 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -234,7 +234,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 {
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = default_nslabs;
-	size_t alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
+	size_t alloc_size;
 	size_t bytes;
 	void *tlb;
 
@@ -267,12 +267,13 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		goto retry;
 	}
 
+	alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
 	mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
 	if (!mem->slots)
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	swiotlb_init_io_tlb_mem(mem, __pa(tlb), default_nslabs, false);
+	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
 	mem->force_bounce = flags & SWIOTLB_FORCE;
 
 	if (flags & SWIOTLB_VERBOSE)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

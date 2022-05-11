Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2B8C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 06:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/5B2TUB15gZ4rjAJ80fUeDeMLkDLG/pJYJYhDVuGjU=; b=LrEi7yPWQ1vsnT
	IYygM60TXtx99bLwpq5HNHBxcUIX44H6Xk+Bw8SK2oYm0WVxl7CbQIKF4VFsLSb02VpaqhxnBjWKc
	CMsmdRQMwPdaP6fKlaYbo+Y8/u1I9zUkbB6eV5H8JpludLzJ07T8mODWXHsrzlUiuaGh3x8QTFlHY
	1eypWYyV5Pge1NOFDzELob0sPybxtYm/dAeVRI6PY0hMeKuaS+8Zm21gWG7LSYkgeOwgSlc8lKfa/
	U+Rb3EIn7t4e/sPTRH3cmn8onwBOGuR7dLpAPGSsIUwznLo0GATPFF66k2ke6Feh2TWMqukK2LAKI
	MlupoRZ4OylZVQQtMMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nog9H-005XoH-PK; Wed, 11 May 2022 06:48:39 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nog9F-005XmO-0M
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 06:48:38 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 91C3D68BFE; Wed, 11 May 2022 08:48:32 +0200 (CEST)
Date: Wed, 11 May 2022 08:48:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Conor.Dooley@microchip.com
Cc: hch@lst.de, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: linux-next: Tree for May 3
Message-ID: <20220511064832.GA761@lst.de>
References: <20220503172926.08215c77@canb.auug.org.au>
 <3f94c9a8-c927-5cc0-7d67-4b21c3d9dbaf@microchip.com>
 <9a424be9-380f-f99c-4126-25a00eba0271@microchip.com>
 <20220509141122.GA14555@lst.de>
 <dd946220-eaf6-773a-06b4-307cda466c9c@microchip.com>
 <505d41d1-1bc8-c8bc-5ebb-8a2b7934f3de@microchip.com>
 <20220511062232.GA32524@lst.de>
 <102578f2-5c10-e9c2-c1ef-e76ba90d011e@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <102578f2-5c10-e9c2-c1ef-e76ba90d011e@microchip.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_234837_233689_88906BB0 
X-CRM114-Status: GOOD (  16.16  )
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

On Wed, May 11, 2022 at 06:44:22AM +0000, Conor.Dooley@microchip.com wrote:
> On 11/05/2022 07:22, Christoph Hellwig wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Can you try this patch?
> 
> Hey Christoph, gave it a try but nfortunately, no joy!

Yes, while it is a real fix, the problem it fixes can only happen
with Xen, which is not relevant to riscv.  The only other thing I
can think off is that the allocations were always failing on your
board, and the patch makes that failure fatal.  For that try the
patch below.  I'd also be really curious by now about the kernel
logs from a successful boot.

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index e2ef0864eb1e5..3e992a308c8a1 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -254,8 +254,10 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		tlb = memblock_alloc(bytes, PAGE_SIZE);
 	else
 		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
-	if (!tlb)
-		panic("%s: failed to allocate tlb structure\n", __func__);
+	if (!tlb) {
+		pr_warn("%s: failed to allocate tlb structure\n", __func__);
+		return;
+	}
 
 	if (remap && remap(tlb, nslabs) < 0) {
 		memblock_free(tlb, PAGE_ALIGN(bytes));

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

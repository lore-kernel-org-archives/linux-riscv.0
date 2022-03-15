Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F4AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Mar 2022 00:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0KDEsHVI85mFgW3PCA+cAL0jw8X/8idYF/X7G+KqiG8=; b=b3OnQBQsb3xDBO
	Oqx/8D+TaWmY89zHtpnnCImOKDSzpfRstRlrKXA90VnPcApRMVJLD3ANC7XApb0s1q5vKJFu0w9+C
	TiX7daMwpKJtT1nTs1P9dbbXl7kPAfM6lheqmj5cIxQ8pkwqaSCY9BjDxtrJnA33m3EWv5di6Q0yW
	K8NQAVBMLoqi85VQsro1BTIWRbiLs4qe2ppz3cY6frAjtYor5sWAqC1VJmUD37EpctmfPx27ucyBx
	EjTCt8lAcU6+7YUgrONWrbZJQwbGqdaHHpkjs2LsVbC8k63MKl/w5KPFV/2WzpjHbwGFUfkJTlbfF
	75n36S5VLTJ72R0txPzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTubs-007E7K-Tq; Tue, 15 Mar 2022 00:00:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTubh-007E4E-T2; Tue, 15 Mar 2022 00:00:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1D754CE16F9;
 Tue, 15 Mar 2022 00:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82170C340E9;
 Tue, 15 Mar 2022 00:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647302404;
 bh=qF2Kiv1yBWM6zFZu7vu4vkmgVsDPPK9bUwo+CMzG77s=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=CxQznLVvPAMHVLObot/GbKAGNBs3wp/Zo7J//e5fa5RGl/JAcrYpHk7dFYXJ+dCyc
 yFp/t/ucQtYgdUQQRIyugjt0bw6neR65fWz4Mw2wQpqjjnNDOhxJr7SqJvB+dScWOI
 FWaPNn7YRGzQ0CCDI4WX3HGCjk3WcedTK4ZKrUhQL/ZjI62kK/fSKVT6fnNg8LwsV7
 O+N86nVOy9ALX/s25HJpQGYpv30ak+B6D/CFn8xWL4gwGSW9Q/HStnRPdXpxBq2xEr
 XfmlQm0hAt72Py8IAnH8MpwztAqekJ4fXRmnodDkCqvESbpDzlwteZaCwLl1CvtOpX
 4SrZDmHAzylBg==
Date: Mon, 14 Mar 2022 17:00:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
cc: iommu@lists.linux-foundation.org, x86@kernel.org, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tom Lendacky <thomas.lendacky@amd.com>, 
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>, 
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net, 
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 13/15] swiotlb: merge swiotlb-xen initialization into
 swiotlb
In-Reply-To: <20220314073129.1862284-14-hch@lst.de>
Message-ID: <alpine.DEB.2.22.394.2203141659210.3497@ubuntu-linux-20-04-desktop>
References: <20220314073129.1862284-1-hch@lst.de>
 <20220314073129.1862284-14-hch@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_170010_165166_95BF2419 
X-CRM114-Status: GOOD (  10.11  )
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

On Mon, 14 Mar 2022, Christoph Hellwig wrote:
> Reuse the generic swiotlb initialization for xen-swiotlb.  For ARM/ARM64
> this works trivially, while for x86 xen_swiotlb_fixup needs to be passed
> as the remap argument to swiotlb_init_remap/swiotlb_init_late.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

For arch/arm/xen and drivers/xen/swiotlb-xen.c

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

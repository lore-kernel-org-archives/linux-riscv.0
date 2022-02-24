Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDCEC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 10:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ijP0z3Vxca45xEPtsxxuA/RHFLQqZ4zM+JPw/LV3BkY=; b=suBZR0aVAhsQWuA9uwAjGeLLFo
	Lpesp1fXijWiJTf9//wVPv/nkYut5ki9n4oQw+ZoXW8pJw0z5j3bW88/quxxS0eOhwOG3WqYEvYz8
	IKlezBk+8Sofjrzqgg52+HFTw9fWBay9OjtDHsBIIULzlt86aqGZe80h2XnzM1FePSvSw+/LztaYX
	+mj2wIKW/IYKqVoI9yALg4HhGEzX3XBpraUet5HrACeevZiWq711AnyWCqgyu7yYHnoEAwIG447Tl
	VVn9AFxTmJgeVMoG51BJRbY34X2KoGGaFxUwxL8w6WLTYIqUblRUl+8ghAaGyf+/lTQDm1S0oOBMG
	pXeR4Zjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNBLE-000K2O-My; Thu, 24 Feb 2022 10:27:20 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNBKv-000Jts-Qw; Thu, 24 Feb 2022 10:27:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98A7B14BF;
 Thu, 24 Feb 2022 02:27:00 -0800 (PST)
Received: from [10.163.48.178] (unknown [10.163.48.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B93F3F70D;
 Thu, 24 Feb 2022 02:26:54 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 01/11] dma-direct: use is_swiotlb_active in
 dma_direct_map_page
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
Cc: x86@kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org
References: <20220222153514.593231-1-hch@lst.de>
 <20220222153514.593231-2-hch@lst.de>
Message-ID: <29452ad3-9db9-49d5-f91c-cb8507633ec0@arm.com>
Date: Thu, 24 Feb 2022 15:56:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220222153514.593231-2-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_022701_994714_32B4F7B0 
X-CRM114-Status: GOOD (  15.26  )
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



On 2/22/22 9:05 PM, Christoph Hellwig wrote:
> Use the more specific is_swiotlb_active check instead of checking the
> global swiotlb_force variable.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  kernel/dma/direct.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
> index 4632b0f4f72eb..4dc16e08c7e1a 100644
> --- a/kernel/dma/direct.h
> +++ b/kernel/dma/direct.h
> @@ -91,7 +91,7 @@ static inline dma_addr_t dma_direct_map_page(struct device *dev,
>  		return swiotlb_map(dev, phys, size, dir, attrs);
>  
>  	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
> -		if (swiotlb_force != SWIOTLB_NO_FORCE)
> +		if (is_swiotlb_active(dev))
>  			return swiotlb_map(dev, phys, size, dir, attrs);
>  
>  		dev_WARN_ONCE(dev, 1,
> 

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00BCC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Mar 2022 06:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XiQQ/k1e0OK8INDwy8eFgt0xRV47U1FfV5zu++hk+1Q=; b=cBEdSpWkygw9A0
	YHpySC7++idcnFm/ZFLcyjaiGrPFxomu8KoT1WbREBoyJA/vnbHJTA+S3e73yYfu/KxMKAz/c1ysS
	1aUC4n7KsGpzkqNuxPGeqW4rLzFMcoCiMGnzcEzWsdbZaWuEIKfdHBUrK2ZD2SYYwW/8T092RquY8
	JZKWs59TEffBX4F/wO+Tc/kTtJpK9t6TbjyiBMPLOf2SDZUFr1Y/02qPBOlQWA91Y+wtaAxNbQ74W
	gkWxZmxaako1Fg6pFaI361w6wb2vkBAOGKX0Xx3ga+F0FZONRx3ocxorSpgHQDIBBv0NQHVxuC6jt
	fOM06iWwdW/YOSh1/uYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRpf3-007UmI-HX; Wed, 09 Mar 2022 06:19:01 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRpen-007Uh9-20; Wed, 09 Mar 2022 06:18:46 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id A4A1568AFE; Wed,  9 Mar 2022 07:18:40 +0100 (CET)
Date: Wed, 9 Mar 2022 07:18:40 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
 x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Message-ID: <20220309061840.GA31435@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <6a22ea1e-4823-5c3b-97ee-a29155404a0d@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a22ea1e-4823-5c3b-97ee-a29155404a0d@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_221845_295022_E748C464 
X-CRM114-Status: GOOD (  17.15  )
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

On Tue, Mar 08, 2022 at 04:38:21PM -0500, Boris Ostrovsky wrote:
>
> On 3/1/22 5:53 AM, Christoph Hellwig wrote:
>> Allow to pass a remap argument to the swiotlb initialization functions
>> to handle the Xen/x86 remap case.  ARM/ARM64 never did any remapping
>> from xen_swiotlb_fixup, so we don't even need that quirk.
>
>
> Any chance this patch could be split? Lots of things are happening here and it's somewhat hard to review. (Patch 7 too BTW but I think I managed to get through it)

What would be your preferred split?

>> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
>> index e0def4b1c3181..2f2c468acb955 100644
>> --- a/arch/x86/kernel/pci-dma.c
>> +++ b/arch/x86/kernel/pci-dma.c
>> @@ -71,15 +71,12 @@ static inline void __init pci_swiotlb_detect(void)
>>   #endif /* CONFIG_SWIOTLB */
>>     #ifdef CONFIG_SWIOTLB_XEN
>> -static bool xen_swiotlb;
>> -
>>   static void __init pci_xen_swiotlb_init(void)
>>   {
>>   	if (!xen_initial_domain() && !x86_swiotlb_enable)
>>   		return;
>
>
> Now that there is a single call site for this routine I think this check can be dropped. We are only called here for xen_initial_domain()==true.

The callsite just checks xen_pv_domain() and itself is called
unconditionally during initialization.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C953CA5FF1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 12:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B5lq+ifNCft6hc/d8iCO7NESJGqP0S+rFLUc1AJ0unk=; b=Lrr1Qtukht8II8
	xeUE4fRTP8cP5QamFteuLqgV0t+XxP/l3p1LtqJG3P/BaZNYbLC1/S4V5EXb5pVQI2l6xwTsC6ed5
	B0crC63BYT1Cnudn65gtxA/t1aYKUqbbDdE+4Xi0CSZ8nEeR1GrDnr/U9I6buutkfFoNtjX8ma0BH
	4r64Yn97EI9zQHdI+V1jxi/B8tyyq0g/Y//KW2oilgWpUk/YMwu7SccETpAz2DyU5iB2HwG2t5BWk
	7zCOQNkNtMcaAZLASZCYgJwGRWc9iqIkDPGqljZ2VPBtgLXsmc9Xez62qDs02L5YgugmKD+Lxxk/P
	8LmpxbHfFfV5AfY9toDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQYj-00000002QJK-04gR;
	Wed, 07 Oct 2026 12:15:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQYe-00000002QIT-15X5;
	Wed, 07 Oct 2026 12:15:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 30AC24136F;
	Wed,  7 Oct 2026 12:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E961F0089B;
	Wed,  7 Oct 2026 12:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791375339;
	bh=THCKMx4ZCnm8mOHpovi4eI/Rqy36KGJtBfYIVu2eZq8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Bfl8aja+VSRTna257B4Gm2/By+1W2Nv4TQy25TzrHnAFX8A1jdDrmXdZ3WzgIyzp8
	 jBTkfVwJtKCnodEsgOCFyt/BfpUeE6IZHCbxRI9zna/h0rF0LbfWDm9i4r2aHrawGI
	 IGfikya6X0AbG64Zsqz5emGEUelpLSovqtyGoPLiIVKkvcZkkrJMeSGpIXUcZvpiUG
	 mO1yAEOlwfQ1bj2VR8aFJGvRCIWlqYxiNFzVrp24UHu7ugy8E3RDe8t8FmvS7Zeixg
	 2pF40rwJ7JSNIgBhu+4qSL0O0WS2aBAOGN6PLwSVDSRzDWBbTgQlO/Dl8ONXKChE5p
	 yOivzKvQiEetQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v6 6/8] dma: swiotlb: Centralize memory-encryption pool
 sizing
In-Reply-To: <asYiOgskwi8JYLe_@willie-the-truck>
References: <20260924060756.1325156-1-aneesh.kumar@kernel.org>
 <20260924060756.1325156-7-aneesh.kumar@kernel.org>
 <asVs3doaJ4WrT3M2@willie-the-truck> <asYZFXGyafRjjBS0@arm.com>
 <asYiOgskwi8JYLe_@willie-the-truck>
Date: Wed, 07 Oct 2026 17:45:19 +0530
Message-ID: <yq5awlrt3dwo.fsf@kernel.org>
MIME-Version: 1.0
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

Will Deacon <will@kernel.org> writes:

> On Wed, Oct 07, 2026 at 11:04:05AM +0100, Catalin Marinas wrote:
>> On Tue, Oct 06, 2026 at 10:49:17PM +0100, Will Deacon wrote:
>> > On Thu, Sep 24, 2026 at 11:37:54AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> > > @@ -496,7 +516,8 @@ swiotlb_select_pool_policy(unsigned int flags)
>> > >  	if (swiotlb_force_disable)
>> > >  		return SWIOTLB_POOL_NONE;
>> > >  
>> > > -	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
>> > > +	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
>> > > +	    !restricted_dma_pool_present)
>> > >  		return SWIOTLB_POOL_CC_GUEST;
>> > 
>> > I think this check on the restricted DMA pool is too general -- the pool
>> > could be tied to a specific DMA-capable peripheral and so treating its
>> > presence as a global property isn't right.
>> 
>> I agree it's a hack but that was the simplest way to avoid the pVMs
>> getting a bounce buffer after this patch. More than happy to leave it
>> out and reduce the buffer on cmdline or we come up with some better
>> heuristics.
>
> Hrm, that does mean that reverting just this part will regress pVMs
> because they'll suddenly be allocating a tonne more memory for an
> entirely unused swiotlb buffer. So I think I'd prefer to drop the entire
> series until this has been worked out properly.
>
>> Another option could be the arch code passing another flag that it
>> doesn't want an encrypted pool (e.g. when running in a pKVM guest) but I
>> don't particularly this either. The arch code doesn't know whether
>> there's an alternative pool.
>
> At that point, the default size may as well be driven by the
> drivers/virt/coco driver.
>
>> That said, such heuristics should have been a separate patch to make it
>> easier to review/drop.
>
> I think the only right way to get a semi-accurate heuristic is to take
> into account the set of dma-capable devices that will use the swiotlb
> pool, but that's fiddly and should probably be tackled as a separate
> series. Maybe a simpler hack in that direction would be to take the
> SWIOTLB_POOL_CC_GUEST if _any_ device is going to use swiotlb? You'll
> run into the usual problem of not being able to tell if a device is
> DMA-capable or not, but you could probably look for a global restricted
> DMA pool and, if that doesn't exist, check for per-device restricted pools
> on dma-coherent devices (since restricted DMA isn't supported by ACPI) as
> a reasonable approximation.

So, something like this?

	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
	    swiotlb_cc_guest_needs_default_pool())
		return SWIOTLB_POOL_CC_GUEST;

where:

static bool swiotlb_cc_guest_needs_default_pool(void)
{
	for_each_of_allnodes(np) {
		if (swiotlb_of_dma_needs_default_pool(np))
			return true;
	}

	return false;
}

I didn't quite follow the ACPI-related feedback. IIUC, on ACPI systems
we will end up using SWIOTLB_POOL_CC_GUEST?

-aneesh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

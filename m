Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E754ACA6007
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 10:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hM7rCEs1WGdcDbtWa1uyWiLVU+Om29YgnUW3rUenjUQ=; b=xFxIHQfb6i4Vq5
	H4M2om4QrT5iXdtCxSz8Qvwx1qnKThwa/s5IvvFD2g9SbseXMgjEunSxoj3Hw3UpJ7g67o5lYZDAw
	vQOqb/RSnq4ipRcej4/ZPkOqbdayEBWLfgTuI67lWGRVVrDS0lhgo+r6he7qCc64NmtVUoYlcYoCN
	QcxhKBkqS0WmwqkZ+WxtTMwkpkBsa/2WeMEKY05B//pA80eRroVgbSakc27Q8x34a7lNO6Rrr6URE
	3CINsdL+qatIeIje0hqqQe5em6+CE9u94Rw/ipAWfiF5M6f+2dEvPIJaiV+H1n8KVwS5t3gUc/Kpe
	DV4ZxXVrCeKIGoEl7s1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEl0p-000000043jZ-0PQP;
	Thu, 08 Oct 2026 10:06:07 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEl0h-000000043ia-1zKW;
	Thu, 08 Oct 2026 10:06:03 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261008100554euoutp01b5e0785e05ac13ce90bc8734175063c9~cheFafjgw1538215382euoutp01k;
	Thu,  8 Oct 2026 10:05:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261008100554euoutp01b5e0785e05ac13ce90bc8734175063c9~cheFafjgw1538215382euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791453954;
	bh=thtf1qJ6pn16hrB0yVRIR4hu2iu+45ubB7fAojJOTKk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Ffs2UN8c+lhZVqPctNaH71dPdZgnpC9GBlMn0Pu2AcLvwJRnzKjKW20rP+N6NAx9b
	 CYu4cNuLEL9aRm/we2ZsXI8ZwYfFuet/9PCopkwaDO1nNYEjGFMkZ3hD/E2nWjucJq
	 9wC1LP/UsovOldkgXNkvScaIRbrdmfyP5AHC36lI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261008100554eucas1p27f258fa39628a4434038c547a2acf284~cheFLOkCq3274432744eucas1p2u;
	Thu,  8 Oct 2026 10:05:54 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261008100550eusmtip1ffb5506b783e810998439d4d6ef58931~cheBSDOkD2330023300eusmtip1S;
	Thu,  8 Oct 2026 10:05:50 +0000 (GMT)
Message-ID: <bc0fdf46-eaf6-49b9-a015-1742c66829a6@samsung.com>
Date: Thu, 8 Oct 2026 12:05:49 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v6 6/8] dma: swiotlb: Centralize memory-encryption pool
 sizing
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, Robin Murphy
	<robin.murphy@arm.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Mark
	Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Steven Price
	<steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Jiri
	Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh
	<smostafa@google.com>, Petr Tesarik <ptesarik@suse.com>, Alexey
	Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, Xu
	Yilun <yilun.xu@linux.intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)"
	<ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Alexander
	Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
	Gorbik <gor@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Stefano
	Stabellini <sstabellini@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, Jiaxun Yang
	<jiaxun.yang@flygoat.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <asYiOgskwi8JYLe_@willie-the-truck>
X-CMS-MailID: 20261008100554eucas1p27f258fa39628a4434038c547a2acf284
X-Msg-Generator: CA
X-RootMTR: 20261007104325eucas1p2277d74db794e285f33038204d52dc843
X-EPHeader: CA
X-CMS-RootMailID: 20261007104325eucas1p2277d74db794e285f33038204d52dc843
References: <20260924060756.1325156-1-aneesh.kumar@kernel.org>
	<20260924060756.1325156-7-aneesh.kumar@kernel.org>
	<asVs3doaJ4WrT3M2@willie-the-truck> <asYZFXGyafRjjBS0@arm.com>
	<CGME20261007104325eucas1p2277d74db794e285f33038204d52dc843@eucas1p2.samsung.com>
	<asYiOgskwi8JYLe_@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_030600_099874_E04EE169 
X-CRM114-Status: GOOD (  16.34  )
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

On 07.10.2026 12:43, Will Deacon wrote:
> On Wed, Oct 07, 2026 at 11:04:05AM +0100, Catalin Marinas wrote:
>> On Tue, Oct 06, 2026 at 10:49:17PM +0100, Will Deacon wrote:
>>> On Thu, Sep 24, 2026 at 11:37:54AM +0530, Aneesh Kumar K.V (Arm) wrote:
>>>> @@ -496,7 +516,8 @@ swiotlb_select_pool_policy(unsigned int flags)
>>>>  	if (swiotlb_force_disable)
>>>>  		return SWIOTLB_POOL_NONE;
>>>>  
>>>> -	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
>>>> +	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
>>>> +	    !restricted_dma_pool_present)
>>>>  		return SWIOTLB_POOL_CC_GUEST;
>>> I think this check on the restricted DMA pool is too general -- the pool
>>> could be tied to a specific DMA-capable peripheral and so treating its
>>> presence as a global property isn't right.
>> I agree it's a hack but that was the simplest way to avoid the pVMs
>> getting a bounce buffer after this patch. More than happy to leave it
>> out and reduce the buffer on cmdline or we come up with some better
>> heuristics.
> Hrm, that does mean that reverting just this part will regress pVMs
> because they'll suddenly be allocating a tonne more memory for an
> entirely unused swiotlb buffer. So I think I'd prefer to drop the entire
> series until this has been worked out properly.
I've dropped the entire series from dma-mapping-for-next. Aneesh, please respin
it again and move the pKVM/restricted_dma_pool related code into the separate
patch.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

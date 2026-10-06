Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BB3CA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 21:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RiOdgyVZITUaGD9q8Z31CgvNKCeVcvIiFg/MWafhZBY=; b=WxWvcYYU5mnUnU
	Ic16buaL1iphD5y9EYX7zOslZ5erDJHZG+TVf+iIVXQYqmAH6eyTWZ/ja8R4ocs06a4tDUmXYjDxc
	YSE1k5kqrtwj9v+n2H3RhZuZe52boPdgomykuDMpKVTJJk3lN0MXHPdDCD78cl23653xCAJNlKQF0
	HHc30uTdkla/7NPrH79qUdNB4nWDch5dkS04B513ncikiUmdt7nK9fc/x0eHwjW/1EnEN9Do7yfRN
	nTP9k1vIvW2elyCW0OuV+TMqUJg/7tVLkESs7AP57e8+WJO2gCERFwFC+2hOhrMFec/6WrJ7uUHci
	3kpfFu22zpEMoB255T0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xED5Y-00000001QRQ-3OSD;
	Tue, 06 Oct 2026 21:52:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xED5X-00000001QR4-0ufX;
	Tue, 06 Oct 2026 21:52:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B2F643AE3;
	Tue,  6 Oct 2026 21:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5A61F0089B;
	Tue,  6 Oct 2026 21:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791323562;
	bh=aLltj2KeDqF9OosT0AEoWFskj5jYY5VnqnzaqsV3VgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ftqi5JxYQ7+lOH0e3/qLZoDI1z82JKInnQfYcKqixAXYDv4KmRLetT2yf6MF8YU1u
	 kUk9ToRlzIe8Nl1vp2TYck54k5ulwPMNvsOqte7ISHa1gh1TIEKVm+Z5mbwpXSF1AD
	 crVr7MkSiyiM2du+fk37Zp93ECnO4ni6RGEVcicG7VzMtvaS8p6SOzT+i9R5N0nIz1
	 /esNqVbVK14/jTVs7oNE7q6G/lw1RUNITEX+RT16CVY0u83mLVBpntBf5Str+DsaJe
	 LT4RGmc1J/WMANFyagqs0E7dcbEUuVDQE0vhXKYthrpnZNsogcBHN1Y8oBt35CXUDx
	 Enb5fk2CRE8Ww==
Date: Tue, 6 Oct 2026 22:52:29 +0100
From: Will Deacon <will@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
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
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v6 0/8] dma: swiotlb: Centralize default pool policy and
 sizing
Message-ID: <asVtnRSeHRJr5mp3@willie-the-truck>
References: <CGME20260924060823eucas1p1d27fbf57221c9b4c0e9831a9b0cdd7d3@eucas1p1.samsung.com>
 <20260924060756.1325156-1-aneesh.kumar@kernel.org>
 <ff4f59ea-6c51-41d6-a92d-d1dd205b1e78@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff4f59ea-6c51-41d6-a92d-d1dd205b1e78@samsung.com>
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

On Tue, Oct 06, 2026 at 11:42:54PM +0200, Marek Szyprowski wrote:
> On 24.09.2026 08:07, Aneesh Kumar K.V (Arm) wrote:
> > This series centralizes swiotlb default-pool selection and sizing, and
> > simplifies the initialization flags used to describe pool placement.
> >
> > The first patch replaces the addressing-limit argument with initialization
> > flags and introduces explicit policies for the different reasons a default
> > pool may be needed. Architectures now report DMA addressing constraints with
> > SWIOTLB_INIT_ADDRESSING_LIMIT, while the core selects the corresponding pool
> > policy.
> >
> > The second patch moves the reduced sizing used when the pool is needed only
> > for unaligned kmalloc bouncing from arm64 and RISC-V into the swiotlb core.
> >
> > The third patch centralizes swiotlb sizing for memory-encrypted systems. It
> > moves the existing x86 guest-sizing policy into the core. Host memory
> > encryption retains the normal pool size, and a shared default pool is not
> > selected solely for guest memory encryption when a restricted DMA pool is
> > present.
> >
> > The fourth patch removes SWIOTLB_ANY. Pool placement is derived directly from
> > SWIOTLB_INIT_ADDRESSING_LIMIT: pools required for limited DMA addressing are
> > allocated below the architecture's low address limit, while other pools may
> > be allocated anywhere in directly mapped memory. Xen continues to request a
> > pool explicitly with SWIOTLB_INIT_REMAP without imposing a low-address
> > constraint.
> 
> 
> I will give this patchset a chance in linux-next. If one feels that it still needs
> to be improved or sees any other reason why it shouldn't be merged, let me know
> asap.

I think the restricted-dma pool heuristic is horribly naive, so please drop
that part for now.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

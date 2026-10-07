Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE78CA5FFF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qgmQnMIOfa8uLgyaRz05eJN+OVLUxQNifa4ckxsJBio=; b=xnKK72YhsaUBRL
	ptV9hwd2VhBTF++TRX9x7VgwCt9OFoDb60SuEwZgtd6+ypnrIK0u9D2IiS4Of2H1OaVQtd7caH1Y7
	I4cfG7KI+6wf2JwU6Q/8FH6eo5KTBQy8NsPfb+x1oh2VHUwT7NG2Fp6l5lv0iZGJoPq8XqGXIutt1
	VpLr6HWJfA0Dl/p348Kf+iHtghC1qB8q2Xo0V+exw11dd/rbI5LMpgU40oFo8RJP2pJHKc2AsbMzA
	LXACsx31A3Z47NBkuJYXZnpow+fao+Xfk7ahqxwPlP1PFzsxyo6kEL2/H60tvSDefzmeobgU363+s
	Dwruy93ZlIqKhP1zH+Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOVZ-000000027rp-1vV8;
	Wed, 07 Oct 2026 10:04:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOVV-000000027rP-2qis;
	Wed, 07 Oct 2026 10:04:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85BE1152B;
	Wed,  7 Oct 2026 03:04:12 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D0133F86F;
	Wed,  7 Oct 2026 03:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791367455; bh=CbXWi9ehHUC17LrX7h7fiWJISOx4QxW252o3EdbyLB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvDQmLy4EGj89GAfvZk4KGPda4lF9dF5oeqcn5GaKKWzv0KKEFA+8t3r7QqyDC8G5
	 15dMv0AaR5+XBy9C4yatPq0j3+EwXMtpi531/x06RJAiNh8Dw7kgMptDkWV6AFLItD
	 7tFE/6cK6Ee5diPXgRQlJIGJZozxaEJpY12Bwfsw=
Date: Wed, 7 Oct 2026 11:04:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
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
Subject: Re: [PATCH v6 6/8] dma: swiotlb: Centralize memory-encryption pool
 sizing
Message-ID: <asYZFXGyafRjjBS0@arm.com>
References: <20260924060756.1325156-1-aneesh.kumar@kernel.org>
 <20260924060756.1325156-7-aneesh.kumar@kernel.org>
 <asVs3doaJ4WrT3M2@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <asVs3doaJ4WrT3M2@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_030417_897126_B9F24D7C 
X-CRM114-Status: GOOD (  17.71  )
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

On Tue, Oct 06, 2026 at 10:49:17PM +0100, Will Deacon wrote:
> On Thu, Sep 24, 2026 at 11:37:54AM +0530, Aneesh Kumar K.V (Arm) wrote:
> > @@ -496,7 +516,8 @@ swiotlb_select_pool_policy(unsigned int flags)
> >  	if (swiotlb_force_disable)
> >  		return SWIOTLB_POOL_NONE;
> >  
> > -	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
> > +	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
> > +	    !restricted_dma_pool_present)
> >  		return SWIOTLB_POOL_CC_GUEST;
> 
> I think this check on the restricted DMA pool is too general -- the pool
> could be tied to a specific DMA-capable peripheral and so treating its
> presence as a global property isn't right.

I agree it's a hack but that was the simplest way to avoid the pVMs
getting a bounce buffer after this patch. More than happy to leave it
out and reduce the buffer on cmdline or we come up with some better
heuristics.

Another option could be the arch code passing another flag that it
doesn't want an encrypted pool (e.g. when running in a pKVM guest) but I
don't particularly this either. The arch code doesn't know whether
there's an alternative pool.

That said, such heuristics should have been a separate patch to make it
easier to review/drop.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

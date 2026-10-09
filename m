Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FD7CA6019
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XfM0jlppIgYrdhixQ8djx9UM3fyC+e1F04tnY8yWA78=; b=BOr6YIMDI3cHqR
	s8fQ1xif2bXpgcl1yE+mRBXCM150fwOCr7AnptvjJmc0YmaPA5FE3vX1f6XyjG4GnbtSVq6Dhf0fl
	bcY+r/vmBcACGxSEO7qVC2HLOuC1hJbevRemXbv7Xt2Xvny1AY1GvazKYOChi4Bwy+A70gye1drke
	feGZxZgVS1D8VgzA8bf/YbkwnCswiAFpKx9S2s7341vitbnFGdIhu6nat4AiL3A1syZnpo4P/9tJh
	pZSmXQhsfmpSO4pAh1axseydUiBv+8JW8W9g6vn4jVZ5kkT7Ss6C8SNp3O8n/XCC50GZIFLjdPBqc
	3laacGtonu+baRe0/FMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7gD-000000061q0-1rdj;
	Fri, 09 Oct 2026 10:18:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7gB-000000061pR-1lGV;
	Fri, 09 Oct 2026 10:18:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E416541471;
	Fri,  9 Oct 2026 10:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40FA51F000FF;
	Fri,  9 Oct 2026 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791541098;
	bh=wxARsjGuquaiLxgSm18RK/GYX/5yHnqt2BOAs4KeGsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J/Ulp1kiU/fHLorufnUGZviVewHpZ4i2nh7ovjmbgtSVM9rKK3zfjolFAXlJiCoG/
	 BMW5Ubh23ZkHDtz2gC3M7BH0DoQb7aWS09Fvb5ai3Tah7LXu0pj6waoAyV4+Ys7d5Z
	 +iywIF9ht9ECEh7ry8yPogWZ87BGl4TKzbkbZrEJI5fQcCBS3ROhYfkTdcqveZDJbP
	 aeEe9F9SdlEQjf4RfVxNp6TljhzSQkjK1V50hbw9FBfJgs2u42Zj9iTGwDxFCYK4CY
	 7TdAyz5T7sPBsEmViOMRCDgegOg9M7rT99tg9OQAo14hJB5idOZRFpneZ6VooRc89y
	 jEHJjjoVpql9w==
Date: Fri, 9 Oct 2026 11:18:05 +0100
From: Will Deacon <will@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <asi_XW2FaVjjWhxk@willie-the-truck>
References: <20260924060756.1325156-7-aneesh.kumar@kernel.org>
 <asVs3doaJ4WrT3M2@willie-the-truck>
 <asYZFXGyafRjjBS0@arm.com>
 <asYiOgskwi8JYLe_@willie-the-truck>
 <yq5awlrt3dwo.fsf@kernel.org>
 <yq5av77c92oo.fsf@kernel.org>
 <aseRzPshcoys7AJS@arm.com>
 <CGME20261008143238eucas1p1ee087352709f2a82d2aec95540ae2031@eucas1p1.samsung.com>
 <yq5ao6d48dqr.fsf@kernel.org>
 <c2e38455-cb31-4854-ab84-4a370fabc1f9@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c2e38455-cb31-4854-ab84-4a370fabc1f9@samsung.com>
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

On Thu, Oct 08, 2026 at 05:32:44PM +0200, Marek Szyprowski wrote:
> On 08.10.2026 16:32, Aneesh Kumar K.V wrote:
> > Patch 3 is a fix, so you may want to take it even if we drop the rest of
> > the series. Perhaps the first three patches could be taken together?
> 
> Okay, I will take only the first 3 patches to dma-mapping-for-next branch now
> and wait for the remaining patches until they gets sorted out.

Thanks, Marek.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3252ACA5FF1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyjELn0YJvAD5nrsBZ7Yum7pYvjx0lFEgGFEpI5TkAc=; b=uW7mxR5D2mMWhq
	ONEQVwzOXDdhIH5o6uAApSLvkbcUjlU7oHjYkQJN9CMZZpN8h7+DEfpfmD/MlKvuQzWrV8WLEvpLg
	Y9pFby85VxON4ilCLLcahdYafWl9U7xAm7JwblXa0LKG/YFDUimHfWiisyLAyyrwDMZikIrpyCTAF
	Hnds6W4ciI0wI44DIIwty+sik03EFLAMsdOU1PLQ8aXHEUdvYP4jb1gE0FbZss9DpY+S6ixrZpNBH
	AkEZ7ct1AnlMyERBwlbNHd/W69j1+Jk5JPMX6M2GXW6OjQdSYCzFiT0TzPRS9izcyGi3LoluuBy7p
	1QemWKImQlrNd0MqfsdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQbG-00000002QcB-2Ygn;
	Wed, 07 Oct 2026 12:18:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQbD-00000002Qbp-38Bo;
	Wed, 07 Oct 2026 12:18:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 014BF40AB8;
	Wed,  7 Oct 2026 12:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ABFE1F0089B;
	Wed,  7 Oct 2026 12:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791375498;
	bh=2WgWLAiPotutYayQG3trpdPvMIi0zMN+OiIn2PqYtBg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=euozqhSFQzcWnwMmFjHgWU9CQ0mRmnQ/1D4I+KBxZigk9xnWjARxsK7JZVR2odRko
	 M7uAKQ+ZnGHyc5Bw3SYbVoM2TV8SA+mrf+7JM0mxUjBwSrHe30dT8j60lFGuKvhbgH
	 jr+z075r7gGsj1avvxBkbsgCasm59loy0lYr47kiXLPk1EMD2xU2/2psHUTcLA80Y6
	 tLAdrspaLYKQXCPufkliH2EcXJL45rIGwPAuPpbZne93fbmu3Ez4WwG7bx0fhw5d/X
	 sO23nTup+cY08SZFL/7Cdf5XhChJ7GZHQSpaluQjJR/rdhlksim5K2/hznwDcX7xu1
	 O6S7FIGvrY0Jw==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
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
In-Reply-To: <asYZFXGyafRjjBS0@arm.com>
References: <20260924060756.1325156-1-aneesh.kumar@kernel.org>
 <20260924060756.1325156-7-aneesh.kumar@kernel.org>
 <asVs3doaJ4WrT3M2@willie-the-truck> <asYZFXGyafRjjBS0@arm.com>
Date: Wed, 07 Oct 2026 17:47:58 +0530
Message-ID: <yq5atsmx3ds9.fsf@kernel.org>
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Tue, Oct 06, 2026 at 10:49:17PM +0100, Will Deacon wrote:
>> On Thu, Sep 24, 2026 at 11:37:54AM +0530, Aneesh Kumar K.V (Arm) wrote:

 [ ... 22 lines skipped ... ] 

>
> That said, such heuristics should have been a separate patch to make it
> easier to review/drop.
>

I kept them in a single patch to avoid breaking bisection. Otherwise, an
intermediate commit would allocate a swiotlb bounce buffer for pKVM.

-aneesh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

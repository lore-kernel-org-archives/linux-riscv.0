Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB135606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 10:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d3Qg/QeM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBTA1Nam
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f5UTyIfmolsL7O9ZmZyq0uOTGT7D9jb2a0lnYDTYyuY=; b=d3Qg/QeMKE+abxQqBXsa5e0nwf
	QzXs5AzwhyZoBibD/8barRVcqLGY/nt7RjfqbBBilyWdtGMC6di0OAORThDF7M3Aein7Fx0gtVAcE
	NxFe6klf2Svgwk8UFllSYnwMtPknFeJFLL6IbOhiD972g5V5K7Sfr1eOEyHVW4P9bKNrpYOKj3SGV
	tooyfhjX0cx3Fr66NZTmNDnPxH6a/FbZeOo8ZpMkbr3vmuXzGGOC/FLrBjtO1VmfnYG5RW5oyV1hQ
	wVUs4SeZxoW4s+V3Czb6RwxyMyD4WwU9LTpBi0al2CrLWvJJUm7+M3H9LkqRf76UXHEwuepcC3/K9
	Ckfbq5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRp2-00000009U0t-43CJ;
	Thu, 12 Nov 2026 10:14:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRox-00000009U09-1FcI;
	Thu, 12 Nov 2026 10:14:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 574F36348B;
	Thu, 12 Nov 2026 10:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF6C1F00A05;
	Thu, 12 Nov 2026 10:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794478458;
	bh=Y6qGWFGnpPL1ZkxmjT2jfKkaXhHx34ppHOpZ4kDJJ7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=MBTA1NamdzwTkZFr1duA2LSuyBzBxb6sNOwn0iO8KEGEo5pBXxgtCA30N+7GE/2Pw
	 GLLvMwMZMI+da7JzcTnuS0bMCdJanR2u9J/lPT9ckfrvKZNg8LhcDu8V7C+TbIeSjw
	 8yAMG4KCQ37LswDNHi5a/WIuQLaVB3XmEBALQQYzAaV+Q8iEdtJJ3Dxcj6qOxTLYnK
	 jVkJEIC1HFd3EBLbKlThHyGFKsjs0LGuM/niOEOMAHspsHAU9Gpim1bszdlXVU+ehU
	 fummkjIScD+yhHq9nloKuZ6lIpGJGM30bseMr702s+Ru+2cT98q/Bl763g0e0qb8DX
	 66KW6Lsjq8WcA==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
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
In-Reply-To: <avRKiCBs81XSYMqW@FCCLS0092175.localdomain>
References: <20260924060756.1325156-7-aneesh.kumar@kernel.org>
 <asVs3doaJ4WrT3M2@willie-the-truck> <asYZFXGyafRjjBS0@arm.com>
 <asYiOgskwi8JYLe_@willie-the-truck> <yq5awlrt3dwo.fsf@kernel.org>
 <yq5av77c92oo.fsf@kernel.org> <aseRzPshcoys7AJS@arm.com>
 <yq5ao6d48dqr.fsf@kernel.org> <auR0fT1yrKQ9wbm8@FCCLS0092175.localdomain>
 <yq5a8q3d9oe6.fsf@kernel.org> <avRKiCBs81XSYMqW@FCCLS0092175.localdomain>
Date: Thu, 12 Nov 2026 15:43:59 +0530
Message-ID: <yq5a33t6qrvc.fsf@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Kohei Enju <enju.kohei@fujitsu.com> writes:

> Hi Aneesh,
>
> On 11/01 09:47, Aneesh Kumar K.V wrote:
> [...]
>> >
>> > Hi Aneesh,
>> >

 [ ... 35 lines skipped ... ] 

> Overall, I would prefer the dynamic sizing approach. However, I believe
> the initial pool size still matters.
>
> Also, as Catalin pointed out earlier in the following message:
>
>     https://lore.kernel.org/all/ann6noRzoPLL9kDY@arm.com/
>
> the arm64 adjustment also reduces the target size used for dynamic
> pool allocation, since both the initial pool and dynamic allocation
> currently use default_nslabs.
>
> I am testing the patch below to decouple the initial pool size from the
> dynamic allocation target. It adds swiotlb_adjust_initial_size() for
> callers that only want to reduce the initial allocation, while keeping
> the existing swiotlb_adjust_size() semantics for callers that want to
> adjust both sizes.
>

Should we instead update the logic so that reducing the swiotlb size
leaves the dynamic allocation size unchanged, while increasing it also
bumps the dynamic allocation size?

-aneesh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

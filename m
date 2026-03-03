Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602BFEDA694
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUEsE62ZKe6H85pZlHsa921tRthnCJdNhX/2lXdaQKQ=; b=rLyYvl4ncrn80W
	vIc1JHgIAFO7jJbFXU3prB707OhGdp3WWFDE/o2riyCS9I5B3PXb7EQRgaZZ95RAVpnvdmp9pCkZd
	MBSinerEC8XPwnznkbjjMmkmK9WoCv+/08g3DOFEV3tB1tomTTjBX89WtVPXHWzmKRf4yqkkU6OWp
	zwVsrJlEJfGj96aFYqoSGCVD5uZdcEodaM/qahahHnBvRTQFJRO/4z3+IvsfXCAz5pctjXnISu1fI
	37w9fTKOiRbnJVw1rR+bTvCGQv/YQT4M7L1HQyAgSn0gES6lR+GEVFCcAAmQ2mDF2BJSJQX5ClEUE
	Iq6TNiWG4J0/P7dyZ/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSOt-0000000FXbC-0rAE;
	Tue, 03 Mar 2026 16:15:11 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSOr-0000000FXae-0w6I;
	Tue, 03 Mar 2026 16:15:10 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 59EE368BEB; Tue,  3 Mar 2026 17:15:00 +0100 (CET)
Date: Tue, 3 Mar 2026 17:15:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-raid@vger.kernel.org
Subject: Re: [PATCH 07/25] xor: split xor.h
Message-ID: <20260303161500.GA8975@lst.de>
References: <20260226151106.144735-1-hch@lst.de> <20260226151106.144735-8-hch@lst.de> <20260228044355.GD65277@quark> <20260303160309.GD7021@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260303160309.GD7021@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_081509_419662_40F39EA2 
X-CRM114-Status: GOOD (  24.12  )
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

On Tue, Mar 03, 2026 at 05:03:09PM +0100, Christoph Hellwig wrote:
> On Fri, Feb 27, 2026 at 08:43:55PM -0800, Eric Biggers wrote:
> > On Thu, Feb 26, 2026 at 07:10:19AM -0800, Christoph Hellwig wrote:
> > > Keep xor.h for the public API, and split the struct xor_block_template
> > > definition that is only needed by the xor.ko core and
> > > architecture-specific optimizations into a separate xor_impl.h header.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  arch/arm/lib/xor-neon.c       |  1 +
> > >  arch/s390/lib/xor.c           |  2 +-
> > >  include/linux/raid/xor.h      | 22 +---------------------
> > >  include/linux/raid/xor_impl.h | 25 +++++++++++++++++++++++++
> > >  lib/raid/xor/xor-core.c       |  1 +
> > >  5 files changed, 29 insertions(+), 22 deletions(-)
> > >  create mode 100644 include/linux/raid/xor_impl.h
> > 
> > arch/arm64/lib/xor-neon.c needs to be updated to include xor_impl.h.
> 
> As of this patch it is not using anything from that header (but
> neither from the public xor.h).

Actually looks like we do need it because it pulls in
arch/arm64/include/asm/xor.h.

Anyway, I think I'll actually move this patch to the end so that the
impl header does not need moving to it's final place.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

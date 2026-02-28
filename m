Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DE8FEE4E8
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Feb 2026 10:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvp548tXVkskPAvO+kZ8vibiYpimc/e+D0WYJidSl38=; b=R8N3cezHPYshkI
	VUhrsx7BriGRHKIUpsw2ulv3vFP82KNS6WeYbAZN9WPzfTCsbBiyg+WUvX768MMG+2+Bazfy8Sv7Q
	KOsRIO4TNewgnjZ4Zofzd4fWG+jLUEIiEGispYX1h9mxUBkymszIE7KftlrdtjGGh7/9papKGx3dQ
	v3rsie8DGKeZisC+VqRpJ/5WjKJfttU4PXUr5n0qVxm7kAxMsU6YlTSy3CYKJ55jkUrNLXvakXFhS
	O6UKmJDftSXpGldqZfawvEpJW0270RrxpjUtdFa8nKD4iysOizyGr0aj6f+Lc20CuABIEkShXm6eE
	rSgh7ibVFM+Pe8u2/ADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHbe-00000009jmQ-49DO;
	Sat, 28 Feb 2026 10:31:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHbc-00000009jmD-0sEe;
	Sat, 28 Feb 2026 10:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TMfQFraLliTO9OYi4VnvV7gf7AjKPxIluxE2boSfq9E=; b=Ihs5Yf5HVrcI20Hvh5VGWrIGtj
	w539I2X4jBa2jKtS495tj7OW6yzhUvsPzuvYxap8QuwZoigJhFPba8v5sdtkPlsa6ID6C16CNvr3D
	fYcDuOEFbymUfK08ZwvafhxK/cQQqT8fuyE87FJ8bLSaBRcRuE1oHdJ8cGt5ahL8RttPyiMxygm7n
	mt+sFX75z3hVeBiEagfvPL++3zVOztglGmkatawM3oQt9uFpQqkNr4WQvFkrT+2czFsf7HwHxTWyD
	ed2+E9lBjpxNLnaogre7bAMexNOCdGPm1iLI1kQQI6WFzJBF95/QpTcsQabK0eral+I71Lj4w+g8Q
	gLUIf0SA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwHbS-0000000EUcv-1pQT;
	Sat, 28 Feb 2026 10:31:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2ADC430066A; Sat, 28 Feb 2026 11:31:17 +0100 (CET)
Date: Sat, 28 Feb 2026 11:31:17 +0100
From: Peter Zijlstra <peterz@infradead.org>
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
Subject: Re: [PATCH 18/25] x86: move the XOR code to lib/raid/
Message-ID: <20260228103117.GK1282955@noisy.programming.kicks-ass.net>
References: <20260226151106.144735-1-hch@lst.de>
 <20260226151106.144735-19-hch@lst.de>
 <20260227143016.GH1282955@noisy.programming.kicks-ass.net>
 <20260227235529.GA31321@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260227235529.GA31321@quark>
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

On Fri, Feb 27, 2026 at 03:55:29PM -0800, Eric Biggers wrote:
> On Fri, Feb 27, 2026 at 03:30:16PM +0100, Peter Zijlstra wrote:
> > On Thu, Feb 26, 2026 at 07:10:30AM -0800, Christoph Hellwig wrote:
> > > Move the optimized XOR code out of line into lib/raid.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  arch/x86/include/asm/xor.h                    | 518 ++----------------
> > >  arch/x86/include/asm/xor_64.h                 |  32 --
> > >  lib/raid/xor/Makefile                         |   8 +
> > >  .../xor_avx.h => lib/raid/xor/x86/xor-avx.c   |  14 +-
> > >  .../xor_32.h => lib/raid/xor/x86/xor-mmx.c    |  60 +-
> > >  lib/raid/xor/x86/xor-sse.c                    | 476 ++++++++++++++++
> > 
> > I gotta ask, why lib/raid/xor/$arch/ instead of something like
> > arch/$arch/lib/xor ?
> 
> Similar to lib/crypto/ and lib/crc/, it allows the translation units
> (either .c or .S files) containing architecture-optimized XOR code to be
> included directly in the xor.ko module, where they should be.
> 
> Previously, these were always built into the core kernel even if
> XOR_BLOCKS was 'n' or 'm', or they were built into a separate module
> xor-neon.ko which xor.ko depended on.  So either the code was included
> unnecessarily, or there was an extra module.
> 
> Technically we could instead have the lib makefile compile stuff in
> arch/, but that would be unusual.  It's much cleaner to have the
> directory structure match the build system.

Hmm, I suppose. Its just weird that we now have to look in both
arch/$foo and lib/*/$foo/ to find all arch code.

And I don't suppose symlinks would make it better?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

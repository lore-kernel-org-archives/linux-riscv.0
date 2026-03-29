Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F0CFF4923
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Mar 2026 22:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IN4r3Rezw6Hp7wE+5oQ0OHrlajrfamjRTDFSWS6AyWY=; b=bjXsMBAwzVBcl1
	plUhHW15jjPT9+oU1LfcTF0h9Zerwkrb+inz5ocUrCu3hrtAYtbGE02piQ5d9Tcqqh7m5o85yEwmw
	gzoeQRRP2yoxQDqDt1gZIFPWfIyPT80N0qZKOH+qda/VYLaNkdvyfazFfyP4yN0ZitciiWdhCCO/T
	hhTU3sEDi+vfybO+r5rT0oVsnmu/JjE+y8qV6foVeZxUwCSc41xrFWlsOCn/9GtikWWZbPqj0U6aL
	bxF82j24NexRY+3erTGlbkxsDRD1QV4o2zzk9TyxTyyVoI37CovCyHiz/H+RlG6/rqJENBOXaG5Od
	v3jEK3aF9gp/UiP1S0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6yyi-0000000AOj1-2UYa;
	Sun, 29 Mar 2026 22:51:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6yyg-0000000AOin-1U0I;
	Sun, 29 Mar 2026 22:51:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA67860054;
	Sun, 29 Mar 2026 22:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6B6C116C6;
	Sun, 29 Mar 2026 22:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774824688;
	bh=xC03r/4dJ8Us44QpgIA9Ngu2zy8kWGCxh9mj0ZxoTHs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JBtLNNMxkC+Qck2+BGDNaaVFR64izaAKQJSJUR3TFGlVL+zj0esYpoV9thVBYizo5
	 2LdTKTg4q97XSRSKSMqWeByHX3v4Kwd3ip5W8A7e9SWOk90u7h9T0PIyI9/hHuozRw
	 xIxWNYXda49DMygxwfzePxOY5aQGe8Krgc64/5fY=
Date: Sun, 29 Mar 2026 15:51:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Richard Henderson
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Magnus
 Lindholm <linmag7@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Andreas Larsson
 <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, Dan Williams
 <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>, David Sterba
 <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>, Song Liu
 <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>, Li Nan
 <linan122@huawei.com>, Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-raid@vger.kernel.org
Subject: Re: cleanup the RAID5 XOR library v4
Message-Id: <20260329155126.a01a5729b7d8376712182851@linux-foundation.org>
In-Reply-To: <20260329213119.GA2106@quark>
References: <20260327061704.3707577-1-hch@lst.de>
	<20260329213119.GA2106@quark>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Sun, 29 Mar 2026 14:31:19 -0700 Eric Biggers <ebiggers@kernel.org> wrote:

> On Fri, Mar 27, 2026 at 07:16:32AM +0100, Christoph Hellwig wrote:
> > Hi all,
> > 
> > the XOR library used for the RAID5 parity is a bit of a mess right now.
> > The main file sits in crypto/ despite not being cryptography and not
> > using the crypto API, with the generic implementations sitting in
> > include/asm-generic and the arch implementations sitting in an asm/
> > header in theory.  The latter doesn't work for many cases, so
> > architectures often build the code directly into the core kernel, or
> > create another module for the architecture code.
> > 
> > Changes this to a single module in lib/ that also contains the
> > architecture optimizations, similar to the library work Eric Biggers
> > has done for the CRC and crypto libraries later.  After that it changes
> > to better calling conventions that allow for smarter architecture
> > implementations (although none is contained here yet), and uses
> > static_call to avoid indirection function call overhead.
> > 
> > A git tree is also available here:
> > 
> >     git://git.infradead.org/users/hch/misc.git xor-improvements
> > 
> > Gitweb:
> > 
> >     https://git.infradead.org/?p=users/hch/misc.git;a=shortlog;h=refs/heads/xor-improvements
> > 
> > Changes since v3:
> >  - switch away from lockdep_assert_preemption_enabled() again
> >  - fix a @ reference in a kerneldoc comment.
> >  - build the arm4regs implementation also without kernel-mode neon
> >    support
> >  - fix a pre-existing issue about mismatched attributes on arm64's
> >    xor_block_inner_neon
> >  - reject 0-sized xor request and adjust the kunit test case to not
> >    generate them
> 
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>

Great, thanks, added to all changelogs.

> But yes, as Andrew mentioned there are two "xor: add a better public
> API" patches.  They should be folded together.

I folded them.

I'm a bit wobbly about upstreaming all this for 7.1-rc1.  It hits on a
lot of stuff and I don't think we've heard a lot from the affected
maintainers.

otoh, we're unlikely to learn much from an additional nine weeks in
linux-next so at some point one has to forge ahead and rely on seven
weeks of -rc to address any remaining niggles.  And I'm confident that
Christoph will support his work well.

But still, hearing some reassuring words about this would be
appreciated ;)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

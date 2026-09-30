Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A7CCA5FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 14:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0JklC2fbxQXaEEwCKRDsUD9CMcVfNfx5lCuy1HhJORY=; b=Sf8ct+ox33bRtD
	yJ5rp6MFmn3P37lvc0br3fZEbz+1ZWSgkj1DeNoBxqD2Q6cDwPGPJEowcstk95njTTj0ikS1ZGKCR
	Q+r2JnDeqL8Vdlxb+U6wEVLUoTrk0WVrV67guZ+WCsCj7bUv2aMd7UpQOVLuw/LsZUT6W45bKmFlw
	xrwfjNt5sOjt3jL9EVQ7ejKtP3S9Duc7wBmjCnqAYIt+L3qJk4DwRA14k937Pyo71jj/yXog549V/
	dnRfKkU13LaC4BVC4b5zI4Mr1Ktp+VzfUo8MtQViqOwgRW/V+cFuXpY53u9kCm0RduajJoQyKAt2K
	E987VGblrqMiVYD8vDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvC5-00000006IsY-3i7j;
	Wed, 30 Sep 2026 14:22:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvBc-00000006Id3-3cj1;
	Wed, 30 Sep 2026 14:21:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 521ED40C3F;
	Wed, 30 Sep 2026 14:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F7A1F00893;
	Wed, 30 Sep 2026 14:21:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=kkRK91cQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790778087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zcThwgFUB4BfR5xfqdh6THtQYRaz9GGWFb0MJecCduw=;
	b=kkRK91cQzj+9vwUYtmGxpP6XHVefTkbHAXdd3nIiFVR+tOEuf0OaDl9hKkY9dgnZA+uIja
	kvvsMMlW1aun0HmpF4USkn2HKIB/ExvhSKaoIDBa5/FJ8DgYeE/zmuK/55JeWGBQCXPp3h
	CRPitXuJosLH57qy20oRmbXytVm4JwY=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id de3a0bd1 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 30 Sep 2026 14:21:26 +0000 (UTC)
Date: Wed, 30 Sep 2026 16:21:21 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <ar0a4b9CjL2YHCkY@zx2c4.com>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
 <areYMjNcaqe86ds4@zx2c4.com>
 <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
 <are6s5e6On3hpD3M@zx2c4.com>
 <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
 <20260930133813.GA3142230@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260930133813.GA3142230@ax162>
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

On Wed, Sep 30, 2026 at 03:38:13PM +0200, Nathan Chancellor wrote:
> On Tue, Sep 29, 2026 at 11:24:11AM -0700, Nick Desaulniers wrote:
> > arch/arm64/kvm/hyp/nvhe/Makefile has this pattern for exactly the same
> > problem I suspect.  Maybe that's the right tool in the toolbox?
> > 
> > ```
> > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> > index 8dbf2532a573..27fa72d8fb86 100644
> > --- a/arch/riscv/kernel/vdso/Makefile
> > +++ b/arch/riscv/kernel/vdso/Makefile
> > @@ -27,7 +27,7 @@ asflags-y += -DVDSO_CFI=1
> >  endif
> > 
> >  # Files to link into the vdso
> > -obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
> > +obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o ../../lib/memset.o
> > 
> >  ifdef CONFIG_VDSO_GETRANDOM
> >  obj-vdso += vgetrandom-chacha.o
> > ```
> > Fixes `make -skj"$(nproc)" ARCH=riscv LLVM=1 mrproper allmodconfig
> > vdso_prepare` for me, as per
> 
> For the record, this also happens with the 32-bit PowerPC vDSO, as I
> noted in the commit message of v2. I should update the issue too, I only
> realized this after wider testing. So if this is the route we want to
> go, we would need a memset() for that vDSO as well.
> 
> > https://github.com/ClangBuiltLinux/linux/issues/2183
> > (Nathan, don't forget to link to that in the commit message)
> 
> Yes, thanks, I have added it for v3.
> 
> > I'm surprised I didn't need -fno-semantic-interposition (or one of the
> > related flags... -fvisibility=hidden)
> > 
> > If we want to get better, (if performance matters here and we want to
> > trade source+build system complexity for absolute code perf) I would
> > start with that, then worry about clawing back performance via things
> > like:
> > - __builtin_memset_inline
> > - -finline-stringops=memset
> > - -ffunction-sections+-Wl,--gc-sections to dead code eliminate the out
> > of line copy of memset, though IIRC there's potential for wasted space
> > due to alignment requirements (maybe the out of line copy of memset is
> > smaller...idk)
> 
> Yeah, I guess it is ultimately up to the maintainers what route they
> prefer.

I think linking in an out-of-line memset.o is not appealing. This isn't
a general library or something. So let's just go with your v2 approach,
fixed up in the ways we mentioned.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

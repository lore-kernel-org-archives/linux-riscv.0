Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7FCD149F6
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 22:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJMnLM83eZHcdqPE9CcvY2PFHWzd5+niBxK3qzMHxgc=; b=MBokK7lWcNCVTT
	32Xa0eIZrdx+kjhwAtcCetwod1PI8XFRfAuGwVjEnfCOqADN+m4VVwwTcBm1l8+seENppRiWeD7AF
	SNeHIOzdRK6yb3eYpdDulVfrLCOYBPK37vPA2oAlBAiZUmd7I/rdKBXkyvQW3oE7nRHPksRaZgXfE
	njJVBNt6SS0PXum2Q8S+Z7807rPDkBHKaE1JbxTOYymBzhqzjITnVIHRlz4bHgM0q4EgknZYpN4Xl
	U0WF7rvwpPiKKQK1dlq0X6oaICl7Jh8fVPLWClka1kNEtWCQddUodkFWTHhr4HCzgDgMf87G1Y1jK
	eAHm9hJeyU0V6g7lkfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4St1-00000005S6t-0XoW;
	Fri, 25 Oct 2024 22:34:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SqY-00000005RXY-3YR2;
	Fri, 25 Oct 2024 22:31:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D6DF5C51BA;
	Fri, 25 Oct 2024 22:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE278C4CEC3;
	Fri, 25 Oct 2024 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729895514;
	bh=mVLVxjwpOT42Kb7f4O3vXqKoUSnuXxrku5/kKxjIyIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=de2ooFjpzQqfyvs6eWpep/LU6bZMauqxFRrPPIOcoo6RLnaqtZhiBAtYfGHHWnscC
	 dF2y5c896ibxWAiYOAVTj7IgcnlKP5L75BhK0Tc8wjgHsq9xSq4k1kTDEtU1VCVpVV
	 KnGgdBnEQWIoO/2j34UM4IMNdYaajjOueVlox5Cf9Q4R746AKJSlNaQMSFchAMua3K
	 xtNbR4CRre/5BmANz4U4u0zWkBsw0zpk3Hxas9iQsUUMtnzMnCcn+DJ54uFulKs2BJ
	 SwTm/+DeTIx0AxPhIDiLCAroqEegH6HVTKiWTZ/RBPNhDys5MIq020g5RWnq0r3QWN
	 +fqhDOV967kMA==
Date: Fri, 25 Oct 2024 22:31:52 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 03/18] lib/crc32: expose whether the lib is really
 optimized at runtime
Message-ID: <20241025223152.GC2637569@google.com>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-4-ebiggers@kernel.org>
 <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
 <20241025213243.GA2637569@google.com>
 <CAMj1kXHZy3yPvonS5ZVof0qa0V_Lxhv5Q7i1UVf5P6D3d+=KRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXHZy3yPvonS5ZVof0qa0V_Lxhv5Q7i1UVf5P6D3d+=KRw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_153154_997009_7DFCE30F 
X-CRM114-Status: GOOD (  32.24  )
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

On Fri, Oct 25, 2024 at 11:37:45PM +0200, Ard Biesheuvel wrote:
> On Fri, 25 Oct 2024 at 23:32, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Fri, Oct 25, 2024 at 10:32:14PM +0200, Ard Biesheuvel wrote:
> > > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > From: Eric Biggers <ebiggers@google.com>
> > > >
> > > > Make the CRC32 library export some flags that indicate which CRC32
> > > > functions are actually executing optimized code at runtime.  Set these
> > > > correctly from the architectures that implement the CRC32 functions.
> > > >
> > > > This will be used to determine whether the crc32[c]-$arch shash
> > > > algorithms should be registered in the crypto API.  btrfs could also
> > > > start using these flags instead of the hack that it currently uses where
> > > > it parses the crypto_shash_driver_name.
> > > >
> > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > > ---
> > > >  arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
> > > >  arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
> > > >  include/linux/crc32.h        | 15 +++++++++++++++
> > > >  lib/crc32.c                  |  5 +++++
> > > >  4 files changed, 50 insertions(+)
> > > >
> > > ...
> > > > diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> > > > index 58c632533b08..bf26d454b60d 100644
> > > > --- a/include/linux/crc32.h
> > > > +++ b/include/linux/crc32.h
> > > > @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
> > > >         if (IS_ENABLED(CONFIG_CRC32_ARCH))
> > > >                 return crc32c_le_arch(crc, p, len);
> > > >         return crc32c_le_base(crc, p, len);
> > > >  }
> > > >
> > > > +/*
> > > > + * crc32_optimizations contains flags that indicate which CRC32 library
> > > > + * functions are using architecture-specific optimizations.  Unlike
> > > > + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> > > > + * variants and also whether any needed CPU features are available at runtime.
> > > > + */
> > > > +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> > > > +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> > > > +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> > > > +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> > > > +extern u32 crc32_optimizations;
> > > > +#else
> > > > +#define crc32_optimizations 0
> > > > +#endif
> > > > +
> > >
> > > Wouldn't it be cleaner to add a new library function for this, instead
> > > of using a global variable?
> >
> > The architecture crc32 modules need to be able to write to this.  There could be
> > a setter function and a getter function, but just using a variable is simpler.
> >
> 
> If we just add 'u32 crc32_optimizations()', there is no need for those
> modules to have init/exit hooks, the only thing they need to export is
> this routine.
> 
> Or perhaps it could even be a static inline, with the right plumbing
> of header files. At least on arm64,
> 
> static inline u32 crc32_optimizations() {
>   if (!alternative_have_const_cap_likely(ARM64_HAS_CRC32))
>     return 0;
>   return CRC32_LE_OPTIMIZATION | CRC32_BE_OPTIMIZATION | CRC32C_OPTIMIZATION;
> }
> 
> should be all we need.

In 7 of the 9 affected arches, I already have a module_init function that checks
the CPU features in order to set up static keys.  (arm64 and riscv already used
alternatives patching, so I kept that.)  It's slightly convenient to set these
flags at the same time, but yes the above solution would work too.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

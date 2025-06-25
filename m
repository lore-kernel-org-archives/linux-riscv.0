Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089B5C7115C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 03:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQSnOd/MQgTIghAF1qRmDDkrsXArwf92jTTzkNssNRY=; b=qCzkcFV4gYyyoS
	iFHgb3lRgKsfWK5dOO2pdwaWo6/5ElV9bUqhnhyt1QSQJ7GVBoDk8hOJwRDb4m1gK6gqNcLc8K7/b
	pIftYEpeOjYchKERd+sSf9tHoyhA6KcRl9wfWYAPgVPfib2Zq6KHJbc/a6CjJqS1ioWDaQml3/NWx
	N7xOI/xHcXL/+ncz7SstmmNuO5VSVbhDsiCk7T/7TmM+9TUVk60y9A4LfUsPIvEbVsbv95A0+74UY
	A8OYWMDu04s/58eGm0mII4f+MfYtzJeQmd4SYWmlsXwEW1M118zBJTscwHHI1tcLxz/TzAYq7QPyc
	EuPw9NBAJgO70taiknIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHEK-00000007ROq-1QHJ;
	Wed, 25 Jun 2025 03:55:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHEI-00000007ROk-27Zg
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 03:55:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 919C46116E;
	Wed, 25 Jun 2025 03:55:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D02AC4CEEA;
	Wed, 25 Jun 2025 03:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750823721;
	bh=gYSEWaqq2noWFtmLEIF/7lyPVI1blmu9cszvq1/BmzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0MuoO5rAmA3Zl/ZHbUfETOOlsCdIO02h6J3+VNU2ZyTJjZsvfKpOid4/tPXZwbYr
	 jzy2DzDEbviT3twKR8jOqRRKySncFcHzqp+999y9avOIQtemyFTaF/4V9/TvKl1YM7
	 q4xKfMlaPzEmiWHtrdrv8+qyHFWIETTQnwwOdtDGwYPKH8idL4JWD4A6kMZ/12rxCd
	 60B7Du1zHDjOeRhh1Q16mBxh0QR0lnwwfymBUWXqAwZhrU6RLmYbAD9lc70LppixOr
	 CXFMqlQnczEpMyi7GNTm0XsKNIjnE+D5i74v6bKU476m/RVRz3mfQeO2R9YZrvWkix
	 1SBy6FtADyq+w==
Date: Tue, 24 Jun 2025 20:54:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Andy Polyakov <appro@cryptogams.org>
Cc: Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	herbert@gondor.apana.org.au, paul.walmsley@sifive.com,
	alex@ghiti.fr, zhang.lyra@gmail.com
Subject: Re: [PATCH v4] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
Message-ID: <20250625035446.GC8962@sol>
References: <20250611033150.396172-2-zhihang.shao.iscas@gmail.com>
 <20250624035057.GD7127@sol>
 <48de9a74-58e8-49c2-8d8a-fa9c71bf0092@cryptogams.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48de9a74-58e8-49c2-8d8a-fa9c71bf0092@cryptogams.org>
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

On Tue, Jun 24, 2025 at 11:13:49AM +0200, Andy Polyakov wrote:
> > > +.globl	poly1305_init
> > > +.type	poly1305_init,\@function
> > > +poly1305_init:
> > > +#ifdef	__riscv_zicfilp
> > > +	lpad	0
> > > +#endif
> > 
> > The 'lpad' instructions aren't present in the upstream CRYPTOGAMS source.
> 
> They are.

I now see the latest version does have them.  However, the description of this
patch explicitly states it was taken from CRYPTOGAMS commit
33fe84bc21219a16825459b37c825bf4580a0a7b.  Which is of course the one I looked
at, and it did not have them.  So the patch description is wrong.

> > If they are necessary, this addition needs to be documented.
> > 
> > But they appear to be unnecessary.
> 
> They are better be there if Control Flow Integrity is on. It's the same deal
> as with endbranch instruction on Intel and hint #34 on ARM. It's possible
> that the kernel never engages CFI for itself, in which case all the
> mentioned instructions are executed as nop-s. But note that here they are
> compiled conditionally, so that if you don't compile the kernel with
> -march=..._zicfilp_..., then they won't be there.

There appears to be no kernel-mode support for Zicfilp yet.  This would be the
very first occurrence of the lpad instruction in the kernel source.

Keeping this anyway is fine if it's in the upstream version.  It just appeared
to be an undocumented change from the upstream version...

> > > +#ifndef	__CHERI_PURE_CAPABILITY__
> > > +	andi	$tmp0,$inp,7		# $inp % 8
> > > +	andi	$inp,$inp,-8		# align $inp
> > > +	slli	$tmp0,$tmp0,3		# byte to bit offset
> > > +#endif
> > > +	ld	$in0,0($inp)
> > > +	ld	$in1,8($inp)
> > > +#ifndef	__CHERI_PURE_CAPABILITY__
> > > +	beqz	$tmp0,.Laligned_key
> > > +
> > > +	ld	$tmp2,16($inp)
> > > +	neg	$tmp1,$tmp0		# implicit &63 in sll
> > > +	srl	$in0,$in0,$tmp0
> > > +	sll	$tmp3,$in1,$tmp1
> > > +	srl	$in1,$in1,$tmp0
> > > +	sll	$tmp2,$tmp2,$tmp1
> > > +	or	$in0,$in0,$tmp3
> > > +	or	$in1,$in1,$tmp2
> > > +
> > > +.Laligned_key:
> > 
> > This code is going through a lot of trouble to work on RISC-V CPUs that don't
> > support efficient misaligned memory accesses.  That includes issuing loads of
> > memory outside the bounds of the given buffer, which is questionable (even if
> > it's guaranteed to not cross a page boundary).
> 
> It's indeed guaranteed to not cross a page *nor* even cache-line boundaries.
> Hence they can't trigger any externally observed side effects the
> corresponding unaligned loads won't. What is the concern otherwise? [Do note
> that the boundaries are not crossed on a boundary-enforcable CHERI platform
> ;-)]

With this, we get:

- More complex code.
- Slower on CPUs that do support efficient misaligned accesses.
- The buffer underflows and overflows could cause problems with future CPU
  behavior.  (Did you consider the palette memory extension, for example?)

That being said, if there will continue to be many RISC-V CPUs that don't
support efficient misaligned accesses, then we effectively need to do this
anyway.  I hoped that things might be developing along the lines of ARM, where
eventually misaligned accesses started being supported uniformly.  But perhaps
RISC-V is still in the process of learning that lesson.

> > The rest of the kernel's RISC-V crypto code, which is based on the vector
> > extension, just assumes that efficient misaligned memory accesses are supported.
> 
> Was it tested on real hardware though? I wonder what hardware is out there
> that supports the vector crypto extensions?

If I remember correctly, SiFive tested it on their hardware.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

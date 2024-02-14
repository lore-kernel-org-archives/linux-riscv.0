Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0967C48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 22:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=884PLefTj+hhcETjvvhW7iQWSzPnfNeHt/fm/Ml4P+I=; b=Mk2hYRuKbcLm40
	TFWhVvZpNP8ccG9vYLBhAeX3/YsdLI3wq2FJEyXT3dbvCVioaiHzfZ8UwqRPp/zRlg3eNxOlsmWrC
	f6FhOL75szkQBq2eQ9uPC0v8CEkjBt5g+Ykl7ssq7CRfNUepVYzPbgDK58G7Uy7zH+i5RXpqf9BRk
	aZ6ASUkjCulVgTzodbgttEdvbD7GU/U/XZiYGFdnuJ9B6yXEjq8XBHMkdbq0lVtLrDOAly6QoeJi4
	11NU98COIHzNFt78p+L2HvWalToKc9YweEiHLOXYU0mpaA+nLv2cv0rSufGT62JSousvyRQ/Ig7MW
	IcBoHuq28Qyd3TdZgVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raNxb-0000000ET8l-11BA;
	Wed, 14 Feb 2024 22:42:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raNxY-0000000ET86-1vbT
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 22:42:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 061D2CE23A2;
	Wed, 14 Feb 2024 22:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01C6C433F1;
	Wed, 14 Feb 2024 22:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707950549;
	bh=gDOKWTuLGxFAgQ12MXLWBbnnr1TL1BYLv6cljApQScI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LKSJ67WX3MyMv6KrdvhUVOXfdXMBhUP4msexPKlL9uQE8T2X/BGA3cgDAxsE77PCy
	 n6GPfDOMF8fjxf+b+EYsUWhLmw+TUWbREbP9mYvLdn2U46HzDJYXGqCQi1ICb/relA
	 O57gXeBJJe/Kf28mvi5NqJcLftEgXkr0DkEkqBnHHn/1497gPjwZQJ4yXYDdGbPrzE
	 gBQl/cfxhO4zf+vSzHhIHKt1EdmqwUKI2heX6OQStD/0G9hH/umaXHO+dMQiKQQ8wu
	 VyykXW6solwe+D9Z82Q8zloM9QNyfss0C763Fd1EOh2+IF0Zfv/5FBknqdXqvqEDmY
	 hOexDnvsFr9TQ==
Date: Wed, 14 Feb 2024 14:42:27 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-crypto@vger.kernel.org, Jerry Shih <jerry.shih@sifive.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Phoebe Chen <phoebe.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH riscv/for-next] crypto: riscv - add vector crypto
 accelerated AES-CBC-CTS
Message-ID: <20240214224227.GA1638@sol.localdomain>
References: <20240213055442.35954-1-ebiggers@kernel.org>
 <CAMj1kXEjEhZY6zoQQzJioBB6QVGJbCmO2w5T3+T0=iPxHmvYJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXEjEhZY6zoQQzJioBB6QVGJbCmO2w5T3+T0=iPxHmvYJQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_144232_865116_EB95FB24 
X-CRM114-Status: GOOD (  23.17  )
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

On Wed, Feb 14, 2024 at 05:34:03PM +0100, Ard Biesheuvel wrote:
> On Tue, 13 Feb 2024 at 06:57, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Add an implementation of cts(cbc(aes)) accelerated using the Zvkned
> > RISC-V vector crypto extension.  This is mainly useful for fscrypt,
> > where cts(cbc(aes)) is the "default" filenames encryption algorithm.  In
> > that use case, typically most messages are short and are block-aligned.
> 
> Does this mean the storage space for filenames is rounded up to AES block size?

Yes, in most cases.  fscrypt allows the filenames padding to be configured to be
4, 8, 16, or 32 bytes.  If it's 16 or 32, which is recommended, then the sizes
of encrypted filenames are multiples of the AES block size, except for filenames
longer than 240 bytes which get rounded up to 255 bytes.

> 
> > The CBC-CTS variant implemented is CS3; this is the variant Linux uses.
> >
> > To perform well on short messages, the new implementation processes the
> > full message in one call to the assembly function if the data is
> > contiguous.  Otherwise it falls back to CBC operations followed by CTS
> > at the end.  For decryption, to further improve performance on short
> > messages, especially block-aligned messages, the CBC-CTS assembly
> > function parallelizes the AES decryption of all full blocks.
> 
> Nice!
> 
> > This
> > improves on the arm64 implementation of cts(cbc(aes)), which always
> > splits the CBC part(s) from the CTS part, doing the AES decryptions for
> > the last two blocks serially and usually loading the round keys twice.
> >
> 
> So is the overhead of this sub-optimal approach mostly in the
> redundant loading of the round keys? Or are there other significant
> benefits?
> 
> If there are, I suppose we might port this improvement to x86 too, but
> otherwise, I guess it'll only make sense for arm64.

I expect that the serialization of the last two AES decryptions makes the
biggest difference, followed by the other sources of overhead (loading round
keys, skcipher_walk, kernel_neon_begin).  It needs to be measured, though.

I'd like to try the same optimization for arm64 and x86.  It's not fun going
back to SIMD after working with the RISC-V Vector Extension, though!

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

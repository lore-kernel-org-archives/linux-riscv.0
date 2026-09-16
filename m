Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA59C982C4
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 15:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMrrxAqkrlP1iFNcBE7fCc3+azVWrtIdqxs61dVvjPc=; b=4gZQUQ3Dje/a9b
	9Y9V38YKli0AKEyMKYqif9IVqYuVci+NnpXGpgFmCv4IHPFH9pGiRjMzYq2UnLxL3CQd5llo0Vcr6
	4nasEviN0zPh1FCU8lYIBUR7+fj8owKARfqO6k6DME3qehVxEubD+ndRRq0CSWDsFCsAEKeQFZCXB
	X1lxW5wR1mOKQOjeeS0kVzI0O2ezOjw+MZzewswF26DgZqF1juTKWcjwXM6XExr2UFg0+TNnGQNlc
	QrP/BErxL28mlgSyyXd/Norh6kfkp3kq8TNPutYjRpBR4jTiEaRak9adWBdyCtDFdTNJa7wiVn256
	QVTWEzIGHE3Fj5r1uWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rWm-00000009ZnV-03ey;
	Wed, 16 Sep 2026 15:26:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rWj-00000009Zn2-1KPS;
	Wed, 16 Sep 2026 15:26:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF760403C2;
	Wed, 16 Sep 2026 15:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6A01F000FF;
	Wed, 16 Sep 2026 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789572384;
	bh=Y+l8sfyIUuoSX7bvFT29PJKYy6pbMBQgbtlLWzXcthY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EJdACsO7go97Dcl6jB4OywafQ3eiab7ESVij2PWxOTnsLO9wrPdoLJ65aFi5XAuTE
	 jzSq6VV0JBKz1MaEsvOiy6+TzKdsDFcab8YWndkxmEqHPiqZgnR0C6fkfGMO5Gi6z9
	 veGK6uTYh+HKeyObu3XIaHrO51mGxvSn5BkBgAPSDXdQpryhc12cOk1yDjuecotRa3
	 Tk2Atdjk3sPAeCSZkjqZ4ONFPDGSKxu8BXtUSvJbpW+IVuB9i6PswRbTLZgREFikky
	 r1zHhlRQ0vUnMY7rMLbQcgDm4EAn1ygs8//LlG0rS/Lc5WENUhggVeZMv9NbT5yRTy
	 346Oidb/gvxoA==
Date: Wed, 16 Sep 2026 16:26:10 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if
 available
Message-ID: <aqqxmTLnQMr8MKNL@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609151758.BA5732348@keescook>
 <aqqqZfa8Q4D5dBt5@gremlin>
 <202609160805.0DE45DB@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202609160805.0DE45DB@keescook>
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

On Wed, Sep 16, 2026 at 08:09:14AM -0700, Kees Cook wrote:
> On Wed, Sep 16, 2026 at 04:03:39PM +0100, Lorenzo Stoakes (ARM) wrote:
> > This is clearly the way forward, will do that in v3, thanks! :)
>
> Great! I'm really excited to see this (and the other stuff in this
> series) land; I spend _so_ much time waiting on builds. :P

Tell me about it, I've thought the build had _clear_ low-hanging fruit on
the single-threaded path for some time now, but who's got the time right?

I'd say the LLM solved that, but I've been putting in serious human hours
in making this series at least somewhat upstreable, so it turns out the LLM
_makes you think_ it can be done without the timesink, and then makes the
timesink happen anyway ;)

>
> > [Oh and on precedent, it seems the arm64 FIT image builder,
> >  scripts/make_fit.py, uses pigz already if available :>)]
>
> Oh nice find!

LLM found it :P but then I did a shameful:

$ git grep pigz master
master:scripts/make_fit.py:    'gzip': CompTool('.gz', 'pigz,gzip'),

And thought about how I failed to do the obvious thing (how this stuff can
make you lazy... :)

>
> --
> Kees Cook

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

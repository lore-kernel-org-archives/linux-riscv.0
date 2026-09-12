Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B38C79FB6
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 06:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOQopDIAOin5i5/vVeyhE+fWI7naxwvPPisdBvm7JvM=; b=OZh6rbIeZhpsZ7
	m62CSuUC8MUPPFvDENbdfeVAZq0o7JAgotGi4yYl4eumjyP0JwEeHxMxLB7CuTFmL6562KaiK/hJ/
	viM2r9k9iazcFhjIhqmZuv+xMNI9ehL4k/afHS5V7hulw5UaQMWlDuH/FxuYMiNJLhqs+qdV9+qst
	zAZVx8yxPpDDIDt28o89SFNvcnGcsGfRoO6zYhfa6lnipA842E2J0psaFKGMkJ1e6xXpu9ESx5tKL
	CIW2BUe+SkYOYtFAcgPXY+yI9TQMlyZoreTzUs5XYL+N4hWimRSq09VXr83S1Z3h2MUO1MGPwyX4j
	K+5Gst1kv6Hkvn2PslOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HTo-00000000aiA-40LL;
	Sat, 12 Sep 2026 06:44:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HTn-00000000ahr-1pSf;
	Sat, 12 Sep 2026 06:44:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A8C6600D4;
	Sat, 12 Sep 2026 06:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D3F1F000FF;
	Sat, 12 Sep 2026 06:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789195489;
	bh=KxaeJYmz4IdI2IIHmqchQdajHKy6Zs771P/FPguuVpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N2Bi/5zE6FzP7AovVq0ROouwmcr2zpuMYJ/ewjhq59jZqei0S8amk2jxC+/ZgjWP3
	 AaptvB9VAe75PdStlXkwI7l0RBz8KeqgNl0kz8LaX+a7d1yKSshQvXTkAouGOOpcDC
	 TRW3uqQNZuzDEMe3zlQPptV7QN2T6eFI88tLETBhUCOrdX8ZVRvO4lhBbrOURfPKfP
	 kDNyvjYJbYySIJtdnNEwgU1kLZtxQxsTd4EQsWGkC5BWh2pEuCBuG2VqiU6REavtIb
	 cGh8BTVzx6Xl6W38We3zbRZWqORKPwWtkab+G5KjlOinAcw5F32Mq3vdvWXFklGJDy
	 4fUlbAi0mw5jg==
Date: Fri, 11 Sep 2026 23:44:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
Message-ID: <20260912064437.GB2002951@ax162>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <a4167b18-f1ea-48bb-9287-210bdd4f35eb@broadcom.com>
 <aqPlUt6aIvof2LcM@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqPlUt6aIvof2LcM@gremlin>
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

On Fri, Sep 11, 2026 at 12:28:34PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Wed, Sep 09, 2026 at 02:58:59PM -0700, Florian Fainelli wrote:
> > On 9/8/26 13:55, Lorenzo Stoakes (ARM) wrote:
> > > A typical kernel build consists of a frustratingly large amount of time
> > > spent stuck in single-threaded bottlenecks.
> > >
> > > It turns out that there's a lot we can do about this and doing so
> > > significantly impacts kernel build times.
> > >
> > > This series makes allmodconfig builds up to 36% faster, incremental builds
> > > up to ~70% faster, and noop builds up to ~90% faster.
> > >
> > > Builds are faster across the board on every device I tested.
> > >
> > > Machines used for perf testing:
> > >
> > > * Threadripper -   x86, AMD Threadripper 9980X, 64 cores, 128 threads
> > > * EPYC         -   x86, 2 socket EPYC 9754, 256 cores, 512 threads
> > > * M2           - arm64, 2022 M2 macbook pro, 8 cores, 8 threads
> > >                          (4 perf, 4 efficiency)
> >
> > My AMD EPYC 9454P server shows an improvement in the order of 13% using the
> > arm64's defconfig and make -j97. Thanks for doing this!
> 
> Nice thanks! Good to confirm others are seeing the benefits :)

I see similar gains on an 80-core Ampere Altra system

  6h 21m 42s -> 5h 31m 15s (-13.22%)

and a 32-core AMD system.

  3h 38m 55s -> 3h 13m 18s (-11.7%)

The build matrices were different between machines but it is good to see
similar numbers across different environments.

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

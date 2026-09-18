Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CA6C982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 21:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7u3UTUzzQZsWRhMxNaOLOcZfrFQyt6GEBeBW3693dfE=; b=XeK2X96M93XNW0
	98Lco1v1o1AX23zVjcl7vOWMnWcKwZgs/c7JJBnoT+XnOg9vK11cDjwP/wn5tVbdFmALujEI8d7vt
	Nq3x5JlB29EdVP9iE9YO+s6G/A/jCZdNvCZpLoWkKgvJwMMWVxRklXWQJtDkl1lFCdavP4rSI6gnI
	QcrLzBp2OSWGNpVpfCCMPiNFWpY8JKppQjjbl/Zk5fXoXj56hqyR5Eak8l/f7/NBYPN0+6omc257H
	gOnOYqK24YzPG7A++NyYGocsu1aQ9ISrXKam0Lm6hLsg17mFaalv115ht/HmOtrB2k69uY2WYAa5U
	yjSwDIpikr7zZPMRMXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ftK-0000000FYRq-2DhM;
	Fri, 18 Sep 2026 21:13:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ftF-0000000FYQq-45ni;
	Fri, 18 Sep 2026 21:13:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ACBA407F4;
	Fri, 18 Sep 2026 21:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1671F000FF;
	Fri, 18 Sep 2026 21:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789765981;
	bh=6c/6Gbzu0QafG2PGiTmgDgiVijnAAiazNGXxKOPq+eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QnEBlLRxxVZclXDxEqcd7TZb9Rck7tFuArt1fESypBLN3Shpq0J3GrJczzjqtBya+
	 k+QVWcZ9DM87K3TtdZyievVgppQjBBkrEcHCYUSUnvMjJauVJiRld8WH9t4626IEYT
	 JW+cFhYsJI8GdTCCcgLJGL47S4vppJekH44o4DM9qUOmAfw6L4p6hgGy2iP68nrBEp
	 71EeyLbJZ/HHcZH2XC7eQu83TeyUcUslnWjGGnKhfdEoZQtvHE5ljWkbRbWoQFDmVW
	 5HkXeH5vto0/fysXrXdsfrSAABnRjbLTU6NM5cbUJDMjRtDA75UD+36pS54v9e8Z3Q
	 ZNypsY6t7jWpw==
Date: Fri, 18 Sep 2026 14:12:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <n.schier@fritz.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Kees Cook <kees@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
	Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 10/20] kbuild: move the toolchain checks into
 init/Kconfig.toolchain
Message-ID: <20260918211248.GB235304@ax162>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-10-9ecf4163ff36@kernel.org>
 <202609171149.6454DC6@keescook>
 <20260918010729.GB1585590@ax162>
 <aq1MG8I1BsUUDFkx@gremlin>
 <20260918-athletic-agile-echidna-114f16@l-nschier-aarch64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918-athletic-agile-echidna-114f16@l-nschier-aarch64>
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

On Fri, Sep 18, 2026 at 09:54:27PM +0200, Nicolas Schier wrote:
> On Fri, Sep 18, 2026 at 03:35:57PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Sep 17, 2026 at 06:07:29PM -0700, Nathan Chancellor wrote:
> > > On Thu, Sep 17, 2026 at 11:53:13AM -0700, Kees Cook wrote:
> > > > Yeah, totally right to move to a separate file. I think, however, I
> > > > would prefer this wasn't in init/ though. Kbuild uses scripts/ as its
> > > > Makefile.$topic dumping ground, and Kconfig.include also lives there. To
> > > > me, this new file should be scripts/Kconfig.toolchain instead. And
> > > > arguably, this should be included by the top-level Kconfig rather than
> > > > init/Kconfig...
> > >
> > > I do feel like scripts/ is a better location given that these are really
> > > things internal to Kbuild but I also see where Lorenzo is coming from
> > > that scripts/ is a little weird for this to live for discoverability,
> > > especially if we want people to put checks here instead of in a Makefile
> > > directly. To be honest, it would be kind of nice to separate the Kbuild
> > > parts of scripts into their own directory to make it clear what Kbuild
> > > uses versus what users/contributors should use but that is obviously too
> > > big of a project to tackle as a prerequisite for this.
> > 
> > Yeah it just seemed really weird/surprising to me (in the sense of
> > 'principle of least surprise') to put that in scripts/ and it doesn't seem
> > that traditionally anything else like this lives there.
> > 
> > But if you guys feel strongly enough I can put it there.
> 
> yeah, then I'd also slightly favor scripts/ for now.

Alright, I think scripts/Kconfig.toolchain wins then :)

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

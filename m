Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001F1C982D8
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 17:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fu1SPM6u2xXcnVqFZ3HHylVcrVtIC1rFe4kIzfo9G58=; b=pXBU2uOb1DHPiZ
	WlgLiWKMb+yfI3mlZN5KLUT9UCdIcavgwi3MxvjW8N8tDZyZSWhht1jkFqyGlU9zVyFhAqVVnmaRe
	m37mZ6T6ra+5/Q1rYDttQg/TypvM6L+9ASfGKhqTZgwfZRMlVWbQb4NKLL9gR1hiwz+sjQ481m/xt
	kJjgnsQF26uZXcR5QfBi4Gu+DOGq/cKaxaKgtY+Xv8m6hpQIiEU6Si0RJCBkPQsCA2x2kvORLjSSz
	X01vmXIYmO3HAhDvWMyzDXzl4aJlLru77QhZkrMAdXhQsiFhWuEAAtOJ6c0WXoBmEkrPEZnBXqC+M
	mc4KW9mJAQUtenEPKS/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7z5W-0000000GYeB-3OUt;
	Sat, 19 Sep 2026 17:42:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7z5U-0000000GYdV-2g91;
	Sat, 19 Sep 2026 17:42:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 90E8F601FB;
	Sat, 19 Sep 2026 17:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AA21F000FF;
	Sat, 19 Sep 2026 17:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789839775;
	bh=EmKMaNISpoD+G1Wl72W0nnHSvdTJBbpXkv1m5kyJz2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ggnnBtdi6oPvTc6LR8VCsrfY7orLsXOlCoJnnxw13VrUFRrRVhWMt5OAF2Opcj4ZB
	 YcIj4CllvKnSlvek+Z3wchBQHqdTiimX32aDKEaeVtMBpKvttmHxupE66jvcdbZsDs
	 LBKKyRaP+EZtC9uNq49fUEONC+dlrc+drK6RLUfOspsQKYhlEZ8fYPdjr2D3RUX7BE
	 dG9EDgFG4VB868oRySp7/V9e7xeDOTmKtslQFScCq8nE7IzwsTtsZJNjWCYbxKXMcI
	 AM6G1OmVdI7U9BlXwceEYSQcUcvmGvRTGTSUgpHsIMbGLxJBna3mI5nOv4Lu47rPgT
	 Lizsy0etFY2yg==
Date: Sat, 19 Sep 2026 18:42:40 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Manuel Ebner <manuelebnerli@mailbox.org>
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
	Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 20/20] kbuild: compress the kernel with pigz if
 available
Message-ID: <aq7JTyKVMljWOxer@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-20-9ecf4163ff36@kernel.org>
 <3be3dca3bee5695972e5419a1198bfee40a1ede7.camel@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3be3dca3bee5695972e5419a1198bfee40a1ede7.camel@mailbox.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 04:27:39PM +0200, Manuel Ebner wrote:
> Hi Lorenzo,
>
> On Thu, 2026-09-17 at 17:06 +0100, Lorenzo Stoakes (ARM) wrote:
> > The gzip step of a kernel build is very lengthy, especially for larger
> > builds such as allmodconfig.
> >
> > ...
> >
> > Whole build, 128-thread Threadripper 9980X, best of N runs:
> >
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 before=A0=A0 after=A0=
=A0=A0=A0 delta
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -----------------------=
--------
> > =A0 x86 defconfig, touch mm/vma.c, gcc=A0=A0=A0=A0=A0=A0=A0 7.7s=A0=A0=
=A0=A0 6.0s=A0=A0=A0=A0 -1.7s (-22%)
> > =A0 x86 defconfig, touch mm/vma.c, clang=A0=A0=A0=A0=A0 6.9s=A0=A0=A0=
=A0 5.4s=A0=A0=A0=A0 -1.5s (-21%)
> > =A0 x86 defconfig, clean, gcc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 28.2s=A0=A0=A0 26.3s=A0=A0=A0=A0 -1.8s (-6%)
> > =A0 x86 defconfig, clean, clang=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
28.7s=A0=A0=A0 27.2s=A0=A0=A0=A0 -1.5s (-5%)
> > =A0 x86 allmodconfig, touch mm/vma.c, gcc=A0=A0=A0 23.7s=A0=A0=A0 15.4s=
=A0=A0=A0=A0 -8.3s (-35%)
> > =A0 x86 allmodconfig, touch mm/vma.c, clang=A0 22.5s=A0=A0=A0 15.6s=A0=
=A0=A0=A0 -7.0s (-31%)
> > =A0 x86 allmodconfig, clean, gcc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 294.1=
s=A0=A0 278.6s=A0=A0=A0=A0 -15.5s (-5%)
> > =A0 x86 allmodconfig, clean, clang=A0=A0=A0=A0=A0=A0=A0=A0=A0 283.9s=A0=
=A0 266.8s=A0=A0=A0=A0 -17.1s (-6%)
>
> That's good to hear.

:)

>
>
> > Suggested-by: Kees Cook <kees@kernel.org>
> > Link: https://zlib.net/pigz/
> > Assisted-by: LLM
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> > =A0Documentation/kbuild/kbuild.rst=A0=A0 | 17 +++++++++++++++++
> > =A0Documentation/process/changes.rst |=A0 8 ++++++++
> > =A0Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 5 ++++-
> > =A0kernel/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |=A0 6 +++++-
> > =A0scripts/Makefile.lib=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 4 +=
+--
>
> Please add a line to
> scripts/ver_linux

Ack, done for v4!

>
> > =A0scripts/jobserver-exec=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 3 ++-
> > =A0tools/lib/python/jobserver.py=A0=A0=A0=A0 | 13 +++++++++++++
> > =A07 files changed, 51 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbu=
ild.rst
> > index 5a9013bacfb7..e71a692a559a 100644
> > --- a/Documentation/kbuild/kbuild.rst
> > +++ b/Documentation/kbuild/kbuild.rst
> > @@ -110,6 +110,23 @@ HOSTLDLIBS
> > =A0----------
> > =A0Additional libraries to link against when building host programs.
> >
> > +KGZIP
> > +-----
> > +The gzip program used for compressed modules, packaging and the embedd=
ed
>
> Could you also add gzip to changes.rst and ver_linux while you are at it?
> Rest looks good to me.

I'd rather leave that out of this series tbh, if I listed it then I have to
choose a minimum version that and feels out of scope.

One for a follow-up?

> Reviewed-by: Manuel Ebner <manuelebnerli@mailbox.org>

Thanks!

>
> Thanks
>  Manuel
>
> > +kernel configuration. Defaults to gzip.
> > +
> > +KPGZIP
> > +------
> > +The gzip program used for the compressed kernel image. Defaults to pig=
z (a
> > +parallel implementation of gzip), run under scripts/jobserver-exec so =
that it
> > +uses the job slots make has free, if pigz is installed, otherwise to
> > +``KGZIP``. Set ``KPGZIP=3D`` on the make command line to use another p=
rogram.
> > +
> > +KBZIP2, KLZOP, LZMA, LZ4, XZ, ZSTD
> > +----------------------------------
> > +The compressor programs for the other formats. Each defaults to the pr=
ogram
> > +of the same name.
> > +
> > =A0.. _userkbuildflags:
> >
> > =A0USERCFLAGS
> > diff --git a/Documentation/process/changes.rst b/Documentation/process/=
changes.rst
> > index 0aa232b117b5..28f2ca63318e 100644
> > --- a/Documentation/process/changes.rst
> > +++ b/Documentation/process/changes.rst
> > @@ -55,6 +55,7 @@ nfs-utils=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1.0.=
5=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 showmount --version
>
> + gzip
>
> > =A0openssl & libcrypto=A0=A0=A0 1.0.0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
openssl version
> > =A0pahole=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1.26=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 pahole --version
> > =A0pcmciautils=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 004=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 pccardctl -V
> > +pigz (optional)=A0=A0=A0=A0=A0=A0=A0 2.4=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 pigz --version
> > =A0PPP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2.4.0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pppd --version
> > =A0procps=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3.2.0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ps --version
> > =A0Python=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3.9.x=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 python3 --version
> > @@ -206,6 +207,13 @@ GNU AWK
> > =A0GNU AWK is needed if you want kernel builds to generate address rang=
e data for
> > =A0builtin modules (CONFIG_BUILTIN_MODULE_RANGES).
> >
> > +pigz (optional)
> > +---------------
> > +
> > +pigz is a parallel implementation of gzip. If it is installed the comp=
ressed
> > +kernel image is produced with it rather than with gzip, see ``KPGZIP``=
 in
> > +Documentation/kbuild/kbuild.rst.
> > +
> > =A0System utilities
> > =A0****************
> >
> > diff --git a/Makefile b/Makefile
> > ...
>

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

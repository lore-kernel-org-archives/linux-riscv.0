Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A20C88E4A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9O/BzZKGUyqvYtgc1m7uIBx1jI2h2p3FguMdWq36Hms=; b=C0NxzJJzmvUjaa
	uwv0eW4j8Uh+O312i+CPb5Urod0me7YqIIarWbDVraR9VS4zHvnP82jOnYujrdTczfbz9xYM+6tud
	seZ8eKIolkHrVQ6SYxgOcQMq25nFXh2ilsJWnh8BVz8egQGPrxN2V/2MZP/tRbqZLNdVvN1VmaWx6
	0R/BQVYw5h5M/zi9yud6unjUpKveMk3Cnh6m2f4GqL7rlRWvum3xLvt9HzIzKfPj/l8sxAc6FG1wz
	8spqtK4Vo2/iNOKDKEz5xx9m8skKVJph8yEtX7O23ge3f2PKK/9jAzpkDbBQjXdLIHrs+GGhqM1sW
	xEKekAcA2T1XyYDsd2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4z6j-0000000GT45-37Oa;
	Fri, 11 Sep 2026 11:07:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4z6h-0000000GT3q-3y0m;
	Fri, 11 Sep 2026 11:07:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 152916025A;
	Fri, 11 Sep 2026 11:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EBE1F000FF;
	Fri, 11 Sep 2026 11:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789124866;
	bh=Z5R803ok1N64Ij6e5RkKmHntxHwo36WmfqVksyW2/68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KlLFzFzTtoiQED3sQ3DsMJCH+1mi0zd/dFk1bMVb+RZOLDMmx2idq+ShAlvvNCCGH
	 +4BH7qu/502qk53259LY2fT0Ymt0PhtfCi0ySB2n8UTySbJysyjNfPoTSVikixqJdb
	 nfrPg/4QBYca6OhlKFZ2PWNUxKx3ghY5pW6PNItyvaccebNyPSbZX4HuGLZ/lEqpz9
	 BzSWA4IhilFr0kezEwfkkFNkw315kBshFBPCuSPu+b/KEdPAkO5CJmOR/jtFftmmOS
	 j5Eab5IVrLiRyYdYzIk4KfGIcjrzE/+F84eslzHqRWdZgO+0xjUUeVyfVQkzlTLrln
	 77KDB1L9c/CNg==
Date: Fri, 11 Sep 2026 12:07:32 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
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
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 04/23] kallsyms: output binary data to speed output and
 kallsyms assembly
Message-ID: <aqPgauP9sWKtWtc4@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
 <20260910102903.1b211f6b@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910102903.1b211f6b@pumpkin>
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

On Thu, Sep 10, 2026 at 10:29:03AM +0100, David Laight wrote:
> On Tue, 08 Sep 2026 21:55:04 +0100
> "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
>
> > kallsyms generates an assembly file that consists mostly of .byte entries
> > containing compressed names, token strings and name-sorted sequence
> > numbers.
> >
> > For an x86-64 build with 158k symbols that is a 37 MiB .S file which takes
> > 0.57s to assemble each of the two to three times it is built over a kernel
> > build.
> >
> > Each time it is generated it also takes kallsyms a similar amount of time
> > to output it.
> >
> > Avoid this overhead by instead outputting this data as binary and importing
> > it into the assembly using the .incbin directive.
> >
> > Tables that are wider than a byte remain part of the assembly to ensure
> > endianness and relative relocations are performed correctly.
> >
> > With this change, the output assembly file shrinks from 37 MiB to 9.8 MiB,
> > with a 2.6 MiB binary data file alongside it, and the object remains
> > identical.
> >
> > The generated binary file is deleted correctly on build clean along with
> > all other ephemeral data.
> >
> > On an x86-64 system with CONFIG_KALLSYMS_ALL set:
> >
> >                        before   after    delta
> >   scripts/kallsyms     0.24s    0.18s    0.06s
> >   assemble             0.57s    0.16s    0.41s
> >
> > Per kallsyms invocation/assembly, for a total of 0.47s time saving upon
> > invocation.
> >
> > An incremental build on the same system was reduced from 11.15s to 9.65s,
> > indicating a total of 1.5 seconds saved over the build.
> >
> > The kallsyms runs and their assembly are on the serial tail of every build
> > that links vmlinux, no-op builds are unchanged.
> >
> > Whole build, 128-thread Threadripper 9980X, best of N runs:
> >
> >                                          before   after     delta
> >                                          -------------------------------
> >   x86 defconfig, touch mm/vma.c, gcc       10.8s     9.9s    -0.92s (-8%)
> >   x86 defconfig, touch mm/vma.c, clang     10.7s     9.5s     -1.2s (-11%)
> >   x86 defconfig, clean, gcc                29.5s    28.7s    -0.81s (-3%)
> >   x86 defconfig, clean, clang              29.7s    28.6s     -1.1s (-4%)
> >   x86 allmodconfig, touch mm/vma.c, gcc    45.3s    44.0s     -1.3s (-3%)
> >   x86 allmodconfig, touch mm/vma.c, clang  42.9s    40.2s     -2.7s (-6%)
> >
> > Assisted-by: LLM
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  scripts/kallsyms.c      | 97 ++++++++++++++++++++++++++++++++++++++-----------
> >  scripts/link-vmlinux.sh |  2 +-
> >  2 files changed, 77 insertions(+), 22 deletions(-)
> >
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 350d118c3b9e..61c5eb537ed4 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c
> > @@ -5,7 +5,10 @@
> >   * This software may be used and distributed according to the terms
> >   * of the GNU General Public License, incorporated herein by reference.
> >   *
> > - * Usage: kallsyms [--all-symbols] in.map > out.S
> > + * Usage: kallsyms [--all-symbols] [--pc-relative] in.map out.bin > out.S
> > + *
> > + *      The byte tables go to out.bin and are pulled into out.S with .incbin;
> > + *  wider tables stay assembler source for endianness and relocations.
> >   *
> >   *      Table compression uses all the unused char codes on the symbols and
> >   *  maps these to the most used substrings (tokens). For instance, it might
> > @@ -102,7 +105,7 @@ static void sym_arr_free(struct sym_arr *arr)
> >
> >  static void usage(void)
> >  {
> > -	fprintf(stderr, "Usage: kallsyms [--all-symbols] in.map > out.S\n");
> > +	fprintf(stderr, "Usage: kallsyms [--all-symbols] [--pc-relative] in.map out.bin > out.S\n");
> >  	exit(1);
> >  }
> >
> > @@ -319,6 +322,40 @@ static void output_label(const char *label)
> >  	printf("%s:\n", label);
> >  }
> >
> > +static void write_bin(FILE *file, const void *data, size_t len)
> > +{
> > +	if (fwrite(data, 1, len, file) == len)
> > +		return;
> > +
> > +	perror("kallsyms: write");
> > +	exit(EXIT_FAILURE);
> > +}
>
> It is pretty pointless checking the return value from fwrite().
> Most of the time it is just doing a memcpy().
> Instead call fflush() and the ferror() prior to the fclose().
> (Or just rely on fclose() giving you that error status.)

Ack, will fix up in v2.

>
> David

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

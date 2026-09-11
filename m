Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46709C88E4C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 10:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+L7cr1goZ7Zy3X5Z15vMurGIfcfIJB/eDzIJuzoO+o=; b=utW8Q1ydCSDUFo
	89c6NvlDUbevqqEk1w/15MKA5J7bVLI60OEoN6z+2R7yvaWwF2wMv8wcjEJzj6egC3daVjXIafy7i
	Inm/I+2RptmZ2dSVu+G79q1OM9I4hnUMJSSGxrX2nT7PaL3KaaOU3aFvUhVrCQhWSokeutE5j6p7i
	JpWEvNOYgN8mEYPB9iOuR4PnsUKRT+jT/N2ioe5k2xO8vY/Zqozbld9nEHGLEOwMbci24OLobeMqZ
	H5qRxPcRXdFfzPHhh3jkJhYIbF09bptBP7ktLg01z5YAb9UrBG7rtbD18U98F2R0glxTRYUVjiyOS
	hekadU13tuqBWPQ5DykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yPg-0000000GNKc-1VE6;
	Fri, 11 Sep 2026 10:23:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yPe-0000000GNKL-3mfH;
	Fri, 11 Sep 2026 10:23:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A53EA40AB3;
	Fri, 11 Sep 2026 10:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821D71F000FF;
	Fri, 11 Sep 2026 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789122198;
	bh=8ECrevmQ6/PJeWeSr3u1OcXApUW19sxOeBWTobGlU0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YHie+TAswX/1aTgWgK4V8FqGIGQyk2pjS1A1OkW+sR0kayG1RAqxnwsXqUbCxOAQO
	 2dCSLuBLe93EhOuUc1H6hVk8Q7GPwn2vEnK7YUsPr3zY3BNR7W6PoedUmczYZgRt9z
	 Kon71kSs6gBnP6mZcl5cYeaKUE5eIx3Yr2SpiPUx88wPRcRPwK8EI4sBinltZjzYl8
	 7Grhprcd+aZsmUWiFAZysee/k9upqETMTRXWHXu5Q4rnmHbelj8dby6YhhkhhRA9Oj
	 3XTQgtbwjesb4obq4GOE9nLymizEPZc7kSxnFGKA/fGWycbu/zhjw8uC2ClK7m1O77
	 PF0cGOECPDBGw==
Date: Fri, 11 Sep 2026 11:23:04 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nicolas Schier <n.schier@fritz.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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
Subject: Re: [PATCH 16/23] kbuild: batch module finalisation
Message-ID: <aqPWcnRVABgH0V8t@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-16-5dc1ac01672d@kernel.org>
 <20260910-nondescript-fierce-wapiti-de1cea@l-nschier-aarch64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910-nondescript-fierce-wapiti-de1cea@l-nschier-aarch64>
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

On Thu, Sep 10, 2026 at 05:48:53PM +0200, Nicolas Schier wrote:
> On Tue, Sep 08, 2026 at 09:55:16PM +0100, Lorenzo Stoakes (ARM) wrote:
> > Module finalisation on allmodconfig builds consists of a large number of
> > very short-lived jobs, and the make job dispatcher cannot possibly dispatch
> > jobs fast enough.
> >
> > For allmodconfig x86-64 this can be on the order of ~22,000 jobs of a few
> > milliseconds in duration each.
> >
> > However per-job cost grows with the variables the instance holds, here the
> > savedcmd_* of every .mod.o and .ko read back from the .cmd files, since it
> > walks them all to build each child's environment.
> >
> > This makes module finalisation very inefficient when large numbers of
> > modules are being built.
> >
> > Fix this by splitting modules.order into chunks of 128 at a time, run in
> > parallel.
> >
> > Each instance holds only its own modules' variables and the top-level one
> > reads no per-module .cmd files at all, the same rules serve both levels,
> > and an instance is told its chunk with modfinal-first=<index>.
> >
> > "make modules" with every *.mod.o and *.ko deleted goes from 28.9s to 15.9s
> > with clang 22. No-op "make modules" goes from 5.6s to 4.8s, as checking the
> > 22,000 targets is spread over the chunks too.
> >
> > Whole build, 128-thread Threadripper 9980X, best of N runs:
> >
> >                                          before   after     delta
> >                                          -------------------------------
> >   x86 allmodconfig, no-op make, gcc         1.9s     1.2s    -0.74s (-39%)
> >   x86 allmodconfig, no-op make, clang       2.4s     1.6s    -0.77s (-32%)
> >   x86 allmodconfig, clean, gcc            304.5s   291.4s     -13.1s (-4%)
> >   x86 allmodconfig, clean, clang          301.7s   297.0s     -4.7s (-2%)
> >
> > Assisted-by: LLM
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  scripts/Makefile.modfinal | 26 +++++++++++++++++++++++++-
> >  scripts/mod/sumversion.c  |  4 ++--
> >  2 files changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> > index 75e9effdf02c..858fa798090b 100644
> > --- a/scripts/Makefile.modfinal
> > +++ b/scripts/Makefile.modfinal
>
> [...]
> > diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
> > index 2cbadd3cd97d..5501d6aa0bea 100644
> > --- a/scripts/mod/sumversion.c
> > +++ b/scripts/mod/sumversion.c
> > @@ -249,7 +249,7 @@ static int parse_comment(const char *file, unsigned long len)
> >  /* FIXME: Handle .s files differently (eg. # starts comments) --RR */
> >  static bool stop_char[256];
> >
> > -static void init_stop_chars(void)
> > +static void sumversion_init(void)
> >  {
> >  	static bool done;
> >  	int chr;
> > @@ -274,7 +274,7 @@ static int parse_file(const char *fname, struct md4_ctx *md)
> >  	len = strlen(file);
> >  	if (!len)
> >  		goto out_file;
> > -	init_stop_chars();
> > +	sumversion_init();
> >  	buf = xmalloc(len); /* File output buffer. */
> >
> >  	for (i = 0; i < len; i++) {
> >
> > --
> > 2.55.0
> >
>
> (I have only skimmed through, not yet reviewed this patch.)
>
> The change in sumversion.c seems to be wrong here.

Ugh yeah this is a merge conflict artifact that I thought I had fixed but
clearly not :) Will fix up on respin.

>
> --
> Nicolas



--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

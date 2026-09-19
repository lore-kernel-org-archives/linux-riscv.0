Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5EAC982D7
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rT9bY0A3qPIee+yR1SE4yYKx72yTGh8FXe1dYPGD7nw=; b=QVr8gfLpsYv7EH
	RMgHl22OdKFcPcNyNGkgJh5ZpqpjFlJsk0xYvqEAdF+oQYw1+9y7L98wKch2+/ybEQHaG9r9grSY9
	taClON7TY6ayeNZib2ybKtDDXbV62xg0J3IZtsNtFv60JYW7q/claxnEnFiVXV1Ul5bCjQG9y1oQS
	vHvu3qVql06Dh+x/yChrhCXZU1hLmQG5gWiD3L5hdrOYbAwgNtYY75txODdBZt2ePt/tWvg5ePiq1
	IwbgrJPM5sqrKjaS51+1E0AFad0LIq7VIoDj2pK5H8YKqhCtjLVbLcV4ciEBtxV43WlIHpLHmLmTC
	VeIWvcS4aUABPrzzjZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7yW2-0000000GXZj-1uTk;
	Sat, 19 Sep 2026 17:06:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7yW0-0000000GXZZ-41Hl;
	Sat, 19 Sep 2026 17:06:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3CE18416C9;
	Sat, 19 Sep 2026 17:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8F61F000FF;
	Sat, 19 Sep 2026 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789837576;
	bh=cp7IEETulhNNvTomwaQYYTkvWo5Eqhoj/wXmKoaFO4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MuPE8ruSDiY+vr36+JeUGuYdOnALa5QKrisi/BG1HaQa0xVradFpJv3oMaHTUZvIm
	 0Tm7pchQtDyar6Vd6MHTsOi/mbklaLyyfkIXrQenVx4rBCJIqsWJ4tlQ3bdSxQVoLf
	 s8u/0m7VN/uL0RdpAYtWIqGng7og3enVKJ6/vhiRURiipRleoi3sqA8ferDExbCxwJ
	 osJCO63da0Qo4R804Nxj2mWG5ihhWKifsa7vcTLWitso6eItpA5WbK4qLlKLpMrwo7
	 5pyWG0bGQyuwjT+HrRDkEs9k7SYKBJ2cgCnmAhUmdAvZwosbUc9tV67xLFAr3oTOFL
	 d4llrSotsYqhQ==
Date: Sat, 19 Sep 2026 18:06:01 +0100
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
Subject: Re: [PATCH v3 09/20] kbuild: implement and use depcheck to check
 dependency timestamps
Message-ID: <aq7AwXTJyJF3tVh0@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-9-9ecf4163ff36@kernel.org>
 <202609171117.35BFDCC13@keescook>
 <aq6-KMkAx7q_xLO4@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aq6-KMkAx7q_xLO4@gremlin>
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

On Sat, Sep 19, 2026 at 05:57:36PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 17, 2026 at 11:42:50AM -0700, Kees Cook wrote:
> > > [...]
> > > +static const struct dep *lookup_dep(const char *path)
> > > +{
> > > +	const unsigned int key = hash_str(path);
> > > +	struct dep *dep;
> > > +	struct stat st;
> > > +
> > > +	hash_for_each_possible(dep_table, dep, hnode, key) {
> > > +		if (!strcmp(dep->path, path))
> > > +			return dep;
> > > +	}
> > > +
> > > +	dep = xmalloc(sizeof(*dep) + strlen(path) + 1);
> > > +	strcpy(dep->path, path);
> > > +	dep->exists = !stat(path, &st);
> > > +	if (dep->exists)
> > > +		dep->mtime = st.st_mtim;
> >
> > I realize you only check "mtime" after an "exists" check, but I bristle
> > at leaving a time-stamp uninitialized. Can we just add an "else
> > dep->mtime = 0" here?
>
> Ack, done for v4!

Actually I think it's nicer to just make this xmalloc() an xcalloc() here,
dep->mtime is a struct timespec and setting that to zero gets ugly :)

>
> >
> > -Kees
> >
> > --
> > Kees Cook
>
> --
> Cheers, Lorenzo

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

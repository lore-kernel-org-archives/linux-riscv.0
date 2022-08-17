Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2957C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 16:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cxih5wHUtvmywwX0ZO5cZ3sZ87WYGQHDqDeHNbp5qYQ=; b=16pLa/6v6KanG5
	c8LGC5S+Jxh7/NBBPrZ1Oc/L6gBSiS5WGmwalCMGJRXy7okB2ZEYACHmk6w6si5V56v+Fqcfzny0q
	FlemmLB1PA55L/929jzeSm1qSU2arJKP7hb/uaPZ+RO0qpExanOS+Er1Vzq0lo7EwAf6VJ+9E5TlU
	w6hTe4MtK4fA6Iezvn9tqg2edFZXAwWMBwCjEgnowsomBrwwseYvNiiLLoRDc0mZRc7Lguj/MUuK/
	ue3oB6ffh7BaR/36Qzeadliv8sbj8WkOlFTS67IN3ZIqaktJBE6zvkG0mTlpOFpGs/nnl1f0XjATS
	Ktwq+nBVTAGyp6GAEJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOLda-003f4a-7e; Wed, 17 Aug 2022 16:11:22 +0000
Received: from mail-4318.protonmail.ch ([185.70.43.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOLdV-003eyw-Ga; Wed, 17 Aug 2022 16:11:19 +0000
Date: Wed, 17 Aug 2022 16:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1660752671; x=1661011871;
	bh=D7wmN5qV4emk+fg1faj1v+A7IXjv09X2AsHUIrsCn0k=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=IsDoc4npeWk0r72wVIlqVnw1Z7A9wz2QzGggjZ0LMDtOAWxh+wgWqOxMimKAoNGPA
	 yQN4hx+K4ji7Zo2YxqmLF+UAutLDoxVMcJ5EiOksPgBWJNSTfvRP01jcLdgn+U/IHR
	 lXnXYbDak+b9zfyGitx64bR07jPvJyYjob9QCO1BPGcMIKqF9J+JjWjsL3zFXa06e8
	 N9wayJKKpjGwuTW5ohs6cw9SrMhUNZU/zi/Ag4HZHPPprbH7yJA/VSPu9aTVjB/7Os
	 cou5MU5UT4+ZoTjhexXmeuzWC0G1mjkOuHMhvDsrU4XPDLebMxpzFTvKSYtr/3IUaN
	 pv0TUeeu7un9Q==
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sven Van Asbroeck <thesven73@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Miguel Cano <macanroj@gmail.com>, Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>, Douglas Su <d0u9.su@outlook.com>, Borislav Petkov <bp@alien8.de>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, "H. Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, Adam Bratschi-Kaye <ark.email@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, linux-um@lists.infradead.org, Michal Marek <michal.lkml@markovi.net>, Daniel Xu <dxu@dxuuu.xyz>, David Gow <davidgow@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, linux-arm-kernel@lists.infradead.org, Tiago Lam <tiagolam@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Boris-Chengbiao Zhou <bobo1239@web.de>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, Finn Behrens <me@kloenk.de>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, Philip Herron <philip.herron@embecosm.com>, Arthur Cohen <arthur.cohen@embecosm.com>
Subject: Re: [PATCH v8 27/31] Kbuild: add Rust support
Message-ID: <rYTolA_zKqIX3oCL_i-vlIqKS99s0bYQmRKAdcScDq0mcyxti3imzP7AvJzBpiI6RAuH5RU5BpU4xuEY1Vzq57CuY5v47tO3SuUNAMd7seM=@protonmail.com>
In-Reply-To: <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com>
References: <20220802015052.10452-1-ojeda@kernel.org> <20220802015052.10452-28-ojeda@kernel.org> <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com> <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com>
Feedback-ID: 27884398:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_091117_727414_F96F2D3C 
X-CRM114-Status: GOOD (  39.54  )
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
Reply-To: =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wednesday, August 17th, 2022 at 17:13, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> Hi Arnd,
> 
> On Wed, Aug 17, 2022 at 4:40 PM Arnd Bergmann arnd@arndb.de wrote:
> 
> > Hi Miguel,
> > 
> > I tried enabling rust support in the gcc builds I provide at
> > https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/arm64/12.1.0/
> 
> 
> Thanks for giving it a go!
> 
> > to make this more accessible, but it appears that the command line
> > options here are not portable:
> > 
> > /home/arnd/cross/x86_64/gcc-12.1.0+rust-nolibc/x86_64-linux/bin/x86_64-linux-gccrs
> 
> 
> So you mean with GCC Rust, right? (i.e. we have "GCC builds" working,
> via compiling the Rust side with LLVM and linking with the GCC C side,
> but it is not intended for production or to be supported, even if we
> cover it in our CI, test it boots and loads modules etc.).
> 
> Indeed, `gccrs` does not support `rustc` flags yet. I am not sure if
> the GCC Rust team will eventually provide a driver for those like
> clang does for e.g. `cl` -- I would hope they do, since many projects
> would benefit from it, but maybe they plan to start simply by
> modifying Cargo to call them as they need instead.

There is already a prototype of such a driver. It can be found at https://github.com/Rust-GCC/cargo-gccrs. Unlike what the name suggests it is not cargo specific. It consists of two binaries. The first calls cargo, but tells it to use the second binary instead of a real rustc. This second part then translates all arguments to what gccrs expects. It is possible to directly invoke this second binary. For now it probably won't work for rust-for-linux though as it doesn't have all arguments that are used by rust-for-linux implemented.

> 
> If they don't support it, we will have to map the flags on our side --
> it should not be a big problem. However, see below...
> 
> > I guess nobody has tried this so far. Would you think that fixing this is only
> > a matter for fixing the build system to pass the correct flags depending on the
> > compiler, or is this broken in a more fundamental way?
> 
> 
> If you meant GCC Rust, then it is a bit too early for the compiler. As
> far as I now, they are working on compiling the `core` crate and
> supporting more stable language features. They are also researching
> the integration of the borrow checker, though we wouldn't need that
> for "only" compiling the kernel.
> 
> Now, if they decided to focus on supporting Rust for Linux early on
> (which would be great), they would still need to work on the delta
> between what what they target now and what we use (which includes both
> stable and some unstable features), plus I assume infrastructure bits
> like the platform (target spec) support, the flags / `rustc` driver
> (though I would be happy to do as much as possible on our side to
> help), etc.
> 
> (We privately talked about possible timelines for all that if they
> were to focus on Rust for Linux etc., but I let them comment or not on
> that... Cc'ing them! :)
> 
> Cheers,
> Miguel

As alternative to GCC Rust there is also github.com/rust-lang/rustc_codegen_gcc/ which uses libgccjit as backend for the official rust compiler rather than writing a full Rust frontend for GCC from scratch. With a bit of patching to force it to be used, I was able to compile all Rust samples with GCC using rustc_codegen_gcc. However it gives warnings of the following kind:

    ld.lld: warning: rust/built-in.a(core.o):(.data.rel.local) is being placed in '.data.rel.local'

And hangs very early in the boot process. If I enable early logging, it prints up to "Booting the kernel." and then does nothing. This is probably because support for setting a different relocation model is not yet implemented. I opened https://github.com/rust-lang/rustc_codegen_gcc/issues/205 for this.

There may be other issues, but rustc_codegen_gcc is probably going to be the easiest route towards a LLVM free rust-for-linux build. By the way note that rust-bindgen which we use for generating rust bindings from C headers depends on LLVM. See https://github.com/rust-lang/rust-bindgen/issues/1949.

Cheers,
Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

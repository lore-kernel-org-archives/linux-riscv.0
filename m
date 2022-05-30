Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5412C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 13:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GR08iBaMH47WeDPOrRwuMsWoklKngp7pqC+6mij6sWc=; b=TlhD6CJsWvlm8h
	zkDtCFo40UW42KWVQomeSUjgFu3mTrTWhVKvqrHYksN4OUwFvU8h4b8ZhvUrCTzUl06TONobG9Brk
	7QyxK+A1pDoZzGWocZP28KY2heW6LAq3w+Tnlny4kkpK/lgcjUEtwcEedST6NB+Ndcf5Rtvhk71wP
	MdoN+1qTBIgL2MP9MTUqqPXbec3hxUU5CZpMiNubDXLs3ccjk7iAJDJIAfndcyrwxNsBYnBnn/IcI
	L//PSKR7BwMoeiKrI1N65r+WcqHtNvuONqf3f6UOmPCaNL8UKK7xxLOVAf/AStfKgAiOLzpTv+wff
	ERafJ4kekxP8ix9gfTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfso-006xZo-5T; Mon, 30 May 2022 13:56:34 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfcr-006o0c-TV; Mon, 30 May 2022 13:40:07 +0000
Received: by mail-io1-xd29.google.com with SMTP id y12so11345342ior.7;
        Mon, 30 May 2022 06:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gIwe3AKRbCHeJRE3dPTatS7K/6ILlXUNL6T/HNDhAhU=;
        b=cSzwr5INM0XMJMTjfBIFqC6i5S58eV8gcJa/64rR0gDugFmRTU5nQgL16eOHpgeMFI
         7AfIC/ykpu26A1o3tWj6uRAXJg8F8QVvcvAIxqOgTwk//2oTGuNDuWVqcGupsqpPcM6T
         ZRAJqMTcOk2f0Pg5Sqy8051E3rZJH3I33bcAioIyj1QEd+htYi69FlxTGKOOn4GcVjjE
         pEirF1LZJZUjhxfS+0GnGmUhc97QLgfasJMGHXk9cu2E+2pU6QcPUuPNv5BRpstZpwXX
         9NoZsAOpE0EVU3IryTlU5mkC2xM3qI4IbFyk9WdwRkwSVZe45lL2Nx+m0vwWNHCFkswg
         kaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gIwe3AKRbCHeJRE3dPTatS7K/6ILlXUNL6T/HNDhAhU=;
        b=iqAaOyHLAp8ytKmdzDAmxyyhDN4sMPKOFgPDYlxpZNPgIXK1BpjLVObd+Yi3FaDHXL
         LlDluvyZ7uTKmJN8WDQCffRFTa7YTbUx0p8Kzi3t0Kkf784Q/BidhJ1PDWAAf1eJq/O4
         pUaEWJi3xrXQrLjtuOKdAx3jY2u3pLwk4Zm/oGcYPyvTjmY6DtnYx+DH3s+zIYZEhuvP
         1GeuzZZbtk7sOAOIC+ouISuYOQVymiYAV/nGAqbw6QORQbDZXH4hTwYlScOohiFV5bsz
         Ypm7UxCI7/EUyAVxWyWldu1GYTwoNmMSrISTt2XmM/IwDFhdmMas9AJfk+xpJonAxRR3
         1Y9A==
X-Gm-Message-State: AOAM531HmdV+GmAnrfetIhoxzBrpu3B4KRK+G/zB1mfMVu54H6giI96r
	p3BsfSmdZpfgjNcL2RgzJpwwrxM6EgmOn0HrYsk=
X-Google-Smtp-Source: ABdhPJynB3luYlUIXTTDca8c2gxMygZVtlz0csg40D16eodRT8Q+xqzjGbylbRXxbzD+mvxPI5WGRexbTj0PrTzr1DM=
X-Received: by 2002:a05:6638:f89:b0:32e:89f4:e150 with SMTP id
 h9-20020a0566380f8900b0032e89f4e150mr27799661jal.308.1653918002647; Mon, 30
 May 2022 06:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org> <20220523020209.11810-22-ojeda@kernel.org>
 <CAKwvOdn+9qORm8UpDGnPXxiK7B7P_TW5CtXv1+8qkv7UvQr3hQ@mail.gmail.com>
In-Reply-To: <CAKwvOdn+9qORm8UpDGnPXxiK7B7P_TW5CtXv1+8qkv7UvQr3hQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 May 2022 15:39:51 +0200
Message-ID: <CANiq72n2bU3LSGu-4v66nif_95EVq--z2X_F2V7JBPU8v=h8EA@mail.gmail.com>
Subject: Re: [PATCH v7 21/25] Kbuild: add Rust support
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Finn Behrens <me@kloenk.de>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Sven Van Asbroeck <thesven73@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Boqun Feng <boqun.feng@gmail.com>, Douglas Su <d0u9.su@outlook.com>, 
	Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, Antonio Terceiro <antonio.terceiro@linaro.org>, 
	Daniel Xu <dxu@dxuuu.xyz>, Miguel Cano <macanroj@gmail.com>, David Gow <davidgow@google.com>, 
	Michal Marek <michal.lkml@markovi.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-um@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_064006_024196_BDA0E17C 
X-CRM114-Status: GOOD (  36.66  )
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

On Thu, May 26, 2022 at 12:25 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Is there a reason to not just turn clippy on always? Might be nicer to
> start off with good practices by default. :^)

The idea crossed my mind too [1], but sadly Clippy disables some
optimizations and in general is not intended to be used for normal
compilation [2].

[1] https://github.com/rust-lang/rust-clippy/issues/8035
[2] https://github.com/rust-lang/rust-clippy/pull/8037

> Are there *.rmeta directories that we _don't_ want to remove via `make
> mrproper`? I'm curious why *.rmeta isn't just part of MRPROPER_FILES?

Putting them in `MRPROPER_FILES` would mean only those in a given
directory are removed (e.g. the root one), but the idea here is to
find them anywhere in the tree, since in the future we may have
library crates in different parts of the tree.

However, I am not sure I understand your first question in relation
with the second one -- if we put them in `MRPROPER_FILES`, that would
remove less, not more.

> I don't think we need to repeat dir/* here again for rust. The
> existing targets listed above (outside this hunk) make sense in both
> contexts.

The idea here is to document the differences (e.g. `RUSTFMT`) and that
we may have other targets in the future that do not apply to C (e.g.
MIR dump, if that happens to be useful).

But maybe I can fit that in the normal place and make it still look
good... I will give it a try.

> Does rustc really use .i as a conventional suffix for macro expanded
> sources? (The C compiler might use the -x flag to override the guess

It is not a conventional suffix at all as far as I am aware.

Maybe we should use a different one to aid editors and users anyway,
e.g. `.rsi`, similar to `.mi` for Objective-C `.m` files.

> it would make based on the file extension; I'm curious if rustc can
> ingest .i files or will it warn?)

The macro expanded output is not intended to be used as a compilable
input, but as a debugging aid only. I can note this there.

Having said that, `rustc` accepts the "preprocessed" output in the
sense that it will just treat them as normal source files (no flag
needed, and e.g. both `.i` and `.rsi` work); however, it may give new
diagnostics or may require extra flags to enable some compiler
features.

From a quick test, I managed to compile a "preprocessed" Rust kernel
module with only command-line changes. But if we really wanted to
support this, we would need to ask upstream Rust to actually support
it.

> Are these two kconfigs used anywhere?

Not for the moment, but it could still be useful when getting
`.config` reports (and we could add it to `LINUX_COMPILER` etc. in the
future).

> How does enabling or disabling debug info work for rustc? I may have
> missed it, but I was surprised to see no additional flags getting
> passed to rustc based on CONFIG_DEBUG info.

`-Cdebuginfo=` is the one; by default there is no debug info and that
option enables it (i.e. it is not just the level but the enablement
too).

(Note that in userspace, when compiling a common program, you will get
some debug info coming from the standard library and other
dependencies).

> Ah, that explains the host rust build infra.  Bravo! Hard coding the
> target files was my major concern last I looked at the series. I'm
> very happy to see it be generated properly from .config!
>
> I haven't actually reviewed this yet, but it makes me significantly
> more confident in the series to see this approach added. Good job
> whoever wrote this.

Thanks! I thought Rust would be a nice option for writing hostprogs,
though of course for the moment only programs that can assume Rust is
there may use it.

Note that non-x86 specific options need to be handled properly still
(e.g. move things between the arch Makefiles and the hostprog as
needed).

I would still want to see compilers come to some kind of common format
for this as we discussed other times, but... :)

> Does `$(READELF) -p .comment foo.o` print anything about which
> compiler was used? That seems less brittle IMO.

Currently, `rustc` does not add a `.comment` section; but we could
ask, I sent [3].

If debug info is enabled, another way is using the `DW_AT_language`
attribute, like `pahole` will be doing for a new option we need [4].
However, we would still need a way for the other case.

In any case, I am not sure something like `.comment` is less or more
brittle -- compilers could in theory change it (e.g. not emitting it),
while adding a symbol is something we control. So different kinds of
brittleness.

[3] https://github.com/rust-lang/rust/pull/97550
[4] https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?id=8ee363790b7437283c53090a85a9fec2f0b0fbc4

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

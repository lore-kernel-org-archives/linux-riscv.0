Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A0FC88E53
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 12:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plyYlqXE9r/eLLyWL5Af2MMLW3S17NuqbFTt+/evbfg=; b=OQffiMvpqUg/Vd
	4/NdiMUxlDa9S7yR1sux+p469bZkDjVB81xfBcINMscLB+i1kNCKN1rWzjhmBSUN1voo8qbm8lSuj
	lF4AoFEy1rrH0s5O2Y8PP3S2lYicUVO+dOAGrJt8j5kz4O5V8quRslUXa7GF7eh74XboCmx+qbQel
	ZDQc1MzjLf/iWxqmrdF52XCIAllQmMVpU/SM72i9zs1hdQYAvXgLp1QRYa1gCFtz7RGFbaQcZUie6
	J1yy+EQ+8BVKZ0llRn9TjxWkZwMB2kwLyNhK7etTRty73vQSSBaZRU8XgRsv9oheC8XxpTpSE4CKV
	WnSG0cXRDIxpsFdVA09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SD9-00000006TwN-1rjh;
	Tue, 15 Sep 2026 12:24:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SD7-00000006Tvg-2ysE;
	Tue, 15 Sep 2026 12:24:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D66EF602A8;
	Tue, 15 Sep 2026 12:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965111F00893;
	Tue, 15 Sep 2026 12:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789475068;
	bh=oybH7eUIXKQPekIV7WrspdJ7cyHg8nnBvzsloGcaUcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VSaS7F8OJuNuEs3hoUYH76UztTiKslXOl7yAzD2g4gLjW+wKdODE4ANHrYphBLvcC
	 dGQy3ey9t5efNqzisI0bUxDeGSY5PMDK/ax9/0NQvgRzWjcV7F7EvSP2B/s6DK3yVq
	 LFk4eZeHY6yXs4Bdceq1zyCgKeMUHsFp59hbk5m8WeQ+Fb5DlCQHi/TGx8gXJTsZ5g
	 4PAd+0aC9GXETgFVdHQurW/S48n9SVPZKOb37fkbk6zWKNxSbX4MCdrWfrI+5lw5mV
	 ic86w///f180dvzmes95xRX+VFp+twm4uFnIt2UCdpXtQU6L7BYsK4DvAH5U2Nt83Z
	 YRdnbbuTH1zuw==
Date: Tue, 15 Sep 2026 13:24:17 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, 
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
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 15/21] objtool: cache relocations, do less work
Message-ID: <aqk4Oani0H0Wpxs1@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-15-39817ec5db23@kernel.org>
 <aqhLhVMkNzf_4oJw@jpoimboe>
 <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
 <aqhmhmgrnN3Mw8yG@jpoimboe>
 <CAHk-=wj3BKkCYtmfs5sORF_+Oumv2Gc8D+YxkMp9W2-mvLS=Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wj3BKkCYtmfs5sORF_+Oumv2Gc8D+YxkMp9W2-mvLS=Ug@mail.gmail.com>
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

On Mon, Sep 14, 2026 at 03:30:19PM -0700, Linus Torvalds wrote:
> On Mon, 14 Sept 2026 at 15:23, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > There might be more efficient ways to structure the considerable amount
> > of data, like replacing "struct instruction" with "struct basic_block"
> > or so, but it's hard to know whether that would be a net positive.
>
> Yeah, I was thinking that you'd only hash instructions as you find
> them if they are obvious "I need this instruction", and then try to
> hash them *again* if they are branch targets (and just have a "already
> hashed" flag).
>
> That way random number instructions would not be on the hash - unless
> they become branch targets.
>
> And you wouldn't ever really have to track any complicated decisions
> (like that whole "basic block" thing - I agree that it's painful,
> because the shape of a basic block will change over time as you find
> branch targets).
>
> But not a big deal. More an idle thought brought on by that other
> patch that changed the hash table size, and this discussion that was
> talking about the hashing - or not hashing - of sections.
>
> So more of a "if it is easy and straightforward" kind of thing.

Obviously I defer to Josh on this, but it seems from what he said it's
probably a little involved and maybe tricky to figure out how much impact
it might have.

Anyway v3 drops the relocation hash altogether so 1 out of 2 ain't bad ;)

>
>              Linus

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

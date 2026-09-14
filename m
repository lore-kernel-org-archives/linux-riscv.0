Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605E5C88E77
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 22:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMfdPrnw0lKJ7kut7uuetnEck9exhpeEiMYHAGJpZfE=; b=PWjV5eIL+HuHln
	I03fUeLjJkuZ2or+f5TtQKzDUj8meJJJZPaibs803ySkg+qBGoEpY+C3BlX/6bMnSsTb+/ByrJ62F
	6sIWe1QehgWUtARCsbcGxlnCnGs9bEP+yl4SThV65oG8flzMm8WUhQu5uX4gXRKcd4noAtbSsMYAm
	DiFPLNhOwN0IcDgpuwOWoSMsgw1el+R7l7bwTqe6DLi8Pqe22/eyNXvy6+Gf61wFtaQQhqCsqZvM6
	XSAXrxa5KstqPfHkci3lTL9S+Jl9Bv5kEhT3d9K9HjkvHwTom1/cDDVBpJP0M1x4t3MEnHys1bL48
	vH9C0oA5Yb3Txn69INqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6F51-00000004mOD-1suY;
	Mon, 14 Sep 2026 22:23:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6F50-00000004mNf-1q2l;
	Mon, 14 Sep 2026 22:23:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AAE0D6025F;
	Mon, 14 Sep 2026 22:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F201F00893;
	Mon, 14 Sep 2026 22:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789424593;
	bh=RRU+yJML1OMM4sdrHKCW6nAyxyoRhK5ooyzt6zbz5EA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mhzzpIjt8ICc0v+9pwXJLGyUo6/4W86Z9Rd1H/nQJGbazdtLE1Dircqquu9iu2efd
	 FnFEeSd8Y2RIPZ43wFwVrX43cYp0Sv0pszmycH5HIWO/hHXzN2FQTBI+CgVh2fEhcA
	 cUizGTL1e5OKK9RyZcUuVM/i59uYEOlNvO23SwXcgW0vdOz7OPrXqcIdhhOxvIGRhW
	 LW1F5LwtIFv6MXdFHdRieN3hkXyESVONyHVUaDYgtKSVnwmy7eQOpON9jAxZSjHiQV
	 s+POBLypUYfj7pp2JnzJxWrCGyqwD5qAJWYkgMf0hOCyAO/85IzEZcyDiU9jgtmViX
	 DSFJ+F+2XszCA==
Date: Mon, 14 Sep 2026 15:23:09 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
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
Message-ID: <aqhmhmgrnN3Mw8yG@jpoimboe>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-15-39817ec5db23@kernel.org>
 <aqhLhVMkNzf_4oJw@jpoimboe>
 <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com>
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

On Mon, Sep 14, 2026 at 01:06:37PM -0700, Linus Torvalds wrote:
> Talking about "getting rid of the hashing": the instruction hashing is
> obviously a big deal judging by the hash size expansion in that other
> patch.
> 
> Do we actually look up all instructions by hash in the first place?
> From a quick glance, it looks like almost every user of "find_insn()"
> is looking for just certain *kinds* of instructions: calls, branches,
> returns, endbr.  And branch targets.
> 
> Maybe stack updates? I didn't check.
> 
> Yet we seem to hash them all - even if they are just some random
> ALU-only instruction that is in the middle of a function and never a
> target of anything and has no impact on any code flow.
> 
> So the question becomes: do we actually need to hash those
> instructions at all? Are they ever actually looked up?
> 
> I don't know this codebase at all, so maybe that's just a really
> stupid question. Feel free to look at me condescendinly, shake your
> head and say "Poor Linus has lost the plot".
> 
> [ And yes, I see that whole "next_insn_same_sec()" thing, which
> obviously *does* look up all the instructions when you iterate over
> that function, but it strikes me that using a hash table for that is a
> bit strange when the natural way to do it would be with juyst a
> "struct instruction *next" field instead.. ]
> 
> So if hashing was such a big deal that it showed up clearly on
> profiles, maybe the answer isn't just a "make the hash table larger".
> If a "next" field were to not only make the hash table much smaller,
> but also mean that next_insn_same_{func,sec}() would become a "follow
> one pointer", mayeb hashing would become rather cheaper?
> 
> Stupid? Or maybe "not completely stupid, but too painful to change"?

The find_insn() in next_insn_same_sec() is a bit odd, that was itself
part of a performance optimization, but yes, a 'next' pointer could be
used instead.  Though, IIRC, that instruction struct is the biggest
overall user of memory, and it just barely fits inside a cache line
boundary, which we do take advantage of by putting them in adjacent
blocks.

But as you alluded to, find_insn() has a lot more users beyond just
next_insn_same_sec(), like finding jump targets, alternatives, annotated
instructions, and quite a bit more.  Determining in advance which subset
of instructions need to be hashed is likely somewhere between "too
painful to change" and "not feasible" IMO.

There might be more efficient ways to structure the considerable amount
of data, like replacing "struct instruction" with "struct basic_block"
or so, but it's hard to know whether that would be a net positive.

At least the current design is a somewhat tolerable balance of
CPU/memory usage and maintainability.  Peter and I already fixed most of
the major performance issues, so I'm not overly motivated to squeeze the
last remaining juice of performance, especially if it's going to hurt
maintainability (maintainer bandwidth is also a precious resource).

-- 
Josh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

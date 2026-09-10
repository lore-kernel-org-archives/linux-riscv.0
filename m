Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686BBC79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaFBsiJgC66I7sTIKNF77LgO7ZqVKzrTDZ/w3UNjXxE=; b=UKhceblFQPXROy
	SAb7Z1A+r3GtcKaDH5hwDYwBUOjFpNeIASSxjCcZZemoPds3ZarLa+8DMyisnkqnSTjLZWFx2DVBV
	+H8eqTsU+8MlPAsPuiNgMNvLG/hB9uQyOlzsWf5YuiHj5ATxCm8aBKZxlXvpn60zpOwjBQr8DJIIR
	Hpo5PeoCuRb5EP7qLXGMc33teLKA+WGZorSWw89zBB35LxDF/umXcoir3dzsFrygd+OcVs26qKL7C
	yEOpqYkSnJHxp7UAjfuoDkX6bLOnY+l6B66OHwg35UTDIWkI/i6nteg5sNrKc72sM5+9j5LO1pdG/
	e4Ys3qCVDGUll7aa7pAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4caO-0000000E9PY-0xPW;
	Thu, 10 Sep 2026 11:04:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4caM-0000000E9PE-1Eha;
	Thu, 10 Sep 2026 11:04:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B8579600CB;
	Thu, 10 Sep 2026 11:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69E01F000FF;
	Thu, 10 Sep 2026 11:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789038293;
	bh=usywb2M9MHTVZc0djo6iTxHgi+vEkptg9Xr+YU4YHmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jMOnMmGXuK3NecCI//t0B9t6h8lLIPnp2kYuAR9vWHEn/MuY+pjzkOBop0UbgSASM
	 xH0R9KjV0E+1AJzUtqZ5zNEKoZkveC5dg+b4HABq4E+r8MXFhNtjL2Z9n6cW6FWdDU
	 NHBB13DHLG0wMaNMc/VfTs/Hz9FAwySXxnd2nVaPJVpyw61rCQPqwBxzg97Nzl7hai
	 OP3E+ogHRTRW0ND/UJQriEVZteW2XfOPKrr5xa5ax3+qyKlTZgjsB1w7ygQLCSEBt9
	 67XaWRLr5yWAVBWdmcDzumbwtr1lxG8awzsqXPwKJk02w95xQfvh+4AjA0bE3zlNqj
	 rVpSi2NyZUUDg==
Date: Thu, 10 Sep 2026 12:04:39 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
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
Subject: Re: [PATCH 02/23] scripts/mksysmap: fix escape of '$' in the __pi_
 pattern
Message-ID: <aqKOnMJdM0XxQHpd@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-2-5dc1ac01672d@kernel.org>
 <178898323844.67740.17554063026930604280.b4-review@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178898323844.67740.17554063026930604280.b4-review@b4>
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

On Wed, Sep 09, 2026 at 09:47:18PM +0200, Nicolas Schier wrote:
> > Commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> > converted scripts/mksysmap from a shell script to a sed script.
> >
> > However an error was made - escaping of '$' required \\ escaping in shell
> > but only \ in a sed script.
> >
> > This was mostly corrected in commit 7a6c355b55c0 ("scripts/mksysmap: Fix
> > escape chars '$'"), but this fix missed arm64 PIE namespace local symbols
> > like __pi_$x and __pi_$d which appear in System.mapand /proc/kallsyms:
> >
> > $ grep __pi_\\$ /proc/kallsyms | sort -u
> > 0000000000000000 d __pi_$d
> > 0000000000000000 t __pi_$x
> >
> > Fix the escaping properly.
> >
> > Fixes: b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> >
> > No measurable change in build time.
> >
> > Assisted-by: LLM
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >
> > diff --git a/scripts/mksysmap b/scripts/mksysmap
> > index 56a8b8bbdb37..856b26ba2ac0 100755
> > --- a/scripts/mksysmap
> > +++ b/scripts/mksysmap
> > @@ -35,7 +35,7 @@
> >  / __efistub_/d
> >
> >  # arm64 local symbols in PIE namespace
> > -/ __pi_\\$/d
> > +/ __pi_\$/d
> >  / __pi_\.L/d
> >
> >  # arm64 local symbols in non-VHE KVM namespace
>
> (Move 'Fixes:' to trailer block)

Yeah similar screw up. I think it was when perf times were appended
per-patch but then then ended up on the fix patches + I yanked them bit
didn't correct the tags, ugh!

>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>

Thanks! :)

>
> --
> Nicolas
>

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

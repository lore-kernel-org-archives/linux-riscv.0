Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2CDC88E64
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7Aoag52kg9g5NEL+ZUhfEMIj9r4erkwnSWS6MJQ7LA=; b=Asuav0lkauy6+/
	eViR9v1x19MNOTg2C8iP/B/tWEaSSWdJlwIR/8FRJnZye7UN9Er8uSEd8bSbXDEIHCfxT5/eOet3o
	H7L2acWHanbVqc/4zO+3Y2Ip2xeDIvNX1M1BnAUJjRonnI/C7roLDf7OzDOS3kjNQ4n5QXws1hqzz
	QpzBlEQGcC/hII+vqJ8AaTDcqn/qDIAtdeqAmvmuJICmqhUnHIbDwPFPEVezqL//wZWY7kybLTcMb
	D5+ieS9d6m2gs5m5oylJmbUV/s5++RgGK72xVHO+jbygb1kM2YZs7p1NksMD1MdVeBO3zkGjnsFLV
	KxAaRkLV/4WJ8ngA82JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Vg-00000002qRl-0BWW;
	Mon, 14 Sep 2026 08:57:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Ve-00000002qRP-1B9E;
	Mon, 14 Sep 2026 08:57:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CD444343D;
	Mon, 14 Sep 2026 08:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787DC1F000FF;
	Mon, 14 Sep 2026 08:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789376273;
	bh=U1K11A9+RHasMnoG3wmtnu891cbuAryY4EeC4FZJwns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=advzK3GeU+AhH/w8zqSqeooS4JmzOok/9Ne52l7+V6aQ4xdJG/jTmyMoxQuE3m95V
	 laE2LueDRdWJiQ6g6RwMHTi/WqxyJSM1Ifapd0SIx6U62DcUQTTKw+RFEz+Iy9UB6r
	 0Gh1LH17vZszJk9MrhF5NL/W54R4sZvqTQAfTWqifeIKyRfSoxaJr16KHPm54Q8QqJ
	 Cm/VHV524fjvDtfToVtDeFI6BZoYgmdR7hrbHtzZcvVfZTBMUIHVPIwR5mxCsABlLk
	 DX0HrLqfi9TqsSv8JBv8bH17v2suBWU80P9duFOYDfteVYainLvUDfcSMTixwlA5hb
	 xeb+9i3bkQC/A==
Date: Mon, 14 Sep 2026 09:57:43 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
Message-ID: <aqe2XF_TOUk2nRFg@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-4-5dc1ac01672d@kernel.org>
 <CAHk-=wgryL8XqjFcO=EQwKdqNn51BANiv16QiqYKCUdXxDQBmg@mail.gmail.com>
 <aqewl-H-IzjIt8uD@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqewl-H-IzjIt8uD@gremlin>
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

On Mon, Sep 14, 2026 at 09:39:26AM +0100, Lorenzo Stoakes (ARM) wrote:
> ...BUT, can definitely put
> those remaining .long entries in the binary too so the assembly is
> absolutely minimal.
>
> LLM says there's 200k of those, so does seem worthwhile, I'll do that for
> v2!

OK, correction, it turns out this isn't possible :) LLM found commit
a081b5789255 ("kallsyms: Get rid of kallsyms relative base") which makes every
offset a relocation against _text, which means these have to be kept in the
assembly separately.

It takes .18s to parse those ~200k lines so it's not really a big deal :)

In any case it's not a huge time sink on build so it's no big deal to keep this
as it is.

>
> >
> >                Linus
>
> --
> Cheers, Lorenzo

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

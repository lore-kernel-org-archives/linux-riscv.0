Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C9CC88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=030Bi7XOTaS/T1hyZvoUnNcjx6DbN6Jjeykzu3s4VdY=; b=w7XqXo+f5F0Wsw
	eCH97BH8+IMLbNVlRatLOwNPOKpN7OH7TXshTBXj/jbGKzC7UsJgLInPHvYBXmYsT8H3m3kkID5kL
	Ma76Gm4sG2M236/CBwhsByLDyAp4L37bYe0asJvP3ld/6jNaVmPtQDrBIyyqN3ABZr02Ty4mXWCel
	4eHRTPjiRTGKOLn6xsUkuA+NoNIFUTtChOeOQuQPfUOt6lHda23l2CZH6Hh5uDMyPQ+VhsO7/WABy
	ZUefeE5RfgBsh6WPvYEKqh3P1KkZIahHLr9oAe0SBPF13u2ezW2IiDh0mRnEWMgo30Eru58J05mnb
	hq7W7mSTSpzGxZbGIrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Quo-000000062Fp-2GtA;
	Tue, 15 Sep 2026 11:01:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qum-000000062Ex-0RXI;
	Tue, 15 Sep 2026 11:01:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BE8B602BA;
	Tue, 15 Sep 2026 11:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BAE1F000FF;
	Tue, 15 Sep 2026 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789470086;
	bh=ZvqUeKCU1dKmmVba4tQNzefSMi1mI5HcwktsDzzTxQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mc3PV4Wgo5o9iOphUm7YhSoqarFhqhHoKUhlZ8EfxphzdYUX454A2pjapcNhWbLfC
	 jI9ZlWkHTbW6unDY4x3Htp1aLjzANzXAkEyQv2+a83T/zVKQijKbl0NaPmgOm3p9Cz
	 e6bz1QL8Rvp4PFJskRZamOsOiAQPtXHL791oxWBdRbgfJ/iE/Z0bnImCLgQpsuBaZ1
	 k/3jYP8SPUJsDpVcMEnPIfcXUChX78R722NbXsQ1Eg6lKV2JvRQ2PwIz64gPui/icT
	 w3j3bzzU0Cl8Qk3uebX+ZkTO0gD/HTEksDpW5VlS/jRzbwd+l/RwqJaNwxeZprh+f/
	 gE488uPZpb30Q==
Date: Tue, 15 Sep 2026 12:01:12 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: John Stoffel <john@stoffel.org>
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
Subject: Re: [PATCH v2 11/21] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <aqklJxyNPal2ou-e@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-11-39817ec5db23@kernel.org>
 <27304.3198.867048.379684@quad.stoffel.home>
 <aqgRXk6DXyAah488@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqgRXk6DXyAah488@gremlin>
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

> On Mon, Sep 14, 2026 at 11:02:22AM -0400, John Stoffel wrote:
> > > This change avoids a sublte issue with ppc32 (big endian) - clang doesn't
> >                        ^^^^^^
> >
> > subtle
>
> Oops!
>
> I love that I ran this through AI review several times and it missed
> something as simple as this :)

(Fixed for v3 along with a few other typos :)

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

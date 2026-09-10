Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEED6C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dIsRggSE1c3+rFOK0V2uC4ClVAd/euG0iPLEAdRY9d8=; b=2gYtDgJ6MOuxtS
	FO325ZR8cEnoJ19lqMEYcC7Hqii8q4KBoaa4j/O3Jlm1zqGMhrqVXGZ1buezey/bQl7x21NXiWEuc
	ipHUtqLF1jdYLuB7hxey0p3r3hq9sgksENG7E/3gl9fPyZwzywEVgBTnnk2DvkYv0l/ieQW/tjCMY
	+IE7H4AH5atIlcOfE6xzPMwE0fZUGDQVuA9wxoOx2+bgOMCpb3V17q7S7H/BON+G14EMZvimGAyrA
	crGVUtrbGN6/9kQwEjNNhZYoRL9iiCISvoMvQt0UD22jySM6Sxt1b0nAGsqKwVc2+6U+iqO2GCxXi
	ULtscg5pWKORhzO97zAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cZK-0000000E951-43Co;
	Thu, 10 Sep 2026 11:03:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cZA-0000000E8yq-1dG1;
	Thu, 10 Sep 2026 11:03:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1527F40A98;
	Thu, 10 Sep 2026 11:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CBB1F000FF;
	Thu, 10 Sep 2026 11:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789038220;
	bh=zkF+okllJHqKXvQdM/EqvzsMOtDxyc5TsolTsb/xGl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cuxcQ5jw3m5rzCB46cgEUCPdWQH2FZQJvP80czAO5zYsV5hzlkMBwq353jvE2+SlC
	 EsOH7NRCi1jSQHG6KMUX9oKr38OlGyWcmfsrMYJdAMof2w+IP2n77ZzKB/cQdOS0KB
	 DS551N6VCg1Gix5tUP72Eds63nkBcKhfHqCXzqGsy0xp2QnF9vMCnGWQWtmO6qy+hf
	 /lJ2rvjRJpWW4OJ9D/XkL/CSnsj/ERj2S/Dv6ruCjs73ckc+cRSd9WPcpsHnocp49K
	 z1e05dQ+uMCNuRgf8Y0N2ZWNxMdpYiM1JsjE8gxntujzUZ+EHS1CIM+MFUPb0K9szo
	 rJGQeSQbm3XLQ==
Date: Thu, 10 Sep 2026 12:03:25 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
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
Subject: Re: [PATCH 01/23] scripts/mksysmap: drop the MODULE_INFO() symbols
 from kallsyms
Message-ID: <aqKN-SwzZRY93p6V@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-1-5dc1ac01672d@kernel.org>
 <178901395288.3971858.7586978173036863863.b4-review@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178901395288.3971858.7586978173036863863.b4-review@b4>
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

On Wed, Sep 09, 2026 at 09:19:12PM -0700, Nathan Chancellor wrote:
> > Commit 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
> > keeps .modinfo symbols out of System.map and kallsyms, which assumes unique
> > IDs have a format like '__UNIQUE_ID_modinfo123'.
> >
> > However, commit afb026b6d35c ("compiler: Tweak __UNIQUE_ID() naming"), sent
> > in the same cycle, changes this to '__UNIQUE_ID_modinfo_123'.
> >
> > As a result this regexp has never matched and every kernel since v6.18 has
> > carried one kallsyms entries for every MODULE_INFO() declaration in the
> > kernel whether the modules are compiled or not.
> >
> > That's 5,810 entries for an x86 defconfig build and 15,200 for arm64.
> >
> > On x86 defconfig that is 113 KiB of kallsyms tables and 32 KiB of bzImage,
> > and every lookup walks past them.
>
> Bummer :/

Yeah super easy to miss though I think!

>
> > Fix the pattern.
> >
> > Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
> >
> > No measurable change in build time, the smaller tables are not on any path
> > the build waits for.
>
> I don't think this needs to be in the commit message, it could be below
> the fold, since it appears to be a valid fix on its own. Agree with
> Nicolas on adjusting the Fixes tag.

Ack yeah I screwed this bit up sorry!

>
> Is this worth Cc'ing stable for?

Yeah I wasn't sure, it's not like it breaks anything but you see stuff in
kallsyms that you shouldn't.

So I'd say probably on balance yes we should actually?

>
> > Assisted-by: LLM
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

>
> --
> Cheers,
> Nathan
>

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

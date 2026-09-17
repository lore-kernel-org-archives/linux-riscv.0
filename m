Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887CAC88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7kY/JlOwZmQdzKoX7Hq4ciYM5mTUqtet8wPjsEotTQ=; b=3Mv5Wp6CWdeSUT
	xp5CncYf+Z0sNEMdPCZcuJdLNyQd6BIeTenuRfs9R+iEr110Iol0ctsT46kfyD3TrMy8x2z/dxTVY
	zAUEo8FynkCAjumb8DG/DYgJV21gEWOal8i447/yV0A+8V0k3+JdhPzcaM6EJfZRxPTyslmJ+sSeF
	QTOuN9JRvjH0hNxzkW5keZswysMRVXh5SlUI3K0056Rddvm5SW+rSWEunANWbyL3rarxSihVwNTtL
	AVv2CI3y3hLNlzrtRwyBuxe8rp+34L390cU+vkvxORZbB7mk13UEoqRMTvU4h+51RzQpCk2qH8I6I
	zazeCuTGeaiEcC0YiatA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G59-0000000C6mi-3QWg;
	Thu, 17 Sep 2026 17:39:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G57-0000000C6mO-49EI;
	Thu, 17 Sep 2026 17:39:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73A2E4148C;
	Thu, 17 Sep 2026 17:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB21B1F000FF;
	Thu, 17 Sep 2026 17:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789666773;
	bh=QiqLoLaMeHAvq9CreoMXDkPkVCQITFh+w2NQFDlDCNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UFFYB82JqIT2jZngugSLMZP4JXo5QIHBIIOCxt7FU+Nro2gIZV8nvb+n9AuluVPHg
	 hItERr0YpNLVZh//ikX/iGTSxIB4+6I+cLKGCb+9yO1Gn1gYvakRTHTK8UCFe9C6la
	 gQyYet+0VIcuaUGGlMo2UJuq3zYKloV7cy2iEzNGbDMkxA3YeIbiSRaeOHtPt2tTU+
	 nyHWcz0Roaay3mBigf5qypMT8EjFczv69Hu+7Yljzvhc4sIejovuvH+rjjJnIDTF9M
	 1CJwkbVf09DxQnfs7/xzR551PFlbxA+cMpBIzHpu19R2W1QO882vpP9tajV3swKbTu
	 ng6TxIpeHV7ag==
Date: Thu, 17 Sep 2026 18:39:18 +0100
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
Subject: Re: [PATCH v3 01/20] kbuild: do not allocate .modinfo in vmlinux
Message-ID: <aqwlKFJ27LSsFsb-@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-1-9ecf4163ff36@kernel.org>
 <202609171002.8C0C739@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202609171002.8C0C739@keescook>
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

On Thu, Sep 17, 2026 at 10:05:34AM -0700, Kees Cook wrote:
> On Thu, Sep 17, 2026 at 05:06:11PM +0100, Lorenzo Stoakes (ARM) wrote:
> > +      cmd_modules_builtin_modinfo = $(OBJCOPY) -O binary -j .modinfo --dump-section .modinfo=$@ $< $@.tmp; \
> > +                                    rm -f $@.tmp; \
> > +                                    sed -i 's/\x00\+$$/\x00/g' $@
>
> Oh, I just noticed this. I don't think the .tmp is needed. You can just
> use /dev/null for the outfile here: no need to write anything unused to
> disk; seems to work for binutils and llvm's objcopy.

Ack will fix up thanks!

>
> --
> Kees Cook

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

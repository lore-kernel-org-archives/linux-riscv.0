Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3BBC88E7F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/FGGnAn7w7sq7e0RC1Dt/qRgc0jXiXNmiCmNbf2LEU=; b=N5TR5aAUmZgLkA
	pXaToIvzrAimiyYSARkLwlBSuaerd9YQ+/bHSeiGhp/s/+8CtMc0oTHAvABmsZ1IIvx1UBKaLYimi
	HGOHuAdbyYMrvwWMf9LmBNsAkegqTJTnv4jzOb5rugP0C7z2KP++naKK6FPCYaEnGRlNS7QZ3bhl9
	R7hBzLLmdy+82opjit3tNGjBX2CdAt8AVOsGCRazpblz6fd9U8Ri19WhBFSZo9THZ0qlrApYC6BRM
	VtHK31UJGaJ49g6FjPQHKz7wmFloSwlu7Rejs1Lp4NtzgKkhTLxM/zw7jwXu6K2ducImXMBvADDov
	L6aFn7qZltHdEVVzcJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WO5-00000007Umk-1Qwf;
	Tue, 15 Sep 2026 16:52:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WO3-00000007UmC-0zR8;
	Tue, 15 Sep 2026 16:52:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 72F3C602BE;
	Tue, 15 Sep 2026 16:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E231F000FF;
	Tue, 15 Sep 2026 16:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491122;
	bh=AAegg1HqQc2zlyPsCFndE7BU31mvGmt6H10k5+2dIJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I2gPH+LFzLYZALBDt0ClbZdP2ilKcDCHRUfiBdPm3idQOsDqpB7q84aLX1rNrpsIi
	 wqf4NIRZrAMGKEqi89jARH+zbeojQb+KDUw89DWC124dgGma0vkuOyh7VKF0jaex++
	 b57xMMAACGyAnBWTbpAotn+pMoUc4jo98m/cRL6VnMgiAuTr01RxuVn3RxfhUqUF2V
	 HDTTUD4Q37fkbMXjP61re8NqNAxmKlEzdXEOYIYEP0ixfcH/BkcKa66oKfC9x6HBgf
	 1HGcQYQ/iY9/7C56XCgwfGL8/S8XFNbJezbtToRJkfqoCvtrHQsII7a2j185CneqPi
	 WT5WUhI+hl6tw==
Date: Tue, 15 Sep 2026 09:52:01 -0700
From: Kees Cook <kees@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 20/21] kbuild: build rust crates in parallel with the
 rest of the build
Message-ID: <202609150951.73C4F16EFB@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-20-39817ec5db23@kernel.org>
 <202609141133.7CA979C89@keescook>
 <aqkv9SqIdh0qKPFc@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqkv9SqIdh0qKPFc@gremlin>
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

On Tue, Sep 15, 2026 at 12:58:10PM +0100, Lorenzo Stoakes (ARM) wrote:
> Since this _still_ gives you a significant speed up on bigger boxes, I think
> it's fine as-is.
> 
> The LLM says a fix for this would need significant work - a cross-instance lock
> and an on-demand rust/ build. So I think best as a follow-up?

Sure! And I defer to the Rust folks on all of this. I just wanted to
note the possibly unintended behavioral change there. Thanks for
examining it!

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

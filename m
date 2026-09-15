Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988ECC88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 11:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KScVSYH9XMX1Wb9Ev+RFpqmyGObTb5SYuki3/ZuGiYE=; b=Lk961dKDwQ6ADf
	nZ5YmL4t1bCDEuItyXXzBPNjjRftM/mgOtIaom9mzncRj9WRsQUdWMwptnsauvWNaTIvN8BWA3SQz
	bOE8EQaanDlIsefCfH72lXq2swUCHGt7/1tMf5Tb7w8XxEf77osR9IgM9gC/Kp9cVtIvw5r+kuWNE
	2AK7ZYYSGhapyId0ro6EF1T7XM0/+SODZj0pqKy0DUGdXxpaK7NybSYCP71+K131BZ0w6e4705V1M
	GynMdjHbJmggIHVt9zXon4fdjUE/mbKy9nNIFfUfw+ZgUU5Zj7BtYDsZU9/NRxOeRawjs/38CC/hE
	N1UzXjPiaQvSm0LusXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6R2Q-000000063SD-1UE2;
	Tue, 15 Sep 2026 11:09:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6R2N-000000063Ri-2kpe;
	Tue, 15 Sep 2026 11:09:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D5E06025F;
	Tue, 15 Sep 2026 11:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BDF1F000FF;
	Tue, 15 Sep 2026 11:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789470558;
	bh=Ht+VueHHQDuGb9oo32upfSf1ZdnvEKZ3Bdh5MAm5suk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AKcX7vyo+Nhqh7POFqhvuc9JWBX784D5R/DAbqihHERmisp/ytEs71fMztlOW2a6Q
	 rTX7dxF3H8IE91qdd9WaLYViK/e2+q8CJ/0xQ8h0P5FjdNAFURUFMxZQS6JQRwWaqw
	 59gc6EPseMu1StBwQHlyITJwOnsUk4T0cZkYKTjIZ/qU/ETG4ZkKI/evbXJCH/uAQB
	 CK/6i5BRN3flYByF+/nmrpWB5Tij6+nGj805Xis7a5lL0mwpjKKYdCHfsC3niQxHB8
	 aZoLue0h4eTWvkACvH6N6u1HpJmAvm3IIs6g99qn11U4nvX9bqqGnPF4ZnVUJcItSU
	 ox6T8P9hfDOSw==
Date: Tue, 15 Sep 2026 12:09:04 +0100
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
Subject: Re: [PATCH v2 18/21] kbuild: rust: optionally parallelise rustc
 front end
Message-ID: <aqknMMdLXG-gW1jd@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-18-39817ec5db23@kernel.org>
 <202609141124.F24B6F77@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202609141124.F24B6F77@keescook>
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

On Mon, Sep 14, 2026 at 11:32:14AM -0700, Kees Cook wrote:
> On Mon, Sep 14, 2026 at 10:22:17AM +0100, Lorenzo Stoakes (ARM) wrote:
> > The threads are taken from make's jobserver, so a parallel build is not
> > oversubscribed. It was found that benefits level off at 8 threads (16 was
> > found to be around the same, and 32 slower).
>
> I think it's worth noting that this comes from rustc itself (it has
> built-in support for the make jobserver). See commit ecab4115c44c
> ("kbuild: mark `rustc` (and others) invocations as recursive").
>
> What happens when there is no jobserver, e.g. "make" without -j, or
> "make -j1"?
>
> > [...]
> > rustc has a parallel front end, enabled with -Zthreads, available since
> > rust 1.84 [0] and therefore on every rustc the kernel supports.
> >
> > It is not yet stable and its output is not reproducible, so it cannot be
> > [...]
> > +The number of threads rustc's parallel front end may use, passed to it as
> > +``-Zthreads``. Unset by default, as the parallel front end is not yet
> > +stable and its output is not reproducible. The gain levels off at 8
> > +threads.
>
> Okay, unstable, not reproducible.
>
> > Generated output was confirmed byte-for-byte identical.
>
> But this says otherwise? I am confused. Reproducible or not?

Well, we can set all of this aside as, based on Miguel's feedback, I think
dropping this commit is best :)

>
> --
> Kees Cook

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

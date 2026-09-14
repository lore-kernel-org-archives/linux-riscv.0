Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EDEC88E72
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 18:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sitG1gGPj9vvvbVD4S6T2Nny0qI+AsKSU4PXi7sT0IM=; b=CHr0zxh92cicHV
	6+GHyCb+4XgmZmyZcvSCIJMQkbXPGl3+SKUpWkyx6huvt5MCuIkI+QEJVHGqTjaO0FvznuCuqWcr1
	ZYKytZOf4alDrg7qH7PUyLm9BL3d8TXS8H3gfzXS9yCesuIKIo96jbrPA8zHGvO6YaNyYw095wkev
	6VH+E3KoLiSDpJTFOnU1l3veIPM1Yv+qqoNc4wF4pJRvYfAYeLZUJ/1BkX0ydR+lZ5nENGnUBH2in
	u/PjcPZ27Xv3iCMtggQpNpkFE1PxLlVPJptwpMbjKrC5gIkhlDg0KFqoLz4+mJSLRJKwIwkU+Wwqg
	2xIW7YYb2EYV7pgGRbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BTW-00000004S3E-1E61;
	Mon, 14 Sep 2026 18:32:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6BTU-00000004S2y-0j8z;
	Mon, 14 Sep 2026 18:32:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B1686022A;
	Mon, 14 Sep 2026 18:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DB41F00893;
	Mon, 14 Sep 2026 18:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789410734;
	bh=qh1ZerciXS6mhhgUbgOWtjBtb3wIfa62KF3pRdi9HRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LT1cFNgkvbD3eoVT/UaBEH3+r1ZmImzoNjg1sB0fKgYfiWphX+2k3leDEJjTKPvkI
	 UCeZKsCtpOsU1Qh6ZRgd9PGKscvkwgEZ/CXkgLZsggzcTd3LcxREE5AMbc7rSZ176a
	 7gNUxLvYBfZ5rTEMblheppVavtWDrYGJ9aihGEv2SwKX80uE2nVnkBoFYyryneR1eY
	 l99LJZaV59sYUO8uU85RDxazHEX6uhwHzX4FGdH4s0ESmZYKyjLD5malFkq7HqRZYp
	 MO93SpFQpfLWTJCfXhlr1iU+iBNmOcV7d+vp6+IkNPD3Hj/IjfJ9MaHA5ebXh1WWUJ
	 +Cz7fAfk/ogdA==
Date: Mon, 14 Sep 2026 11:32:14 -0700
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
Subject: Re: [PATCH v2 18/21] kbuild: rust: optionally parallelise rustc
 front end
Message-ID: <202609141124.F24B6F77@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-18-39817ec5db23@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914-build-speedup-v2-18-39817ec5db23@kernel.org>
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

On Mon, Sep 14, 2026 at 10:22:17AM +0100, Lorenzo Stoakes (ARM) wrote:
> The threads are taken from make's jobserver, so a parallel build is not
> oversubscribed. It was found that benefits level off at 8 threads (16 was
> found to be around the same, and 32 slower).

I think it's worth noting that this comes from rustc itself (it has
built-in support for the make jobserver). See commit ecab4115c44c
("kbuild: mark `rustc` (and others) invocations as recursive").

What happens when there is no jobserver, e.g. "make" without -j, or
"make -j1"?

> [...]
> rustc has a parallel front end, enabled with -Zthreads, available since
> rust 1.84 [0] and therefore on every rustc the kernel supports.
> 
> It is not yet stable and its output is not reproducible, so it cannot be
> [...]
> +The number of threads rustc's parallel front end may use, passed to it as
> +``-Zthreads``. Unset by default, as the parallel front end is not yet
> +stable and its output is not reproducible. The gain levels off at 8
> +threads.

Okay, unstable, not reproducible.

> Generated output was confirmed byte-for-byte identical.

But this says otherwise? I am confused. Reproducible or not?

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

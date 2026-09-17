Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47956C982D2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4BbBmlOa5kxpY6t6ucuudpafAa/I4UBJvi1ZZrRLQE=; b=22lWI4w8z3Pf+n
	uko1Qdl3dlylp2DMpIsBLNdaSmtLjiWpLrK4N5JjNjmZ+M9030xbutdVa0M6nCqZaKmT9xAugTh6S
	sIVIFNYYKZuAKX6Mote6gVX2s4G1kjJA0BubVJDKiVXdKYHWh3aYDfDTUQJaFpdM6beBxVd1j1U1Z
	f2a/uyrikBL+42sv6cxfO8xbIgrI+RvUYGQCTBV6MdyFaGXIWZbByvPLF7gqBXHSpXKKxAQfJurkd
	K9+tXUnF2RvL2o+tfda0ns+oDZCsjIhtwtnVFarBd+cSoSvjDCTLFIfdDI4xw+mzqecc2qHwH9Pq1
	qG/4wlGfswFC/v/mcciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G3w-0000000C6X4-2Ukf;
	Thu, 17 Sep 2026 17:38:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G3u-0000000C6WN-3iey;
	Thu, 17 Sep 2026 17:38:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 527E2601FF;
	Thu, 17 Sep 2026 17:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27881F00893;
	Thu, 17 Sep 2026 17:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789666698;
	bh=82QCZLgXlq3HllOhKT6Yb32CPb39AXzdv4Gsai45+qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XgLFJVXqk8vF1LPiVrJpWUF8Q92lD5fXYMKKuIpVn+ggLnA9Lf2zOZ71ydWLEGoex
	 smxQka5WZDFeG8/bNwItz2gvXCrURqWsk5f76lRF19Ud0EETjGcJYLgBWg/LEKcv0t
	 HHItlqD56kd+oAb18jweq8RqXi6A1Yw/Vo5wH+CevBBCj8Mp3H27emgA3LJXxegCfv
	 LbVnHMQqXuiXvLX/SppuXO5DRggt/BvIV8fT2niy80ULZndR9nDgyowx2AzmaUeCn4
	 Z/u8lbw6SDwSuxGWm+PUMUjDNKB2z5FHkEj0kqIT0bdSu6qKiarZMYQEQjj8ojFh9X
	 rAjj3hYLF9SDw==
Date: Thu, 17 Sep 2026 10:38:17 -0700
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
Subject: Re: [PATCH v3 04/20] kbuild: do not sort nm output where the order
 is irrelevant
Message-ID: <202609171037.7D690D3CE6@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-4-9ecf4163ff36@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-build-speedup-v3-4-9ecf4163ff36@kernel.org>
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

On Thu, Sep 17, 2026 at 05:06:14PM +0100, Lorenzo Stoakes (ARM) wrote:
> There are places where this is unnecessary - an invocation from
> scripts/sorttable every vmlinux link, scripts/check-function-names.sh run
> after every vmlinux.o link, and the x86 VOFFSET and ZOFFSET listings
> between vmlinux and bzImage.
> [...]
>                                           before    after     delta
>                                         ---------------------------------
>   x86 defconfig, touch mm/vma.c, gcc        9.7s     9.5s    -0.18s (-2%)
>   x86 defconfig, touch mm/vma.c, clang      9.3s     9.0s    -0.27s (-3%)
>   x86 defconfig, clean, gcc                30.3s    30.1s    -0.16s (-1%)
>   x86 defconfig, clean, clang              31.7s    31.2s    -0.55s (-2%)
>   x86 allmodconfig, touch mm/vma.c, clang  36.4s    35.8s    -0.67s (-2%)
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Not a huge boost, but it's a trivial change with a deterministic improvement.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

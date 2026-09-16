Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F74C88E77
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 01:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+JgsSOvJ4YtuDRImtwPXYRphf4sq/Prc3m4pwEvrdo=; b=lxecdCTVyl7JXS
	HcXFsrblc3NWOAxMYTo2bXOhzg4EQKFV2qKt616CFuVj6aAByZ995zyVA71XrljucPvRrg1467ALq
	fgGPDt0BixMGK84lA+FeHaeXTc3HBEIo0UgALOtZu1mJFd+vUO15BGJWowgU887hY/HU3ZZ4hXkmu
	WaMDnpuk5D9iXv24JPEfVn6dcZ+My1slndjmeM/b2UuRft1buVhPGlA+9cwLsfrUnOrC3FaLPPpZV
	v0gwMCU0hTThSC71xVRn7D9bBzkOwrJie/EfVkZg7zjfU+6G52HXfsTP47yv091yw2eXbnSZukQts
	I8fPdjN5xb4EbaYnvmGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6e6C-000000088rB-33Wv;
	Wed, 16 Sep 2026 01:06:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6e6B-000000088qx-1VGx;
	Wed, 16 Sep 2026 01:06:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B59260142;
	Wed, 16 Sep 2026 01:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75431F00898;
	Wed, 16 Sep 2026 01:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789520765;
	bh=XvgNiNkqBk6+kkXqTrzqW7sJYsvtakfLRPDEyhDg7Hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AH7a/Zx22fCnj33kUljdAwOHOUB6dl3lKvMgl39S8dfLFFpjmDAaW7aDoy2lCXff3
	 Zo5MdcsT9MVBmf7RLpdu82PWxH+JojNmdB3QU8us1QpIAD7fzrNCMEQUBFDPoCmVVH
	 v64SNvGRvvxsBLc8xfHi2oNua4PEqxDdKLcX3VVlpXjL4N84lDvzPXSLk1zwfUBqDC
	 nmtEMH2BW2uTaL8N30L/XGO7Tufc7TIYAa1z299zYRAmx4fX0IqrXdw2LMtGQGZgiC
	 EmB9ZWdwrChtSsjs57wQqaPMI5KKrLLVc4HWuYUtR+CTCpfaRt9iJx0l0wdcqoCnv+
	 qCNr4m7E8ofTQ==
Date: Tue, 15 Sep 2026 18:06:05 -0700
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
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if
 available
Message-ID: <202609151758.BA5732348@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
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

On Mon, Sep 14, 2026 at 10:22:20AM +0100, Lorenzo Stoakes (ARM) wrote:
> diff --git a/Makefile b/Makefile
> index 790ef23c5e8a..38c0cdc9f591 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -561,7 +561,7 @@ PERL		= perl
>  PYTHON3		= python3
>  CHECK		= sparse
>  BASH		= bash
> -KGZIP		= gzip
> +KGZIP		:= $(if $(shell command -v pigz 2>/dev/null),pigz,gzip)
>  KBZIP2		= bzip2
>  KLZOP		= lzop
>  LZMA		= lzma

I had another idea that I think solves both my concerns (limits
to parallelism, new surprise users) and your concerns (complexity,
single-threaded when needed)... how about:

Makefile:

KPGZIP	:= $(if $(shell command -v pigz 2>/dev/null),$(PYTHON3) $(abs_srctree)/scripts/jobserver-exec $(abs_srctree)/scripts/parallel-gzip,gzip)

and the same scripts/parallel-gzip:

	#!/bin/sh
	exec pigz -p ${PARALLELISM:-1} "$@"

And then replace the /boot/ KGZIP uses with KPGZIP. Then we don't need
to change modules, config_data, new users, nor cmd_gzip, etc, which all
continue to use the regular KGZIP and the "use python" part for the
KPGZIP case becomes is a 1-time cost?

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

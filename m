Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11364C88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 16:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/sRZ660KjKMSQ0cPdOMh4LsQSceCRHQCsVXb/pmUdE=; b=laArf9vhjBSRL6
	mO6Ov/La9t6HFDs0+lBDbQSWt9ZWA1cGvU1Nn+d48ZZz9rjC5luayszZt8d3GqD+QRHzhx4Z2UjKt
	pz/Y52FjBSOsvTZGThWV9DlucbnE4VQqGQrYHnTS4Dsylfa4j21WovbXsp/0sMgDagI/+8qMqhzQw
	dKpUIakaXS+X0fbcYtq9Q9pvuwPMbehHw5z2GCDWJ6j4cyAE5YstQFAZSpWLa3/GVNiuSttZrFILF
	dBZM5k3X52nNLfT28keVXqQE09xCjUmv8piEg2qburuf0ovlJ6ysE5ezoO0JZPk7lR37ekiIuPYxw
	Hgv1rV/EEI0Ai+mCEd8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FR1-0000000C1AB-2jSQ;
	Thu, 17 Sep 2026 16:58:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FQz-0000000C19c-2QlT;
	Thu, 17 Sep 2026 16:58:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2909140D96;
	Thu, 17 Sep 2026 16:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FBE1F00893;
	Thu, 17 Sep 2026 16:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789664285;
	bh=G6M1hxOvYoy7f6OFIyTNAjYyoJ8doAT9R3t/RnO+5wE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FijdV8dzZR2foaEFvspQUWKw1vTW1Az7WPXaE1AnyErCZpDibf9TS+0SVBRczfVXq
	 51yGbrxoI2hkrwpUKheNe44X5at4kUaTkptcr34f9l29GQUmKr49sxZmE7zWmdFj70
	 ToWvPKEy6RdQZV38xRki41NcNNA311huD54DX91tIdQzds9LtsNYVkVPU7JAIpchh1
	 Xrmfo/xCNNmjhgEgtJM6k6/Aswi959TzbgjltpBsIQweHbEBmQpWA8M3jMptitEsEc
	 XNV5BKRrbk6whmGYeGr5yQ9CznqcLlvEj6OFEM+Ge0XByu2XWAR4v26+LVunA5ljIs
	 CrIqaoayngHTQ==
Date: Thu, 17 Sep 2026 09:58:04 -0700
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
Subject: Re: [PATCH v3 20/20] kbuild: compress the kernel with pigz if
 available
Message-ID: <202609170955.C6EABD8C@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-20-9ecf4163ff36@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-build-speedup-v3-20-9ecf4163ff36@kernel.org>
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

On Thu, Sep 17, 2026 at 05:06:30PM +0100, Lorenzo Stoakes (ARM) wrote:
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  Documentation/kbuild/kbuild.rst   | 17 +++++++++++++++++
>  Documentation/process/changes.rst |  8 ++++++++
>  Makefile                          |  5 ++++-
>  kernel/Makefile                   |  6 +++++-
>  scripts/Makefile.lib              |  4 ++--
>  scripts/jobserver-exec            |  3 ++-
>  tools/lib/python/jobserver.py     | 13 +++++++++++++
>  7 files changed, 51 insertions(+), 5 deletions(-)

Awesome; I love it. (I may send a follow-up to improve the PARALLELISM
token so things can define the fallback instead of the hard-coded "1",
but there is only one place I found where that might be useful, and it
will be totally separate from this.)

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

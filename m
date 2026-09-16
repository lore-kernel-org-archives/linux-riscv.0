Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2215C982C4
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 15:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyZwjc4Nznbk1Z7jSs1NQKYQukrtUCr95qInH8kRx3A=; b=oII5kqY7pLlztt
	hl8zR0ESPV9/g9/izqK3r2aKqG9DOsrXWTUi5+gH9GsuOBw+8+wfxW2XoF1Aypxm6d0cAnneR0hd1
	joFyHzVYVGCtsSxwiQl1P1lW9dxbVthDg9mAAmPe4110D1TyBAeIhPjFsoAEJjjZHt1KeHnOG6Twb
	AQLV3YnGVGuN3vo1AAXxXZM8oObqi0261K+zm1q+nPnk2qvclcqHt7dR6wzc/WDkzuGBwukuZ5wTp
	K4532LPPQpSHi0ckAgIDBiix17Y6uiFqMiomjIfOlHlMxa0cO7TtuGEOCpWE3s1oJ9+nDTLNnH8Rq
	61IyxyzZFgPiSLz3BouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rXU-00000009ZtZ-1ufz;
	Wed, 16 Sep 2026 15:27:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rXS-00000009ZtK-2lxb;
	Wed, 16 Sep 2026 15:27:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56067417A3;
	Wed, 16 Sep 2026 15:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E251F000FF;
	Wed, 16 Sep 2026 15:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789572430;
	bh=UkRbXLbpw+AP2jr8iP96phPK0XDdfYv/MOHvNo1E1vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K4zyDQK3PDEMTdWFvmeoWoqSY4bftx/jIM47m+e5m/CxuUgT2ZlxOgrpbi8scn6zA
	 QVKN7ZD9SORGKm3IBe/NE6t27UzhPfsBm/WZe+N7lz8+tNzpq09wAFnfd0tXjv81xh
	 8rvuaPTitkf5DvhUxl5/uIMlCntdrSUBTbc0Nl9wCiBCLt0ysG9RDdTG7UNBtFuv+N
	 vx4N/BEQJLgSIglrxXmmd/2SbmxnmWg7UK0VPlxcFsCJ8072505DSOwvaGsjM7tV+d
	 dNbIGqX8V6mt4oDoL+ZGWrk110WemqKgp5jhPvmlaWG38bbsOuVV/b72clK+giRlzw
	 R8h3G0UoIzEGg==
Date: Wed, 16 Sep 2026 08:27:09 -0700
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 21/21] kbuild: use pigz for gzip compression if
 available
Message-ID: <202609160809.78E97DC34F@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609151758.BA5732348@keescook>
 <081b2b60-e295-4cd7-b201-d996a88c5f28@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <081b2b60-e295-4cd7-b201-d996a88c5f28@app.fastmail.com>
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

On Wed, Sep 16, 2026 at 08:38:33AM +0200, Arnd Bergmann wrote:
> On Wed, Sep 16, 2026, at 03:06, Kees Cook wrote:
> > On Mon, Sep 14, 2026 at 10:22:20AM +0100, Lorenzo Stoakes (ARM) wrote:
> >
> > Makefile:
> >
> > KPGZIP	:= $(if $(shell command -v pigz 2>/dev/null),$(PYTHON3) 
> > $(abs_srctree)/scripts/jobserver-exec 
> > $(abs_srctree)/scripts/parallel-gzip,gzip)
> >
> > and the same scripts/parallel-gzip:
> >
> > 	#!/bin/sh
> > 	exec pigz -p ${PARALLELISM:-1} "$@"
> >
> > And then replace the /boot/ KGZIP uses with KPGZIP. Then we don't need
> > to change modules, config_data, new users, nor cmd_gzip, etc, which all
> > continue to use the regular KGZIP and the "use python" part for the
> > KPGZIP case becomes is a 1-time cost?
> 
> Nice, I like the idea and this this will work. I didn't know about
> scripts/jobserver-exec, but this does seem like a perfect fit.
> 
> I checked the other compression tools we support, and found that
> zstd is another one that has built-in support for parallel
> compression, so we probably want to have it there as well.

Follow-up idea:

Having to make a dedicated wrapper script to use jobserver-exec is a bit
clunky, so maybe the ergonomics need to be improved there slightly?
Maybe we can add a simple template thingy to
tools/lib/python/jobserver.py's "run" to replace, say, '%PARALLELISM%'
automatically, then it becomes:

KPGZIP	:= $(if $(shell command -v pigz 2>/dev/null),$(PYTHON3) \
		$(abs_srctree)/scripts/jobserver-exec \
		pigz -p %PARALLELISM%

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8D1C982C3
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 15:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbNjHoQqj2wPEZgCy4FI99xMK6p08fWbkD0xAI4i7KY=; b=X9FoJq4DWOymUe
	FNuklZD9vvBpCPqsGwNgqBRFWh6eVZ4XZwUlcQ6Mm/0ZsLcjPs4fkv0GddwAMTVZfmc6zVUeJQUK6
	+ThkOYpKAlTy78C9QqLgA7M5WH8BE3x32Cr6Crx4wkcwMPGqjtpb8UjS1i5YLvpaZIgC9uDJq6Fn7
	9qp4WmLn+KPL9iH/B79qngGx3Q0WwLynjVTi0zGHT7WpzdKC1QmOYdJoNADXqI82MbPqNGqObyDOj
	o2H+h+wXVszQDzYilDlQnXVUHoW3halxRKifgAMNWPlK6JpzgPePbQyiSsY1V9sE99yB/Ni6mndH6
	SGfVVjyONpMuTtbBF4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rGA-00000009VbK-0dcc;
	Wed, 16 Sep 2026 15:09:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rG7-00000009VaL-0bvS;
	Wed, 16 Sep 2026 15:09:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 894F540622;
	Wed, 16 Sep 2026 15:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1711F000FF;
	Wed, 16 Sep 2026 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789571354;
	bh=xoF4dYmQzIJXq0fSxJUTUy/UPdSdLpwkj7dn41ZSZiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RQ/YnETSWlVD8/z+hju38CT8whqZSAySeU8JxURT5snABOURQzZQAxqwbS+i9BUQ9
	 4/G7s8NPFQYpnRyOkzbt9iyQUi6rKt2PQt6HMSvDTDkkWfMRAuCcZWplS/Rn7PRtP1
	 34XnNw07IRIMJb53SQrHPiBMQopz2XyZndz9sNvlLKdktAdiO02vZlEuDzR7MWsTNl
	 +Ps4NHcT/O1pPHiDyd+0YSKVlwC9tppz9EZgvoL2RS/m44JnfpQ0Lrpq1CiV6VmXJI
	 0ZHdDN9voRpOIWMxMlWZAnSIV7ZHMw8w4VQ+f8luDO+maSgAwmHkaJt7m+CyWhgJbZ
	 4biSv1uFrX9wQ==
Date: Wed, 16 Sep 2026 08:09:14 -0700
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
Message-ID: <202609160805.0DE45DB@keescook>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-21-39817ec5db23@kernel.org>
 <202609151758.BA5732348@keescook>
 <aqqqZfa8Q4D5dBt5@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqqqZfa8Q4D5dBt5@gremlin>
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

On Wed, Sep 16, 2026 at 04:03:39PM +0100, Lorenzo Stoakes (ARM) wrote:
> This is clearly the way forward, will do that in v3, thanks! :)

Great! I'm really excited to see this (and the other stuff in this
series) land; I spend _so_ much time waiting on builds. :P

> [Oh and on precedent, it seems the arm64 FIT image builder,
>  scripts/make_fit.py, uses pigz already if available :>)]

Oh nice find!

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

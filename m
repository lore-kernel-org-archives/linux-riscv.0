Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79887C88E75
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 04:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6RKUAE0fsQRY8MTJbb6CRlGZfgW/0F/rgmiF6MoWBvo=; b=sLfDDWzurxJD8i
	ez7f0sictMSO4Tb689DgOWSVOG0bvMmU7qd0puwYspP9x7wbjJFLBdcRyjnw0OUdKVd7mRzTEYjrI
	mZJzt1it0W8uhwA17CfcZj3NlxuUCP6OlpzCXbQSa51dc3mrDkJnpP/TpPVbouC1yKSs6p/zxaRfr
	2+zLs39oeBdL1BhVntiWHEN3j7SIkEIX+d2vNDvi86X02AzVxPZACEoVNFJVYB+MCGCbGrKh+mGpT
	B0RYwpfE0EMGl4VhOamYYRmOjmQvbCK4lmxzHFmZELJV8B7KQQmrsPB/GenzBiOvoClNqXrQCoBY2
	jdAcTjoAL0ihHfHhmkeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7QSa-0000000DTFk-39rx;
	Fri, 18 Sep 2026 04:44:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7QSZ-0000000DTFW-08Uu;
	Fri, 18 Sep 2026 04:44:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 309736020C;
	Fri, 18 Sep 2026 04:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98C41F00893;
	Fri, 18 Sep 2026 04:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789706664;
	bh=bqZx/AptVhZLcudKvv7eqc5S9GWWoF0mLVu5mPMuXVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hRJTfYRamoTrmtZroOVByfenuYfGDp7MAxXhTqbsJrtj0eHWEbinP0LsZWILEq+XD
	 OikV6J85b7zSxwh87Jb/ngzwEe6TQTPZxtT9eHmp/66v0Gc75aPTGTthkiqQLOdlYe
	 qYTEfEURoLvzbT9rOGpjjnSsMmQWWjtMDvS8dZoc5ls+HJcvM9EDRA1tJjv4BNpzKk
	 j7xKqxF2anKKWQ67STCZVhSh5UZ5d+MNO5B66dAmPxWJgfVu+5+V3BTAONMkZxsyu+
	 FphLF7BOAaSJ1VxHjt5+8ncx7gpMmCitABngv2FjDsJH7Nyc5mgeR7imudcUYsMgbc
	 i/8dYQEK1Smgw==
Date: Thu, 17 Sep 2026 21:44:24 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
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
Subject: Re: [PATCH v3 11/20] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <202609172130.3DF0D66@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-11-9ecf4163ff36@kernel.org>
 <202609171154.BEA5134F7@keescook>
 <20260918012119.GC1585590@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918012119.GC1585590@ax162>
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

On Thu, Sep 17, 2026 at 06:21:19PM -0700, Nathan Chancellor wrote:
> While we could certainly try to cook something like this up, we could
> also avoid the split across two files by just defining the flags in
> Kconfig directly and using them in the Makefile through their symbol,
> like we already do for -Wimplicit-fallthrough. For example, instead of
> 
>   config CC_HAS_STRICT_FLEX_ARRAYS
>       def_bool $(cc-option,-fstrict-flex-arrays=3)
> 
>   KBUILD_CFLAGS += $(if $(CONFIG_CC_HAS_STRICT_FLEX_ARRAYS),-fstrict-flex-arrays=3)
> 
> We would just do
> 
>   config CC_STRICT_FLEX_ARRAYS
>       string
>       default "-fstrict-flex-arrays=3" if $(cc-option,-fstrict-flex-arrays=3)
> 
>   KBUILD_CFLAGS += $(CONFIG_CC_STRICT_FLEX_ARRAYS)
> 
> While we still get the duplication (and we could look at getting rid of
> it with your cc-option-str idea or whatever), it is at least contained
> to the same location, so out of sync issues should be much rarer. I do
> diff Kconfigs so this might make certain issues with checks a little bit
> more obvious if something changes on the compiler side.

Yeah, and note that cc-option-bit already exists. It's just a weird name
is all and there isn't an ld-option-bit.

As for naming conventions, I think "CC_OPT_" would be a good prefix. And
this works today with no change:

config CC_OPT_STRICT_FLEX_ARRAYS
	string
	default "$(cc-option-bit,-fstrict-flex-arrays=3)"

(do we need "def_string" now?)

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EF6C79FB6
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 06:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JdU1/YwECaxno9vSE1TbDnxn7mbNHqoULf/5htVE2vo=; b=c8gM79XRvrsAJ2
	o5D5fBDCMLpjnuZBdMY38nyE7xC/1kVnYJNiSEs+gKFqbB/w6X1GsPDbfWuzHtM54/U6BV0aUifdz
	p9a8Vliy+1cBviKu4JCHOH/zSivzd4y2ON+tAW0E1LYk/Y5qwZYXY8It59lkbhTYHfv2wJbmHzyut
	MW5Y9ectNDbXw7kFTT3wfJRzZC1QScKWcH8cxsGaSM9I5/8IU3k6nsbbCwTE6QziKMz3+TBgInB4z
	7J8VZKeMFVMBRzn3tokmZ2n63YrxPIf06RTb/x9UuiqMbpKKYIcmHECRkm0mdXMk02CCMOs8EIUMI
	ifPEXcmI8p3AcWzN06Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HNb-00000000a1Z-0trP;
	Sat, 12 Sep 2026 06:38:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HNY-00000000a1P-3WdF;
	Sat, 12 Sep 2026 06:38:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D79AF43C4C;
	Sat, 12 Sep 2026 06:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99C51F000FF;
	Sat, 12 Sep 2026 06:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789195103;
	bh=3q+gqJaQNSw7zopShFjv5phABfd7Zt/zt8yj8tu/XRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ca5YizZ0qzpo3pPdor/zFBETaCj9tTA47MXV+adcyOxfoAK5jJWRrjHwKJq6edNt4
	 84Nw5a+Cy8TQc/+e/VDvplgzmJkOWW0IFOt4g60MXjG/sxK91CHEpdk5izKEEX4Qcf
	 snt+U7KB6899WBRmMmO+Ty1WFBadnQgS4SLsqfhKewEOSe09ZT/qEfAPKWRRRSqfpJ
	 ClrfBBgp6eiImJ4y70FLuIAQI8eTubMFsNEnSz7MJ7qDKm/M/EtRLUZaHlFdjozIiM
	 H1vUpC174tNMwd9Q3gLXfYAcFM73uN8S6lvOC0me1KqjeYLlsKIZnKPZDY/WrFvg4d
	 BfGKCl98KqLsg==
Date: Fri, 11 Sep 2026 23:38:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
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
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 23/23] kbuild: use pigz for gzip compression if available
Message-ID: <20260912063811.GA2002951@ax162>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-23-5dc1ac01672d@kernel.org>
 <178901395293.3971858.15429964442902485180.b4-review@b4>
 <aqPdP_0eh0OYY6gZ@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqPdP_0eh0OYY6gZ@gremlin>
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

On Fri, Sep 11, 2026 at 12:03:51PM +0100, Lorenzo Stoakes (ARM) wrote:
> Actually make KGZIP=foo will override this still. But it doesn't take an
> environment variable for make -e.
> 
> However, that's consistent with other variables there like KBZIP2 etc.
> 
> Probably the wording in the docs should be tweaked!

Hmmm, TIL, I thought := always overrode a value specified on the command
line but I guess not! I don't think there is anything that needs to be
clarified.

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

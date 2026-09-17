Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B03AC88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 18:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2wKuQ2tPoT0UxstMlwIiiYDFlZ4SSSGJtvMWYd1tUk=; b=lVv8HHxcrHQtwC
	rk8BaMoalrOA1jRq492Dc7a+dvfwTevnTwu8RQzgvlTNel85z40ha9RS/hd6BX4V787sJvzbDZ8Gf
	xRlql38sSKsWTEoQYPER0k148pAmUim+jBh3MlNH/3wqZTKYFGlUqzX6QKztL04CSDVKwVRivHTsP
	4oQzMMXQsIVZUPpoepNDD++7jb1Qq43pIe0QG5moAngSsR3EZOjEM9zS/d6tBthlbX3ZaN9GTVSHa
	IwoxqptoFnd4vTlftOYo/YDMX4A9tKccyvx7xMW53W69F5LEnP+nHhmpjRLOTx9J89CqIl382yKUb
	RAauhF3tMreQgchtF+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GaQ-0000000CBRF-1zqL;
	Thu, 17 Sep 2026 18:11:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7GaE-0000000CBN7-2dDB;
	Thu, 17 Sep 2026 18:11:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36AED41317;
	Thu, 17 Sep 2026 18:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FBB1F0089A;
	Thu, 17 Sep 2026 18:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789668702;
	bh=KivQhtsO8a4itzEQWZwvcU0vaLM0EC3b+zcpo+5cxFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yd1VSsrews+KOBN0uKtnIdnZ1G8CVssbrPM08Gw35Vri29zJuBn5FKU3BGM09J/YT
	 ez6WOpuKLqbRXy2mEU+yrWFZWOdLsOGEJHcrg46gtRII0MYNvTU3ZpBSIkgm5fqeG7
	 DtoigLn0myERRymKYpPutd36aESFAKs1EljepOhcZI3BUu+T65G/uepm2XbWi722Pe
	 N0THyeTnDWjGILEUOpLpk+HIUgicl8OAvLhrVHsTfJjVAK9blGwpgqF4FxzR4jEvX6
	 KfzLy+gnOGm8DLjpR827SCTwuDWK1Y8RXPONMg1MDxP5t06lQbpC94vGwhZr8tuY/W
	 zK0rO7XmGemMg==
Date: Thu, 17 Sep 2026 11:11:41 -0700
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
Subject: Re: [PATCH v3 08/20] kbuild: cache list, composite object state per
 object
Message-ID: <202609171110.438BC7477A@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-8-9ecf4163ff36@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-build-speedup-v3-8-9ecf4163ff36@kernel.org>
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

On Thu, Sep 17, 2026 at 05:06:18PM +0100, Lorenzo Stoakes (ARM) wrote:
> Fix the issue by caching this data and looking it up instead of getting it
> over and over again.

Nit: I would describe this as "calculate these once". It _is_ caching,
but I think with Makefiles there is an implication the "caching" means
"write to disk". But maybe that's just me.

> This has a particularly large impact on allmodconfig builds.

Love it. :)

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

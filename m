Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCEFC982D0
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 18:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HA5bgK+4KQKkLcmBU8Oz3FUs0UaCCw5i4i0wsQwa81g=; b=dY7QUfiopqI7/L
	DodRpurxKKzeftkrAk3/FbBnUfixF4YHcVs81vV4MSJCo1hFrzFQUtabXBaL1YPCWqUBOU5vCU/NP
	WGz1YgYHAIa11Je1WbUCKQv7jJgfHOgfDqr5GgeWOgs8RLqYppxn320ni0LdE5G2md3g6g17o5vMc
	Y123PaBkNc628XbVeQCrnxLN1IRZLwJbsHGHD/1nnxhdnt3WEzknzo5T0FN6cUdEVJJA3Sdy2cob3
	KkofoDjvp9S53YTyPJYPvnQMde/tVWAY3kO48Anzf+eyq/YvShSn/qtyW16RjU3HtL+VOO8S/iSZE
	CZcD6jOKDtQNPPsDuvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HEU-0000000CHjE-03Du;
	Thu, 17 Sep 2026 18:53:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HER-0000000CHil-1ZJf;
	Thu, 17 Sep 2026 18:53:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CC17602C4;
	Thu, 17 Sep 2026 18:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3686A1F00893;
	Thu, 17 Sep 2026 18:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789671194;
	bh=0oihKYd8wytojQfZkwv3d3XG7xPD4OISAVPY8R3cxfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kcpkHQYfVsftIxYMAI5mYyEK1J1hrx0e6VaZTd7q3LCRWui7RlFiJTXi1tNZxD+4c
	 gdX+pjFq23uV20OzdzfP0QmNW/0GqIcc0Fu0OwZ7q6zomSxpHPTLCvcCZGfH4MmX/Z
	 YM0rIMxKigTwRuV5utuXmehtQbel5GUXqrYBDm7yNsPI+XLv7sxkc/rgkQHPOJ4dFJ
	 pt3ZwzZXJvWi3zcvrt1vn27aR74bu+Sr1uxdhBcYgn+d+X8lM7AnJYWQRqCH17Q6f1
	 eDieijo3jn9Y6O4ORwn3pcTE2H00X9aF8G0JAZtf49WIOz0Q94f6u0zTFPn1cmErfj
	 3zN7dwkGyKTiQ==
Date: Thu, 17 Sep 2026 11:53:13 -0700
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
Subject: Re: [PATCH v3 10/20] kbuild: move the toolchain checks into
 init/Kconfig.toolchain
Message-ID: <202609171149.6454DC6@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-10-9ecf4163ff36@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-build-speedup-v3-10-9ecf4163ff36@kernel.org>
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

On Thu, Sep 17, 2026 at 05:06:20PM +0100, Lorenzo Stoakes (ARM) wrote:
> Move them into their own file, sourced from the top of init/Kconfig, so
> that the next commit can add to them without growing init/Kconfig further.
> 
> No functional change.
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  init/Kconfig           | 197 +-----------------------------------------------
>  init/Kconfig.toolchain | 198 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 199 insertions(+), 196 deletions(-)

Yeah, totally right to move to a separate file. I think, however, I
would prefer this wasn't in init/ though. Kbuild uses scripts/ as its
Makefile.$topic dumping ground, and Kconfig.include also lives there. To
me, this new file should be scripts/Kconfig.toolchain instead. And
arguably, this should be included by the top-level Kconfig rather than
init/Kconfig...

I defer to kbuild folks, though.

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

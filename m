Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C458FCAC589
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 06:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kd0oBybQS8gFY5ig5txI7WwtzCRyg6QyJRP2T/emeBw=; b=XhcV95cArYuVHI
	gsl33d8Srmdge9WsFzP7hT2hHBioZ6aN/ja1vF/ZQJnywxM2UwbRMb1sw2tdI6ydSYE6dj3q8VjIn
	NsnqUB2OvYlXrNMblZh4tKJzuE6GNWUVxw3rXegfWGPM/hLhaoAPxjTotBT6FSOa2y3wBMgHdBoeR
	Q6yhaRZ/p0zQkErx/f5LV1XghyMEVKjumUyltnrXwnVDn6q2CKvH8fiVQMXR/rzBGCjRus5waQi8O
	eC+pNAguI5ZZp5GO7JQXmzzHcruBzI0/aBLDAFRYddQEKK5Rv5AF1ovrQEk6o5AnvqPkWUYauE2ZS
	xGaNPoc4DdY1GZVtPpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsHd-00000004wkr-334H;
	Tue, 09 Sep 2025 06:56:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvolp-00000003tCV-3siB
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 03:11:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1256460194;
	Tue,  9 Sep 2025 03:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5F1C4CEF1;
	Tue,  9 Sep 2025 03:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757387508;
	bh=FHj0B++JBRs8wJM7cOGkVEvycIRxssERqZ4KwCKug7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=szf7WnWxJI0Z+uRLOA54yiBvCY9EwjKEL7sVsugkMM9nFL7Fvf6jP95RN/emb1LPy
	 WytjBJRToGrJo2o31529JgVVFvYwlA5B5qC4zl/hAvlqKg7R7986xYyz8F8RyJaFWP
	 j2c2yfKppoQrWKWEtYC+q2CTzxk7iCvtbumufEMkBJ+vRlBOx5geR3p7dsyfvsyp8P
	 sCsVN+DwwRbPYcta11QGLI4/GhdBVsQEU5cAtQvUJDXLx4C68M5H2EWHr1GNkHTOmf
	 11tfQJSB4XlQeHJoZ2Gh5cFI4H9q+Xj4iQ7PWNmQg62cpn77qWwyodcbJlL4krbPsW
	 ZbYikePQis+ug==
Date: Mon, 8 Sep 2025 20:11:48 -0700
From: Kees Cook <kees@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Matthew Maurer <mmaurer@google.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] rust: cfi: only 64-bit arm and x86 support CFI_CLANG
Message-ID: <202509082009.4A8DC97BD2@keescook>
References: <20250908-distill-lint-1ae78bcf777c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250908-distill-lint-1ae78bcf777c@spud>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 08, 2025 at 02:12:35PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> =

> The kernel uses the standard rustc targets for non-x86 targets, and out
> of those only 64-bit arm's target has kcfi support enabled. For x86, the
> custom 64-bit target enables kcfi.
> =

> The HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC config option that allows
> CFI_CLANG to be used in combination with RUST does not check whether the
> rustc target supports kcfi. This breaks the build on riscv (and
> presumably 32-bit arm) when CFI_CLANG and RUST are enabled at the same
> time.
> =

> Ordinarily, a rustc-option check would be used to detect target support
> but unfortunately rustc-option filters out the target for reasons given
> in commit 46e24a545cdb4 ("rust: kasan/kbuild: fix missing flags on first
> build"). As a result, if the host supports kcfi but the target does not,
> e.g. when building for riscv on x86_64, the build would remain broken.
> =

> Instead, make HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC depend on the only
> two architectures where the target used supports it to fix the build.

I'm generally fine with this, but normally we do arch-specific stuff
only in arch/$arch/Kconfig, and expose some kind of
ARCH_HAS_CFI_ICALL_NORMALIZE_INTEGERS that would get tested here. Should
we do that here too?

-Kees

> =

> CC: stable@vger.kernel.org
> Fixes: ca627e636551e ("rust: cfi: add support for CFI_CLANG with Rust")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Alexandre Ghiti <alex@ghiti.fr>
> CC: Miguel Ojeda <ojeda@kernel.org>
> CC: Alex Gaynor <alex.gaynor@gmail.com>
> CC: Boqun Feng <boqun.feng@gmail.com>
> CC: Gary Guo <gary@garyguo.net>
> CC: "Bj=F6rn Roy Baron" <bjorn3_gh@protonmail.com>
> CC: Benno Lossin <lossin@kernel.org>
> CC: Andreas Hindborg <a.hindborg@kernel.org>
> CC: Alice Ryhl <aliceryhl@google.com>
> CC: Trevor Gross <tmgross@umich.edu>
> CC: Danilo Krummrich <dakr@kernel.org>
> CC: Kees Cook <kees@kernel.org>
> CC: Sami Tolvanen <samitolvanen@google.com>
> CC: Matthew Maurer <mmaurer@google.com>
> CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> CC: linux-kernel@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: rust-for-linux@vger.kernel.org
> ---
>  arch/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/arch/Kconfig b/arch/Kconfig
> index d1b4ffd6e0856..880cddff5eda7 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -917,6 +917,7 @@ config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
>  	def_bool y
>  	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
>  	depends on RUSTC_VERSION >=3D 107900
> +	depends on ARM64 || X86_64
>  	# With GCOV/KASAN we need this fix: https://github.com/rust-lang/rust/p=
ull/129373
>  	depends on (RUSTC_LLVM_VERSION >=3D 190103 && RUSTC_VERSION >=3D 108200=
) || \
>  		(!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
> -- =

> 2.47.2
> =


-- =

Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

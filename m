Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F63ACAC592
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 17:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVHjF5TlnVCQkSjlGVEXaZlBR+aAR3y9ndRP/qc79bc=; b=ZhM3+zx4HeXeyiX4p1WpmhF3Ma
	gAgf6DgY5BkFnL7ZJJOZsmmjBSw89GYa8lHHKK7brprqBv2bG4KIg93e/GsM6dxom2mdz/FIe4Ku6
	gtjIHlwbAyT4BtIMqL9NegKHCToJ6YBdEu4wrhYYJe0rBb/FMXVU9WdvxIDQ8DQAnYbJA1/bA0IKx
	qf3mpvDGBHpX2EKjvkI2SekZTvpagjP8omRmQOf8BnZYK6rQPivLyqrUEV9vGepfnGL2nxnpoFCB7
	9hllzBuRDVOAxyXbybDu4EqyvQUTUsuv0lgF1EIn5P3S3eaCsE5T6wfXXBm54F02dcpfeC3erDZOT
	uDdF6fpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZNA-00000008bvQ-3acG;
	Tue, 16 Sep 2025 17:21:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZN9-00000008bvH-2NgI
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 17:21:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E99C7601D7;
	Tue, 16 Sep 2025 17:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DFCC4CEEB;
	Tue, 16 Sep 2025 17:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758043302;
	bh=DJ5Z50X5vQEdBklBEnK9nMQ+7I1JuqRFkk4wtkg6jd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nK69Sf8A1+xQNLJPVP5BMJ34gDV+ob4401QWkOJn2E0veRXaRdI6Ugl/7gQMNL9YY
	 anIZ70kGc1KRSKOY7lYBBFLIc3oVLaEQG5u+XQsGg6UkFhzdHFZhV87Lyw1zyt7AlA
	 7gDO+7SbCDSrk37n8XlySD3fJoNGfvj4br40D3f0NLU1JzZ/omxvw+vMXLrCyaxvt3
	 ofyTDfzZnSMOzU+VJV8DuOetScgLJ4QskNO31s515siQCddQoY/EwZQGf8yc6zkwfK
	 Msnm+vTz0q53ELGYhldIzo9lkjCsWqdWScOrKmVo8727WeaPkUBZyl/ZaoMF0Qayrj
	 fODObCWXRQNHQ==
Date: Tue, 16 Sep 2025 18:21:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Asuna Yang <spriteovo@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Jason Montleon <jmontleo@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3] RISC-V: re-enable gcc + rust builds
Message-ID: <20250916-getaway-grew-46e4fb956a78@spud>
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3569116621173420986=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3569116621173420986==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ovMXMPQdHm2Jci7/"
Content-Disposition: inline


--ovMXMPQdHm2Jci7/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 14, 2025 at 03:16:40PM +0800, Asuna Yang wrote:
> +config TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
> +	def_bool y
> +	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
> +	depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC || !TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI || RUST_BINDGEN_LIBCLANG_VERSION >= 170000
> +	help
> +	  LLVM/Clang >= 17.0.0 starts recognizing Zicsr/Zifencei in -march, passing
> +	  them to -march doesn't generate an error anymore, and passing them or not
> +	  doesn't have any real difference, it still follows ISA before version
> +	  20190608 - Zicsr/Zifencei are included in base ISA.
> +
> +	  The current latest version of LLVM/Clang still does not require explicit
> +	  Zicsr/Zifencei to enable these two extensions, Clang just accepts them in
> +	  -march and then silently ignores them.

I still don't really like the name of this option, but I don't really
have any good suggestions for what to call this.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--ovMXMPQdHm2Jci7/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMmcigAKCRB4tDGHoIJi
0rfDAP9q+R3zLBj2lwiOj46Ay1jJrWFrzRnaLIF9CVcqW7Tq6gEAhYmZWcMRrz3+
1MPkLLx2PkcE4kEft2ZLozNAEw1LCww=
=UxeS
-----END PGP SIGNATURE-----

--ovMXMPQdHm2Jci7/--


--===============3569116621173420986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3569116621173420986==--


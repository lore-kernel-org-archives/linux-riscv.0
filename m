Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454C7606A324
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QluT1ju7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8Da98U0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Hh1c+gGzUkO4DsnQuqwBHSWvzpqcThyAKRyWPMcAJnc=; b=QluT1ju7RnZd2R2tK93IZC6nbl
	M7prayzgYteFqAovG1XkDBt/+F3ITP9rxylAz9sGjupvsEUFoRoXVFrKGQO+6MakmgK9LLZbvtIkK
	5vuqwFIPtYAfVEnYahvFt3qsaXLY/NJFXQmWiqYWEe15n+iBwOdwG0rD3lEdWoQA11pX/E87YGV9S
	1t6OwVTXfeXHlJ6raQLVuUyDt91d3pHqPbDEDuIsIruhFDQt1edT8TPu/TNQ0GXjUmLSnve2Dr2ig
	JiB/qljxFd3cgY30MPOi2QOr8zcweJsplto/19L/Kj9k4kTKPoCcXeSw6jRBTHhuVNYqkjlJUY+Xe
	YK15ZdjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3J5-0000000CFdO-3cEV;
	Thu, 19 Nov 2026 14:40:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3J4-0000000CFd3-17QY
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 14:40:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id DA4C343AFC;
	Thu, 19 Nov 2026 14:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 497251F000CC;
	Thu, 19 Nov 2026 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795099209;
	bh=jGUNa2nkwgmbkFv5PZDi3+5NxDpJOH/HW6VIk5Cn1XI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P8Da98U0KKGyVjG5Co+Bq3lcopEB0AluEtILidv5HO2nC9IyOWGoRGjYm27bzTqIx
	 +lW6pso1BJ3BrPzJxPix2npnl41J3OXdsNde4rlJ4Xk33Mfr/2uOKj234ZaQxLFsaN
	 JHUbeyIxXwLPaI5mqCcxB7neudbJ5YHjlmjUvbCJnEzfr2AGo6qGaBb72MAV7L8wyy
	 CFQXCc9Tw0dMdoeIYdGl7ZLMA0okVeqgKyTU6Pf/vA4x9SI4OyVKsgMksYPaEOyaLx
	 rCFP1VQuX+46JDr07Y6DI/ct6ui/VXSAcdZu7oQ2XjGA/E5dOjTOfDtLZjFT0ADzEm
	 tTU3agC4K7jFw==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 0/6] scripts/Kconfig.toolchain: Document minimum supported versions for dynamic checks
Date: Thu, 19 Nov 2026 15:39:59 +0100
Message-ID: <179509785409.3080802.12400900075505469862.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 11 Nov 2026 17:52:02 -0700, Nathan Chancellor wrote:
> Now that we have a fairly unified location for compiler and linker
> feature checks in scripts/Kconfig.toolchain, we should make it easy to
> clean up the checks as they become obsolete through minimum supported
> version bumps by documenting when they were first supported. I somewhat
> modeled this after the documentation in compiler_attributes.h but I did
> not want it to be as verbose.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable) and applied Kees' R-b
trailer to 1-3+6, thanks!

[1/6] scripts/Kconfig.toolchain: Remove CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
      https://git.kernel.org/kbuild/c/aac435fa2bae
[2/6] scripts/Kconfig.toolchain: Do not dynamically probe '-fno-addrsig'
      https://git.kernel.org/kbuild/c/836ac9c65e4d
[3/6] scripts/Kconfig.toolchain: Clean up '-fno-allow-store-data-races' handling
      https://git.kernel.org/kbuild/c/e2c2434465c8
[4/6] riscv: checksum: Fix CC_HAS_ASM_GOTO_TIED_OUTPUT check
      https://git.kernel.org/kbuild/c/f67671cfeafb
[5/6] Eliminate CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
      https://git.kernel.org/kbuild/c/fe2493fd4bd9
[6/6] scripts/Kconfig.toolchain: Document minimum supported versions for dynamic checks
      https://git.kernel.org/kbuild/c/c71019d89ed4

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

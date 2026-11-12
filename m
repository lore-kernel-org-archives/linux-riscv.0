Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA52A606A884
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 11:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KM5CrfNI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SIijVHf/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZBTRzCxt7mFp6siVQJBVPb0zdjaF9Clsi2rmUy0s8S0=; b=KM5CrfNIiGphIzCHrhNOUWV/6r
	C7q+9+wMOwdNQ1KqV7qDAFKfOiwr7xKwCVv/cYGUVC969Lfp0K/rVS1/fC/Bj9yWE8Sf7LQhM73vb
	gqf00/insiiKaDCzTeobcYmbwbY260VFLWLr7GqT74QshuEhClLKmusJO1RNJLNPl8Jko+7IIo7PH
	WKmooBgT9gN/KAyffB9sjY9qacwWOb+ane5b0xbemhXOS0BrxOHVbFtUR8Y1ir3yCsU33ZW4VjfjG
	DoTI8uPj+XiniFCXhjFNhhmVdydZsvDh3EhEhksmDS+1OzkTLfNb77NpOjNiD4zqDiS8zUPdaEtTK
	dMfbQt4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTCh-00000009lLx-0j3f;
	Thu, 12 Nov 2026 11:42:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTCf-00000009lLE-2pkp
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 11:42:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id D199B47214;
	Thu, 12 Nov 2026 11:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 43F8A1F00A07;
	Thu, 12 Nov 2026 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794483772;
	bh=yBDSrz0rU0DnRkMjKw+YlslHT/Bdl8TFcwbvYkOH9kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SIijVHf/6S9PX5Y0aCOMGOz2Vl6lijH5dTGNQgaiJkvoVxp2rXOIUpvBdcuMLMEpc
	 vc6pOfDpl3mtDzLjIkcPL9fMNUaboYnSQp0ZZriyAt7VMYr+pLp/sc6UWy19CD5loR
	 5b/OvSc1hJ9LIij+KM7rROKyTFblQsPgWMNjUfMMmJbcAgZwSF8C4+X756fVlrfmJP
	 L4lbmWhMUPoHDas/afVpjdZ2OohiQn1d56TP7UjHRFlaWUTzyunPsqF21Ecava8BnG
	 UFZCozyja/o025Qt2sAGxqd6MDBygofYwzlUSZdzDDrnvysMM/eg+WuCxR4u3SfPYb
	 ep+C4q2/gYBgA==
Date: Thu, 12 Nov 2026 12:34:50 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/6] Eliminate CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
Message-ID: <avWkWm1N5rv52GG4@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linuxfoundation.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
 <20261111-kconfig-toolchain-updates-v2-5-b2d9415c1757@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-5-b2d9415c1757@kernel.org>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 05:52:07PM -0700, Nathan Chancellor wrote:
> Commit 1aa0e8b144b6 ("Kconfig: Add option for asm goto w/ tied outputs
> to workaround clang-13 bug") added CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT to
> avoid a bug in clang's asm goto with outputs support when a tied output
> was used. The fix in clang was to match GCC's documented behavior.
> 
> Now that the minimum supported version of clang has long been bumped
> past the version where the fix landed (clang-14), any compiler that
> satisfies the dependencies of CONFIG_CC_HAS_ASM_GOTO_OUTPUT will support
> tied outputs properly. Eliminate CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT in
> favor of just checking for CONFIG_CC_HAS_ASM_GOTO_OUTPUT directly.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

[...]
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 6520a06a9103..9454ef5294d5 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -120,11 +120,6 @@ config CC_HAS_ASM_GOTO_OUTPUT
>  	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
>  	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
>  
> -config CC_HAS_ASM_GOTO_TIED_OUTPUT
> -	depends on CC_HAS_ASM_GOTO_OUTPUT
> -	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
> -	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /dev/null)

The comments reads as if gcc 8 to 10 are affected.  Is the comment
somehow misleading, or should we still keep this until gcc-10 is the
minimum gcc version?

-- 
Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

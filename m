Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8FA606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 20:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IukGYJ7f;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G2HtaYb0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U/XiGfdvvi4NguVav6XKNpviUSvnqjScZAWYkKGqLa8=; b=IukGYJ7fcAwirARGXOsC8M8V9s
	6FCvhEZx3RI0agN9FbMiOcbhITlI1XY1NIwYkJarT8nfvNZRd1IdOnDw6GJYxSQvnhiP/XueXvIp3
	C0iLZHUZtB648/t3m4iaPu8M/XCETVr5+BApBgEdw7ynnz4ivo71CSNdO83b7/LsPyXmB8b73tRBm
	LT4tg7fo3GEfif6ElvwElebTk426dp02Ug0dpzsj2J9vBogKdLRy3aALj5vAFOyD0NhsnAvHK8sco
	jBCVyvKmyjXz4p+PfyuvOMUvNvqJZfcyxtuV6cBXyiv9ev4s0hdgtGEZgsW0yESDI3JBvnh217SYq
	7G1dk0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbJI-0000000B0ev-2Ndv;
	Thu, 12 Nov 2026 20:22:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbJH-0000000B0ed-2tHq
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 20:22:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id C24F16123D;
	Thu, 12 Nov 2026 20:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 059E11F000C4;
	Thu, 12 Nov 2026 20:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794514934;
	bh=ffNri5wPyaoWDuKhZ9FxbDlSlTSKcXafOoFdLA+gTVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G2HtaYb0RYo+2Rg0DlGRfceiiYpMWFEDJHtWMm5QL9V+DTGJARH/Jgy5SKuV1YIBa
	 RR4GVmiYY0f4uZ3zWXbMs7xNNIwEXAm6Ko14uFv15kWrsUACnjrRsE7TbsnzgB2L87
	 mCBtFGGdWpEJgXxIoZ1Yu44Nt5cQt0vJ2Fh8MuaJLd/UrGcaFl6Hu1CW1JsgzFvl+p
	 Nno54RXQHwEzyGAjV8vm0jvCSXbgtkwr5OEvfr7k2xaNc7z1qhqTVkd5I/6ySD3Wee
	 Xf2WIYLqiBBtDAlXGM+uQ8YaXE4mTqOXvcZsrgmymUQvsiNU4tGELxr7S3XHCEYEuX
	 mzU6gudkDNWDQ==
Date: Thu, 12 Nov 2026 21:12:16 +0100
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
Message-ID: <avYdoI-g8YPwNwUG@levanger>
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
 <avWkWm1N5rv52GG4@levanger>
 <20261112174753.GC4107043@ax162>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261112174753.GC4107043@ax162>
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 10:47:53AM -0700, Nathan Chancellor wrote:
> On Thu, Nov 12, 2026 at 12:34:50PM +0100, Nicolas Schier wrote:
> > On Wed, Nov 11, 2026 at 05:52:07PM -0700, Nathan Chancellor wrote:
> > > -config CC_HAS_ASM_GOTO_TIED_OUTPUT
> > > -	depends on CC_HAS_ASM_GOTO_OUTPUT
> > > -	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
> > > -	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /dev/null)
> > 
> > The comments reads as if gcc 8 to 10 are affected.  Is the comment
> > somehow misleading, or should we still keep this until gcc-10 is the
> > minimum gcc version?
> 
> It is a little misleading. GCC 11 was the first version that supported
> asm goto with outputs, so this program will not compile with GCC 8 to 10
> as a result:
> 
>   <stdin>: In function 'foo':
>   <stdin>:1:51: error: expected ':' before string constant
> 
> The bug that it is trying to trigger was fixed during the GCC 11
> development cycle between the initial asm goto with outputs commit and
> the final release. As a result, for GCC, if it supports asm goto with
> outputs, it supports tied outputs in the expected manner.
> 
> This test was mostly to catch buggy versions of clang, as asm goto with
> outputs was first shipped in clang-11 but using tied outputs breaks the
> build until they were fixed to be compatible with GCC in clang-14:
> 
>   <stdin>:1:29: error: invalid operand in inline asm: '.long (${1:l}) - .'
>   int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }
>                               ^
>   <stdin>:1:29: error: unknown token in expression in '.long' directive
>   <inline asm>:1:9: note: instantiated into assembly here
>           .long () - .
>                  ^
>   2 errors generated.
> 
> So if the compiler results in CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y, we know
> that CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y will be present as well.

ah ok, thanks for clarification!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

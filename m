Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EA4606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hO4YeAFh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dAXT8BCQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MBDARdC76ILprg3P3fwpYNTLiibpjAJmimSnz/oTJpY=; b=hO4YeAFhXWQBOOsU/o4m1xGhZe
	5qUyZbxOAM2pHG9PNhrPWudICXZXHtJ0d7fbpCO4zOCYCk6dpbedqfMvYT0wbZWE6W7EvEn82zj0I
	iYkRfeJlxWJtcpJEnghGsEVDGy2QnEEl2G+rKIkntdAWa8Eq44kSkSiMMddBz8hvOUhWyQdIhZa84
	1YifcoyXWZEKG1eBCSyVj7doKzb2uPVUqU71AkAeHz79cUgA4aJ9EylOhjIjul76y3HbxRhm6zxL1
	iwlbzvcHCjSwMUqn+/NHGxHGkdhP70kRq2Wq4tdMwmNVVRCYVTPj95oMzrIalqRMYLwhdbqxN5yFT
	1YP/J+5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYu2-0000000Anal-1T3P;
	Thu, 12 Nov 2026 17:48:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYu0-0000000AnaE-3H4N
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 17:48:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E5E24245D;
	Thu, 12 Nov 2026 17:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E631F000C4;
	Thu, 12 Nov 2026 17:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794505680;
	bh=zaOiQXaj6cqdaLfvFVkz/GzQHYgpVXTXcmV319+t8cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dAXT8BCQGA0v1Y1k8ymmF1rs8DPDUlmUSugJ0yuskL5i+CZXcn3Slwf0Lukko3L1v
	 cHr5vmYmUszoaX3cexipeI91nWId6S4XC2HROr+kQibp128sYRTtNpCpwRpvySo+TP
	 TAYWL2VLQyUmSBGjBQ01qn9TPkni/n+smsz3H6E/Vww7bopXYJFnxpmc8SZ1T91sWr
	 +zLZ0r76GW8HJmqAEnFf3EJU8s0zykr6Iim6AlveagpPipZ44ndU9Zxb9kHqata28N
	 yGMghD6Bj/2nOthHKbco/k49feZEDgLDBdKADDboN7SXjmXb96pnCXdAMNUBRwb3lM
	 s6xeiboXrSSMg==
Date: Thu, 12 Nov 2026 10:47:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
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
Message-ID: <20261112174753.GC4107043@ax162>
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
 <20261111-kconfig-toolchain-updates-v2-5-b2d9415c1757@kernel.org>
 <avWkWm1N5rv52GG4@levanger>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <avWkWm1N5rv52GG4@levanger>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 12:34:50PM +0100, Nicolas Schier wrote:
> On Wed, Nov 11, 2026 at 05:52:07PM -0700, Nathan Chancellor wrote:
> > -config CC_HAS_ASM_GOTO_TIED_OUTPUT
> > -	depends on CC_HAS_ASM_GOTO_OUTPUT
> > -	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
> > -	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /dev/null)
> 
> The comments reads as if gcc 8 to 10 are affected.  Is the comment
> somehow misleading, or should we still keep this until gcc-10 is the
> minimum gcc version?

It is a little misleading. GCC 11 was the first version that supported
asm goto with outputs, so this program will not compile with GCC 8 to 10
as a result:

  <stdin>: In function 'foo':
  <stdin>:1:51: error: expected ':' before string constant

The bug that it is trying to trigger was fixed during the GCC 11
development cycle between the initial asm goto with outputs commit and
the final release. As a result, for GCC, if it supports asm goto with
outputs, it supports tied outputs in the expected manner.

This test was mostly to catch buggy versions of clang, as asm goto with
outputs was first shipped in clang-11 but using tied outputs breaks the
build until they were fixed to be compatible with GCC in clang-14:

  <stdin>:1:29: error: invalid operand in inline asm: '.long (${1:l}) - .'
  int foo(int *x) { asm goto (".long (%l[bar]) - .": "+m"(*x) ::: bar); return *x; bar: return 0; }
                              ^
  <stdin>:1:29: error: unknown token in expression in '.long' directive
  <inline asm>:1:9: note: instantiated into assembly here
          .long () - .
                 ^
  2 errors generated.

So if the compiler results in CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y, we know
that CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y will be present as well.

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

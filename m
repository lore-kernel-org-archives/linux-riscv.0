Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1936F606A88A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 11:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T9ZeHXgy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=etVNP8yw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p5FxbhW64bHiyYipWmYJ1zDYmG9ysTTpQyZHRHfNVnE=; b=T9ZeHXgyDxDGx7SWGPDVHaFuCx
	76ToxRd3HLqclKIg0ol1VPja6P3f3Zll9oaw0HfvjW5F88lomH2vnxS0To4kj8KJlFk2xVc/dVizS
	ZhlRLKjMm06TC6OFRedi41PMdqi6nNx1uqto0eYt2QyUjMARyMhyJmFNARKv19UFxpRjt1iLSAa4/
	PWkh6MkU8C3puY3NArCelUJNcYoOPsspRKhY+oOuOg4nHgcMZ0S/IvWIQvT3vNcsTbKPgrZBBnt3f
	nWCJ0ENkqwe/Rtmg6GEf2aJ6GatEWAJqfPYfz3mepxS20QvQ21is0hGnO0aeAyRCm1rNeuJ2DmU4L
	UCLW/YoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTCf-00000009lLC-04TR;
	Thu, 12 Nov 2026 11:42:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTCd-00000009lKr-2h9g
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 11:42:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 9DAE56575D;
	Thu, 12 Nov 2026 11:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D00511F00A05;
	Thu, 12 Nov 2026 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794483770;
	bh=zb+yRJFS3wDdWPKfGpJ1nC16TXzIdVOWQJ5MHtEfaLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=etVNP8yw3uvm5/D4tGhAAD+c0gqGbyxvCNr6yjwUP5sCtcEr8SHkLeYx+78SUrE9s
	 a/R5E1YhqPsXzaGTShf81F7OliXj6W7HPy4liEBO0IQZ3rp+2ofIEPd9lIfx08wS8g
	 S7cNzgSapQVcqa4HPZQBRyYzOB0XX4/6aQOfxg4JWvU8OKEeKj6Oe1wbYQY4AZTDvJ
	 sqfOKnaam2v4yGllwZANmYftT787+R3M8JWr2yMUHZE0D2llOtRC6bwffd7oTqXQrD
	 Og/IVCHFq3zOMK7XVNChmrmekoFDzM2jeWxnV/kWAe2TnEucnJrxOD0TQmfypAfR4t
	 w10Q7yXeB3FiQ==
Date: Thu, 12 Nov 2026 12:26:32 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/6] riscv: checksum: Fix CC_HAS_ASM_GOTO_TIED_OUTPUT
 check
Message-ID: <avWiaIuhkYw_xE5A@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev, Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
 <20261111-kconfig-toolchain-updates-v2-4-b2d9415c1757@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-4-b2d9415c1757@kernel.org>
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

On Wed, Nov 11, 2026 at 05:52:06PM -0700, Nathan Chancellor wrote:
> The defined symbol is CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT, not
> CC_HAS_ASM_GOTO_TIED_OUTPUT.
> 
> Fixes: 4525462dd0db ("riscv: lib: Check if output in asm goto supported")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/lib/csum.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Thanks for catching!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

Since 4525462dd0db (v6.7) still supported clang-11: shall we add 'Cc: stable'?

-- 
Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

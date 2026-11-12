Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70471606A32A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ygG9k7nq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hR5qYI+1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FOzVaKrUm/LKwTFgVLyJvDKa1JfVTWbZqy14MIPGM/I=; b=ygG9k7nqtLlrtr3DF6uMEX0tzH
	Ljq13bZIOJvsFtFi4B7l1DjhxPg4ZJ0C9N2buM82VfY5UUkVweEu5i9B0pm1ULxBPYWK80DhKlHYl
	1/a1G7V/eDadbMQKVkGTpYbi6HXmWY+5lkwCA7jTaXKsF+vfxrW5CZMsLRWaxhZs0NuY+/66XwzmO
	pdBD8CeaHObWh1/rn1AItIh+3dk6qRpDQZsl+Ox8iS9VKmA//6gXbATPrt1hy12Wi1J+pe7NKucwX
	jC/uUaNCHLG+kCLrvPxCUCUBhT5W/ki+HT6Sqg2ilqv5b4f56Pz+7De3S+w3EXG1xFfPSaCQyB6sY
	1FxOIZAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYUS-0000000AkFs-1Qj8;
	Thu, 12 Nov 2026 17:21:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRYUQ-0000000AkFY-0gjs
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 17:21:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C015D40424;
	Thu, 12 Nov 2026 17:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF321F000C4;
	Thu, 12 Nov 2026 17:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794504093;
	bh=tnvalXgW49Ysw5FO5d/oAkIaPivhfvhSp3vcrnFI3to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hR5qYI+1tNNfCdB4mT3Xavp6UXrwmkDoZbAkG7szDZoB5vbyW9uyPsHjmB6kK0GU3
	 yNaFi72wPr3rl+an6i9w2VRC0cG0dCD+b1uM5HiXNV2DYao/XI98Zh+YLxS4UNiRrC
	 nsVL1luqSVC/VitEr/1DmcKfX+eetD8koKYp3LHLqHrBIdyLSJbkDVTZajvDpTPCGl
	 d8tbhmM0lDTvjO2IqIhiMU4IYbfDh43IHYmN1LYKGrLNM0mYwq58LAtMqnUxbjx0KR
	 AlNJvPJQ2IjXoUZE13Ujs4H+q/jTAyzN9vqi/Mnz/6wkEr+xvHtMWP+kltt1cOjyOg
	 tdT1vTt+qfXqw==
Date: Thu, 12 Nov 2026 10:21:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
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
Message-ID: <20261112172128.GB4107043@ax162>
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
 <20261111-kconfig-toolchain-updates-v2-4-b2d9415c1757@kernel.org>
 <avWiaIuhkYw_xE5A@levanger>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <avWiaIuhkYw_xE5A@levanger>
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

On Thu, Nov 12, 2026 at 12:26:32PM +0100, Nicolas Schier wrote:
> On Wed, Nov 11, 2026 at 05:52:06PM -0700, Nathan Chancellor wrote:
> > The defined symbol is CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT, not
> > CC_HAS_ASM_GOTO_TIED_OUTPUT.
> > 
> > Fixes: 4525462dd0db ("riscv: lib: Check if output in asm goto supported")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > Cc: Paul Walmsley <pjw@kernel.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: linux-riscv@lists.infradead.org
> > ---
> >  arch/riscv/lib/csum.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> 
> Thanks for catching!
> 
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
> 
> Since 4525462dd0db (v6.7) still supported clang-11: shall we add 'Cc: stable'?

I was a little on the fence about the 'Cc: stable'. On the one hand, it
is definitely a bug and it would totally qualify for stable. On the
other hand, nobody has noticed for almost three years and it is
exercising a new code path. I'll leave that up to you when you apply it
(or the RISC-V people can give their input as well).

-- 
Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

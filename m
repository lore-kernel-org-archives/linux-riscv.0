Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F527CA5FBE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 13:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=P4XC7RudMMDqCyuAg92qUK0BUABNsGSaDYs5JTV3BxA=; b=XtTze/uFARYYMIFD+eA7nFVHCB
	Ydg5YLKRY3xAieZuInRn01OjdFJ4DzPfAsUluO4ZCuDv7hG70ubzTpX2hwrhd185Aqk3Qu99mVjr/
	DFyokcEe6Tm05hpkWfk30czHiYItDnLyX4YuHxMZUT4vZ6R3hfZZR77MOQIZUSfz8b+7qYS3sjy8e
	kklROBZlCTzbyZJxHg32T+o6h4ooMtnMUe9WiTCsWIHWGrAvEf4elFDIGv+pVV1YON8x0K5WM8oCR
	oDII+vMeBI3WKvgJL59gl+7pt8gPjleN902Pihe5LrEtcRtdatEfriCuyWngaQG8EchbfGVii1Brp
	9zSwU1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuAD-000000066Yz-3FvT;
	Wed, 30 Sep 2026 13:16:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuAC-000000066YC-0lda
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 13:16:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D67BF43438;
	Wed, 30 Sep 2026 13:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFEB1F000FF;
	Wed, 30 Sep 2026 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774159;
	bh=RQq3zxbvW0CRQnFqL05jVxP61C6OM3COQRF4/hXrqf8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=l3zUeeHEKdk2aEmp7uvn3nUyTLjrPE1XFDsfNdoUtcqxI62UX7M6zQVb0vWwnzu8v
	 CUGbPyg7O0LHQfoNczEXawzM/XgjXSR9nyAKhfHBouxmtOvGSJjGloF0A9MHSG3ePQ
	 TlhaXMJFCjlU5b9AW4mKriU7FEfbBESwVAflWkL2yyyklbgWs25PD9mpSxXzVIqvDr
	 DA/7qM37EIeJj/plgdIX3+6BUAH44/+vUozW9IcaDOTgN9VlQ6DVraaOPvUn+sRX3U
	 5EjRCVeJ8LNp2gtFAivo/D2x0ihciFbkqHskchemOexBY+veJ74ub4AEa2RnHij8C6
	 8sAqjNEoc07tA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7891B198003A;
	Wed, 30 Sep 2026 09:15:57 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 30 Sep 2026 09:15:57 -0400
X-ME-Sender: <xms:iwu9asVpkuuQd-zSzBwYUXlvjydMWP9l1UeAcmwICvEGgj49DUXrMQ>
    <xme:iwu9arbaiAuoianQMsQiKHehH2ssN2G8q2qBJLqRp8-CeA56Yy5HJKkWJ56Ylmjdm
    Xjt_TJYgs7GGANBs4cxkYGkepab5pSlziCiXgHr6DjhNs2S2zYLFnw>
X-ME-Proxy-Cause: dmFkZTEeDmdMrlEwTtESmDsCIEznmr5i42EluG+14rMDU/Yf1Ka8K5mnopAhISDdZ7sgXE
    oSlOZfQqzwDyKV4jm6PRU/ECknr334Ik8NuS7WMF9o1NHXiToE5HUXPImIr9yVpMTHc4RU
    r8JS3rQbukBtma79z041uDfkXzo0Gofz7xDGdLqLSoGNebxH4QfJMGDlMgrr/hGLwOMaWy
    e1NCrptSJwHxyCIm2Iq8Ek2baDpL/cZRwIcs28hC60dAsh1mU+h7/1DJWUfyNFJXS9hkUh
    gO3PM22f0z9/Xo+9EO7xUz6wa3GjFQag7uowUy1983jPDbnkkHWLjtR3zRF6cJkHH3nKT0
    pMt56zLMfNIBbUqzYvYyapM5XQIJZojRQARBXiyNQuanTYBybCJDMtwJzYoyjvNrbQmffH
    BScGAOsmgpNKUHyKaPatz3fGMYPitCDm186hPALlm9L8HFhTxxl0hlObX+6pMGN1Nn2DYY
    8GCz6CyLK9wG+BTQAKzNU61AYqTC+8E6SaAuf2PUQqcl5JjDFhCHvfCnZRFh3yM3Jos3rf
    N6wGR+5AuPThs91Jp0jC074koUNtHuuDovyD7dx/d/elIHiVtq/CaPeVfnKBcX2gq9X6XD
    EuWjTLbIItm09JnLMHNoJRUWYYih6wXNITcF8J4BkCQViplkLW0MvyxubxUw
X-ME-Proxy: <xmx:jQu9ai3nKzQACpy9ShQYyykovrswdQCriH1AoY_TQy9NAeyv5N9JLg>
    <xmx:jQu9ahHal6yDuZPwenAlTiAMlgolL8GYu6uOx_aC_OBGW_nLVenXhQ>
    <xmx:jQu9atFvAjPEl-cNU9WvTiuEoxPH8Poy2f1p9CqcQVYuBlH3dxh7pQ>
    <xmx:jQu9ak5C3223rYJVT-S3Wq_cq7ZX8bFajz3Pdt-EMWr1N5koEkqQqA>
    <xmx:jQu9aiwkp6iheB0F8f3ipZEJNrwjRbgcxQFsdADoPZExx1IESrbXb0ao>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 7DCE5F80084; Wed, 30 Sep 2026 09:15:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 15:15:35 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, x86@kernel.org,
 linux-riscv@lists.infradead.org
Message-Id: <e357ed97-6098-49c1-b031-c4955c97a35a@app.fastmail.com>
In-Reply-To: <20260927224418.109759-1-ebiggers@kernel.org>
References: <20260927224418.109759-1-ebiggers@kernel.org>
Subject: Re: [PATCH v2 00/20] Migrate x86 and RISC-V accelerated AES modes into library
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



On Mon, 28 Sep 2026, at 00:42, Eric Biggers wrote:
> This series applies to v7.3-rc4.  It can also be retrieved from:
>
>     git fetch 
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git 
> aes-lib-x86-riscv-v2
>
> Patch 1 was already applied to libcrypto-fixes, but is resent to make
> this series applicable directly to v7.3-rc4 (ensuring that the Sashiko
> review runs).  Patches 2-20 are targeting libcrypto-next for 7.4.
>
> This series migrates the x86 and RISC-V accelerated implementations of
> the AES modes ECB, CBC, CBC-CTS, CTR, XCTR, and XTS into lib/crypto/.
>
> This makes the corresponding library APIs be properly accelerated on
> these architectures, while still accelerating crypto_skcipher as well
> (via the library-based code in crypto/aes.c).
>
> It removes a lot of redundant glue code, since crypto API boilerplate no
> longer needs to be duplicated per-architecture.
>
> Finally, it fixes the longstanding issue where these optimizations were
> disabled by default.
>
> In the case of RISC-V, this series handles all remaining AES code in
> arch/riscv/crypto/.  In the case of x86, AES-GCM is still left in
> arch/x86/crypto/ for now; it will be handled later.  Other architectures
> will be handled later as well.
>
> For various reasons, aesni-intel_asm.S (the x86-accelerated ECB, CBC,
> CBC-CTS, CTR, and XTS code that doesn't use AVX or VAES) is replaced
> with new functions written from scratch.  The other assembly functions
> are kept but are modified slightly for integration into the library.
>
> Changed in v2:
>    - Fixed 32-bit x86 bisection hazards by making aesni-intel depend on
>      CONFIG_64BIT earlier in the series.
>
>    - Fixed handling of lengths over S32_MAX in RISC-V CTR code.
>
>    - Restored selection of CRYPTO_SKCIPHER by CRYPTO_AES_NI_INTEL, since
>      it is still needed.
>
>    - Made the 32-bit x86 XTS code spill the tweaks to the stack rather
>      than to the destination buffer.
>
>    - Removed the no-longer-needed single block special case from the
>      RISC-V CBC-CTS assembly code.
>
>    - Made x86 CBC-CTS encryption and decryption share more code.
>
>    - Reordered the function parameters in aes-xts-avx-x86_64.S and
>      aes-ctr-avx-x86_64.S.
>
>    - Other miscellaneous cleanups.
>
> Eric Biggers (20):
>   crypto: aes - Fix undesired override of some optimized AES modes
>   lib/crypto: aes-xctr: Pass counter by value to aes_xctr_arch()
>   lib/crypto: x86/aes: Clean up aes-aesni.S in preparation for AES modes
>   lib/crypto: x86/aes-ecb: Add AES-NI optimization
>   lib/crypto: x86/aes-cbc: Add AES-NI optimization
>   lib/crypto: x86/aes-ctr: Add AES-NI optimization
>   lib/crypto: x86/aes-xts: Add AES-NI optimization
>   crypto: x86/aes - Drop superseded 32-bit build support
>   crypto: x86/aes-ecb - Remove superseded ECB skcipher
>   crypto: x86/aes-cbc - Remove superseded CBC skciphers
>   crypto: x86/aes-ctr - Remove superseded CTR skcipher
>   crypto: x86/aes-xts - Remove superseded XTS skcipher
>   lib/crypto: x86/aes-ctr: Migrate AVX-optimized code into library
>   lib/crypto: x86/aes-xts: Migrate AVX-optimized code into library
>   lib/crypto: riscv/aes: Copy aes-macros.S to library
>   lib/crypto: riscv/aes: Pass key struct to assembly code
>   lib/crypto: riscv/aes-ecb: Migrate optimized code into library
>   lib/crypto: riscv/aes-cbc: Migrate optimized code into library
>   lib/crypto: riscv/aes-ctr: Migrate optimized code into library
>   lib/crypto: riscv/aes-xts: Migrate optimized code into library
>

For the series,

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

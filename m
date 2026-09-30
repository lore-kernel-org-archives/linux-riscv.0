Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6CBCA5FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 16:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVV8RdQurPkgJS7n7ZasBCq/4lmCQDD7yf+TXM/DcZk=; b=vcH20SzvxnlWdV
	dx6XjpWiMMB0hL+RUVhfCOwRWR5KoLWPpDCxRifkygKPZXCMSlTT8qQH+ScYJx51atMJklXCe47Uv
	8dfTVJl7ZzUyw3vwoAHN7/ViHvgJrC590N/szuXxoSEJRrvxs7sg12Djy9A4WzY3Q0oXaimc2SMuk
	FFJWTcur2wCnLfB/BQjB8Wvaae3dPDr11x/TDsfXKokzcv2lAV9JEoFG+lCzTCmA1QiWUhO7kD8Z+
	iy7JMILavnAVmLDWXnDC8rEDFoNvDfT+SVatw0UEF2J+9cXiyjsq02C5JM1ZbnHRqIv5Bsx7YA6il
	MamEEMV638s9addJ/H/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxbV-00000006lRs-2Bwi;
	Wed, 30 Sep 2026 16:56:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxbT-00000006lQy-3zqa
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 16:56:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 47D1B40362;
	Wed, 30 Sep 2026 16:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9F01F0089B;
	Wed, 30 Sep 2026 16:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790787383;
	bh=MEt9F7bDmFpXzE8U3rYbOUl8S1E1YNzfSq4bi3U+m2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OiOhok8J4oOfwL2I0IK8JGcUqZT7PsmqQQudooDFm3wIPbZpTnqBZ2/wyH/cPCn+6
	 GSRa2o5JVLy5gxNJxy+rZKNMGYdYYsSLC3u1GbaOfcoefML7O546kycOhol/j7KGx/
	 maXCxYxaDs+ptjqCpqp2lS9FQVBaefVgHq6PUrFgkHM855P5bHtj1qOJUnORTV0rww
	 eCAzL5cgJEcDEQGW5QEpRHU0COps1i2YXUvuxt0urTVsdRR8o74rv97zcKDyioaP36
	 o0RgPA8rtMgiZwIHEZ995GOX/sUcDKiHRmWrxYmL6hVQwjpch7FbqDz0iKthyKWg0I
	 EJlCqgAkKLdiQ==
Date: Wed, 30 Sep 2026 09:56:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 00/20] Migrate x86 and RISC-V accelerated AES modes
 into library
Message-ID: <20260930165621.GC1904@sol>
References: <20260927224418.109759-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927224418.109759-1-ebiggers@kernel.org>
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

On Sun, Sep 27, 2026 at 03:42:51PM -0700, Eric Biggers wrote:
> This series applies to v7.3-rc4.  It can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-x86-riscv-v2
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

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

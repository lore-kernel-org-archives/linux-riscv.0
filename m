Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED11C369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 17:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nu7wT6swyytmdCf7rd223sHSPOkqkr0JiDQJK6jijlI=; b=l1alSk859rUxUl
	JbO9308Xw125qLRp4hQA9Sy7Ilv78m86HohTUymG4w65YStiqsj6RBontWHDegS3iKP5pTs3n6tgU
	mcKXVMox+oTkHICRIqtrmrj5HwbSMGYJNhL3faB0j3nE0mahguFnhHcN/0408BbMVM294jF3cutyG
	2icDAci1PJwuPkGT0xMYmxu4Gg6gq5LiPhknQL8BFXlqwd35Die52OMkw6b7kBkNSdPH/JBuUddtZ
	nQVnKgSO+ybrAcMk6lTVaA3LCKeJZHuK03Jn1nQ4CGjYgRx2DH1GbgMor9AwnkSp0J5sC6G/UxiDZ
	mFCUb7l0i9SQea/1+eDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oNg-0000000AMBT-0kOi;
	Tue, 29 Apr 2025 17:04:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oHI-0000000AKuw-34tu;
	Tue, 29 Apr 2025 16:57:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB9BC5C136A;
	Tue, 29 Apr 2025 16:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA3CC4CEEA;
	Tue, 29 Apr 2025 16:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745945871;
	bh=Tg1ctzwo0ak0Lwu1YWKgH+RS3fovIZ1X+v294BjOsH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfHRE0ZfOmDAVECATIVhnIIEDv8InpF/NVtbUFhMnpUd0U4Y+5b0Ww4zgRVL1MNmR
	 u8gCoUF2f9BknbD6Z34UXG4o4jeie06f9l37yhBS9hg7PyyZPh0t76hiNmFRLKGGi5
	 iEyi9z3gFBB3tX3cQpD1giyD3J3AvQz31/yIHy3BsfSa938ZSffUIHVakH6CrbbrdF
	 VDAjwRavumw/UONhO/E9zhOSkKcu9AG/KUZggezyKAUSbacO11GC7UHvJUwjFrcjyu
	 f0RJmP3EuGwQ5b0kiClDl4KQSZySaB5MQps8Q90qLLDnvzKrTossosvNsmID5DJOBH
	 TIWeglu12AohQ==
Date: Tue, 29 Apr 2025 09:57:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v3 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <20250429165749.GC1743@sol.localdomain>
References: <cover.1745816372.git.herbert@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1745816372.git.herbert@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_095752_876600_D1E8ECC6 
X-CRM114-Status: GOOD (  23.87  )
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

On Mon, Apr 28, 2025 at 01:17:02PM +0800, Herbert Xu wrote:
> Changes in v3:
> - Add shash sha256-lib/sha224-lib to provide test coverage for libsha256.
> 
> This is based on
> 
> 	https://patchwork.kernel.org/project/linux-crypto/list/?series=957558
> 
> Original description:
> 
> Following the example of several other algorithms (e.g. CRC32, ChaCha,
> Poly1305, BLAKE2s), this series refactors the kernel's existing
> architecture-optimized SHA-256 code to be available via the library API,
> instead of just via the crypto_shash API as it was before.  It also
> reimplements the SHA-256 crypto_shash API on top of the library API.
> 
> This makes it possible to use the SHA-256 library in
> performance-critical cases.  The new design is also much simpler, with a
> negative diffstat of over 1200 lines.  Finally, this also fixes the
> longstanding issue where the arch-optimized SHA-256 was disabled by
> default, so people often forgot to enable it.
> 
> For now the SHA-256 library is well-covered by the crypto_shash
> self-tests, but I plan to add a test for the library directly later.
> I've fully tested this series on arm, arm64, riscv, and x86.  On mips,
> powerpc, s390, and sparc I've only been able to partially test it, since
> QEMU does not support the SHA-256 instructions on those platforms.  If
> anyone with access to a mips, powerpc, s390, or sparc system that has
> SHA-256 instructions can verify that the crypto self-tests still pass,
> that would be appreciated.  But I don't expect any issues, especially
> since the new code is more straightforward than the old code.
> 
> Eric Biggers (13):
>   crypto: sha256 - support arch-optimized lib and expose through shash
>   crypto: arm/sha256 - implement library instead of shash
>   crypto: arm64/sha256 - remove obsolete chunking logic
>   crypto: arm64/sha256 - implement library instead of shash
>   crypto: mips/sha256 - implement library instead of shash
>   crypto: powerpc/sha256 - implement library instead of shash
>   crypto: riscv/sha256 - implement library instead of shash
>   crypto: s390/sha256 - implement library instead of shash
>   crypto: sparc - move opcodes.h into asm directory
>   crypto: sparc/sha256 - implement library instead of shash
>   crypto: x86/sha256 - implement library instead of shash
>   crypto: sha256 - remove sha256_base.h
>   crypto: lib/sha256 - improve function prototypes

To be clear, the objections I have on your v2 patchset still hold.  Your
unsolicited changes to my patches add unnecessary complexity and redundancy,
make the crypto_shash API even harder to use correctly, and also break the build
for several architectures.  If you're going to again use your maintainer
privileges to push these out anyway over my objections, I'd appreciate it if you
at least made your dubious changes as incremental patches using your own
authorship so that they can be properly reviewed/blamed.

Please also note that I've sent a v4 which fixes the one real issue that my v1
patchset had: https://lore.kernel.org/r/20250428170040.423825-1-ebiggers@kernel.org

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

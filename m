Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CC2CC6B19
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 17:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47sUtB+b6TRBCfNhzvUb5ywUta+D82dY63aQSQthQWc=; b=zfp2ieOBs/lj7Q
	ybKofUnLZeIogfP5du/5Nb5B3Sk8N4ML5/qZJ4lCKBtsqBUG7Hu3GcFHXgTSlx09PvhZoTPAQQJkT
	RBQ39q/fkxTDr1KndmZPgLCgcD5fJiT69U/6q5MN/GTaUTQLhNq6HE5XaZ6MliOCmHaSy8OXzh0wL
	JbIkJxaWO+oLEFb/3KQ7h3wtpuXnWEs1OU84JYUo7tDIqcYovxSBSpwoouIxXspjfOmxTfu2xGDvB
	zSF1KBPwnBgFyf+ZheLRimVI6lz0ievtUROE28B6MJh2slkxGQhy2EuA1z/KOIZYobR8IPKKO123A
	tv2ydW87ZFUrtPlHohgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgPK-0000000Di6B-1Ij6;
	Tue, 13 Oct 2026 17:35:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgPI-0000000Di5b-2i11;
	Tue, 13 Oct 2026 17:35:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0601F60A56;
	Tue, 13 Oct 2026 17:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A9A1F000FF;
	Tue, 13 Oct 2026 17:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791912919;
	bh=khTJvLKv/+vOyw+yWXKAIK2ePXBBTi6nmBmOdNZF1bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oMqQOCXCThSpiERo+J2ssNIxZSBPR/i04TI56b3HPg93nuwHeSySq6TcZ+W9B1BfO
	 9JQNaL3PM0yzxFAH99mc2X7kX0kSJpIO5Y3okHhq1lczj08fcEv+p2vf4JZLI1T1YO
	 lAmDVAze1RHqnVkLHe6WMw/h0GfYZSWLrzxk6DFWGF1Hg3CPMSvnzL99N9X+0H04Td
	 4oVhwjTzTiV/Qr649AhK3Km50FccntIee9ZJyRCBHtfZJv12rnAS+YujVVmsDf3Sbd
	 V210kbDPOhUDUexFzYUrkL75BsdSI7pTnaTPXm++NPfvhlhWKMZTwBjqAKJhVNEH8s
	 WRObtjnrJ5j8A==
Date: Tue, 13 Oct 2026 19:35:08 +0200
From: Eric Biggers <ebiggers@kernel.org>
To: vladimir@genproof.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 0/5] lib/crypto: Handle large lengths in poly1305 and
 chacha20poly1305
Message-ID: <20261013173508.GB3830@quark>
References: <20261012-libcrypto-4gib-lengths-v1-0-ea566c129a2e@genproof.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012-libcrypto-4gib-lengths-v1-0-ea566c129a2e@genproof.com>
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

On Mon, Oct 12, 2026 at 09:31:17PM +0000, Vladimir Kukharenko via B4 Relay wrote:
> This series makes the Poly1305 and ChaCha20-Poly1305 library code handle
> large lengths:
> 
> - poly1305_update() can write past its 16-byte buffer if it holds a
>   partial block and nbytes >= 2^32 - desc->buflen.
> - The chacha20poly1305 functions use only the low 32 bits of their
>   size_t message and associated data lengths.
> - On 64-bit MIPS and RISC-V, the poly1305 assembly reads past its input
>   for lengths of 2 GiB or more: these ABIs sign-extend its u32 length
>   argument, and the assembly uses all 64 bits.  arm64 has the same
>   prototype mismatch, with no known failure.
> 
> Patches 1-3 fix the assembly prototypes, one architecture per patch.
> The assembly already treats the length as 64-bit, so they declare it as
> size_t, as commit f3d6cb3dc039 ("lib/crypto: x86/sha1: Migrate
> optimized code into library") did for the x86 SHA-1 assembly.
> Patches 4 and 5 make poly1305_update() and chacha_crypt() take size_t
> lengths.  The patches apply independently, except that on 64-bit MIPS
> and RISC-V patch 4 relies on patches 1 and 2 for inputs of 2 GiB or more.
> 
> No in-tree caller passes inputs this large (WireGuard passes at most one
> packet, big_key at most 1 MiB), so I consider these ABI robustness
> improvements rather than fixes and have not added Fixes or Cc stable tags.
> 
> I tested with the lib/crypto KUnit suite on UML, x86_64, i386, arm64,
> riscv64 and mips64, with a temporary 2 GiB KUnit test on arm64, riscv64
> and mips64 (it oopses on riscv64 and mips64 without patches 1 and 2), and
> in userspace against OpenSSL for inputs above 4 GiB.
> 
> I found the bugs fixed by patches 4 and 5 while writing Coq/VST proofs of
> this code with LLM agents, and an LLM review of patch 4 found the one
> fixed by patches 1-3.  I used an LLM-based assistant to write the patches
> and descriptions, and reviewed its work.

Thanks!  Patches 1-3 look good.  I'm less sure about patches 4-5, since
they go through some trouble to work around (some implementations of)
poly1305_blocks() and chacha_crypt_arch() not taking size_t.  Wouldn't
it make sense to convert those to size_t at the same time?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

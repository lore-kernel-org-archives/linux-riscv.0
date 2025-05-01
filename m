Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704F7C369D9
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 01:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GamI+iIYPCo2flsQUpq/ygcubyTVPCPNI1HHEgbcTk=; b=0bAysQ/8amAE24
	t8dusgruMISW+7yKzU7ccktK4u0sEmwZQFm9ueVYHtkiasnLr5aE1BzwwjgWESdtCHl8nsS6FUSKY
	KR3Uv/6eyOS52QatF9OxcCrOenF2MouPnhXhTu5zzNAq4V+rUeG6xJzhssHgTbhQztgU7okgbGc8I
	pWpttU3iOZ81ZGkUf2qh1cNqY7LTSLQY4egu51Q25tRnxjqsSgP8uXk7NLDNkunnK68DnlTbG9Oyt
	JEpr9Jx0Onf7FTjWP4ai9/VqT2R/LziDTEtbiGZtiVtDswnPvcoybrgibrqhZ96JKc3ehQWGh27wa
	aK4IMses3wvmfjegwnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAIe5-0000000ENDk-0727;
	Thu, 01 May 2025 01:23:25 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAIc7-0000000EMzJ-2cQB;
	Thu, 01 May 2025 01:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NW5f/6zfXSJgSFBDpq9nG7FU/uxSqKRQHQ8TMd0Poy8=; b=a/NlvQqOeoRlesedjZn7kxOnFw
	uv4a9xzHl7D1VZeIL93rjMMAkhe5hxqE4x0m2n/FWDvbWRvtAX99hxnOhhW6vCIjzXO0BHZ3lqJM5
	RB9c0EnDFbkQGKZre/Y99u6FTj0aU0AbJGl20o5hnmiDJvj7wFkXsXvZtugU3t3vxsaSBA7xX9NFz
	wK8MiCgvwE6zOyaFZ4PnOSV/LXOZB/7xN/Nq+7ZCdajE/MnuryS2PJCBO8luW8qV3BFecbN+Fs9Ot
	Cw+tw3zJmJw9KzUB2KECxEtcp23uuxyS5Q/PBLXt9Z81aTgSodFT60Fy0hM+6eWtxA0rVUI0j3R7q
	BRzxY+2w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uAIbz-002Qsc-2M;
	Thu, 01 May 2025 09:21:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 01 May 2025 09:21:15 +0800
Date: Thu, 1 May 2025 09:21:15 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 00/12] crypto: sha256 - Use partial block API
Message-ID: <aBLMi5XOQKJyJGu-@gondor.apana.org.au>
References: <cover.1745992998.git.herbert@gondor.apana.org.au>
 <20250430174543.GB1958@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250430174543.GB1958@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_182123_659921_276E4696 
X-CRM114-Status: GOOD (  12.86  )
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

On Wed, Apr 30, 2025 at 10:45:43AM -0700, Eric Biggers wrote:
>
> As for your sha256_finup "optimization", it's an interesting idea, but
> unfortunately it slightly slows down the common case which is count % 64 < 56,
> due to the unnecessary copy to the stack and the following zeroization.  In the
> uncommon case where count % 64 >= 56 you do get to pass nblocks=2 to
> sha256_blocks_*(), but ultimately SHA-256 is serialized block-by-block anyway,
> so it ends up being only slightly faster in that case, which again is the
> uncommon case.  So while it's an interesting idea, it doesn't seem to actually
> be better.  And the fact that that patch is also being used to submit unrelated,
> more dubious changes isn't very helpful, of course.

I'm more than willing to change sha256_finup if you can prove it
with real numbers that it is worse than the single-block version.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A89AF46127
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UcDnSeyf7UFWuLLLq0/qduk5XWOcZwKxH5/d1bv7XR4=; b=pjCe3w+ljl0nccvilXh8ql57Sl
	A3ttgKLZJnAYSZT1Z0g5BGirT8WyvpEUf2mZtFKwxAdtwzn8AkKrJNx7QhfLoXgwIOOLNDDz/+Xp9
	nAiOePa45dI2B1w9A43fl46MJ/ikD/v/eshTZW4nk2I5B/HJmJUQvGUq6I3/Pf9vl8vqFu4mVQIwd
	b4UmLZ8pUBNhiOThM+cnD/7+b8kxiQAggE6gZ3nbH0GgCHjJkNpBlCkZQemNteKWJo79+4zbs8/V2
	jvThK7cv+AFdB0v563NCLgXZQ0Z/F3X37Bl6acD1CMJcHdyYXANBkUQElSGDfGwKBRfD6gpe6zSm8
	5czeBdbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4g3P-0000000GuN4-46Vb;
	Mon, 23 Mar 2026 14:14:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4g3N-0000000GuMF-1djD
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 14:14:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71A0340B92
	for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 14:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27963C4AF0B;
	Mon, 23 Mar 2026 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774275288;
	bh=zGq00IgPWGqL77FNM/dQDXciY/ZegFndCC/oogZLb50=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=VD+7uq5UXsEy8tNVFYT36WoWcxC5JMBFOnJ+L9HEkEnM0z6S/HfXSoZQVD//wu9Ie
	 f9sJ4gTawj6Ah/1+hUkmtsWF9R2zkXz3eJ71prGWrSzKGd1O/NT7QjgujxXCWPKCqh
	 zVKBmyBrtUvIU9Ln6txHl9rDaFI1p5ToCPN5eYpgXaRNiLW8n4bfYqXdKZbuHzE5O2
	 14dZcjAHUXQ+gJdclGr+UcXsTvOk42J5nCljFdQlPIvi44WozTrh8BUE1OZdWLPvSq
	 27WrtBpqSzgdOGnPbIoWyIdItrUaOZpje09PI14YTFKuHK09i7qPuueeqaDogRoeJb
	 A1hQ40hS6LSbQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3F978F40072;
	Mon, 23 Mar 2026 10:14:47 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Mon, 23 Mar 2026 10:14:47 -0400
X-ME-Sender: <xms:10rBaTv_Pd_A-6ULzONqAVkXr_4MPD196GJQz7buHXkZltg2elmcnA>
    <xme:10rBafSBpxD0TQpOy3v6fz6LszqG4ATc9EgRBSwWtvJFKnnfSZzivlf_y50klwR7H
    3oxwI_6gxh5kL4_IKY0-9ba_-MkCP2UlYjMfD_Qupk4et9tdTn7pIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefudekledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekvdffkefhgfegveekfedtieffhfelgeetiedvieffhfekfeeikeetueeg
    teetteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    epudenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    uddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhvghrsggvrhhtsehgohhnug
    horhdrrghprghnrgdrohhrghdrrghupdhrtghpthhtohepvggsihhgghgvrhhssehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdho
    iihlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigqdgtrhihphhtohesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsfeeltdesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:10rBaaGFLpYPkAFfUe8s0LClJL3yg-uQETj-BtW8AqxvXx6wa2LZzg>
    <xmx:10rBaTddSLdwcMNXVRXjM4NOTdJ0Yp4OCdaOBzuRMvdTf4x8LPKDhQ>
    <xmx:10rBaToo3Hfc96ZpYYeSgQ4Ytoz773zh1Qah3jH8yRPdejjOuCDUjw>
    <xmx:10rBaUC7w4iSDgVcJNhWvQ5nPUUZu2cGhbIyUbKyYqGgX6UzBq8tRg>
    <xmx:10rBacdbgrEXFbvY5AtS0DCzs3ou6S5NjToMUix-kf4qn8fY0dEhuwF7>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1A234700069; Mon, 23 Mar 2026 10:14:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Aux1nparIO0F
Date: Mon, 23 Mar 2026 15:14:25 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org
Message-Id: <2e95891e-442f-4360-a6b0-7715151a2658@app.fastmail.com>
In-Reply-To: <20260319061723.1140720-1-ebiggers@kernel.org>
References: <20260319061723.1140720-1-ebiggers@kernel.org>
Subject: Re: [PATCH 00/19] GHASH library
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_071449_471554_6B451E4C 
X-CRM114-Status: GOOD (  17.43  )
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



On Thu, 19 Mar 2026, at 07:17, Eric Biggers wrote:
> This series is targeting libcrypto-next.  It can also be retrieved from:
>
>     git fetch 
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git 
> ghash-lib-v1
>
> This series migrates the standalone GHASH code to lib/crypto/, then
> converts the "gcm" template and AES-GCM library code to use it.  (GHASH
> is the universal hash function used by GCM mode.)  As was the case with
> POLYVAL and Poly1305 as well, the library is a much better fit for it.
>
> Since GHASH and POLYVAL are closely related and it often makes sense to
> implement one in terms of the other, the existing "polyval" library
> module is renamed to "gf128hash" and the GHASH support is added to it.
>
> The generic implementation of GHASH is also replaced with a better one
> utilizing the existing polyval_mul_generic().
>
> Note that some GHASH implementations, often faster ones using more
> recent CPU features, still exist in arch/*/crypto/ as internal
> components of AES-GCM implementations.  Those are left as-is for now.
> The goal with this GHASH library is just to provide parity with the
> existing standalone GHASH support, which is used when a full
> implementation of AES-GCM (or ${someothercipher}-GCM, if another block
> cipher is being used) is unavailable.  Migrating the
> architecture-optimized AES-GCM code to lib/crypto/ will be a next step.
>
> Eric Biggers (19):
>   lib/crypto: gf128hash: Rename polyval module to gf128hash
>   lib/crypto: gf128hash: Support GF128HASH_ARCH without all POLYVAL
>     functions
>   lib/crypto: gf128hash: Add GHASH support
>   lib/crypto: tests: Add KUnit tests for GHASH
>   crypto: arm/ghash - Make the "ghash" crypto_shash NEON-only
>   crypto: arm/ghash - Move NEON GHASH assembly into its own file
>   lib/crypto: arm/ghash: Migrate optimized code into library
>   crypto: arm64/ghash - Move NEON GHASH assembly into its own file
>   lib/crypto: arm64/ghash: Migrate optimized code into library
>   crypto: arm64/aes-gcm - Rename struct ghash_key and make fixed-sized
>   lib/crypto: powerpc/ghash: Migrate optimized code into library
>   lib/crypto: riscv/ghash: Migrate optimized code into library
>   lib/crypto: s390/ghash: Migrate optimized code into library
>   lib/crypto: x86/ghash: Migrate optimized code into library
>   crypto: gcm - Use GHASH library instead of crypto_ahash
>   crypto: ghash - Remove ghash from crypto_shash API
>   lib/crypto: gf128mul: Remove unused 4k_lle functions
>   lib/crypto: gf128hash: Remove unused content from ghash.h
>   lib/crypto: aesgcm: Use GHASH library API
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

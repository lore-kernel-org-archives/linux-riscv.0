Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83477F46122
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=714Dl0IG0MaeVw+dQcjm5KjM+OVLl1rmE84fa9QKjR8=; b=ubKt3ri+WuZ5xaNwZ3c/wI3xqL
	kgD9VTDGr93vVnDw7mG2OqLS7tNu9aFJ3qCcXytTL/3vyuj6TNjai7ewmiArOxsdFQICf0e0cGo0H
	pDA+cujYbGqd2mbsrUyrNMM3IwLWVoOdF/thbuBEEx3iklemC1U4fZgcYc7g2t18nDrzWcJrGeyaH
	hqw5vCZk1SDDwnAJMGBcQNFmirtlXTZ51BFSJ7XFlk0kAo8uatRDlpZBIeZEUkV656fQw3XB3mef7
	r5BdDs/3q4eQR1TuFok5c4D5lj4lyERbcU689Eh7G3i0QlzMRHxwAvGHwFRjjS/728PXNKXN5hLxo
	PE04uB1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4g2T-0000000GuAc-1vOt;
	Mon, 23 Mar 2026 14:13:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4g2S-0000000GuA8-0ckI
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 14:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87B3C60130;
	Mon, 23 Mar 2026 14:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3501C2BCB3;
	Mon, 23 Mar 2026 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774275231;
	bh=WV9/8Y9Hrj0u/n0KxmeX/KThci2cUIx/HlMaJ7Ikq/0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=gw864Nq8A8x0B7oVzEoTKd4osVd+NbMgvhsaJj1ek8d6Mp9NpH/FW2K7+DleIHDTM
	 xd56q+WtMuDWuvfZeD5mo+YAnSWA4yekxWo3NKgedd/OB1jAF2//E1+7zQZa3VLc5R
	 dhUgsrZP78t3N6bE0ESR+3zScgzyhJ0ftf6om5xxm8qfBtIU2umOPLvsMqy4ERwGcs
	 h5SnFZXq+szrkzVpCOUKMHL4LSZIFV+u5vob3ydky31dzG4bIyPdE+dwZmWqzcNuLG
	 OJsiC6A2XDI2ouyMGuzJtZ5f71Azma4ufNA6HoIOy8SO+BJpj9MbOn4T8/Ethob6yI
	 EXPLT6aS/Hqsg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id F1681F40072;
	Mon, 23 Mar 2026 10:13:49 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Mon, 23 Mar 2026 10:13:49 -0400
X-ME-Sender: <xms:nUrBadC1_OtdHwg2b6gpiQ4aeHfv45Jy8mJT-MwRJkLVX-fyHOuXuQ>
    <xme:nUrBaWUdQV2rQedujW13Zmu6kmWLANVBh2FfvwxlsMP5pnua1SEpZOuyfYLEAxnFx
    juCfB5dbK4IqV3QSj0_2_e7qK547kRbxlHXKIbkfovwkp__JbWWfBs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefudekledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekvdffkefhgfegveekfedtieffhfelgeetiedvieffhfekfeeikeetueeg
    teetteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephhgvrhgsvghrthesghhonhguoh
    hrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopegvsghighhgvghrsheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epthhirghnjhhirgdriihhrghngheslhhinhhugidrrghlihgsrggsrgdrtghomhdprhgt
    phhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvg
    grugdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqtghrhihpthhosehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrshhonhesiiigvdgtgedrtghomh
X-ME-Proxy: <xmx:nUrBaXO-P4p3-OW8sf0muUIQFxDsvyAThoJKUkCSXK5UMh6io_XVuQ>
    <xmx:nUrBaamskWWmfCaRs7Y-9MqXRtV5Y757z4swSogQQU2rcj2TJjqD3Q>
    <xmx:nUrBadss19Agzva72orfrm8YFKQULnCmpzw12XdXqsGMoDMek8NtQQ>
    <xmx:nUrBaVr2mVFtmeJGXKIMuC02yXKbginljF4UVrXZIzA0YohOzh9jdQ>
    <xmx:nUrBaTcrDPYzX39cxxGGcF5xdTSNjIO6RFr_hvSaKxGzHV1_xJ1j7B-_>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CD248700065; Mon, 23 Mar 2026 10:13:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AHn2Hf40_V7R
Date: Mon, 23 Mar 2026 15:13:29 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "Tianjia Zhang" <tianjia.zhang@linux.alibaba.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 x86@kernel.org
Message-Id: <a51e6947-9767-4dda-8a66-a157fdd79f25@app.fastmail.com>
In-Reply-To: <20260321040935.410034-1-ebiggers@kernel.org>
References: <20260321040935.410034-1-ebiggers@kernel.org>
Subject: Re: [PATCH 00/12] SM3 library
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



On Sat, 21 Mar 2026, at 05:09, Eric Biggers wrote:
> This series is targeting libcrypto-next.  It can also be retrieved from:
>
>     git fetch 
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git 
> sm3-lib-v1
>
> This series cleans up the kernel's existing SM3 hashing code:
>
> - First, it updates lib/crypto/sm3.c to implement the full SM3 instead
>   of just SM3's compression function.
>
> - Next, it adds a KUnit test suite for the new library API.
>
> - Next, it replaces the "sm3-generic" crypto_shash with a wrapper around
>   the new library API.
>
> - Finally, it accelerates the API using the existing SM3 assembly code
>   for arm64, riscv, and x86.  The architecture-specific crypto_shash
>   glue code for SM3 is no longer needed and is removed.
>
> This should look quite boring.  It's the same cleanup that I've already
> done for the other hash functions.
>
> Note: I don't recommend using SM3.  There also don't appear to be any
> immediate candidate users of the SM3 library other than crypto_shash.
>
> Still, this seems like the clear way to go.  It's simpler, and it gets
> the hash algorithms integrated in a consistent way.  We won't have to
> keep track of two quite different ways of doing things.  With KUnit the
> code becomes much easier to test and benchmark, as well.
>
> Eric Biggers (12):
>   crypto: sm3 - Fold sm3_init() into its caller
>   crypto: sm3 - Remove sm3_zero_message_hash and SM3_T[1-2]
>   crypto: sm3 - Rename CRYPTO_SM3_GENERIC to CRYPTO_SM3
>   lib/crypto: sm3: Add SM3 library API
>   lib/crypto: tests: Add KUnit tests for SM3
>   crypto: sm3 - Replace with wrapper around library
>   lib/crypto: arm64/sm3: Migrate optimized code into library
>   lib/crypto: riscv/sm3: Migrate optimized code into library
>   lib/crypto: x86/sm3: Migrate optimized code into library
>   crypto: sm3 - Remove sm3_base.h
>   crypto: sm3 - Remove the original "sm3_block_generic()"
>   crypto: sm3 - Remove 'struct sm3_state'
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

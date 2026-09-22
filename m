Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55C0C982FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 05:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyK2rUFvHAkzV4+RwHdvpH9VjmToGiGMfzUFPgbETUc=; b=GEalRqo4fl+Ivw
	r+juM8xDZJa2At4ZuB9IgHz1md7Zk20ELXRg/IkFdKlqYFUlmqDt2jh2mFLQTEzxLHGhZqJ9PObsk
	3ydJIyxzleWTHjxSSXZygD11Ing21dgf9jnJtpYNk+DtP9obS9bKpNFaKTC0n4SR/cvfu7zkJF3aq
	0HoR/wFfWBkHG+i5ypqGLrrDkUNCLdI0N7pq4PQtlGT1MT4ysZtiSqTMuvSNvyttjDNXitYODNjAB
	rNvu9+OXyeB7dBWN45IEst57npkhmlrAbUB1J84MaTBJ1pQqTaHB6kn41NGGERJLq0UcLCHIMhrn5
	44WVFTr1vWuaAiv4Unow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tQa-00000004IDR-0ObJ;
	Tue, 22 Sep 2026 05:52:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tQY-00000004ID6-2pUj
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 05:52:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 288AC43A9D;
	Tue, 22 Sep 2026 05:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD0B1F000FF;
	Tue, 22 Sep 2026 05:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790056346;
	bh=As/vxWHhNUub4BNZFQs2kxwfn6UV/YUfsSwsyKwBmlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FaTu2i+cS6F1a22YBgrRwP8TZ2qw9lyDsKZS7rCNunFtfJAlUg1FiMFL/8BXK6q/a
	 KbDZBr3B8LU3/SKrjrOKMa1s9XlzFRjCGY6UsJq93yUqxY8nAl/ClB3wOo5mRksSwH
	 89MnV4VcrllnxwvfJQAjFqVHNhLgemjNZ+wis+GrKUvboCCupVsAQji9vfrsGf9sP4
	 CL6fhkpfyfOrt6Dp+8K/eqdwKthIVPENtHT69FVuWHUYiYNnEsnD+bZQ8h7Yg7J+Rn
	 KOhgD2e5pCR7YUlkNWEwXlaBngtksHLyUxV8UGxCDXrWZyTSWThkStdSjyBe35ExzM
	 PhPwnPp+wTFSQ==
Date: Mon, 21 Sep 2026 22:52:24 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 19/20] lib/crypto: riscv/aes-ctr: Migrate optimized code
 into library
Message-ID: <20260922055224.GC14616@sol>
References: <20260921050910.296144-1-ebiggers@kernel.org>
 <20260921050910.296144-20-ebiggers@kernel.org>
 <20260922054401.19194-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260922054401.19194-1-kmehltretter@gmail.com>
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

On Tue, Sep 22, 2026 at 07:44:01AM +0200, Karl Mehltretter wrote:
> On Sun, 20 Sep 2026 22:09:05 -0700 Eric Biggers <ebiggers@kernel.org> wrote:
> > -// void aes_ctr32_crypt_zvkned_zvkb(const struct crypto_aes_ctx *key,
> > -//				    const u8 *in, u8 *out, size_t len,
> > -//				    u8 iv[16]);
> > +// void aes_ctr32_crypt_zvkned_zvkb(u8 *dst, const u8 *src, u32 len, u8 iv[16],
> > +//				    const struct aes_enckey *key);
> >  SYM_FUNC_START(aes_ctr32_crypt_zvkned_zvkb)
> 
> isn't this a sign extension problem on rv64? The psABI sign-extends
> 32-bit args, so for len >= 2G a2 comes in as 0xffffffff8xxxxxxx, and
> the asm uses it as a 64-bit length as is.
> 
> That would run off the end of both buffers.
> 
> Nothing passes that much in one call today, but aes_ctr_arch() only
> chunks down to 0xfffffff0 and aes_ctr() takes a size_t, so it is
> allowed. The old prototype was size_t and the caller zero-extended.

Yes, Sashiko found this too.  I'll probably make the assembly function
continue to take size_t.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

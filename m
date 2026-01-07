Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F159FCF6BEA
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 04:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqvfguGMRjTQpsM/kXKaaKBr0FsU7EMhR2qwDpIDMR8=; b=PajuLuYdQ/MLCC
	cHuDzFDK/XmzkYfT7s8E0lHSnrLxMC+5ywEGs2kGjTyRxqxYs8WEDbatYa9Ps+iGw6aqqkO7uKOIW
	H32gtJC9HcV5yl/WWuip0xlr1LcIpos9TlmqoIhA2G0xB+VlPq+hpVWkv5Q2Xuh63YOpTI0pTWgi8
	gwB4SO6bZoW3Qradj+I/U3D1+ftUTCpmWdaurT0GSVi8QQ/v6/oJSv49wHIlewdubC2YFF5uinqsf
	z5KZKV2wFNtORSqTGMhCV4NffU33m7a/hmPU0YqiJw3uB8orNE2ZMMj9tE7VSCHPTFkkvPwfABTZ+
	SEyw8cKr2JXLcOMSMyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdKk4-0000000E8uj-1TiQ;
	Wed, 07 Jan 2026 04:01:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdKk2-0000000E8uT-0teC;
	Wed, 07 Jan 2026 04:01:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38EF960007;
	Wed,  7 Jan 2026 04:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3E2C4CEF7;
	Wed,  7 Jan 2026 04:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767758508;
	bh=pzuDTI1gGeG5Smd+gX1gaxHlzMDNl358rd8Qrwf1tqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7u/AAYT3DDEUXzlTMGjqZuODkOKrqMuB9CcWWnECwJA8nhYty4M3NEe4VKElptV2
	 eGGGvgXAHnfGpC43Cofx6mA0tHqObs3mTQeRxkriecrKIxi1mBUL8I2Kfpo6FR+fnX
	 BeqLvKAFPHraFwq3GT2AswyWHkWVv/KYfbBi6xqXwW3+AwM/XCLWXwk3sM4kkY13CZ
	 1UnjB+Z2DT2LjzeUvp14Siz8RA606HwynIlEGPAWB5gSeTXswi5YEYTKJZXUhzUohP
	 KTTtdS4vQ8wiIHUbm6MfVPEndmvnAyhVGNc5aQQ77O+H8+/xB0DWa/LbwJOpZ7Ae/v
	 wkVi0bNORnAoQ==
Date: Tue, 6 Jan 2026 20:01:28 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH 30/36] crypto: inside-secure - Use new AES library API
Message-ID: <20260107040128.GC2283@sol>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
 <20260105051311.1607207-31-ebiggers@kernel.org>
 <20260107034834.1447-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107034834.1447-1-dqfext@gmail.com>
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

On Wed, Jan 07, 2026 at 11:48:33AM +0800, Qingfang Deng wrote:
> On Sun,  4 Jan 2026 21:13:03 -0800, Eric Biggers wrote:
> > --- a/drivers/crypto/inside-secure/safexcel_cipher.c
> > +++ b/drivers/crypto/inside-secure/safexcel_cipher.c
> > @@ -2505,37 +2505,35 @@ static int safexcel_aead_gcm_setkey(struct crypto_aead *ctfm, const u8 *key,
> >  				    unsigned int len)
> >  {
> >  	struct crypto_tfm *tfm = crypto_aead_tfm(ctfm);
> >  	struct safexcel_cipher_ctx *ctx = crypto_tfm_ctx(tfm);
> >  	struct safexcel_crypto_priv *priv = ctx->base.priv;
> > -	struct crypto_aes_ctx aes;
> > +	struct aes_enckey aes;
> >  	u32 hashkey[AES_BLOCK_SIZE >> 2];
> >  	int ret, i;
> >  
> > -	ret = aes_expandkey(&aes, key, len);
> > -	if (ret) {
> > -		memzero_explicit(&aes, sizeof(aes));
> > +	ret = aes_prepareenckey(&aes, key, len);
> > +	if (ret)
> >  		return ret;
> > -	}
> >  
> >  	if (priv->flags & EIP197_TRC_CACHE && ctx->base.ctxr_dma) {
> >  		for (i = 0; i < len / sizeof(u32); i++) {
> > -			if (le32_to_cpu(ctx->key[i]) != aes.key_enc[i]) {
> > +			if (ctx->key[i] != get_unaligned((__le32 *)key + i)) {
> 
> "key" is big-endian. Casting it to __le32 does not seem correct.
> Did you mean "get_unaligned_le32", which also convert the endianness?

No.  Previously, in this driver the 32-bit words of the AES key went
from little endian in their original byte array in 'key', to CPU endian
in 'aes.key_enc' (via the get_unaligned_le32() in aes_expandkey()), to
little endian in 'ctx->key' (via the cpu_to_le32() in this function).
Note that ctx->key is an array of __le32.

Those two conversions canceled out.  So I've simplified it to just grab
the little endian words of the key directly.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

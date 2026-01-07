Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD33CF6BE9
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 03:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbWWRP55Ju+sKvjme/iJdUgZEcC6k7FQxNKl2xKOtSU=; b=hGznzZ1ABIkITW
	8waa7wVvLJENTTTbvsXWfCIstIaEPp2bps9isQcowtfUJWbopIJqJJCPDN7qh8yGgWmnTLFw6qT+S
	+mtCgF01maww44IoOP7DwVR74cw06K3Rsix119rD80rFMpQXzcU0gY4GiybAFOyLgUeG6RQuQjreO
	6vQHdOAGpSa55W1KNYEBs50rbxT7JhQNSl/bCxMR5wReuK3MAKsh7QAF66hoAcuOp4vcLLaPv45Qg
	VdAO7bBEQ1Y6+jet32OHBakhou85s2VmlrgRFHjHEOK5Kx8A8kMvEuu4VpxasjNpbCKefCQa5sex/
	phfX8+dfBdce7HRgsBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdKXS-0000000E8RV-2vX5;
	Wed, 07 Jan 2026 03:48:50 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdKXP-0000000E8Qk-2p9k
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 03:48:48 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2ae61424095so982236eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 19:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767757726; x=1768362526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVfOOsMtVesahSpJ7NzEZB2a7bFJ+2QiFmRNgCZu9gM=;
        b=ZwLzwL7hKjF72Owe+M5yKpO3lYU4Vuw/BoU9nu9UYcaOYi9SWdAvDuEtoyUmPTrCV8
         gRka6/wsEmzUgqXpB8d1huq23pa+3gQHGbEahh+L2dxr+zdjDmBdFufTMbYCigP1K+Sy
         T/SQ/sncr3OTxx/IgSnx2mswj3KJ7JZ31qetMXmZXv4loeH+kawcn7SdyW96/KIJczzy
         WDPpnd5jBltDeJ+2oZqGvtTmZosLUhYbfMGE4+sWDzU72fYFmfs+benzAUGMrvTW2Cup
         chLaJAalrpRm5x9EwRJt2oVmZXc6AgD0aLDyxEDr95HU8lYqQ2hZO20OuzceGIlNiloL
         mRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767757726; x=1768362526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lVfOOsMtVesahSpJ7NzEZB2a7bFJ+2QiFmRNgCZu9gM=;
        b=wlPnwhprKEGpXFNIOo4gvLyJaLeoDKps1+gBufOzH/AmCM8qH9uwNBqfLqeQs+x6zX
         DwhlI9oTW7EMjtrTvZibOHFif4aEyyKQInfIy254oDZJpnFAFbXIZQqiJ7Ff5TvzV+Zd
         73HER/1LEhZ9QAGNtCr/Aos/QYuxo0w2WCE70VwmMdhn+kHM46jhSfMnKeoQiPba926B
         /XePSKaPr7MuBchw7OSaFlm/BS6tvCC8x2XI5JJQ6yJM6T732d2J3Bgawv03OYmgbg0W
         +1RPFvyFKNhA3JECtUuxV9G0/v3QLKncvDyLRo3Cnl18eSZanrgRabxHac2twzEp6EOv
         AzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg8VKC+wD+XdzvbS2Y/2fVqlc5lfwx8Ke/YuHqDc8P7PQGkI7c4DlW21NhGAUypH8lYrkYAs9tEZdljA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhPr4r4lenHm3t3J0Ct+TxlxkTmZOptq1kR3Bok7XowmLKADDp
	Tc8D31BKj47O8Korytfk2FbD6OWbR8Cz1WvDGNNhVwCXEFzKGRuNEDOB
X-Gm-Gg: AY/fxX5wkarMTpRSRxSh4c/1pUq5BXn3cQfQRia7JfJ/EY3tSfjvo4T0yXR0Uj6vEzv
	NPQfWv1EmVPJEgC2Z0yJgvVyx8Za3RscoKTFcWFHLpiLRWK93G/y9P6+N61VNGE1GSoxPfwe/LO
	o0J4Em8Ez10jWKaup9YpvMNDO+ARN4qxUaaTBzEqN0mMBWCAKTGJuFpGhcLuJ0KF4QzK7wgqS8P
	7Aym9hdgRpApKv0ci3lqqch+ZtMUFIvu+t3HO9XMXdsHGbCtejN+OeNYpHVY2MgKZon5Qnz38LK
	vu2oYQJJl4sZxTrdCVf0fy3eEqtqMFWRhwzZjzrqYTOvtYQMQJFP9ZziWpXlap7x5Tjl00w4/NT
	V6E/8VC87eBCyHEBXnPjlhxixXSiBkxjPgGShB9PgfYoEgXCQ+YedCbb3TIOpRTI=
X-Google-Smtp-Source: AGHT+IH/ZbpZvf+ufhdSrgq15FQAA5DMOGdsUeBWMvuc3LZNVn+XAns8eGMqcOV8TZ1Q54ktkq+I7A==
X-Received: by 2002:a05:7301:578d:b0:2a4:3593:c7c5 with SMTP id 5a478bee46e88-2b17d1f058bmr978905eec.5.1767757725777;
        Tue, 06 Jan 2026 19:48:45 -0800 (PST)
Received: from gmail.com ([2a09:bac5:1f0d:28::4:33f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b2256sm5392191eec.25.2026.01.06.19.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 19:48:45 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH 30/36] crypto: inside-secure - Use new AES library API
Date: Wed,  7 Jan 2026 11:48:33 +0800
Message-ID: <20260107034834.1447-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105051311.1607207-31-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org> <20260105051311.1607207-31-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_194847_709657_57608209 
X-CRM114-Status: GOOD (  12.81  )
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

On Sun,  4 Jan 2026 21:13:03 -0800, Eric Biggers wrote:
> --- a/drivers/crypto/inside-secure/safexcel_cipher.c
> +++ b/drivers/crypto/inside-secure/safexcel_cipher.c
> @@ -2505,37 +2505,35 @@ static int safexcel_aead_gcm_setkey(struct crypto_aead *ctfm, const u8 *key,
>  				    unsigned int len)
>  {
>  	struct crypto_tfm *tfm = crypto_aead_tfm(ctfm);
>  	struct safexcel_cipher_ctx *ctx = crypto_tfm_ctx(tfm);
>  	struct safexcel_crypto_priv *priv = ctx->base.priv;
> -	struct crypto_aes_ctx aes;
> +	struct aes_enckey aes;
>  	u32 hashkey[AES_BLOCK_SIZE >> 2];
>  	int ret, i;
>  
> -	ret = aes_expandkey(&aes, key, len);
> -	if (ret) {
> -		memzero_explicit(&aes, sizeof(aes));
> +	ret = aes_prepareenckey(&aes, key, len);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	if (priv->flags & EIP197_TRC_CACHE && ctx->base.ctxr_dma) {
>  		for (i = 0; i < len / sizeof(u32); i++) {
> -			if (le32_to_cpu(ctx->key[i]) != aes.key_enc[i]) {
> +			if (ctx->key[i] != get_unaligned((__le32 *)key + i)) {

"key" is big-endian. Casting it to __le32 does not seem correct.
Did you mean "get_unaligned_le32", which also convert the endianness?

>  				ctx->base.needs_inv = true;
>  				break;
>  			}
>  		}
>  	}
>  
>  	for (i = 0; i < len / sizeof(u32); i++)
> -		ctx->key[i] = cpu_to_le32(aes.key_enc[i]);
> +		ctx->key[i] = get_unaligned((__le32 *)key + i);

Same here.

>  
>  	ctx->key_len = len;
>  
>  	/* Compute hash key by encrypting zeroes with cipher key */
>  	memset(hashkey, 0, AES_BLOCK_SIZE);
> -	aes_encrypt(&aes, (u8 *)hashkey, (u8 *)hashkey);
> +	aes_encrypt_new(&aes, (u8 *)hashkey, (u8 *)hashkey);
>  
>  	if (priv->flags & EIP197_TRC_CACHE && ctx->base.ctxr_dma) {
>  		for (i = 0; i < AES_BLOCK_SIZE / sizeof(u32); i++) {
>  			if (be32_to_cpu(ctx->base.ipad.be[i]) != hashkey[i]) {
>  				ctx->base.needs_inv = true;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

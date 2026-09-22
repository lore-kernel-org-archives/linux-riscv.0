Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB539C982FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 05:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JM02LGL1OI5xbRMagPo4t8TGoMOl+6JWZCT8KZ+8RsE=; b=Ug4NV0xOYipj02
	Sg5yW4MKVq4wqNhv80RdBf/25COhqEko9YfIYIChGRyoPB+rTiyCv/W9S7bGQ6tOJwsX1JCUVg0Z3
	iN8PD1OV3+WDj2aMudGJeqI1/CZ7hi/4d1W91EZgDbXqXUldvshZo3pUWQvVLNjfy/jqG1DFGHBKC
	c9fUKyJOx6CYhxlO+itDgh7+jMyYce7pja+WACkNYU6JP0+Tknl+VXRsJ0hjsMmmgcMVQ27mkk9Ho
	sKsGyLKgIA+OZ4YjJH5cLS7F6Eny+3pOKgavFf4mRbbtpZAHcFSTlNZuU3Y5TOtY7++xgv8FhIZhH
	YYS54/KvqXKRHFFexrOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tIb-00000004HD2-43Cg;
	Tue, 22 Sep 2026 05:44:13 +0000
Received: from mail-wm2-f12.google.com ([74.125.225.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tIX-00000004HBP-1mor
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 05:44:11 +0000
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso37625105e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 22:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790055847; x=1790660647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4/LQ+6F9fJ/cjcJrUOPJx6DRMexHTJtKczEX1e75B0=;
        b=U0mSf+vPz1R2raP8xDSHbq2p2nQVjmTfYV7EHKGl4A4IuWAjLpgsjiXSMNaQKeDxdN
         DF0g5rY6MWq7wKUv8u6+MZvfFoyJZCQJR0w6L8Svdml2JJTBzvJJi8LR580mD6xjEH0j
         2MXgNdFlb6sggEoJ6NylQfKYTHB4O2lBIfmyVo3fyr4M6A3X+fEixTHFzZGxybehugHg
         OwsLPgvF6O03yBKbjdqSS2p7U03pPxc20UYeq9CrFeXBHUtMtsp+QblSzHR8WEf3DeL0
         T6AR/8I9pBXEyyM4UzOtGO+FNtLWBTANqPiqVBFxwP/SW5ODFXnCf6cMw+tQf031hy9R
         R4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055847; x=1790660647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d4/LQ+6F9fJ/cjcJrUOPJx6DRMexHTJtKczEX1e75B0=;
        b=xMLcjaBS6yerksaCszOhsbTl28WoEbZQAFJWEcKiRTBKyPcbar9Dp5C0NM+7LbJ48b
         RAFOYZVbr5kwZRT02dN9hbOtVbiC7TO454CaWvAc3VaOJmuy87ZcC17CI0d1a8osZzfL
         IaSZrEb2eVG6EhrSFT6LBC4XMc+2xKahm4GSbOsseGmI1BnjcURkpVF0gx2zdRSBSknE
         xlFRK5sQ9pZjKQKOH3CxP82ByDtQBlE+71UUl70LHi9CT44SCLt5PTN+NHQO7rdTlhsI
         9/hrD1v3TTP9IhnD3uwNNrrb4YoTsBJQYkKGd21shI+3xXQdht3Oibdkl1I/8oPyoI1k
         rLtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUbSXQB+uepIiXZ1TRdnAj1b6kCPdQd+pjtt7U4wBEMxdzLOtlBo3tIrpXqt3KZXKCH9Bxo6dZ9l7Dcw==@lists.infradead.org
X-Gm-Message-State: AFuF++nTWuN3MrTkGXlnMfFdZqu1/Do95iGnXOrtlnWJznAZ1wqco330
	a+tBfVr5Iezw8LjsxH2CSN4c7kwVl4IaODRCrnNAwj0VxI2sY+fXLq7P6uDUJh8z
X-Gm-Gg: AYBFou2VDraSGan6lhPpke+nXDxbNMC+ssmOS0LOLBQsd0VDvmaL0KkaThmjBLfo8Bi
	eG37Cca8fLR2TwdJFJJWww8ouqtV5CdSCk/TlS/qzJvDBRrKNVOw/nDU9wWbG2jN5U4EowvJq4T
	KhsnYy/wZupkS/xCsCU3mmIrSH7Zw0eOEa8K5Wrg4Pr6k7bafAfBGF0E9c0mmdz0ZRLps6kmPNx
	iV2zMe5lSVSEnjU2uT2K8m1no2+03XhWP9YTJspOPrn/s21gmglo7fbGznSaCxwNwjsX6ALSG6u
	Gx+Akg6w54WRgQosF5VWiaF272TvhoCc98iycD7KqDYO/3aMjQpYiwNC3iKZRg/FVVD2W04EdDh
	wHpm7evzR9JxBLjg4R1toPkW6TkA5IADC/M86P8OsYXY1AJ0ueYQHjp54aKGJsZ894W1QS5HoU/
	VSUNgAsaqjQQh5LLrpGhVJ5gOpNfeeHDySBchFVepi+xsSxmM2Sy1hTFST750rMoUPJR4JWZYZB
	GMS4yWjSTl/2IBHjctJhdTf3+9utxUHRjrr1q34RlULVdPWNJZk/xH0jPIYs87Xvtiqu83a5gnB
	1nqX43hf0i7wBYWv7jTYzQ4pbHB6mj1ykbpY+hRn1IxclsUw2VE9s/qaz4nB8aJM3gytuRl2zEU
	9
X-Received: by 2002:a05:600d:848f:10b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fc5735351mr124626255e9.20.1790055846765;
        Mon, 21 Sep 2026 22:44:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a5e6-3401-ecdc-1e24-2e52-02d6.310.pool.telefonica.de. [2a02:3100:a5e6:3401:ecdc:1e24:2e52:2d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8a638fcsm47621575e9.0.2026.09.21.22.44.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 22:44:06 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 19/20] lib/crypto: riscv/aes-ctr: Migrate optimized code into library
Date: Tue, 22 Sep 2026 07:44:01 +0200
Message-Id: <20260922054401.19194-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260921050910.296144-20-ebiggers@kernel.org>
References: <20260921050910.296144-1-ebiggers@kernel.org> <20260921050910.296144-20-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_224409_489012_B1727599 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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

On Sun, 20 Sep 2026 22:09:05 -0700 Eric Biggers <ebiggers@kernel.org> wrote:
> -// void aes_ctr32_crypt_zvkned_zvkb(const struct crypto_aes_ctx *key,
> -//				    const u8 *in, u8 *out, size_t len,
> -//				    u8 iv[16]);
> +// void aes_ctr32_crypt_zvkned_zvkb(u8 *dst, const u8 *src, u32 len, u8 iv[16],
> +//				    const struct aes_enckey *key);
>  SYM_FUNC_START(aes_ctr32_crypt_zvkned_zvkb)

isn't this a sign extension problem on rv64? The psABI sign-extends
32-bit args, so for len >= 2G a2 comes in as 0xffffffff8xxxxxxx, and
the asm uses it as a 64-bit length as is.

That would run off the end of both buffers.

Nothing passes that much in one call today, but aes_ctr_arch() only
chunks down to 0xfffffff0 and aes_ctr() takes a size_t, so it is
allowed. The old prototype was size_t and the caller zero-extended.

Thanks,
Karl

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

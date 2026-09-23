Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF38FC982EA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 08:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rca1vX7PHs9syLvMSz2R5NHmClvbLQEQeBaGJyOr5t4=; b=TvhX4fflHiTEtx
	/xNgSbs4gLBFVcRefT7EkUUEFLGjaS10Ud/K9ernskNM+R7vNRCRy5SlUyESrqzCMVAqW1OfZTqh4
	Xi2OW2WmX1YcCEczMZCjD4ZLc54jOLOA4rGsnZlNuVC3m/3o+RuCad2pkMUq3ht+ZMkZr4QaS1Aa2
	TrKldudf1RuHBpsKJHTdKHCGMMZspsjBt8lcv65v6kbtD305YI1eKkz82cgZyYxV+aSG83/FcRkmR
	xNUY//+KLMshxaK6aslBsrbXQiiHvSZ4lUYgcHKFK25uVI09j28YhD+Cw2KwYYxZb8xv6G4f018ZU
	rc8t3KYWD73U4vvM4CKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IYS-00000007ZLK-3B8P;
	Wed, 23 Sep 2026 08:42:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IYQ-00000007ZJn-2hDk
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 08:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790152932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZbHzmNubZNWBdHmlif9GpwgQyT9l6KjjTU8mkVoSiUI=;
	b=cq6xZj3D7MBBhGkCpF7lIr4IzjgGKtsIpVyIEGZebYhbpj+CbnKM1WNeln3X5neCxyhKNr
	3mvmWdCl3Wb1FwAMOBsLv1wUrOooVKGyveLghB2yq0qdPD5F9ZTh5KYH1ST7wdaSrW0R6y
	LqwBdXleeb+w4JT326Us74knxkeOHYg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-jw6IihoIM8GRBrfaCyqX5w-1; Wed, 23 Sep 2026 04:42:10 -0400
X-MC-Unique: jw6IihoIM8GRBrfaCyqX5w-1
X-Mimecast-MFC-AGG-ID: jw6IihoIM8GRBrfaCyqX5w_1790152930
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-486e90b59a6so389169f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 01:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152929; x=1790757729;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbHzmNubZNWBdHmlif9GpwgQyT9l6KjjTU8mkVoSiUI=;
        b=AP9OC+qp7cX/3L2XBvCB+/4tM8EGKODhPSwO+wN0RBH2tyK76a/x104oFRar12DQpz
         4XPdpixOyMF6egMaEqmBFulrDcG9A8Qr5cxVA776JCNjFegCaQt2ijhUsmoaq3HjJdbJ
         pOAE759Mk+1MpfO+0rYOrEs69WFJfDn1A55Q1xnNS4MkgmFitavM2X0CBQuUvyNWEoB/
         3eMH8s3gTocu3qUjrtKkWkmVXLMJ5/+LwThYJJt/bdxo5WBnn/06kiNDqCD76Nus8QsF
         dwhOXKt6/+Q10KkhVm2Sr9dsqkffv1zLkuicxxrUHWcTeAL2xgYLW7H0KByrJCQGTsKI
         NVwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwX1lhIMyPaYbEQHDlWgus8pDlWEki7pHrX3y5xCyCRSZV6CAQkA98kvE9laMhlYrqhY8o4NgJ3LLNV/A==@lists.infradead.org
X-Gm-Message-State: AFuF++nEzrH6wPnSUpnAY3GHpgTxYLJku1xNjb/0h9Oe/UsmB7idjrln
	VKQaBRNK4Hia7x6fGHatz1URrFq8dOeBGvFPl4hQ8yCVw6Pet+Yc3rixaj1txuTUCPF3P0uQPfK
	zYqXCgWO+l7FyEWy2rTxHIrgW/hUjnqwijftZmoZJfGvD4Y9C1mJFG9ZgXNsvbY8AoOJPpQ==
X-Gm-Gg: AYBFou14HwPh9tAbBaLTBAmYJweoURXv4RZ6CK3TqIT6mPTtujfDgznP9xFwldNVlNe
	d1f9gQPnxpv8k0R4Upf3jUMrUjnV7h6bvhc1oC8Ptc0pBU1r5un4lyO0tgiktFkeVMEtNI9vwWI
	xx9KZ0hDQ9mYUigv365CzY7GVWOJGQIYjDOreM8z+XHphYi+fADUV8gyAjzNlF02n98k+BGtryZ
	1EESwZFyrBFNQlTnKr2Eqi72lWWiyPQ8AhnDJz9WrDJ7GtIcYY4mdbpSohevRhVEWChgsK/Ek4E
	CUUNHKHO/P4993Ojh+nU9ukM2NQ1tkh0C12n8Dpt3Qb7JWNInknOvPUy+0AX1qk79dVpViuu
X-Received: by 2002:a05:6000:703:b0:486:e901:e59 with SMTP id ffacd0b85a97d-48867093c7bmr3020852f8f.31.1790152929615;
        Wed, 23 Sep 2026 01:42:09 -0700 (PDT)
X-Received: by 2002:a05:6000:703:b0:486:e901:e59 with SMTP id ffacd0b85a97d-48867093c7bmr3020801f8f.31.1790152929229;
        Wed, 23 Sep 2026 01:42:09 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c027sm5987256f8f.17.2026.09.23.01.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:42:08 -0700 (PDT)
Message-ID: <fbf7e74c-07b7-42e4-a236-e13d57b3a380@redhat.com>
Date: Wed, 23 Sep 2026 10:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] lib/crypto: aes-xctr: Pass counter by value to
 aes_xctr_arch()
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <20260921050910.296144-1-ebiggers@kernel.org>
 <20260921050910.296144-3-ebiggers@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260921050910.296144-3-ebiggers@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3PeEaDTbY0oFR9u8RWbeofMvir22p6AzCDYmDdple9c_1790152930
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_014214_778535_1691DDF5 
X-CRM114-Status: GOOD (  15.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 21/09/2026 07.08, Eric Biggers wrote:
> Update the calling convention for aes_xctr_arch() to pass the counter by
> value, then do the increment in generic code.  This aligns better with
> the x86_64 and arm64 assembly code for XCTR, which takes the counter by
> value and thus has to be paired with an increment in C code anyway.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>   lib/crypto/aes.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
> index f1549839b3de..22f096c50242 100644
> --- a/lib/crypto/aes.c
> +++ b/lib/crypto/aes.c
> @@ -1094,7 +1094,7 @@ static bool aes_ctr_arch(u8 *dst, const u8 *src, size_t len,
>   }
>   #endif
>   #ifndef aes_xctr_arch
> -static bool aes_xctr_arch(u8 *dst, const u8 *src, size_t len, u64 *ctr,
> +static bool aes_xctr_arch(u8 *dst, const u8 *src, size_t len, u64 ctr,
>   			  const u8 iv[AES_BLOCK_SIZE],
>   			  const struct aes_enckey *key)
>   {
> @@ -1150,8 +1150,10 @@ void aes_xctr(u8 *dst, const u8 *src, size_t len, u64 *ctr,
>   	__le64 aes_input[2];
>   	u8 keystream[AES_BLOCK_SIZE] __aligned(__alignof__(long));
>   
> -	if (likely(aes_xctr_arch(dst, src, len, ctr, iv, key.enc_key)))
> +	if (likely(aes_xctr_arch(dst, src, len, *ctr, iv, key.enc_key))) {
> +		*ctr += DIV_ROUND_UP(len, AES_BLOCK_SIZE);
>   		return;
> +	}
>   
>   	aes_input[1] = get_unaligned((const __le64 *)&iv[8]);
>   	/* Handle the full blocks. */

Reviewed-by: Thomas Huth <thuth@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

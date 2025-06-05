Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949B1C5B543
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 16:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJFRVIfo0X/DYgaYHGQuvRE5mliw50WntD90pc1Q7Ug=; b=MKDkk8EegRBFWh
	eNeBwg22PhncJT+q9L8KbBd1XeDKlDsQ8F2bDqUdjYi4mPEr+WVmbeq6EdiS+QgrByjsQMqdG4Dgk
	SccYgVSoev3092LvLaUONIMErcq2jL72D6uPaUPYrDSmwvNcAevDittQS+25sOqR+Dll7cNQjJorS
	z1DW2rAslFIkTbzvJVaNatGg6g/kK93liEh0G4r8/nWheR7NIllWSPtdBg5WzYR4Yw/5w+KFpi15n
	oJ7/AYma6Rr0AFyJbAxk+uPSOpoSlq4HNvREzqIawtKECNAmVcXFzuWLfETZxCGHe+8cCbHVUhVmC
	UfoG+cXw53VF5fdSvnbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDfc-0000000G3Ot-0Aio;
	Thu, 05 Jun 2025 16:42:24 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDfY-0000000G3NS-3Ddv
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 16:42:22 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so1273700e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jun 2025 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1749141738; x=1749746538; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PFO6uqE3omBPZMM2RRJAUzPXA8e6WjqOavvxq7pzHeU=;
        b=W6esxUMYcctnQu2u4CnVM2RQv3a6TDlbTvmJaKlr/zfpygjOZ87Tgop8o+YA4gGj+n
         BPxocCFJHLJGi+/yHaN5VbgRzMPmLsgrg+u9KnQJMU5IVuvfXivE8HvcGt5SGA0CJz/3
         n5DsD+ZGZEdu16UaZM4HUGwoInSuNEc8LcRJyVSUJo7s+0wNpNobPysXU55IZccVaPCO
         fPT1YO0AMJD7PVRYLLDgx0z9rszmowucNPwXL7QklWXtWo44aWP1RU8w0iZPFD/nFTQc
         nWFFviUIODwnPDPMvDKiJmtOw7msd3i6q6WpmK7klBlY0xkq5towQN6lf5ef04yPF31K
         A5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141738; x=1749746538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PFO6uqE3omBPZMM2RRJAUzPXA8e6WjqOavvxq7pzHeU=;
        b=ZcMFklQfYzZaIUJgrZZkESwV3UtZa9DKAOdPQph38G1QUd3nn4japD3CxSEBG+DVpC
         7IsPobdf6CVwISxWh3aICyrlv1+nm7LbUIXdkwdcALfXo9logRhr1Zf6Hkx/nx+xTF/r
         TIHmwlZ33KfwtgQ9x4N850xZx3WwdKf+rBHmA5vy5PuulykRXMDR9siwcB/B24dJO8vG
         4KMCqk9cLXGpofrFv2P+PxwJ0fEKAu5ECDvCDNp0q/NKFwLuQQGryQ8cUvYnMsG9UbYs
         PUGU+JfFZEickQJOk3KD5cvMxfstYaCgcq7jwAlscQPs5bdmprZiIlJp15/+m5NULsZM
         8EYw==
X-Gm-Message-State: AOJu0YxIUbyXOoHPZLWsARgB6JuCaOkkI2XXCiTho3zbQfdZc5Z3oMI5
	3uV6jGveSfWUiNaCwRnHW3q/hCStmuqXPZvrsepB8JE9+Qfl25vxWlWYLtKT6R7wIJ4=
X-Gm-Gg: ASbGnct6fezJCfHR99MmAoFgJH8I/PXN9W8mftP18VTttRD0cVmIkpCSbYmImC9foX2
	1g/sRfGrQDq1beKZdGL1vL9ypM5419S1WrWbNgy1zXdVT46qqQaosmnqUcbW6mO2HBTlL3ayuDi
	+WX8gNo5xEH5moreANgYF+U/2bEsbg7q/h1e3H/rE6x+OoJ5T/AGM7jEHK1Zs23EF4zlycyRnrO
	ECSQhqswBFBKv+hYyqrDb+XV3ez5W9/oogtV/snHN0GbRR7SKbAAzeY6ldTjnUvYYqOIjXuCaec
	KGh8eZR+kpduz53W2+AtWsizY+VGE9ITs6ImysrXwc/LkJs6CvAUxx+5tH1SFVcy8TsSxxioluM
	TUfE6RzllCHHS6sbYYYs=
X-Google-Smtp-Source: AGHT+IH8iucMLKyB72iZJRp6Ja13mId54J+CJ3jYG3RVj0yucpe7n56kB9LK1qIF4RKWk44WVICr0g==
X-Received: by 2002:a05:6512:3e21:b0:553:2e82:400d with SMTP id 2adb3069b0e04-55357bacabbmr1937536e87.25.1749141738230;
        Thu, 05 Jun 2025 09:42:18 -0700 (PDT)
Received: from [10.0.1.129] (c-92-32-241-79.bbcust.telenor.se. [92.32.241.79])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378b2684sm2648588e87.106.2025.06.05.09.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 09:42:17 -0700 (PDT)
Message-ID: <5dfc623d-eca6-45f7-aacf-8f775d03267a@cryptogams.org>
Date: Thu, 5 Jun 2025 18:42:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
To: zhihang.shao.iscas@gmail.com, linux-crypto@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, herbert@gondor.apana.org.au,
 paul.walmsley@sifive.com, ou@eecs.berkeley.edu, alex@ghiti.fr
References: <20250605145634.1075-1-zhihang.shao.iscas@gmail.com>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <20250605145634.1075-1-zhihang.shao.iscas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_094220_814261_46B7D9F7 
X-CRM114-Status: GOOD (  20.43  )
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

> This is a straight import of the OpenSSL/CRYPTOGAMS Poly1305
> implementation for riscv authored by Andy Polyakov.
> The file 'poly1305-riscv.pl' is taken straight from this upstream
> GitHub repository [0] at commit 33fe84bc21219a16825459b37c825bf4580a0a7b,
> and this commit fixed a bug in riscv 64bit implementation.

Just in case for reference, the commit fixed a bug in the 32-bit code 
path when it's compiled for 64-bit architecture. For better/adequate 
performance on a 64-bit system the 64-bit code path should be used. And 
it was fine all along. It even passed an algorithmic verification, in 
other words confidence level goes beyond the unit tests.

> Also, this patch passed extra run-time self tests.
> 
> [0] https://github.com/dot-asm/cryptogams
> 
> Signed-off-by: Zhihang Shao <zhihang.shao.iscas@gmail.com>
> ---
>   arch/riscv/crypto/Kconfig           |  10 +
>   arch/riscv/crypto/Makefile          |  17 +
>   arch/riscv/crypto/poly1305-glue.c   | 202 +++++++
>   arch/riscv/crypto/poly1305-riscv.pl | 797 ++++++++++++++++++++++++++++
>   drivers/net/Kconfig                 |   1 +
>   lib/crypto/Kconfig                  |   2 +-
>   6 files changed, 1028 insertions(+), 1 deletion(-)
>   create mode 100644 arch/riscv/crypto/poly1305-glue.c
>   create mode 100644 arch/riscv/crypto/poly1305-riscv.pl
> 
> diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
> index c67095a3d669..228bb3c6940d 100644
> --- a/arch/riscv/crypto/Kconfig
> +++ b/arch/riscv/crypto/Kconfig
> @@ -38,6 +38,16 @@ config CRYPTO_GHASH_RISCV64
>   	  Architecture: riscv64 using:
>   	  - Zvkg vector crypto extension
>   
> +config CRYPTO_POLY1305_RISCV
> +	tristate "Hash functions: Poly1305"
> +	select CRYPTO_HASH
> +	select CRYPTO_ARCH_HAVE_LIB_POLY1305
> +	help
> +	  Poly1305 authenticator algorithm (RFC7539)
> +
> +	  Architecture: riscv using:
> +	  - V vector extension

Implementation in question doesn't use RISC-V vector extension, only 
Integer Multiplication extension.

> +static void riscv64_poly1305_blocks(struct poly1305_desc_ctx *dctx, const u8 *src,
> +				 u32 len, u32 hibit)
> +{
> +	if (unlikely(!dctx->sset)) {
> +		if (!dctx->rset) {
> +			poly1305_init_riscv(&dctx->h, src);
> +			src += POLY1305_BLOCK_SIZE;
> +			len -= POLY1305_BLOCK_SIZE;
> +			dctx->rset = 1;
> +		}
> +		if (len >= POLY1305_BLOCK_SIZE) {
> +			dctx->s[0] = get_unaligned_le32(src +  0);
> +			dctx->s[1] = get_unaligned_le32(src +  4);
> +			dctx->s[2] = get_unaligned_le32(src +  8);
> +			dctx->s[3] = get_unaligned_le32(src + 12);
> +			src += POLY1305_BLOCK_SIZE;
> +			len -= POLY1305_BLOCK_SIZE;
> +			dctx->sset = true;
> +		}
> +		if (len < POLY1305_BLOCK_SIZE)
> +			return;
> +	}
> +
> +	len &= ~(POLY1305_BLOCK_SIZE - 1);
> +
> +	poly1305_blocks(&dctx->h, src, len, hibit);
> +}

This interface doesn't make sense. It looks like it's supposed to 
accommodate concatenated key, nonce and data input of arbitrary length. 
However the data length is truncated to the multiples of poly1305 
blocks, in which case |hibit| is supposed to be 1 unconditionally. Or in 
other words, considered in isolation this subroutine shouldn't have 
|hibit| as a parameter, but simply pass 1 as the last argument to 
poly1305_blocks.

On a general note. The poly1305 implementation in question supports both 
32- and 64-bit architectures, so maybe riscv_ prefixes would be more 
appropriate. As opposed to riscv64_ that is :-)

Cheers.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

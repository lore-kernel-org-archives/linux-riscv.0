Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715E1C87FCA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ingwu9fHcZhq7N28e2NobT1ygWjk+/6Ql/nS+vgJnXA=; b=w5CAr7S7XuPcl4
	AJEHLsL2RzemCOEEP4wyTs5UjQgd4dQZHCre5LAZrBFXPHgNLbtdv3GHaeJfciasduK/Lie0aMdcm
	5q4/tE9A8zr2a2uJWziN34EoYakISjBPXgp5NukDtdIjL9nU/yly4/X2VoWQDL8ggKdC6mHOWt6d5
	NPz+CFs0W3FyFcPG5Oy1p+0vpIg5PrcKziuv6xN3+SzjtbUsVccb9UWcDzTMF53cBrSPyUrN1NJPv
	pXybJVlo7057quwRM62iIoRy5iM11C/VExPIWBIxdSn7VM0VNEmVGsZC+w1Ko39z+ZVNJy+sEUtRR
	xma2VMyGzOoO6XnQ85Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWQG-00000004dEO-15M3;
	Wed, 23 Jul 2025 10:10:04 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueW4s-00000004ZCl-3VIL
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 09:48:00 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5561d41fc96so7486743e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Jul 2025 02:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1753264077; x=1753868877; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/iHsnb+QFDGFQGoh/DAKzy9Zy3rl6+YGRpc9K7e/1bo=;
        b=RH5tQ4LE2rDgdVVqOfo0SkrxxqpnttOQDCogyPIjiLhG7wRNhgk33JaatzRYWdTRGe
         4He+i352CdNwyXX+gYSj9SWVRX3xlgfUgCmWGyqEKwyhf8JonZW6yD9wRhacuroYDQ5p
         t5NQgvJL5frOvOfKeovHSzQButwy7+8l8HzY3HfJRGWVH2SkMEOL3IGuLqJKB7/blkfF
         l4ZykSeNFKAra/1ZHyQRFcdJQI2OxSelTYycpl0M6HCatYHYnScWcLTDkWrX3QLLitk5
         7oAMiRtr/MY8VBnIY/CL4PVcLbrncIKFZLJEZ6ITTp6WUlAQ97e0lnYBJkd4KkLt1a39
         etQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753264077; x=1753868877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/iHsnb+QFDGFQGoh/DAKzy9Zy3rl6+YGRpc9K7e/1bo=;
        b=d3GY70zPigcFdT2jjVl/ICGzXfBnfMFSTLmYjBivFJqJrxj2HvmFYaGUiuNKgXVGwR
         aaTiTGac0/4ICUV5pf03U9rB4WaKV3j548T936jld7YuiC46EZHxiU3wnYx+e5CUwkqk
         8q+LPVnm5QBNU2/yVgtPmklYYoYKIvuyYKUNvC44ysm4fv4hclobN2xYUiIqm7b3QebU
         jazCCfCXHlG/qmQkNeSLUqXmo4tRI+MGtvZ9C0i60bsz0mL+vfvHb43fRqgxLB2qkuvL
         ejSFr0pbTDLS3xAAFEshEAO+N0ofhP/QmEih9T3Cig8L1HDcVHoMXbna7E/dADw/lmWK
         wavA==
X-Forwarded-Encrypted: i=1; AJvYcCXku46Wr5HFO7qeneraKZEZwecU71iykmYgNBh0uckJ6tqxAEIjwOe7H+rDLBS1LeUDVj3am3/2wMPYxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9esMFt45ahOJW99ZYIGDNVTyiyjg2jIMZLmMel98eBRND1ia2
	c0lq0AZ4+SeVuUoG54tsuVQlbnjfXSpkQVj59UDgTWHqlLiE3tdsWdCMsQGcxFzMbMs=
X-Gm-Gg: ASbGncsdV+QXnKdtcJoLixwdkpB9vITowk7A9RpYyVPDkd4vjF8OweRAEWHnuTvjaIU
	cj2dfw6Ojj/llNqFUeo7b6+B5AZOOGr1VY5YubBtzhGcdOFuG3g1dzo/jGYUV9KnxsG6ThGkOga
	5SGIDi2mi4Yq2NyM7CoiWHQuTDjwNCXoGY4KvdSEzHN78MlYv2+t1twHNPeiBtQHIJDVWOL8HTx
	KNvsp9fAZV180Z05gosRAYBk0vsa5xmGSkvS+jBpys+iYFUWPoFDb08FWnKgKEUy+Sn31etS4jp
	9PUmJGPr0sLN5XKN4qznO6Ef6BruXworJ7iYvmy1d/DkyQMC7E0ohiz3ZOZ+EaeiGAmCMsMc+kk
	QdNxzcerBYcEOVmnfO0Ie6Jj+5C6w4iK5vNV5GGwkEAziSkJQMpzmm28ghhipAty+Cw==
X-Google-Smtp-Source: AGHT+IFq48/8ENzanpaDeHxcIDxOJRvTnxQr9W0HfRdR24SiPdB2l8+HzzLMqoVluoTBHOfXgRfW2g==
X-Received: by 2002:ac2:4c54:0:b0:55a:4c3a:b11e with SMTP id 2adb3069b0e04-55a513ff603mr711109e87.30.1753264076401;
        Wed, 23 Jul 2025 02:47:56 -0700 (PDT)
Received: from [10.0.1.129] (c-92-32-247-84.bbcust.telenor.se. [92.32.247.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d915c5sm2261332e87.157.2025.07.23.02.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 02:47:56 -0700 (PDT)
Message-ID: <bfb6c88c-4dce-4e52-81dd-a8b696e07aea@cryptogams.org>
Date: Wed, 23 Jul 2025 11:47:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>,
 Eric Biggers <ebiggers@kernel.org>
Cc: alex@ghiti.fr, herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org,
 linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 zhang.lyra@gmail.com
References: <CACGDn=Rn079JhB7dwqbC-3GNiydJs=dGEXtcw+cC8z2Yjp2Qbg@mail.gmail.com>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <CACGDn=Rn079JhB7dwqbC-3GNiydJs=dGEXtcw+cC8z2Yjp2Qbg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_024758_887288_C327DA8D 
X-CRM114-Status: UNSURE (   7.45  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

> Next, I plan to validate this performance gain on actual RISC-V
> hardware.

I've rerun my benchmarks, the cycles-per-byte results quoted in the 
poly1305-riscv.pl commentary section, and it appears that my U74 results 
were off. I must have made wrong assumptions about clock frequency or I 
failed to note that the [shared] system was busy. Either way, U74 
delivers 1.8 cpb, be it the initial processor version or one with 
additional ISA capabilities such as Zbb, JH7100 vs. JH7110. For 
reference, the cpb is calculated by dividing the clock frequency by the 
measured MBps rate.

I also have vector implementation cooking. It's not ready to be 
released, because it doesn't yet scale with vlenb and works only on a 
256-bit vector unit. It achieves 1.3 cpb on Spacemit X60, 2.5x 
improvement over scalar code. Just in case, one can't expect the 
coefficient to be the same on other processors.

Cheers.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

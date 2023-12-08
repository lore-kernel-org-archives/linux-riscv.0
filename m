Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB49BC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 04:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6USA7WJvrRVF7mOAncDc+dbVlSLnXmvw6onMfbYKys=; b=nF9uuWpJYVOh5X
	YVS/GF0cr6DVVOlF71QCFH1Fx1m1Z+Kdfb01kLlBemV9SAyKqXBr2UjYiFwa2yNu6AKeeoROehFRy
	Hwevz00w+QEYZWRurJMbtrprbx/WjDDr/ognBaY18CsH61Lwe8rBDm5N57QaSiVgm29Rs1YJGXvRf
	05nsZja+8p2FwU+g1WhMEkgpqii/OXPCSy3XOHBqkY6KztVcgLDoN9wGHRfs3q4q75rIqHB8wpvgD
	RTyggtW7rQY/L6xALpKb0yvMMksmzPSxNeq42CzfUudfRxIiwW93boK1UjFRfpjH2UsVQ8ddn/58G
	Ks+znw912jAta4AhLbAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBSKD-00EfPT-09;
	Fri, 08 Dec 2023 04:18:53 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBSK9-00EfN0-0q
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 04:18:50 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5c66bbb3d77so1327252a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 20:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702009124; x=1702613924; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5Tnty8uGnrsIVXtmr+TvgEkcR6UqhS9WZGqa9cLAzU=;
        b=XJb+jMvuW9c+74/76o/Wa3aMLYpUr9SYD6qKzQYI+THe4b8yd2YQolQFWQiSIPNwpW
         CDREw41TUWP5ZVT470lowtuuEwphWERssnWj46Hnp5B7J6FA8tiujEIu8j7jWqlqKUNj
         pfzwzfbBYPQBzyFmjtvaLqZw7kl6vAHycVIFxb59GHuqZWBxkYwtjIydpMLxa8y5DRGI
         /2JCS0eby/amwFnhrRglC0tg2/y2Fpu4onR0GA79g5bVhKXbaglUpiMJBe/Vf6U1zE5L
         RQlTcchRyY78ettOUdodVpyhpv4HVf/FHDZN3/tM+pPTTQF4Zw4OOKOn7VDF+ZO0xBXc
         8TVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702009124; x=1702613924;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5Tnty8uGnrsIVXtmr+TvgEkcR6UqhS9WZGqa9cLAzU=;
        b=iMvesilJwU02kCFI01w01X2LyLMZZvbcOoRIMinSKx3ivVODNAOgjwHZwd6e3VdV7o
         8G4RNtyEXWdCqhLcSHff7rhh529FNRmpqmJTfEMWivG6SS2jAW4XgA3jrhQo+VspzDwL
         OtlYq9jR85McD/WaCPuJymMU/TQxl4YRslm2jCsMo6fW4vAld8QXGSIZMWcI5dsU6QQE
         z4t/8So1qVirFOwIRWhmdXkEwl4OpMIuOr+vpRZ2EU3zrOgJqnQyVugZzCKEOVE1HG9K
         j2MCwREdZMMyHkOzAcApDu7AgQmHghl536ST2qT1YhDH01NkYjcCtI4oXYWxKi22kXED
         VF0Q==
X-Gm-Message-State: AOJu0Yz7Yo528gqccMlLr9N16dXrmdteFo4rRe5AJ0CQEo9BSryT0E7h
	sKfso3QqCtSHToK/e6zR3g0gng==
X-Google-Smtp-Source: AGHT+IFp9iNb7QqJ7wb16q4wxd1kROAdjldRBrd9Y5SAmktLgQrezvI5AuaKkgiGqBj1DHg2d5+eYA==
X-Received: by 2002:a17:90b:3b44:b0:286:815b:8c75 with SMTP id ot4-20020a17090b3b4400b00286815b8c75mr3090891pjb.16.1702009124417;
        Thu, 07 Dec 2023 20:18:44 -0800 (PST)
Received: from ?IPv6:2402:7500:4d5:3ce7:e047:b0e5:91bf:940? ([2402:7500:4d5:3ce7:e047:b0e5:91bf:940])
        by smtp.gmail.com with ESMTPSA id dw8-20020a17090b094800b0028862dc530bsm2235275pjb.25.2023.12.07.20.18.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Dec 2023 20:18:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v2 05/13] crypto: simd - Update `walksize` in simd
 skcipher
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <ZXKV/nLAQpUx6AX0@gondor.apana.org.au>
Date: Fri, 8 Dec 2023 12:18:39 +0800
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 ebiggers@kernel.org,
 ardb@kernel.org,
 heiko@sntech.de,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <5684F139-A0DE-4A9A-B937-9DF5130E5BD7@sifive.com>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-6-jerry.shih@sifive.com>
 <ZXKV/nLAQpUx6AX0@gondor.apana.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_201849_361656_B9CA8F8E 
X-CRM114-Status: GOOD (  13.44  )
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

On Dec 8, 2023, at 12:05, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> On Mon, Nov 27, 2023 at 03:06:55PM +0800, Jerry Shih wrote:
>> The `walksize` assignment is missed in simd skcipher.
>> 
>> Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
>> ---
>> crypto/cryptd.c | 1 +
>> crypto/simd.c   | 1 +
>> 2 files changed, 2 insertions(+)
>> 
>> diff --git a/crypto/cryptd.c b/crypto/cryptd.c
>> index bbcc368b6a55..253d13504ccb 100644
>> --- a/crypto/cryptd.c
>> +++ b/crypto/cryptd.c
>> @@ -405,6 +405,7 @@ static int cryptd_create_skcipher(struct crypto_template *tmpl,
>> 		(alg->base.cra_flags & CRYPTO_ALG_INTERNAL);
>> 	inst->alg.ivsize = crypto_skcipher_alg_ivsize(alg);
>> 	inst->alg.chunksize = crypto_skcipher_alg_chunksize(alg);
>> +	inst->alg.walksize = crypto_skcipher_alg_walksize(alg);
>> 	inst->alg.min_keysize = crypto_skcipher_alg_min_keysize(alg);
>> 	inst->alg.max_keysize = crypto_skcipher_alg_max_keysize(alg);
> 
> Sorry but this patch doesn't apply any more now that we have
> lskcipher.

The lskcipher is merged in kernel `6.7`. I will rebase the v3 series to `6.7` later.
Link: https://lore.kernel.org/all/20231205092801.1335-1-jerry.shih@sifive.com/

Some dependent patches are not applicable to `6.7` now. I will check the status for the
dependent patches.

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

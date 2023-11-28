Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE4AC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 05:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sWkIyU85JKvgcZcx7xzD6Fmwp3BvhB6bCsxAZKQau4E=; b=La1iWqtQO8bHIj
	AJzIq1X6op0lyNCvoNZ07zOqzJ7TjsiUK+0prrr9xvMsMLskxUWSC5j9EsSCceVQA11uAto9Ai9/W
	S7HkJevGtJMJRopnryKmTrtsNzmxBoVleJGoJTjpIQ7ViCXMy4cYYmC1bB47PfFLJ1OlGiRdS+SSI
	e/Cm3KnLS5cL25usBl4VAktWAhvyZxsHkC3AfzPMuQAOS0mKDf9ac8rWW7fE0bxIuNN1O0L6SYMLg
	2WRN1317KcBfcp0FFitlYW32Aj+N9bvN/EdLDbu3XY2Br8PRxE5JKsTyGxlPmJA3nb4Gem2WlZ2/J
	FgwNiPKv1fAjsV7SkTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7qnt-004ACG-2a;
	Tue, 28 Nov 2023 05:38:37 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7qnr-004ABu-1H
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 05:38:36 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b8382b8f5aso3204834b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 21:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701149914; x=1701754714; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3smZGD6pLNRGkaXwEXKVlmQX+QFLadDCcT3fwIXSsw=;
        b=VgMYeFQzD+hmy2hOM8tqgTt3VBXrGRcXz3h4YHcBLLMt6YhyayhVuzXcF7m/lfvokA
         ydq4S31YJkbqF3+9ebIfnMguu2t71hz/XwA9FzNkFw8Og9zFxEFvxqP1POmdKa9gi6a/
         YPj3/CXbRn6JM845L4iNrkSGIM4GmUkBQ/hzWx3MzbrW7A2bv4gJNFcASa6yXAqo88GM
         NQcIF7Qt4iAhfI6E19Ah/s/qPPP7sAUlsKbrkzjbK2YbfbjBAT73Ai+Sy9x0U5erlkAm
         I9JflXKoNs908ZE2DXaFPQgJHkiYmU7rRHC9DKAZak800FX/GKy3HzFh1TTEUlLdomHI
         qo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701149914; x=1701754714;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3smZGD6pLNRGkaXwEXKVlmQX+QFLadDCcT3fwIXSsw=;
        b=jPgF3VNub3EvCp67fxrmmQwhKlgDTDeBTG2jGXNBqy5yhImkQfOw3kdpzmWpDBZOpx
         9kJ4NvVmVpEcngUiJM02qiBJ4AOa5YH2iGDBwj4J9adznZvSo8bFohameaUcWcCMxMhB
         qYKgM2KT1GNpcU0n9Y92DMODaKlJJV/EU7THSkaafhxWfyhXhrHW4w8BR1uYh0rBq8AW
         9nZyUnJbg3E5cDRexBOX7Jj703kJUD+Xr9cuABR+HrEq6IEk1PaLhfk9npqOxYp0Ciq7
         ZJuVNYNO8shn9nAtiPfO0NSx5jyfOrsQod4gSyZGwL95dwEqoGxy2jnysMMXEhXZcM5C
         5hbQ==
X-Gm-Message-State: AOJu0YxMkjE0uTdGdKFFWRK40/t37v0Mq64nA6fF81fqCObGPcQBsELO
	NjTBXDlv90vglJdVhUNVHxRIlw==
X-Google-Smtp-Source: AGHT+IEwY+qDOH5RdVmpp3afIODK9OZ2MAKzfbsV5gxBTlRaiFetM3EKZhzvR/gD6Q8ZvgHWcrukkA==
X-Received: by 2002:a05:6808:1901:b0:3ae:5e0e:1671 with SMTP id bf1-20020a056808190100b003ae5e0e1671mr20436537oib.4.1701149914332;
        Mon, 27 Nov 2023 21:38:34 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:8338:14c0:b892:2482:e230? ([2402:7500:4ce:8338:14c0:b892:2482:e230])
        by smtp.gmail.com with ESMTPSA id r10-20020aa78b8a000000b006cbb3512266sm8087953pfd.1.2023.11.27.21.38.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Nov 2023 21:38:33 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v2 05/13] crypto: simd - Update `walksize` in simd
 skcipher
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231128035814.GH1463@sol.localdomain>
Date: Tue, 28 Nov 2023 13:38:29 +0800
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 ardb@kernel.org,
 heiko@sntech.de,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <56F07E23-CA7D-466B-84C7-643F2839E199@sifive.com>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-6-jerry.shih@sifive.com>
 <20231128035814.GH1463@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_213835_471891_4B472EAF 
X-CRM114-Status: GOOD (  15.97  )
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

On Nov 28, 2023, at 11:58, Eric Biggers <ebiggers@kernel.org> wrote:
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
>> 
>> diff --git a/crypto/simd.c b/crypto/simd.c
>> index edaa479a1ec5..ea0caabf90f1 100644
>> --- a/crypto/simd.c
>> +++ b/crypto/simd.c
>> @@ -181,6 +181,7 @@ struct simd_skcipher_alg *simd_skcipher_create_compat(const char *algname,
>> 
>> 	alg->ivsize = ialg->ivsize;
>> 	alg->chunksize = ialg->chunksize;
>> +	alg->walksize = ialg->walksize;
>> 	alg->min_keysize = ialg->min_keysize;
>> 	alg->max_keysize = ialg->max_keysize;
> 
> What are the consequences of this bug?  I wonder if it actually matters?  The
> "inner" algorithm is the one that actually gets used for the "walk", right?
> 
> - Eric

Without this, we might still use chunksize or cra_blocksize as the walksize
even though we setup with the larger walksize.

Here is the code for the walksize default value:
	static int skcipher_prepare_alg(struct skcipher_alg *alg)
	{
		...
		if (!alg->chunksize)
			alg->chunksize = base->cra_blocksize;
		if (!alg->walksize)
			alg->walksize = alg->chunksize;

And we already have the bigger walksize for x86 aes-xts.
		.base = {
			.cra_name		= "__xts(aes)",
			...
		},
		.walksize	= 2 * AES_BLOCK_SIZE,

The x86 aes-xts only uses one `walk` to handle the tail elements. It assumes
that the walksize contains 2 aes blocks. If walksize is not set correctly, maybe
some tail elements is not processed in simd-cipher mode for x86 aes-xts.

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

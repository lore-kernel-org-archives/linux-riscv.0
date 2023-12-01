Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC93C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 02:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MU4cPc72Gpl8Su88qFA7lskO87an6XKbyXimB91mBRI=; b=1ommecq8nS0l0+
	AsHKE4U2bwEiBSkiLaxDvINmWNkqGcUb4WkA0qh4CVGWoPQpqD8yBiCe2NsrPwVyryS3cWZ4jylvp
	XSHRuvKsLAC62UnzfVdVFvvHiShkarddNBGKm7u2tD1YCDaMBV4yt2Z+IfjcPzCR8Hdee8PVNtVna
	IerXt85XhZPNSZ4qNrGU+DPIG6pIIqwLEh93/NRnrWM5Nvq4iCAkuK6mlxcO+xcrs63vTjYX7xQ0m
	iGcIBXhOm82gvhs5P7286631QLr2LZtyvH4MmQrr4ZjcpAZSUljnUJyAsRARb6SDClGKlk9uracHu
	wHiQw5dgFc9NNJ5PyeUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8syX-00CPGW-0B;
	Fri, 01 Dec 2023 02:09:53 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8syT-00CPFC-1d
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 02:09:51 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6cdd405ca77so1648289b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 18:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701396588; x=1702001388; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZARUzLOCPbgkdrEMse1VgYWmJt+Qe6ydA0SeWnrZFk4=;
        b=Av1+KyinGm5v+rqPvXK05E659pYKhDELeePi5263DVJd/todRWhOoIgsahNuC2iX4O
         UsptJHUDGWC4XDjhfksxVxd8h/US8tu2r7XRPiT72rck4OqF99rJpHrhZZ00fmRlOam8
         fVR5wNmkOa9XjuZAYc8vWGRzFXAea0szjP+tytFTgXLlx6n3DMkCFV2tq4qBHtcPNYQz
         cbx5CI1F7jTvBrsy7Z8wS/NWSCF+SC621EKAGIFEzjWP63FgEDVltR7yyKiPvG11aad6
         vU85evS0yEHV/JQYNBJ32CUyk1bp2KHbEoAqkoeEOU98R7ZMgBjv6deTy3B0DGWksCqk
         iA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701396588; x=1702001388;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZARUzLOCPbgkdrEMse1VgYWmJt+Qe6ydA0SeWnrZFk4=;
        b=FNSKZP66HC4tKLh4G6D+8mhJr9yPkK8/SyYRw8euK8ivp+vLUK/l65utIfnlc7QtDX
         wG4t646dncAsLo+uD0A4++eFTbRnpyvpWghb6XKcfYwFVF0fh+eDKJXdKQ+BToWgd1XT
         qu8loxW7GzqJaUBp60LTRlOZnHd79yiuPB/jEWPpb+ZHHInuENily/xH7tB+4TRj3jUV
         JbKmPDENCqydDIr69QiVxH+XfSjzOCZpgd4hY82dXDdzslBomogmc6IVqCXGU04EZUQ0
         EgOOLvV/MjcI0DHaztxCmIhDsyp0OTNW+NSWLn5b9t8IvoMnRUvTL7gf+z3yvTcvOP4Y
         keSw==
X-Gm-Message-State: AOJu0YzLPAHs5Te7e5SP/xZPp/Yqths6+2dSmVIHGSCYD2YYYMLBTbx2
	FyAIn7m2JeQtkN5PgWWMyyFZxQ==
X-Google-Smtp-Source: AGHT+IFrFltqEh9QH9Yno5D9numI3ZTsffVOt7/NhqriRU6xzwbOediCIeDoxAviM9Lpx+G4Hg5LGg==
X-Received: by 2002:a05:6a20:8409:b0:18b:8dfa:88e8 with SMTP id c9-20020a056a20840900b0018b8dfa88e8mr25889206pzd.43.1701396587726;
        Thu, 30 Nov 2023 18:09:47 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:83aa:9da8:481:b9cc:c515? ([2402:7500:4ce:83aa:9da8:481:b9cc:c515])
        by smtp.gmail.com with ESMTPSA id e12-20020a17090301cc00b001cc436e9806sm2092007plh.81.2023.11.30.18.09.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 18:09:47 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v2 05/13] crypto: simd - Update `walksize` in simd
 skcipher
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231128172204.GB1148@sol.localdomain>
Date: Fri, 1 Dec 2023 10:09:43 +0800
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
Message-Id: <9F698DA6-51EB-4819-AE5C-1E6B145B4EF2@sifive.com>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-6-jerry.shih@sifive.com>
 <20231128035814.GH1463@sol.localdomain>
 <56F07E23-CA7D-466B-84C7-643F2839E199@sifive.com>
 <20231128172204.GB1148@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_180949_584521_D33E949D 
X-CRM114-Status: GOOD (  22.24  )
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

On Nov 29, 2023, at 01:22, Eric Biggers <ebiggers@kernel.org> wrote:
> On Tue, Nov 28, 2023 at 01:38:29PM +0800, Jerry Shih wrote:
>> On Nov 28, 2023, at 11:58, Eric Biggers <ebiggers@kernel.org> wrote:
>>> On Mon, Nov 27, 2023 at 03:06:55PM +0800, Jerry Shih wrote:
>>>> The `walksize` assignment is missed in simd skcipher.
>>>> 
>>>> Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
>>>> ---
>>>> crypto/cryptd.c | 1 +
>>>> crypto/simd.c   | 1 +
>>>> 2 files changed, 2 insertions(+)
>>>> 
>>>> diff --git a/crypto/cryptd.c b/crypto/cryptd.c
>>>> index bbcc368b6a55..253d13504ccb 100644
>>>> --- a/crypto/cryptd.c
>>>> +++ b/crypto/cryptd.c
>>>> @@ -405,6 +405,7 @@ static int cryptd_create_skcipher(struct crypto_template *tmpl,
>>>> 		(alg->base.cra_flags & CRYPTO_ALG_INTERNAL);
>>>> 	inst->alg.ivsize = crypto_skcipher_alg_ivsize(alg);
>>>> 	inst->alg.chunksize = crypto_skcipher_alg_chunksize(alg);
>>>> +	inst->alg.walksize = crypto_skcipher_alg_walksize(alg);
>>>> 	inst->alg.min_keysize = crypto_skcipher_alg_min_keysize(alg);
>>>> 	inst->alg.max_keysize = crypto_skcipher_alg_max_keysize(alg);
>>>> 
>>>> diff --git a/crypto/simd.c b/crypto/simd.c
>>>> index edaa479a1ec5..ea0caabf90f1 100644
>>>> --- a/crypto/simd.c
>>>> +++ b/crypto/simd.c
>>>> @@ -181,6 +181,7 @@ struct simd_skcipher_alg *simd_skcipher_create_compat(const char *algname,
>>>> 
>>>> 	alg->ivsize = ialg->ivsize;
>>>> 	alg->chunksize = ialg->chunksize;
>>>> +	alg->walksize = ialg->walksize;
>>>> 	alg->min_keysize = ialg->min_keysize;
>>>> 	alg->max_keysize = ialg->max_keysize;
>>> 
>>> What are the consequences of this bug?  I wonder if it actually matters?  The
>>> "inner" algorithm is the one that actually gets used for the "walk", right?
>>> 
>>> - Eric
>> 
>> Without this, we might still use chunksize or cra_blocksize as the walksize
>> even though we setup with the larger walksize.
>> 
>> Here is the code for the walksize default value:
>> 	static int skcipher_prepare_alg(struct skcipher_alg *alg)
>> 	{
>> 		...
>> 		if (!alg->chunksize)
>> 			alg->chunksize = base->cra_blocksize;
>> 		if (!alg->walksize)
>> 			alg->walksize = alg->chunksize;
>> 
>> And we already have the bigger walksize for x86 aes-xts.
>> 		.base = {
>> 			.cra_name		= "__xts(aes)",
>> 			...
>> 		},
>> 		.walksize	= 2 * AES_BLOCK_SIZE,
>> 
>> The x86 aes-xts only uses one `walk` to handle the tail elements. It assumes
>> that the walksize contains 2 aes blocks. If walksize is not set correctly, maybe
>> some tail elements is not processed in simd-cipher mode for x86 aes-xts.
> 
> With the SIMD helper there are three "algorithms": the underlying algorithm, the
> cryptd algorithm, and the simd algorithm.  This patch makes the "walksize"
> property be propagated from the underlying algorithm to the cryptd and simd
> algorithms.  I don't see how that actually makes a difference, since the only
> place the skcipher_walk happens is on the underlying algorithm.  So it uses the
> "walksize" from the underlying algorithm, right?
> 
> - Eric

Yes, you are right.
I re-check the cryptd and simd cipher flow. They use the underlying algorithms.
So, the actual `walksize` in the underlying algorithm is set by the user in
skcipher_alg def.
The x86 aes-xts works correctly for both cryptd and simd-cipher case.

This patch becomes fixing the `walksize` display error in `/proc/crypto`.

The aes-xts skcipher_alg def:
	...
	.ivsize = AES_BLOCK_SIZE,
	.chunksize = AES_BLOCK_SIZE,
	.walksize = AES_BLOCK_SIZE * 8,
	.base = {
		.cra_flags = CRYPTO_ALG_INTERNAL,
		.cra_name = "__xts(aes)",
		.cra_driver_name = "__xts-aes-riscv64-zvkned-zvbb-zvkg",
		...
	},


Without patch:	
The original skcipher:
	name         : __xts(aes)
	driver       : __xts-aes-riscv64-zvkned-zvbb-zvkg
	internal     : yes
	async        : no
	...
	walksize     : 128

The async skcipher registered by simd_register_skciphers_compat:
	name         : xts(aes)
	driver       : xts-aes-riscv64-zvkned-zvbb-zvkg
	internal     : no
	async        : yes
	...
	walksize     : 16

	...
	name         : __xts(aes)
	driver       : cryptd(__xts-aes-riscv64-zvkned-zvbb-zvkg)
	internal     : yes
	async        : yes
	...
	walksize     : 16

With patch:
	name         : xts(aes)
	driver       : xts-aes-riscv64-zvkned-zvbb-zvkg
	internal     : no
	async        : yes
	...
	walksize     : 128

	...
	name         : __xts(aes)
	driver       : cryptd(__xts-aes-riscv64-zvkned-zvbb-zvkg)
	internal     : yes
	async        : yes
	...
	walksize     : 128


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

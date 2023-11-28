Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF0DC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 04:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u65v+bAvcObsk+HiQfZKGyQr88EBV8ZmXrtL/Qael9M=; b=HO8ZbsRxkxvn2A
	cN0H5A2K3lSd+goJ/0gK/QzWZL/Nlo+FrUi3PrnNcul++7uTrfG+Dm7aydoylB79o3hXVTjLlZlM5
	4gN20Yj8KHbXm/WHfO4oN9tY5GejN7yRRPiMZoxy6X304vI4enx5sKtK43q7UMZtnVtplAJ02Sig1
	d92LSUc9KudE+TFRm5GbQyZbdbuwLKnxR91Sna+b6iD6tbpMHZ39rikILLUtA0ft7OrFfV33xikLB
	t4KWYqGeSoKavK74OiTfotKIB5Upsc9zZZUCgw/jSuL5cm81Em0TFTIGVija7SMOtL4Q1xHbfa1UJ
	crZBsWsLVPNFxjN4kFwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pcL-0042XM-0z;
	Tue, 28 Nov 2023 04:22:37 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7pcH-0042WG-2R
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 04:22:35 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-285741e9a9aso3447739a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 20:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701145352; x=1701750152; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgMs+FA2uRdRydo7QTTHxfVxYoJ/VeG+Rds1RS5XwD8=;
        b=J+kjO3V/oc+UWKAXLV5qhQFiMpL/WYIw9N/a7EjTy2FCLfoUh+1kA6Y7KRoqgVVVrX
         xNSe51ydOOXq/Y1bn1j/Ejct9T/1xsmW0ydolGpReMbCDYZO6Bc1mEankBSNMXOrP/Rn
         2p5XAZ1JPUzReuwfX0rktKjajpwozwuug1byHIOo9lSat79CFhULP099R9FMC4Tr1yEK
         B9jykEgUrU4zfjuDsT7psJja51QxnjC6eHYlcGHxkJHbaxEnUiwDCbz7YPvPIBBjt6zi
         kCJ0sbatkPxhb17j2k+UI/jyXam7KSiJ2P8nJ9X6y1olx1NOT+ivUXMrmheG6B/PrFpf
         OHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701145352; x=1701750152;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgMs+FA2uRdRydo7QTTHxfVxYoJ/VeG+Rds1RS5XwD8=;
        b=UTC+rrSR+AfFQUMB4kNhqR5c30EdebKHEXClnwOGtH523o3AY/SkRcFJhyfbBxV/qs
         ysoobalvDCJnQ46DjE/a/yALbDHD9YvLgrlEfp+uanwehfYoNH1WPda/YYsG+av+CO5f
         fhp0DtKMe9anL0p4YQzsSinUCcZJqMCOYSFGd5EIdP4Gls1PY6KiudOxpG/YL6N7IDp5
         5W6gRAA+PwpQoFtvVjD//7Tx0i0ZUQvJWaaj4hXFN1yM4cO5U6TOKbDMDMMFT4ABqMLx
         JogS0D66ExWJ4WGOhlWGe2tFLKzaxJxRpb32B8famPEz++2s7Gqu7WEIqI9EdsLS9BHr
         CoRw==
X-Gm-Message-State: AOJu0YwxX+IUYpdKUALrLKKnWGImwPa9H/1ZS3e5YAD+veFpwKQd8J4a
	4upvVjx4ma/aEiB5hlBgrM4jZA==
X-Google-Smtp-Source: AGHT+IHHG3HHcqIdeyqhTum97P/I46I9Hh5VumkUxPbdNd8VW8kcRCxRWILwSKP5Mcr6OJhpTLtfqQ==
X-Received: by 2002:a17:90a:190e:b0:285:8cb1:7f53 with SMTP id 14-20020a17090a190e00b002858cb17f53mr12960246pjg.31.1701145352037;
        Mon, 27 Nov 2023 20:22:32 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:8338:14c0:b892:2482:e230? ([2402:7500:4ce:8338:14c0:b892:2482:e230])
        by smtp.gmail.com with ESMTPSA id pm18-20020a17090b3c5200b00285e53d90cesm1567515pjb.26.2023.11.27.20.22.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Nov 2023 20:22:31 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v2 04/13] RISC-V: crypto: add Zvkned accelerated AES
 implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231128035630.GG1463@sol.localdomain>
Date: Tue, 28 Nov 2023 12:22:26 +0800
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
Message-Id: <8BE5BD19-7401-455D-838B-56264F78471B@sifive.com>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-5-jerry.shih@sifive.com>
 <20231128035630.GG1463@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_202233_859250_223B75A4 
X-CRM114-Status: GOOD (  20.60  )
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

On Nov 28, 2023, at 11:56, Eric Biggers <ebiggers@kernel.org> wrote:
> On Mon, Nov 27, 2023 at 03:06:54PM +0800, Jerry Shih wrote:
>> +int riscv64_aes_setkey(struct crypto_aes_ctx *ctx, const u8 *key,
>> +		       unsigned int keylen)
>> +{
>> +	int ret;
>> +
>> +	ret = aes_check_keylen(keylen);
>> +	if (ret < 0)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * The RISC-V AES vector crypto key expanding doesn't support AES-192.
>> +	 * Use the generic software key expanding for that case.
>> +	 */
>> +	if ((keylen == 16 || keylen == 32) && crypto_simd_usable()) {
>> +		/*
>> +		 * All zvkned-based functions use encryption expanding keys for both
>> +		 * encryption and decryption.
>> +		 */
>> +		kernel_vector_begin();
>> +		rv64i_zvkned_set_encrypt_key(key, keylen, ctx);
>> +		kernel_vector_end();
>> +	} else {
>> +		ret = aes_expandkey(ctx, key, keylen);
>> +	}
> 
> rv64i_zvkned_set_encrypt_key() does not initialize crypto_aes_ctx::key_dec.
> So, decryption results will be incorrect if !crypto_simd_usable() later.

Will we have the situation that `crypto_simd_usable()` condition is not consistent
during the aes_setkey(), aes_enc/dec()? If yes, all accelerated(or HW specific)
crypto algorithms should do the same implementations as the sw fallback path
since the `crypto_simd_usable()` will change back and forth.

>> +static int aes_setkey(struct crypto_tfm *tfm, const u8 *key,
>> +		      unsigned int keylen)
> 
> It's best to avoid generic-sounding function names like this that could collide
> with functions in crypto/ or lib/crypto/.  A better name for this function, for
> example, would be aes_setkey_zvkned().

Thx, I will fix that.

>> diff --git a/arch/riscv/crypto/aes-riscv64-zvkned.pl b/arch/riscv/crypto/aes-riscv64-zvkned.pl
>> new file mode 100644
>> index 000000000000..303e82d9f6f0
>> --- /dev/null
>> +++ b/arch/riscv/crypto/aes-riscv64-zvkned.pl
> [...]
>> +L_enc_128:
> [...]
>> +L_enc_192:
> [...]
>> +L_enc_256:
> 
> There's some severe source code duplication going on in the AES assembly, with
> the three AES variants having separate source code.  You can just leave this
> as-is since this is what was merged into OpenSSL and we are borrowing that for
> now, but I do expect that we'll want to clean this up later.

Do we prefer the code with the branches instead of the specified implementation?
We could make AES-128/192/256 together like:

    @{[vaesz_vs $V24, $V1]}
    @{[vaesem_vs $V24, $V2]}
    @{[vaesem_vs $V24, $V3]}
    @{[vaesem_vs $V24, $V4]}
    @{[vaesem_vs $V24, $V5]}
    @{[vaesem_vs $V24, $V6]}
    @{[vaesem_vs $V24, $V7]}
    @{[vaesem_vs $V24, $V8]}
    @{[vaesem_vs $V24, $V9]}
    @{[vaesem_vs $V24, $V10]}
    beq $ROUND, $ROUND_11, 1f
    @{[vaesem_vs $V24, $V11]}
    @{[vaesem_vs $V24, $V12]}
    beq $ROUND, $ROUND_13, 1f
    @{[vaesem_vs $V24, $V13]}
    @{[vaesem_vs $V24, $V14]}
1:
    @{[vaesef_vs $V24, $V15]}

But we will have the additional costs for the branches.

> - Eric




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

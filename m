Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19ED1C5ACB3
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 02:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EdkSQXrlfGdHMkiOVGeWm2mLvfhvLGXJeP9Sx/paqY=; b=FnHZuY1LDcr49W
	syZD35YIqvAr5iqY8488XRuSX9RdDORCk7v4XV2AQCv5yIQGEtJzuQok7ex1uYIqmWBTdK52T51Up
	d0N5uV0WPj43OwRpGE33D8mPvYT1PgUu3z7wmunVCnqioawNW2aI7z2oPlV9GkL9++bnwdg9as3u4
	agP+DxWFV6dSef/taCqpcmIpRZeUg8lShYym6iPtkOYsU2Z6+vMsOjwUxu17x9LlfV/BcSJJOd5Ck
	QZBbs9wZUIeqWUodaygyps1yySV/S4J8OdcA32oP97QY5L2eRa9/kfe1HoZ6E8WpG1rYrs4qzdeBm
	GZ1bEplFuYf0NUDAwrfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4uRZ-00Az8H-1l;
	Mon, 20 Nov 2023 02:55:25 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4uRW-00Az7Y-2Y
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 02:55:24 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ce28faa92dso30353385ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Nov 2023 18:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700448921; x=1701053721; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yg0x+T7ON9fvA/nzihMoJz0oESLmev7sCZPefVlmBec=;
        b=FkbwW8QMkVWzm/yU8+5SlZC8Ehp4K5GlP9eK/81CNON8RTSgcgAHU0dZd6mH5bIORe
         BeWsEVBtQDoowg9WNY5GAA9rRhjOOMAWWaWOgQ4bPSCula18DriueFp0+7iLTS1Ixb2x
         xjwGp8PBVv1TEc6p4rkK3fGPqQOii9b2+NdqTtr+4iXVrQUmoxK0H5pKYsQV0G5QRCVI
         pYrXRfqDRH9wWKPKH8SPDRAysd1gPJgU4kBAfjVm5RbuccT0G+kR6aYnGe4h7FMabzmn
         cIjflQYE3p6+cPvFYcMT4AqYNUhpMqv8j8uSTFxe36r+KOnbbajXZ+kxCcB02fnZvwiH
         9Mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700448921; x=1701053721;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yg0x+T7ON9fvA/nzihMoJz0oESLmev7sCZPefVlmBec=;
        b=rJ9uyEVkOvbymHk2rIhZjYsReAgG8sPZjB0oL7R0kRFWePMMPK2QS7zTSZSDCw/1ey
         g49FhN3001eL+gFXqIL0TL5dZS96ODI7356LRbLhk/z0f37fvFg2HIMqSrMc3KVzo733
         3JNCUmrqXa2DiaW1/z1+/9NcEDyftrwpf6OD4ElyMLq2XPLfgnt7gOTJR1kSea3XO7HD
         ZHbeE+t6r2mRXdPxiTzZvQEa91vVKkfusJwTnzuC3ksiDzu3bd8ScepcI3CxaAaAIDeZ
         dbziZyf3o6RtaEPI4vqfHsUtDktFeouGOOfzOzEjxuoOv4bvi4i8EcYzXGdOxhB0HCVb
         FMGw==
X-Gm-Message-State: AOJu0Yy9K2BL8YXehlDU8bFbtl6jEvZeek61PpdDxq1AIyqGBLZXoeNx
	TQaCsPVRM24oQ/zbJRffSYGmuA==
X-Google-Smtp-Source: AGHT+IFuUjPi2Oe7rzisQHOcyNkxqx5t2yhJXAk9a4Ri2HQ4FV08v9d3S1jEA/pZSew+J7asN5OR5A==
X-Received: by 2002:a17:902:8b85:b0:1ca:86b:7ed9 with SMTP id ay5-20020a1709028b8500b001ca086b7ed9mr4657249plb.40.1700448920948;
        Sun, 19 Nov 2023 18:55:20 -0800 (PST)
Received: from ?IPv6:2402:7500:5d5:bc21:3420:fefa:20d4:2a2f? ([2402:7500:5d5:bc21:3420:fefa:20d4:2a2f])
        by smtp.gmail.com with ESMTPSA id y12-20020a170902ed4c00b001cc256ce1besm4928265plb.138.2023.11.19.18.55.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Nov 2023 18:55:20 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 12/12] RISC-V: crypto: add Zvkb accelerated ChaCha20
 implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231102054327.GH1498@sol.localdomain>
Date: Mon, 20 Nov 2023 10:55:15 +0800
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 andy.chiu@sifive.com,
 greentime.hu@sifive.com,
 conor.dooley@microchip.com,
 guoren@kernel.org,
 bjorn@rivosinc.com,
 heiko@sntech.de,
 ardb@kernel.org,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <90E2B1B4-ACC1-4316-81CD-E919D3BD03BA@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-13-jerry.shih@sifive.com>
 <20231102054327.GH1498@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_185522_851583_DE2A3529 
X-CRM114-Status: GOOD (  11.73  )
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

On Nov 2, 2023, at 13:43, Eric Biggers <ebiggers@kernel.org> wrote:
> On Thu, Oct 26, 2023 at 02:36:44AM +0800, Jerry Shih wrote:
>> +static struct skcipher_alg riscv64_chacha_alg_zvkb[] = { {
>> +	.base = {
>> +		.cra_name = "chacha20",
>> +		.cra_driver_name = "chacha20-riscv64-zvkb",
>> +		.cra_priority = 300,
>> +		.cra_blocksize = 1,
>> +		.cra_ctxsize = sizeof(struct chacha_ctx),
>> +		.cra_module = THIS_MODULE,
>> +	},
>> +	.min_keysize = CHACHA_KEY_SIZE,
>> +	.max_keysize = CHACHA_KEY_SIZE,
>> +	.ivsize = CHACHA_IV_SIZE,
>> +	.chunksize = CHACHA_BLOCK_SIZE,
>> +	.walksize = CHACHA_BLOCK_SIZE * 4,
>> +	.setkey = chacha20_setkey,
>> +	.encrypt = chacha20_encrypt,
>> +	.decrypt = chacha20_encrypt,
>> +} };
>> +
>> +static inline bool check_chacha20_ext(void)
>> +{
>> +	return riscv_isa_extension_available(NULL, ZVKB) &&
>> +	       riscv_vector_vlen() >= 128;
>> +}
>> +
>> +static int __init riscv64_chacha_mod_init(void)
>> +{
>> +	if (check_chacha20_ext())
>> +		return crypto_register_skciphers(
>> +			riscv64_chacha_alg_zvkb,
>> +			ARRAY_SIZE(riscv64_chacha_alg_zvkb));
>> +
>> +	return -ENODEV;
>> +}
>> +
>> +static void __exit riscv64_chacha_mod_fini(void)
>> +{
>> +	if (check_chacha20_ext())
>> +		crypto_unregister_skciphers(
>> +			riscv64_chacha_alg_zvkb,
>> +			ARRAY_SIZE(riscv64_chacha_alg_zvkb));
>> +}
> 
> When there's just one algorithm being registered/unregistered,
> crypto_register_skcipher() and crypto_unregister_skcipher() can be used.

Fixed.

>> +# - RV64I
>> +# - RISC-V Vector ('V') with VLEN >= 128
>> +# - RISC-V Vector Cryptography Bit-manipulation extension ('Zvkb')
>> +# - RISC-V Zicclsm(Main memory supports misaligned loads/stores)
> 
> How is the presence of the Zicclsm extension guaranteed?
> 
> - Eric

I have the addition extension parser for `Zicclsm` in the v2 patch set.


-Jerry


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

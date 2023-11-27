Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09251C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 02:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKQTie/qusu1pdnTByuqEIbu1XODjs9lQFCiV8yMOYY=; b=kq5Avt90BGjQXH
	6Vur8N03ZGVr8B3d1kA1JpYM2iCa7BsGiQ/qYtJrKAwUj9MAFVd6Epd3uH0+vIgTLKXUFukUHHH7j
	aQtX9FmhH8FcT5h/08vCFRVSWOpNpuFdDWnAzDfxhoJKUjM5qln8N48GNVrrJutT7sfgoM6BNX2cT
	gEA8mEfWu0NRjm++PM4KcM2l7vpbG5yx7fZvBWtldM53hfyfKYRyUkcX+11EqXud7yUUzXzBxq32d
	NhgW+hsRlb8iBz0Tt28qXfaKFNzLZehJMVnwKOG83nb5A7+yRgGOIoQuFrlyvwubv7dFD7DVk6Nx0
	eGOUtiags5kXyX7gAk7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7RhM-000wuh-2C;
	Mon, 27 Nov 2023 02:50:12 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7RhK-000wsQ-0M
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 02:50:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cfbce92362so6514915ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 18:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701053409; x=1701658209; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJDYU9ePuMyONSdH/Hmp5teasBzIstryZsSquW0uRgs=;
        b=dZF2f40xqh7W29dW3dxBv0G31Ds+AY8z3qEtMqlHAOFnSbgCGnYAJ/OpmIIyECkvBb
         EA79KlILyTv+fx9080CzQYZIZWQekADdZpqVVyfAWeQ3QRvMBrHeAVzGJ//PeEHVuaAf
         M4Ubmd7l2eAKS8vKezwW59yZHNQfCGIO4nnDFVqibPKzPVAam6dReK4tiigBseI9OQ0E
         r799EpRayJBfSKlUHUOmPeeUb/OvrP87hqX80jUdAYX3yiFQjHgfP5Gny2pkaeYz348V
         9nnX1xAZmtWpE858ewOAng22GrF7I2w1OuLRKTdonhS+hRlHhaYiRo9YCOcDPlOYOi8H
         ay4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701053409; x=1701658209;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJDYU9ePuMyONSdH/Hmp5teasBzIstryZsSquW0uRgs=;
        b=dVegPN8EPwneGWVbQStEw5sey007gKhWk7/tOqcp+Bnp5MNudY5yuXAib57kIswZ1Z
         njeUOZ69BnBMZwpFhLUfdL6WSkC1YlWrjX8baD/n2eVrI2HwzPWYKvIjIitgyxHmw/wc
         OxqetLPfsTWBcDWf+mxER2Hnp6ec/5yRwmLIDCXYgJdtgqfoEHPUNtLKJ1SmCcjizKQS
         9PAqhMVFzaL/4wvGH8nUjYeO1m/bZCeUkcMLM7Ydt4IZ2s2+vlpXc6l7vOin7Vw0kkI2
         nSz0cdqOEy5TTVgmIEMBAWiUfLLihN5BybEC6N93/8MBr4v25D3DoXtU0k2EFa3qSzYo
         amFw==
X-Gm-Message-State: AOJu0YyjM7ZE1CafVatDdXN0X9ajLYrVb8WbztLwoHUYMoIYcg/bob/p
	gQd007W4/z69gcpqRQITE59VUQ==
X-Google-Smtp-Source: AGHT+IE6Byv2GXYDkP+I0VNXSKjtXLqAjEy3RG6g235VNudLgF/NCLhIFFJiZRP/ESQyACaudebM8g==
X-Received: by 2002:a17:903:2585:b0:1cf:68c8:7a18 with SMTP id jb5-20020a170903258500b001cf68c87a18mr12143435plb.14.1701053408996;
        Sun, 26 Nov 2023 18:50:08 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:95c7:2856:b238:775:b338? ([2402:7500:4ce:95c7:2856:b238:775:b338])
        by smtp.gmail.com with ESMTPSA id o4-20020a1709026b0400b001b898595be7sm7028182plk.291.2023.11.26.18.50.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Nov 2023 18:50:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 09/12] RISC-V: crypto: add Zvknhb accelerated SHA384/512
 implementations
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231122013210.GH2172@sol.localdomain>
Date: Mon, 27 Nov 2023 10:50:04 +0800
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
Message-Id: <9BB2B250-8A35-4116-A43B-55FC477A5B06@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-10-jerry.shih@sifive.com>
 <20231122013210.GH2172@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_185010_153279_AB3FA6E5 
X-CRM114-Status: GOOD (  10.96  )
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

On Nov 22, 2023, at 09:32, Eric Biggers <ebiggers@kernel.org> wrote:
> On Thu, Oct 26, 2023 at 02:36:41AM +0800, Jerry Shih wrote:
>> +static int riscv64_sha512_update(struct shash_desc *desc, const u8 *data,
>> +				 unsigned int len)
>> +{
>> +	int ret = 0;
>> +
>> +	/*
>> +	 * Make sure struct sha256_state begins directly with the SHA256
>> +	 * 256-bit internal state, as this is what the asm function expect.
>> +	 */
>> +	BUILD_BUG_ON(offsetof(struct sha512_state, state) != 0);
> 
> There's a copy-paste error here; all the 256 above should be 512.

Fixed.

>> +static struct shash_alg sha512_alg[] = {
>> +	{
>> +		.digestsize = SHA512_DIGEST_SIZE,
>> +		.init = sha512_base_init,
>> +		.update = riscv64_sha512_update,
>> +		.final = riscv64_sha512_final,
>> +		.finup = riscv64_sha512_finup,
>> +		.descsize = sizeof(struct sha512_state),
>> +		.base.cra_name = "sha512",
>> +		.base.cra_driver_name = "sha512-riscv64-zvkb-zvknhb",
>> +		.base.cra_priority = 150,
>> +		.base.cra_blocksize = SHA512_BLOCK_SIZE,
>> +		.base.cra_module = THIS_MODULE,
>> +	},
>> +	{
>> +		.digestsize = SHA384_DIGEST_SIZE,
>> +		.init = sha384_base_init,
>> +		.update = riscv64_sha512_update,
>> +		.final = riscv64_sha512_final,
>> +		.finup = riscv64_sha512_finup,
>> +		.descsize = sizeof(struct sha512_state),
>> +		.base.cra_name = "sha384",
>> +		.base.cra_driver_name = "sha384-riscv64-zvkb-zvknhb",
>> +		.base.cra_priority = 150,
>> +		.base.cra_blocksize = SHA384_BLOCK_SIZE,
>> +		.base.cra_module = THIS_MODULE,
>> +	}
>> +};
> 
> *_algs instead of *_alg when there's more than one, please.
> I.e., sha512_alg => sha512_algs here.

Fixed.

> - Eric


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

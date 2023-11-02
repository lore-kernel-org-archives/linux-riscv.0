Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45042C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 05:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BIISzOyZxoabOLMT24aHxP1bPnYhAjPILSGJwGLMsDs=; b=nAtdRw8yJ84BPw
	PasZXDanVly5UtikMF5finsgbzSmrBNMM+tGm8elVBy+NFAliyfnLbBdlD4Outq4EA+QAE+iF3GcS
	o7iZl1ChsRgLT2IwinF7VHm26nrOpgI5ZdUNVlcLbawvIeUUIG4rDflWeScV1Mp8enU2By8kpafVM
	LKiE7PtBv+wFcxXgazE1VKk0oF1lZwmWnF6oueT6m1R4/qjnNtBGM4vmND0CgpyxcagSj9/EbgXWn
	9ZLeBewQI3Ypfwd234uF+JsKS3UtPTAaXYiSGu0NCCX7Mn3iv3srGDRGoXfuNXeMhabEagjCNTW08
	MWFTbvKUulmlFG7jXB5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyQUQ-008m9N-2t;
	Thu, 02 Nov 2023 05:43:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyQUN-008m8p-2B
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 05:43:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 328A2B81BDE;
	Thu,  2 Nov 2023 05:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041C9C433C8;
	Thu,  2 Nov 2023 05:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698903809;
	bh=ptXWBqG/5/N20EjAoLJcSbKkpw8UYizDxZ7qmFczEZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NsUDOcegxMfT3N0PyIitMJFmWqA9uGO2I2KjwtRvGVRyd1yvaBKsxKne2Sb3j6t1x
	 XUtHyz2ZrrTUFPOY8E4D08VGM/rw0/JMNKF3PZJ7KXJTQpNXkz7w2QcVlR92d9h/iG
	 NwZXHzzw9hdU0exJQ8vqMfuHIzVcmdGa0EN59WblZC1jE3we3uh+TATRUqEfIDI7p2
	 zdBuobfnYOOIVb3WPUua8EtmvWNqUEiJ6n7moiiF8oMfApkLJ2mQ3XUzNrgtZpJi2a
	 hZtTtzUc748wFeyvg27BlTsBcbd1qeCMZEE6cxKXj1xHkhKj8Ayoz0X48NpSzaBPwj
	 3Jsi0k7n0l6wQ==
Date: Wed, 1 Nov 2023 22:43:27 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andy.chiu@sifive.com, greentime.hu@sifive.com,
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com,
	heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 12/12] RISC-V: crypto: add Zvkb accelerated ChaCha20
 implementation
Message-ID: <20231102054327.GH1498@sol.localdomain>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-13-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025183644.8735-13-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_224331_893547_7662070E 
X-CRM114-Status: GOOD (  10.35  )
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

On Thu, Oct 26, 2023 at 02:36:44AM +0800, Jerry Shih wrote:
> +static struct skcipher_alg riscv64_chacha_alg_zvkb[] = { {
> +	.base = {
> +		.cra_name = "chacha20",
> +		.cra_driver_name = "chacha20-riscv64-zvkb",
> +		.cra_priority = 300,
> +		.cra_blocksize = 1,
> +		.cra_ctxsize = sizeof(struct chacha_ctx),
> +		.cra_module = THIS_MODULE,
> +	},
> +	.min_keysize = CHACHA_KEY_SIZE,
> +	.max_keysize = CHACHA_KEY_SIZE,
> +	.ivsize = CHACHA_IV_SIZE,
> +	.chunksize = CHACHA_BLOCK_SIZE,
> +	.walksize = CHACHA_BLOCK_SIZE * 4,
> +	.setkey = chacha20_setkey,
> +	.encrypt = chacha20_encrypt,
> +	.decrypt = chacha20_encrypt,
> +} };
> +
> +static inline bool check_chacha20_ext(void)
> +{
> +	return riscv_isa_extension_available(NULL, ZVKB) &&
> +	       riscv_vector_vlen() >= 128;
> +}
> +
> +static int __init riscv64_chacha_mod_init(void)
> +{
> +	if (check_chacha20_ext())
> +		return crypto_register_skciphers(
> +			riscv64_chacha_alg_zvkb,
> +			ARRAY_SIZE(riscv64_chacha_alg_zvkb));
> +
> +	return -ENODEV;
> +}
> +
> +static void __exit riscv64_chacha_mod_fini(void)
> +{
> +	if (check_chacha20_ext())
> +		crypto_unregister_skciphers(
> +			riscv64_chacha_alg_zvkb,
> +			ARRAY_SIZE(riscv64_chacha_alg_zvkb));
> +}

When there's just one algorithm being registered/unregistered,
crypto_register_skcipher() and crypto_unregister_skcipher() can be used.

> +# - RV64I
> +# - RISC-V Vector ('V') with VLEN >= 128
> +# - RISC-V Vector Cryptography Bit-manipulation extension ('Zvkb')
> +# - RISC-V Zicclsm(Main memory supports misaligned loads/stores)

How is the presence of the Zicclsm extension guaranteed?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

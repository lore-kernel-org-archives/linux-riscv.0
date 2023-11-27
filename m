Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99806C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 02:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ArqVLybEcjAcx8ItAg98PDDR7s7Bjtr4nMd+qftaBcw=; b=grdD/+4//D+3y8
	MdebylygvMkKSYDTLy9wN7rxZDuhAIZLxF57/Zy+Vw52Q4gZzaaMI18+p/ADZyaZ/6bLbylwUyT1v
	wUL4kNGpc6nN8U6vJuQFiNNJKGJi0zSTRzNzLDlS6cqMWmrjoMSAwRQ4jHDqejCOBXHGmgeGtgikj
	Q8+BQ49vaJznHcDOjYWI91quCTjj/pvJ/EcAdzsJQQ8OsoDIy4OyNJsyEbhCTd3QYGNXXke3Zkh4x
	vRGuLktPYJA4veyGoLW/3pFY/Ct0nGDXBjrgqPLsoxBMS/d7BYxagsj2nVCsJz0/KbywOZakF8WH7
	H/0IUfEUmeTQe1j1RfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7R8w-000dY3-1o;
	Mon, 27 Nov 2023 02:14:38 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7R8t-000dVM-0t
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 02:14:37 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6c398717726so2920540b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 18:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701051273; x=1701656073; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQuCTKkjoab2EfyY20C3fybDK6Ql2G05fa9QjwE7uds=;
        b=T4RY5brnytGZDi6TAYWsVQklcETVWzMm+8+tf8pBc252z8YABAEpODZGGS6cRHamNR
         DNIFHlZT61h7BcgBNQGIWjQSafbRKI/iA3l53ZSO4poYeZxEe19SNSgedTpj7pgiCyvb
         sHn3jN0ffkGaNHvO+xPulnFDJoz2+R/Fd5SfBruq/tkAZm0NFbpHNAlsuuA7jbp2kjsg
         BzintUNsy+lOtN6p7wE0hTnvRxrO3HtlFAESYUmiveENu420NOlHoLeyWCA+5GKqymUj
         37Ook4WTgOSR5tnelwJcQ+TR22b2UMAY6pvuFPwcviMxxALZCMGmIEuRY3KEU+8eYcYd
         02wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701051273; x=1701656073;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQuCTKkjoab2EfyY20C3fybDK6Ql2G05fa9QjwE7uds=;
        b=RzVhSkwp0RC8rU8wXjh8w6xQFhuOZXHOndoOY/RCORCPRXr93m+RM5g5M48YzLCwDj
         wkLUSYGIR7BlGG2q8ehg+hUb0EzL3nQx6DPzobX1gKo+qQ790V5+4AJVorNjZtJIbVHj
         cHQr5wVZb9OpCFGjdNNBv3wSKwM0VW9sxfnkx/zqhqO0bkkZ9NoKtaDsrnkG5jEB1XlK
         C4z7dzrS0kI8UuBXSpVllaMJrCpxff8CKg5G2DI9kdcsZPYS3doZn9wRm7GrUGpKwRfe
         axCxFswczuRczb6yHd+/qUEnY3yOz/G6TqEPyiovAC3S+Rf9c/+evT2viI280E5njPlt
         lkIg==
X-Gm-Message-State: AOJu0Yx0gcF2lARzJNXnikXTCXtNba/H2YSZ12iOEzeEwDoVYIDKaQbO
	zBg+Z6AXFThbtu48ks+zP1WkqQ==
X-Google-Smtp-Source: AGHT+IGCytZMxu7H10W/RpstzoB24pSc/2pOM0mtxh/XBOupAfkyHHRrNPwHxAWsSzb0+rVLqYYqmg==
X-Received: by 2002:a05:6a20:8403:b0:18b:a011:f955 with SMTP id c3-20020a056a20840300b0018ba011f955mr10693520pzd.60.1701051273409;
        Sun, 26 Nov 2023 18:14:33 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:95c7:2856:b238:775:b338? ([2402:7500:4ce:95c7:2856:b238:775:b338])
        by smtp.gmail.com with ESMTPSA id q16-20020a63cc50000000b0059b782e8541sm6831644pgi.28.2023.11.26.18.14.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Nov 2023 18:14:32 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 12/12] RISC-V: crypto: add Zvkb accelerated ChaCha20
 implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231122012933.GG2172@sol.localdomain>
Date: Mon, 27 Nov 2023 10:14:27 +0800
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
Message-Id: <69B2D415-3626-4D6C-B559-0724EC1CD853@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-13-jerry.shih@sifive.com>
 <20231122012933.GG2172@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_181435_493481_208E96A5 
X-CRM114-Status: GOOD (  18.96  )
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

On Nov 22, 2023, at 09:29, Eric Biggers <ebiggers@kernel.org> wrote:
> On Thu, Oct 26, 2023 at 02:36:44AM +0800, Jerry Shih wrote:
>> diff --git a/arch/riscv/crypto/chacha-riscv64-glue.c b/arch/riscv/crypto/chacha-riscv64-glue.c
>> new file mode 100644
>> index 000000000000..72011949f705
>> --- /dev/null
>> +++ b/arch/riscv/crypto/chacha-riscv64-glue.c
>> @@ -0,0 +1,120 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Port of the OpenSSL ChaCha20 implementation for RISC-V 64
>> + *
>> + * Copyright (C) 2023 SiFive, Inc.
>> + * Author: Jerry Shih <jerry.shih@sifive.com>
>> + */
>> +
>> +#include <asm/simd.h>
>> +#include <asm/vector.h>
>> +#include <crypto/internal/chacha.h>
>> +#include <crypto/internal/simd.h>
>> +#include <crypto/internal/skcipher.h>
>> +#include <linux/crypto.h>
>> +#include <linux/module.h>
>> +#include <linux/types.h>
>> +
>> +#define CHACHA_BLOCK_VALID_SIZE_MASK (~(CHACHA_BLOCK_SIZE - 1))
>> +#define CHACHA_BLOCK_REMAINING_SIZE_MASK (CHACHA_BLOCK_SIZE - 1)
>> +#define CHACHA_KEY_OFFSET 4
>> +#define CHACHA_IV_OFFSET 12
>> +
>> +/* chacha20 using zvkb vector crypto extension */
>> +void ChaCha20_ctr32_zvkb(u8 *out, const u8 *input, size_t len, const u32 *key,
>> +			 const u32 *counter);
>> +
>> +static int chacha20_encrypt(struct skcipher_request *req)
>> +{
>> +	u32 state[CHACHA_STATE_WORDS];
> 
> This function doesn't need to create the whole state matrix on the stack, since
> the underlying assembly function takes as input the key and counter, not the
> state matrix.  I recommend something like the following:
> 
> diff --git a/arch/riscv/crypto/chacha-riscv64-glue.c b/arch/riscv/crypto/chacha-riscv64-glue.c
> index df185d0663fcc..216b4cd9d1e01 100644
> --- a/arch/riscv/crypto/chacha-riscv64-glue.c
> +++ b/arch/riscv/crypto/chacha-riscv64-glue.c
> @@ -16,45 +16,42 @@
> #include <linux/module.h>
> #include <linux/types.h>
> 
> -#define CHACHA_KEY_OFFSET 4
> -#define CHACHA_IV_OFFSET 12
> -
> /* chacha20 using zvkb vector crypto extension */
> asmlinkage void ChaCha20_ctr32_zvkb(u8 *out, const u8 *input, size_t len,
> 				    const u32 *key, const u32 *counter);
> 
> static int chacha20_encrypt(struct skcipher_request *req)
> {
> -	u32 state[CHACHA_STATE_WORDS];
> 	u8 block_buffer[CHACHA_BLOCK_SIZE];
> 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
> 	const struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
> 	struct skcipher_walk walk;
> 	unsigned int nbytes;
> 	unsigned int tail_bytes;
> +	u32 iv[4];
> 	int err;
> 
> -	chacha_init_generic(state, ctx->key, req->iv);
> +	iv[0] = get_unaligned_le32(req->iv);
> +	iv[1] = get_unaligned_le32(req->iv + 4);
> +	iv[2] = get_unaligned_le32(req->iv + 8);
> +	iv[3] = get_unaligned_le32(req->iv + 12);
> 
> 	err = skcipher_walk_virt(&walk, req, false);
> 	while (walk.nbytes) {
> -		nbytes = walk.nbytes & (~(CHACHA_BLOCK_SIZE - 1));
> +		nbytes = walk.nbytes & ~(CHACHA_BLOCK_SIZE - 1);
> 		tail_bytes = walk.nbytes & (CHACHA_BLOCK_SIZE - 1);
> 		kernel_vector_begin();
> 		if (nbytes) {
> 			ChaCha20_ctr32_zvkb(walk.dst.virt.addr,
> 					    walk.src.virt.addr, nbytes,
> -					    state + CHACHA_KEY_OFFSET,
> -					    state + CHACHA_IV_OFFSET);
> -			state[CHACHA_IV_OFFSET] += nbytes / CHACHA_BLOCK_SIZE;
> +					    ctx->key, iv);
> +			iv[0] += nbytes / CHACHA_BLOCK_SIZE;
> 		}
> 		if (walk.nbytes == walk.total && tail_bytes > 0) {
> 			memcpy(block_buffer, walk.src.virt.addr + nbytes,
> 			       tail_bytes);
> 			ChaCha20_ctr32_zvkb(block_buffer, block_buffer,
> -					    CHACHA_BLOCK_SIZE,
> -					    state + CHACHA_KEY_OFFSET,
> -					    state + CHACHA_IV_OFFSET);
> +					    CHACHA_BLOCK_SIZE, ctx->key, iv);
> 			memcpy(walk.dst.virt.addr + nbytes, block_buffer,
> 			       tail_bytes);
> 			tail_bytes = 0;

Fixed.
We will only use the iv instead of the full chacha state matrix.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

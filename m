Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04704C48260
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Feb 2024 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqOS5+xaBImVxx3aid7f8Df7hO3x3OJmwiZs5NQ9y1c=; b=pWkmzJ05ymjRMN
	HMc3vO8r5MkoHtRThqB1/AwwgnyYYyX9jp00WvTf0whIBilnd38/a2Nrqrz42NtcnOkF8FZFu1sj4
	UCxK6OeStjK7h4G6AIsq6CvKIEGkrc0v2YuFE9/Zi8+dn2G4/aq6BgTZ9uvyWOtw8hXCivvLwjGMM
	l+7qWfW+zTS1Od7XtyHl6kPtZ/19cUrNVrruvkMJu93RaDITqdyzpqaG+lBDCPl4k4r/xfywbworh
	Z420RXmiUv1OjU05PlsfFlfT/Vnq4hnUHl98xsQf+R7n0rNZEuBA/xunNWMQaFFo9p7f+/3uyMQ2T
	biLY7uBtY1P1kQqBr4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYpEW-00000001kP5-144M;
	Sat, 10 Feb 2024 15:25:36 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYpET-00000001kOk-3rek
	for linux-riscv@lists.infradead.org;
	Sat, 10 Feb 2024 15:25:35 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d8ef977f1eso16069015ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 10 Feb 2024 07:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707578732; x=1708183532; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlEfppOFDKm/ps4r+9qSEREyPWdjHVQY01GkaqhYUUk=;
        b=XQGu/vHsiZw/QR9yoDbTwLknEZ3CPNpcbqoedZy/LHSN0+d7S+3k2VB1hqJkj+YNL0
         PZRBUjuJkKmSfB21NNn1LgcTudVlpj+o8tQS7XYFIRvCHOKXYobUvJRJOb3YlH8d6ES6
         3vNeKF0pRuoILv1KfYwFIoIYvL+kjrpdq3hfq2J+BMQjalQExuiLQPu82Zt0cxg1rCdb
         wLewAzRYVbg9UaJa2Rk/xKQ9Ictq+RvpaUO73ui3atwuS8BmnfQJA14ip+2yuAbIYOLa
         eVWTF1yjjSkqXE4pp8L2fCFgmTJwnuve2g1QR1Pq2YVI65b9bc1EFOI1BzN7uctlpihw
         B2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707578732; x=1708183532;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlEfppOFDKm/ps4r+9qSEREyPWdjHVQY01GkaqhYUUk=;
        b=rragYawV/4N/J3vtDrB9LFrd7PWfJR9h/7hxOR+n9b48hVQ2IQWhBRjDRet2m7WlKU
         JX7lcBSqiyRItq09Urf/pbyV36aZB1bW8VhaK57nLI1ukphh6I7BGZYL5zblk8e4vlN9
         X0HbDTMMlm1wB6u7YwREDPn6sU2h0OnunTPvgOlm16BPwTDfLOO+aYjpCtQm4z+O0ZTb
         SSYshc7x/By59AZvL0m0tyVswLfemksg/mc30pbujKy9vUKS82tXSL6pthEIloHBInNu
         pkK4KdLu9pYcB4RjJdDlfKfqEgG9Te5Y9iqymzBxz8uYbAf7bLHSLsOWpIR5JM6Fbwae
         NYBA==
X-Gm-Message-State: AOJu0YwOEk4v93jdM57eIGlhyV9+34bikmTK56XIboNbIBB/jFJ2XeFw
	520niznKCUpCe9f4dutG9na94wB3b3vH2QffYWSBcfxEqPWvIErle2QGljaciio=
X-Google-Smtp-Source: AGHT+IHHJAdhfjj7JqBp9ra8No8Slk0aKWukt6ixBwWc0Y8yC6NlQl6qyqfgwIYeixkLe/3fdE0YwQ==
X-Received: by 2002:a17:903:246:b0:1d8:e4b8:95d6 with SMTP id j6-20020a170903024600b001d8e4b895d6mr2403272plh.27.1707578732216;
        Sat, 10 Feb 2024 07:25:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViMKCSm4GQ+Nyv4rH8MvySBgoBa9MijGWRQk21Y7FDsRt20JvMXK7RMNnqR6RfWEluMxVI8up0CBcFbub81M1lVCv03wsd+liPjQHeKHJNbmRFkkgM0dGahQjdF6ZfOaOdxy1pguMkG/RSISqrHxSGPv5MfrP3YwieobvVlUHmFDQFAlD9uFyDl9/qY1Lbxxv9V6pYE6PXALf4u2q1/WssJrrOZmL2nrQK8ZMsbbc980rupySVBzshmauxMw==
Received: from ?IPv6:2402:7500:5dc:b102:45ed:2306:e8a6:d144? ([2402:7500:5dc:b102:45ed:2306:e8a6:d144])
        by smtp.gmail.com with ESMTPSA id kp15-20020a170903280f00b001d90fe6da6esm3172756plb.305.2024.02.10.07.25.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 10 Feb 2024 07:25:31 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH riscv/for-next] crypto: riscv - parallelize AES-CBC
 decryption
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20240208060851.154129-1-ebiggers@kernel.org>
Date: Sat, 10 Feb 2024 23:25:27 +0800
Cc: linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-crypto@vger.kernel.org,
 =?utf-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Heiko Stuebner <heiko@sntech.de>,
 Phoebe Chen <phoebe.chen@sifive.com>,
 Andy Chiu <andy.chiu@sifive.com>
Message-Id: <04703246-6EF6-4B54-B8F1-96EDEC2FBA6B@sifive.com>
References: <20240208060851.154129-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240210_072534_011918_1D0B77CE 
X-CRM114-Status: GOOD (  15.22  )
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

On Feb 8, 2024, at 14:08, Eric Biggers <ebiggers@kernel.org> wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Since CBC decryption is parallelizable, make the RISC-V implementation
> of AES-CBC decryption process multiple blocks at a time, instead of
> processing the blocks one by one.  This should improve performance.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> arch/riscv/crypto/aes-riscv64-zvkned.S | 24 +++++++++++++++---------
> 1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/crypto/aes-riscv64-zvkned.S b/arch/riscv/crypto/aes-riscv64-zvkned.S
> index 78d4e1186c074..43541aad6386c 100644
> --- a/arch/riscv/crypto/aes-riscv64-zvkned.S
> +++ b/arch/riscv/crypto/aes-riscv64-zvkned.S
> @@ -132,33 +132,39 @@ SYM_FUNC_END(aes_ecb_decrypt_zvkned)
> 	addi		INP, INP, 16
> 	addi		OUTP, OUTP, 16
> 	addi		LEN, LEN, -16
> 	bnez		LEN, 1b
> 
> 	vse32.v		v16, (IVP)	// Store next IV
> 	ret
> .endm
> 
> .macro	aes_cbc_decrypt	keylen
> +	srli		LEN, LEN, 2	// Convert LEN from bytes to words
> 	vle32.v		v16, (IVP)	// Load IV
> 1:
> -	vle32.v		v17, (INP)	// Load ciphertext block
> -	vmv.v.v		v18, v17	// Save ciphertext block
> -	aes_decrypt	v17, \keylen	// Decrypt
> -	vxor.vv		v17, v17, v16	// XOR with IV or prev ciphertext block
> -	vse32.v		v17, (OUTP)	// Store plaintext block
> -	vmv.v.v		v16, v18	// Next "IV" is prev ciphertext block
> -	addi		INP, INP, 16
> -	addi		OUTP, OUTP, 16
> -	addi		LEN, LEN, -16
> +	vsetvli		t0, LEN, e32, m4, ta, ma
> +	vle32.v		v20, (INP)	// Load ciphertext blocks
> +	vslideup.vi	v16, v20, 4	// Setup prev ciphertext blocks
> +	addi		t1, t0, -4
> +	vslidedown.vx	v24, v20, t1	// Save last ciphertext block

Do we need to setup the `e32, len=t0` for next IV?
I think we only need 128bit IV (with VL=4).

> +	aes_decrypt	v20, \keylen	// Decrypt the blocks
> +	vxor.vv		v20, v20, v16	// XOR with prev ciphertext blocks
> +	vse32.v		v20, (OUTP)	// Store plaintext blocks
> +	vmv.v.v		v16, v24	// Next "IV" is last ciphertext block

Same VL issue here.

> +	slli		t1, t0, 2	// Words to bytes
> +	add		INP, INP, t1
> +	add		OUTP, OUTP, t1
> +	sub		LEN, LEN, t0
> 	bnez		LEN, 1b
> 
> +	vsetivli	zero, 4, e32, m1, ta, ma
> 	vse32.v		v16, (IVP)	// Store next IV
> 	ret
> .endm
> 
> // void aes_cbc_encrypt_zvkned(const struct crypto_aes_ctx *key,
> //			       const u8 *in, u8 *out, size_t len, u8 iv[16]);
> //
> // |len| must be nonzero and a multiple of 16 (AES_BLOCK_SIZE).
> SYM_FUNC_START(aes_cbc_encrypt_zvkned)
> 	aes_begin	KEYP, 128f, 192f
> 
> base-commit: cb4ede926134a65bc3bf90ed58dace8451d7e759
> -- 
> 2.43.0
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

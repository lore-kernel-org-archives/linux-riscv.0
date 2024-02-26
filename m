Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C272C54798
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 01:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=siC+cfxroKsgSh6Dfp7Z+ptxBygzL6k/MxP6kbbQNcU=; b=DnU5ebNXUec6zx
	+UjeUeEs+djY3u41kOGzuniyjxlv9YmCQTffZ1of/bg/zPEhxFzi2q35S5oIpKI0S4RyI99wzdXC2
	cFjFAN2vuWgObYpu1MvIXE1RuD80MwqQ/Q8lT9/WX5PS6gyU3jphPt/qaE9Nw1Qpmk3yUILQwL+43
	Og3lbt5bZ0qbIRCMnlQ0bY6MNufhxHhNbYEnRK7uTp0ooHnIoMhEISJlEY+3wmxRBiqmIfJTTvxVz
	zXlXHid3ZDcPD4WOHD2gZ6u4xWvzBkGIFy9BhWMkkoECCVVrowulql4vcJ7ZQ6haMihmzaMNJEe56
	w5faL1FDdXD89oh0OQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rePyg-0000000G5pM-1YaI;
	Mon, 26 Feb 2024 01:40:22 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rePye-0000000G5ou-0SKp
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 01:40:21 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so2299558b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 Feb 2024 17:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708911618; x=1709516418; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gao7hRUfZpXivOmhIfnNUfW8TTK3M/4khJ9JgCKSDQQ=;
        b=WqIFtJiZRd+o/Z0cfN8i9f8N99oBwXyXa/0ifQuVGvdr3TeViTw3HNbXRZ/WbmX9//
         eOl1epy9sOpEG4epDEv8ItlB1xU+0JE/DpMvEnwuJPSR3RdCUUuM7wkjJkqVrNb7hqAa
         jj28h0eMad0N5xP+Ejpr4S892AiJfpSxFC7c2VJkXWIvBdTSiRD5/Tn89FkDnARk+rZA
         2bqOEC1pq41z/T/sDTJYL/ocg5DJUmG8v2gOtk+fLg0XNsxMJ6M0147I9WS8iSC3vImd
         aCv7VYOZxR/WFI8qsj2zj4XAaeUMX6aKhrBBUiaMeSCLIsMhOS+sqobLPzq8sa5IAg+L
         8JFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708911618; x=1709516418;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gao7hRUfZpXivOmhIfnNUfW8TTK3M/4khJ9JgCKSDQQ=;
        b=OF21mnKVs+RJj4U/4s3qHG2e5DSNS+deJDqrkRoJSLSZqTjaiRrXEmedABLbzUPaNy
         HKAlgNr8RPhxoN8ezWj6ADsTST7TIIfpwaIpG9Hmwyg8p6a1ToaYUU17hNop5oEVyjTv
         o2ZSu922oLsn8yR8IP0Qr9hgVdBnAWfJ9gf1UvpiIPviweBLkDdnINpmuy5/MHqldKBX
         p9WHvB7qniHIXGx3kTnBQryJbtECO5XqkadvVdh4jBgw2Og5B5NI+O5yyjhxCebI6w2E
         Dyf355PH4lKZEa38c+PYU5sHpzGKz2TzlrDcMTaqBZJQvM6O7nSnhIxOLCw1H4NCyU5V
         LANw==
X-Gm-Message-State: AOJu0Yzd4vlyq9o/kpMI8fsXEbodA7sbiICGV2uDMZdrgvnnpAadfR2c
	0bR7Q4pe7oV9thm9RR5sh86g5BIP3EKyZ4WQh+0g9/Q1zXkUtQm6btMLIUz0CxDGLZ1Imjjqsqf
	D
X-Google-Smtp-Source: AGHT+IHTuQoynqJXhnnP1IcEo6E63UPeUVZkFOzSf4oem6puafXcOc8BzJSUIQCfain5+m3MPFeN0g==
X-Received: by 2002:a05:6a00:14c5:b0:6e5:2f27:5235 with SMTP id w5-20020a056a0014c500b006e52f275235mr1867135pfu.11.1708911618546;
        Sun, 25 Feb 2024 17:40:18 -0800 (PST)
Received: from ?IPv6:2402:7500:5dc:7e53:808:399a:34d8:b170? ([2402:7500:5dc:7e53:808:399a:34d8:b170])
        by smtp.gmail.com with ESMTPSA id e17-20020aa79811000000b006e45c5d7720sm2903150pfl.93.2024.02.25.17.40.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Feb 2024 17:40:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH riscv/for-next] crypto: riscv - parallelize AES-CBC
 decryption
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20240210181240.GA1098@sol.localdomain>
Date: Mon, 26 Feb 2024 09:40:14 +0800
Cc: linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-crypto@vger.kernel.org,
 =?utf-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Heiko Stuebner <heiko@sntech.de>,
 Phoebe Chen <phoebe.chen@sifive.com>,
 Andy Chiu <andy.chiu@sifive.com>
Message-Id: <71CC95E2-D5A2-4158-ADD2-C28216B00F3A@sifive.com>
References: <20240208060851.154129-1-ebiggers@kernel.org>
 <04703246-6EF6-4B54-B8F1-96EDEC2FBA6B@sifive.com>
 <20240210181240.GA1098@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_174020_229962_FA8819A5 
X-CRM114-Status: GOOD (  20.03  )
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

On Feb 11, 2024, at 02:12, Eric Biggers <ebiggers@kernel.org> wrote:
> On Sat, Feb 10, 2024 at 11:25:27PM +0800, Jerry Shih wrote:
>>> .macro	aes_cbc_decrypt	keylen
>>> +	srli		LEN, LEN, 2	// Convert LEN from bytes to words
>>> 	vle32.v		v16, (IVP)	// Load IV
>>> 1:
>>> -	vle32.v		v17, (INP)	// Load ciphertext block
>>> -	vmv.v.v		v18, v17	// Save ciphertext block
>>> -	aes_decrypt	v17, \keylen	// Decrypt
>>> -	vxor.vv		v17, v17, v16	// XOR with IV or prev ciphertext block
>>> -	vse32.v		v17, (OUTP)	// Store plaintext block
>>> -	vmv.v.v		v16, v18	// Next "IV" is prev ciphertext block
>>> -	addi		INP, INP, 16
>>> -	addi		OUTP, OUTP, 16
>>> -	addi		LEN, LEN, -16
>>> +	vsetvli		t0, LEN, e32, m4, ta, ma
>>> +	vle32.v		v20, (INP)	// Load ciphertext blocks
>>> +	vslideup.vi	v16, v20, 4	// Setup prev ciphertext blocks
>>> +	addi		t1, t0, -4
>>> +	vslidedown.vx	v24, v20, t1	// Save last ciphertext block
>> 
>> Do we need to setup the `e32, len=t0` for next IV?
>> I think we only need 128bit IV (with VL=4).
>> 
>>> +	aes_decrypt	v20, \keylen	// Decrypt the blocks
>>> +	vxor.vv		v20, v20, v16	// XOR with prev ciphertext blocks
>>> +	vse32.v		v20, (OUTP)	// Store plaintext blocks
>>> +	vmv.v.v		v16, v24	// Next "IV" is last ciphertext block
>> 
>> Same VL issue here.
> 
> It's true that the vslidedown.vx and vmv.v.v only need vl=4.  But it also works
> fine with vl unchanged.  It just results in some extra data being moved in the
> registers.  My hypothesis is that this is going to be faster than having the
> three extra instructions per loop iteration to change the vl to 4 twice.
> 
> I still have no real hardware to test on, so I have no quantitative data.  All I
> can do is go with my instinct which is that the shorter version will be better.
> 
> If you have access to a real CPU that supports the RISC-V vector crypto
> extensions, I'd be interested in the performance you get from each variant.
> (Of course, different RISC-V CPU implementations may have quite different
> performance characteristics, so that still won't be definitive.)

Hi Eric,
Thank you. I think the extra vl doesn't affect performance significantly. The main
tasks are still the aes body.
The original implementation is enough right now.

> In general, this level of micro-optimization probably needs to be wait until
> there are a variety of CPUs to test on.  We know that parallelizing the
> algorithms is helpful, so we should do that, as this patch does.  But the
> effects of small variations in the instruction sequences are currently unclear.
> 
> - Eric


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

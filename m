Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72898C47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 08:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+e7QqecfvQnxVF2KuaO7AisDt6cdmHxARkQO6Qr0Ns=; b=cMH8QJfyAuWAAL
	VKqlSseu8SOq81YSmF5EegPYOmed2J6KZ+ZpvyYNQycZhJzLy8eulgDjfdN6MnSOYe0ZPbKDbfMce
	bi5Mw5qIh4t6Wzbk9B5rHYbPNgoylAaMCmJLXIKBiTOhJspeFDZPrx5abvl+JCbK4C2FMXL5AE9sa
	yg0TFgynGSs3cxJyFTwy6+0Y3UQKcQ36LDM0I3XE65iddfoCTfOd4cKbIChxw/Oq4LMbUMj2SWBRC
	yRhMmoMlS4DqG6EK1L8Znk/rMbqr5i6EaLqQ6ldwIkFD/FRLRy8wvQ/J3s3fwXpaWa/TueQt23g/s
	oiR+hYzrv7r+GT9wBIQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLJNx-00DG4M-2K;
	Thu, 04 Jan 2024 08:47:29 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLJNs-00DG3m-33
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 08:47:26 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5cdfed46372so204527a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 00:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704358041; x=1704962841; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgfsQLNdDzo7kWKLxPEqtg86d6gRnxnHrr+F4939nWk=;
        b=iRRRPcNfkl/3LJ97ndKlZ8VSoHgyomQS9DlvDg4HcrhoEYHOoOquGL+xxI1bt5XXNS
         ye0TwbZ6L8n3tX+5+dE5ielRGOsw9fW7vPCM0oLlz4+klGAkK5M5oByWQFE22DB/Vt/r
         MjdrGNaS3uu85mBwuT6kCq59JyQ3F25RK1BlVpVhKYciO59YO03Q/evamMRvbWwP/13m
         UXO0qMWF/imePUmB4wf/EjCFJvNv55JODnHRnbFYUdpS7dRg+mNW6gk+jmRukWSrBh12
         blpoUsG6LJZLPgdKBlsR9uG1vf+WdvkPRTZiyFlybIDCXELTPUm6cJLNE6tj4EWKNI09
         DiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704358041; x=1704962841;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgfsQLNdDzo7kWKLxPEqtg86d6gRnxnHrr+F4939nWk=;
        b=s5IRragRVFSkF/k6w61lh2OrpsHXE/SyAokrfurKexs5Ly+1+dYbu1BucPx0hGgHZX
         hM5MpzWBCr160ZlnN0kJF7kEHa8rHhe015I/ParzYT09x+8QR8B/v0YyovyAKwUtPCxL
         FoW7BvT+iXeKUqD1rfWsFuzLxI/TlRhdg+zVhT18QcSdh5NhWDl1M+C6bG+bk53Le+yr
         abo8DEwWAVYhiYMBn2+pnh0+G+QOpbTxUfOQEx/elMe3kCdfGo0qac8B03n9Ai4f0KET
         Sx0C2p4+iLOpoLILdUU91o5HuNuDs6lyi6V+wywF1JxfsVwnz9wmTLTuZG+MukVFEoIF
         IF3g==
X-Gm-Message-State: AOJu0Yxu2TC52GcwYzCQ5I7ASoRM0/zcIiKW507wArHJ1XRASbHAxgJO
	AAfn/FjQmAvcdW1U+bLGaG8pvcDMB1aNlA==
X-Google-Smtp-Source: AGHT+IG/sBRaenKqK4e/aSWU0CPcqduNWKUOpDd7nVy3analENwFGwddoXVDN4ch5A9tbYfXUAIt7w==
X-Received: by 2002:a05:6a20:974b:b0:198:60af:20a5 with SMTP id hs11-20020a056a20974b00b0019860af20a5mr171949pzc.88.1704358040679;
        Thu, 04 Jan 2024 00:47:20 -0800 (PST)
Received: from ?IPv6:2402:7500:5d5:7102:b5d6:a469:295a:6de5? ([2402:7500:5d5:7102:b5d6:a469:295a:6de5])
        by smtp.gmail.com with ESMTPSA id u3-20020a170902e5c300b001d3ee84ef0csm25107555plf.235.2024.01.04.00.47.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jan 2024 00:47:20 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [RFC PATCH 07/13] crypto: riscv - add vector crypto accelerated
 AES-{ECB,CBC,CTR,XTS}
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20240103145043.GB773@quark.localdomain>
Date: Thu, 4 Jan 2024 16:47:16 +0800
Cc: linux-crypto@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Phoebe Chen <phoebe.chen@sifive.com>,
 hongrong.hsu@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Andy Chiu <andy.chiu@sifive.com>
Message-Id: <905D43CF-B01A-49DE-9046-51A370B6F680@sifive.com>
References: <20240102064743.220490-1-ebiggers@kernel.org>
 <20240102064743.220490-8-ebiggers@kernel.org>
 <20240103145043.GB773@quark.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_004725_042303_E343298D 
X-CRM114-Status: GOOD (  16.74  )
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

On Jan 3, 2024, at 22:50, Eric Biggers <ebiggers@kernel.org> wrote:
> On Tue, Jan 02, 2024 at 12:47:33AM -0600, Eric Biggers wrote:
>> diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
>> index dca698c5cba3e..5dd91f34f0d52 100644
>> --- a/arch/riscv/crypto/Makefile
>> +++ b/arch/riscv/crypto/Makefile
>> @@ -1,7 +1,10 @@
>> # SPDX-License-Identifier: GPL-2.0-only
>> #
>> # linux/arch/riscv/crypto/Makefile
>> #
>> 
>> obj-$(CONFIG_CRYPTO_AES_RISCV64) += aes-riscv64.o
>> aes-riscv64-y := aes-riscv64-glue.o aes-riscv64-zvkned.o
>> +
>> +obj-$(CONFIG_CRYPTO_AES_BLOCK_RISCV64) += aes-block-riscv64.o
>> +aes-block-riscv64-y := aes-riscv64-block-mode-glue.o aes-riscv64-zvkned-zvbb-zvkg.o aes-riscv64-zvkned-zvkb.o
> 
> A bug I noticed (which is also present in Jerry's patchset) is that some of the
> code of the aes-block-riscv64 module is located in aes-riscv64-zvkned.S, which
> isn't built into that module but rather into aes-riscv64.  This causes a build
> error when both CONFIG_CRYPTO_AES_RISCV64 and CONFIG_CRYPTO_AES_BLOCK_RISCV64
> are set to 'm':
> 
>    ERROR: modpost: "aes_cbc_decrypt_zvkned" [arch/riscv/crypto/aes-block-riscv64.ko] undefined!
>    ERROR: modpost: "aes_ecb_decrypt_zvkned" [arch/riscv/crypto/aes-block-riscv64.ko] undefined!
>    ERROR: modpost: "aes_cbc_encrypt_zvkned" [arch/riscv/crypto/aes-block-riscv64.ko] undefined!
>    ERROR: modpost: "aes_ecb_encrypt_zvkned" [arch/riscv/crypto/aes-block-riscv64.ko] undefined!
> 
> To fix this, I think we should just merge the two modules and kconfig options
> together so that there is one module that provides both the AES modes and the
> AES single-block cipher.  That's how x86's aesni-intel works, for example.
> 
> - Eric

That's a bug in my patchset.
I don't test with all options with `M` settings since I can't boot to qemu with all `M` settings.

Could we move the cbc and ecb from `aes-riscv64-zvkned` to `aes-block-riscv64` instead of merging
these two modules?
Thus, we could still enable the single aes block cipher without other extensions(e.g. zvbb or zvkg).

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

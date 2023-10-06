Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF6EE94116
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 21:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rz605VjZJLN+p3KpkSnAb9c+TpIid7w3TLruKPCwVkY=; b=XdMLVpwChqdRH9
	3IF1aNxMfv8AmBZ7ky+ElBUPY09Hc/kk/gyzhDxRQsW91tonqGynRLPT1o+xxwodJYLJWyKnmY0B0
	SugpUuLZbgnF5OLi6i9OzJenzIPfD/MS+zjdcfTD+yPcVi1SwmeohGNj1wm0XzpzX1s1pXrlEU1CV
	V0W3fl8bsb0S48sLKcUtR40iv/Z/7KgNtOimJRNR6WekjnNlhoBVP+RskfFCirs0yBdF8syZs+emS
	lS+oqg4ePuAbgo3ZugQfachPBIvdeYqUtraq+sXKBcrHsYZU7ZNX3FUKoiuVuG4UqbiiNFTsK49Ux
	8jiJcMU6JrlzFvAolgcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qorxS-006UHe-2b;
	Fri, 06 Oct 2023 21:02:02 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qorxO-006UGj-1U
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 21:02:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c61acd1285so18958065ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Oct 2023 14:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696626111; x=1697230911; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hn5uZMjSaH8hIqbejs5h+ffQC2Qffbsh01CXuNBPa6o=;
        b=EBwvkccQTeX0PHoLFFYOtAqNbMGNWRjHU0EPMABVwCtfZB/Bvztk+1etr46TQkWROF
         e+5YyfN7TfRA/UmotI42Ic/bUl00R47JWJF6nRtsLOIq+36SWt/RAJslgadXFY3IN4um
         YYhO7x88wLYva719h4PmlGd0Gmo86eIZ9G0MTUZzsRURC6SchLv1C2qKzVWNNWYbbX/I
         7N8XpgTIbVvouAcqwiKoT2YADVAKKKHmxdsk30dlB8p0B1IN1/8u2NgV5cOQpLFDWRkD
         JUip2xpTehYWQk2jUeu+aF268yd2JDj6uwdgnxZPEWGFwj4YVeG/xA+5AdzarbpRwGjP
         7sIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696626111; x=1697230911;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hn5uZMjSaH8hIqbejs5h+ffQC2Qffbsh01CXuNBPa6o=;
        b=MahuMgBIHuW8bQhDUGB8SbSfh8QXtLd6YXheYyqtlAWhbyhGDtX0HOn5GJwYdWEVW6
         g75Qc3S3DdLds5iFCh/RK2pFiwDEpyQnJbo5Yg7E3j2ZwjPQtfttUyCZDz2yjGDG4Uuv
         dfPqfsHYUfEg3TEQl2vskQwjofU96vqbVIvEQaxEIk5w8T/bYADqh4mBzzQhvZPhSaGv
         GwkmDrwGqOa6/9DLTWUZB5NhmYciDHzc+o3/IUGioxFghaPcaM694VFG0Ru905PtsZGH
         Q3sChVJiNgUsZpmbYJ3wI5cdpu/S2+kMxblrsQjZg4n7VlmPEuWgLPNUUNUvYt3EjI+/
         TsOg==
X-Gm-Message-State: AOJu0Yw+qJX/UfMu8vHMXUPMHQTuAZpld/IFiCuR1hEgmaNJ4F95gglc
	A3Bd6tQ2G6Fmjq1FsRD5zYg=
X-Google-Smtp-Source: AGHT+IEjflmzJLhvFDRd6fvsIeJr17A0jYfL5yzBGWwFWgxAw2a5w9SCEWl9UhOk8TPYjI7SjeLZXQ==
X-Received: by 2002:a17:902:6bc1:b0:1c3:6e38:3943 with SMTP id m1-20020a1709026bc100b001c36e383943mr7985566plt.56.1696626111133;
        Fri, 06 Oct 2023 14:01:51 -0700 (PDT)
Received: from ?IPv6:2402:7500:4d5:8d3d:81fd:40de:c351:7a06? ([2402:7500:4d5:8d3d:81fd:40de:c351:7a06])
        by smtp.gmail.com with ESMTPSA id u10-20020a170902b28a00b001c60a2b5c61sm4335297plr.134.2023.10.06.14.01.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Oct 2023 14:01:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
From: He-Jie Shih <bignose1007@gmail.com>
In-Reply-To: <20231006194741.GA68531@google.com>
Date: Sat, 7 Oct 2023 05:01:45 +0800
Cc: Charlie Jenkins <charlie@rivosinc.com>,
 Heiko Stuebner <heiko@sntech.de>,
 palmer@dabbelt.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 christoph.muellner@vrull.eu,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Message-Id: <7BC51820-61BC-422C-A2F7-B68CE679972C@gmail.com>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230914001144.GA924@sol.localdomain> <ZQJdnCwf99Glggin@ghost>
 <3A0F6A71-C521-44A5-A56C-076AF3E13897@gmail.com>
 <DD3113B1-AB9F-4D6D-BD6E-8F75A83DA45D@sifive.com>
 <20231006194741.GA68531@google.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_140158_502332_93991E5B 
X-CRM114-Status: GOOD (  23.39  )
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
Reply-To: 20231006194741.GA68531@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Oct 7, 2023, at 03:47, Eric Biggers <ebiggers@kernel.org> wrote:
> On Fri, Sep 15, 2023 at 11:21:28AM +0800, Jerry Shih wrote:
>> On Sep 15, 2023, at 09:48, He-Jie Shih <bignose1007@gmail.com> wrote:
>> The OpenSSL PR is at [1].
>> And we are from SiFive.
>> 
>> -Jerry
>> 
>> [1]
>> https://github.com/openssl/openssl/pull/21923
> 
> Hi Jerry, I'm wondering if you have an update on this?  Do you need any help?

We have specialized aes-cbc/ecb/ctr patch locally and pass the `testmgr` test
cases. But the test patterns in `testmgr` are quite simple, I think it doesn't test the
corner case(e.g. aes-xts with tail element).

For aes-xts, I'm trying to update the implementation from OpenSSL. The design
philosophy is different between OpenSSL and linux. In linux crypto, the data will
be split into `scatterlist`. I need to preserve the aes-xts's iv for each scatterlist
entry call. And I'm thinking about how to handle the tail data in a simple way.
By the way, the `xts(aes)` implementation for arm and x86 are using
`cra_blocksize= AES_BLOCK_SIZE`. I don't know why we need to handle the tail
element. I think we will hit `EINVAL` error in `skcipher_walk_next()` if the data size
it not be a multiple of block size.

Overall, we will have
1) aes cipher
2) aes with cbc/ecb/ctr/xts mode
3) sha256/512 for `vlen>=128` platform
4) sm3 for `vlen>=128` platform
5) sm4
6) ghash
7) `chacha20` stream cipher

The vector crypto pr in OpenSSL is under reviewing, we are still updating the
perl file into linux.

The most complicated `gcm(aes)` mode will be in our next plan.

> I'm also wondering about riscv.pm and the choice of generating the crypto
> instructions from .words instead of using the assembler.  It makes it
> significantly harder to review the code, IMO.  Can we depend on assembler
> support for these instructions, or is that just not ready yet?

I have asked the same question before[1]. The reason is that Openssl could use
very old compiler for compiling. Thus, the assembler might not know the standard
rvv 1.0[2] and other vector crypto[3] instructions. That's why we use opcode for all
vector instructions. IMO, I would prefer to use opcode for `vector crypto` only. The
gcc-12 and clang-14 are already supporting rvv 1.0. Actually, I just read the `perl`
file instead of the actually generated opcode for OpenSSL pr reviewing. And it's
not hard to read the perl code.


Thanks,
- Jerry

[1]
https://github.com/openssl/openssl/pull/20149#discussion_r1244655440
[2]
https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc
[3
https://github.com/riscv/riscv-crypto/blob/main/doc/vector/riscv-crypto-spec-vector.adoc]
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

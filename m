Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEAFC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7A4tXRwH8OEQH0hYJ5j+8WfFQSYXUrF0as2yJg69vJg=; b=Q45VL6JTdGAq7Z
	qK3kBJpgu4Cmckyz+0WBZd5Fhdtew+7wsUAVk37IGByRIshqv04lixei8POWh6E6NjweePUknZiVr
	aGW3UMHcpNvbkWu1ZN+q9d+bP5mxIi/aa3PafHcox2xzY3rCL3L9so1XvjDy02DurUKkHXJAXml4i
	mbASXh5Lzk95bPE9JECMa/Ckpt0HhlZWVlIqsnxIyCDnnwsoxxZC8kLbbgnNGzJne8jpwtd0d8ImR
	Rr1hq+azT2bfyEgpw7R/TbiGmZ7KC8DVR78sH+ZdjyUDGkab/3bkW7ot/HXvEf00sA+eSsnnTnx0J
	pN/M6WRTL15dW0mhw83A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tug-004c4O-0D;
	Tue, 28 Nov 2023 08:57:50 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7tuc-004c3g-2f
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 08:57:48 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6cb749044a2so5222736b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Nov 2023 00:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701161863; x=1701766663; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTYsamGNaQ8fRNjNMaxridTGMNfJmuFsAlfcl9yavQs=;
        b=W+9qrTrdYMobooAXa0D1yJQ34oka+whU16LDwCEtvtg0G5I03I3zlXCYxljesypJlA
         nOaCxmCRkgGAipIqZO+CMie1wEe9svYBhdUSEwC5eTR23yeOAVXJk2akYbGh8cvexvys
         JweUbSPGWYnfupU9JQTCUeSeZqx2ZZZJ8tarcXbQdcWvBVw898G2ZnX5/iwjkarg8T52
         LV09KdVU3XfNrpyJ+/96iXcmKeK3MNRf2LfHOSKCzvzzhJpjuhomsArT3OLse2C7B+NI
         5l/EHbcHDgXCWxvTW46013NBw3B1JrCF4eSHILh+rp3QALnJJep5IPNUfCR6YXvu1Hyf
         MqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701161863; x=1701766663;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTYsamGNaQ8fRNjNMaxridTGMNfJmuFsAlfcl9yavQs=;
        b=FAMID6ln1uvmLxi2l+VrrktbIZ60/GEHbcHXUBQV0ic8bjQNh+aqKkvyYh2KgrSTGV
         KCXb4Hei6+ItvXDNGvPffHJhvwFQ2HZ1ZZOtm/NGKdCoSC7IHdNdxT1YHjjF03FWFRML
         j3I7C6/2gRCY2pWDbnQOqw56NOI+OJOOgd4t3opXAaZJaUIQTHSV1j+Z2W64WfNmn3LM
         P6KQmMWS6BWu127NfI3bftueC9KPxNm9stDaECbnHVJbRqMzwULXVyR3HKUTpPePjKex
         vpvlZqYFOzCZLVB10ioQscIRyK032ASQWoyKeFnIx9tcxGT/Xuz+wukIep+YZCVWi4xO
         jsVQ==
X-Gm-Message-State: AOJu0YwmHTLlqjgbQXZ2jnkG+mBFOo+JuwsZpx7BQa0v3LRzh7cVfAyF
	nrUYTi3floDp9OwJUE0WDv5uOw==
X-Google-Smtp-Source: AGHT+IE/fng9QOuiUZBluDfizhRPgWmYcOqQIfRFSizRR9MTI4Ihwkn53PdiTZ2Of0dfq0nFdnkdKA==
X-Received: by 2002:a05:6a20:5650:b0:18b:9053:d865 with SMTP id is16-20020a056a20565000b0018b9053d865mr15666672pzc.42.1701161862894;
        Tue, 28 Nov 2023 00:57:42 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:8338:14c0:b892:2482:e230? ([2402:7500:4ce:8338:14c0:b892:2482:e230])
        by smtp.gmail.com with ESMTPSA id g8-20020a056a00078800b00694fee1011asm8522232pfu.208.2023.11.28.00.57.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Nov 2023 00:57:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v2 13/13] RISC-V: crypto: add Zvkb accelerated ChaCha20
 implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231128042503.GL1463@sol.localdomain>
Date: Tue, 28 Nov 2023 16:57:38 +0800
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
Message-Id: <3B3784E0-0DE2-4A99-878E-657BB0E0765D@sifive.com>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-14-jerry.shih@sifive.com>
 <20231128042503.GL1463@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_005746_878240_E72A3B0C 
X-CRM114-Status: GOOD (  16.63  )
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

On Nov 28, 2023, at 12:25, Eric Biggers <ebiggers@kernel.org> wrote:
> On Mon, Nov 27, 2023 at 03:07:03PM +0800, Jerry Shih wrote:
>> +config CRYPTO_CHACHA20_RISCV64
> 
> Can you call this kconfig option just CRYPTO_CHACHA_RISCV64?  I.e. drop the
> "20".  The ChaCha family of ciphers includes more than just ChaCha20.
> 
> The other architectures do use "CHACHA20" in their equivalent option, even when
> they implement XChaCha12 too.  But that's for historical reasons -- we didn't
> want to break anything by renaming the kconfig options.  For a new option we
> should use the more general name from the beginning, even if initially only
> ChaCha20 is implemented (which is fine).

I will use `CRYPTO_CHACHA_RISCV64` instead.

>> +static int chacha20_encrypt(struct skcipher_request *req)
> 
> riscv64_chacha_crypt(), please.  chacha20_encrypt() is dangerously close to
> being the same name as chacha20_crypt() which already exists in crypto/chacha.h.

The function will will have additional prefix/suffix.

>> +static inline bool check_chacha20_ext(void)
>> +{
>> +	return riscv_isa_extension_available(NULL, ZVKB) &&
>> +	       riscv_vector_vlen() >= 128;
>> +}
> 
> Just to double check: your intent is to simply require VLEN >= 128 for all the
> RISC-V vector crypto code, even when some might work with a shorter VLEN?  I
> don't see anything in chacha-riscv64-zvkb.pl that assumes VLEN >= 128, for
> example.  I think it would even work with VLEN == 32.

Yes, the chacha algorithm here only needs the VLEN>=32. But I think we will not get
benefits with that kind of hw.

> I think requiring VLEN >= 128 anyway makes sense so that we don't have to worry
> about validating the code with shorter VLEN.  And "application processors" are
> supposed to have VLEN >= 128.  But I just wanted to make sure this is what you
> intended too.

The standard "V" extension assumes VLEN>=128. I just follow that assumption.
https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#183-v-vector-extension-for-application-processors

-Jerry


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

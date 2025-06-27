Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A48C7EE31
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 09:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdIfKYFL/Z6iCWEG3NJifNDdglhNnBNOIJElm8w1o+4=; b=ATnjN0HUke5lV+
	B8JOQdPFzQVAyzOH4MOrmOXGEoxts/y74ZMxrgTuQIFUnvrcktrB2ZSudaqFehpSSlhIxRZsEsCNv
	4mmd+cLrmKfU9wRri0hDZrrRv5hyJzoDNp/c597WfxR8Da1O9Z5lTFDIJzsrXZi71tydFCocVHUKL
	wSlL5PjXblnhjQcUuG0KAEwEETV8qOixYq3V2yMk8dSNvatbjuNgi2TTbCOtAWpKSvX7nCKqHyOq0
	bUISomH/5AtRYXBpWvX4bv+2rYXXV09lkk48vD1SwkiaY9wi99xG5n0OshRVzYSbGRY0+byzFu/D1
	ZZjCZPj/5l08Meq976JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV53k-0000000E2T3-0n4Y;
	Fri, 27 Jun 2025 09:07:48 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV53i-0000000E2Rq-1xvE
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 09:07:47 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-553b9eb2299so2681518e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 02:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1751015264; x=1751620064; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mwTaehLi++D3BP/Qfp0PX6Y8cfOYLLnC6EYX5G+DxBw=;
        b=j4HN3ko/VBrQb9sG5LmH4wE1vCLvwa3rrqPY2lmTI9ol5mtPJJHXk9CNvgGECgniJT
         wP7LbNAiMDrFKlqX/OwcTvdK6KTvZumo7zdFzUBWWBakhsMOs5rQU1+MMUOTrQKu2AjT
         a+qA5kr8dvOP/7GCSSjV4IIOymCU91e1ZE8dqXhoUGp9LwP/DvsBBHSf/6myXDmWdzD3
         BLMqbM5A1Epvbe/o2nToZNZGmfzAqHlbxbNqTroa3a357aeB4orgW/lRDL0E+Upp8sJC
         QsbklmFMzYGf1rVm0ISQL93PQ+KUXYthyAi4UbxKQbEe8MRfKdhLvWZKXr0lDFNQtRv0
         WS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015264; x=1751620064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mwTaehLi++D3BP/Qfp0PX6Y8cfOYLLnC6EYX5G+DxBw=;
        b=g9+8kj9+L+wj+pMVNeu6eaf7UFnM26kaWJSTamReJxwYzJEm6e+Vs4Uk6E/lwQZxPr
         ddA2kg0ErbojzwZrMkz0Ol+6SDT6YHlCWTmmkPI4KWrMnIZm8eWzFxoVILw6NeD+FeOu
         tnJ87b4gur7tbed+46hYZjFFpWLF/ljNze+VchQa+CNF8FvnajBO6G1a+9D7yH8L53k2
         tA68tFNyWe6N6f4bz5wedZ9ROOELWtTmJk67HxsH3Zpf1jzgfgT2nQnRKwzsqj+bn4YM
         HpppGGOTSq4836PWDqi2k3daCjxRMNCoWTMxbPEXP/vCror+PzF3Gl7rEzdQqTOYm8W/
         CLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH6/NKlGUR/BFqk5wlQeXnP1zvp1okxra8hWUK9ZTRlMI50arYN2bem47zrq97vbgL8Vf6Hk977S2f9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yww8PPT7ADki5IRqfUtiz7zvQvlGbou+1I/6pNbHd9UvbdkKSzD
	rCq6lHFAikI/WQzABcreAy6eMyaDftz2tC36SgP3XhILoaa0HkOKN2e7hzE/Y9PWbg4=
X-Gm-Gg: ASbGncv/qICGxE4/xcrarSfb6cj3lbGU6qlgz8gJVGh6AZIrkYastlU/9bZCZaK6Pkj
	e9HikQGw34GNaH/5A68HHz2Gq/wJcIxt/8KBobPw/zJRxUmq4iSNUDBxjef6kGTO+V/hJwCVxNM
	Avbk+Cej5//7pPLW5n5z6Y6Rrtf22clOZMsl28bKU0J8vHNWyAiRfL61uzbaGblaoa2QMoB19qF
	TRzYjD47ylTdCYHAVVQPmI84NbgQ9VXiXwtr9SF89XXeGeTv8FxGZM6vSbGViG87zcIODaaEYNZ
	9UidKApIIV+60F2vdC+cRM2qgMqcAueg1td0zrkS2RiSV5q9u81fdXh8ROwEZLZaEx4F0yIZul7
	m+lHuzmadZZY2A7wijL2lAI/9aOip+Q==
X-Google-Smtp-Source: AGHT+IEN/vImgHyT08WNJquuCoqBqWoXcpPN6YcsofZ82MFo/mUqptPZeTPp1FYUrQXumaxV8Lg7Fw==
X-Received: by 2002:a05:6512:2395:b0:554:f82f:181a with SMTP id 2adb3069b0e04-5550c2bfa3amr615791e87.2.1751015263987;
        Fri, 27 Jun 2025 02:07:43 -0700 (PDT)
Received: from [10.0.1.129] (c-92-32-242-43.bbcust.telenor.se. [92.32.242.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b8fadsm364392e87.103.2025.06.27.02.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 02:07:43 -0700 (PDT)
Message-ID: <fa13aa9c-fd72-4aa3-98bc-becaf68a5469@cryptogams.org>
Date: Fri, 27 Jun 2025 11:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
To: Sami Tolvanen <samitolvanen@google.com>,
 Eric Biggers <ebiggers@kernel.org>
Cc: Zhihang Shao <zhihang.shao.iscas@gmail.com>,
 linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
 herbert@gondor.apana.org.au, paul.walmsley@sifive.com, alex@ghiti.fr,
 zhang.lyra@gmail.com
References: <20250611033150.396172-2-zhihang.shao.iscas@gmail.com>
 <20250624035057.GD7127@sol>
 <48de9a74-58e8-49c2-8d8a-fa9c71bf0092@cryptogams.org>
 <20250625035446.GC8962@sol>
 <CABCJKudbdWThfL71L-ccCpCeVZBW7Yhf3JXo9FvaPboRVaXOyg@mail.gmail.com>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <CABCJKudbdWThfL71L-ccCpCeVZBW7Yhf3JXo9FvaPboRVaXOyg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_020746_512975_E74F4947 
X-CRM114-Status: GOOD (  12.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>>>>> +.globl   poly1305_init
>>>>> +.type    poly1305_init,\@function
>>>>> +poly1305_init:
>>>>> +#ifdef   __riscv_zicfilp
>>>>> + lpad    0
>>>>> +#endif
>>>>
>>>> But they appear to be unnecessary.
>>>
>>> They are better be there if Control Flow Integrity is on. It's the same deal
>>> as with endbranch instruction on Intel and hint #34 on ARM. It's possible
>>> that the kernel never engages CFI for itself, in which case all the
>>> mentioned instructions are executed as nop-s. But note that here they are
>>> compiled conditionally, so that if you don't compile the kernel with
>>> -march=..._zicfilp_..., then they won't be there.
>>
>> There appears to be no kernel-mode support for Zicfilp yet.  This would be the
>> very first occurrence of the lpad instruction in the kernel source.
> 
> Of course, if the kernel actually ends up calling these functions
> indirectly at some point, lpad alone isn't sufficient,

The exception condition is specified as "tag != x7 *and* tag != 0." In 
other words lpad 0 provides a coarse-grained, but a protection 
nevertheless. As effective as the endbranch on Intel. Since a 
"fit-multiple-use-cases" assembly module, such as cryptogams' ones, 
can't make specific assumptions about the caller, lpad 0 is a working 
fall-back.

> we would need
> to use SYM_TYPED_FUNC_START to emit CFI type information for them.

I'm confused. My understanding is that SYM_TYPED_FUNC_START is about 
clang -fsanitize=kcfi, which is a different mechanism. Well, you might 
be referring to future developments...

> Also, if the kernel decides to use type-based landing pad labels for
> finer-grained CFI, "lpad 0" isn't going to work anyway.

It would, it simply won't be fine-graned.

> Perhaps it
> would make sense to just drop the lpad instruction in kernel builds
> for now to avoid confusion?

Let's say I go for

#ifdef __KERNEL__
SYM_TYPED_FUNC_START(poly1305_init, ...)
#else
.globl	poly1305_init
.type	poly1305_init,\@function
poly1305_init:
# ifdef	__riscv_zicfilp
	lpad	0
# endif
#endif

Would it be sufficient to #include <linux/cfi_types.h>?

Cheers.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

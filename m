Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FE8C7115C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 11:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YkMFLT6DJS626m134p+ZidLK/NYAeukEXr8uvnJ/6SM=; b=4g27aOffm2An+s
	IFo6WhUio1IgnmYc6mxuShSczPu9EomfmB2cQ6xEz5kqF93drOBzsBnMe/c5s1SsYKy+Acj21oNfj
	icEwf182XhdyAOwhAbtVsDq4QalvbVu4RN7oHVdky86co5vAFcTEbmjUj3YHR9N5JG3aj4sym6Sh9
	32jCdwKNwF+dUkgOxiJZHDCVSxNI+3r/eZwee00e1pfteER98ZmyIqOZGPrVh9tGitNUwz/z6wnK3
	KE+ywoiFAmWOeRuPSU29yv+QYVEQCXSu2bpNweiQinscvYY+F2u+R0qrZ71K9cla0sdwwZrfcUqFi
	CrhIeGwfQ9V8RXJa6E1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNrs-00000008Oz4-3jmy;
	Wed, 25 Jun 2025 11:00:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMaQ-000000089YN-3rl8
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Jun 2025 09:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=K2bjFrjj2eMqiTRqSA0mu7oTkOAFVTQZyOnAVudgErE=; b=DoguHOoiQ0HoPcsnc4cexM08db
	af4ojogyK11eNO8/VGsY9I5DqACeZoe0bMkA2hCXhE65BCmpK7yAVS/MRVGIUUV87AX1UApj6wjwV
	WNOtRkqY65rSLyGPY5GyeJJSZY4He1hJDe4XlUA5ervFVuewTjqfUgQGFT+iG0uA+OK4janXE2cqW
	+GI06Eh3xYj8N3soLowwX7QPBagQoc9G1JbYnsUnLRkIjkklD3F5y9bTsXVL+diqGJvhv7PiGVjkC
	suyCBr24Z9VWG9+HyeBbEgJNqUdPdc1NMpA7imfg4oQgO9v9hwjaXvawOTF8bX8HyxxrdoGRUQXqQ
	jbq3tg0g==;
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMaK-00000005kJo-1939
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 09:38:33 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5533303070cso5992997e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 02:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1750844302; x=1751449102; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2bjFrjj2eMqiTRqSA0mu7oTkOAFVTQZyOnAVudgErE=;
        b=CStD7UVc6TwYcWWdsfJkbZyWBm+3o57enjq79VEw9spStCfO3Ofekit6gQedwuJaUC
         IjGFzhDYyvGoXQaJ1Gg/qQ9R1CoGb659WQYJTSX65Piy2y+pCDvoje+jgCfg0t8g2JmL
         l1kfE2MrcR7uW5e8nWEuzp2a88pflxYImag5wTIKXVAVUznec7l+Qjnr2cO34J4er+Ax
         1KGikF0sZv+3d/c5SMdYnhx+K1F7sbimd2k0YQGcNuU+kWITAZ0MaY4EVddV/4hBY65G
         I9s6bDjNWAfULV0PSzu/p8n9kKAbnRz6LyccsVoSRuKyxIjmtTPHhyvXWckNbelrDlH9
         oVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750844302; x=1751449102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K2bjFrjj2eMqiTRqSA0mu7oTkOAFVTQZyOnAVudgErE=;
        b=Wls48JML9UQIziawj2j3EwXRJh3Feh5/NhmH1HUEoo50Uejj0J5GPruvEAybtudlur
         t0dADkcLxKm7FngX0Qq6Z5NkIaqupD/VgVXSBGwihVFcmOY9E7Xa0CEaeAf6+XeKKaAK
         elvoR7IqE49+RnNs3DhrW79l3DZq7AugSpmECSoLq2ByLiXSDnI6Rki4tx4Mkh+S26kn
         JLw2BmjfmpmIC+uJQi8rglyjfto99b9Ps4wmWSLowqqJoXTcbPV53tjDeRI4UtHpUbjj
         r/g8bmZ+nhxxALkAaXYzQyQrVG+a5RBHmp44NW86REqWka3tkLBaZUG+QgwZPikSCM6s
         0y0w==
X-Forwarded-Encrypted: i=1; AJvYcCVQbOEoGbCwE2idAsOei9DOHW7C+jHDuwJcVihXujteH1iFNQPxYyH68Usy2np+Dr+V+IXXNdBI7cJg+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ8ltRm/VPkwHH4WAQsjZqUu1X/ed1SHotSbd+AWV+WFQ0SnwP
	vfU2K7dO0gKCBK77dx/FKBssAviKjWoNc9ITvpFndm+sOTiQZrWb0sN3EA1M2AjIZAA=
X-Gm-Gg: ASbGncu2SzZcVqSSVUg/Wu/8Og1vO1HY/uGXEzaLVGaz/vaqJpfN+YO+VaNwS1wsvaI
	U86gUuCQXYCyxRqwJf8tmH8H4JJ4KWb3tq3m59BcwnOSZ+KpsnjV/Za96B1LWdsVoYR4r3aADvN
	KgfwWjd1hSTB1V0yE/K0qh2qA0UN0Tasn5lQQVauS4gJnmINe/3sJ/zK9Wl+KpmUpnyyN4z2zLC
	zmOISbrpU9GETXIFOaBxdHcIHTjaXRGoB3E6Py/ovPVBolrrc039QwJeD4PDU+bBOz41KDv4P2W
	E8q5FL0CEbkKm1GyeU9vIfhatd+UtkXgCtCeChFrs9qEgjd0aV0vplsNqP9B86aQ/T3mnSmzsRJ
	giFLwz9o2r9aSb2iDZfeqhzaKZm9D6Q==
X-Google-Smtp-Source: AGHT+IHIIeyvn8QfCduWJd5t2Oh9R8b98qsYEyBICh+DHmIf1GXxPxIHXDfOMOOH72H4d74hXDCEBg==
X-Received: by 2002:a05:6512:3e02:b0:553:2a16:24fd with SMTP id 2adb3069b0e04-554fde59eb1mr653330e87.47.1750844301899;
        Wed, 25 Jun 2025 02:38:21 -0700 (PDT)
Received: from [10.0.1.129] (c-92-32-242-43.bbcust.telenor.se. [92.32.242.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ea6132easm1752798e87.28.2025.06.25.02.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:38:21 -0700 (PDT)
Message-ID: <3c191e21-ce26-4903-8515-3e110560aa66@cryptogams.org>
Date: Wed, 25 Jun 2025 11:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
To: Eric Biggers <ebiggers@kernel.org>
Cc: Zhihang Shao <zhihang.shao.iscas@gmail.com>,
 linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
 herbert@gondor.apana.org.au, paul.walmsley@sifive.com, alex@ghiti.fr,
 zhang.lyra@gmail.com
References: <20250611033150.396172-2-zhihang.shao.iscas@gmail.com>
 <20250624035057.GD7127@sol>
 <48de9a74-58e8-49c2-8d8a-fa9c71bf0092@cryptogams.org>
 <20250625035446.GC8962@sol>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <20250625035446.GC8962@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_103828_471863_ACF3839C 
X-CRM114-Status: GOOD (  24.45  )
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

>>>> +#ifndef	__CHERI_PURE_CAPABILITY__
>>>> +	andi	$tmp0,$inp,7		# $inp % 8
>>>> +	andi	$inp,$inp,-8		# align $inp
>>>> +	slli	$tmp0,$tmp0,3		# byte to bit offset
>>>> +#endif
>>>> +	ld	$in0,0($inp)
>>>> +	ld	$in1,8($inp)
>>>> +#ifndef	__CHERI_PURE_CAPABILITY__
>>>> +	beqz	$tmp0,.Laligned_key
>>>> +
>>>> +	ld	$tmp2,16($inp)
>>>> +	neg	$tmp1,$tmp0		# implicit &63 in sll
>>>> +	srl	$in0,$in0,$tmp0
>>>> +	sll	$tmp3,$in1,$tmp1
>>>> +	srl	$in1,$in1,$tmp0
>>>> +	sll	$tmp2,$tmp2,$tmp1
>>>> +	or	$in0,$in0,$tmp3
>>>> +	or	$in1,$in1,$tmp2
>>>> +
>>>> +.Laligned_key:
>>>
>>> This code is going through a lot of trouble to work on RISC-V CPUs that don't
>>> support efficient misaligned memory accesses.  That includes issuing loads of
>>> memory outside the bounds of the given buffer, which is questionable (even if
>>> it's guaranteed to not cross a page boundary).
>>
>> It's indeed guaranteed to not cross a page *nor* even cache-line boundaries.
>> Hence they can't trigger any externally observed side effects the
>> corresponding unaligned loads won't. What is the concern otherwise? [Do note
>> that the boundaries are not crossed on a boundary-enforcable CHERI platform
>> ;-)]
> 
> With this, we get:
> 
> - More complex code.

My rationale is as follows. It's beneficial to have this code to cover 
the whole spectrum of processor implementations. I for one would even 
say it's important, because penalties on processors that can't handle 
misaligned access efficiently are just too high to ignore. Now, it's 
possible to bypass it with #ifdef-s (as done for CHERI), but to make 
things less confusing, a.k.a. *less* complex, it's preferred to rely on 
the compiler predefines (as done for CHERI). Later compiler versions 
introduced apparently suitable predefines for this, 
__riscv_misaligned_slow/fast/avoid. However, as of the moment of this 
writing the macros in question don't seem to depend on the -mcpu 
parameter. But it's probably reasonable to assume that they will at a 
later point. So the suggestion would be to use these. Does it sound 
reasonable? Or would you insist on a custom macro that would need to be 
set depending on CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS?

> - Slower on CPUs that do support efficient misaligned accesses.

With arguably marginal penalty, as discussed in the previous message. In 
the context one can also view it as a trade-off between a small penalty 
and increased #ifdef spaghetti :-)

> - The buffer underflows and overflows could cause problems with future CPU
>    behavior.  (Did you consider the palette memory extension, for example?)

Pallette memory extension colours fixed-size, hence accordingly aligned, 
blocks. Since the block size is larger than the word load size, any 
aligned load would be safe, because even a single "excess" or "short" 
byte would colour the whole block accordingly.

Just in case to be clear. The argument is about loads. Misaligned stores 
is naturally different matter and it would be inappropriate to handle 
them in the similar manner.

> That being said, if there will continue to be many RISC-V CPUs that don't
> support efficient misaligned accesses, then we effectively need to do this
> anyway.  I hoped that things might be developing along the lines of ARM, where
> eventually misaligned accesses started being supported uniformly.  But perhaps
> RISC-V is still in the process of learning that lesson.

One has to recognize that it can also be a matter of cost. I mean 
imagine you want to license the least expensive IP from SiFive, or have 
very limited space for MCU. Well, Linux, naturally having higher minimum 
requirements, doesn't have to care about these, but it doesn't mean that 
nobody would :-)

>>> The rest of the kernel's RISC-V crypto code, which is based on the vector
>>> extension, just assumes that efficient misaligned memory accesses are supported.
>>
>> Was it tested on real hardware though? I wonder what hardware is out there
>> that supports the vector crypto extensions?
> 
> If I remember correctly, SiFive tested it on their hardware.

Cool! The question was rather "how did it do performance-wise in the 
context of this discussion," but never mind. Thanks! In a way there is a 
contradiction. RISC-V as a concept is about openness to everybody, while 
SiFive is naturally about itself ;-)

Cheers.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

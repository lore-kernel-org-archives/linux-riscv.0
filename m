Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FE9C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSQ5TSGnUt2YZoLT4UhU2G2vTHM1ubHpLNqJJWvfdvo=; b=HWxZBWmw9d4w/D
	np0cuQAQydRvFza1I5WkNPyyZzhf892ij7QjESzx+RHEmus5Ic8v88weU3STb+TgsZkc733RqeqzH
	GkmMU+q3zciy585yIH2ZhiJl7bMlEJZ/PMUcUJMJDueCcwEbYrQdyALRk3eTDKnJFxR00CjxXqVTL
	LNSXDIX9PwH0UK0b1pziw2+8tIqefEk2YKbP+ANnaGepnZlU1r5k4Yis6ZoUS0JVVtVx76y1zrJ6j
	rtXMK3kmYRNGvazAogfu5CCM2Ku8KB+tg6ZQhm+HdNENjy6eS9zXj2H7aaaKetvEcDNdj2a8NG94I
	x+z34kQTKxI2nwUveB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzpD-00000005A5w-3PPJ;
	Tue, 24 Jun 2025 09:20:19 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTziz-000000058yR-1aZD
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 09:13:54 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-553b51f5218so186725e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1750756431; x=1751361231; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VeAtLCIzELtEqAtC7OfqanDtQsJ0MWYyoX2KXzWO0Js=;
        b=WLaIw4m3lm7yUyM7yG1xvIs8cQmPa+gewxgMni9oUS4RTBEcDHL3XsRlWOA0khPDDh
         K5ZmNzwJl9YwXi5AqfHhpKgH86z6maXp3G4Fs30isVVS8ZtcBkbkL5Ze1m3sFPIO9Pv9
         0L6hRFWM6KwQnkBMVy3kh8mprVCkb8CwXgJMj76dwC9TL0MQoeY2vk8xoFdV5JO81bEs
         dEaZhgjCZmopm511olJjkvXg4wcxVzt75836qhgZ1Wni1WH1XoQrRWRJIxaxGXBI7/hu
         C2WV0JUb8e6dWB5V1fvWEMafwqmpnEscBaPqvqSunfbOoK2SE8WEQnRPDnM+y3OpoO8W
         HqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750756431; x=1751361231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VeAtLCIzELtEqAtC7OfqanDtQsJ0MWYyoX2KXzWO0Js=;
        b=PUUeT60VWGswiS5CnWwuRQSHTIMlNoElbwbRYFFbHiXpMcTVW/ScDo/VNhi3FepDmQ
         NnuTQ8kfb2vw1Hq5Lalp2aLykWufdYxQ69QIRbcBa7GGSRScz3+TqpnVzTBty8zk/ojU
         5gZ58bm3cOvUO6TmQkSKNG76GFmsiilQkQhNSp5f+3lrv/jpcHHLZ4GqyTXsJdZJxo6L
         jtOrEfLsY5+9IZGI5VW51MpU398lgJRppPMQkSfngDTv/pkkyWsXoIOsO7M+M9ueULmE
         f4FCGNTvv8gsUL57C31J0TafElJXWlH0q8tIMiYJX688Bs7QBh8DNrmoeiaf98aUhogu
         jQ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnQdb8Rc2NUW0aJKcgMYr4X19Z6c3/IqV3f18x7wz8kPDF8w00oasMMSBdeFuukapWghdDF2ukJf3NhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEtxAjpeF7mg8SrATRo5WHrAQ5jZbTVWCXWNnpJkpWJ6ayxl7+
	C5YX6pyB8UweURvSf6ArspV3y+uSHa+Bd6pEessd/t6CpQag0Mv3qnGzB34QjZiOLDs=
X-Gm-Gg: ASbGncvYA6bgrlxOrY8wd4Ht64YgZ//pBcHYYDAfJgVgfHGqT54NzVgubSe4m1u0pYy
	O07NlQQ2nV/K0+mdbepLJPHBbw6WXFs53BJkuBd+glsbIHqW9irp/S7XqA6qrFZVfDvqRAGF4Sw
	e7TUgFVFYS4o0vv4d37G6COfbgPggxj2bg16fejnjYYfvmGXS95TJ5kQDYB3zW13130ZPdgncCw
	tAZIJkwyW7vHhlvShgheLGIfTNOtnPzOcTjN3RdG/4zDLKXPajUGvUnW/CTH8U7qk5wl6KGf5nv
	cOD/JD1BLbOT8V4OFIMw8sAxD/ndma+W91/cBw/xvovUpBqgnB3UOK6YD7yHM2QGuI9ZwQLmPlV
	h3+jAlH8TbGQICNeaG94udsHZdBqurQ==
X-Google-Smtp-Source: AGHT+IFaH46vGc8vI6X612n64uA9UbCTRBi9D9MK4NxdIERHjnEHGYL4HBCVvwI2kOhbR50is8W1kA==
X-Received: by 2002:a05:6512:4056:10b0:554:f9c5:6b3e with SMTP id 2adb3069b0e04-554f9c56d46mr208217e87.41.1750756430826;
        Tue, 24 Jun 2025 02:13:50 -0700 (PDT)
Received: from [10.0.1.129] (c-92-32-242-43.bbcust.telenor.se. [92.32.242.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bd232sm1729392e87.95.2025.06.24.02.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 02:13:50 -0700 (PDT)
Message-ID: <48de9a74-58e8-49c2-8d8a-fa9c71bf0092@cryptogams.org>
Date: Tue, 24 Jun 2025 11:13:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
To: Eric Biggers <ebiggers@kernel.org>,
 Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
 herbert@gondor.apana.org.au, paul.walmsley@sifive.com, alex@ghiti.fr,
 zhang.lyra@gmail.com
References: <20250611033150.396172-2-zhihang.shao.iscas@gmail.com>
 <20250624035057.GD7127@sol>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <20250624035057.GD7127@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_021353_428081_527C03EB 
X-CRM114-Status: GOOD (  20.27  )
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

>> +.globl	poly1305_init
>> +.type	poly1305_init,\@function
>> +poly1305_init:
>> +#ifdef	__riscv_zicfilp
>> +	lpad	0
>> +#endif
> 
> The 'lpad' instructions aren't present in the upstream CRYPTOGAMS source.

They are.

> If they are necessary, this addition needs to be documented.
> 
> But they appear to be unnecessary.

They are better be there if Control Flow Integrity is on. It's the same 
deal as with endbranch instruction on Intel and hint #34 on ARM. It's 
possible that the kernel never engages CFI for itself, in which case all 
the mentioned instructions are executed as nop-s. But note that here 
they are compiled conditionally, so that if you don't compile the kernel 
with -march=..._zicfilp_..., then they won't be there.

>> +#ifndef	__CHERI_PURE_CAPABILITY__
>> +	andi	$tmp0,$inp,7		# $inp % 8
>> +	andi	$inp,$inp,-8		# align $inp
>> +	slli	$tmp0,$tmp0,3		# byte to bit offset
>> +#endif
>> +	ld	$in0,0($inp)
>> +	ld	$in1,8($inp)
>> +#ifndef	__CHERI_PURE_CAPABILITY__
>> +	beqz	$tmp0,.Laligned_key
>> +
>> +	ld	$tmp2,16($inp)
>> +	neg	$tmp1,$tmp0		# implicit &63 in sll
>> +	srl	$in0,$in0,$tmp0
>> +	sll	$tmp3,$in1,$tmp1
>> +	srl	$in1,$in1,$tmp0
>> +	sll	$tmp2,$tmp2,$tmp1
>> +	or	$in0,$in0,$tmp3
>> +	or	$in1,$in1,$tmp2
>> +
>> +.Laligned_key:
> 
> This code is going through a lot of trouble to work on RISC-V CPUs that don't
> support efficient misaligned memory accesses.  That includes issuing loads of
> memory outside the bounds of the given buffer, which is questionable (even if
> it's guaranteed to not cross a page boundary).

It's indeed guaranteed to not cross a page *nor* even cache-line 
boundaries. Hence they can't trigger any externally observed side 
effects the corresponding unaligned loads won't. What is the concern 
otherwise? [Do note that the boundaries are not crossed on a 
boundary-enforcable CHERI platform ;-)]

> The rest of the kernel's RISC-V crypto code, which is based on the vector
> extension, just assumes that efficient misaligned memory accesses are supported.

Was it tested on real hardware though? I wonder what hardware is out 
there that supports the vector crypto extensions?

> On a related topic, if this patch is accepted, the result will be inconsistent
> optimization of ChaCha vs. Poly1305, which are usually paired:

https://github.com/dot-asm/cryptogams/blob/master/riscv/chacha-riscv.pl

>      (1) ChaCha optimized with the RISC-V vector extension
>      (2) Poly1305 optimized with RISC-V scalar instructions
> 
> Surely a RISC-V vector extension optimized Poly1305 is going to be needed too?

I'm a "test-on-hardware" guy. I've got Spacemit X60, which has a working 
256-bit base vector implementation. I have a "teaser" Chacha vector 
implementation that currently performs *worse* than scalar one, more 
than twice worse. Working on improving it. For reference. One has to 
recognize that cryptographic algorithms customarily have short 
dependencies, which means that performance is dominated by instruction 
latencies. There might or might not be ways to match the scalar 
performance. Or course, even if it turns out to be impossible on this 
processor, it doesn't mean that it won't make sense to keep the vector 
implementation, because other processors might do better. In other 
words, it's coming...

> But with that being the case, will a RISC-V scalar optimized Poly1305 actually
> be worthwhile to add too?  Especially without optimized ChaCha alongside it?

Yes. Because vector implementations are inefficient on short inputs and 
having a compatible scalar fall-back for short inputs is more than 
appropriate. In other words starting with scalar implementations is a 
sensible and perfectly meaningful step.

Cheers.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
